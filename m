Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48760B3F345
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 06:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C0F10E567;
	Tue,  2 Sep 2025 04:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gP/jN5XW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6BF10E567
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 04:04:56 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822SEjf022405
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 04:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=FUbG3HJcyuVo1E28CzJ/QWui
 hMmGUR1E5R08lzHdUPg=; b=gP/jN5XWvMLs2zd9d6V46MgZe3bIzErGTzU4YfNg
 vJHsTcL+yGJEajqipi0uVENLvNkmWpRFlhrXozMkKaJNpHqvV4/mF/OwqAE7pLoB
 af6ZXmmhVzQpNYhBEsy29uATObgagA0RRcsXbcyvE50tZu/bv/cGkAN4Zj36yxNT
 wAXVyg+UKOaO5FovU0mdIl7PrV17/3XrAAZdSvAdfZXG2EmHsc5OG2+iyOG+9Fvg
 PvR2WXTn0sJ56aDlJlygvovjSOrIlT+bmchpGyH0X+K64sGCEvcAUHcKF1rpU7z5
 XfYtRwnUbL1KW7HI13iAeoiAmubF7RcADqggYkHyr8yGxg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp6jy8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 04:04:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70de52d2904so122421236d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 21:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756785895; x=1757390695;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FUbG3HJcyuVo1E28CzJ/QWuihMmGUR1E5R08lzHdUPg=;
 b=tOkoJFfEf8LtNrgcAwOSCbqjCQ9Pqy7syzQ1Zt/AKjQ8nI3y4P/QGQ8WtuP0arpBY1
 8x75t/GdRwMh4gzkCz6wBRRps+BBBJBD3Bv7qotg/V9nsJwbWcF9VPptTzaOpRcRJYGF
 bsvGnaoQ+0DMgjBEskD/wA7BYQ3oH5gkFTn1BXnciV1JdNil1zKo2TBfZF0JuvTI3xhw
 mhwvzJn/siPcqq0Kc8DA1g+vIfEsKpWsjrrHY61+kPe5NCkoR57ow2RujRxOmjAN8J/a
 iLB/4Em/tXINhtTBkJ5aXK07ksZrXxmqgAQOMolK0lHYdkQsjKvt5vjq5YkajKXAiGyz
 5fpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz0pkUdUgzKnU7sCLne4QUkLIb3zhmZuibmsKVwB/n/PWuuczOSoi6xMYyjkVmezF6UvgqPhhdMQQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNGpowJJvv6cGxpxlY2kU4UBnsrmNiFnA2Asnu/tOSNfQNtaWk
 xgP07GKFV5r3wnLTtlJkO6ExCqPJG5PIgyXQYwIDoHpUdEeTvYHjP4A6iIyrNoAMUE755heM7YU
 PlDwvzsHH2bmhyoxmOwqzZD0RAh7wTYk71j5bE4lc7ga68o8NGXkdN/NjxaFp+eEgk3IkY6A=
X-Gm-Gg: ASbGncsPz8f8in4d3DJV0NzcuNpRLMjfs0hMVotbW1Kf46VC2eeeWWC8SfWQU8HYUpT
 THcg/OLHxIuhGpHZzhe5Yj5eD/13YthQHoc30dFWdoB2rpKE7ymD9DbCmWjGuJ6bJfTqPFmbz/k
 pNp7+4Yo6FXy6lrQ79KmHlo3RrSjMbMpw3nLSMX0HIfA1Q88961ForuxE2ce1UDcqMDHTJojB9Y
 VPX9gOodKdJ+YEYaJzdAXig5wkOG51V2uz4expNGbf9dzcr5HbpH1avh50nmceMDgAouThHt7cC
 ctnbfe+WzfQqYpej2kEwrOkwVN1ht030muk/UiVhUMwQM5ZTHEwa/MmUF2pEmAoTkJungq7vPkV
 kOE9JyrMgt35royCv/aG2C8w7HZwv85A75e7EE61x/NpjJkZEWVyS
X-Received: by 2002:ad4:5c63:0:b0:716:856c:4a5 with SMTP id
 6a1803df08f44-716856c0613mr77343996d6.43.1756785894782; 
 Mon, 01 Sep 2025 21:04:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHprcraanQwhdW2zFPLdUXnmfkEq2gAsf7egUurUvHlfjuXEEHMuXLdIs7YBM69Sknlftw1mg==
X-Received: by 2002:ad4:5c63:0:b0:716:856c:4a5 with SMTP id
 6a1803df08f44-716856c0613mr77343796d6.43.1756785894311; 
 Mon, 01 Sep 2025 21:04:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f5032caasm1932141fa.35.2025.09.01.21.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 21:04:52 -0700 (PDT)
Date: Tue, 2 Sep 2025 07:04:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 8/9] arm64: dts: qcom: sm6350: correct DP
 compatibility strings
Message-ID: <abkkn4f7uca6tzjasltyysxecuuirxxvbjz6l6re5v4z6jlmuh@ugz6jtw6vo4n>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
 <20250829-dp_mst_bindings-v7-8-2b268a43917b@oss.qualcomm.com>
 <20250901-defiant-illegal-marmot-7ce0db@kuoka>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250901-defiant-illegal-marmot-7ce0db@kuoka>
X-Proofpoint-GUID: B3Rh3NLHZ3hLP4poaRNAyG6D0m-n_cgz
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b66ce7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=lkS1JMb0PDcYJWSia6EA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: B3Rh3NLHZ3hLP4poaRNAyG6D0m-n_cgz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX7m2Pt+ePaLK9
 j/sYJ8ilIr/H4ghj9vV+w7iX3RmMEZQGopgE/J4fnClPxmGyDGWyE2Mlpwm6gK/soAG0Ot89OJl
 9GPCYhjBsfpp2L8d4/zhJKswxw2QLz04WmD2Ll4OglvxvlbasczmEmFRVigl3vUEToprWbMUmTu
 x/KMNUJjvRc3AVSUDXpoXKewAmTL4Ax2bTmDzxiknha6ksoCyz4m+Fv9UZVzq590WYoIUNalRhA
 NQWzH9cgUS9mf1vaLjZCh+gqbnvpUYu4QNCUpxYP9C3IGqLMp4phaSwysnCmrLlpdx+yYOuSV4u
 YyFJQHQEJAwAz9aGeaDSAJ0muuYrMlXdkagP7Z4CPZ626Fr8MK1X3QmgPJ5/rdfQBbkwY6S1BZg
 uHJRNYuC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 01, 2025 at 05:47:04AM +0200, Krzysztof Kozlowski wrote:
> On Fri, Aug 29, 2025 at 01:48:21AM +0300, Dmitry Baryshkov wrote:
> > SM6350 doesn't have MST support, as such in DT schema it has been
> > switched to use SC7180 as a fallback compatible. Make DT file implement
> 
> That's insufficient. You basically claim to do it only because bindings
> change. Bindings were changed only because devices differ, so that's
> your true explanation here as well.
> 
> > this change.
> > 
> > Fixes: 62f87a3cac4e ("arm64: dts: qcom: sm6350: Add DisplayPort controller")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> > index 2493b9611dcb675f4c33794ecc0ee9e8823e24d4..8459b27cacc72a4827a2e289e669163ad6250059 100644
> > --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> > @@ -2249,7 +2249,7 @@ opp-560000000 {
> >  			};
> >  
> >  			mdss_dp: displayport-controller@ae90000 {
> > -				compatible = "qcom,sm6350-dp", "qcom,sm8350-dp";
> > +				compatible = "qcom,sm6350-dp", "qcom,sc7180-dp";
> 
> No, that's breaking all the users.

WHy though? Both old and new lines are using fallbacks to bind the
driver to the device.

-- 
With best wishes
Dmitry

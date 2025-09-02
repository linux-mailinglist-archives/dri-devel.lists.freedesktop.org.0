Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 333A4B3FB18
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFEED10E644;
	Tue,  2 Sep 2025 09:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="df44LpFW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F9C10E1C5
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:49:02 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822XJ7c031628
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 09:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ef0edgZ/9neE8uhkiRDCZwng
 z4JTifOPA35MBTbIahA=; b=df44LpFWVR9fhHJ3FYUk3VZt9dD565gwO6w1Z10M
 GT/4EpKZfqfGDw+OssvwXIkml8BcKYZyikE3SMc6MKbhyrPHt6a5+e4Hp4dHcIjk
 e16YpjM0zcW7dztmy7qn3FRPq/aZdb3hSFXQqsEG5TyDdNn/1snsMGq9Y126lL/E
 3MXgqj5B53IfeE55sklNjY590QFtVb8mwJr2cVr0HcDxkhwxWWmePKGcvpdn/dvR
 Dbgu+oFWKD5kVLZ2DiwYK0HgMV4WD0YNyIaoiaiZ0pxCsucbIxKYxHvymUKbsNSz
 E5ETn3eaY5YNEizL1m9Tu/eqB6364D+vljm/vUo3+4vOmA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48wqvw9320-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 09:49:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b30d6ed3a4so20027581cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 02:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756806540; x=1757411340;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ef0edgZ/9neE8uhkiRDCZwngz4JTifOPA35MBTbIahA=;
 b=DKglVj5kx8ySxih8+ueawyaMjESpVpLmBiJj53my08Wj336VlRd10mk9AtRlHcQUXm
 y3O60p9fxozYDUQfFI8lcx8xRLCCakMqpZsuKtLZ8O0k5jNFFXtDJCOCka9EEHQ+ta2k
 MWCjiEnsBkCD1bgY3p21p2E2WDACG4egCPh2Dt4prf0VhcR/BkvbiuPjfQ9FO+76XQmm
 epNJQ4W8lFZ90k4yChy24f26ZPLEyp0lXixNKuYAi5M73iHVc9qaWJdYnfGtxjX0JCnp
 y3DUfYW78FtuzhxwPBj9cRNbU3jaI4NlvDcMbr9CEjjTNeaQASWe+I2AX3Bjn5lRF1+b
 5E9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+udXHZq2uR+W+ug3uLjEZnL07MvGz86kPeitbJLNckIMd3hYNUZ7+8AApnYcaV+sKxrKU9aocc50=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyi/WMwvEPIHQ49ukTbmKdwDIpP1PMUeULoIKT65XGtI+HM4ssM
 Jz1+mpRl1qdZoWTQyc/FpDp/hcJ1B02qkN8u9BHxU8JvU75MBZHDmzZpVFatwLIXR0F/glr1ill
 6tTAx6p8JYvkhUq+zEZtDiSrIqX+MRgAdyPai0U8+ZNtVE4ZCfYc96zUB9VUR4fVleGyFM4Y=
X-Gm-Gg: ASbGnct1IBFwYci/kXL01oLozCRTbyESb8+neR6W+MRSD3UP/YpL+UQ7WTD3g1nX4aH
 iwD1Dx6FFF/IEkpyi/8mICUw+gAi5tJdIdVLGFjEKdQnwpiSQPxchic9MyhgshBnKr6+U5zmDCg
 yKxi0zNA0tCKa/Nud3LJ8dJl1mWNFOJCYuKC6+OdLJ5qcklolWMaPP+VENS+5AtQzV2UcxnChnQ
 AE4tH+Z7sAnKkqgxZ8/WEeFi+skx1ey9IOrwfp5QgAkJfCRQt704ktnq3pLVWj/WrTFSbNAfQdL
 WCOZQVROGWQWqf4a2z6q60wV5TjWLO8cfLjvgGUoQSjvGqhJxQRd89Dse4dJ0TLoLOy5vy7Yrsm
 R3fFP6CDsc5udG2NQi43Ru1ve6hk6LdFvHflZiivaF+8IvqdkZVI2
X-Received: by 2002:ac8:5f4c:0:b0:4b3:1c48:e9ea with SMTP id
 d75a77b69052e-4b31d8445e4mr81606591cf.5.1756806540179; 
 Tue, 02 Sep 2025 02:49:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZKU4HE2HJogDoRI/mFySjKfrG/0weGrNzkeug/yUx/r/706E/wXqTZfTWe6WraRHbzYq5gg==
X-Received: by 2002:ac8:5f4c:0:b0:4b3:1c48:e9ea with SMTP id
 d75a77b69052e-4b31d8445e4mr81606321cf.5.1756806539674; 
 Tue, 02 Sep 2025 02:48:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f5075c85sm3350441fa.50.2025.09.02.02.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 02:48:58 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:48:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/6] dt-bindings: display/msm: dp-controller:
 document QCS8300 compatible
Message-ID: <tvdbil5fhgntj6wx235ihum6dxy673ekdlpmv2qath5r2o7f3l@jynol3ns7uxb>
References: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
 <20250901-qcs8300_mdss-v10-2-87cab7e48479@oss.qualcomm.com>
 <20250902-speedy-overjoyed-dove-edf2ee@kuoka>
 <fe2867dd-50a6-42d8-92b0-0e29fa7691ee@kernel.org>
 <e59fca7a-4145-4aab-80a5-8305f935e8d4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e59fca7a-4145-4aab-80a5-8305f935e8d4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDAyNCBTYWx0ZWRfXzoH2Z15nHck4
 pNUEj27fcyWvf057TdVLc1oCgU7gi8aLuGNtIi4Y420iWv/THrrVp2NLqmhRFxqL5i7hwOZVk+F
 8uDFHuxyQyE4htUWqVBLsOeTHOXRP/YcsUywLH+nnIuciHCpCoWyYcGjnpLCG70YwlRBfN9K5gD
 vZq7hPxXJDSzLdI9A0AA2NCbJhj0kAQSBXgwtWIzVBwioeQ1AwxZgRSwQ7pJlI99SB3WUoPN/Dr
 CYWqn2Vu5c1T0datCoAKNeRScXV8cZJYvac6TURGPfI7sfeNHuF9UTsPbQl9gsNq/RxIl2LNgaV
 sGgVCRa6oTli2uVhmcnUExk0dTab8Vw0pxaBWI21oTo9R3RA7yEjac/39BIR9wceGjKQqSgc7Ag
 bYXFIQoC
X-Authority-Analysis: v=2.4 cv=WKh/XmsR c=1 sm=1 tr=0 ts=68b6bd8d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lf_M6NTgIIccHnlT_YMA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: WFVSQM5strgHysiflk3dbqW5nTJJVX5b
X-Proofpoint-ORIG-GUID: WFVSQM5strgHysiflk3dbqW5nTJJVX5b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020024
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

On Tue, Sep 02, 2025 at 03:42:55PM +0800, Yongxing Mou wrote:
> 
> 
> On 9/2/2025 2:41 PM, Krzysztof Kozlowski wrote:
> > On 02/09/2025 08:38, Krzysztof Kozlowski wrote:
> > > On Mon, Sep 01, 2025 at 05:57:30PM +0800, Yongxing Mou wrote:
> > > > +  - if:
> > > > +      properties:
> > > > +        compatible:
> > > > +          contains:
> > > > +            enum:
> > > > +              # QCS8300 only has one DP controller that supports 4
> > > > +              # streams MST.
> > > > +              - qcom,qcs8300-dp
> > > > +    then:
> > > > +      properties:
> > > > +        reg:
> > > > +          minItems: 9
> > > > +          maxItems: 9
> > > > +        clocks:
> > > > +          minItems: 8
> > > > +          maxItems: 8
> > > 
> > > Clocks have only five items, reg has 5. At least in my next from few
> > > days ago.
> > > 
> > > Nothing explains any patchset dependencies, so this makes reviewing more
> > > difficult than it should be.
> > OK, I found the dependency in cover letter (I was looking at wrong cover
> > letter), but the dependency does not have relevant clock changes, so
> > this is still wrong.
> > 
> Hi, https://lore.kernel.org/all/20250829-dp_mst_bindings-v7-7-2b268a43917b@oss.qualcomm.com/
> dp-controller.yaml descriptions for regs and clks have been added. Compare
> with SA8775P, QCS8300 don't have DP1 controller which supports 2 streams
> MST, so its minItems and maxItems clocks is 8. > I suggest to slow down with
> this patchset. It's v10 already with
> > simultaneous other changes and two (!!!) dependencies.
> > Sorry for that, will wait until the dependencies become stable before
> updating the patch.> I don't know how I am supposed to review this.

Please fix you email client. This is garbled. It mixes your text and
Krzysztof's on the same line.

> > 
> > Best regards,
> > Krzysztof
> 

-- 
With best wishes
Dmitry

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCB9BEE3F5
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 13:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E1110E02C;
	Sun, 19 Oct 2025 11:52:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZG6XlRve";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C165A10E02C
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 11:52:56 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JBW2W2024371
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 11:52:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=TN7+hMpDo5h/8U2Db7n/Ndrm
 G2ZsOSEUMs79Cs5uzu0=; b=ZG6XlRve7QWzDRwvZRk40ibakpaPla2Tq9keXomE
 hVETZk2RE2Nl7pXWDKz1+4ZwjmenUDh0h6EtOA6JfYP/lR84itPZwh9NeFycO+Eh
 Fp4vwiK+PZjNlguvBxrr4CFHXHBvDfg45enp2RG/qI2sUIfHfX9T9e0KuXao3D1U
 lPu9SrnsZXkjoTcZtX5OB/GbF0Axa6cAiOdJddtS9EGFvf20k7l3bjhVdPJFknCV
 mERaatKCy8x35whZu4M1BGP7wD8m0ZSZETNFIeMGvtZRey/5D7TnTLgiYOjeIyZI
 ZMJ1+TkZNLVf6FXKNZXcmYGrLCwdNaVBUV/80Mm0JOczIg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pak0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 11:52:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-79e48b76f68so172670796d6.3
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 04:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760874775; x=1761479575;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TN7+hMpDo5h/8U2Db7n/NdrmG2ZsOSEUMs79Cs5uzu0=;
 b=fxe1LyILLeYLfF1WfVet6VslU8+O3MdUxqecxqS3jXzZd62YYOigqQ6DjFUHmjv3/2
 oYP33BL8iR+7v3HeP5ETNWEF/ue8b/hFNTPItdJjFmmGgSvnL/FF0POTKhG67ajwLVeP
 NUTB25YM4K33LYJx1LIL8mrrf2BfGSnolHIuydPyVIVbTS6eNwjoT6XqraexfIQmAVjh
 FSpFPYE+AZg8KnV8tFwW5p3J0lidE/l/tD9EHkEO+0l1oOocQPlVosuS3g/nerBDBWZS
 cMPd8CNuAj9oYJ4WOFysxA7yHmYImpRpC4GBURSFIDzrYPOqJbbX0b5Y1vezlJeOWa2z
 jkgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiSN6wPBEQhbrffKWWOi6NP6wDfrwGNWRq8LXjhPfiFMrvjK7Eiv09Ru/4sBiw/oLvQHp+N+vbWxw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDPbFTaDxcbiGQNqW8f4nG8F8dmKQ3WA5QB+NJx9UcDIwP11hc
 F1u8pYba3v/SPjKCib1MRvYVkVtChCGQf5K2J0IbEdXwlogR7xhPtWy0mM4N5mkMTk/R/qCeSb2
 Kqd6T1UZ8ngmqlpZg648dxrEvjetfaODFcOHe771D9EH2Ax9i3sBBQ1oQ6KuU1r3fUOQVlVU=
X-Gm-Gg: ASbGncutGPw2marj+t26XKjVT2Lb9qoHu0KeHU9+xdfJaLbcNjLX1COB+OP/U8qXHS+
 vXD+uswQrFPjtVWYL8UiL5jsqTmBwgC9c0txuPhzG++oe/nj/KMNeFgIB2et/ydX2UWC3hKGd2s
 c1DIr1y7GJasvc/xKvNIfYX/nK1CJ+GTlbN9a8Btv3xCPryeDfS5GN6jJvR8K4MAzKo7v4Rl39E
 rIX5vK51Z9GCSj0v48GsfepsQh16yQzayvNdIk/HHeI2zoqQdoKJSLMHmfyx3IAIjXhPdKa2oU/
 gVcvSYKRbEc7qU38IqJMaq5vhS3isC4iNU8ubw1Z18knYBpeP9DuMd93MFI+WssKLX/hih6qjZe
 501virURO0MeHoQfg+w3RVoEKvF3DLs6zuprwVU7qT0oaWx0yvuPDJ9TVMOB0ve7tyu0jUcSWg4
 dqjlIQ0EhC+UU=
X-Received: by 2002:a05:622a:1812:b0:4e8:9402:a809 with SMTP id
 d75a77b69052e-4e89d263d69mr120018861cf.31.1760874774992; 
 Sun, 19 Oct 2025 04:52:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPcnFN62n4rxi/er56tz0GO9JJVb5HUURvhr8kT25MVhi+bHd5RuXDHCFN4GVJs/pYXza+tQ==
X-Received: by 2002:a05:622a:1812:b0:4e8:9402:a809 with SMTP id
 d75a77b69052e-4e89d263d69mr120018661cf.31.1760874774327; 
 Sun, 19 Oct 2025 04:52:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-591def28beasm1501207e87.114.2025.10.19.04.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Oct 2025 04:52:53 -0700 (PDT)
Date: Sun, 19 Oct 2025 14:52:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
 marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
 abel.vesa@linaro.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
 jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
 sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
 alex.vinarskis@gmail.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com, quic_riteshk@quicnic.com,
 quic_amitsi@quicnic.com
Subject: Re: [PATCH 3/4] arm64: dts: qcom: lemans-ride: Enable dispcc1
Message-ID: <mxim7iweydzzhetqlao54hrd4ntufdhwdsbaunblyhlovdv25z@gct5iydvzbzu>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-4-quic_mkuntuma@quicinc.com>
 <v4b35cmwbkoosdgs3d6ftml4yvdkyh27q65ssqojplb7uyniwp@wuxbeof7cikr>
 <869d1f94-9d66-4045-abdb-6e88d504a884@oss.qualcomm.com>
 <62nvkgq4f5hoew4lbvszizplkm67t67dbpskej3ha6m55jnblx@vajuvual7lng>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62nvkgq4f5hoew4lbvszizplkm67t67dbpskej3ha6m55jnblx@vajuvual7lng>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfXzCTavSGJznho
 6X/yA0nNJQ2d4s0Q8bxG1AWIAjcARUXNKG8yF21Nb8VR7GRVE6ymEN3uNLr/YRfXrebPWNzqwgi
 Eav3PR7S/WSzqvd2Iz1tmWRo9ZMJXK5zC5lXjp6nTlGJ31jCu+mUkJGRzFfuYop6A/auCcu6eGg
 N5kdsSY7rhoq5XQarz0dvUymDyuliyEVHVZ88bRP9fdmVhYuDtqMZPZJOWiQ2PirAiuWt9Mu+BA
 +0IpQPjgZfLy6CT7cVBs3oE/vtIrYodfzk/YkRomhg1DbTq7fnH9vv2BKCx9SAaIf0G69/0h0fg
 eEVqyYScao/+N6gAQUQL8hIrCbY5IzbwiHK14iVoznSOpZ0VJt9pgmaBneda57PtlRWmgJgDYj0
 z3cDZtGZuneFkBXWyCdjOpT4TGPepw==
X-Proofpoint-GUID: UaxZlMznmQ9rlWIM_JZ9OKW-fi6rAlQx
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f4d117 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=vRBcCzbY8zNoOr-dCfEA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: UaxZlMznmQ9rlWIM_JZ9OKW-fi6rAlQx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000
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

On Fri, Oct 17, 2025 at 03:54:09PM -0700, Bjorn Andersson wrote:
> On Wed, Oct 01, 2025 at 11:43:44AM +0200, Konrad Dybcio wrote:
> > On 9/26/25 3:53 PM, Dmitry Baryshkov wrote:
> > > On Fri, Sep 26, 2025 at 02:29:55PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> > >> This change enables display1 clock controller.
> > >>
> > >> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> > >> ---
> > >>  arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++++
> > >>  1 file changed, 4 insertions(+)
> > >>
> > >> diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> > >> index c69aa2f41ce2..d4436bc473ba 100644
> > >> --- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> > >> +++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> > >> @@ -436,6 +436,10 @@ vreg_l8e: ldo8 {
> > >>  	};
> > >>  };
> > >>  
> > >> +&dispcc1 {
> > >> +	status = "okay";
> > > 
> > > I think this one should be enabled by default. Unless Konrad or Bjorn
> > > disagrees, please fix lemans.dtsi.
> > 
> > Of course there is no reason for clock controllers to be disabled
> > 
> 
> On SC8280XP we have the same setup (two MDSS), there the clock
> controller was left disabled because not all SKUs had that IP-block
> accessible.

Do you mean some auto platforms or something else?

> 
> Whether this is the case of not for Lemans I don't know, if it is then
> the commit message should have stated that.
> 
> Regards,
> Bjorn
> 
> > Konrad

-- 
With best wishes
Dmitry

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4439EC0010E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 11:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53EC10E0AA;
	Thu, 23 Oct 2025 09:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="P6J0NOkt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99AD10E02F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 09:02:49 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N84wfq021340
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 09:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=MalpcSnxYq9dA6R/9QMOFRvU
 abPhDrPSEV9lSVwC0ds=; b=P6J0NOkt6oOMbuj3eWr+66ziwPdaAZFJTRqHlbcb
 A2HmFa6tftnFXZg8ExvCzOspfY2NMEQpXW+q6Jm7f20z8smaax/oPCxFb5N54I/G
 rDKco55nNrd3COa6DqyEOw0ucsQIlbDQ2YFkzs6cK0TlMCdbw4AkEYepsC/Z202z
 ym7QPUej18Cc39bfsXFOz6g7oQuQjHvbXSNy7enzO4+K4pAOAs/ZmisG/elhYwyo
 hF5OECymbrXEC0APwLfiPwbT5p3/wmybp/SOsIOP9BMeaHvIcO0EngoC4UjsUNUV
 5vYvgB0B7OQ8EHTAuDAZKBLR4t+SjaOPYeIMXWekBXB0VQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qhq0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 09:02:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7a26c0c057eso608689b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 02:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761210168; x=1761814968;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MalpcSnxYq9dA6R/9QMOFRvUabPhDrPSEV9lSVwC0ds=;
 b=Oosp+mlk9rCBJdrVYE5eZjPOt/s+wQvg6ASzHj2ptKjgiecgtmt9a6QnULeCuYRQ1b
 VmiaStYZ+dXQK7fqImuPzNHwZvG9UA7i7pG+7a5bHKvQRRFf/4gFJBikuxbw1L60VPiK
 cLp/niZvEvAfPz1N2i3ojY7/xumNgIhHd6UczF+9Gfxyna3y5M+EGbcXsHis5iX9Ty2+
 r0K+D3tavkqla8SaU2+mdpNQJSEKzOgKPcMKAMyh71jmnzYEa8vekxuE1P/QE4MsrxA7
 eYEGIhLpO1NXFwiLVgGgCym6AbbtHjwHDfcmtbFJsgTSuBSq5A/F3TFzDGJMnoYN/R7d
 4TUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkkzxhp9BrRzbHPhcAzjY3YkPa+g8eFujF6VINtaB5xzMaQZf0T2/aDkJzOV/33AI1Zimq/8tzasE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbkZiqnuYTQjozZBwLR4Crbk1yX0panxYCNLVSNByc1DLIdOcG
 D+lAILdbDg6QpgeZg0++VowFTFQsWVSU1/xjOn4s5dHUYw6nb2sgCtgW4UB9xU0Dqi4PrYx6oMv
 gpxjwz7BQwT7NfPS+z4WIKe0rucRwoRAZfceDU2MqOfPxnzwI+XyvsnnFnF21LpqzNE7rgbk=
X-Gm-Gg: ASbGncu8moRIAlXVZv5qQhmIFZgCaZzoOsAXtmsPkCjKbnQChpoDBNa+BU+DCl8Fb1W
 Eoqe3jWGUvKdzmP2EnmQCDsn4LN4EW2ohE7UjS02Wfsbqpur6RK9wOljTvjJ526QPTPeBL2wdev
 mmhBDQkGx7zW5Ig4+RNtCrjIMTzqym72J5408OCj4wHwkOtVf7Hx2jePT2g9ZqH3Irwq7qXU3v8
 CyB/mE7OJlsRfKVC6jJAoUApTHwtubPjNCxamEFmjqK4DiS0sLMHS9xPFfa2fbJpRmAEAlZ6XVV
 bBCUsBujYockGuH85kElAPAWWoALN34t2WbLSnLqZKTJ/jN+kao98+kPmGSpkzGPvAmfwwKqlCz
 BShoCxuNg2BaWz+dbT3wHJG/xI992oMoCQUB/8ki7ZOy6McIimzpfog==
X-Received: by 2002:a05:6a20:6a0e:b0:251:43f5:cad4 with SMTP id
 adf61e73a8af0-334a8523f0fmr34082095637.10.1761210168349; 
 Thu, 23 Oct 2025 02:02:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDRzsK8hhHTbHS88g7R6gWrzYmoBOYsl4eyr6xderBPGGwFWTjTdHzLDoKqJbYcV5t7wEgyw==
X-Received: by 2002:a05:6a20:6a0e:b0:251:43f5:cad4 with SMTP id
 adf61e73a8af0-334a8523f0fmr34082037637.10.1761210167794; 
 Thu, 23 Oct 2025 02:02:47 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33fb0196831sm1722206a91.20.2025.10.23.02.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 02:02:47 -0700 (PDT)
Date: Thu, 23 Oct 2025 17:02:35 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 08/12] arm64: defconfig: Enable NT37801 DSI panel driver
Message-ID: <aPnvKxiv2I/XeI4K@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
 <207f25e9-3685-4838-a384-e6bfe6f8c244@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <207f25e9-3685-4838-a384-e6bfe6f8c244@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfX1ldKnyRfP96L
 xeR4fE4nTe25XBwKHDEfqPRw2cKK6Y2ba9+vJiinm+U14AhXsXy0dWd0sMHXTAEP8eCmYaVughg
 GJccKuBBfZKQWUgtzv7TLFHaAAR4hs3Qpwy9bpx3sM0vGgFCLbZtI5fQoUE6tD8Z22LP8goy97r
 /3B37LB6/l4JHn5TqAfdaSg+OwmE+dALE9GDdyChRrwoKw9KwYIKlFIbSo0g7/ewwGcmFNCEAH0
 1Ch7otxFcPgOA9T4GVcB6i42EN0OLnSWhhZ5G4DAaQ+vWTSFNIn7INGDWBOou+bpECOl9J5tvpy
 oMo3ZOmJ3aP+VObAOpI5M+XXF5OIUjwxNgqPlYJTh3IRdVeGTbVUt//spE7RvAjZc1dQCps/NJm
 JqbF5DLN9Uz0CS8c+keqi/wjBei9ng==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68f9ef39 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-XBAuW2u0JZaUNqFeVsA:9 a=CjuIK1q_8ugA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 1iLf-Ei65IH6UYw9x_oCGlFhDH7eivzA
X-Proofpoint-ORIG-GUID: 1iLf-Ei65IH6UYw9x_oCGlFhDH7eivzA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168
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

On Thu, Oct 23, 2025 at 10:22:36AM +0200, Konrad Dybcio wrote:
> On 10/23/25 10:06 AM, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Build the NT37801 DSI panel driver as module.
> 
> Yes, we can see that's what happens in the diff below.
> 
> You failed to state the "why"

 Novatek NT37801 panel is used on Qualcomm Kaanapali-mtp and SM8750-mtp board.
  
 I will give this reason in split panel patch.

Thanks,
Yuanjie



> Konrad
> 
> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index 8cfb5000fa8e..537a065db11c 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -945,6 +945,7 @@ CONFIG_DRM_PANEL_SITRONIX_ST7703=m
> >  CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
> >  CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
> >  CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
> > +CONFIG_DRM_PANEL_NOVATEK_NT37801=m
> >  CONFIG_DRM_DISPLAY_CONNECTOR=m
> >  CONFIG_DRM_FSL_LDB=m
> >  CONFIG_DRM_ITE_IT6263=m

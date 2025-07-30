Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85522B16105
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 15:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFDCC10E690;
	Wed, 30 Jul 2025 13:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCRsIt/u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C343B10E69F
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 13:08:12 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCb9W6029220
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 13:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=rCoCba3PaUuakN2dddfrr36z
 ZpUe2mMvVXboTEOCYoE=; b=FCRsIt/uDiAJa5REs5cKwMn7O0aF9XVlsTRTnpWG
 BpY6aAHc1kYOI9RLjM5cUn1Jk0cUj0rBH+tkINWMZfcSbRcCjuWRG/O1cUTK+86a
 1gMqfJo9mJWrfwS2UoBjsvAX6XvLGTW9wHXClWeb5d6Pmu3mMuWuIuB3436cAEeh
 QpGb2A2kH0Mu24U3jVuNJm7YwlN4ijxfWHJrnLTfOR2iFMoCYAtvyWHFnEQamMcb
 7WjXnK3fzagFO7XMgCK1397GX31vpWJYDv4TRpBf/8SyQAQX3oRYbyzVIN0R/R33
 fUgfCC3pxGczAfZ0r/YDyiaUwgUPNvHVdd7M/b/rXBkWvQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mcrc0mc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 13:08:11 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-615b153aa54so1040261eaf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 06:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753880891; x=1754485691;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rCoCba3PaUuakN2dddfrr36zZpUe2mMvVXboTEOCYoE=;
 b=AqaXPEhvkZaoDscTUO7vk1QnPA2Kef1gmtqnmXLNVrFUIXFXBnHrYdXR2OpahzlRl+
 OoFPthyz6SYVr6Ljje05YYaf/oZqmFzwzS4sZkIn9b2L3LLc2EI3rvOMgxI5y4AY9NCR
 c8mx6Jx02doDiuIwEKvdmNqW9wVJIt49a4NKI0ptifgpBbdqgPJkis30yXzLsH/A6oPm
 dNggKNFSFjx5n48DW1V2C0hOZqTQYklOS2bZjzlRVs8CAAzYl+c4prMzm8sn0cG6/IH7
 XwcvGxx82E8/ubL1YrZ8qZ8ZeUiw8w/aA5x/7uvFDsZApuIxpPFQ2j023tRB4LkFgBMk
 PHgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMQLiY4KzyZuxXDBfQbevtPvocYdwgulLfUOpbP/eDPtZXDT06rnCLkhEMLC/8wJJIU4ckW+ApV5I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvfF+p0LIMXgmdVF+58fWkKGVfJbeyzS7PlBRxY36+yhR+bTNM
 a/j5OyIfVjT6955HxuPsG3lvcRpFp4IwOEKJjP1AIWffDbZPHLJAFMeoXPFa24usuPfTUlHYvnR
 Hr7jaRgwDRvwu793pVmC+7Dds3y1vXgLz28ka1CRszmLyeYVqBfyWnuMDtPhgWeb+Vgr64qc=
X-Gm-Gg: ASbGncvNYIaO+HzZGZq4LI9yXKhrSMXc+Fh/WqBVhT+KII7iLX95c/psT6OaWSwBHUY
 WZMoWlm/op2vSxesSnAjRc+8nBZmzYQ9fF5XPmu/7N5QBQInZGxbdX5vMYovy9+YnLyU+63r/SY
 WFs0aTUnuw3vTudIwzcwriaXThHMIE2Yi97LyefXmq2oRGplRmioQR8YFsPEEXFWyl0JvKOF9/d
 Q+XNNEf+SoGkRiesz0Th6c7I0WRQ3Jud6fj0FGzVFtwhaOBqHurC7Pb9dD8UMMjBq6Zl5YfogFH
 wsmG/v6h41YPVfSH/zsInrzuHGieysMDIK44UIfdQ9NBx8ECf+Tk5FUTt52LAbNqfbAfTVptYTm
 2uI4LedN7y4aaSja9R5a0g6nUILA5Wr5W5B+/7G4zl0ryUb3wOXZL
X-Received: by 2002:a05:6808:509e:b0:40d:75bd:69d1 with SMTP id
 5614622812f47-431994bf2b8mr2318497b6e.7.1753880890764; 
 Wed, 30 Jul 2025 06:08:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEreN+EZPMsIb55Cu4XOPM4kHBtS5bQnw9CIRJxKiJf+cZor2FwqzapYkfyd+2FT5moObUVmA==
X-Received: by 2002:a05:6808:509e:b0:40d:75bd:69d1 with SMTP id
 5614622812f47-431994bf2b8mr2318193b6e.7.1753880887445; 
 Wed, 30 Jul 2025 06:08:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b79c32a10sm497780e87.106.2025.07.30.06.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 06:08:05 -0700 (PDT)
Date: Wed, 30 Jul 2025 16:08:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, lumag@kernel.org,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH] drm/msm: update the high bitfield of certain DSI registers
Message-ID: <nxayk52mhisyipdsbf5rykuynpg45mk5y5ykqxh76vzyxb6exy@h3qwqdgviumb>
References: <20250730123938.1038640-1-quic_amakhija@quicinc.com>
 <74e3836e-af29-4b5f-b644-23bdff084c78@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74e3836e-af29-4b5f-b644-23bdff084c78@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA5NCBTYWx0ZWRfX9hWANvqlYeAa
 bcEdOUkJbF7pQKpyGf4KB8izMA4Pstbc448war0PjA9jxW5gcqe9Wn2NAJVsxJn2DVILkUtJ3Pl
 DYeknrNumRUNeYi0sOa2GpF7qFt1nQw+wUAdvmh+28TzarqSL57MeQEGjEYpTEC5HRLig5yN1kX
 YPNIs6G0zJDQKVoU6CG54SLWLcdalgeJf0RQadyeZkSES2aOeBQSum0BHPNKFf3hN9BU/WMOOKZ
 /WTLjej5NvxFLAzGxv1/hlM8D1tFYGr9WxlUY8tXLJCIBQCSYW0BL83Zbyc6Od1yDQ0oAh/JK/E
 aFq3qhz5lLF5z5oE6c5kkfSKjMQ7pzeFqMWLGLa1J08pVwWDdPOza01BC+muRHeiLpS5HnreTIA
 /7VJ5NO345oMGT+oVQmdb0oDcopzgM3lskMGjrqRTwLxjdsatRuTtWON4sXIC8qBUV/diu3+
X-Authority-Analysis: v=2.4 cv=Hth2G1TS c=1 sm=1 tr=0 ts=688a193b cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8 a=-gjihLczPamKDhiB-eEA:9
 a=CjuIK1q_8ugA:10 a=-UhsvdU3ccFDOXFxFb4l:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ktxXnwEEVhXudumg9fD9uIGbS9YlzxkQ
X-Proofpoint-ORIG-GUID: ktxXnwEEVhXudumg9fD9uIGbS9YlzxkQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=986 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300094
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

On Wed, Jul 30, 2025 at 02:45:13PM +0200, Konrad Dybcio wrote:
> On 7/30/25 2:39 PM, Ayushi Makhija wrote:
> > Currently, the high bitfield of certain DSI registers
> > do not align with the configuration of the SWI registers
> > description. This can lead to wrong programming these DSI
> > registers, for example for 4k resloution where H_TOTAL is
> > taking 13 bits but software is programming only 12 bits
> > because of the incorrect bitmask for H_TOTAL bitfeild,
> > this is causing DSI FIFO errors. To resolve this issue,
> > increase the high bitfield of the DSI registers from 12 bits
> > to 16 bits in dsi.xml to match the SWI register configuration.
> > 
> > Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/registers/display/dsi.xml | 28 +++++++++----------
> >  1 file changed, 14 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/registers/display/dsi.xml b/drivers/gpu/drm/msm/registers/display/dsi.xml
> > index 501ffc585a9f..c7a7b633d747 100644
> > --- a/drivers/gpu/drm/msm/registers/display/dsi.xml
> > +++ b/drivers/gpu/drm/msm/registers/display/dsi.xml
> > @@ -159,28 +159,28 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
> >  		<bitfield name="RGB_SWAP" low="12" high="14" type="dsi_rgb_swap"/>
> >  	</reg32>
> >  	<reg32 offset="0x00020" name="ACTIVE_H">
> > -		<bitfield name="START" low="0" high="11" type="uint"/>
> > -		<bitfield name="END" low="16" high="27" type="uint"/>
> > +		<bitfield name="START" low="0" high="15" type="uint"/>
> > +		<bitfield name="END" low="16" high="31" type="uint"/>
> >  	</reg32>
> >  	<reg32 offset="0x00024" name="ACTIVE_V">
> > -		<bitfield name="START" low="0" high="11" type="uint"/>
> > -		<bitfield name="END" low="16" high="27" type="uint"/>
> > +		<bitfield name="START" low="0" high="15" type="uint"/>
> > +		<bitfield name="END" low="16" high="31" type="uint"/>
> >  	</reg32>
> >  	<reg32 offset="0x00028" name="TOTAL">
> > -		<bitfield name="H_TOTAL" low="0" high="11" type="uint"/>
> > -		<bitfield name="V_TOTAL" low="16" high="27" type="uint"/>
> > +		<bitfield name="H_TOTAL" low="0" high="15" type="uint"/>
> > +		<bitfield name="V_TOTAL" low="16" high="31" type="uint"/>
> >  	</reg32>
> >  	<reg32 offset="0x0002c" name="ACTIVE_HSYNC">
> > -		<bitfield name="START" low="0" high="11" type="uint"/>
> > -		<bitfield name="END" low="16" high="27" type="uint"/>
> > +		<bitfield name="START" low="0" high="15" type="uint"/>
> > +		<bitfield name="END" low="16" high="31" type="uint"/>
> >  	</reg32>
> >  	<reg32 offset="0x00030" name="ACTIVE_VSYNC_HPOS">
> > -		<bitfield name="START" low="0" high="11" type="uint"/>
> > -		<bitfield name="END" low="16" high="27" type="uint"/>
> > +		<bitfield name="START" low="0" high="15" type="uint"/>
> > +		<bitfield name="END" low="16" high="31" type="uint"/>
> >  	</reg32>
> >  	<reg32 offset="0x00034" name="ACTIVE_VSYNC_VPOS">
> 
> FWIW looks like at least on 8280, ACTIVE_VSYNC_HPOS offset = 0x38
> and HPOS doesn't exist

All registers here are shifted by 0x4 for historical and practical
reasons.

-- 
With best wishes
Dmitry

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1896EC00EF7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 13:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5249B10E3E0;
	Thu, 23 Oct 2025 11:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jBArtMrM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFB210E3D8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 11:59:18 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6uXCk018617
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 11:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=6ZSrNBn4GN8xDjxxz5ymQXTF
 nfG4FbPwRaNc+3tmIX4=; b=jBArtMrMMQ3Q9zwl0FdCWDXTmxemZOWH+k4X6upE
 5DsDe8FZq+cVunSxeP79+MTQjhclQ2yqOCSEBg99GgD3GYnJX0xzajphfv1bgoSr
 98RjWm7LbNewP/hxEljbTXKmLf3UfsDd+4E84/QWEGaMaYhiSVeyFhSCJxf/oM/i
 3oolw/EivwVoiWAouOIimYGLuEYhtDFv/+JHB2LlUf+fCWry6OH8nOcWbnFkGUe4
 yl8tuuHgG38xTJ/Q+bJq10xagTk/lW9JSyTyFxNTBhySXQDgtS5UF9h0+J0khXMR
 BJrIcXWNrTI1WMUgmV+HbvlFbH8Ozn3ByOUmgZqfHbI+Yw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08prgxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 11:59:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e8a9ec4746so39702741cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 04:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761220756; x=1761825556;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ZSrNBn4GN8xDjxxz5ymQXTFnfG4FbPwRaNc+3tmIX4=;
 b=rAcsFC+Z/XdPxZ/GPMPTeCnTjTKqMAyq+9EW0qa4vfvyEJ6RuWi74AAiuH/HBJ54dJ
 MKxLLNG16NXbm4XsO3vUsNTb4oT8CE4d9Pd7iDcQ5dMBH9Sb+P9HnrHwGM4V5mXuvj0z
 Ly/WEZHlZUvo/0nz/mbpM2vf+O1qIODfQJ345W0iX0BwdqSRNHR5gPf7goNvIyk270lJ
 oY2RGUbS1RY6V1WwuX+fDMlG3TfDlYOO9V78sxQYBdDQvr52z8jPgPdQ1IWLBgs3oGpp
 dC83yswE5NO+ESE0svQaYOV9zczwrpRxXbpjPPL1peddAsGXaW9ar/feNbw1YuONTWPI
 cm1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRbRQ9Rz7lwtTCWkISnGVLfDzLcmBb8L2Qzy13/3rAEbwSKhwgx3+hV+qnckB99pNpRuxmnFyS0+0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxo8EHgVoEXloCsM+Dkh0Lm4j/TcfQH3G3W4dqH1rPo9Cgl9sAy
 L6JyglNOAbsoaP1bWOBM4fqVtu2UN624u2VVcYmd9lkIHFT7VYm/hCybK+zbO7FWzIdY3s5K0ow
 yu+3h28or+IJ4DaVppR6LkIK6Xa0sE3yjvYJ1LjBBmfPuhOjblIXE+jber8k741iq5Ig+/N8=
X-Gm-Gg: ASbGnct0ARH4fU5XRXA+/2bQsED6nHmiJz5jcCSPfQWVkArSqibM89IG9If3w110JLd
 AQRBMip5S+xTyiL8rGmc6IiO6x/fzWySwip6oCPpFVI8FwxtfU1RQtsplN9xzZvrM/hMbpakgpX
 xxwBBot5r0XB4SLB5/vd54nzUN5SPsGXutQ1C6u4uCnFm8On6J8uVVAlRzIRBxvHBk6IYMTa1/W
 9wfzj0K9ihPNSIVOB8K9EkDTOuc8w6EHLPPtAy60XDtO4XKdoMxRP6/zNJiCrNCbbesSBAVBl78
 Z/QRHTJd71JtEbuGMMIN/AlHo0t7X0+F2Nzbe7hQN56y/Uk5f+wYk0UO4VyGSkT0W18QURtp6Ek
 j7XHBSt9eRJU2aNBSm7U2mP36YPodtakF4DBC+mqXrpikY+58Vg7CyNuVW3latbZoSiAC74AeRr
 Ix6xNWFzJDxEfD
X-Received: by 2002:ac8:5dd1:0:b0:4e8:9140:f3c8 with SMTP id
 d75a77b69052e-4e89d3442b0mr300586861cf.53.1761220755743; 
 Thu, 23 Oct 2025 04:59:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrkM4uYfq/lNpbDez8GrI0xNjJmLCd3bXoaTu6hgpwbrEYitSxf9CGp5WmH+cMNaQYf8QlBA==
X-Received: by 2002:ac8:5dd1:0:b0:4e8:9140:f3c8 with SMTP id
 d75a77b69052e-4e89d3442b0mr300586381cf.53.1761220755223; 
 Thu, 23 Oct 2025 04:59:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-592f4aded3bsm699017e87.8.2025.10.23.04.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 04:59:14 -0700 (PDT)
Date: Thu, 23 Oct 2025 14:59:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
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
Subject: Re: [PATCH 03/12] drm/msm/dpu: Compatible with Kaanapali interrupt
 register
Message-ID: <nfekr4vi34ftxzyyf5xv4tsb5cr3tokiyfkerypqjf26dos3uq@42wcn6ji7nnb>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-4-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023075401.1148-4-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX8avws1XG2KC2
 kTJuVoWoKAnlZQERGZXy2ikqkDnZa3N7a6CxJM2e45IkRA3ygKfNZlDA+rI0sGTzlvSxGqwhExN
 l3imRSDxHVqzI1Y4ybqa/66ScaJk79VdSJq+IPa6nAs/FuQGrKTlGf63k8NTmpD67p3x1IPX+vI
 /hNGQX8Ane+Mj8TYcD16/QrZo0I1Yrt/w+GEuNba+1y/LTKVcDLGvSNkyDzxbwQWSVCla9vGGle
 9d7Vr5Iw5YzlefM3zDUKbtx4RtOXt9DjTO1aenPOEszETdU8/HigrxJRQe5kj3xe/JAjrqEVWm6
 8QCTaw/HlaAgl1c4RxLoZTW+8uxNMCNhLPT8BjzgmIYlOYolHTBzjANKHccEVFxHa5VssR/VlO5
 xhjcFWd9jFeuc3LI7QfqLuIPbGeSpg==
X-Proofpoint-GUID: UPFVzrBo6X0dOVPYCiW148aKDtBj0wE0
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68fa1895 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=lgH9jh0Qp7VjnHBaTbUA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: UPFVzrBo6X0dOVPYCiW148aKDtBj0wE0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
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

On Thu, Oct 23, 2025 at 03:53:52PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> DPU version 13 introduces changes to the interrupt register
> layout. Update the driver to support these modifications for
> proper interrupt handling.

So... Previous patch enabled support for the platform and it has been
using wrong registers for interrupts? I think that's broken.

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 89 ++++++++++++++++++-
>  1 file changed, 88 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 49bd77a755aa..8d265581f6ec 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -40,6 +40,15 @@
>  #define MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x004)
>  #define MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x008)
>  
> +#define MDP_INTF_REV_13xx_OFF(intf)			(0x18D000 + 0x1000 * (intf))

Lowercase hex

> +#define MDP_INTF_REV_13xx_INTR_EN(intf)			(MDP_INTF_REV_13xx_OFF(intf) + 0x1c0)
> +#define MDP_INTF_REV_13xx_INTR_STATUS(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c4)
> +#define MDP_INTF_REV_13xx_INTR_CLEAR(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c8)
> +#define MDP_INTF_REV_13xx_TEAR_OFF(intf)		(0x18D800 + 0x1000 * (intf))
> +#define MDP_INTF_REV_13xx_INTR_TEAR_EN(intf)		(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x000)
> +#define MDP_INTF_REV_13xx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x004)
> +#define MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x008)
> +
>  /**
>   * struct dpu_intr_reg - array of DPU register sets
>   * @clr_off:	offset to CLEAR reg

-- 
With best wishes
Dmitry

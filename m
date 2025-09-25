Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DA8B9D5CE
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 06:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D027010E831;
	Thu, 25 Sep 2025 04:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SS3bjb8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2425A10E831
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 04:04:28 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P149nh003945
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 04:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=e/kCFXkZ+FKSmrJKU9OVI2V+
 ZwjvOZTNrmccxledYxc=; b=SS3bjb8PJZ2ejl3zDtHflvWwht01loKTAzhHBxjz
 vGz8Q8/4UXjt51Ur7x1y1X4atNwGD/9ezFgsdhxPew0xeurKfU5+DFCxN7+wzNuz
 DtEK5ejr9iFpdc0u79LR4NJofBIZ/LL7GMyX1skABN2inQAHTzoASGMRlOMrwsy2
 zzX9sEyqlsOCTHOkpAuFLtKHmqq7XbQ8DuVAwb10tC4cGzSn4xn8gISK1TSKq6tr
 dfG6lS7ToJpCXgmUBdcUPAfs/ZGyx9TTdjb+3vjh/Lt/I92eXpRZKmx/AwTXJEYb
 dxgOnyGKdpH7yC4hKBAap9U7ddoV8uFBesXSUnrS0gut+w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajf177w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 04:04:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b5ee6cd9a3so16079971cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 21:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758773066; x=1759377866;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e/kCFXkZ+FKSmrJKU9OVI2V+ZwjvOZTNrmccxledYxc=;
 b=pd0HcY8IH0LRcqz9xODUTaWMFgjfaR1g0qJtD05PPjqSyV63oj6rrXfH+QSeOXxmCZ
 dxyYzPrItcoBtJYJOEHLM/I8ZB6VHVNhFOyJpgHS41fDD26tYS4lzGg488whLYXClEal
 X+/j8H+bFdHiDBI2OLjSjmZkYxfyDo8IRDRJKPm9KXVKHJGRzdr2W0rqN/vF5uTHPcsU
 sfDORMEGLFe+08FVRvaQ4OBY4ofyVaLZWkBGUStAYvMhfhKg9k2adXeWrH9P3sj9H7nP
 FzTblS28xFb/XKS1UloM8yyDFYrgk/eAfYmxHY/vARelY9ZcZe6tn7e4IoeqKvhqHeqT
 /X2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoOWQP2IbuE8ZjtPzb3GfQa6NXZcyWolOFsFDPdNkY/xUGyQf1c4zoGGVzti5oa4KTm3UBMUpaQ/c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6yNi5r62URQ89a88sNsfL2h1B6mKiL7NJZFmvkUlQnNle3RG8
 hb9O//ADYHBJL1m5GbyeIXVPrQAzXNYzbZpIS33B84IZVKSIYi9Gm8Xmgn81D5ofY7gUyZFONgh
 5F9K8IwZixsd922HW1EQLwFNPDnMtqm5ADqPi7ifuyTKAg5hfSvfZ76vBFgTawKJPO5p94+Q=
X-Gm-Gg: ASbGncvXQC814wCnyB2AlT4MJbEqYRnN3J6qltgIe5vZyzJMbsEXae8b8q/powScPIH
 s4/oHMdj4Z+bff+SNKAZtDgn6kKH6nq9gWvYfPX+QD3HaoZFisQnOPyDC+j2HmdPLBxGxD1OsQO
 qSeVEaYuV0nrkyMx8tAUUA8yXP++9vUV8fDyf+1kuGk3cKMg/hu2HnVYRcTrTl5vCILQ2E8SZDp
 OzQza8pqCChEMIeXqddxVzSnrdpAP3lstpOCoai6LKcjsD1IgPpJ48K204M1ObtRI0gt6tw/jIQ
 CHf9YOpA1J0T1m4SvmQ95GRjv4EjYeaAZtNWlO/z8BTofDTA8SjrlDB/WGygnRTgl2aRhblP7fb
 1aSOR6E2vLI5ZwZHvTfHYDWXJEsHc4kN8F0zRnB960ChoTVv/kMV0
X-Received: by 2002:a05:622a:587:b0:4d7:7dc3:19f0 with SMTP id
 d75a77b69052e-4da4d507e34mr28165641cf.69.1758773066212; 
 Wed, 24 Sep 2025 21:04:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFswezEZS6cRTNrQbdK0fzLxE9P7vB+2rzULg2QuEV/2IByTm7hQCGVr/ysUeLXu4ScDxEJw==
X-Received: by 2002:a05:622a:587:b0:4d7:7dc3:19f0 with SMTP id
 d75a77b69052e-4da4d507e34mr28165371cf.69.1758773065734; 
 Wed, 24 Sep 2025 21:04:25 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313905292sm323267e87.41.2025.09.24.21.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 21:04:24 -0700 (PDT)
Date: Thu, 25 Sep 2025 07:04:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chu Guangqing <chuguangqing@inspur.com>
Cc: tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.cc, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 0/1] [DRIVER] gpu: drm: add support for Yhgc ZX1000
 soc chipset
Message-ID: <euw3dhb4453dzlvh3hxnn5qsu6awj3jzimm776fj4zesezvw7y@2jwxktc2m6ca>
References: <d518790b-a224-443a-bbd2-1dfb41f8b0bd@suse.de>
 <20250924064954.3921-1-chuguangqing@inspur.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924064954.3921-1-chuguangqing@inspur.com>
X-Proofpoint-GUID: o97HCBLVXW8WBPdYzJBidU79ywCygtQK
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d4bf4b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=8ZZN_PGJ1yOBtuberj0A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfX6vCGh7/cW+rV
 Njw6MOti2ct3qKImVviPMWCgeCPxklBwZd+HN4HHeQMVLVnBr4AEvtQSLJHnKJGNC1rHEHCva3G
 wT2UESAhHQ7Z7W1fiyAUdPGD96Bkai9Xg3FVB/2/O0EEyGwt01HaqAQMw3KTIH3gB5/3zCGpFfg
 h8HmL1vMxTx/0PVfn/xyXWoWVa6rhK2M7whLW5+dsABSwJX6kW0oCSTMZsJeaVbHf0hkzaOyF8j
 JuEpA0F5fgAFgB5oLX16HKQlngoJLum8Sn+vyyrmSY3tEhb/9E7UL+Ww2IipyVpTdNM//zH+VNk
 +fYZsB6Zl1qrtWSPb/Srkm3wnZK5KkR32eJVov49eC96k7n7/cP9wM04/I7mZVqFjiPif2glHEr
 VDc0M6wE
X-Proofpoint-ORIG-GUID: o97HCBLVXW8WBPdYzJBidU79ywCygtQK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168
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

On Wed, Sep 24, 2025 at 02:49:53PM +0800, Chu Guangqing wrote:
> Sorry, Thomas. The changes have been made this time.
> 
> >Hi
> >
> >Am 10.09.25 um 04:23 schrieb Chu Guangqing:
> >> +    select DRM_VRAM_HELPER
> >> +    select DRM_TTM_HELPER
> >
> >I told you twice that VRAM helpers are obsolete and what to use instead.
> >
> It has been modified.
> >> +
> >> +struct yhgch_vdac {
> >> +	struct drm_connector base;
> >> +	struct i2c_adapter adapter;
> >> +	struct i2c_algo_bit_data bit_data;
> >> +};
> >
> >I've asked you several times whether to adopt the coding style in
> >ast/mgag200 for the DDC.
> It has been modified.
> >
> >No only that you not respond to to any of my reviews, you keep on submitting the same code again and again. Linux kernel development does not work like that.
> >
> >NAK on this driver until you get your act together.
> >
> >Best regards
> >Thomas
> >
> 
> to Dmitry:
> 1. use plane_state->dst instead of crtc_h/w/x/y.
> 2. delete duplicate framebuffer's atomic_check.
> 3. use FIELD_PREP() directly.
> 4. use dev->mode_config.
> 5. delete unnecessary drm_atomic_helper_shutdown call
> 6. add AUTHOR
> 7. using .enable instead 

Please read Documentation/process/submitting-patches.rst.

> 
> Chu Guangqing (1):
>   [DRIVER] gpu: drm: add support for Yhgc ZX1000 soc chipset
> 
>  MAINTAINERS                                   |   5 +
>  drivers/gpu/drm/Kconfig                       |   2 +
>  drivers/gpu/drm/Makefile                      |   1 +
>  drivers/gpu/drm/yhgch/yhgch-drm/Kconfig       |  11 +
>  drivers/gpu/drm/yhgch/yhgch-drm/Makefile      |   4 +
>  .../gpu/drm/yhgch/yhgch-drm/yhgch_drm_de.c    | 423 ++++++++++++++++++
>  .../gpu/drm/yhgch/yhgch-drm/yhgch_drm_drv.c   | 310 +++++++++++++
>  .../gpu/drm/yhgch/yhgch-drm/yhgch_drm_drv.h   |  51 +++
>  .../gpu/drm/yhgch/yhgch-drm/yhgch_drm_i2c.c   | 114 +++++
>  .../gpu/drm/yhgch/yhgch-drm/yhgch_drm_regs.h  | 208 +++++++++
>  .../gpu/drm/yhgch/yhgch-drm/yhgch_drm_vdac.c  | 123 +++++
>  11 files changed, 1252 insertions(+)
>  create mode 100644 drivers/gpu/drm/yhgch/yhgch-drm/Kconfig
>  create mode 100644 drivers/gpu/drm/yhgch/yhgch-drm/Makefile
>  create mode 100644 drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_de.c
>  create mode 100644 drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_drv.c
>  create mode 100644 drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_drv.h
>  create mode 100644 drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_i2c.c
>  create mode 100644 drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_regs.h
>  create mode 100644 drivers/gpu/drm/yhgch/yhgch-drm/yhgch_drm_vdac.c
> 
> -- 
> 2.43.5
> 

-- 
With best wishes
Dmitry

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6788CC5FCB3
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 02:02:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B3510EB74;
	Sat, 15 Nov 2025 01:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxUYZC8H";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kt+LBaIV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F0B10EB74
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 01:02:24 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEJLfdI4150263
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 01:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Qs9XNl6C5ygh9qZUkoG6dSnI
 2cAtbM33aIVEqpZU3HM=; b=LxUYZC8H3vZCJgDMaslziF+/Q+DGDpgidTjmxz91
 36M9bXPQASL0FtjnxYfrUVa1RxfX/6Gx0QRblsZWir9/aZGk9+AO/Bx7/lK6htOu
 Kld39VgMAHM2tQvShW6rixT4ooi/0ZDEkCQl+CHmcUqd7XlYKDhy9nIkb/l1G30P
 8MUMR014eDXOtxX+gjWzx34mcc9JA6nEV5BeVunCkD+NB3z6IefYWUeHupCjzzTd
 AzfeiCztR72AYwahKrSIIHEMhcWT5EQsRTFBaSGjKloFPxSK9SPAbPxvOhpNAzVX
 fLJMN8YRUPS0S07zPbKtVfvjn6QEYSfcvTnlirAT3vmhkA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aeagyrpwm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 01:02:23 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id
 006d021491bc7-65742d1c7f9so151365eaf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 17:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763168543; x=1763773343;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Qs9XNl6C5ygh9qZUkoG6dSnI2cAtbM33aIVEqpZU3HM=;
 b=kt+LBaIVfoDKEwlUJg+LinSEUEK+ryzqsBcSAGV8OSmzDd1AMHOPmXqkzwJdzd7rf5
 54SIefttSrwgeaJSgaOOsGba4OcWb/8X+83U2Z+zDftlCfz+1U9vmZmHa5kX9Vv00nEr
 zZ/lQ/o/NtCrcLrDtcpxJpJxJ9DL2qE5UJdsiTehUBzGFmw6BKRi6qrnYWxWO13+4sIq
 4Q5Vs1+pb7EkP8R/LnRBO+aQAgh+FlRBYub9xPbH0Hkww98qAnq8FCG97Ult3J5BJQ7A
 BI2pfE/6EbvBbQ2XuSlQmMJy8WTzH01gvcnQXDj3XAIIPEqmaCpQtYxuOboLEMRxE2UJ
 a18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763168543; x=1763773343;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qs9XNl6C5ygh9qZUkoG6dSnI2cAtbM33aIVEqpZU3HM=;
 b=DyW6Lv+p6XSkrzTMMNQgWR/jtpVhex5goEk6kn5OC4oR7CV+/9INXR1+3vZb8eUdNc
 8W7Qw2MLjZ/GcjKi/zWtm6mlbGjEZAv137XN/F1q8PR6psUux0j9Xb4cB8XhPNaxns36
 S3cHjcSrAWgAcs20c01q1J7yqa9xbpKNZPXmpy77cQvMkLhhWp2ntelA8ytX9ojbLiRv
 lcv4ZKna2zJ0huo8yuG4ozT8o8cpca+QZLbJa7VKbtwgxlWvsHQ8NKJwWGN7ubNmgpmf
 2saX1mgymkaXXS0WflKFKqTfSQBp3eprycwmimu/U65vHv+sXpHEOwc93IrhOFN4IAfJ
 2BGQ==
X-Gm-Message-State: AOJu0YzUxqRoMwNdG1ZMkmg6oHsP3RZiD10yfk1xWrS5DIhYUy4uRNpX
 +5u/7O1+9U4wcwrxFbgMRcu4J0XdS9/wENx8qyVQU2sJPLZXLhkNHIToTrZcOpxpfro8/J7nHhu
 cs5yuxJPtPjCF7ZSIGYY4cEH5qdI11essQTZOLkQaKCnrTQeejI61HxlgmCxp7UKJweodLYu7zV
 lL8TQ=
X-Gm-Gg: ASbGncvnIQ3a3p+vXS3gxlZi2pTGAtSGgEKPWVZQzVbMEThEjrij+jPRqw1BHra+pmH
 rFxmC3xGBBonQKvNmiyC6Pz0FzSr820fxBwk8socJxL9N8xdH5iGMFTUGWTSk/KgkJudHNPGwiA
 ND+xRYjw16SaYbxC8X2ddgFw65+Pb+0itO1LPh5uvmknclUUVOOdA68I2BtdtehzjiN3Q4I4rKJ
 vUvchjA3mXskl5R23ws6fqOlXcFHPc+9i5+fST9ZytPpiyIIxj8RQOGz4FIkmOALNqEKdvmHcGE
 8EPVeqWkG2S8NBOVLPVtwz9jo7W7htZOcBp+OpjNoA+lq02L1+CY5sh/F5BNSeEe1mnGaaMWE8M
 t1YNOds6IlMDv9b32nAd6AqyWTljBBgQ3qiLbGqzADTvv7qPKqXgLa4kU/u/UK0Bdv9gL7D7jw/
 OGIoUYSHo3eX2A
X-Received: by 2002:ad4:5dce:0:b0:87c:1d89:a245 with SMTP id
 6a1803df08f44-88292699d47mr77113266d6.49.1763167809674; 
 Fri, 14 Nov 2025 16:50:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjIFGATfZLfaUZaE3KWR5c8p1sYfBsOVpYyQEawnaMA0DTE16Ifr+U3lmX3Y+76mKypsKpog==
X-Received: by 2002:ad4:5dce:0:b0:87c:1d89:a245 with SMTP id
 6a1803df08f44-88292699d47mr77113096d6.49.1763167809268; 
 Fri, 14 Nov 2025 16:50:09 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37b9ce0822csm12716841fa.10.2025.11.14.16.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 16:50:07 -0800 (PST)
Date: Sat, 15 Nov 2025 02:50:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] drm/ci: Move qualcomm baremetal jobs to lava
Message-ID: <ursdbkco5n734zhfqceztib4b6vxb2juq5jfllzcjeuctd6lvn@dbdbkbr4csws>
References: <20251114030056.1139570-1-vignesh.raman@collabora.com>
 <20251114030056.1139570-3-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114030056.1139570-3-vignesh.raman@collabora.com>
X-Proofpoint-ORIG-GUID: jwDEaNoBY4BnARMaSxfIAif5CDLw-7TH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAwNiBTYWx0ZWRfX1cxLB58XrhBl
 T12IHwB3N34PYTic0OW72kCEkHAnklhoQ+Mc7qUqFhEgwzl9wjoBtSEeAIO75YPUhxvRh//SetF
 nkGeqtSBSwveaUDRM3PCJJdvcxj4mJrEOrRBIOhUJ+VXRglePMUBBOSoCoDmPevyEVHtpC/Kc8A
 3yLGMSiRMGpTFl7IomJdFciZDni7SlGce2p/lshxdi/LGJM3dZ1YJ6rUnFZSqgbYruDTdUIB16g
 BO5K86zZYxbSanZBMyd5pgB83nfyHAi0apKQFJNBmYO7mvyel8/P9TEKR7LMdT6aVOHypu+I5e4
 PN2gypBiku0+YMKMSRA0C3SwG/LWtat4tpUmfBYGqxhw0rSjKuR/GXowI5fo/F1WJ2rqC97QH7B
 YbFutU2nkUjlLBol30+0sMobVSYh9Q==
X-Proofpoint-GUID: jwDEaNoBY4BnARMaSxfIAif5CDLw-7TH
X-Authority-Analysis: v=2.4 cv=Go1PO01C c=1 sm=1 tr=0 ts=6917d120 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=Oc5gQ_T1tCqBBtY5fQkA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=CjuIK1q_8ugA:10 a=k4UEASGLJojhI9HsvVT1:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511150006
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

On Fri, Nov 14, 2025 at 08:30:51AM +0530, Vignesh Raman wrote:
> Qualcomm apq8016 and apq8096 DUTS are moved to Collabora lava
> farm. So enable these jobs to use lava and update expectation
> files.
> 
> Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  drivers/gpu/drm/ci/arm64.config               |  1 +
>  drivers/gpu/drm/ci/test.yml                   | 62 ++++++-------------
>  .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |  4 ++
>  .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |  2 +
>  4 files changed, 27 insertions(+), 42 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I'll try picking up these patches through the drm/msm tree, if noone
objects.

-- 
With best wishes
Dmitry

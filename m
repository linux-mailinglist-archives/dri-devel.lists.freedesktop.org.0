Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7860CBA1C3B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 00:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C7E10E2DE;
	Thu, 25 Sep 2025 22:15:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hLHiuUW3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 348CC10E2DE
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 22:15:30 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPdTj023337
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 22:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=sjdi5D29k1kO+lHenvXFjyon
 bfZFH9gQroDJ/bmbuc0=; b=hLHiuUW3Lp7IgkcpDQZ1VoR5a8dnJ7tqj/mFZvxi
 NWbrOmjUceE7DOlplgQMtcppvWStBo7bAxftHRsEQZsBROyh2xa4G91NBvzSWzb7
 2q89/11ibH9XB92lwg83NIFPiip2tCIMJSL5TJzJhCr9622NlM/0tp7H0GW4IjHg
 JuqF2BTbvkoX6RLgm76C+REwzuWwCzOMr5Y6ZxRMeCn0O8F2Q4W0n5vpVOXhP6vD
 9RgCpGIwKKwFSIEQgRC5x35r2r76IIwq14T8V4eLv3fjRhy2Vlm6TS40NglAanuf
 WOaKpGR3b2JS3lZXsYQ1WTEdVM/mbFQ3//HDvVUJVki8dA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qrht0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 22:15:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b793b04fe0so33596601cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 15:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758838528; x=1759443328;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sjdi5D29k1kO+lHenvXFjyonbfZFH9gQroDJ/bmbuc0=;
 b=rvi4b0xMqe5wCgfIcfNkdH63im2758mOE2rA2s3tfxRa3ZoXd2qO5uGS58l6S1SvI6
 fpFshg18a822htI+eHW7dKmtT2gUc30w+4gcNM7/1qSlChoIjnAUyJOvijJ2g4j+Ifnk
 TOmNTvVoXjelpOu2yoersyn2U+rzo2HUU6A+GJhgA1r4fGUP0PXRc1Uaai+81NrzfW35
 lib6ZEv4uGa2ghqEwiKf4vh1xwPPJfaXEpteVeu0K6Z5T1XJ0NnbqGnTndMpp0B0CKLx
 9JZ0BJFWXgohcDnp20dYvIqrh84XKAZY4/j28k8bKwx8ScgQ0kj1of9i5Tu15BUQw2KN
 kVag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlPRD8gyacfW2a+m00k/S9O+wESr2hzht3BeSOY1MD6KKwQ9Ej0240NPLvMErfwFK5EmBAuuHGSUk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz12JMcEpsODPjUL1HTtS15BoXauxTZCa+Dj+f+vOcHL9hFWdCT
 mWNvo37Zv8qMvtPOmLtJqWjUmXcPvz7QelozYkXOnLE9yX+Ca2xPNGZxIf1rl2amiNpUoYuSFhX
 RBZtlBjSBpOafTrwQ8aF3tBBIaSwZUFQ+lZ3o+GtNGigDqNt/31Nb5NFNq2vzN3Db6N1/vFw=
X-Gm-Gg: ASbGnctiMNKE37VcDky55eAaDurorIFcmBtt4MT9TEKweJkspclX+jXeWPnuRr0dWa+
 /raEU1Xk2wheNkckrupH3CPUap2njzjBGItDeuepyVGJ0LgvDE6w3ZHSZGEst2/E/q/MSNjehlj
 n4JQbNSJ4QJAfYIINk3qOs4bpakZKzwdJtHi/BXTe6PUPQC5uN1WSgCN391FJ7oC0PtfgRrsSlZ
 SY56AktMxIJ1q6CH+YBQLjeNlwbASW3TpXG1ERv01sa9VU6Jp7171Qama88Y/Ng74m0xYfYuEau
 qr9ddm21pMUDgd8aCQzWvz9hSubHzZDw6zpkaP5XMrqzZgBgvFu3TVnprG8O+GVyDum8Jy0xevJ
 6mE8x2P4ls07gVZ5vIiyhEhb5sD15ThOIXt0+2foYvI0Fe2XSFneC
X-Received: by 2002:ac8:57c9:0:b0:4d9:186f:8503 with SMTP id
 d75a77b69052e-4da4dcc0bc2mr74889911cf.81.1758838527973; 
 Thu, 25 Sep 2025 15:15:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNrQu0pE5yE6hbpFhVa7QeLfuYlu7eJGATqKLFH3hTVEDF586F4+O3E+td7C4eAXHv0A1y0Q==
X-Received: by 2002:ac8:57c9:0:b0:4d9:186f:8503 with SMTP id
 d75a77b69052e-4da4dcc0bc2mr74889411cf.81.1758838527365; 
 Thu, 25 Sep 2025 15:15:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583173d2007sm1158596e87.149.2025.09.25.15.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 15:15:26 -0700 (PDT)
Date: Fri, 26 Sep 2025 01:15:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chu Guangqing <chuguangqing@inspur.com>
Cc: tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.cc, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 0/1] [DRIVER] gpu: drm: add support for Yhgc ZX1000
 soc chipset
Message-ID: <ek3ynjxwz5oj37fwwvtnxqcmijhn54h7ncrhcpnistjud7cewe@mrmjzskvzr5f>
References: <ouli257ffd7ocmwzywxq5zlapw7j4aqowy3oeu74x46dmpymah@b6r7py6bixsp>
 <20250925091715.12739-1-chuguangqing@inspur.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925091715.12739-1-chuguangqing@inspur.com>
X-Proofpoint-ORIG-GUID: TpCfy-NKRn0lCCoQHMNDLRPaoBI-MSAu
X-Authority-Analysis: v=2.4 cv=bJ0b4f+Z c=1 sm=1 tr=0 ts=68d5bf01 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=F_93P0QhAAAA:8 a=V-VOkMrW4BanMQ8zAPYA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=v2fne3mUlQEKA94IZ0Od:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX86UebApX4kZz
 2RLg7n0Tq8gKLBHZZUYRH9jFhZY0wybJGqk5L585E0R5OnXoN6TrTAvQOh5Ppx7z5T3Y+/RqMdQ
 AzB/PwjgdePAMwg+186lg5KZ6bbEpRGogOcS3bNi0CALijJXFhAA6ylfI2XT72QDPLsyBxwInG8
 1BayxDK9NDoQ4ZZKoVadxNvAmwfmzABWhNxXHSEdEChWYqLx04bnrM5dvA2u/MAwK3a4VBpub5D
 2ZxOb8BIN3xs2lsQz+AzRvBU5XG41FtGp9xfebYQ1K/eKCbGvFKCt1QVI8kGXdS7MgIeoWuyfLz
 nDs2P06wdfJR5Gk2zXHbf6gnhP0nMAeL8zt2XKE0KRBGt8gB5bK/taDkH8qk4Or4BTqLovkHGyh
 ubfyu3Ohp5sWu7Wyv+8+taBWjuyIwQ==
X-Proofpoint-GUID: TpCfy-NKRn0lCCoQHMNDLRPaoBI-MSAu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On Thu, Sep 25, 2025 at 05:17:14PM +0800, Chu Guangqing wrote:
> Hi Dmitry,
> 
> I have read Documentation/process/submitting-patches.rst. however, the content
>  is quite extensive. Please point out any omissions if there are any.

Most importantly, don't post new iterations as a response to the
previous one. Always start a new thread.

Also, please respond to the original emails instead of just posting new
iteartions.

> 
> Q:Is there a need to probe here just print an error?
> A: it will be re-probe at detect_ctx

It doesn't really answer the question.

Please stop pulling the questions from the context. Go back to the email
and answer them there.

> 
> Q:No .disable() ?
> A: yes, we have only implemented the enable function

Why there is no disable() code?

> 
> v5:
>   - remove extra level of subdiretories, change to driver/gpu/drm/yhgch
>   - remove else from > +        else if (!new_plane_state->visible)
>   - remove extra check in function yhgch_plane_atomic_check
>   - remove the extra parentheses
>   - change the author like other modules
>   - use drm_edit_read function instead drm_get_edit
>   - remove debug info drm_warn call
>   - rename function name smi_connector_helper_detect_from_ddc to
>      yhgch_connector_helper_detect_from_ddc, remove extra return statement.
> 
> v4:
>   - remove  VRAM helpers from Kconfig
>   - use the coding style in ast/mgag200 for the DDC
>   - use plane_state->dst instead of crtc_h/w/x/y.
>   - delete duplicate framebuffer's atomic_check.
>   - use FIELD_PREP() directly.
>   - use dev->mode_config.
>   - delete unnecessary drm_atomic_helper_shutdown call
>   - add AUTHOR
>   - using .enable instead
>   (https://lore.kernel.org/all/20250924064954.3921-1-chuguangqing@inspur.com/)
> 
> v3:
>   - The order of the code blocks has been adjusted, and the "warn-on" branch
>      has been removed.
>   - removed the related formats for the alpha channel.
>   - removed the atomic_flush function.
>   - have removed the empty line.
>   - have removed the error message here.
>   - replaced it with the drmm_encoder_init function.
>   (https://lore.kernel.org/all/20250910022311.2655-1-chuguangqing@inspur.com/)
> 
> v2:
>   - Delete unnecessary comments
>   - Delete unnecessary branch
>   - Use drm_atomic_helper_check_plane_state
>   - remove the alpha formats form this list.
>   - use w,h rather than x, y
>   - delete type casting
>   - use a simple call to drm_atomic_helper_shutdown()
>   - delete yhgch_load function
>   - delete vblanking code
>   - delete unneeded i2c type
>   (https://lore.kernel.org/all/20250903054533.68540-1-chuguangqing@inspur.com/)
> 
> v1:
>   (https://lore.kernel.org/all/20250808053508.52202-1-chuguangqing@inspur.com/)
> 
> Chu Guangqing (1):
>   [DRIVER] gpu: drm: add support for Yhgc ZX1000 soc chipset
> 
>  MAINTAINERS                            |   5 +
>  drivers/gpu/drm/Kconfig                |   2 +
>  drivers/gpu/drm/Makefile               |   1 +
>  drivers/gpu/drm/yhgch/Kconfig          |  11 +
>  drivers/gpu/drm/yhgch/Makefile         |   4 +
>  drivers/gpu/drm/yhgch/yhgch_drm_de.c   | 415 +++++++++++++++++++++++++
>  drivers/gpu/drm/yhgch/yhgch_drm_drv.c  | 310 ++++++++++++++++++
>  drivers/gpu/drm/yhgch/yhgch_drm_drv.h  |  51 +++
>  drivers/gpu/drm/yhgch/yhgch_drm_i2c.c  | 114 +++++++
>  drivers/gpu/drm/yhgch/yhgch_drm_regs.h | 208 +++++++++++++
>  drivers/gpu/drm/yhgch/yhgch_drm_vdac.c | 121 +++++++
>  11 files changed, 1242 insertions(+)
>  create mode 100644 drivers/gpu/drm/yhgch/Kconfig
>  create mode 100644 drivers/gpu/drm/yhgch/Makefile
>  create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_de.c
>  create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_drv.c
>  create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_drv.h
>  create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_i2c.c
>  create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_regs.h
>  create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_vdac.c
> 
> -- 
> 2.43.5
> 

-- 
With best wishes
Dmitry

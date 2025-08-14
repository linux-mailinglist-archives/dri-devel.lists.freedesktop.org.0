Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC388B264C3
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 13:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C98C010E878;
	Thu, 14 Aug 2025 11:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f/hxzrDp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495FE10E876
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 11:55:50 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E8vVP0020683
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 11:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=KwaUoxCOeIrDWwA8MlhquWgH
 JPxXaTq1KQH7JgKMBMY=; b=f/hxzrDpyJJBp6bHh10DNPL4BxwP+hS/6GNa2af/
 kCwkSAX3lPXVFDQoUuReh+6mV5Ldm+9d0JnrtCGHNhSAdze7NYm4nq0Ey7/4Y47q
 pMIr91TaLzYMy2KckdySSHg+MQb1lfJu67Yhb5AUdXAH6C4gYJHKMrOi7+7kl8AB
 +fA9oJ9uUeH/RSTS5cAxaH54hq19sVstF0kmMJHCXe9eFxrYt+Dtsb26+Ls/bw6d
 /CknuDnqcL29vPlPa56tJmfcJtjP5DAZ3fG+LPJ+OqENzYITxp0MroUYDm7Km7IR
 wzsPzGtckcyxaS/krzZ82e4K5ZWUUOD4jEMxu0wPXi0nog==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmfhm3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 11:55:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b109c7e901so21965681cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 04:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755172548; x=1755777348;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KwaUoxCOeIrDWwA8MlhquWgHJPxXaTq1KQH7JgKMBMY=;
 b=oKHYA1OIXjUvNGGrgv7o165LdClcwX/c9+IAJVcwdxk1PQagHpxNTzwUiR8Mcx9yTG
 5ZKR3jJfQNq8wxvdn+sy0sfTDcKVGnqqFH27Taf8F9HFySfYrTB5M/YE+EBBl6Y39Cpg
 U9DjjpUuQhIWKhVXHX+hGOOYHVYUm54ZG9Z+gTfUZyDOIc+DdxaoZcrvH2hNSQdHw17j
 PfONwqgklaLBqEb6GdT+Shj5BIOq52RT58hWBvUwQHyFnEI5mIDnwAEvsdaAduIN3zHy
 rDKXSOPnvFMbBMog7sE6G3o36mnm9NwMq6afRpNwq3SLzaPf6l6VP96vYGXx92zuDN1p
 BXFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUkEfPdy3RhYO48/cEOJtW10n4OfhQXPBgYowdkD1Ud/N9pJiiCxzOxJpzYPsuVQnqexh67uvUgdw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaMBvlaP7DoZ2Ii0byBwRVuhDq5aaeWr0Uy1bDbbHWEH575PA7
 fyQpUfeZt1uy+JvQgIbWkcvwamheaJBKr4atJkLUvvwUHjRqzAixWWmHl0cH22x8Mur2eoDlx8y
 4gLa4Q2pfsDL0FYj3lUdI3SSf0MS29mE0qFp3BFvBB5VTmVzHlM5J4kbZ/Cr4mk83nRMjsUo=
X-Gm-Gg: ASbGncsHlQU0R+zYGL+uQQf/l9OmqCeiY+t6U+byTss70TPdcReq+8uQXB9qYlZ/M+8
 CzdcmYBTrmkmtN7KAnVN8AhQKcv2CuDZGLWzRIzdgP3t6ixh+9DsPMryuTlIlBHQ3F3wvEnzmQ/
 BL1lg94K/usQ+Fr2lxkfN7OJpaLuPmguch+ywaFTh9eCQ/laMORPawyZBeuPFVt02w7aCfKgtaU
 PnzzdszQ8nsIOkzQ5dZzwIT1dnkOFkHM9cLzpnClVSAH3Y8HYkA4j24up+J2/hLXOc+d+Job4eY
 rDDeuQWF7shs1EriGsT/CogpNNEhQW31BAMISiO/BsGTsXKI4xQDu0AvBZftyaoBhAblkeBkYC7
 u0Kdy2NqZsAkxk3JN9p6qYEZu5n1ilvJ8X/viI++iexhjAUbLgjXr
X-Received: by 2002:a05:622a:181b:b0:4b0:81b2:a028 with SMTP id
 d75a77b69052e-4b10a9599a6mr38768391cf.9.1755172548289; 
 Thu, 14 Aug 2025 04:55:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5PGTOUVfkkOdPwUV4mfK2TYoGc7cZ5ZdF55FySgMx3O0MHYR346J62Rlv5Z/fmOpnbr4S+g==
X-Received: by 2002:a05:622a:181b:b0:4b0:81b2:a028 with SMTP id
 d75a77b69052e-4b10a9599a6mr38768071cf.9.1755172547762; 
 Thu, 14 Aug 2025 04:55:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55c78c9123bsm3781616e87.44.2025.08.14.04.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 04:55:46 -0700 (PDT)
Date: Thu, 14 Aug 2025 14:55:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, Michael Walle <mwalle@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/2] driver core: platform: / drm/msm: dp: Delay applying
 clock defaults
Message-ID: <flybqtcacqa3mtvav4ba7qcqtn6b7ocziweydeuo4v2iosqdqe@4oj7z4ps7d2c>
References: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfX5W1Ktxn1zjJQ
 H3mk4UsVz4/t6j/kMxSsIvFt7viYJ6ir0zRzI3qeCezkSz9natMVY9AuuEts2cLdA7vG0/dWi8e
 g943yrff1K8bSxP6NF0W3y6w5lVLCXe7sesMOXj6G5wy4mL0XityQ+Y1J0H4fAbFbC0Xbz/u1jN
 CUfhchKmt7hmtfKk83T7bP3j0s540sJUlkw404kWAyXQUxU5bMLvrJBZjcsgyo80HJFhGWHud+/
 1letqxNJSwID1bvIdLP5TRVLpj85/WG1k73PONFJIGuAAlXKqKRp58nucMbnIuVY2/39F+JKrCa
 oyjuADkxBoNq+LJAU+nk4WcHX+2ywKoJGqXtvRJTVnoJZ+Or9gUGCmiPm0SNbLiugewN5rh2FTf
 LznIm6y7
X-Proofpoint-GUID: CFJ9fHeB6rIcGcTQXMTmXLaStAo7Oi7M
X-Proofpoint-ORIG-GUID: CFJ9fHeB6rIcGcTQXMTmXLaStAo7Oi7M
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689dcec5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=PpI7sDOo-OXBv82Lu10A:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119
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

On Thu, Aug 14, 2025 at 11:18:05AM +0200, Stephan Gerhold wrote:
> Currently, the platform driver core always calls of_clk_set_defaults()
> before calling the driver probe() function. This will apply any
> "assigned-clock-parents" and "assigned-clock-rates" specified in the device
> tree. However, in some situations, these defaults cannot be safely applied
> before the driver has performed some early initialization. Otherwise, the
> clock operations might fail or the device could malfunction.
> 
> This is the case for the DP/DSI controller on some Qualcomm platforms. We
> use assigned-clock-parents there to bind the DP/DSI link clocks to the PHY,
> but this fails if the PHY is not already powered on. We often bypass this
> problem because the boot firmware already sets up the correct clock parent,
> but this is not always the case.

So, the issue is that our abstraction is loose and we register a clock
before it becomes usable. Would it be better to delay registering a
clock until it's actually useable? (and then maybe to unregister on the
link shutdown)

> 
> Michael had a somewhat related problem in the PVR driver recently [1],
> where of_clk_set_defaults() needs to be called a second time from the PVR
> driver (after the GPU has been powered on) to make the assigned-clock-rates
> work correctly.
> 
> I propose adding a simple flag to the platform_driver struct that skips the
> call to of_clk_set_defaults(). The platform driver can then call it later
> after the necessary initialization was performed (in my case: after the PHY
> was fully enabled for the first time).
> 
> There are also alternative solutions that I considered, but so far
> I discarded them in favor of this simple one:
> 
>  - Avoid use of assigned-clock-parents: We could move the clocks from
>    "assigned-clock-parents" to "clocks" and call clk_set_parent() manually
>    from the driver. This is what we did for DSI on SM8750 (see commit
>    80dd5911cbfd ("drm/msm/dsi: Add support for SM8750")).
> 
>    This is the most realistic alternative, but it has a few disadvantages:
> 
>     - We need additional boilerplate in the driver to assign all the clock
>       parents, that would be normally hidden by of_clk_set_defaults().
> 
>     - We need to change the existing DT bindings for a number of platforms
>       just to workaround this limitation in the Linux driver stack. The DT
>       does not specify when to apply the assigned-clock-parents, so there
>       is nothing wrong with the current hardware description.
> 
>  - Use clock subsystem CLK_OPS_PARENT_ENABLE flag: In theory, this would
>    enable the new parent before we try to reparent to it. It does not work
>    in this situation, because the clock subsystem does not have enough
>    information to power on the PHY. Only the DP/DSI driver has.
> 
Another possible option would be to introduce the 'not useable' state /
flag to the CCF, pointing out that the clock is registered, but should
not be considered for parenting operations.

>  - Cache the new parent in the clock driver: We could try to workaround
>    this problem in the clock driver, by delaying application of the new
>    clock parent until the parent actually gets enabled. From the
>    perspective of the clock subsystem, the clock would be already
>    reparented. This would create an inconsistent state: What if the clock
>    is already running off some other parent and we get a clk_set_rate()
>    before the parent clock gets enabled? It would operate on the new
>    parent, but the actual rate is still being derived from the old parent.
> 

But... Generally it feels that we should be able to bring up the clocks
in some 'safe' configuration, so that the set_parent / set_rate calls
can succeed. E.g. DISP_CC_MDSS_DPTX0_LINK_CLK_SRC can be clocked from XO
until we actually need to switch it to a proper rate. I see that
e.g. dispcc-sm8550.c sets 'CLK_SET_RATE_PARENT' on some of DP clock
sources for no reason (PHY clock rates can not be set through CCF, they
are controlled through PHY ops).

> [1]: https://lore.kernel.org/r/20250716134717.4085567-3-mwalle@kernel.org/
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
> Stephan Gerhold (2):
>       driver core: platform: Add option to skip/delay applying clock defaults
>       drm/msm: dp: Delay applying clock defaults until PHY is fully enabled
> 
>  drivers/base/platform.c             |  8 +++++---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 10 ++++++++++
>  drivers/gpu/drm/msm/dp/dp_display.c |  2 ++
>  include/linux/platform_device.h     |  6 ++++++
>  4 files changed, 23 insertions(+), 3 deletions(-)
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250812-platform-delay-clk-defaults-44002859f5c5
> 
> Best regards,
> -- 
> Stephan Gerhold <stephan.gerhold@linaro.org>
> 

-- 
With best wishes
Dmitry

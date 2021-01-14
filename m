Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A652F67E1
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 18:40:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34EA989BB2;
	Thu, 14 Jan 2021 17:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D4E89BB2;
 Thu, 14 Jan 2021 17:40:39 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id j20so5929695otq.5;
 Thu, 14 Jan 2021 09:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VIKbuTpzfW3yd3CewvFIKKZzMyKcmxzXmITP6uJRNoQ=;
 b=RW8yunez+93efe/TW5NSL/34M/gxLz1QB79WnnEb18heEr5OxZ3liQt/d5A3Eilmcg
 mWpwkMI2SVIYghs1p3SB6pFfuryDjLBquX454/zfVdLSGZvE96U259ONEFy/n1mTeI4U
 uNVW/jjo3FiRy0jHwxD9OE16AU2bu8FsoIfCbekPdvwngU6tNzML4/js1ucATWJSrxIp
 l2WCcXJi5Qd4v3jOBlpHDkZ4L1RGstctOZwCLlTm/HrMC0LnbuymeDTKq7OfLQ1Z1/9N
 nNUtmMa5MrmcKnE0EA5oeIWIApRl6Y/X2CwmutbydI5AkcQlj8qmK4t2hULkhH0qgBQC
 r03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VIKbuTpzfW3yd3CewvFIKKZzMyKcmxzXmITP6uJRNoQ=;
 b=Cjg30a7XTj71tJRQNRLXUYrb9mC1E4hBFSBYap2FQrYp3RboJwz6vy8/yoMzSOWprN
 bmr3o96gW0E9d0zGu8Gl84ctcvLDdEFebE0xZ9mGMeNXZ2IwPSv3+MZe337QjgFFoNYy
 XegNcdNFwmXMZLx0sKaFVKRf4CPAsZIqqBaUu1GayVc18FIt2Hvdba9bk5u3+K1T0+uT
 dGa8Gs7aphCw+McHx7XOS6ZcnqQ14NOExrUe4mCYT1wLy2Oz6/TH+L8x+7aGaV9OVFT+
 yOhqCN4r94lL8OtHrWKLifiZUJ/XIOBQnu6Q9vzXlVA0/mu7aCMnzvK3LWpBTwdvGZqJ
 NXAA==
X-Gm-Message-State: AOAM530UC73+erkYJWT/uTnAuvxQvnlP5Isq547e4E+rGaqCl/MLzEVN
 BcyNpljZQEPEklvLig2nWhiUlzp0b9Q1bM/lo+A=
X-Google-Smtp-Source: ABdhPJyqNOLr77X30jXERcm8sC9peDvPrCuRMfLz2B02kVMs0kUcK0gIWbTM7DPn60u3B36XxDSMGKgEmBBbjPS0aiE=
X-Received: by 2002:a05:6830:1b7b:: with SMTP id
 d27mr5547562ote.132.1610646039327; 
 Thu, 14 Jan 2021 09:40:39 -0800 (PST)
MIME-Version: 1.0
References: <cover.1610610444.git.mchehab+huawei@kernel.org>
 <8e16f3aa553786cd193e49882ce5131e3769afb8.1610610444.git.mchehab+huawei@kernel.org>
In-Reply-To: <8e16f3aa553786cd193e49882ce5131e3769afb8.1610610444.git.mchehab+huawei@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Jan 2021 12:40:28 -0500
Message-ID: <CADnq5_NeVyxMnUx35qXdm6i7gLbn_uCSNTBHJbEkSM765QsxKg@mail.gmail.com>
Subject: Re: [PATCH 06/10] drm: amd: amdgpu_dm.h: fix a wrong kernel-doc markup
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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
Cc: Eryk Brol <eryk.brol@amd.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Jonathan Corbet <corbet@lwn.net>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 14, 2021 at 2:53 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> There's a missing colon, causing the markup to be ignored,
> solving those warnings:
>
>         ../drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:340: warning: Incorrect use of kernel-doc format:          * @active_vblank_irq_count
>         ../drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:379: warning: Function parameter or member 'active_vblank_irq_count' not described in 'amdgpu_display_manager'
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks, actually applied the same patch from Lukas Bulwahn a couple of days ago.

Alex

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index f084e2fc9569..5ee1b766884e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -337,7 +337,7 @@ struct amdgpu_display_manager {
>         const struct gpu_info_soc_bounding_box_v1_0 *soc_bounding_box;
>
>         /**
> -        * @active_vblank_irq_count
> +        * @active_vblank_irq_count:
>          *
>          * number of currently active vblank irqs
>          */
> --
> 2.29.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

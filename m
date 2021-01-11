Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 679A92F1A74
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 17:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC466E10B;
	Mon, 11 Jan 2021 16:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1536E106;
 Mon, 11 Jan 2021 16:08:26 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id s2so20645163oij.2;
 Mon, 11 Jan 2021 08:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/YOqvpiTVL662Hepssj8vJdOMVdXcftTrsd30jyzSVo=;
 b=X7tgxB6yDUKuDb9mVNX12KgefcJACkw5OMYWUO+CpS0+1VX7njt3cjjslREW51qyTS
 1ixwpLIOgUzbd8/0CfFHkNDtXBj3RYmxFsEiihR7yZEEG27+ZEBxI9RqicKhGz9ha6fM
 Je74eepw4O8O2q63DJvPmiTIDROBOeXMcibu23c77JOvviN68jofmODCPTq7KCEaY3GT
 VRLX1I/UvV//2870PaJZ4M7cLs14FQ7rUNmTdOTwwWOiP2t+Gy9Capao8xETef4qeLNB
 LRURF+IWnv5GOOyqmR98rbLSLH5nrFPLgPQKUh70YRIEg4jjsUYrXkbS+EdYdzZeNxom
 8A8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/YOqvpiTVL662Hepssj8vJdOMVdXcftTrsd30jyzSVo=;
 b=MHjNnclm1RDc66jT01HJkp8pOlgtcs/0bRRqb0poG+D6PkRecDjDHoO+jdC+VLs1Za
 gPzEfJ/hMu2mpqdwQ6huG6PtOe7Ar6mt1T/BT2VCuwq3fTVnLaoGb4AO9KSsaMBieOiU
 76GLhUvOc5NrdxbzeE1oaFdTjc8EJxvO8t7I/Y03Jf7SLRoaSuypqXp/0Y5qHm2Vo0WC
 piB0NAV3imMVeklmLsN7bKLOyMqUH4LlddY2q1VaeSlxApTYphZgJXDmWAP0AbI6zA11
 MKXGZLTI4gPGK7ne4TwejICWzzVB8ayt/y4ApM3N6KmsUyrIOtYLqQKl6T3vvDS54wOD
 O5aQ==
X-Gm-Message-State: AOAM530V7cJ7LT5zxxK9DvcW12TDhSXTHnie5II5+/7WMtDCUCFVyxgn
 Dc83kQjFls0bZtREJKYgahcXg/1szmf4772j3wo=
X-Google-Smtp-Source: ABdhPJz9ubzcMQ0bhYd3SCX3r+gDygi5EmdKEP3E0TwUheIMmT2Xnf9EqL8wN+RBk/OHqN+D+C5I+SjgyZ/yccDcSDc=
X-Received: by 2002:aca:4f97:: with SMTP id d145mr43764oib.123.1610381306350; 
 Mon, 11 Jan 2021 08:08:26 -0800 (PST)
MIME-Version: 1.0
References: <20210111084640.28500-1-lukas.bulwahn@gmail.com>
 <MW3PR12MB45540B2E1C07A2A666D4A938F9AB0@MW3PR12MB4554.namprd12.prod.outlook.com>
In-Reply-To: <MW3PR12MB45540B2E1C07A2A666D4A938F9AB0@MW3PR12MB4554.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 Jan 2021 11:08:15 -0500
Message-ID: <CADnq5_OswDHBTHrGJUR58WphBvi5sS7uBcCj5uyBVgweA1tHpA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: tweak the kerneldoc for
 active_vblank_irq_count
To: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
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
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Jan 11, 2021 at 10:54 AM Lakha, Bhawanpreet
<Bhawanpreet.Lakha@amd.com> wrote:
>
> [AMD Official Use Only - Internal Distribution Only]
>
>
> Thanks,
>
> Reviewed-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> ________________________________
> From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Sent: January 11, 2021 3:46 AM
> To: Lakha, Bhawanpreet <Bhawanpreet.Lakha@amd.com>; Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
> Cc: dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-doc@vger.kernel.org <linux-doc@vger.kernel.org>; kernel-janitors@vger.kernel.org <kernel-janitors@vger.kernel.org>; Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Subject: [PATCH -next] drm/amd/display: tweak the kerneldoc for active_vblank_irq_count
>
> Commit 71338cb4a7c2 ("drm/amd/display: enable idle optimizations for linux
> (MALL stutter)") adds active_vblank_irq_count to amdgpu_display_manager
> in ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h.
>
> The kerneldoc is incorrectly formatted, and make htmldocs warns:
>
>   ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:
>     340: warning: Incorrect use of kernel-doc format:          * @active_vblank_irq_count
>     379: warning: Function parameter or member 'active_vblank_irq_count' not described in 'amdgpu_display_manager'
>
> Tweak the kerneldoc for active_vblank_irq_count.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies on amdgpu's -next and next-20210111
>
> Bhawanpreet, Nick, please review and ack.
>
> Alex, Christian, please pick on top of the commit above.
>
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index f084e2fc9569..5ee1b766884e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -337,7 +337,7 @@ struct amdgpu_display_manager {
>          const struct gpu_info_soc_bounding_box_v1_0 *soc_bounding_box;
>
>          /**
> -        * @active_vblank_irq_count
> +        * @active_vblank_irq_count:
>           *
>           * number of currently active vblank irqs
>           */
> --
> 2.17.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

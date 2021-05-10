Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A60379897
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 22:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8573189D1D;
	Mon, 10 May 2021 20:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B313389D1D;
 Mon, 10 May 2021 20:53:35 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 u25-20020a0568302319b02902ac3d54c25eso15705503ote.1; 
 Mon, 10 May 2021 13:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e8aGDENpgNashF/y8nRQW6I2Y6zZGucstKVzqHjRFsU=;
 b=vSRh8f/TMD4wVjW+c+f86SHk9GFhpJ+6iMoCKIMHjn113P4xdqZSwfS19Udk/r1yzQ
 Vt1OpNUD36T61Abgo2OnxJon2RFxlH5e7yvcTVLn5XK5UFTqVzo5AX/qxMAWrh0xg1JI
 jipd/HrleT1roAeXnFo+c3N0P4het9NEfc4u8SrOx1jCCCn8bmAJsMs8nMUKuPiMQVeK
 bXoqtpbH7FcaT6mPznQBOQjuZAkTvChafyaX2prLczg9rtKJlFbtPCyAZCzCPEggckl5
 vTbI5Csfqcz78PohiKz/6wjOnCQ8YoG0bn+rQw3JzpYUnYtlwkPc2sbqKWekrgQ4Jlyv
 JmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e8aGDENpgNashF/y8nRQW6I2Y6zZGucstKVzqHjRFsU=;
 b=DytL8Wwjh3qQ20IIudQbpt8z9oiVrPMorYP3Fvte1MIpLgk/QdXJ6dgHuhGT+in+fE
 rnAe5QCiN4aLv9X8xwb4NS6mRUzLMK7S4EW97QbUlbEt149XL/rs6nGKYZmQQUcs/1mX
 xD4cBizKwqi2yiJvSKFztRpeVHqj9x7N+CuCt0Ex1F+BnMUEkjgAi9xq8Q6VXWvJz2A6
 momUoXEHZiXxnKXLQT2q+wthoeoRGHD5IsfU3ASmxWWjeOTH+KfNdxpjgXbDMwe/HqG8
 6p2lQLbmXCT+Jb3uCYnT4ykOW70keIRvONqefO/iB56/yzO6dCGio56BzgjgsaGDXVOd
 BWwQ==
X-Gm-Message-State: AOAM532IOL+HD30QrWkRK3SoZtTazOZMwaeMbXA4FKfW+MPeuFfP6Wny
 1YWSiErm2ykol4sgbF5F4grKojC9cJi1OLk9wgU=
X-Google-Smtp-Source: ABdhPJwCb3vb7rKVDNtAIbgy79+ccr1fhI2rzYQ0RcwwX+h6D4sSoRtQ7PbSiSJUrpVgZ7H2RyvU6sUBTQy/zPGHyOw=
X-Received: by 2002:a9d:51c6:: with SMTP id d6mr16606054oth.311.1620680014960; 
 Mon, 10 May 2021 13:53:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210508181951.129548-1-rouven@czerwinskis.de>
In-Reply-To: <20210508181951.129548-1-rouven@czerwinskis.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 May 2021 16:53:23 -0400
Message-ID: <CADnq5_O0CF43q7BqhytoCp2c-bFSNri5_SEJosLdrWgwVA6-xA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove unused function
 dc_link_perform_link_training
To: Rouven Czerwinski <rouven@czerwinskis.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rouven Czerwinski <r.czerwinski@pengutronix.de>,
 Sascha Hauer <kernel@pengutronix.de>, Leo Li <sunpeng.li@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Sun, May 9, 2021 at 11:42 AM Rouven Czerwinski <rouven@czerwinskis.de> wrote:
>
> This function is not used anywhere, remove it. It was added in
> 40dd6bd376a4 ("drm/amd/display: Linux Set/Read link rate and lane count
> through debugfs") and moved in fe798de53a7a ("drm/amd/display: Move link
> functions from dc to dc_link"), but a user is missing.
>
> Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c | 13 -------------
>  drivers/gpu/drm/amd/display/dc/dc_link.h      |  3 ---
>  2 files changed, 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> index 3fb0cebd6938..55c5cf2264b3 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> @@ -3553,19 +3553,6 @@ void dc_link_set_drive_settings(struct dc *dc,
>         dc_link_dp_set_drive_settings(dc->links[i], lt_settings);
>  }
>
> -void dc_link_perform_link_training(struct dc *dc,
> -                                  struct dc_link_settings *link_setting,
> -                                  bool skip_video_pattern)
> -{
> -       int i;
> -
> -       for (i = 0; i < dc->link_count; i++)
> -               dc_link_dp_perform_link_training(
> -                       dc->links[i],
> -                       link_setting,
> -                       skip_video_pattern);
> -}
> -
>  void dc_link_set_preferred_link_settings(struct dc *dc,
>                                          struct dc_link_settings *link_setting,
>                                          struct dc_link *link)
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_link.h b/drivers/gpu/drm/amd/display/dc/dc_link.h
> index fc5622ffec3d..45c927cd27ab 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_link.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc_link.h
> @@ -363,9 +363,6 @@ bool dc_link_is_hdcp22(struct dc_link *link, enum signal_type signal);
>  void dc_link_set_drive_settings(struct dc *dc,
>                                 struct link_training_settings *lt_settings,
>                                 const struct dc_link *link);
> -void dc_link_perform_link_training(struct dc *dc,
> -                                  struct dc_link_settings *link_setting,
> -                                  bool skip_video_pattern);
>  void dc_link_set_preferred_link_settings(struct dc *dc,
>                                          struct dc_link_settings *link_setting,
>                                          struct dc_link *link);
> --
> 2.31.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

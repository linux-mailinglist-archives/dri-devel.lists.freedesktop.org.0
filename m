Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5664BA6D8
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 18:17:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C01410EC45;
	Thu, 17 Feb 2022 17:17:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9C510EC0F;
 Thu, 17 Feb 2022 17:17:22 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id ay7so299877oib.8;
 Thu, 17 Feb 2022 09:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k9zgQPfz8LOJwvyN9TkCqdRl9MbRaNDX/aR5wunJ990=;
 b=DINAnzkZ3yxrbaFtDAYZmhpuXrR/mzBHe+vr2DEiBG3ftwzLyGNCDwNo0aWdundMlY
 sYYPRo2ua/mUlkwsglmxpqxr04T8gzaIFbZPVILJZWFtt6KG8gOjF3ltKVAs7NB4Ll5A
 EYztNyGCg/NYX3KCvFPleeQ8mjTULOIut+sofWlAJbUmSJoGUrcL1hBg30XDPTzG2P4w
 UWMCShLbWEJwlle7OziBionFS3Twi3vfDUcs+1sPf0IUcWblXibpCNNarLcSJGdhlNIm
 72+weM6Yxvsi1mB0VDx+GRhGhoxE3g+vEl5TjBcOqh2X+IF/XQmtQZkwcqnFb9FB84W5
 fZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k9zgQPfz8LOJwvyN9TkCqdRl9MbRaNDX/aR5wunJ990=;
 b=w7CQUZMVahWVKgw4cETluO0BREUiL9W8XLYtJCJ93Q59NIXsaKl/PVmOmdAOmhWRpg
 lRhWRlElnJxn7gQr6mGyP/B9DAPeXmJkfWJ4QIkys3p0Qlwg+FOdQKiYf5utHsI7XqI7
 vtcOP7eIntXfuYQ30t9jrR/CQLmkUyPWSF1uO+LRwwFRA4iBAkP5nhItI8jRM3TCDRKG
 rm6HhqOJS9Kf4HLWEKym6z7hBh04X8acn6381ldKWL/3KHzLg1WrbqB4klOEGGLIbV77
 VLwJYLb9Zc9mmkAqB+mO9u9aDljmhcFkAh+2h5h4IXv187/ecyq9UBPbcdzTj1a6BPb7
 UzhQ==
X-Gm-Message-State: AOAM531I5y65js+svss22cq2jfHB25YeSMXXQgeBdlW5YdtPV6euNKdK
 j5w0VpThJiwKPw5UbjlDDwpgn9hJVwOFjI6lPM0=
X-Google-Smtp-Source: ABdhPJw6jj/QGKAkol2tdthTwTYyyoP4CDqrp37TKDAO46tPjdL6fNFaDwTVUFznUtAy4H33vyaax1MFxyQNLygI+KE=
X-Received: by 2002:a05:6808:f8b:b0:2ce:6ee7:2c99 with SMTP id
 o11-20020a0568080f8b00b002ce6ee72c99mr3309777oiw.199.1645118241433; Thu, 17
 Feb 2022 09:17:21 -0800 (PST)
MIME-Version: 1.0
References: <20220217164110.3258269-1-trix@redhat.com>
In-Reply-To: <20220217164110.3258269-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 17 Feb 2022 12:17:10 -0500
Message-ID: <CADnq5_OasHZ=P_tkZrSSA87HACHJhQ49oMGSdFxzQ5g7GhjWMw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: fix typo in setting enum value
To: Tom Rix <trix@redhat.com>
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
Cc: llvm@lists.linux.dev, "Kim, Jonathan" <jonathan.kim@amd.com>,
 Dave Airlie <airlied@linux.ie>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 xinhui pan <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Nathan Chancellor <nathan@kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nathan just sent out the same patch and I already applied it.  Thanks!

Alex

On Thu, Feb 17, 2022 at 11:41 AM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> Clang build fails with
> kfd_packet_manager_v9.c:267:3: error: implicit conversion
>   from enumeration type 'enum mes_map_queues_extended_engine_sel_enum'
>   to different enumeration type
>   'enum mes_unmap_queues_extended_engine_sel_enum'
>    extended_engine_sel__mes_map_queues__sdma0_to_7_sel :
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> This looks like a typo, the function is _unmap_, the enum
> extended_engine_sel__mes_map_queues__sdma0_to_7_sel  is _map_.
> To match the packet->bitfields2.extended_engine_set type
> it should be extended_engine_sel__mes_unmap_queues__sdma0_to_7_sel.
>
> Fixes: 009e9a158505 ("drm/amdkfd: navi2x requires extended engines to map and unmap sdma queues")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> index 806a03566a24..18250845a989 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> @@ -264,7 +264,7 @@ static int pm_unmap_queues_v9(struct packet_manager *pm, uint32_t *buffer,
>                                         sizeof(struct pm4_mes_unmap_queues));
>
>         packet->bitfields2.extended_engine_sel = pm_use_ext_eng(pm->dqm->dev) ?
> -               extended_engine_sel__mes_map_queues__sdma0_to_7_sel :
> +               extended_engine_sel__mes_unmap_queues__sdma0_to_7_sel :
>                 extended_engine_sel__mes_unmap_queues__legacy_engine_sel;
>
>         packet->bitfields2.engine_sel =
> --
> 2.26.3
>

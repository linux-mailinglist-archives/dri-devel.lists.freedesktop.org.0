Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 144392CAB15
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 19:53:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D7E6E87A;
	Tue,  1 Dec 2020 18:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F0A6E87A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 18:53:31 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id m62so1500820vsd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Dec 2020 10:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jHUqYe4pBvdasiXA3KcLGZAJT7wPKolVE5VMV2eImFs=;
 b=Xb7qSc4KbqsiAXnwDeFvAq3UpmILy6C+PBhP+Id57hp+Azy3puzF81O1c8+l6ArVCJ
 3lklkuNxZRBsiqEqU67YI6cSItetTmUzhUrv0QvQPBIAYVZIlLe1OemwJK4hKREsUnGR
 GuPrtBBPyJrjCu/qKxuxQKkqL7dHM4PNyy+c8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jHUqYe4pBvdasiXA3KcLGZAJT7wPKolVE5VMV2eImFs=;
 b=QbBN6uIKeNeSwIoBzAM9HQ+pCZZ98afx/uRkK/gc+8bVwDC5hmqpdwT2b/SclTo+FJ
 kiY563/rnCpK0IunixDi5Ie6bsBZJhfXX/CXcgEjOXRwJn+slC9lC2Hn9ljtgiV5NKw8
 YI4QCIeCT0w4MUUbI/36ZFZUp0rPF2B3Nhpp2qOvgQ2YqzJo69bRjNCVmcEZy4gXABco
 mHJKzEhrn5tJVKsJeqnigi76NLQZcqQz5TbroP/GSo/8Ai30lSbMBs3mw1numj7rQAOn
 uRr1JG9oKrpfQM+UEtSJc2szz7V6XcfE2M6x16CCfZIEt61qAFTYlNO/0KbeDFaNGhWF
 9RjQ==
X-Gm-Message-State: AOAM530tgzyAEKWAIWLjSotE9r8g9vBaetrpFDedcELFLwvELayidy5b
 H9bR+au77gYkzBgu1cjM5QfsGFhLazhy5A==
X-Google-Smtp-Source: ABdhPJzdjGkZyrCdWwyRtkjBZYVyyrFmmhl2bVsEqwkejwqbECwuMf6iwyw3mCd9qWP5skyOcpjfiw==
X-Received: by 2002:a67:eb13:: with SMTP id a19mr4553017vso.32.1606848809839; 
 Tue, 01 Dec 2020 10:53:29 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com.
 [209.85.217.42])
 by smtp.gmail.com with ESMTPSA id c21sm33888vsh.31.2020.12.01.10.53.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 10:53:29 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id x4so1489991vsp.7
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Dec 2020 10:53:29 -0800 (PST)
X-Received: by 2002:a67:6917:: with SMTP id e23mr2525997vsc.37.1606848808625; 
 Tue, 01 Dec 2020 10:53:28 -0800 (PST)
MIME-Version: 1.0
References: <20201130182643.GA1497637@ravnborg.org>
In-Reply-To: <20201130182643.GA1497637@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 1 Dec 2020 10:53:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ur+dENMpHHN7b=fahhtMFZ_BCDcr7cTDyPzZgn7rqbMw@mail.gmail.com>
Message-ID: <CAD=FV=Ur+dENMpHHN7b=fahhtMFZ_BCDcr7cTDyPzZgn7rqbMw@mail.gmail.com>
Subject: Re: [PATCH] drm: panel: add flags to BOE NV110WTM-N61
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Nov 30, 2020 at 10:26 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> When applying a patch to add the BOE NV110WTM-N61 panel I forgot
> to add the changes that added flags to drm_display_mode.

Sorry, I didn't mean to make more work for you!


> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Fixes: a96ee0f6b58d ("drm: panel: simple: Add BOE NV110WTM-N61")
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 216cde33b5c4..2d093b5a513c 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1367,6 +1367,7 @@ static const struct drm_display_mode boe_nv101wxmn51_modes[] = {
>                 .vsync_start = 800 + 3,
>                 .vsync_end = 800 + 3 + 5,
>                 .vtotal = 800 + 3 + 5 + 24,
> +               .flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
>         },
>         {
>                 .clock = 57500,
> @@ -1378,6 +1379,7 @@ static const struct drm_display_mode boe_nv101wxmn51_modes[] = {
>                 .vsync_start = 800 + 3,
>                 .vsync_end = 800 + 3 + 5,
>                 .vtotal = 800 + 3 + 5 + 24,
> +               .flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,

I think you're off by 10 and a letter.

The subject talks about:
  NV110WTM-N61

You're modifying the structs for:
  NV101WXM-N51

I'm happy to post this if it's helpful to you, or I can review a v2
from you.  :-)

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

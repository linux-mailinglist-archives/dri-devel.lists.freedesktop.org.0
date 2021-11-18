Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A86455EBB
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 15:53:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D4F6E97A;
	Thu, 18 Nov 2021 14:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DF06E96B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 14:53:54 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso8444791pji.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 06:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=00/NWBiXDMIwTA2wxI59iuasKKaexVRD/MgwjjpMNtY=;
 b=PQKOVFgLa4dXcJbx1KgwRmt+rTPDI0UAmCo43eoJDn0dXmS3OERtXNkwvUSDwtsexL
 4gZOC6lI9TeLsiecL0ABkcWatE90NTwp4ISl6tDiXrScVr/PcZkS4OrOr22pCgyODRaM
 sb4pPU3jkGOr0wq5XHOdRmNZ6tcbz6bA2k2jXclwOsG7AiEfvd8V3b4XWtRVpDgXdlmG
 2ju0aNbMaixRvYx3/MdF3qM9rN4d3X6J/kz0hTvTW39sgWvpoEpfGzHFixnJ/MtUBXKa
 uGCr54Q37jvDomNAzMZc8dv3z7zzzcGtm6q7AzHFEyRxEf5QjDKrO6gc7X99qaGbJA7F
 nHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=00/NWBiXDMIwTA2wxI59iuasKKaexVRD/MgwjjpMNtY=;
 b=V3ufk3ihPkax3O+eQEv/rcvoVAtI0C0D2cH9+reGezKblIXVJR8LZGP5iQZz1AC4lr
 cjOCq8dFSzDBS2KyTQKubsCgfh2XaOiu8QLqTwXkVXak1jckWAizliJ/XWm11rS3nodD
 dPwiKheMUROEhqfBtCZr/HlufArZZ2tcbtrsBzQKXKxjo1tqa3icePem+8VAdLItwdKa
 JUn0Iu0FA59x7LnU3toeWu4blp1pvPdMYUsHxlLlBxNzxxibhTJbcy7PunTVDOaiotTS
 Uw8eNjGGHkZWdAVKabKlEESdERNULwnHGUac2eL39ctGA+IsoCAcLHcKmTD26+RW5s7S
 dpDg==
X-Gm-Message-State: AOAM533BOUVLR6dm3sp5mqZg0v7rnpBi1s7XQ1LDFGfXvGbAa6azF1cj
 USzu9qw8B0Wva/0+jIewZ87oiA2efb2YvemIEDRpBQ==
X-Google-Smtp-Source: ABdhPJy/yXtGCmRA0aJzW6HarUsG1nwCHbSHk0dZn1p5TvpTB66YkOcGNLY8thYYlrjSODVvyDJjR9SOcaB75LGsl9U=
X-Received: by 2002:a17:903:2443:b0:142:1e92:1d19 with SMTP id
 l3-20020a170903244300b001421e921d19mr66821454pls.24.1637247234084; Thu, 18
 Nov 2021 06:53:54 -0800 (PST)
MIME-Version: 1.0
References: <20211112112433.942075-1-hsinyi@chromium.org>
In-Reply-To: <20211112112433.942075-1-hsinyi@chromium.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 18 Nov 2021 15:53:42 +0100
Message-ID: <CAG3jFyvznd2FD7=fxkEYrck0P3iu4qyKUc326yRHN1Wf90TRXw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Fix edid_read break case in
 sp_tx_edid_read()
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Sam Ravnborg <sam@ravnborg.org>,
 Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Hsin-Yi,

Thanks for catching this.

checkpatch --strict is throwing an error for this patch. With that,
feel free to add my r-b.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Fri, 12 Nov 2021 at 12:24, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> edid_read() was assumed to return 0 on success. After
> 7f16d0f3b8e2("drm/bridge: anx7625: Propagate errors from sp_tx_rst_aux()"),
> the function can return >= 0 for successful case. Fix the g_edid_break
> condition in sp_tx_edid_read().
>
> Fixes: 7f16d0f3b8e2("drm/bridge: anx7625: Propagate errors from sp_tx_rst_aux()")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 1a871f6b6822ee..392203b576042b 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -826,7 +826,7 @@ static int sp_tx_edid_read(struct anx7625_data *ctx,
>                                 g_edid_break = edid_read(ctx, offset,
>                                                          pblock_buf);
>
> -                               if (g_edid_break)
> +                               if (g_edid_break < 0)
>                                         break;
>
>                                 memcpy(&pedid_blocks_buf[offset],
> --
> 2.34.0.rc1.387.gb447b232ab-goog
>

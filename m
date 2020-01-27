Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C4C14AB0A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 21:13:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765F16E9EB;
	Mon, 27 Jan 2020 20:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58136E9EB;
 Mon, 27 Jan 2020 20:13:51 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t14so8516279wmi.5;
 Mon, 27 Jan 2020 12:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jZqAnZBwcnhyQqDJBqIeAARnv2kOsFYQ9h/65oqYJNc=;
 b=I9ggXdNplkom7TI2aomDIxCSwPVq7O2O3ylck0bFQYFgKX5Vk6rnte7i658A8xV6z0
 wmiUySOv2wK0y7w633siiKEx6JOAGevj/jLyUkyCaCKU5AZmXrV6xXAnm3D+Z1vTwkuH
 UiunR55xaUpY9a0X5F1X48ixkgOFIDbHN7D3cVoHwDpEJSTp6FclcP+I9EE+XR3HYUiL
 ij8gh2fw7bC7+8Vp72l6dz2QIhGspWgdMyKMT88SANIdx+GDNFtERcgVw+bm3gQdZv2R
 InWKYwhh2Muv/Bb/H63GoWuINchdphyKqPERFDZsMzhoH7mdmXVmC1rW/HuFvEYtjJPE
 eO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jZqAnZBwcnhyQqDJBqIeAARnv2kOsFYQ9h/65oqYJNc=;
 b=gwTkglcKrwggGR9W0keiAK9Zwn2c6Ra1sEYakrpiSYwsYUmFoA62xb9Giw68rQqeLR
 W93QDl8lbxw+PK35mnW2GEQDPBh0KAC05A9rLsGXjQfC/MzCbwOUroxCvDxaULMUWW49
 GBFOtREBuw19/L/WewrdCm/h7SRXVtSylAO/svZ6XWDfymWaXh0VwU/bCXx/MRy9lXu2
 ZmsLYCeIMzOp+e22ZmHvL3vOHpEO6DeqvIsjE5CuqBGL2rDvFHJiVqoTDCnaeGn+9nir
 Pv8UcHbwTP/tZRhh1JtTrsvtDTcq3g//zRuXyF6kv7gb8c8B/LeVxzA+mIfPeChUGypD
 0X4w==
X-Gm-Message-State: APjAAAWUo9aSNXjqu51Z4cpEE+wsnQc6X91vSBhS279pHICcw2800uiE
 SHlpdnW8sDkqr92ukZwjXlWavyh1XefVPgiOOhc=
X-Google-Smtp-Source: APXvYqwlN+rBTe7uyFI9aWzv0Aywb7BH112o8q2fCzdWoixSvVh7yVuI2k81MSNszj3fsA84LxG5T+1k+CxY8qX0scs=
X-Received: by 2002:a1c:9a56:: with SMTP id c83mr372759wme.79.1580156030302;
 Mon, 27 Jan 2020 12:13:50 -0800 (PST)
MIME-Version: 1.0
References: <20200117133305.113280-1-colin.king@canonical.com>
 <5E21C422.6040708@bfs.de>
In-Reply-To: <5E21C422.6040708@bfs.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Jan 2020 15:13:38 -0500
Message-ID: <CADnq5_NEgC5u0t_m+nWiOVTptFwrxeGKVpQwegF9s-51tjhWEQ@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: fix for-loop with incorrectly
 sized loop counter
To: walter harms <wharms@bfs.de>
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
Cc: Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Wenjing Liu <Wenjing.Liu@amd.com>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin King <colin.king@canonical.com>, Nikola Cornij <Nikola.Cornij@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied with Walter's comment included.

Thanks!

Alex

On Fri, Jan 17, 2020 at 9:45 AM walter harms <wharms@bfs.de> wrote:
>
>
>
> Am 17.01.2020 14:33, schrieb Colin King:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > A for-loop is iterating from 0 up to 1000 however the loop variable count
> > is a u8 and hence not large enough.  Fix this by making count an int.
> > Also remove the redundant initialization of count since this is never used
> > and add { } on the loop statement make the loop block clearer.
> >
> > Addresses-Coverity: ("Operands don't affect result")
> > Fixes: ed581a0ace44 ("drm/amd/display: wait for update when setting dpg test pattern")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> > index 6ab298c65247..cbed738a4246 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> > @@ -3680,7 +3680,7 @@ static void set_crtc_test_pattern(struct dc_link *link,
> >                       struct pipe_ctx *odm_pipe;
> >                       enum controller_dp_color_space controller_color_space;
> >                       int opp_cnt = 1;
> > -                     uint8_t count = 0;
> > +                     int count;
> >
> >                       switch (test_pattern_color_space) {
> >                       case DP_TEST_PATTERN_COLOR_SPACE_RGB:
> > @@ -3725,11 +3725,12 @@ static void set_crtc_test_pattern(struct dc_link *link,
> >                               width,
> >                               height);
> >                       /* wait for dpg to blank pixel data with test pattern */
> > -                     for (count = 0; count < 1000; count++)
> > +                     for (count = 0; count < 1000; count++) {
> >                               if (opp->funcs->dpg_is_blanked(opp))
> >                                       break;
> >                               else
> >                                       udelay(100);
> > +                     }
> >               }
> >       }
> >       break;
>
> Nitpick:
> the else is useless you can remove it.
>
> re,
>  wh
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5291D2ACB27
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 03:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC995892A1;
	Tue, 10 Nov 2020 02:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3461E892A1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 02:33:00 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id s135so2386100vkh.6
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 18:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o+lVk1WHisUKZ0ebgNE5tDXFPu93D1B4Zca284NgzcQ=;
 b=GJRClqbYC/ueiUBw9YuKsjXkEw63X9r4tK7+iLGVFKH/StPRDxy2T3Mr/Ka7YlvFeC
 TXCwP0wXzGyKi/10XaLQVzNbZkq4EdB5IuysFAeYRRJ+P7vRXQ56Nqi/P6mdvFX8xlb1
 X+c/OSEYEH3f/FrRh8oiyAcHyweOhOTHyGBZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o+lVk1WHisUKZ0ebgNE5tDXFPu93D1B4Zca284NgzcQ=;
 b=qHiEAZEVyNChnVGAg2BbXUz+dXfZTmapgbZHpjL6UsAe9EW2U3BB6JVp16GQicdFky
 xZ+XK07ghzgkBNIAQ7vF3V8ABVTLox7hYBp7YBAB1sfkjeF2qyiyy7WZXWNyAZmw++tD
 PkZGweziyCyFQzqjY+UzwrzMcdNOhg/dglU2ExjHgMk2Mu51sx6+9MYOH/h2e7ReK3Yo
 w4VFQHaPh3nAWCcaiY3s+1LOUiO4AI8EZ1i440lgAFCs0fIpAayMsU4nWDOKnVGTPsEy
 AdImN3JGUE0BCRU+cVqdsZyo5cpqbq1ueDxfNF0nZLONszNBg3B6THPQCaevP3mDqUT7
 LJIg==
X-Gm-Message-State: AOAM531uPQY5DK/gfDpy4tCzEKCpsz+xclrmFWc9dr9UpSl628o2V5sm
 QJz2QonUNSNKfmY1dBiLtRWAwbOLUM13gg==
X-Google-Smtp-Source: ABdhPJwErOZfbTjYKg4kTc4gA45iNSgoY+myYvDCJGjRm15BLH6lqfZezJuLwSXQiMaafDqnpt+FZw==
X-Received: by 2002:a1f:9f05:: with SMTP id i5mr9134244vke.12.1604975578929;
 Mon, 09 Nov 2020 18:32:58 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com.
 [209.85.217.45])
 by smtp.gmail.com with ESMTPSA id w190sm1469360vke.7.2020.11.09.18.32.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2020 18:32:58 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id r14so6182170vsa.13
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 18:32:58 -0800 (PST)
X-Received: by 2002:a67:1e01:: with SMTP id e1mr10457712vse.49.1604975577696; 
 Mon, 09 Nov 2020 18:32:57 -0800 (PST)
MIME-Version: 1.0
References: <20201109170018.v4.1.Icaa86f0a4ca45a9a7184da4bc63386b29792d613@changeid>
 <20201109170018.v4.4.I71b2118dfc00fd7b43b02d28e7b890081c2acfa2@changeid>
In-Reply-To: <20201109170018.v4.4.I71b2118dfc00fd7b43b02d28e7b890081c2acfa2@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Nov 2020 18:32:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UPkuJ5E2sCQeozNR3CO+LZW=DW9h77vfooeiSMqGnYpA@mail.gmail.com>
Message-ID: <CAD=FV=UPkuJ5E2sCQeozNR3CO+LZW=DW9h77vfooeiSMqGnYpA@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] drm: panel: simple: Add BOE NV110WTM-N61
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Nov 9, 2020 at 5:01 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> Add support for the BOE NV110WTM-N61 panel.  The EDID lists two modes
> (one for 60 Hz refresh rate and one for 40 Hz), so we'll list both of
> them here.
>
> Note that the panel datasheet requires 80 ms between HPD asserting and
> the backlight power being turned on.  We'll use the new timing
> constraints structure to do this cleanly.  This assumes that the
> backlight will be enabled _after_ the panel enable finishes.  This is
> how it works today and seems a sane assumption.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v4:
> - Rebased atop changes in earlier patches.
>
> Changes in v2:
> - Adjust for shorter names in patch #1.
>
>  drivers/gpu/drm/panel/panel-simple.c | 46 ++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index a54f42cb3adc..9bb723696e94 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1396,6 +1396,49 @@ static const struct panel_desc boe_nv101wxmn51 = {
>         },
>  };
>
> +static const struct drm_display_mode boe_nv110wtm_n61_modes[] = {
> +       {
> +               .clock = 207800,
> +               .hdisplay = 2160,
> +               .hsync_start = 2160 + 48,
> +               .hsync_end = 2160 + 48 + 32,
> +               .htotal = 2160 + 48 + 32 + 100,
> +               .vdisplay = 1440,
> +               .vsync_start = 1440 + 3,
> +               .vsync_end = 1440 + 3 + 6,
> +               .vtotal = 1440 + 3 + 6 + 31,
> +       },
> +       {
> +               .clock = 138500,
> +               .hdisplay = 2160,
> +               .hsync_start = 2160 + 48,
> +               .hsync_end = 2160 + 48 + 32,
> +               .htotal = 2160 + 48 + 32 + 100,
> +               .vdisplay = 1440,
> +               .vsync_start = 1440 + 3,
> +               .vsync_end = 1440 + 3 + 6,
> +               .vtotal = 1440 + 3 + 6 + 31,
> +       },

I can do it as a follow-up patch if there is no other reason to spin,
but I realized that I forgot to add:

.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,

...to both the 40 and 60 Hz modes to make it match what's in the EDID.
I'm also OK w/ it getting added by a maintainer when this lands if
that makes sense.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

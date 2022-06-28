Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A07955E586
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 16:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6BC10FCCD;
	Tue, 28 Jun 2022 14:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF6710FCCE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 14:52:48 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id lw20so26336689ejb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 07:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zLp244HRKuXK443MblJOFX9TiLKY+sMNN7lfWRmJzw4=;
 b=Lk7xi3t/LB2zXUPx3APLw1OdwcapOiHYlZJA4tOn/NbuDoTBbMcIduKURJqTEBrkoj
 YYZ4czzT6ihRD/blwTjeq6YA9LXg+DB/+iymb+sPgeQRaIxaptCod570AG3D80pBU9e4
 5+8iG89M5uxSJJ+dv/Ns8XdtFg+q/u0L7J170=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zLp244HRKuXK443MblJOFX9TiLKY+sMNN7lfWRmJzw4=;
 b=SFG4HEk6jT7C005mkVN0xpaXRjKABUTywaAfcBM/Z3Y5ESuQRvgSwaGv5nL+Vwrpk9
 UQUaxOfWHU+GL5QF29OCf38/9+uTtEjupEW84I1XqqvZCXav+EzmWuGrJV2bm+dCcfMA
 sphlxp0rbkHsCrCckmhbkytf/Ds6j/jOXWI1BfJHgXmyM9GE2/jbz8FVPjYqbulRE98n
 ss3jb97pQSl65vY7oYlpU1G1QWBR+mItWCAcREulSkLchnzg7hVmKJtU2M46ddI8rHqR
 rLgWUXwBgg48ndPI/5ZMXr1iCssPvEezjY6N2H0vjEIgG5WLnNVCfUVByoqlJ4Wv2tsJ
 8vig==
X-Gm-Message-State: AJIora9CQe+WLgK9d78SAaySDGNrjcs4uWaWe2uJEmgeJmcRak3dMsOF
 zoY6mnFExfYCaY1/lwqdewXUQAeL3FMzeoGZ
X-Google-Smtp-Source: AGRyM1szTFnfxHWoIcOans1aHJFKtVWQpxHo12ZIclym41zmQEJ1AYNYL5X5sjEiX777xCMAKhIQ6A==
X-Received: by 2002:a17:907:7f09:b0:726:2ba7:21c2 with SMTP id
 qf9-20020a1709077f0900b007262ba721c2mr18364475ejc.744.1656427966302; 
 Tue, 28 Jun 2022 07:52:46 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53]) by smtp.gmail.com with ESMTPSA id
 fd5-20020a056402388500b00436f3107bdasm8823544edb.38.2022.06.28.07.52.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 07:52:44 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id i1so13585755wrb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 07:52:43 -0700 (PDT)
X-Received: by 2002:a5d:4046:0:b0:21a:3a12:239e with SMTP id
 w6-20020a5d4046000000b0021a3a12239emr18136405wrp.138.1656427963334; Tue, 28
 Jun 2022 07:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220628085949.2147920-1-rexnie3@gmail.com>
In-Reply-To: <20220628085949.2147920-1-rexnie3@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 28 Jun 2022 07:52:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U8oR-L7XRJH7qVG2p2m1J8obnQSTzA2moZZ8Kmy2SzFw@mail.gmail.com>
Message-ID: <CAD=FV=U8oR-L7XRJH7qVG2p2m1J8obnQSTzA2moZZ8Kmy2SzFw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/panel-edp: Add eDP innolux panel support
To: Rex Nie <rexnie3@gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sandeep Panda <spanda@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jun 28, 2022 at 2:00 AM Rex Nie <rexnie3@gmail.com> wrote:
>
> Add support for the 14" innolux,n140hca-eac eDP panel.
>
> Signed-off-by: Rex Nie <rexnie3@gmail.com>
> Acked-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 3626469c4cc2..2a8fcdffe80c 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1355,6 +1355,29 @@ static const struct panel_desc innolux_n125hce_gn1 = {
>         },
>  };
>
> +static const struct display_timing innolux_n140hca_eac_timing = {
> +       .pixelclock = { 72600000, 76420000, 80240000 },
> +       .hactive = { 1920, 1920, 1920 },
> +       .hfront_porch = { 80, 80, 80 },
> +       .hback_porch = { 190, 190, 190 },
> +       .hsync_len = { 60, 60, 60 },
> +       .vactive = { 1080, 1080, 1080 },
> +       .vfront_porch = { 6, 6, 6 },
> +       .vback_porch = { 38, 38, 38 },
> +       .vsync_len = { 8, 8, 8 },
> +       .flags = DISPLAY_FLAGS_VSYNC_LOW | DISPLAY_FLAGS_HSYNC_LOW,
> +};

A few questions:

1. If I'm doing my math right, you're saying that this panel runs at
30 Hz refresh rate. Truly? While I won't dismiss that as impossible,
it feels unlikely. Specifically:

In [2]: 72600000 / ((1920 + 80 + 190 + 60) * (1080 + 6 + 38 + 8))
Out[2]: 28.50412249705536

In [3]: 80240000 / ((1920 + 80 + 190 + 60) * (1080 + 6 + 38 + 8))
Out[3]: 31.503729878288183

NOTE: I managed to dig up a datasheet for this panel and the datasheet
I have shows it as a 60 Hz refresh rate panel.


2. You're using the "struct display_timing" here instead of the
"struct drm_display_mode". That can be OK, but can I ask why exactly?


3. Are you sure you need to add this entry? Moving forward I'm trying
to encourage people to use the generic "edp-panel". Mostly you'd want
to add a hardcoded panel here if:

a) Devices have already shipped using hardcoded timings and we don't
want to risk breaking something in the field with "edp-panel".

b) You're trying to support some eDP controller that can't handle the
generic "edp-panel". In this case I'm OK with landing changes but I'd
strongly encourage you to update the controller to handle things.


> +static const struct panel_desc innolux_n140hca_eac = {
> +       .timings = &innolux_n140hca_eac_timing,
> +       .num_timings = 1,
> +       .bpc = 6,

Is it really 6 bpc? The datasheet I dug up claims 16777216 colors
which would be 8 bpc. The EDID from that same datasheet also claims 8
bpc.


> +       .size = {
> +               .width = 309,
> +               .height = 174,
> +       },

Where are your delays? I know in old code these were hard to figure
out from the panel spec, but the kernel doc comments now translate it
into standard eDP terminology so this should be trivially easy for you
to provide.

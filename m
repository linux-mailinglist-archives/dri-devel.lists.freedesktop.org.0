Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD3157A9EE
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 00:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919381135EC;
	Tue, 19 Jul 2022 22:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AEE11B9FF
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 22:40:48 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id mf4so29926638ejc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 15:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=36+j+A/1DWKJeG29CSuGqRzbVrNZKvXAm48SwcsWC9Q=;
 b=T5hPpPBFqoMWgNsSaumUPSHTwyol2HuOWiJK643KpafdASmbF8lXU4ViBJzhahA7yA
 +bpMp5/lj+8od+3UcpqCoBRr4kzdcYgUFfUKAdGieFFRzzn1Huh5bMalP5kCjpWNDbYS
 7bxfHHy9eCswbXZushJVIzlE9DpUXplbVqMzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=36+j+A/1DWKJeG29CSuGqRzbVrNZKvXAm48SwcsWC9Q=;
 b=hpCZ6jI2js7iNKbDWX+50xgzNVKX8oLY3uxwyigZyaBvwih6rFb0AX2GSDh3kRcXLC
 mrAIqcti/G9NURsxmK8sZsF+E5sYypXiQ02uNzuDEApucSNAAgN1dFb9TMhdrwNkyefI
 7bEsqFFhutaS9Di1b+RueFysWA/f5gOWxPQlwVPN481IePi0qtTab48JbC5IomoMHNnj
 Zt+qrzm+YClVWF70nruWgJB1VMF56N8eu4sYgKBGMrbe++3g5RUtqkefVIwZfwEnXGkF
 5nvfEJidVpQyiU4xaujmVFr3lJ3g/6cZ6XGw+FVHjC6QsUMLu+ZNTRDTsmYh3eiZhNcO
 7j3g==
X-Gm-Message-State: AJIora9R5Bg1LE/VqvDCGkdS8MlYaEhmwKowcA6YDmKfgWaVplBv6/LN
 +EhJioOTLGHD6ToavDD367JPhXjSC+EUk78TYzE=
X-Google-Smtp-Source: AGRyM1vuVZ6nUywLrEvxrWSl5pMeUGiL+Tgr3W0DCPbNE+ASBA25SVcfNb63wNiDqqCBsDK6T+xz7A==
X-Received: by 2002:a17:907:2718:b0:72b:6b65:37dc with SMTP id
 w24-20020a170907271800b0072b6b6537dcmr32581815ejk.425.1658270446534; 
 Tue, 19 Jul 2022 15:40:46 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47]) by smtp.gmail.com with ESMTPSA id
 lc13-20020a170906dfed00b00703671ebe65sm7060089ejc.198.2022.07.19.15.40.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 15:40:45 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id h17so23745856wrx.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 15:40:45 -0700 (PDT)
X-Received: by 2002:a5d:5889:0:b0:21d:bccd:38e3 with SMTP id
 n9-20020a5d5889000000b0021dbccd38e3mr27718830wrf.659.1658270445458; Tue, 19
 Jul 2022 15:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220719203857.1488831-1-nfraprado@collabora.com>
 <20220719203857.1488831-2-nfraprado@collabora.com>
In-Reply-To: <20220719203857.1488831-2-nfraprado@collabora.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 19 Jul 2022 15:40:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XgWAMXGAfBw9dBoKB6Y6_AAT6ccAtLg=jy3qLa2HOxBA@mail.gmail.com>
Message-ID: <CAD=FV=XgWAMXGAfBw9dBoKB6Y6_AAT6ccAtLg=jy3qLa2HOxBA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/panel-edp: Add panel entry for R140NWF5 RH
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jul 19, 2022 at 1:39 PM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Add panel identification entry for the IVO R140NWF5 RH (product ID:
> 0x057d) panel.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>
> ---
> The comments on the driver indicate that the T3 timing should be set on
> hpd_absent, while hpd_reliable would have a shorter time just while the
> HPD line stabilizes on low after power is supplied.

Right. Ideally hpd_reliable is 0 unless you've got a badly-designed panel.


> But can we really assume that the HPD line will be reliable at all
> before the DDIC is done booting up, at which point the HPD line is
> brought up? IOW, shouldn't we always delay T3 (by setting hpd_reliable =
=3D
> T3), since only then we're really sure that the DDIC is done setting up
> and the HPD line is reliable?

If the panel is hooked up properly, then the HPD pin should be pulled
low at the start and then should only go high after the panel is ready
for us to talk to it, right? So it's not like the DDIC has to boot up
and actively init the state. I would assume that the initial state of
the "HPD output" from the panel's IC would be one of the following:
* A floating input.
* A pulled down input.
* An output driven low.

In any of those cases just adding a pull down on the line would be
enough to ensure that the HPD line is reliable until the panel comes
around and actively drives the line high.

Remember, this is eDP and it's not something that's hot-plugged, so
there's no debouncing involved and in a properly designed system there
should be no time needed for the signal to stabilize. I would also
point out that on the oficial eDP docs the eDP timing diagram doesn't
show the initial state of "HPD" as "unknown". It shows it as low.

Now, that all being said, I have seen at least one panel that glitched
itself at bootup. After you powered it on it would blip its HPD line
high before it had actually finished booting. Then the HPD would go
low again before finally going high after the panel finished booting.
This is the reason for "hpd_reliable".

If you've got a board with a well-designed panel but the hookup
between the panel and the board is wrong (maybe the board is missing a
pulldown on the HPD line?) then you can just set the "no-hpd" property
for your board. That will tell the kernel to just always delay the
"hpd-absent" delay.

> I've set the T3 delay to hpd_absent in this series, following what's
> instructed in the comments, but I'd like to discuss whether we shouldn't
> be setting T3 on hpd_reliable instead, for all panels, to be on the
> safer side.

The way it's specified right now is more flexible, though, isn't it?
This way if you're on a board where the HPD truly _isn't_ stable then
you can just set the "no-hpd" and it will automatically use the
"hpd_absent" delay, right?


>  drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 3626469c4cc2..675d793d925e 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1854,6 +1854,12 @@ static const struct panel_delay delay_100_500_e200=
 =3D {
>         .enable =3D 200,
>  };
>
> +static const struct panel_delay delay_200_500_e200 =3D {
> +       .hpd_absent =3D 200,
> +       .unprepare =3D 500,
> +       .enable =3D 200,
> +};
> +
>  #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id, =
_delay, _name) \
>  { \
>         .name =3D _name, \
> @@ -1882,6 +1888,8 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>
>         EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.delay=
, "N116BCA-EA1"),
>
> +       EDP_PANEL_ENTRY('I', 'V', 'O', 0x057d, &delay_200_500_e200, "R140=
NWF5 RH"),
> +

This looks fine to me:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'm happy to apply this in a day or two assuming you're OK with my
explanation above.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A25A14F4F52
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 03:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE5710EA8A;
	Wed,  6 Apr 2022 01:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0E510EA8A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 01:59:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D307612C5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 01:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3745C385A6
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 01:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649210368;
 bh=pDwgEh6KmeCPgKnTyof6KSyznbNRaJiPPR8oySZr3rc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=capxQEI0O5lXiCZ51wrnI6lHYT0Rwe0rlsse+qJyO3lag9aPOIjkMZJspSuV/naGy
 1Uxm1Z0GsGXU+urhiW6rlMyafUJb6VSxu4BRKPvxuXrBm4fA8V3ukjjo81Ut9/xXOd
 NqEGgjgLUR2xTdDTkMKVuh4Nq5ONoordnW/Xa1YVhQO1xVSpT6MUo60svO97kCkoZs
 DacL3aR+LmTLVHXRN4hOqhjHAz1ty7W8+nPZlJqYT0td+ybhB6RqQNGZO97K334AL+
 uPPVPcYCxJ3aN6qYyuSOxxghrOuFjXEiT0HeaIqepHeEYeJ0ac8egcarB2XiJzC2uv
 yJMy48iqbsXug==
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-df22f50e0cso1446137fac.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 18:59:28 -0700 (PDT)
X-Gm-Message-State: AOAM533jLU19KFvRtmX9dCE9s5ayLBSNOYb2XQsrPHCI8k3hciSZ2KA+
 na3rN4I9LHhQKSaS7Olg4/22N17DeogWbIwLCMY=
X-Google-Smtp-Source: ABdhPJyWss1xlGBkA+PCf/HgdAp6TEkP4sbTxbCSm6ZcXecPsMrAuDs3F6O7hTv2eW1CSEDxRr7c5QC//7WPFwPAPc4=
X-Received: by 2002:a05:6870:ec90:b0:de:33ac:8100 with SMTP id
 eo16-20020a056870ec9000b000de33ac8100mr3008585oab.192.1649210367798; Tue, 05
 Apr 2022 18:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220221095312.3692669-1-o.rempel@pengutronix.de>
 <20220406012348.GE129381@dragon>
In-Reply-To: <20220406012348.GE129381@dragon>
From: Shawn Guo <shawnguo@kernel.org>
Date: Wed, 6 Apr 2022 09:59:17 +0800
X-Gmail-Original-Message-ID: <CAJBJ56+bmpmDYP+PP3NN+CKkJT8Ls-FLeUBxFxwNLqVbbgHbOQ@mail.gmail.com>
Message-ID: <CAJBJ56+bmpmDYP+PP3NN+CKkJT8Ls-FLeUBxFxwNLqVbbgHbOQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] ARM: dts: imx6qdl-vicut1/vicutgo: Set default
 backlight brightness to maximum
To: Oleksij Rempel <o.rempel@pengutronix.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robin van der Gracht <robin@protonic.nl>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 David Jander <david@protonic.nl>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 6, 2022 at 9:23 AM Shawn Guo <shawnguo@kernel.org> wrote:
>
> On Mon, Feb 21, 2022 at 10:53:05AM +0100, Oleksij Rempel wrote:
> > From: David Jander <david@protonic.nl>
> >
> > Recover default behavior of the device and set maximal brightness
> >
> > Signed-off-by: David Jander <david@protonic.nl>
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > ---
> >  arch/arm/boot/dts/imx6dl-victgo.dts   | 2 +-
> >  arch/arm/boot/dts/imx6qdl-vicut1.dtsi | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/imx6dl-victgo.dts b/arch/arm/boot/dts/imx6dl-victgo.dts
> > index 227c952543d4..e6134efbfabd 100644
> > --- a/arch/arm/boot/dts/imx6dl-victgo.dts
> > +++ b/arch/arm/boot/dts/imx6dl-victgo.dts
> > @@ -28,7 +28,7 @@ backlight: backlight {
> >               pwms = <&pwm1 0 5000000 0>;
> >               brightness-levels = <0 16 64 255>;
> >               num-interpolated-steps = <16>;
> > -             default-brightness-level = <1>;
> > +             default-brightness-level = <48>;
>
> Please take a look at the documentation of the property.
>
>   default-brightness-level:
>     description:
>       The default brightness level (index into the array defined by the
>       "brightness-levels" property).

Ah, never mind, I missed 'num-interpolated-steps' there.

Shawn

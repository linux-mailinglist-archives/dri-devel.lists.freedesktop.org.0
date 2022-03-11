Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE9D4D643F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 16:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDA810E17E;
	Fri, 11 Mar 2022 15:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F2B10E17E
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 15:02:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 83E8660FDC
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 15:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB446C36AE3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 15:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647010976;
 bh=+7wVC05d5SSUcDUrc40AC3oA+s+3hd6pHYOwxaDor9A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sRDPg62TrNPP0ABRFAtV9pZ9v/v9oRFYJ0Ioa46UE271T4c/TSDUtzVQIJnJ0oe2m
 bl59pzLeCyko97T7g8oj6RSmHE8oufBWnSQTJ+b26WS9tsXk9PBlQsELof/VcgXHai
 NcZpQjh3dlxgg6A0/jnkPEV+5wdd8lU1p+SekL3RjwihZtWFPogzqkGk2P5dr/PCJk
 SHSWrm2zWHmsj7KGMFcIl5AflNq9Au+qhh1YbxGcpjUCxkM8u7NsTgltijzv3mVTzR
 /6zDH0zGu6y+7sCYyS0WtdgmoDQQL1izl/PYb7OY38gSNY9QGcdw4QBSzWfSWrZ1FT
 7PcW8MiYVuvrQ==
Received: by mail-ed1-f50.google.com with SMTP id t1so11037328edc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 07:02:55 -0800 (PST)
X-Gm-Message-State: AOAM5307Mx25O6wVBFzBMZcFHXRN0p1gCuPUuvS8tZnDRzXWR1LAyaUz
 kiHQQm9Wb6fMIc0wt/ujkTbFp9nHRDnVR1Xfkg==
X-Google-Smtp-Source: ABdhPJwYq/vJdt94i6eQ/56CKRLPMYZBOz5FJe4G+2giKB68DPNLMZ0O0dRforZvg6kBjeNFI/F6lo5Tb/V20Gngl/A=
X-Received: by 2002:aa7:d355:0:b0:415:f703:569 with SMTP id
 m21-20020aa7d355000000b00415f7030569mr9325992edr.215.1647010974075; Fri, 11
 Mar 2022 07:02:54 -0800 (PST)
MIME-Version: 1.0
References: <20220308130643.260683-1-cbranchereau@gmail.com>
 <20220308130643.260683-5-cbranchereau@gmail.com>
 <Yip8AiKNOILjf0uj@robh.at.kernel.org>
 <PC0L8R.DOJJ0CSJMHTW@crapouillou.net>
In-Reply-To: <PC0L8R.DOJJ0CSJMHTW@crapouillou.net>
From: Rob Herring <robh@kernel.org>
Date: Fri, 11 Mar 2022 09:02:42 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJKfypZRq1D02+fyNABoHRrEYdySzfP7nW62Cv44QymBA@mail.gmail.com>
Message-ID: <CAL_JsqJKfypZRq1D02+fyNABoHRrEYdySzfP7nW62Cv44QymBA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] dt-bindings: display/panel: Add Leadtek
 ltk035c5444t
To: Paul Cercueil <paul@crapouillou.net>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 11, 2022 at 7:05 AM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Hi Rob,
>
> Le jeu., mars 10 2022 at 16:30:26 -0600, Rob Herring <robh@kernel.org>
> a =C3=A9crit :
> > On Tue, Mar 08, 2022 at 02:06:43PM +0100, Christophe Branchereau
> > wrote:
> >>  Add binding for the leadtek ltk035c5444t, which is a 640x480
> >>  mipi-dbi over spi / 24-bit RGB panel based on the newvision
> >>  NV03052C chipset.
> >>
> >>  It is found in the Anbernic RG350M mips handheld.
> >>
> >>  Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
> >>  ---
> >>   .../panel/leadtek,ltk035c5444t-spi.yaml       | 59
> >> +++++++++++++++++++
> >>   1 file changed, 59 insertions(+)
> >>   create mode 100644
> >> Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t-s=
pi.yaml
> >
> > We have 18 SPI based panels already:
> >
> > $ git grep -i 'spi.* {'
> > Documentation/devicetree/bindings/display/panel/
> > Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml:
> >   spi {
> > Documentation/devicetree/bindings/display/panel/ilitek,ili9163.yaml:
> >   spi {
> > Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml:
> >   spi {
> > Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml:
> >   spi {
> > Documentation/devicetree/bindings/display/panel/innolux,ej030na.yaml:
> >    spi {
> > Documentation/devicetree/bindings/display/panel/kingdisplay,kd035g6-54n=
t.yaml:
> >    spi {
> > Documentation/devicetree/bindings/display/panel/lg,lg4573.yaml:
> > spi {
> > Documentation/devicetree/bindings/display/panel/lgphilips,lb035q02.yaml=
:
> >    spi {
> > Documentation/devicetree/bindings/display/panel/nec,nl8048hl11.yaml:
> >   spi0 {
> > Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml:
> >   spi {
> > Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml=
:
> >    spi {
> > Documentation/devicetree/bindings/display/panel/samsung,lms397kf04.yaml=
:
> >    spi {
> > Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml:
> >    spi {
> > Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.yaml:
> >    spi {
> > Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml:
> >    spi {
> > Documentation/devicetree/bindings/display/panel/sony,acx565akm.yaml:
> >   spi {
> > Documentation/devicetree/bindings/display/panel/tpo,td.yaml:    spi {
> > Documentation/devicetree/bindings/display/panel/tpo,tpg110.yaml:
> > spi {
> >
> > Most except for the Samsung ones look like they'd fit in our
> > definition
> > of 'simple panels' which primarily means 1 supply.
> >
> > So I think it is time for a panel-simple-spi.yaml binding to combine
> > all
> > these. But I'm not going to make the person adding the 19th case to do
> > that, and this otherwise looks fine:
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
>
> I actually thought you sent a patch for this already (I remember you
> talking about it last a binding for a new SPI panel has been added).

It was just adding spi-peripheral-props.yaml reference that I sent.

> I will work on it next week - provided Cristophe's patch has been
> merged before.

Thanks!

Rob

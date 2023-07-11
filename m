Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C74E74F66B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 19:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3548110E0D6;
	Tue, 11 Jul 2023 17:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72EB10E0D6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 17:05:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7444161589
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 17:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7252C433C9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 17:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689095138;
 bh=ffeJIapA2i8KtpkaQDaRRzVDC4qeHx8KurMrQFWzP7g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=la3HOtHvy0XM/f2Y4iTCps1/Ti4qRFo+7rh5KcklI3mtDVdSM3SrCeQr+ZvTu3Hbo
 zSpeSXhIIAT3AlrPPkw2+oymssLz8lCmLikDCttV1Y+1D7GUySlfUq57J23rzSbfnk
 r8IFpBqbGZ6Hntuxk246q4e9H9/UFZnpCNMeUTwbuxZoZu1yhSSPhfHhMmdBHCQPio
 nj8efEDaWTf3FdFrVe4NvM3l8UfrCZaWB3FjuaiPOr9X/IEiGybno2x9bRKyeKn/53
 2IsxxjksJxxQQfldC3UBRzTw/NbQZKNBAeUssPxK1UQYYeuNJwWupQKWgnaj0Balk/
 EMiFfAMwnCb2Q==
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2b703c900e3so93373241fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 10:05:38 -0700 (PDT)
X-Gm-Message-State: ABy/qLbh8d09/nGJ5+JcWk8LOUP5UWnXTMlzZrGn72617BFU6JCIwjYP
 SGu3kMqFo3M72ifsoxwCTJ0drIJD0O7U88vHzg==
X-Google-Smtp-Source: APBJJlHoS1FcFxGwFPJ/ewPGABck5kWIkACfr8013AsyHvluCY8e0O92fpKWd7fFdLAfImxRrLkI27/ePXUc6RRhShw=
X-Received: by 2002:a2e:9d9a:0:b0:2b6:c4cf:76a8 with SMTP id
 c26-20020a2e9d9a000000b002b6c4cf76a8mr13182327ljj.10.1689095136927; Tue, 11
 Jul 2023 10:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230710174007.2291013-1-robh@kernel.org>
 <a0aa122d-38a1-d4be-edc1-a49b4e5e9b6b@suse.de>
 <4de35c35-c00d-d21a-bcd1-dc878137eb94@gmx.de>
In-Reply-To: <4de35c35-c00d-d21a-bcd1-dc878137eb94@gmx.de>
From: Rob Herring <robh@kernel.org>
Date: Tue, 11 Jul 2023 11:05:24 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJmQ+70CkqPDT3vhs0bYJ_e6fuQrSOkNwCj7i0JQA4-EA@mail.gmail.com>
Message-ID: <CAL_JsqJmQ+70CkqPDT3vhs0bYJ_e6fuQrSOkNwCj7i0JQA4-EA@mail.gmail.com>
Subject: Re: [PATCH] of: Preserve "of-display" device name for compatibility
To: Helge Deller <deller@gmx.de>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Cyril Brulebois <cyril@debamax.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Michal Suchanek <msuchanek@suse.de>,
 Frank Rowand <frowand.list@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 11, 2023 at 9:46=E2=80=AFAM Helge Deller <deller@gmx.de> wrote:
>
> On 7/11/23 08:00, Thomas Zimmermann wrote:
> >
> >
> > Am 10.07.23 um 19:40 schrieb Rob Herring:
> >> Since commit 241d2fb56a18 ("of: Make OF framebuffer device names uniqu=
e"),
> >> as spotted by Fr=C3=A9d=C3=A9ric Bonnard, the historical "of-display" =
device is
> >> gone: the updated logic creates "of-display.0" instead, then as many
> >> "of-display.N" as required.
> >>
> >> This means that offb no longer finds the expected device, which preven=
ts
> >> the Debian Installer from setting up its interface, at least on ppc64e=
l.
> >>
> >> Fix this by keeping "of-display" for the first device and "of-display.=
N"
> >> for subsequent devices.
> >>
> >> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217328
> >> Link: https://bugs.debian.org/1033058
> >> Fixes: 241d2fb56a18 ("of: Make OF framebuffer device names unique")
> >> Cc: stable@vger.kernel.org
> >> Cc: Cyril Brulebois <cyril@debamax.com>
> >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >> Cc: Helge Deller <deller@gmx.de>
> >> Signed-off-by: Rob Herring <robh@kernel.org>
> >
> > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Acked-by: Helge Deller <deller@gmx.de>
>
> Who will pick up that patch?
> Shall I take it via fbdev git tree?

I'll take it. I've got other fixes queued up already.

Rob

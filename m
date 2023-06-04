Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B41D77215A2
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 10:38:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D034110E24E;
	Sun,  4 Jun 2023 08:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC0E10E24E
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 08:38:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7EB6A60C11
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 08:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E50E5C4339C
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 08:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685867901;
 bh=KnudFN4jNcEutuFxf6DNoM8rGgneiw4Lp3ZjTygxhr8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cFYVDNG2xGkbYVl7PVA4cySBz5gNkoFIm95NJhOUs6WrwN4ag4xMzsMWYu24utJP2
 VUJnCrWSxsfXLDM9I2aYACuzbIvQL3e6fwQaARWIZnh1S6Y5artxM8Jr00gaNXP1VQ
 CUdcBSQEgSGrG5jFUoc1UWXdPkWJuODXwHbdOSIVKJgYM/ZUvQ75ar4DFfqZrJfI7s
 /iAyFB+JfDnZ25BS+5C4jVO6CeJuUHHMPiTZ+YnFaUvz3k02SwJlo2sEGxhaAjzn1N
 urU/F2HLAr5bq6MpXYx2wcYRGbFdS1gf798OJwNCgjcWf3w+2JhOi+4E+k3cnck10N
 HHHwhG0mhRC9g==
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-bb167972cffso4611693276.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jun 2023 01:38:21 -0700 (PDT)
X-Gm-Message-State: AC+VfDw3TCcC9x+O+3Xpdwa5xu27OUmi4oEuFyDISS5i8OgwVeG41qyg
 CMK7Y8DyLRNWbKaKmu3DXuv7GrdB/XDq0sva8no=
X-Google-Smtp-Source: ACHHUZ4JPFHwUpGaNVEQxuGlSXgjpG5Bx6zVuVp9ongH9xrFwkFWDOGNXQ+eva+U1KI6qIraorqXGvm/Bu5D7fIk6XM=
X-Received: by 2002:a25:8108:0:b0:bac:26d2:53dd with SMTP id
 o8-20020a258108000000b00bac26d253ddmr8410051ybk.43.1685867901040; Sun, 04 Jun
 2023 01:38:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230603170747.1753842-1-masahiroy@kernel.org>
 <20230604045202.GA29881@pendragon.ideasonboard.com>
In-Reply-To: <20230604045202.GA29881@pendragon.ideasonboard.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 4 Jun 2023 17:37:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQFc_jEOTyKC429Ee5_F+QnhS88TYudebQ7LH82SbJ+Eg@mail.gmail.com>
Message-ID: <CAK7LNAQFc_jEOTyKC429Ee5_F+QnhS88TYudebQ7LH82SbJ+Eg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: imx: fix mixed module-builtin object
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Liu Ying <victor.liu@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Nick Terrell <terrelln@fb.com>, NXP Linux Team <linux-imx@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 4, 2023 at 1:52=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Yamada-san,
>
> Thank you for the patch.
>
> On Sun, Jun 04, 2023 at 02:07:46AM +0900, Masahiro Yamada wrote:
> > With CONFIG_DRM_IMX8QM_LDB=3Dm and CONFIG_DRM_IMX8QXP_LDB=3Dy (or vice
> > versa), imx-ldb-helper.o is linked to a module and also to vmlinux
> > even though the expected CFLAGS are different between builtins and
> > modules.
> >
> > This is the same situation as fixed by commit 637a642f5ca5 ("zstd:
> > Fixing mixed module-builtin objects").
> >
> > Turn helpers in imx-ldb-helper.c into inline functions.
>
> Wouldn't it be better to turn it into a module ? It could then be
> built-in for the above configuration, are compiled as a module when all
> its users are module as well.


Yes, two ways to fix it.
inline line functions vs a separate module

I do not have a strong opinion.


I sent v2.
https://lore.kernel.org/lkml/20230604075713.1027261-1-masahiroy@kernel.org/=
T/#t

Please pick a preferred one.








--
Best Regards

Masahiro Yamada

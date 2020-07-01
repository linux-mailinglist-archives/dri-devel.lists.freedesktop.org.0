Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EADA210575
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4401F89870;
	Wed,  1 Jul 2020 07:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A28892C6
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 07:53:06 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id q7so12555935ljm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 00:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=enPGC0OPftzCJlUnTQARq7JEwIW+q43cB8Io8/Pof2M=;
 b=xTCIkOiBtlJ6KiXHJnag1uUXr7+sABVaySKZwGWLW5bPgNh2BpVrCKqCjglU/TuFGH
 m9QtKUXanPF0gEBmpQNGPZx85JSQb83YZbgLpLTKkIv1UXKqBUZJTMA+lDPcpg6NmnA8
 yEJfoyS1/zewE72ZeCP16ZGXR9t4xXVWMNqfm8H8UJfeX03FrzhX/Ue7EnpKQHR0Ul1N
 bbl0jRMKuKHGYDE9ofhB5OiIbUeQJIdWXfo1NerQIiNu+MdLppPXX5PEm4N2CmlC6zkk
 HlGZOPJdteytMiASWqZt67U+AMjsKUhgRsKVnC709MG+tkDQD2kyIYXYGPsOxYUQY1A5
 xMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=enPGC0OPftzCJlUnTQARq7JEwIW+q43cB8Io8/Pof2M=;
 b=EOpruBuxG34KfQQrNYRTRyuofV1/bqykShHV4wLB6Fziz2KdfKHnn9iNi5y9gcijtq
 CTT0pgBySvscKW1YtEWqmRc8h150a3qioFPdxBb4cQ6QCHdqBkodqDwUjBhD02aWGvl7
 GJpLfthmvfr+mKPhssxswJSos0p93zJkeXh2IKNfAALvaeraU/cqptv0x3jOTfMxUuL2
 v+JZNs9JdJ8gFULQIVjWqc3+r808dYfYmmP8seOCtVAC0Jw3GnpkqNmMbK1Acf8g91ox
 2As1KNtmXhntNc5Tx5j92+KEq/bOIOQ4JdmDIG8HMgmRSNJwr+3Kb9OxI8UY1gt7BBru
 QOAw==
X-Gm-Message-State: AOAM533AFTc2wY/EUYwNVi0Vi+3JPSnu2DALqS+qKt60RB8anjPJ0nlJ
 sgP8oEmxuBpSSvXRmkqKRGvudlyP7dAVaz5r9wjkOA==
X-Google-Smtp-Source: ABdhPJw3tzZ9D9p6jgEm59VOvtaJaUTyrZtudaxwwHOStc/fwYBz/YcU4X11SqbNhvI9hCjXocTGYoYCbCv2Fh3PwSk=
X-Received: by 2002:a05:651c:284:: with SMTP id
 b4mr1772479ljo.283.1593589984484; 
 Wed, 01 Jul 2020 00:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200626005601.241022-1-megous@megous.com>
 <20200626005601.241022-14-megous@megous.com>
In-Reply-To: <20200626005601.241022-14-megous@megous.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Jul 2020 09:52:53 +0200
Message-ID: <CACRpkda2LnZ7UQkp_ZDEVCfxHVQ-VUE7NH0dEGNHYrUd1LcC0Q@mail.gmail.com>
Subject: Re: [PATCH v5 13/13] arm64: dts: sun50i-a64-pinephone: Add
 touchscreen support
To: Ondrej Jirman <megous@megous.com>
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Purism Kernel Team <kernel@puri.sm>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, Bhushan Shah <bshah@kde.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Martijn Braam <martijn@brixit.nl>, linux-sunxi <linux-sunxi@googlegroups.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Luca Weiss <luca@z3ntu.xyz>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 26, 2020 at 2:56 AM Ondrej Jirman <megous@megous.com> wrote:

> Pinephone has a Goodix GT917S capacitive touchscreen controller on
> I2C0 bus. Add support for it.
>
> Signed-off-by: Ondrej Jirman <megous@megous.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

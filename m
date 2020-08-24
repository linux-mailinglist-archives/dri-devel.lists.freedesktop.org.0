Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB205250A56
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 22:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C01C6E31C;
	Mon, 24 Aug 2020 20:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85FFC6E31C
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 20:55:36 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id w14so11289762ljj.4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 13:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yO3cJzACKVCFpDqahrm90tvJnnQfGEJdekxmCS+jC14=;
 b=palUVOfz4f083Wb4CBtwLz5r4kSdo4QUMzWlVG2x6nFU8t03xiRSyNEgwqW+GSNaCz
 OwqgzKJlmEhxkQevF+3ozevC9dRPTsd0IZkTILRZLAYCGwX1cKwwvhZ26NsG5y/Lbt8N
 x4iMsKUzmBoj49og/XoEe4yJ7NYZtJgFUSl8fVaE9C8QI7ATMxEkfPfeCI7CpBZdFhAv
 Jg1Y+R6zDLQGWaWzG68jSSqCfEiafx/N7MJ9ZHUKHt2BIVqJfbaE4b0yQBZNuN5QB4J8
 psw+uAkb6XPgiVzqv8+TRFYTFkrMP7zfIDuHFZXtIif0mSumEjBjAVDJUeOFcLS4qdtz
 ifXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yO3cJzACKVCFpDqahrm90tvJnnQfGEJdekxmCS+jC14=;
 b=K/Op2mJM32PVYeesoUcJ7RbfrJmtuKTx8rrrMPmqIkWFU5VSMSxBKIjTg2D2jAhRVP
 V7HkofOF59MrBs+5WKUT831AYsuDkxwLNhind+Z7pq0inT36gnT++VyeDAl1N3E3tz4+
 dpvwsx5KmszC6WGuXMlgCt/tVklOBnntLbwWWxMjpoXE1FFbEmZsbJffAMMe3pWTfSVW
 6TnH/l9OVRI7zyLukSA2caSOZ16OUFdZYLpMBQ2PZNnzSFvS1Qp210Tkxx+p2ExcDLlm
 XQbFZAHLgDYVR802/cJ5twhjAjfz3/bfEWO4V3OhLL4zZFmbyXsDdxUsULh/Em8WnIf0
 whBw==
X-Gm-Message-State: AOAM531vcerotjiqNutPPVir/RryUmfOrux0bSKRVjnmsaPULcIUV1q8
 Kcvy3Ye5nLWTsK/nar7onRIHsp+VktzB3TZMURVX6Q==
X-Google-Smtp-Source: ABdhPJx/GQsMWNe8fX9SQJ5lXrBBnYtA5YY/yrTrZueYlnteT37fsgp+msic8W3g8C5r77mBV89IFKlz3HD3oDrzPX0=
X-Received: by 2002:a2e:b80b:: with SMTP id u11mr3595979ljo.286.1598302534630; 
 Mon, 24 Aug 2020 13:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200822163250.63664-1-paul@crapouillou.net>
 <20200822163250.63664-6-paul@crapouillou.net>
In-Reply-To: <20200822163250.63664-6-paul@crapouillou.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Aug 2020 22:55:22 +0200
Message-ID: <CACRpkdYHXwUsN8as7dKOvb00Ec4th45FyBV7TyBOfO4sR=78MA@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] drm/panel: Add panel driver for NewVision NV3052C
 based LCDs
To: Paul Cercueil <paul@crapouillou.net>
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
 <devicetree@vger.kernel.org>, od@zcrc.me,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 22, 2020 at 6:33 PM Paul Cercueil <paul@crapouillou.net> wrote:

> +static const struct nv3052c_reg nv3052c_regs[] = {
> +       { 0xff, 0x30 },
> +       { 0xff, 0x52 },
> +       { 0xff, 0x01 },
> +       { 0xe3, 0x00 },
> +       { 0x40, 0x00 },
(...)

Well that's pretty opaque :D

I suppose no datasheet (why do vendors keep doing this to us...)

In other kernel code I have referred to this as a "jam table", e.g.
drivers/net/dsa/rtl8366rb.c.

I didn't make this up, the name comes from Bunnie Huang's
book on hacking the Xbox, and he says it is common hardware
engineer lingo.
https://www.iacr.org/workshops/ches/ches2002/presentations/Huang.pdf

What about naming it nv3052c_jam_table[] or nv3052c_jam[]?

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

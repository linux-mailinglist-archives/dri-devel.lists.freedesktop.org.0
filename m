Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BBE5FA664
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 22:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A1310E714;
	Mon, 10 Oct 2022 20:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE0010E70A
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 20:36:13 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id z3so16451562edc.10
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 13:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+IAkaWQMduMUEg/IVhJmoVF73YcOppT9cb4ycyjkC3A=;
 b=W032O2LbfFu2tTrlv2rIUts8WPhTnyvL84pdeEnoxXSpQMJD3GeGT7x1ncktcz5Ha3
 4oTddWAoYYDRL6rFVRRa8vHTt5QPMyUVCanb2Ntssm56+Oi7i8ct+dqa3jlbxywlcKyb
 pIrVgQglKhAk2B2OtPn+vfhBB5f5f555vYDbz2kErMRfcQVe0cmbAxol0dCEbBGQOYLJ
 EytERhLO8wejHo3DOSIyt1QXWx6VpXgyrkDqbCQ7AFTLf7MoH4eEgCjCqZSB3qyfRi5w
 6tR5sLRByB5d1RSjdcyu8hmFKAzI/CwDOqSu0sR+Sh/emlW4aBMKjX8ODe6I0yL7U2cH
 nyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+IAkaWQMduMUEg/IVhJmoVF73YcOppT9cb4ycyjkC3A=;
 b=gIHsE8pSXMDjLEzIxCVHn4GxHr/LB/BJtektNDbURzyWsW5kpV4l/sY8/tbEe/gbgM
 SpSTuP1l0ii1hnfRBm6zSak4Q+9//pO9EpQA7EpCDfCBSrgl8r1zRRm6er8WY9equ3hl
 k17Eg3rbdktch+eMZKFwbQA5G830lfbZPlPunohvwyVSDXl/flpS7NAWlfg6F5Q75YVa
 9/T9fj4s9ow4lcJXMgchYbgyVRGOLVvJGZm5dTNKLVPigPKeAzazzK5BGR3Tp5qIljUk
 WzvUrUJcNJ0Zc9GiEBODdAYfY0HUCfJlPMb4cLtgPdb76MAlx7eLEfn1yYvsXX3auIeZ
 1+4g==
X-Gm-Message-State: ACrzQf1++yUp+JR0k+FHJxs2/sLepMCqU96f2PklTpMMmxSP2VLDrBI6
 wKe4cTN7knEVqauVcq/ZR/P1vtP/Hq15/GcH3HTYUA==
X-Google-Smtp-Source: AMsMyM7zsMEYc1MPREFO6D91C5VC8qUsg6HO6V70YDqdxA6BfuO0DXyze3J2/BpvF/6sW69IkvpqwmFtlOSpBSXMFIA=
X-Received: by 2002:a05:6402:2690:b0:459:e6b2:cae3 with SMTP id
 w16-20020a056402269000b00459e6b2cae3mr19213770edd.158.1665434172329; Mon, 10
 Oct 2022 13:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <YzN6A9Y20Ea1LdEz@google.com>
 <CACRpkdZF9TVA3+3pgjqm_cnhfPO6p0oOT=2jrqFafMCHe2cwDg@mail.gmail.com>
 <YzwtG8CT9sTCqQQk@maple.lan>
 <CACRpkdZ-DfZKgCOHaKn1UZ8vVwy1dEiFBBDNdxu6VNzrUdeEtA@mail.gmail.com>
 <YzyZJSwy9xsy69WL@google.com>
 <CACRpkdYecQPUd-evVpOpMLY1XUa87kP4i+E694QfTtDbEarJfQ@mail.gmail.com>
 <Yz6oS/zdNIOEtWxI@maple.lan>
In-Reply-To: <Yz6oS/zdNIOEtWxI@maple.lan>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Oct 2022 22:36:00 +0200
Message-ID: <CACRpkdYdZaxSGy+YiexKtffKvUEr5dcu3g=1zY3Tfhv5WMDtew@mail.gmail.com>
Subject: Re: [RFC/PATCH] backlight: hx8357: prepare to conversion to gpiod API
To: Daniel Thompson <daniel.thompson@linaro.org>
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
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 6, 2022 at 12:05 PM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
> On Thu, Oct 06, 2022 at 11:03:15AM +0200, Linus Walleij wrote:
> > On Tue, Oct 4, 2022 at 10:35 PM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> >
> > > > Dmitry, could you fix this? Just patch away in gpiolib-of.c.
> > >
> > > Sure, I'll add a few quirks. I wonder what is the best way to merge
> > > this? I can create a bunch of IBs to be pulled, or I can send quirks to
> > > you/Bartosz and once they land send the patches to drivers...
> >
> > When I did it I was sufficiently convinced that I was the only one patching
> > the quirks in gpiolib-of.c that merge window so I just included it as
> > a hunk in the driver patch. If there will be some more patches to that
> > file I guess some separate patch(es) for gpiolib-of.c is needed, maybe
> > an immutable branch for those if it becomes a lot.
>
> Are renames likely to be a common quirk on the road to libgpiod
> conversion?
>
> I admit I sort of expected it to be common enough that there would be
> one rename quirk in the code supported by an alphabetized string table.
> Such a table would certainly still provoke troublesome merges but ones
> that are trivially resolved.

Dmitry added a table of sorts, the problems are usually a bit unique
for each instance of nonstandard DT GPIO bindings, that's why I
mostly solved it with open coding in gpiolib-of.c.

Yours,
Linus Walleij

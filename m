Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF938135EC7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 17:56:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328A96E45D;
	Thu,  9 Jan 2020 16:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA3A6E45D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 16:56:43 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 841642072A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 16:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578589002;
 bh=9oyg27saFaqgN0kNufIh+bWG6/4Iwy6kaQ1n0BzczVk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2CosUSQhDeszdClob89wkM5qUuLn+NGmxavbwwJtOjFrz9J9rb5rJcMgFQI1xDAQ4
 fUXa0Ef1aePHujZvmpoUW/06Em/BF7VVOjDi5q5fkKIAJuUjWK6nHJS6vh0B+JXDfJ
 atgBkzj5WtLXXdJkwB2Qpsf8KlWlFaaxn/mc4FF0=
Received: by mail-qk1-f182.google.com with SMTP id x129so6590312qke.8
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2020 08:56:42 -0800 (PST)
X-Gm-Message-State: APjAAAUDVEh9N+vgB69ldooITeWVYdZdMTFF5EG2ya73hZH2VwCKIaF8
 v6oZPes9grGbnBojIRQgQ2uaCrg69JoJn0tpWg==
X-Google-Smtp-Source: APXvYqwejonPhLn1c6g5UIO7dw/MXR05QYRJuuZwXtZ9dn62B4O5MWFoIh0m1SoNLfPeYaTMJ9QV835I1LSeJT6q4Lo=
X-Received: by 2002:a05:620a:1eb:: with SMTP id
 x11mr10791122qkn.254.1578589001636; 
 Thu, 09 Jan 2020 08:56:41 -0800 (PST)
MIME-Version: 1.0
References: <20200108052337.65916-1-drinkcat@chromium.org>
 <20200108052337.65916-5-drinkcat@chromium.org>
 <20200108132302.GA3817@sirena.org.uk>
 <CANMq1KBo8ND+YDHaCw3yZZ0RUr69-NSUcVbqu38DuZvHUB-LFw@mail.gmail.com>
In-Reply-To: <CANMq1KBo8ND+YDHaCw3yZZ0RUr69-NSUcVbqu38DuZvHUB-LFw@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 9 Jan 2020 10:56:29 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKvNBCVkiE4zKn0aXdrV4Ncx2bB6+KRpM+aPpMVzS4XbQ@mail.gmail.com>
Message-ID: <CAL_JsqKvNBCVkiE4zKn0aXdrV4Ncx2bB6+KRpM+aPpMVzS4XbQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] drm/panfrost: Add support for a second regulator
 for the GPU
To: Nicolas Boichat <drinkcat@chromium.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 8, 2020 at 4:52 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> On Wed, Jan 8, 2020 at 9:23 PM Mark Brown <broonie@kernel.org> wrote:
> >
> > On Wed, Jan 08, 2020 at 01:23:34PM +0800, Nicolas Boichat wrote:
> >
> > > Some GPUs, namely, the bifrost/g72 part on MT8183, have a second
> > > regulator for their SRAM, let's add support for that.
> >
> > > +     pfdev->regulator_sram = devm_regulator_get_optional(pfdev->dev, "sram");
> > > +     if (IS_ERR(pfdev->regulator_sram)) {
> >
> > This supply is required for the devices that need it so I'd therefore
> > expect the driver to request the supply non-optionally based on the
> > compatible string rather than just hoping that a missing regulator isn't
> > important.
>
> That'd be a bit awkward to match, though... Currently all bifrost
> share the same compatible "arm,mali-bifrost", and it'd seem
> weird/wrong to match "mediatek,mt8183-mali" in this driver? I have no
> idea if any other Mali implementation will require a second regulator,
> but with the MT8183 we do need it, see below.

The current number of supported bifrost platforms is 0. It's only a
matter of time until SoC specific compatibles need to be used in the
driver. This is why we require them.

It could very well be that all bifrost implementations need 2
supplies. On chip RAMs are very frequently a separate thing which are
synthesized differently from logic. At least within a specific IP
model, I somewhat doubt there's a variable number of supplies. It
could be possible to connect both to the same supply, but the correct
way to handle that is both -supply properties point to the same
regulator.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

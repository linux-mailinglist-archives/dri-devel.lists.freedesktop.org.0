Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1990A31194C
	for <lists+dri-devel@lfdr.de>; Sat,  6 Feb 2021 04:02:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876C36F556;
	Sat,  6 Feb 2021 03:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB086F556
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Feb 2021 03:02:10 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id k22so2809179ual.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Feb 2021 19:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vuPLugpx3nVqN901hZhHAJ68fe+2jLjEwlOR0tJDXYA=;
 b=F6opSYqv6jZOIDMw2g1ehsjaiUwtHudjb08fDacbv/EDpLlwSpy4IMI9fFhh8IsrUR
 6z2eJKGywevwZfoGwCPGT5Nm9kzq//cAUkMjmj4ttLr0H4RuMnf0xAHFZ3WXDK2CX4Jv
 kxl/y2itpTtbDt2HwFVoyjCBpFYEnW27WBFeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vuPLugpx3nVqN901hZhHAJ68fe+2jLjEwlOR0tJDXYA=;
 b=Rgb4Qlng2xme5BIwBIi9UyAOrc9xPccVloL6ZUJUSnKbhwcwVfto3YHPh3F1hm88TY
 GJk1ssOBjwfS0mvnoq24dZgWlRoJjD5yxsruJVq5EPW3RTZoaQRptq+mPZYGT9sMIe/3
 DYJGaEkAzfMwplp2RdG/MuSlnakXsQ2iLlXheNGqp9kGYqXD2rtaJrAboaUDDgugI724
 DaA9L+Ebt4I5EGQxnAAOxxg10OhsvjypXJ/ADiCYLCGQVOy+lvVRfT+NrvNPMk2DDNwY
 tQfKLXewxu62VcdzWIh6ik/ZorjM+l8456EFX72Nzr8UtFVpIGe+2YebarMnpsBplo1x
 NleA==
X-Gm-Message-State: AOAM532DZeyZ3E1+eEzjqGYgC0/NdMld1CDTegBVCRhuCh8Czk3Mxj37
 CnDbTN1ndwZJbdTcs33GyrA1DK6QJnEKwtL+vcJUkA==
X-Google-Smtp-Source: ABdhPJx8dqL+kHCdeyZ4DlETrA6syQ9QDsjU5KGZ5QnyvgeCk+5tYIv9ZfqZvBXd6LQikBo/7yMyvzQGpgRlw96uTRc=
X-Received: by 2002:ab0:20d:: with SMTP id 13mr2631762uas.27.1612580529357;
 Fri, 05 Feb 2021 19:02:09 -0800 (PST)
MIME-Version: 1.0
References: <20210126011759.1605641-1-drinkcat@chromium.org>
 <20210126091747.v11.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
 <20210205175543.GA3363048@robh.at.kernel.org>
In-Reply-To: <20210205175543.GA3363048@robh.at.kernel.org>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Sat, 6 Feb 2021 11:01:57 +0800
Message-ID: <CANMq1KAshVgWPp=4KpjkwfAD=N4ZOw0xBCZHkfGob-TY0RCGew@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek
 MT8183
To: Rob Herring <robh@kernel.org>
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Fei Shao <fshao@chromium.org>,
 David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Kristian Kristensen <hoegsberg@chromium.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 6, 2021 at 1:55 AM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, 26 Jan 2021 09:17:56 +0800, Nicolas Boichat wrote:
> > Define a compatible string for the Mali Bifrost GPU found in
> > Mediatek's MT8183 SoCs.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > ---
> >
> > Changes in v11:
> >  - binding: power-domain-names not power-domainS-names
> >
> > Changes in v10:
> >  - Fix the binding to make sure sram-supply property can be provided.
> >
> > Changes in v9: None
> > Changes in v8: None
> > Changes in v7: None
> > Changes in v6:
> >  - Rebased, actually tested with recent mesa driver.
> >
> > Changes in v5:
> >  - Rename "2d" power domain to "core2"
> >
> > Changes in v4:
> >  - Add power-domain-names description
> >    (kept Alyssa's reviewed-by as the change is minor)
> >
> > Changes in v3: None
> > Changes in v2: None
> >
> >  .../bindings/gpu/arm,mali-bifrost.yaml        | 28 +++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >
>
>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.

There were changes in v11, I thought you'd want to review again?

Anyway, I can resend a v12 with all the Rb/Ab if that works better for you.

>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

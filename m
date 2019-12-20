Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 294D41292C7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFD46E1F7;
	Mon, 23 Dec 2019 08:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C386EBCA
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 03:58:02 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id v3so8054253ioj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 19:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B4nCCF+EzJiIuxfjV2kTWNg3Z7MNbVOSCn8Lx8XGK8U=;
 b=Uu68m5g3z0N7oHxNK4TYLIAyQL54Y8wxUcLjSl2I3K3wgHJKJBUiAS1hKJHut9+Ozy
 KR3IK3MjEt3a+jdjt6m9JLZsgNfAcwdmW1QDt2LzrCQ8Pzb8W8/l0+9PjOwOuxx0WzFR
 vQLEf+/JQOavUARm496IWPyNLtwK7QcXRZ3n0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B4nCCF+EzJiIuxfjV2kTWNg3Z7MNbVOSCn8Lx8XGK8U=;
 b=Jm7BJcRvxFg2tRs/wEW613yz+19q5lVnX1frRGocc7ureSp/1UoVX1rfe8rjYm4vDq
 YkAMRCfhLEvo4K6+INYMwFLJ40RP2Hb889OgN5R68PtXPa84sPlEo9i52lXATHUAm1fx
 KYjNxHOZRGJ7K1btzbXBvod/FdDiBtd4WMa25dWLPQOJT9agNdPjbd9IONDDkOQXlAiD
 w1g/+tAdoA8KVf4ba/l7Ctyu3PVRyAJqVEISE13+eAW6SqgcBV5HhuhXkt841I40Iuas
 b/UflFs0bz5zcRAaJreUzC2opBklfTB2MfaXIepir+yKTcDwIjkN2Mvo9JjlVoltDEAK
 yY1g==
X-Gm-Message-State: APjAAAWCDZbMMOESuwMF8orzzp+GFawduw0uBztvC7Ws1s2NsqszkSbV
 n3tm2WE0sR8n/URKuldkfiVRSjCTLLT22mcfj4TLjQ==
X-Google-Smtp-Source: APXvYqze2GCzHNzigs0wrMKV1f5dOTa2IoCFv0kR1FK9X5FibE53e4kl8NAd0VW+nLWtv2oN+HBirF/XchUbVIFRZMw=
X-Received: by 2002:a05:6638:10e:: with SMTP id
 x14mr10484146jao.4.1576814281622; 
 Thu, 19 Dec 2019 19:58:01 -0800 (PST)
MIME-Version: 1.0
References: <20191211061911.238393-1-hsinyi@chromium.org>
 <20191211061911.238393-4-hsinyi@chromium.org>
 <CAL_Jsq+jkgDj6-SH1FrnjB1CQmf33=XUwN3N_fw_aJsQm3Fq9A@mail.gmail.com>
 <CAJMQK-iwF78=2PDMxp=cvS3sotNi7kjj1ZoVO9q_axejUPdLYA@mail.gmail.com>
 <20191219204827.GA13740@bogus>
In-Reply-To: <20191219204827.GA13740@bogus>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 20 Dec 2019 11:57:35 +0800
Message-ID: <CAJMQK-jGw8kJFNjoHjeZUL+3NCiOS2hgGERnAnMwNsL_cm_J=Q@mail.gmail.com>
Subject: Re: [PATCH RESEND 3/4] dt-bindings: drm/bridge: Add GPIO display mux
 binding
To: Rob Herring <robh@kernel.org>
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <mbrugger@suse.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 20, 2019 at 4:48 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Dec 16, 2019 at 03:16:23PM +0800, Hsin-Yi Wang wrote:
> > On Sat, Dec 14, 2019 at 5:29 AM Rob Herring <robh+dt@kernel.org> wrote:
> > >
> > > On Wed, Dec 11, 2019 at 12:19 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > > >
> > > > From: Nicolas Boichat <drinkcat@chromium.org>
> > > >
> > > > Add bindings for Generic GPIO mux driver.
> > > >
> > > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > > ---
> > > > Change from RFC to v1:
> > > > - txt to yaml
> > > > ---
> > > >  .../bindings/display/bridge/gpio-mux.yaml     | 89 +++++++++++++++++++
> > > >  1 file changed, 89 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> > > > new file mode 100644
> > > > index 000000000000..cef098749066
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
> > > > @@ -0,0 +1,89 @@
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/bridge/gpio-mux.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Generic display mux (1 input, 2 outputs)
> > >
> > > What makes it generic? Doesn't the mux chip have power supply,
> > > possibly a reset line or not, etc.? What about a mux where the GPIO
> > > controls the mux?
> > >
> > > Generally, we avoid 'generic' bindings because h/w is rarely generic.
> > > You can have a generic driver which works on multiple devices.
> > >
> > Then how about making it mt8173-oak-gpio-mux? Since this is currently
> > only used in this board.
>
> Isn't there an underlying part# you can use? Or if you can point me to
> multiple chips implementing the same thing, then maybe a generic binding
> is fine.
There are some similar chips, for example:
https://www.paradetech.com/zh-hant/%E7%94%A2%E5%93%81%E4%BB%8B%E7%B4%B9/ps8223-3-0gbps-hdmi-12-demultiplexer/
and http://www.ti.com/lit/ds/symlink/ts3dv642.pdf
If they are used in a similar way
(https://lore.kernel.org/lkml/CANMq1KDDEzPWhByEtn-EjNcg+ofVT2MW-hOXANGooYFOYJ35VA@mail.gmail.com/),
they would need such driver. But currently we only know that mt8173
oak board have this use case.
>
> Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 330CC221DD0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 10:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7823E6E0CC;
	Thu, 16 Jul 2020 08:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB076E0CC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 08:05:59 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BE9D020809
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 08:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594886759;
 bh=ehYqwwPvhuxxIPWHvlV3lLMdf3GltGXOOPUU/9ywhbk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NUX4V55vt4vDnhVkTf8fxI7TNgH3zODiAlWoDTATCG7RRdPANygNwAvNS6W5TZWQW
 SSdJcDQi4Jb0D+6miI511OufLznjUg6BIZLFLtlUCQNq06JGEPi0nWV6X5MaM8bFOC
 7oYDeoj4xzpTLhtqIbGKVncaWoF6cMtiJRPHVL7s=
Received: by mail-lj1-f176.google.com with SMTP id s9so6068989ljm.11
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 01:05:58 -0700 (PDT)
X-Gm-Message-State: AOAM530Gm7G3voCsyooSpJH22HLpROaMOJ1h+EelNAFymrxQ1zZTDyfT
 lEQT0y5RBfamUlYHO8cOxzEsGjS1HcbtjDTzxnA=
X-Google-Smtp-Source: ABdhPJxazghiflEzI/K26+i5bXrJUHgf5KqjhEhjQP9dK24Tz6XSyIB/akZSw4IY6VNdFmgg7CnAA+tbWy1cJgyFKIY=
X-Received: by 2002:a2e:3a14:: with SMTP id h20mr1308635lja.331.1594886757055; 
 Thu, 16 Jul 2020 01:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200714071305.18492-1-wens@kernel.org>
 <20200714071305.18492-2-wens@kernel.org>
 <20200716080043.6duzgo2ikeqr5lnw@gilmour.lan>
In-Reply-To: <20200716080043.6duzgo2ikeqr5lnw@gilmour.lan>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 16 Jul 2020 16:05:46 +0800
X-Gmail-Original-Message-ID: <CAGb2v64a=kDwx-bEtXSyX1QCMe65KETgDHhbkYGBjX8Fv3Jk-A@mail.gmail.com>
Message-ID: <CAGb2v64a=kDwx-bEtXSyX1QCMe65KETgDHhbkYGBjX8Fv3Jk-A@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: panel-dpi: Add bits-per-color
 property
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Siarhei Siamashka <siarhei.siamashka@gmail.com>,
 David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 16, 2020 at 4:00 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Tue, Jul 14, 2020 at 03:13:01PM +0800, Chen-Yu Tsai wrote:
> > From: Chen-Yu Tsai <wens@csie.org>
> >
> > Some LCD panels do not support 24-bit true color, or 8bits per channel
> > RGB. Many low end ones only support up to 6 bits per channel natively.
> >
> > Add a device tree property to describe the native bit depth of the
> > panel. This is separate from the bus width or format of the connection
> > to the display output.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > ---
> >  .../devicetree/bindings/display/panel/panel-dpi.yaml          | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > index 0cd74c8dab42..8eb013fb1969 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > @@ -26,6 +26,9 @@ properties:
> >    height-mm: true
> >    label: true
> >    panel-timing: true
> > +  bits-per-color:
> > +    description:
> > +      Shall contain an integer describing the number of bits per color.
>
> You should specify its type (u32), range (1-8 I guess?) and default
> value (which seems to be 8).

Ok.

> Also, it's not unusual to have a different number of bits per color,
> like for 16 bits panels where we usually use RGB565. I guess we could
> make that an array?

So for different number of bits per color, I'm not sure whether that's
a function of the panel itself, or the bus format. I don't really have
any 16-bit panels on hand. As it stands DRM only handles a common color
depth.

ChenYu
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

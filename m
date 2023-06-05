Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D977C7229FB
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 16:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264F410E2C0;
	Mon,  5 Jun 2023 14:56:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C664F10E2B6
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 14:56:25 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1b0236ee816so35450375ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jun 2023 07:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685976985; x=1688568985;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T6MJIwP6Qz41YN9JsUH44j/uT7BYaMY9w+C9sGj/uYc=;
 b=n0R6S5Pz/FUIVP6ytcw6xK8yCjSt5iCNR2Hy+2f+yMaV/QywwTJ94CYe9YVXvashMS
 Gurmudikv/rGA1FvM1U1yl6z4Y7GWJ+CCY2jUJ6Xt3oh1fu46XGh8gZgMNDV7U8ulA0v
 q8nDnfnBWwqzCa6BEEvG07v9R8Pott2fFPvO6YYVZA0r/6Ob72ymvh0y9hBH4HN3FYns
 AtPHWbIZr3QluXo274sl3KBvFjUb25OJQ2wkg7BXV31pN/wbiDVX+qIJDd192c2gAWxj
 kG5aL2equYVmpaGk4/vy1+yk+0yaADn+LjnMqvrJ30NiAAL188rXvIa5kuFtF/bQ7RWT
 n2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685976985; x=1688568985;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T6MJIwP6Qz41YN9JsUH44j/uT7BYaMY9w+C9sGj/uYc=;
 b=YI+N1RqvsssBZVVHPDoTxCc9xc/IzyhaXPTJsZqOHXrZkQufdUDG7E3br2J4d2K2Td
 FxAe5eqmIv1p0U0VFJHAIEG3STLyiJpDCDHC8aNRffV5l9K75OFe7ayTJbtcBEYEof1Y
 MDDUDjVpl2LLer8CKMOj03fh1OLzqsDjQv7Mnx3xxYhfJxGK7NhgMJwW6ealR/ndb0DQ
 bgpx7hUhf4kIWJiEqL7xPqmld1cgYfSMvIHHT7rnq7CVtUXnHOgH8BezAfQti2+qYxTk
 HBSExuGkbX1BdfZXctGQh5Go/iD58dyQKpqqghers4EES8zo8wwxNXAJALIYAI8/50cD
 O0Nw==
X-Gm-Message-State: AC+VfDxQ+jMeKc/W1lhUOSXQu2403Gf8RXHWc2Th91ZIndDVNBGHN+YX
 B+H4T4x9QdO8zzGLjDg64AS1Apv2jOvmpyVfAAg=
X-Google-Smtp-Source: ACHHUZ6ELOU/gnEBfytvNDunlQ/WFvt5DfZeMzBsW5V77h1qMFRnFTZVm+SvCKe9kvX5TcXwkThMMzJd9XOK5y64DfU=
X-Received: by 2002:a17:902:da81:b0:1ae:35b8:d5ae with SMTP id
 j1-20020a170902da8100b001ae35b8d5aemr9400904plx.19.1685976984850; Mon, 05 Jun
 2023 07:56:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230519142456.2588145-1-pavacic.p@gmail.com>
 <20230519142456.2588145-2-pavacic.p@gmail.com>
 <20230519-emerald-void-066fad80950a@spud>
 <CAO9szn2sYRezCUQKFZ_qsVfne0gpWoirZoE-HpWTPS4G1U5fNQ@mail.gmail.com>
 <20230605-handyman-rebound-0c10df9dfaf2@spud>
In-Reply-To: <20230605-handyman-rebound-0c10df9dfaf2@spud>
From: Paulo Pavacic <pavacic.p@gmail.com>
Date: Mon, 5 Jun 2023 16:56:13 +0200
Message-ID: <CAO9szn0crQzy0L2Y-NZGKEVbpspxZMkO0oPpYr1WMS081ZxKRw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add fannal,c3004
To: Conor Dooley <conor@kernel.org>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Conor,

pon, 5. lip 2023. u 16:43 Conor Dooley <conor@kernel.org> napisao je:
>
> On Mon, Jun 05, 2023 at 04:33:15PM +0200, Paulo Pavacic wrote:
> > Hello Conor,
> >
> > pet, 19. svi 2023. u 18:41 Conor Dooley <conor@kernel.org> napisao je:
> > >
> > > Hey Paulo,
> > >
> > > On Fri, May 19, 2023 at 04:24:55PM +0200, Paulo Pavacic wrote:
> > > >
> > > > Added fannal to vendor-prefixes and dt bindings for Fannal C3004.
> > > > Fannal C3004 is a 480x800 MIPI DSI Panel which requires
> > > > DCS initialization sequences with certain delays between certain
> > > > commands.
> > > >
> > > > Signed-off-by: Paulo Pavacic <pavacic.p@gmail.com>
> > > > ---
> > > > v3 changelog:
> > > >   - renamed yml file
> > > >   - refactored yml file to describe fannal,c3004
> > > >   - added matrix URI to MAINTAINERS
> > > > v2 changelog:
> > > >   - revised driver title, now describes purpose
> > > >   - revised description, now describes hw
> > > >   - revised maintainers, now has only 1 mail
> > > >   - removed diacritics from commit/commit author
> > > >   - properties/compatible is now enum
> > > >   - compatible using only lowercase
> > > >   - revised dts example
> > > >   - modified MAINTAINERS in this commit (instead of driver commit)
> > > >   - dt_bindings_check checked yml
> > > >   - checkpatch warning fixed
> > > > ---
> > > >  .../bindings/display/panel/fannal,c3004.yaml  | 75 +++++++++++++++++++
> > > >  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
> > > >  MAINTAINERS                                   |  6 ++
> > > >  3 files changed, 83 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/panel/fannal,c3004.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/panel/fannal,c3004.yaml b/Documentation/devicetree/bindings/display/panel/fannal,c3004.yaml
> > > > new file mode 100644
> > > > index 000000000000..a86b5ce02aa2
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/panel/fannal,c3004.yaml
> > > > @@ -0,0 +1,75 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/panel/fannal,c3004.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Fannal C3004 MIPI-DSI
> > > > +
> > > > +maintainers:
> > > > +  - Paulo Pavacic <pavacic.p@gmail.com>
> > > > +
> > > > +description: |
> > > > +  Fannal C3004 is a 480x800 panel which requires DSI DCS
> > > > +  initialization sequences.
> > > > +
> > > > +allOf:
> > > > +  - $ref: panel-common.yaml#
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - const: fannal,c3004
> > > > +
> > > > +  reg: true
> > >
> > > Are there no restrictions on the number of reg entries?
> >
> > What do you mean by this? May I have some example if possible?
>
> I was commenting on the lack of minItems and/or maxItems.

Sorry this is my first patch, I still don't understand, why should I
add `maxItems: 1` to the 'reg:' ?
Isn't  part of the code:
> required:
>  - compatible
>  - reg
>  - reset-gpios

making `minItems: 1` redundant for reg properties?

>
> Cheers,
> Conor.

Thanks,
Paulo

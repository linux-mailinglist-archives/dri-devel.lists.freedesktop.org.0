Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8D158CA0D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 16:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A6C8A302;
	Mon,  8 Aug 2022 14:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5038FDD9
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 13:56:21 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 j66-20020a9d17c8000000b00636b0377a8cso5558973otj.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Aug 2022 06:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=7MpufPiEwqIWSMkyna1zV0ThiQO6ldBPgCVBYks6zEc=;
 b=Kwsu0tPQArpLJrXVfS1QRtCrZJghUgXixY2AdivNGt7clwGtzYlVlB3hPgG5o9SGK4
 uBOwOy4/04BYIPJvNvbDHSz0DUS5X6krnwAxKZH5/ZtbxoFtU8uSRqNC9j8jJ7qXXH8b
 5Ih0z94z+YBT6bYImHhyk7AYOy1Z8wQ8qcJJAD73INmJbcxAnZ6lTRw3dyaIFm52F7/g
 3LaoZOmbSWP9+OpaS4+3kag5nWbrARjlnmH3+0d21PWzQuF3dhbqFXqxGJon3wgZztrX
 O+2vRAylTVQCzFB9auTekz5/qLXWsLbSVLiQpzqjfUbWrffw/980sZPHKsFKV2V87Sq7
 0lxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=7MpufPiEwqIWSMkyna1zV0ThiQO6ldBPgCVBYks6zEc=;
 b=xYxnOeSvWnQy315r0GMI1HPLoPTun8LLaT1PnDzqR58a3m8MKSe13GgQOUpUEgl7FT
 YVrYqAUs09fnk6VNrbGz7xVkBBZcUGXz4dyfJCXBh4t0Zdh0qFUoUcUlD+e0CUdzwrhi
 Lha19lhxn29Tk1JXlrb//mUC5FuPxMeo6ltPOUT5Rdy8QmJoSKEQlm33btzZ+V8/Q7TG
 RfM9KYJ95FEyzILIWSm9yCxbBO2/CFcwIQZjK5nYFceWBD8ty/5qaJ6KzJ2EUW4LpBxJ
 AIYnNYBCj2JlAcY3XbmuOLTpPsclbi+/8P/Ct8wmUWxsmZgvnIyfuV+FRlLa5XL/srtp
 YofQ==
X-Gm-Message-State: ACgBeo1OkHwlO9bbHEihxn67PUXPGaA2tZAOd63lTHNt2cc4K+FTr6f/
 DmmwrF8v6pawOPhebbVymL0S6J+X00nEVOm7SIw=
X-Google-Smtp-Source: AA6agR4Fz/+Jh+PKEF1AyJjJ+m0XqiL7J7daj/1+TOsuYNLadSf7OpcTSkeX7vYvbMDQdZ19HVHllJYZocy4LLWVhR0=
X-Received: by 2002:a9d:6443:0:b0:61c:7f6b:fef8 with SMTP id
 m3-20020a9d6443000000b0061c7f6bfef8mr6888698otl.319.1659966980579; Mon, 08
 Aug 2022 06:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220628181838.2031-1-max.oss.09@gmail.com>
 <20220628181838.2031-3-max.oss.09@gmail.com>
 <7e30f558-d42e-9751-7729-f0422f3926fa@denx.de>
In-Reply-To: <7e30f558-d42e-9751-7729-f0422f3926fa@denx.de>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Mon, 8 Aug 2022 15:56:09 +0200
Message-ID: <CAEHkU3WJ75W0RAtSKECNHmr-KLmZyziPz_t80wFNubxvGvD21g@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: display: add new bus-format property
 for panel-dpi
To: Marek Vasut <marex@denx.de>
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 max.krummenacher@toradex.com,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek

On Wed, Aug 3, 2022 at 10:21 AM Marek Vasut <marex@denx.de> wrote:
>
> On 6/28/22 20:18, Max Krummenacher wrote:
>
> Hello Max,
>
> [...]
>
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > index dae0676b5c6e..52f5db03b6a8 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
> > @@ -26,7 +26,28 @@ properties:
> >     height-mm: true
> >     label: true
> >     panel-timing: true
> > -  port: true
> > +
> > +  port:
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > +    description:
> > +      Input port node, receives the panel data.
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > +
> > +        properties:
> > +          bus-format:
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +            minimum: 0x1001
> > +            maximum: 0x1fff
> > +            description: |
> > +              Describes how the display panel is connected to the display interface.
> > +              Valid values are defined in <dt-bindings/display/dt-media-bus-format.h>.
> > +              The mapping between the color/significance of the panel lines to the
> > +              parallel data lines are defined in:
> > +              https://www.kernel.org/doc/html/v5.17/userspace-api/media/v4l/subdev-formats.html#packed-rgb-formats
>
> I am not sure whether I should re-open this discussion, but I still
> wonder, wouldn't it be better to describe the DPI bus color channel
> ordering (RGB, BGR, ...), width of each color channel in bits, pixel
> format (RGB, YUV, ...) instead of using specific constants for the
> entire format ?

From a system view it would be hard to define that structure which
will catch any and all future requirements. Assume that there will be
3D panels and they will need an additional depth field. Or in
in addition to RGB data there will be a fourth color component. Or
whatever the panel manufacturers might come up with...
Or consider the Tegra 30 example I brought up in this thread. Tegras can
output RGB666 for 18bit panels, and then use the next 8 bits to extend
to 24bit (Maybe RGB666RGB222 ?).
https://lore.kernel.org/all/71ef1b35301330d0bbb64844247b6c4c2237ad1c.camel@gmail.com/
If such requirements pop up the enumeration can be extended with a new
value without changing the binding in any way, with a structured
approach this will require changed bindings, maybe even with issues
in backward compatibility.

From an implementation perspective for Linux the busformat in code is
currently an enumeration. So one would have to take the device tree
structured busformat and run it through a potentially complicated
function to get to the Linux busformat enumeration value. The final
consumer has no advantage over what is there today.

IMHO a change away from one enumeration value to a structured approach
creates some drawbacks without any obvious advantages.

Comments, other views on that?

Regards
Max

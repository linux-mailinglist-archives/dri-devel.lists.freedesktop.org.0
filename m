Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E70D09F7B0D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 13:18:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66E210E498;
	Thu, 19 Dec 2024 12:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="FJrgoOVW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390F310E13C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 12:18:37 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-6f277a1ecfdso4952887b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 04:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734610716; x=1735215516;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZKElXei+0mSP3tUshAw0E8nj/P9Wr6r0nFHCMfiQMBM=;
 b=FJrgoOVWJUPrpsuyhW2iI+tOkEjKxFplGOMVkl6XxAFyFTlOSrJ/mUnydnqMnMYJ0M
 z98kIs1l8tqbMmd1vmboAT1ShgWyU9r5SDsdvylhLeU6vf8R0of27xlAH0x3TmGSr0Ag
 QN0oRMfjZa94TBBf3XRABpNHLFh9+5JHOut69RpmM+G/Xm0NJeUMPw3dxDPtavkE180c
 Wuo45ZytgbmrY/ZClP7PFx9HSs35xpKGSqiCvdzITwWpdr4uA3i7aNQsRe1wBPyQIBlc
 bNgke9kr9GOLqm3JNQMJvGiR8rWWcGCyf4ONEybOe3+RWOJn+q6Lp3FsMy+i9iBDIOZL
 BWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734610716; x=1735215516;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZKElXei+0mSP3tUshAw0E8nj/P9Wr6r0nFHCMfiQMBM=;
 b=vCOv29tdpyiXpYBY7n9OSIyr3iYupgBdGNObGeqld3OoVNuhkUcLLxwNShunY58n0+
 /t2GyNEkYxaI/TUpnrmjWAnZLokVEN7LpxK94IhFhn7W2PUCcWHTx72jNjBcN7kEs0Xp
 NjFEeVBRGjzO+XpYpRJV+F9bwN1vg9jkm2bPB8Y4aGhkw5zhh/oiZzX1hTWwZDsgbr4w
 wssOIYTjmgjg+JhlEjkhukKcHrk0IibzuwvwJLLw3O3eqJ38hYTut0Vsp1ZqWrWfB4KN
 vzopzV3mrkGQx3sSNJPqnyB7tOjAM/L8p5/AZKh1LElnUBARqxDBu/Ij03Be6WaNUcBV
 M+kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaWnLahla6HFs5AvwGtZCUzaa3GHShBeG7+O2ZS+ileaiWu6vO05ZB1S2ccvWsuXChT51DEMFsK6E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaXj4jCP5bJDU633VqW1WeL4yZnOW1l5pz4Ssihyqhku5aPit2
 amDPd8afOTYwHCbCOBUCTAY/83DcN4rTy4jAktM0CdFUzGVz2Ji0G6X+AwVx9AMC4tSUaRutcfK
 GJ6kBAJk14qtm1tK8fmmFQqDXqpFus8/Z4SgVMA==
X-Gm-Gg: ASbGncvfmB7ZkYdZ5pb3LwCZVcH0/1H+eCjPBk85cuZ5jb9KF9FCy6UQojp0QxU3hiw
 iG7+n13A9fHVAl6xRm+qjETC7m2E4t4O4RKauGg==
X-Google-Smtp-Source: AGHT+IHraW7wpbF8fJqXT45CLs6MHm0bG2jAMI06aKTMUcj3YkWcIfGKnVrC7HIFs/1/hf+1Y67F/W4zse9YCT/oErg=
X-Received: by 2002:a05:690c:6107:b0:6ef:e39f:bb1 with SMTP id
 00721157ae682-6f3e1bd4915mr25231957b3.27.1734610716405; Thu, 19 Dec 2024
 04:18:36 -0800 (PST)
MIME-Version: 1.0
References: <20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com>
 <20241218-dt-bcm2712-fixes-v4-2-54cc88b6c229@raspberrypi.com>
 <lzvcaspulvsulbulqinzftt3xtdyro64hi674u2bnkpvbrihri@e2o247mjom5s>
 <CAPY8ntCX8+yg1RFhAXu4ystGF_JivTh43RY=k2P0bUm5JxvzRA@mail.gmail.com>
 <09bee93e-48bd-4a7c-b975-b10dce945d60@kernel.org>
In-Reply-To: <09bee93e-48bd-4a7c-b975-b10dce945d60@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 19 Dec 2024 12:18:18 +0000
Message-ID: <CAPY8ntDWGaY9__BdR9Sfmom6YsZEhRZZsLghRNR1cvAZMxJyMA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: display: Fix BCM2835 HVS bindings for
 BCM2712
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Eric Anholt <eric@anholt.net>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Doug Berger <opendmb@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Thomas Gleixner <tglx@linutronix.de>, Stefan Wahren <wahrenst@gmx.net>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Florian Fainelli <f.fainelli@gmail.com>, linux-gpio@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 19 Dec 2024 at 12:14, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 19/12/2024 12:54, Dave Stevenson wrote:
> > Hi Krzysztof
> >
> > On Thu, 19 Dec 2024 at 08:42, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On Wed, Dec 18, 2024 at 02:48:33PM +0000, Dave Stevenson wrote:
> >>> Commit 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
> >>> added the compatible string for BCM2712, but missed out that
> >>> the number of interrupts and clocks changed too, and both need to be
> >>> named.
> >>>
> >>> Update to validate clock, interrupts, and their names for the variants.
> >>>
> >>> Fixes: 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
> >>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >>> ---
> >>>  .../bindings/display/brcm,bcm2835-hvs.yaml         | 84 ++++++++++++++++++----
> >>>  1 file changed, 70 insertions(+), 14 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> >>> index f91c9dce2a44..fd25ee5ce301 100644
> >>> --- a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> >>> +++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> >>> @@ -20,11 +20,20 @@ properties:
> >>>      maxItems: 1
> >>>
> >>>    interrupts:
> >>> -    maxItems: 1
> >>> +    minItems: 1
> >>> +    maxItems: 3
> >>> +
> >>> +  interrupt-names:
> >>> +    minItems: 1
> >>> +    maxItems: 3
> >>>
> >>>    clocks:
> >>> -    maxItems: 1
> >>> -    description: Core Clock
> >>> +    minItems: 1
> >>> +    maxItems: 2
> >>> +
> >>> +  clock-names:
> >>> +    minItems: 1
> >>> +    maxItems: 2
> >>>
> >>>  required:
> >>>    - compatible
> >>> @@ -33,17 +42,64 @@ required:
> >>>
> >>>  additionalProperties: false
> >>>
> >>> -if:
> >>> -  properties:
> >>> -    compatible:
> >>> -      contains:
> >>> -        enum:
> >>> -          - brcm,bcm2711-hvs
> >>> -          - brcm,bcm2712-hvs
> >>> -
> >>> -then:
> >>> -  required:
> >>> -    - clocks
> >>> +allOf:
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            const: brcm,bcm2711-hvs
> >>> +
> >>> +    then:
> >>> +      properties:
> >>> +        clocks:
> >>> +          items:
> >>> +            - description: Core Clock
> >>> +        interrupts:
> >>> +          maxItems: 1
> >>
> >>
> >> clock-names and interrupt-names: false, unless driver needs them but all
> >> this should be explained in the commit msg because it would be a change
> >> to the binding.
> >
> > False it is then.
> >
> > Is there actually a full guide to binding requirements?
> > https://www.kernel.org/doc/html/latest/devicetree/bindings/writing-schema.html
> > is the closest I've found, but it doesn't obviously cover these types
> > of things.
> >
> >>> +
> >>> +      required:
> >>> +        - clocks
> >>> +
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            const: brcm,bcm2712-hvs
> >>> +
> >>> +    then:
> >>> +      properties:
> >>> +        clocks:
> >>> +          minItems: 2
> >>> +          maxItems: 2
> >>> +        clock-names:
> >>> +          items:
> >>> +            - const: core
> >>> +            - const: disp
> >>> +        interrupts:
> >>> +          items:
> >>> +            - description: Channel 0 End of frame
> >>> +            - description: Channel 1 End of frame
> >>> +            - description: Channel 2 End of frame
> >>> +        interrupt-names:
> >>> +          items:
> >>> +            - const: ch0-eof
> >>> +            - const: ch1-eof
> >>> +            - const: ch2-eof
> >>> +      required:
> >>> +        - clocks
> >>> +        - clock-names
> >>> +        - interrupt-names
> >>
> >> My previous comment still stands. Reply to people's feedback instead of
> >> ignoring it.
> >
> > Your previous comment was
> > "Why requiring last two names? Commit msg does not explain that."
> >
> > I didn't ignore it. The driver needs them, and the commit msg states
>
> Uh, so someone added undocumented ABI. How this passed any checks? Or no
> one cared to run validation?

See the cover letter:
"I missed the DT errors from the recent patchset[1] (DT patches
in linux-next via Florian, DRM bindings patches on dri-misc-next)
as Rob's bot report got spam filtered, so this is a fixup set."

> > " but missed out that the number of interrupts and clocks changed too,
> > and *both need to be
> > named*.
>
> Ah, I really did not get this.
>
> > Update to validate clock, interrupts, and *their names* for the variants."
>
> Please say explicitly that since some commit driver needs this. There
> should be a clear reason in the commit msg why you are adding this ABI.

OK, will do.

  Dave

> Best regards,
> Krzysztof

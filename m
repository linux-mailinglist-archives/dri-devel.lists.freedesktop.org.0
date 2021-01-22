Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA16F30042A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 14:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C156E9F4;
	Fri, 22 Jan 2021 13:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFEA76E9F4
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 13:29:04 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id 190so4330278wmz.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 05:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=owT9ZDTqHXNrbWE+7r0Lrony8G5r+UvHg072nHQs1m8=;
 b=IV9BDspRaepjk9Ex4ccn5wbH1nNpKqXl4rEfsScHxjVPiyJWPnD24oli1MhIZhGOOt
 5OyUyknNAjoE5rPNRt5izFGIdVJCgMqZc3OLBOU6aYT8kKpDFhXbjm2Emct+sNXK+pgT
 wQzpu03L1JLg49FhsdPSUzmkKTAGwjwmB6orEAtgPrjHOtj2j72bePNePfTiPGWuddWz
 sm7lUJYcXiJV5jGKTlz4sFagmBUMxLCyMDik4MHM/lSIMNELIRwj9/kEhrnxYV5sG2OR
 tbq8jumBegYoqpHH34TJ4D0ZgF4joIUPySflSw0vAIsJT6zV3GYbuVlqkznllIuJQNie
 YHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=owT9ZDTqHXNrbWE+7r0Lrony8G5r+UvHg072nHQs1m8=;
 b=mhcwNvKNb3gM7cWlqJBHUzt38TVYHSRvkXF7ADuoKfBniFOR4ENmgfR0cDHBy4eGU8
 SYn9Hl77ZCFRAxTUVsOLl9LL9xa8cVaaN9jWHhaa1nhMzEkU9XOJpnF0A7iAu+pFKr7K
 pDKiytK/SYxSmoIblUjPcRMx2G7SM6qduw3GJcRmzou7fqJqPEs0YuS8y+sdSOcZL3Bl
 XmkvaKqMp8hICQQXUN1wkyYV5Pkp0zTTE6Km4Q11ldCugyfXGtdVAmkOM2t/JdGXnQsd
 AQSrab1XcH+gqbVJ/XKb0SceMgV9oM3FeZpXyV3bI5lF0ZPtCqao/ipuzEe5GqdXRhNN
 s9cw==
X-Gm-Message-State: AOAM532WicghwQK8VvO5e3aPds/w3zaCm56DBkEnTzXYsm9+DNRfmbTN
 8Y7JpJ72/KnJD+jJg1Pl32/B3owPrW+se/phXfMKYQ==
X-Google-Smtp-Source: ABdhPJz2p5y4L7mSAemntP7ClkJC7I4pddYEtJGeJK0fpUzZ1TeA0drUIpISuCVyOD0oSQ65imTpSrX5n2anLJKUSCw=
X-Received: by 2002:a1c:dc46:: with SMTP id t67mr3858329wmg.183.1611322143536; 
 Fri, 22 Jan 2021 05:29:03 -0800 (PST)
MIME-Version: 1.0
References: <20210111142309.193441-1-maxime@cerno.tech>
 <20210111142309.193441-14-maxime@cerno.tech>
In-Reply-To: <20210111142309.193441-14-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 22 Jan 2021 13:28:48 +0000
Message-ID: <CAPY8ntA1iAj39hzfDLg18bT5ZLA6h738suDubw5hnh=9yhMQsA@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] dt-binding: display: bcm2711-hdmi: Add CEC and
 hotplug interrupts
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Mon, 11 Jan 2021 at 14:23, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The CEC and hotplug interrupts were missing when that binding was
> introduced, let's add them in now that we've figured out how it works.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Looks reasonable to me, but I'm not a DT bindings expert

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  .../bindings/display/brcm,bcm2711-hdmi.yaml   | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> index 7ce06f9f9f8e..6e8ac910bdd8 100644
> --- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> @@ -53,6 +53,24 @@ properties:
>        - const: audio
>        - const: cec
>
> +  interrupts:
> +    items:
> +      - description: CEC TX interrupt
> +      - description: CEC RX interrupt
> +      - description: CEC stuck at low interrupt
> +      - description: Wake-up interrupt
> +      - description: Hotplug connected interrupt
> +      - description: Hotplug removed interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: cec-tx
> +      - const: cec-rx
> +      - const: cec-low
> +      - const: wakeup
> +      - const: hpd-connected
> +      - const: hpd-removed
> +
>    ddc:
>      allOf:
>        - $ref: /schemas/types.yaml#/definitions/phandle
> @@ -90,7 +108,7 @@ required:
>    - resets
>    - ddc
>
> -additionalProperties: false
> +unevaluatedProperties: false
>
>  examples:
>    - |
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

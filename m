Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1395A1103
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 14:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B03C10E12E;
	Thu, 25 Aug 2022 12:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BB410E12E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 12:49:00 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id 2so17925909edx.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 05:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=ym8VD6eheRh4O0YL8XP6Eq/JaLBv0UzLgvnOYDxQwB4=;
 b=bfwQImYR9EDcDK6dHeOyusunhQvcerQfYUkHW7SsriAcvxzJdOIT6okTAf2nVYM3cf
 xQn5JZQHXO87xG/t4M7Sk7Ru4kCrPCIYSKyfSRDofMggtNEMImlGU7cl6DjqESOkX1If
 /To3o59+sHu/R1sjv5+p8ZHFpGCt/blHsIyqYoaViiEhKuB9fsE+DmWQYNHmOEVvVtDx
 exIMmxZ519Bik26nhjxE/Nui9uQYfyQVXCZAlR4eD4h9r4z2iqy3KERjdJ5lfqnznCQK
 f3MN1C23BKDVLcgapuaVLYluWvn/WLeyueakuM/YX8VHEum15odM/lMAyy+k1b6EMlt7
 nYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=ym8VD6eheRh4O0YL8XP6Eq/JaLBv0UzLgvnOYDxQwB4=;
 b=Z94cx8CyzuBmRZUg4e7+1LRWOBrWQbbXK5oTl4piUdiCS9/gMit7GiWhTbE0EkrXzq
 CVLbttZKazAK1m1JlVTgLhvvXjAidIeFEXqc5bcNGfryX+eEn5poyOtclNCValESpCCs
 kiPT804+mdq0LjXThYYZ9EP+l6+vpuRipWF9zhzQwaTUY5cAQFvLCC5g+NnEkIHNpind
 tuLcDJAbjq5KQBmFAIZAFBt8Xmp1JVHZQquvr0a/cFAxCQN/+T2lMqPQkyeP9ae6yAbN
 vgn5zz5gOV0aZ56jl01yA9xwVWRtFaqWHlw8nXHD0ImdHkS+hPy/RveIyrc9nh3mKp9O
 ROwA==
X-Gm-Message-State: ACgBeo2OIoN79vZjiZIecF95ULKadKwUqNKtvFhV2Wd17G6wOBHCE+1q
 a12OGS8EOc5S4d/hbUjtbIPgcxe8k21uvSQdUxOL+w==
X-Google-Smtp-Source: AA6agR4InnMcdPnsaSyYK0DwpBZB3SytLEmMBwQSTY2aOWHfgCcihr8tofDZo3j9JBuWThNjR4hbtYbGcsro94OFDzc=
X-Received: by 2002:aa7:c84f:0:b0:446:2bfb:5a63 with SMTP id
 g15-20020aa7c84f000000b004462bfb5a63mr3146146edt.172.1661431738874; Thu, 25
 Aug 2022 05:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220113144305.1074389-1-narmstrong@baylibre.com>
 <25976b46-21b4-6e3f-0182-85dd4ca2b654@gmail.com>
 <a4a36360-3f77-17a0-9239-08cb8c08de74@baylibre.com>
 <13bd6440-9a61-d444-518c-f4e8cba0b825@baylibre.com>
 <5a1df5ce-a497-760b-8e2c-130a0e659c0b@gmail.com>
 <3725619d-72c5-5c9d-513b-80bbc727dd07@baylibre.com>
In-Reply-To: <3725619d-72c5-5c9d-513b-80bbc727dd07@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 25 Aug 2022 14:48:47 +0200
Message-ID: <CACRpkdbucRqf80UB+AikYQGsHPiDJffP9dqkqx+RX8Nkdg3eaw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: sii902x: add support for
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: jonas@kwiboo.se, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 Rob Herring <robh+dt@kernel.org>, robert.foss@linaro.org,
 andrzej.hajda@intel.com, Sudeep Holla <Sudeep.Holla@arm.com>,
 Dmitry Osipenko <digetx@gmail.com>, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 17, 2022 at 3:31 PM Neil Armstrong <narmstrong@baylibre.com> wr=
ote:
> On 15/08/2022 02:15, Dmitry Osipenko wrote:
> > 08.08.2022 12:51, Neil Armstrong =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> On 08/08/2022 11:15, Neil Armstrong wrote:

> >>>> This patch broke ARM/QEMU vexpress display because of_drm_find_bridg=
e()
> >>>> always fail with -EPROBE_DEFER. Reverting this patch returns display
> >>>> back. Please fix or revert, thanks in advance.
> >>>
> >>> Can you share a QEMU cmdline to reproduce ?
> >>
> >> Actually the vexpress DT has multiple input ports instead of a single
> >> input port at @0
> >> and an output port at @1 like documented in the bindings:
> >>
> >> vexpress-v2m.dtsi#L303-L307:
> >> ports {
> >>      #address-cells =3D <1>;
> >>      #size-cells =3D <0>;
> >>
> >>      /*
> >>       * Both the core tile and the motherboard routes their output
> >>       * pads to this transmitter. The motherboard system controller
> >>       * can select one of them as input using a mux register in
> >>       * "arm,vexpress-muxfpga". The Vexpress with the CA9 core tile is
> >>       * the only platform with this specific set-up.
> >>       */
> >>      port@0 {
> >>          reg =3D <0>;
> >>          dvi_bridge_in_ct: endpoint {
> >>              remote-endpoint =3D <&clcd_pads_ct>;
> >>          };
> >>      };
> >>      port@1 {
> >>          reg =3D <1>;
> >>          dvi_bridge_in_mb: endpoint {
> >>              remote-endpoint =3D <&clcd_pads_mb>;
> >>          };
> >>      };
> >> };
> >>
> >> bindings:
> >>    ports:
> >>      $ref: /schemas/graph.yaml#/properties/ports
> >>
> >>      properties:
> >>        port@0:
> >>          $ref: /schemas/graph.yaml#/properties/port
> >>          description: Parallel RGB input port
> >>
> >>        port@1:
> >>          $ref: /schemas/graph.yaml#/properties/port
> >>          description: HDMI output port
> >>
> >>        port@3:
> >>          $ref: /schemas/graph.yaml#/properties/port
> >>          description: Sound input port
> >>
> >> The patch is conform to the bindings, the DT was working but is actual=
ly
> >> not valid.
> >
> > I haven't looked closely at how to fix this properly, but if we can fix
> > it using of_machine_is_compatible("arm,vexpress") workaround in the
> > driver, then it will be good enough at least as a temporal fix, IMO.
>
> If other maintainers are ok with that, it can be temporary fix until the =
DT gets fixed.

That's fine with me, will you send a patch?

I don't know how you expect the DT to get "fixed" though.

The hardware looks like this, it's maybe not the most elegant
electronics design but it exists, so... I wrote this DT with two
inputs, see commit f1fe12c8bf332, the code handling this
awkward mux is part of the DRM driver, see
drivers/gpu/drm/pl111/pl111_versatile.c function
pl111_vexpress_clcd_init() for an idea of how it works.

Yours,
Linus Walleij

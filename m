Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01525210498
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D52B6E7F1;
	Wed,  1 Jul 2020 07:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9A66E21D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 21:03:36 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id m26so12219438lfo.13
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 14:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=PjU8LAZRfkKwjEfQp/C6gHlytaYYnBRvg8dwpQ1D6Cw=;
 b=M51V8KCfEOfuNKYbStqI3kDXtEmV7at6P2apYiGE+5bYNNQN5nOi4JygqfIIkYfQGs
 cIKe83j3IJmzY2MNATDv+wll1XgWFTuQKvf1VO5S4n50abTcFmpXtSBNR2BsG5J8hGWN
 LMv6QCT3FFued2MgftsCVkKBNUd5NXrjpnQ+OCGgci6pauVCz+Og1UgfoSS6YM1YLSHy
 9Xl+xYqFV0fymcJ9ECtuTF5EvYJMgUauBKkyDy7iwhlk5Emkafj6RVdCm0K6rrV6eq+Y
 R1+RaIOrHOPcUWmVdD3/iova53XF753UTQUBnR2Yo1tm+jpQBoJte8Lxdeh9x1AvSCX1
 E/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PjU8LAZRfkKwjEfQp/C6gHlytaYYnBRvg8dwpQ1D6Cw=;
 b=N+TCI3CzoPqCD1ubdUMfnRHjbt2pMFslkI1ZcDR7CbopoQUsaWmbII0VXDhbpYwSo5
 uhRwlU3VoDM6DBOtDWRxvRyAsUQUd6FGtJdgyKs+NHpwVO+Jvd+mwHD4VcIEP2doIBc0
 L+YJWyAczlu/GQ5Jy0CKahCsS5XIEccQK90dMc7HBzfMnvHTcky+0t8uVcD9u0NOAGUg
 uZt1WNKB6Gtvikhr7xMEhg9QO/m7M+RV0LFkWf/ckj57HeSbWqHJRcR9iW1pd5/iEzWf
 XgpFgB1C9RAK3VbvcoNxul+iwLFQjeVfTMRndwppkz/Dh/x0z+wKrpum86A/HeoVhxgM
 6TVg==
X-Gm-Message-State: AOAM530cWCa2f0+K8SOGNfdW4RMVjrJXz5spTeMj8eo1+52bhtjud4ni
 dei5wpCK8E+Gr5qB9k+DOHzewg==
X-Google-Smtp-Source: ABdhPJwUbEeifJyd/WCrFKRdiRUNY5LgqYyFB6ZwCRtvzJWrwr67EOgsIxyATWjjD/Ovcu5Ey+/Ltw==
X-Received: by 2002:a05:6512:550:: with SMTP id
 h16mr12999586lfl.155.1593551013088; 
 Tue, 30 Jun 2020 14:03:33 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
 by smtp.gmail.com with ESMTPSA id 16sm1088750ljw.127.2020.06.30.14.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 14:03:32 -0700 (PDT)
Date: Tue, 30 Jun 2020 23:03:32 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 8/8] dt-bindings: media: renesas,vsp1: Add
 power-domains and resets
Message-ID: <20200630210332.GH2365286@oden.dyn.berto.se>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-9-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200621004734.28602-9-laurent.pinchart+renesas@ideasonboard.com>
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thanks for your patch.

On 2020-06-21 03:47:34 +0300, Laurent Pinchart wrote:
> The power-domains and resets properties are used in all DT sources in
> the kernel but are absent from the bindings. Document them and make them
> mandatory.
> =

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../devicetree/bindings/media/renesas,vsp1.yaml    | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/=
Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> index 65e8ee61ce90..990e9c1dbc43 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> @@ -29,6 +29,12 @@ properties:
>    clocks:
>      maxItems: 1
>  =

> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
>    renesas,fcp:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> @@ -39,6 +45,8 @@ required:
>    - reg
>    - interrupts
>    - clocks
> +  - power-domains
> +  - resets
>  =

>  additionalProperties: false
>  =

> @@ -59,24 +67,30 @@ examples:
>    - |
>      #include <dt-bindings/clock/renesas-cpg-mssr.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a7790-sysc.h>
>  =

>      vsp@fe928000 {
>          compatible =3D "renesas,vsp1";
>          reg =3D <0xfe928000 0x8000>;
>          interrupts =3D <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
>          clocks =3D <&cpg CPG_MOD 131>;
> +        power-domains =3D <&sysc R8A7790_PD_ALWAYS_ON>;
> +        resets =3D <&cpg 131>;
>      };
>  =

>    # R8A77951 (R-Car H3) VSP2-BC
>    - |
>      #include <dt-bindings/clock/renesas-cpg-mssr.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a7795-sysc.h>
>  =

>      vsp@fe920000 {
>          compatible =3D "renesas,vsp2";
>          reg =3D <0xfe920000 0x8000>;
>          interrupts =3D <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
>          clocks =3D <&cpg CPG_MOD 624>;
> +        power-domains =3D <&sysc R8A7795_PD_A3VP>;
> +        resets =3D <&cpg 624>;
>  =

>          renesas,fcp =3D <&fcpvb1>;
>      };
> -- =

> Regards,
> =

> Laurent Pinchart
> =


-- =

Regards,
Niklas S=F6derlund
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

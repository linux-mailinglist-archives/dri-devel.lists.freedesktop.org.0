Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E19B42104B7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:13:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0DE6E846;
	Wed,  1 Jul 2020 07:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7C16E20D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 20:58:03 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id g2so12238276lfb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 13:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=EbyJV6g/uyUJORIQ2AxW8gw0jjjqKQQQTjYvIEfzAoA=;
 b=D6IkqLkWN8VRo8wR1ikHhzGksjBqW388X+LnAW0xTTUkcGSJXnl8fumK7woerGLiU+
 Sl87kPB5WT594MAnDjLJJu+Yt2Lcyl7AYxTOh5/mI0orbTYoHl+B9js8+JfNSObT24e8
 6si1BwpBTKOTnNMWUhHwMYzig23Iil0u0s7Yv1UcB49BEwZau8MleUJAOcOJEFauN8fk
 6HGMKVLlRRsiCI3WfOHo5oskcest2qqu2Z8WhePGGnRc7osQmbEOsi3vZoswmakHOesh
 z2wPsD/dCWrHRc2wMgF8UUrNwBkOlgGRzYuABkZhTy8Ah/iBv1EXqC899RgGH6cU8+Tn
 lx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EbyJV6g/uyUJORIQ2AxW8gw0jjjqKQQQTjYvIEfzAoA=;
 b=Y5RMnp7dn2GLCinuudZc6EwhTXPM1xECbAV8XjPtN+fPviecygjpOEjnhK5ph6+9h3
 YfXwL6eptAI1bcWRCAd0zniveY71TOEKZ5Hl34pDH4jSapf5RU6tseYbYsICJ4hjdXal
 8ZdWntqunUerjnbCXxNYenYlM8V6kJ3rzt5pap+oTMRFcoQcIP2jpqc3uF64NsVutyl8
 Vdwnit8t/JRJsideOTm6u6xEInB2502oZAHHPJgtQcc8R2PkuGPLciRWqCchJwOSgsr1
 +PKz07++x24X8JGCGH74bjaCe96FAx95shhratQrW98s/1KyLdD30pUQ91Oq1HiFg0y7
 OJig==
X-Gm-Message-State: AOAM532fn4Ye+iAKmMzAfbnOS0PWAHxPaui6F6QYB2eVDeFlPjZ4xpIk
 axKmHtlxALtgZ+qgcIcnOc7osQ==
X-Google-Smtp-Source: ABdhPJxz5sVEQVwJTYcLKyEeiEsD2Xn4q6UC0a65H+Irn8Oax/2H98ruTejfhWyxU85fQ0Tv6EO4KQ==
X-Received: by 2002:a19:dc08:: with SMTP id t8mr12922233lfg.191.1593550680232; 
 Tue, 30 Jun 2020 13:58:00 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
 by smtp.gmail.com with ESMTPSA id n1sm1090596ljg.131.2020.06.30.13.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 13:57:59 -0700 (PDT)
Date: Tue, 30 Jun 2020 22:57:59 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 6/8] dt-bindings: media: renesas,fdp1: Add resets
 property
Message-ID: <20200630205759.GF2365286@oden.dyn.berto.se>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-7-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200621004734.28602-7-laurent.pinchart+renesas@ideasonboard.com>
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

Thanks for your work.

On 2020-06-21 03:47:32 +0300, Laurent Pinchart wrote:
> The resets property is used in DT sources in the kernel tree. Document
> it and make it mandatory.
> =

> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> Changes since v1:
> =

> - Fix typo in commit message
> ---
>  Documentation/devicetree/bindings/media/renesas,fdp1.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/media/renesas,fdp1.yaml b/=
Documentation/devicetree/bindings/media/renesas,fdp1.yaml
> index 39184bd21a27..2a27a7296fea 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fdp1.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,fdp1.yaml
> @@ -32,6 +32,9 @@ properties:
>    power-domains:
>      maxItems: 1
>  =

> +  resets:
> +    maxItems: 1
> +
>    renesas,fcp:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> @@ -44,6 +47,7 @@ required:
>    - interrupts
>    - clocks
>    - power-domains
> +  - resets
>  =

>  additionalProperties: false
>  =

> @@ -59,6 +63,7 @@ examples:
>          interrupts =3D <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
>          clocks =3D <&cpg CPG_MOD 119>;
>          power-domains =3D <&sysc R8A7795_PD_A3VP>;
> +        resets =3D <&cpg 119>;
>          renesas,fcp =3D <&fcpf0>;
>      };
>  ...
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

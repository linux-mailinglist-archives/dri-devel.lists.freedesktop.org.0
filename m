Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C7AA52E4
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 11:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0430E89B30;
	Mon,  2 Sep 2019 09:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF5E89B30
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 09:35:21 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id f22so15049440edt.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 02:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=w7i56WxPDdLvrBHbBLcLHv4HjyZRwxFdeVPugCb27dg=;
 b=m1NaEVWUyGoo4Q1h/jAdM06HwNwUIuYW7zaXWch6E9OsPBDeG7PR3EuROF8PuA/4Tt
 0GaCDG4uxJwA+/x677K0YbAET4j6vb8hVJTQ2pzAVelrv4oeXkoVEunBmGC1TDjUcTxq
 zuRG82Zvx7c7HNqsLNhKI+eoO2j+7YUbNXRmEKPVkXnqOthRmUvQRWF6VkR+oQaQhJsh
 BdPi7lo9kCVk+3Ln4hbcrcVVsme3mjJGeeI+hrCOfm1oeLTItdNS5pBzbKUKddxZQVbv
 3VNBFFYJ6ct+33Os7KqFAFQUsLFol57GTCo0Ahmp0nrUUsyGENLY/uHeuz/CdP/rLI92
 oZKA==
X-Gm-Message-State: APjAAAVna8mWgPz9jTfpXHsuhSkqWc/h8ieXizmqyohQNDzueoBP/JaM
 kAghoJ4XuBv8zreDTU74ssc=
X-Google-Smtp-Source: APXvYqxvn9tBVEgMv3ZQMzCCT+5vHxqVnifBHtLx6qhrks+0PXPWXrCloxY94Bzte8dthm4hlhpfew==
X-Received: by 2002:a17:906:3fc7:: with SMTP id
 k7mr23901084ejj.208.1567416920440; 
 Mon, 02 Sep 2019 02:35:20 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id r19sm2795472edy.52.2019.09.02.02.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 02:35:18 -0700 (PDT)
Date: Mon, 2 Sep 2019 11:35:17 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] drm/panel: Add DT bindings for Sony ACX424AKP
Message-ID: <20190902093517.GA12946@ulmo>
References: <20190902090633.24239-1-linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20190902090633.24239-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=w7i56WxPDdLvrBHbBLcLHv4HjyZRwxFdeVPugCb27dg=;
 b=Pe3UK9EUl9JgtTwr3khNlkn2sKA/vUyNnwTXuOU1+rIYIt+qdcvXLL3UNcg2EIudd/
 6lblovuYrRr4a7qu2xJ5+W8xl8dMvD6F8zt4s6JIQUkls/0Q0ILkx9eg67Y8dLJ4b0tg
 +ZMfX2PqIBr18D4LPMnHQKy4ki1TwuC9AN1tCIrlWbLCxk9nS0TsSvoR2HahbCFxrm/9
 ZiGuAE3g3wZXnn8ERsbgwq2U2BDEaka4LH5u8YrPDn0SWNVo6apGITxJFad6KepdZy+y
 sYsOYgSXe2rAUcV1c/F7uEcfDimHUUX5dWW0H/ZfZbWl/+bYZ2IwHT/TGvT/2fOHSqHC
 gbzA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2015802104=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2015802104==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2019 at 11:06:32AM +0200, Linus Walleij wrote:
> This adds device tree bindings for the Sony ACX424AKP panel.
> Let's use YAML.
>=20
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../display/panel/sony,acx424akp.yaml         | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sony,=
acx424akp.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/sony,acx424a=
kp.yaml b/Documentation/devicetree/bindings/display/panel/sony,acx424akp.ya=
ml
> new file mode 100644
> index 000000000000..29f41fee1b69
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/sony,acx424akp.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/sony,acx424akp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony ACX424AKP 4" 480x864 AMOLED panel
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: sony,acx424akp
> +  reg: true
> +  port: true
> +  reset-gpios: true
> +  vddi-supply:
> +     description: regulator that supplies the vddi voltage
> +  dsi-command-mode:
> +     type: boolean
> +     description:
> +       If this is specified, the panel will be used in command
> +       mode instead of video mode.

I'm not sure there's concensus on this one yet. I think so far the
driver decides which mode to use the panel in. Technically this falls
into the category of configuration, so it doesn't really belong in the
DT.

I vaguely recall from discussions I've had on this subject that there's
usually no reason to do video mode if you can do command mode because
command mode is more power efficient. This was a long time ago, so I may
be misremembering. Perhaps you have different information on this?

Thierry

> +
> +required:
> +  - compatible
> +  - reg
> +  - port
> +  - reset-gpios
> +  - power-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    panel@0 {
> +        compatible =3D "sony,acx424akp";
> +        reg =3D <0>;
> +        vddi-supply =3D <&foo>;
> +        reset-gpios =3D <&foo_gpio 0 GPIO_ACTIVE_LOW>;
> +
> +        port {
> +            panel_in: endpoint {
> +                remote-endpoint =3D <&dsi_out>;
> +            };
> +        };
> +    };
> +
> +...
> \ No newline at end of file
> --=20
> 2.21.0
>=20

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1s4lAACgkQ3SOs138+
s6FUmRAAssnTFG30GwN6PL97FSCIhD/zIteo1zy1RyqFbFYPWPV/o1y8MhXBG7oQ
2RXLvB6k2GBjS2sNE1nIutDjTNG42pmnidIpDZxW0Tc7zra9+mE1Itgae4/kiKDw
pLuk1Qoc4TSvI/G3ScyASZw6rMTSr+JJN9pPWfek5K8+Fq6LXNNnoCkPjnsNpBH3
YOYsssA1JWNYqME4ve7f0O3NxYkv1XUFVha5XKhVbkJfn/8VJ8ABXyGG/UWFb75s
7hpLUkjHpO6d57kM9vJExrbXuvuefCj68n2x0CedHCd0NolwDwWfW7tghK3/S94l
SYNwppctPlx+D2vhBp5NUZO2yQfE4aOGLLezdkKdHaNAsJaMR+1eq5BU5eW8wGvE
K5Eu6QBnr+XtZ1bFxJdxq9F+cEZTIr3AB74Sd1Z4TAmgEJ8/u+16ppiPalSjCp34
jqODdxrxqLykN25eAwn96RlU8S/CdrCRnge8tal9iuP90gH1wj+Vn9ipxhMXHCPj
pV4F11fSei7xrXXt1hRGofXBUsO6dLJtaUHk3hhZa5oC76QWsVpULSxzqmHJyFdF
KUrh0JANdC4uUKaeSQs4NoVXAnq7AdRRCX771Ipycl0thV6kTSyrUI/Py1ukJajI
Q8t8xP/SUtklxhd9Tw1/bLJzy4f9+I/vBDbRK3GzkpsbxMkD3es=
=VxoP
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--

--===============2015802104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2015802104==--

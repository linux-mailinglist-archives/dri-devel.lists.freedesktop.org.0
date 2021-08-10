Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 207933E7CA3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 17:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB6389854;
	Tue, 10 Aug 2021 15:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD8E89854
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 15:43:43 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso2283477wmg.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 08:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Tnip+r7F4/z9nn06tEEoEy64A1xUTKQDwuabyuo00UM=;
 b=WFhliwfjNR2UDPKQ34rKuWI+89TaHhjfBnqx7mgsmLWTGj0kWTpIRdfCn0RAf5yZMq
 ctaRSKwnCN79tthvYKQIPZuOIaijo85HV7IUUKjhS5k8fXyPW37kPnKwJbA+nslOYWfK
 pRcTaQjZ4sV2QohldWjVy2hjuEmAgQI+qK5v8N/cD6UTKT2b0X/0qucByhO5BV9VVNWO
 95xO/eKpv4+F6np2HjDePsmmeuutoo8lZJgZt0vAzDCR+A1IagjEpvWocpQ0SjrT9PrT
 zWDbgRpSWpMHgj2An2JMBRRDJappLMoCefGkbsPPmVvBrcEK+g+LVCpI2TzpzWy8+7Do
 H7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Tnip+r7F4/z9nn06tEEoEy64A1xUTKQDwuabyuo00UM=;
 b=frWvXTsaCMiIcfYNqEs2BciFkZ8vQlN2nQ0Wg9mKXW7G6+GzFMMojn/2LHRbwsmPhQ
 xysgw6TW9mMlx2xj498/rTqX1JPlGcuUG/Wyu91uZez2dkK1RiyOYrrTQZB0EABi9Ex1
 RM5TisSIp8MVwOp2U4w0wUsWe4Epmd6BeCsZDogacmb3UAc3C+Ht+Y7QNq8qfYeY584f
 niq0yRNO5/wFTSv0/5K0I6RE5LegYd46TSDxW4IskSzufFMFj/LMIN7LqcqTuH0pkvho
 W2z+1oyOvGNxyP2q8M3c4qDSdcW2jcrdFlXTTSKnE/KF5h40BHNpPch9gYqI7/0zf/pJ
 qJnw==
X-Gm-Message-State: AOAM531X/ep0Q7HT67x0LPoqjFJ79Z4LSRMZw9SpcPtGap5j3DNALfyc
 ojyoOcELYVswhgI3zVtKvx8=
X-Google-Smtp-Source: ABdhPJyrXFtiWBZX/iqpMUwvql9VImtTVKBhvmPwpU94sRaJwTVHz5jyvnjwfgfPUDUJxv0ZdvbxNw==
X-Received: by 2002:a1c:f405:: with SMTP id z5mr5382798wma.33.1628610221497;
 Tue, 10 Aug 2021 08:43:41 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id w18sm25620287wrg.68.2021.08.10.08.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 08:43:40 -0700 (PDT)
Date: Tue, 10 Aug 2021 17:46:06 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>, Rob Herring <robh+dt@kernel.org>
Cc: jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: Add YAML bindings for Host1x and NVDEC
Message-ID: <YRKfPuf0SLU9RXgU@orome.fritz.box>
References: <20210806123450.2970777-1-mperttunen@nvidia.com>
 <20210806123450.2970777-2-mperttunen@nvidia.com>
 <YRKengKZmFtgsIZy@orome.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="G//wZ862ek2PTEA7"
Content-Disposition: inline
In-Reply-To: <YRKengKZmFtgsIZy@orome.fritz.box>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
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


--G//wZ862ek2PTEA7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 10, 2021 at 05:43:26PM +0200, Thierry Reding wrote:
> On Fri, Aug 06, 2021 at 03:34:48PM +0300, Mikko Perttunen wrote:
[...]
> > diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra2=
10-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra21=
0-nvdec.yaml
[...]
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: nvidia,tegra194-host1x
> > +then:
> > +  properties:
> > +    nvidia,instance:
> > +      items:
> > +        - description: 0 for NVDEC0, or 1 for NVDEC1
>=20
> I know we had discussed this before, but looking at the driver patch, I
> don't actually see this being used now, so I wonder if we still need it.

Oh, nevermind, upon closer inspection, I do see it used in the driver.

Thierry

--G//wZ862ek2PTEA7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmESnz4ACgkQ3SOs138+
s6EJSxAAqldttFWwp75vXQGSE+6i/aroYKOoS4UVyngCFgy5tqkb3cqF9pzYR0YN
8brXcJ5o3shp4eB6xw6e61l9jPNRnlFR2FOdAilfZwTg0qSm+e+ENv6inuT2hDZz
J+TOBZ9iFtZlk3h6Fl4bdPM7w9oL0EOuxnnpj+bBvWcct5PcNnjXTwek2CRARo80
kI/42mAq70BKAAjuDxKIbBXkSW1k90Vf2pqUfNDYSL5ZQvZdwMUT8jn/9B8GXReG
bmkha6XzHxjOZWNSf+obibcOf+aHVsHpkrMT6DmYr8/KZEZ2GZLnQannPE2kJuFe
NuDCcl2b1sfOLWdDh8DIY6Zun8DD6U0tjH26dP3H0Eh0eQcDSkvay/0K8bO7U3s5
yiMQaKONk925Z5vZV25lr+PQ6rz7SuSf7ycluvzeGiNmBLIgcpGNPK1e4AP0lWBL
wLgsYJdNqD3rlIac2bi0zawsQzbFe3p1/KM/5B3RClu2qMd1PYED1I2CqFuv/oot
LjOTnWDaXxg6bTDntW4RQKr8hb3LW473TOrtbB179LifDv/8Gh+FxINc1iDZD+FA
Fvhb6uY22wnXNRJJlldjFXnFnw+zpogSchIUmiCKdwGakTYSN6f/nyZci5LLJ7Yy
F0KXZu5eSVebEIrGHntdQR/3CA900incMHwhAyfNCz/DqzOUJYI=
=odc8
-----END PGP SIGNATURE-----

--G//wZ862ek2PTEA7--

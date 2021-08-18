Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 156BC3F055B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 15:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF4E6E5B4;
	Wed, 18 Aug 2021 13:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C416E5B4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 13:52:47 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id u15so1695621wmj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 06:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jOgcnBwrOLmqSugnm3cp6EhHEP/odkYp7u8LvN4y0lg=;
 b=sv1dJcbG/BmMEmc0L+mtgvhWHKBbBbMVxUrY86wqc5u6HQET66cZYEITfXJUNSTHEn
 jrjfV5d7wUQ3g5J9iHFadGhO8iEq42lKjTSMiagkIaX4AuP/rzNr4xMyozgDu5uPaS6h
 2UBX+3owGSOx0k9y7k052QcjRE5XDy7vJKzh9Q4bsty2sAy4aRWu7htOyNA23eybNJL/
 4+7RwBpzp4J5zPZ3+2N4LPiO2AlJc03/lV6N3wt/00s0qVHAu6wrV6KpyXWLLSMEpr1P
 rNXFpJDHlrxZW1dTPZBGwEqqMYIxsfxbNJEuKIjWJBrd8XNDoHi8ZJB42Q72+nkmSUtW
 B3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jOgcnBwrOLmqSugnm3cp6EhHEP/odkYp7u8LvN4y0lg=;
 b=mj9q/9gS/djoKn+c1rmAdkTXRCrJL/Qg1wiatsKB9Sok5BB8ljjr6yJZ9WZ+qyLQUh
 clzLu5+1Oitp6utJsU0kDDZCywJj20kzHKroKznBQqr19Qb6/Tz2NLdE7sIATdgkqcg+
 HsISZvpdDn9BJi4IBaMWMs0eNlTMffIyNo1SGIsC5iLDepSTbi31O7Vmn+bOnvDGCOVp
 O10OuAnSg9nKaMvQIYvpJ7eJHcrIghVdCudbR9jnz5T6hVaFW9S1XKmtv1gjmkVRaVlP
 66XHilX5afv9bbKSuazvCzeJ9Is5auTx3xApJVyA37heY2uDEW4sHPp2lNG7UG9M0cZA
 R1UA==
X-Gm-Message-State: AOAM531ZFgvkS+3wXc3gEWmmZC7nAVo/O2GJSTykOuwL+UJXYKeb7bTx
 LxchDvKcYO7WG7n+vOX7dI4=
X-Google-Smtp-Source: ABdhPJw2fCynEGecoHcSqyOPIsKQC3v0OYqKKW2tVbDgrsUECsFVvJCMwg2XxFHkvZO2YGRpijpYYw==
X-Received: by 2002:a1c:7902:: with SMTP id l2mr8617935wme.71.1629294766382;
 Wed, 18 Aug 2021 06:52:46 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id d4sm6036923wrz.35.2021.08.18.06.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 06:52:45 -0700 (PDT)
Date: Wed, 18 Aug 2021 15:52:44 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 06/34] dt-bindings: clock: tegra-car: Document new
 tegra-clocks sub-node
Message-ID: <YR0QrFGZs6iQv1N3@orome.fritz.box>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-7-digetx@gmail.com>
 <YRxfGtWPXeSQXuHo@robh.at.kernel.org>
 <06128217-92e1-9b66-64ea-91855d041121@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="axwoZ8lGgPeVqxL6"
Content-Disposition: inline
In-Reply-To: <06128217-92e1-9b66-64ea-91855d041121@gmail.com>
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


--axwoZ8lGgPeVqxL6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 18, 2021 at 04:44:30AM +0300, Dmitry Osipenko wrote:
> 18.08.2021 04:15, Rob Herring =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> +  tegra-clocks:
> >> +    description: child nodes are the output clocks from the CAR
> >> +    type: object
> >> +
> >> +    patternProperties:
> >> +      "^[a-z]+[0-9]+$":
> >> +        type: object
> >> +        properties:
> >> +          compatible:
> >> +            allOf:
> >> +              - items:
> >> +                  - enum:
> >> +                      - nvidia,tegra20-sclk
> >> +                      - nvidia,tegra30-sclk
> >> +                      - nvidia,tegra30-pllc
> >> +                      - nvidia,tegra30-plle
> >> +                      - nvidia,tegra30-pllm
> >> +              - const: nvidia,tegra-clock
> > You are saying the first string must be both one of the enums and=20
> > 'nvidia,tegra-clock'. You don't get an error because your pattern=20
> > doesn't match 'sclk'.
> >=20
>=20
> Could you please rephrase or clarify? If pattern doesn't match 'sclk',
> then it must match any other enum. I'm not sure what you're meaning.

"sclk" doesn't match "^[a-z]+[0-9]+$" because it's missing at least one
digit at the end. Perhaps that last + was supposed to be *?

>=20
> The 'nvidia,tegra-clock' actually could be removed since it's
> superfluous now. I'll consider the removal in v9.

It also looks like your schema was meant to be something like:

	compatible:
	  - items:
	      - enum:
	          - nvidia,tegra20-sclk
	          - nvidia,tegra30-sclk
	          - nvidia,tegra30-pllc
	          - nvidia,tegra30-plle
	          - nvidia,tegra30-pllm
	      - const: nvidia,tegra-clock

Note how the const: element is indented one more level. Now this means:
one of the enumeration values, followed by the constant value. That
matches what the example has.

That said, I agree that nvidia,tegra-clock seems a bit useless. There's
really no such thing as a generic clock, they're all different in some
way.

Thierry

--axwoZ8lGgPeVqxL6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEdEKkACgkQ3SOs138+
s6GVTA/+I75N/HheGyhGoMpEMo6FfeNzU7R/+NHB2FRurB/YrTa13bWZugoiwK1g
mphbxP5cVRf0bIp0B+K6eGuJtpoZleqT4Yd9ltzPj9QTo4jRjJfJpsv/enqpIKeV
hbbkb2LbO6wCifNJX5SEKvd4tP0eBZSJ/2yL+k7iZeAhu/gvAEpqc8W6Qu4tw8QN
T4dCZJObKv3yb2C9Yawh+cZ8FRKtUOBYLVR7pUuDf0iMMz+J/WaPVU8w8t9AYSoE
Luza/xoK5cyV1lia8TRRyZS16Y1Cq3Sdd+CZwSS5yL/NOgbbxX99brpelLlYiC4z
otx+pCoIgMjy7aeDt+FMUondNXka7Mf7gcSoCanpN5hbh4kyeRthkrD4MTmYJauA
1vcF0d/FFVCeT9wJ8R9adYBEzfMtqRojwYGibR/A/6tkbbg7BBwzXE0XQvLxwilO
idyOaV7eId9T7X6eIUv60hJ0pK5uSjrANgTZcSuq2MZSaAhYDeTjZuRtwTF4FgoD
/TGRVW15AIQDfopJMoXUCYXWxgoK4pGFLBKSMcaN5MZzas28c6BNZamkU/pdm/mZ
8GUmd6C29iG6w9wsMQxQ8lgvxUXR7Fe6rCtDUH23EqLJZp9GC8tmJa+cDPzuqQPY
5jYDCJOHyLz4Gc9lpyjeddOQv7y5FF5qQ1i9TYKuH8wGwEIeO1s=
=E/0K
-----END PGP SIGNATURE-----

--axwoZ8lGgPeVqxL6--

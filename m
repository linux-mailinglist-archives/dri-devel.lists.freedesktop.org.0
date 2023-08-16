Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F229077E66C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 18:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2515C10E389;
	Wed, 16 Aug 2023 16:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B92A10E389
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 16:30:46 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fe2d218eedso63652045e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 09:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692203444; x=1692808244;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kN+/MeWwb4xpyLHn6J6eExwJrjsTOcWApW30IeVPEqo=;
 b=px18AA6rYs7asy6SZqAwcVWO2kdW9bWI1E18BeawL6K2gYWLBSOEvLDxiE1e+3Oq4q
 kaw9kAyEHr36j6GFxFRQclT5nZN3PIA3+7TG7gjxNdwhPYTBBOb1eha7BOk55m5fX61/
 4BeGvElhHfRkc9Tx9FsqX+HNQri3Ma8egTDbds/45FnaIOT1eqyTGPoUrPTutBx+GGrj
 EsVMXIAxQ2jJGHMhKWKXyEUJ2KQo+XmGdtRopAm+DKFAz0rWW1cP3vhFEa/TsVzZPtd6
 k7wcBbSXUi+2q5aN6C+AoRNt/xwlInOPmVhMSYv5O5SdWnStUW7Hjk/A9aKGU15inySX
 4l2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692203444; x=1692808244;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kN+/MeWwb4xpyLHn6J6eExwJrjsTOcWApW30IeVPEqo=;
 b=GODPDW8ZKWKiFZIEwp4ZvqP1Kwmnb9EpQmmswm+MARANkfOffG+EWrgCtcJdQFQ5sp
 +6F+Dbf36SpXFkeT0PRajnHau/SFyp+XFiwwhsd1BiBX3HW7RWlzZKOtDdJbFzeGx36C
 LPUee8/ogpYkRmXYrI3bc+RexlXGP7Rm/KRgQDYMNdNcNzsFnf54nzc7LiuaVibehLFT
 GiY7rulcazuehP3rIEhekP0ScF5pPSgJe2o01w3utsgVUBpzBpGbqKPEBLB6G2o7XJ5G
 71xR+rOGnuBEwfsrCJRrCSotdL04SJFgcCBA/Ye8QPIeTYAUBZWpD2ujTOR9LoQ6x6gE
 o4Kw==
X-Gm-Message-State: AOJu0Yy93jl20XWPknTTxKKT1eu/YtjEVtSBbNic5WWC4hizW5NcWgAj
 xWqE3SLts9Y1mO30OOIpxIg=
X-Google-Smtp-Source: AGHT+IGJxLxNKFbkcjYlH3/0w0o58okKgCPkAfNoXD1GcC5Lf+eBFktxv5QzHgtRkwknyJtdjrqFuQ==
X-Received: by 2002:a05:600c:1d10:b0:3fe:6f7:60aa with SMTP id
 l16-20020a05600c1d1000b003fe06f760aamr1839716wms.12.1692203444134; 
 Wed, 16 Aug 2023 09:30:44 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 l6-20020adff486000000b003143867d2ebsm21884755wro.63.2023.08.16.09.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 09:30:43 -0700 (PDT)
Date: Wed, 16 Aug 2023 18:30:41 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: Re: [PATCH v3 0/5] Add JDI LPM102A188A display panel support
Message-ID: <ZNz5sSnxs_E8p_4J@orome>
References: <20230807133307.27456-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="elwzFP/2q1XL9FhM"
Content-Disposition: inline
In-Reply-To: <20230807133307.27456-1-diogo.ivo@tecnico.ulisboa.pt>
User-Agent: Mutt/2.2.10 (2023-03-25)
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
 sam@ravnborg.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--elwzFP/2q1XL9FhM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 07, 2023 at 02:33:00PM +0100, Diogo Ivo wrote:
> Hello,
>=20
> These patches add support for the JDI LPM102A188A display panel,
> found in the Google Pixel C.
>=20
> Patch 1 adds the DT bindings for the panel.
>=20
> Patch 2 adds the panel driver, which is based on the downstream
> kernel driver published by Google and developed by Sean Paul.
>=20
> Patches 3-5 add DT nodes for the regulator, backlight controller and
> display panel.=20
>=20
> The first version of this patch series can be found at:
> https://lore.kernel.org/all/20220929170502.1034040-1-diogo.ivo@tecnico.ul=
isboa.pt/
>=20
> The first submission of v2 can be found at:
> https://lore.kernel.org/all/20221025153746.101278-1-diogo.ivo@tecnico.uli=
sboa.pt/
>=20
> Changes in v2:
>  - Patch 1: remove touchscreen reset gpio property
>  - Patch 2: clear register based on its value rather than a DT property
>  - Patch 3: tune backlight delay values
>  - Patch 4: add generic node names, remove underscores
>=20
> Changes in v3:
>  - Patch 1: add Reviewed-by
>  - Patch 2: fix error handling, remove enabled/prepared booleans, add
>    dc/dc setting
>  - Patches 3-5: Split previous patch 3 into three different patches,
>    each adding a separate node=20
>  - removed previous patch 2 pertaining to Tegra DSI reset as it was upstr=
eamed
>=20
> Diogo Ivo (5):
>   dt-bindings: display: Add bindings for JDI LPM102A188A
>   drm/panel: Add driver for JDI LPM102A188A
>   arm64: dts: smaug: Add DSI/CSI regulator
>   arm64: dts: smaug: Add backlight node
>   arm64: dts: smaug: Add display panel node

I've picked up patches 3-5 into the Tegra tree and I assume the other
two will go in through drm-misc?

Thierry

--elwzFP/2q1XL9FhM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmTc+bEACgkQ3SOs138+
s6GQZhAAidv6lMphxvbthO7t7ZsPU2NIAu7pQuMyhMa5O7ht7k+R//LlxBUBcHHL
eIJz+muY0+DWC43XsM90TZGSIKXBaUlfo9kvHiqWCuu3BAW56csYDKGgaocwzhml
0hCJ8nEo0N2dKa/stZvsk5ZPKj7HWp71eB6zyqeoPh3Ljv616NJ7WC5/zbgtu4ay
pNtXnwYqI8Bai4fwd5cnNsL9gqn++jCb91AG+7v8uSJ0uSg8M43nBi/crGbyKPys
58H8e6NqsogzdpjjJaC+bpTuZ7+4kjiuh/EHV30/TaTimeoyQ9BC8ibYJPXPHSn6
mQPo81hSH0Ps8AtfWZemxCYsFm/aN3LKm8M5dK+ciuDq+8fA1q0NTiU0w1x7FeVc
gx4+CfhBCUn4IFQfIZZ5FhFNj/SkPSqbDYKJ5wHHXMjqxdA8KipO4+Eq75NAM2b2
LvHhvQhDv336l+SGny+lkBl/d2UXba8cfmZFSjmlmGMjJwtkAD/Mv4q8aiutQNWM
shFsW44B40H9C1IDGJzcw4q3BtjjGLwlpw136D2CNhNuV3HzTgBEoF6YyQS83HID
iDLpc5zIaieR2AvOt47JuN9CmORny+AdYimRqde3zEKziLY90thIFXsjaJ6+HVUU
zb76G6jSl0g1pBoyK2cyye8NBEuUAep5r/wi/6Oiytu+IMOFySE=
=tplE
-----END PGP SIGNATURE-----

--elwzFP/2q1XL9FhM--

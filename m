Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 679EB81D480
	for <lists+dri-devel@lfdr.de>; Sat, 23 Dec 2023 15:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8632F10E0D5;
	Sat, 23 Dec 2023 14:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::bc])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4E610E0D5
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Dec 2023 14:18:11 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1703341089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PgAKrzFUuBY/aRZdG/sV9t0Klms7KMGcDs+12G81t/o=;
 b=mjWC7BbO22IYp9BhC/jUQ1r8tbAUbhktMbgJwM99pf3WvyVc1sI1SOnFItgAj87ZFAdsqk
 uiamEOz6g8pKsPX/FBQUTBsnqhoHGbq6uFNSXHJ5Oz7MPU0mX2f+dqKL2rHm/Rv0KLDUaX
 +Ls+BuIi6iTiv6fyafYawZ63NGyHqoNqc0KupplpFdw+e6kDTFbTwOcTBWHwfY+/yFSg48
 wVwcq1FjcVQ6GWnQbSr2e3rWcRZ3nt91chwlQ60tAvt47FmoR8Z7wwsbukc/lNsL6i44Dj
 J3ImyV5P2/dzL2d7m28SIqgb5/0K43I43OvM0U0onbOsmVfQYsP0e2pgs1oUqg==
From: Diederik de Haas <didi.debian@cknow.org>
To: Manuel Traut <manut@mecka.net>
Subject: Re: [PATCH 4/6] arm64: dts: rockchip: Add devicetree for Pine64
 Pinetab2
Date: Sat, 23 Dec 2023 15:17:58 +0100
Message-ID: <1883322.fLvJxeCpJd@bagend>
Organization: Connecting Knowledge
In-Reply-To: <ZYbnxkkCIJtzqa0h@mecka.net>
References: <20231222-pinetab2-v1-0-e148a7f61bd1@mecka.net>
 <2121710.IWpXjAX0fk@bagend> <ZYbnxkkCIJtzqa0h@mecka.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart28392273.q4UQjrvTh7";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Migadu-Flow: FLOW_OUT
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
Cc: linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Segfault <awarnecke002@hotmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Mark Yao <markyao0591@gmail.com>, Arnaud Ferraris <aferraris@debian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--nextPart28392273.q4UQjrvTh7
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Diederik de Haas <didi.debian@cknow.org>
To: Manuel Traut <manut@mecka.net>
Date: Sat, 23 Dec 2023 15:17:58 +0100
Message-ID: <1883322.fLvJxeCpJd@bagend>
Organization: Connecting Knowledge
In-Reply-To: <ZYbnxkkCIJtzqa0h@mecka.net>
MIME-Version: 1.0

Hi Manuel,

On Saturday, 23 December 2023 14:59:34 CET Manuel Traut wrote:
> On Fri, Dec 22, 2023 at 06:01:54PM +0100, Diederik de Haas wrote:
> > On Friday, 22 December 2023 12:05:44 CET Manuel Traut wrote:
> > > +
> > > +&cru {
> > > +       assigned-clocks = <&cru PLL_GPLL>, <&pmucru PLL_PPLL>, <&cru
> > > PLL_VPLL>; +       assigned-clock-rates = <1200000000>, <200000000>,
> > > <500000000>; +};
> > 
> > Attachment seem to work and for this I also have the attached patch in my
> > patch set.
> > IIRC without it you get an error in dmesg immediately at boot up which is
> > visible on the PT2 *if* you have immediate visual output (which is not
> > (yet?) the case in my image/kernel).
> 
> you can see the message also by calling "dmesg --level err".
> I could verify that your patch removes the error message.

As I have been using that patch for a while, I couldn't verify it myself 
anymore ;-)
If you use the (default) danctnix image, then you see it immediately at boot 
up (at least the last time I tried it). With my (WIP) image, I only get visual 
output after 5-7 seconds, so you'll likely miss that visual error if the image 
you use also has a delay before outputting things on the screen.
But indeed, it would still show up in dmesg (without the patch).

> I will pick the change for v2.

Great :-)
--nextPart28392273.q4UQjrvTh7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZYbsFgAKCRDXblvOeH7b
bnfaAQCB19vhFqKkdKyoVT/ScgOlKuwEnm2ELd5BtzT6OGdHaAEAjHsFPIBnxiw3
Tqs+4hbh0skq43sF8GQX35lzxGjgYg4=
=q5pl
-----END PGP SIGNATURE-----

--nextPart28392273.q4UQjrvTh7--




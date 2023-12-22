Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0F181CD63
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 17:59:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E8310E7C3;
	Fri, 22 Dec 2023 16:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 585 seconds by postgrey-1.36 at gabe;
 Fri, 22 Dec 2023 16:59:32 UTC
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::ac])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92FD910E7DA
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 16:59:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1703263903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5pp9nMgujJn+Cpq3o1955F8zPLtLYZQipTve8oj6tc8=;
 b=OoTtPvha9uyqsBUq/zsp/Mn1p45thuXKeug1rXypmg8foySIO6I4Y1i1wTJf6uuPUsuxvu
 rErQxsnFBRVH9OXK5B7AcNHQRNKAu86CrSEHIrxvUi9NiDOIZWV3OkccPZi9aYQnbJ7uCi
 9Q91rM0EKTl/Q4IQkYe3w0AE0XnWd6eMFcdM+hlUm/bkQ7Ttf2frhOZKkj+q3XK9vcrV4j
 mu310rciAwIJ+RO/q7TKloG2IIjcz2TU5V0fMnosxdYpxiY5ojGVxChHpyPT5yphfd0OuN
 U9lHSEJ9AkEJtd1P7RUgQ4NUtsvZUJX2YLtazQGtwj/fBlJmLvu29ylq27dzgA==
From: Diederik de Haas <didi.debian@cknow.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, Mark Yao <markyao0591@gmail.com>,
 Segfault <awarnecke002@hotmail.com>, Arnaud Ferraris <aferraris@debian.org>,
 Manuel Traut <manut@mecka.net>
Subject: Re: [PATCH 0/6] arm64: rockchip: Pine64 pinetab2 support
Date: Fri, 22 Dec 2023 17:51:41 +0100
Message-ID: <2631715.l0DajZZ3Y3@bagend>
Organization: Connecting Knowledge
In-Reply-To: <20231222-pinetab2-v1-0-e148a7f61bd1@mecka.net>
References: <20231222-pinetab2-v1-0-e148a7f61bd1@mecka.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2286417.7pCFYIXMvo";
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
Cc: devicetree@vger.kernel.org, Manuel Traut <manut@mecka.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--nextPart2286417.7pCFYIXMvo
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH 0/6] arm64: rockchip: Pine64 pinetab2 support
Date: Fri, 22 Dec 2023 17:51:41 +0100
Message-ID: <2631715.l0DajZZ3Y3@bagend>
Organization: Connecting Knowledge
In-Reply-To: <20231222-pinetab2-v1-0-e148a7f61bd1@mecka.net>
References: <20231222-pinetab2-v1-0-e148a7f61bd1@mecka.net>
MIME-Version: 1.0

On Friday, 22 December 2023 12:05:40 CET Manuel Traut wrote:
> [3]
> https://salsa.debian.org/Mobian-team/devices/kernels/rockchip-linux/-/blob/
> mobian-6.6/debian/patches/display/0018-drm-panel-add-BOE-TH101MB31IG002-28A-
> driver.patch?ref_type=heads 
> [4]
> https://salsa.debian.org/Mobian-team/devices/kernels/rockchip-linux/-/blob/
> mobian-6.6/debian/patches/device-tree/0134-arch-arm64-add-Pine64-PineTab2-de
> vice-trees.patch?ref_type=heads

FWIW I believe the actual sources are from
https://github.com/TuxThePenguin0/linux/commits/device/pine64-pinetab2_stable
--nextPart2286417.7pCFYIXMvo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZYW+nQAKCRDXblvOeH7b
br9kAP9lep8IEbNMNDxvFBfaIg1bqdTUIItkkqVnhx+sEs2xjgD+NLX/sy1F2zYq
tihWEexfx2PMq2zU2Xz+xGm2AJuoww8=
=2R8f
-----END PGP SIGNATURE-----

--nextPart2286417.7pCFYIXMvo--




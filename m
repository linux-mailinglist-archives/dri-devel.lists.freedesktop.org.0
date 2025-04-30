Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 525BDAA4421
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 09:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D6310E6D3;
	Wed, 30 Apr 2025 07:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h2WFTBv0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C43310E6D3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 07:37:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BB968A40843;
 Wed, 30 Apr 2025 07:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A431DC4CEE9;
 Wed, 30 Apr 2025 07:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745998637;
 bh=D5BW2gpx6wpLJIoZXvp/LiKyekPZG4Ijf80HhWU5hJo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h2WFTBv0+Ky7WjqYg7CNblp112S2OS1Yq6PrL1dVVCzbuN/RwGDkC+wT5zyIn9pya
 fbErUuaw/+dbDO58zSAQUiqfKMjJtenaCWDNRYGFNGhGP2teIR8+C/XW8RMuqLjyql
 KOgHHmNCppPZ7F+pjqnout4ojdCeVMbNOplhTR8PAeg/0KzjICSP6WS4NXeODw4lho
 Nk1zvVeWFVlKMZFz2VHQ9r3yNnN8zO/KZ64JIkpf0AtNXqX8pzN+iGb1y+ydIEfbrS
 /V4rlsZWj4Yzo78ee1E5eYwvZ6VdNugma7AUfhEIfV48YdZMNP8yJugs7+Z91xsNc6
 6UF8eV72x5EPQ==
Date: Wed, 30 Apr 2025 09:37:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add BOE TD4320
Message-ID: <20250430-economic-papaya-labradoodle-a947dd@kuoka>
References: <20250429-lavender-panel-v2-0-fb467ff81bac@mainlining.org>
 <20250429-lavender-panel-v2-1-fb467ff81bac@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250429-lavender-panel-v2-1-fb467ff81bac@mainlining.org>
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

On Tue, Apr 29, 2025 at 11:33:14PM GMT, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wrot=
e:
> Document BOE TD4320 6.3" 2340x1080 panel
> found in Xiaomi Redmi Note 7 smartphone.
>=20
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  .../bindings/display/panel/boe,td4320.yaml         | 65 ++++++++++++++++=
++++++
>  1 file changed, 65 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


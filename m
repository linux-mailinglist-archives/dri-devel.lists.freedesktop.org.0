Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7D888D2A7
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 00:12:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D4810F4B0;
	Tue, 26 Mar 2024 23:12:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="eIfMHGsP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 563 seconds by postgrey-1.36 at gabe;
 Tue, 26 Mar 2024 23:12:29 UTC
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D82510F4B0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 23:12:29 +0000 (UTC)
Received: from [192.168.68.112]
 (ppp118-210-177-226.adl-adc-lon-bras34.tpg.internode.on.net
 [118.210.177.226])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DC391200DB;
 Wed, 27 Mar 2024 07:02:56 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1711494183;
 bh=tz3fNHh1K/JnaN3rWzXOsduTzNNjTpy00qDhmUkVo8k=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=eIfMHGsPNwHmXwNNstH9IMj4w2lyPGURp6LMbwLrjHmlPyWfu99sWNZIhMk2gO6uz
 RgeTjJOiQM0pv47zQxIswraW0rFx3ZPiwJSHKORRHDpqe3US9RXTYofm+LfhboiiTX
 0/2nDinsXDMjMsSQxs2l6/VHxtwFkD9IKm5EvxniqkwLV0JMXkRE5RjbJG83+NbtCN
 qcam/A+94EU+rkbVi8UIoPMWSMl+z844LZNWJnywiVy85Sxc2rC3fDh+0d1MeyeTmc
 pAYFOzZm0LtzVIwBEgEJ5JYODCCsjCp/BnFptrq5B4iieSj8Tq3llCMFTW9l5/tOpw
 Z5xqzSAoUof7Q==
Message-ID: <e0453eb8a2da206cf591c6a7c4d431c771cf5794.camel@codeconstruct.com.au>
Subject: Re: [PATCH 01/12] kbuild: make -Woverride-init warnings more
 consistent
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Arnd Bergmann <arnd@kernel.org>, linux-kbuild@vger.kernel.org, Masahiro
 Yamada <masahiroy@kernel.org>, Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Linus Walleij <linus.walleij@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>, Arnd Bergmann <arnd@arndb.de>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev
Date: Wed, 27 Mar 2024 09:32:36 +1030
In-Reply-To: <20240326144741.3094687-2-arnd@kernel.org>
References: <20240326144741.3094687-1-arnd@kernel.org>
 <20240326144741.3094687-2-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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

On Tue, 2024-03-26 at 15:47 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The -Woverride-init warn about code that may be intentional or not,
> but the inintentional ones tend to be real bugs, so there is a bit of
> disagreement on whether this warning option should be enabled by default
> and we have multiple settings in scripts/Makefile.extrawarn as well as
> individual subsystems.
>=20
> Older versions of clang only supported -Wno-initializer-overrides with
> the same meaning as gcc's -Woverride-init, though all supported versions
> now work with both. Because of this difference, an earlier cleanup of
> mine accidentally turned the clang warning off for W=3D1 builds and only
> left it on for W=3D2, while it's still enabled for gcc with W=3D1.
>=20
> There is also one driver that only turns the warning off for newer
> versions of gcc but not other compilers, and some but not all the
> Makefiles still use a cc-disable-warning conditional that is no
> longer needed with supported compilers here.
>=20
> Address all of the above by removing the special cases for clang
> and always turning the warning off unconditionally where it got
> in the way, using the syntax that is supported by both compilers.
>=20
> Fixes: 2cd3271b7a31 ("kbuild: avoid duplicate warning options")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/amd/display/dc/dce110/Makefile |  2 +-
>  drivers/gpu/drm/amd/display/dc/dce112/Makefile |  2 +-
>  drivers/gpu/drm/amd/display/dc/dce120/Makefile |  2 +-
>  drivers/gpu/drm/amd/display/dc/dce60/Makefile  |  2 +-
>  drivers/gpu/drm/amd/display/dc/dce80/Makefile  |  2 +-
>  drivers/gpu/drm/i915/Makefile                  |  6 +++---
>  drivers/gpu/drm/xe/Makefile                    |  4 ++--
>  drivers/net/ethernet/renesas/sh_eth.c          |  2 +-
>  drivers/pinctrl/aspeed/Makefile                |  2 +-

For the Aspeed change:

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Thanks!

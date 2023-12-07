Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA508083E8
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 10:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DD210E1A8;
	Thu,  7 Dec 2023 09:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8878110E1A8;
 Thu,  7 Dec 2023 09:11:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 17030CE229C;
 Thu,  7 Dec 2023 09:10:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066AEC433C7;
 Thu,  7 Dec 2023 09:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701940258;
 bh=EgeUZq4iO8Na/z8VnPkbWDLidJ7ltPyaH49ufhjKlTk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DzBfzyIe30MkeWypS5oF45eBw95xHry3bXw8H/y0jjZ8eF/qzxyOw+nT7i5Wx5W4E
 KAK1viitfMafsjX5/2LN7cajMPORgr/Y1ZNz49HRTI0WUOMlf7XfNq6DJuv1m6llG7
 brjKVS5IJO8CzvocHt1KNI7TXwaULmgS3XYmsq3DBUTK5ocrwrjWpIEJ+JyOdtzU7l
 wEfAYbTn4OjlgrGVjaGl+sK3EoTNL5vkviMZNpCRhbJh2U8UlNItSEI3gHB6oAIbhK
 QpJKVZAVNPTqlnz7qrvpotHyvaZ/aYO3vnYmmocTVlSyL9lgw2jdUGD7r5GBZGcK7G
 wetJXmFqW9SNw==
Date: Thu, 7 Dec 2023 10:10:55 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH RESEND AGAIN v2 0/2] Add drm_dbg_ratelimited()
Message-ID: <yudbwuyc2pbuj744yd53q3kgygeqiaz6fhd7cgkzyjzj6ounkk@q5q6n4zpdh52>
References: <20231206210948.106238-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="m7dckljywf7ur46r"
Content-Disposition: inline
In-Reply-To: <20231206210948.106238-1-andi.shyti@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, John Harrison <John.C.Harrison@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--m7dckljywf7ur46r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 06, 2023 at 10:09:46PM +0100, Andi Shyti wrote:
> This is the second time I am resending this series in its v2. It
> has been reviewd, acked, blessed, discussed, rectified, assessed,
> authorized, validated, glorified, praised, demanded, approved,
> and yet, I don't understand why no one is merging it.

$ ./scripts/get_maintainer.pl -f drivers/gpu/drm/i915/
Jani Nikula <jani.nikula@linux.intel.com> (supporter:INTEL DRM DRIVERS (excluding Poulsbo, Moorestow...)
Joonas Lahtinen <joonas.lahtinen@linux.intel.com> (supporter:INTEL DRM DRIVERS (excluding Poulsbo, Moorestow...)
Rodrigo Vivi <rodrigo.vivi@intel.com> (supporter:INTEL DRM DRIVERS (excluding Poulsbo, Moorestow...)
Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> (supporter:INTEL DRM DRIVERS (excluding Poulsbo, Moorestow...)
David Airlie <airlied@gmail.com> (maintainer:DRM DRIVERS)
Daniel Vetter <daniel@ffwll.ch> (maintainer:DRM DRIVERS)
intel-gfx@lists.freedesktop.org (open list:INTEL DRM DRIVERS (excluding Poulsbo, Moorestow...)
dri-devel@lists.freedesktop.org (open list:DRM DRIVERS)
linux-kernel@vger.kernel.org (open list)

You've Cc'd none of the i915 maintainers, that's why it's been stuck.

Jani, Joonas, Rodrigo, Tvrtko, could you have a look at this?

Maxime

--m7dckljywf7ur46r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXGMHwAKCRDj7w1vZxhR
xQtuAQDuepn7wF243N3TIEgyM/totBS9z4oulEvdatsX6QhfyQD/SA823dJ8OyR+
p3yfG79AEEpKivlEMTGe3HxAyo/T1Qo=
=iSrm
-----END PGP SIGNATURE-----

--m7dckljywf7ur46r--

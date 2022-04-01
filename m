Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A201D4EE9DD
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 10:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1F610F679;
	Fri,  1 Apr 2022 08:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9343A10F679
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 08:40:07 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 39A3C320024A;
 Fri,  1 Apr 2022 04:40:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 01 Apr 2022 04:40:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; bh=4hgOCngQqHDjj9
 pWYwdzG8I1O7qUuHsyoq2nwxiJ+F4=; b=kRm+VauIDL4fg+5kFsaDt+A9Lh/g+r
 CUHBDxnaFtMwuHp6tiItGmCchVIPq/vHvbDc/sg3BxC1U22GXgSYKiGZCd00wtty
 EiZSXgKTWVLmRWh4YQ+9tuQDB0NXsyOeIZdJWV5wcsdy5QnnkP1ywjdX5Y+0ypb6
 BdFLac9I3uz0+UnKvHcFJPBBC5WCkoDi/p1Qc5EgWR4rXxqrEyS0Gn9vmLzCw3zj
 f3giqtfj0iRVhE/n8lS6k2aDLsqMRlEoWxA+CfhFm+Cm/7ONVxNEWAOwx/RXdFRr
 kMRMHyenmYrZWwh4ES5LY56sadlYYB6vLfETaBtMg673q1i8HhRqTB7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=4hgOCngQqHDjj9pWYwdzG8I1O7qUuHsyoq2nwxiJ+
 F4=; b=FQHXgwZgWK6veql3MTjWvWXboTyPBeSK2tV0FzgrbxVnYRJiQQ2WnOcpD
 UPD735gLtVSkxDbySUjUeVbkfeg4aFVv1xhxst/i5aBxXWEHj/Tf1wFcsYEO5091
 VpHl9T1LrE6ZbIuetk7QVFEfF7uAxFWiHDKQEri+doZ88aVyBYcQ6sXqa9DG3yJS
 C+oL3tkfD9QteMCB+oGnbHV9/VhKsn2DnvkbwO773/72XcZJyJzyTaWXMi65aHDR
 yxcFlePZD99SpgzjRrjAnNBhu7kpSx7UBF8bLGJNjf1kgzf0oRkKNoCioE2bWGzS
 I+fPEfHr9lmGTa/l32qhFHtHdPfnA==
X-ME-Sender: <xms:YrpGYuxZtPkGHTdr0qnprwhArI9hjQMxlgjabdcR7E0BxrUk5Qt22A>
 <xme:YrpGYqRtGjDDBDqnASXaiNOvxSIQ9uZQ_HbugEpoK7p8MTx7fCd4LljWPAUlac-IB
 AFCLJOOKtM0BY0u-Dw>
X-ME-Received: <xmr:YrpGYgVfUnx1CcFGYlUE5iInIBaYbwZjnx90fMm-W51tXzZaVwetRimeeBjyuS4qMH0v1MwzgFGCPjJj5qsOlkGCF7BtMKJNETwotWo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeiiedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedugffgtddtveeigefgfeejhfettefhgeelgefftddtuedvvdevveeljeff
 hefhudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:YrpGYkhf8CMEUFKBpMb2o39aFNy9iQpX0DZrAnJ5W5wQfVv1Tj8STQ>
 <xmx:YrpGYgAGl8Wd9EJqA52GE03N7KiRhzy3phZRiPcw4zTCdGbHDPU2Qg>
 <xmx:YrpGYlIqmNnCC5XR6n9tLcZAin5OU1kyczWrI4G6fFxJHwsPuEi7AQ>
 <xmx:YrpGYs0Sm1sl6Z6R1esk3Wcit3AF5fj3bc-pGA7kjFq9PrP31ssS3A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Apr 2022 04:40:01 -0400 (EDT)
Date: Fri, 1 Apr 2022 10:39:59 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Message-ID: <20220401083959.4trlcyuoffax3e7x@houat>
References: <20220331152021.2671937-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220331152021.2671937-1-daniel.vetter@ffwll.ch>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>, mikita.lipski@amd.com,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 31, 2022 at 05:20:21PM +0200, Daniel Vetter wrote:
> The stuff never really worked, and leads to lots of fun because it
> out-of-order frees atomic states. Which upsets KASAN, among other
> things.
>=20
> For async updates we now have a more solid solution with the
> ->atomic_async_check and ->atomic_async_commit hooks. Support for that
> for msm and vc4 landed. nouveau and i915 have their own commit
> routines, doing something similar.
>=20
> For everyone else it's probably better to remove the use-after-free
> bug, and encourage folks to use the async support instead. The
> affected drivers which register a legacy cursor plane and don't either
> use the new async stuff or their own commit routine are: amdgpu,
> atmel, mediatek, qxl, rockchip, sti, sun4i, tegra, virtio, and vmwgfx.
>=20
> Inspired by an amdgpu bug report.
>=20
> v2: Drop RFC, I think with amdgpu converted over to use
> atomic_async_check/commit done in
>=20
> commit 674e78acae0dfb4beb56132e41cbae5b60f7d662
> Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Date:   Wed Dec 5 14:59:07 2018 -0500
>=20
>     drm/amd/display: Add fast path for cursor plane updates
>=20
> we don't have any driver anymore where we have userspace expecting
> solid legacy cursor support _and_ they are using the atomic helpers in
> their fully glory. So we can retire this.
>=20
> v3: Paper over msm and i915 regression. The complete_all is the only
> thing missing afaict.
>=20
> v4: Fixup i915 fixup ...
>=20
> References: https://bugzilla.kernel.org/show_bug.cgi?id=3D199425
> References: https://lore.kernel.org/all/20220221134155.125447-9-maxime@ce=
rno.tech/
> References: https://bugzilla.kernel.org/show_bug.cgi?id=3D199425
> Cc: Maxime Ripard <maxime@cerno.tech>
> Tested-by: Maxime Ripard <maxime@cerno.tech>
> Cc: mikita.lipski@amd.com
> Cc: Michel D=E4nzer <michel@daenzer.net>
> Cc: harry.wentland@amd.com
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

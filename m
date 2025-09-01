Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BD3B3D9BF
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 08:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24AC10E36B;
	Mon,  1 Sep 2025 06:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DPOR8vdC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CCB910E36B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 06:20:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4D633601B8;
 Mon,  1 Sep 2025 06:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0CBC4CEF0;
 Mon,  1 Sep 2025 06:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756707624;
 bh=+Ueec6t83OWJF3k7tHZt6/fcZU8oeWGgL0qu2zp6ws4=;
 h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
 b=DPOR8vdCFImIed5vqRWeN8lwJCnyEw+WEzf3y685ZXhP5eSidPaoB5GIHrC0atCkz
 4+gKU3s1AtJE/SCRr8eSwJwDJHU+qnWqJilr7AjWYPlEgTg7XUtZMKGK1bnU2eg5Xx
 JhfTWYmop5673CK3f8qhwcjkjUXWne898FNfyuFimj/RgzRbb9tDklgPywblx8E3UT
 nIxeYW/q6QTkxsA4mVh17SVrwisw96y9XX13gOTyjcp1sEPQVnOMCKJvzHqtn5uxJq
 e0lSsIX7nSgTRQ2hpnXboMkDSEUpjfUVauFSUnmoReXjw3RwNSUP8v7m3OGFYQt4wu
 NsEsRpz/H8Bmw==
Content-Type: multipart/signed;
 boundary=682104e96c29f8012d4fb844ebf0d9c883ce3dc154d455a174da7b9dfef1;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 01 Sep 2025 08:20:19 +0200
Message-Id: <DCH8VNHTN1LM.3068OZU8IMK3Q@kernel.org>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: fix REFCLK setting
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Devarsh
 Thakkar" <devarsht@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Doug Anderson" <dianders@chromium.org>
X-Mailer: aerc 0.16.0
References: <20250821122341.1257286-1-mwalle@kernel.org>
 <CAD=FV=Xt-DPHRddZM=t-KTWiGouNfm_QpPps3MA6csd+j=YO+A@mail.gmail.com>
 <CAD=FV=XCOPeEgpjvCuDjT=OjEk1P8vszL6iJqkY-DcpXtpXTjA@mail.gmail.com>
In-Reply-To: <CAD=FV=XCOPeEgpjvCuDjT=OjEk1P8vszL6iJqkY-DcpXtpXTjA@mail.gmail.com>
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

--682104e96c29f8012d4fb844ebf0d9c883ce3dc154d455a174da7b9dfef1
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri Aug 29, 2025 at 12:52 AM CEST, Doug Anderson wrote:
> > On Thu, Aug 21, 2025 at 5:23=E2=80=AFAM Michael Walle <mwalle@kernel.or=
g> wrote:
> > >
> > > The bridge has three bootstrap pins which are sampled to determine th=
e
> > > frequency of the external reference clock. The driver will also
> > > (over)write that setting. But it seems this is racy after the bridge =
is
> > > enabled. It was observed that although the driver write the correct
> > > value (by sniffing on the I2C bus), the register has the wrong value.
> > > The datasheet states that the GPIO lines have to be stable for at lea=
st
> > > 5us after asserting the EN signal. Thus, there seems to be some logic
> > > which samples the GPIO lines and this logic appears to overwrite the
> > > register value which was set by the driver. Waiting 20us after
> > > asserting the EN line resolves this issue.
> > >
> > > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > nit: officially you're supposed to move your Signed-off-by all the way
> > at the bottom of all the other tags any time you post a patch. I don't
> > think it's important enough to re-send, though.
> >
> > In any case, thanks for re-posting. I guess it kinda stagnated. I'll
> > give this another week on the list and then plan to apply to
> > drm-misc-fixes unless there are any other comments.
>
> I realized that this is lacking a Fixes: tag. I went back and
> confirmed that even in the first version of the driver, AKA commit
> a095f15c00e2 ("drm/bridge: add support for sn65dsi86 bridge driver"),
> we still had no delay between these two lines:
>
> pm_runtime_get_sync(pdata->dev);
>
> /* configure bridge ref_clk */
> ti_sn_bridge_set_refclk_freq(pdata);
>
> ...and the last line of the runtime resume function was turning on the
> enable. So I believe this means that the bug has always been there.
> Does that sound right to others? If so, I'll add that Fixes tag when
> applying.,..

Yes, that's right. Thanks for amending the patch.

-michael

--682104e96c29f8012d4fb844ebf0d9c883ce3dc154d455a174da7b9dfef1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaLU7JBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/j4RAGAnUlorq1ruoUXSrDpLf3RlZnc/e3t9Nt2
P2IgL7Nj3zxtBLDXprxO3jMP4bfu07CEAYCYZW3ZN5wl/85JGbuMBAM7/L8ZT4dN
69oEiasczPIdwr6g+vPpUaemZ1PgMTgbW5g=
=FEW4
-----END PGP SIGNATURE-----

--682104e96c29f8012d4fb844ebf0d9c883ce3dc154d455a174da7b9dfef1--

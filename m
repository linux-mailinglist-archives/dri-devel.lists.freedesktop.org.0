Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45961793ED4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 16:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA65310E67C;
	Wed,  6 Sep 2023 14:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCC210E67C;
 Wed,  6 Sep 2023 14:32:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6F23E61057;
 Wed,  6 Sep 2023 14:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D70EC433C9;
 Wed,  6 Sep 2023 14:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694010738;
 bh=reOy7dKdk0ZXhssYga7/7llhnwYU/Wy1UqwW1e7rFOg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ViacquFvTGRzGuUQbl+AVMymtoLvIzKtKvaET4RdQxmvp9ACUoaPfSJSZlxiH3OTe
 bUsT3ZJwaKxAC4/DE+8uLBgSwORcBBXKqgkn8BDfhRBFEt1RmukeaHtICctkfQGhAH
 a24iHG79irZfcXTLp9rJ4G/TYDOyQXu3V8ew2MWewggzQjUkBCEK+PvSBQTEEqXgDa
 u9pb/6736Ze19ZnTsk7JFQldHQPnocPfe6Qh2wa+9ns0kppyrma3iomtAAv/bQoSK6
 JjIrgzWBynLCwBWXHpChKtAEFQ88IjXN+d8MErzGBnpKem3/PX5hi1wlXyr51SOSFU
 qDx4I9JJ5rP0w==
Date: Wed, 6 Sep 2023 16:32:15 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC PATCH v1 01/12] Revert "drm/sysfs: Link DRM connectors to
 corresponding Type-C connectors"
Message-ID: <4wo537dwt2orgditp2pcsp2tvs2vfhkcnumywxtau7pyafdcly@kniw5kqpzvyi>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
 <20230903214150.2877023-2-dmitry.baryshkov@linaro.org>
 <ZPbrtAlO2Y+bjDhf@kuha.fi.intel.com>
 <CAA8EJpqUg2-k7LLBL38RHU1sThkXB54ca68xEMd1yMnHQcQ++w@mail.gmail.com>
 <ZPh0Ps9UJ3HLzdeR@kuha.fi.intel.com>
 <CAA8EJpratbBybgk8woD3maA=J_HuQis44Unq0n+c_UvaFs__AA@mail.gmail.com>
 <20230906125314.GI17308@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="f43wnijwiseqc6zb"
Content-Disposition: inline
In-Reply-To: <20230906125314.GI17308@pendragon.ideasonboard.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Janne Grunau <j@jannau.net>, Robert Foss <rfoss@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Gross <agross@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Won Chung <wonchung@google.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--f43wnijwiseqc6zb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 06, 2023 at 03:53:14PM +0300, Laurent Pinchart wrote:
> On Wed, Sep 06, 2023 at 03:48:35PM +0300, Dmitry Baryshkov wrote:
> > On Wed, 6 Sept 2023 at 15:44, Heikki Krogerus wrote:
> > > On Tue, Sep 05, 2023 at 01:56:59PM +0300, Dmitry Baryshkov wrote:
> > > > On Tue, 5 Sept 2023 at 11:50, Heikki Krogerus wrote:
> > > > > On Mon, Sep 04, 2023 at 12:41:39AM +0300, Dmitry Baryshkov wrote:
> > > > > > The kdev->fwnode pointer is never set in drm_sysfs_connector_ad=
d(), so
> > > > > > dev_fwnode() checks never succeed, making the respective commit=
 NOP.
> > > > >
> > > > > That's not true. The dev->fwnode is assigned when the device is
> > > > > created on ACPI platforms automatically. If the drm_connector fwn=
ode
> > > > > member is assigned before the device is registered, then that fwn=
ode
> > > > > is assigned also to the device - see drm_connector_acpi_find_comp=
anion().
> > > > >
> > > > > But please note that even if drm_connector does not have anything=
 in
> > > > > its fwnode member, the device may still be assigned fwnode, just =
based
> > > > > on some other logic (maybe in drivers/acpi/acpi_video.c?).
> > > > >
> > > > > > And if drm_sysfs_connector_add() is modified to set kdev->fwnod=
e, it
> > > > > > breaks drivers already using components (as it was pointed at [=
1]),
> > > > > > resulting in a deadlock. Lockdep trace is provided below.
> > > > > >
> > > > > > Granted these two issues, it seems impractical to fix this comm=
it in any
> > > > > > sane way. Revert it instead.
> > > > >
> > > > > I think there is already user space stuff that relies on these li=
nks,
> > > > > so I'm not sure you can just remove them like that. If the compon=
ent
> > > > > framework is not the correct tool here, then I think you need to
> > > > > suggest some other way of creating them.
> > > >
> > > > The issue (that was pointed out during review) is that having a
> > > > component code in the framework code can lead to lockups. With the
> > > > patch #2 in place (which is the only logical way to set kdev->fwnode
> > > > for non-ACPI systems) probing of drivers which use components and s=
et
> > > > drm_connector::fwnode breaks immediately.
> > > >
> > > > Can we move the component part to the respective drivers? With the
> > > > patch 2 in place, connector->fwnode will be copied to the created
> > > > kdev's fwnode pointer.
> > > >
> > > > Another option might be to make this drm_sysfs component registrati=
on optional.
> > >
> > > You don't need to use the component framework at all if there is
> > > a better way of determining the connection between the DP and its
> > > Type-C connector (I'm assuming that that's what this series is about).
> > > You just need the symlinks, not the component.
> >=20
> > The problem is that right now this component registration has become
> > mandatory. And if I set the kdev->fwnode manually (like in the patch
> > 2), the kernel hangs inside the component code.
> > That's why I proposed to move the components to the place where they
> > are really necessary, e.g. i915 and amd drivers.
>=20
> I'm all for keeping the component framework out of common code. I
> dislike that framework with passion, and still haven't lost all hopes of
> replacing it with something better.

I'm not sure I share the same hate for the component framework, but I
agree. It's optional anyway, so we should provide a solution that works
for drivers working with and without the component framework.

Maxime

--f43wnijwiseqc6zb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZPiNbwAKCRDj7w1vZxhR
xTqBAP9Sx+ylOadsZ9Yoj2aQb2Z68+E6XeDlHow3WafHQ0XXyAEAoL3iWZqELQS4
+/daC4RCs1dsFC+J9N5HtUNNFYWmtgg=
=/dQB
-----END PGP SIGNATURE-----

--f43wnijwiseqc6zb--

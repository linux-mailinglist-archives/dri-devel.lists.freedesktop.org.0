Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1867E41EA9A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 12:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7366EDCE;
	Fri,  1 Oct 2021 10:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593D96EDCE
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 10:07:57 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 8C5CAD09BF
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 09:54:38 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A944EC0009;
 Fri,  1 Oct 2021 09:54:13 +0000 (UTC)
Date: Fri, 1 Oct 2021 11:54:13 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v9 0/4] drm: LogiCVC display controller support
Message-ID: <YVbaxX+gLfKCfoZQ@aptenodytes>
References: <20210914200539.732093-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2wSxtZfOfgM39D61"
Content-Disposition: inline
In-Reply-To: <20210914200539.732093-1-paul.kocialkowski@bootlin.com>
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


--2wSxtZfOfgM39D61
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue 14 Sep 21, 22:05, Paul Kocialkowski wrote:
> This series introduces support for the LogiCVC display controller.
> The controller is a bit unusual since it is usually loaded as
> programmable logic on Xilinx FPGAs or Zynq-7000 SoCs.
> More details are presented on the main commit for the driver.

A gentle ping here, I think this series is pretty much good to go
and unless there are objections, I'd be very happy to see it merged
soon rather than having to post another version to follow internal API
changes.

Thanks!

Paul
=20
> More information about the controller is available on the dedicated
> web page: https://www.logicbricks.com/Products/logiCVC-ML.aspx
>=20
> Note that this driver has rather simple connector management, which was
> not converted to drm_panel_bridge to keep the ability to enable the panel
> at first vblank but also to support DVI.
>=20
> Changes since v8:
> - Rebased on top of the latest drm-misc-next;
> - Dropped useless phandle-based syscon regmap support;
> - Switched to a single-port graph description;
> - Updated the device-tree schema to the port schema and added a
>   description for the port.
>=20
> Change since v7:
> - Replaced DRM_INFO/DRM_ERROR/DRM_DEBUG_DRIVER with fashions using drm_de=
vice;
> - Fixed yaml binding alignment issue;
> - Renamed logicvc-display name to the generic "display" name;
> - Added patternProperties match for display in the parent mfd binding;
> - Used drm_atomic_get_new_crtc_state when needed;
> - Checked mode in mode_valid instead of atomic_check;
> - Switched to drmm_mode_config_init;
> - Removed useless logicvc_connector_destroy wrapper;
> - Removed useless drm_dev_put calls;
> - Removed atomic_commit_tail that enables the panel and streamlined the l=
ogic;
> - Reworked Makefile cosmetics;
> - Fixed checkpatch issues.
>=20
> Changes since v6:
> - Updated to the latest DRM internal API changes;=20
> - Used an enum to index dt properties instead of the name string.
>=20
> Changes since v5:
> - Subclass DRM device and use devm_drm_dev_alloc for allocation;
> - Removed call to drm_mode_config_cleanup (done automatically with devm);
> - Some related code cleanups;
> - Bring back not-for-merge patch adding colorkey support.
>=20
> Changes since v4:
> - Updated to internal DRM API changes (rebased on drm-misc-next);
> - Added Kconfig dependency on OF;
> - Added MAINTAINERS entry;
> - Used drm_err and dev_err instead of DRM_ERROR where possible;
> - Various cosmetic changes.
>=20
> Changes since v3:
> - Rebased on latest drm-misc;
> - Improved event lock wrapping;
> - Added collect tag;
> - Added color-key support patch (not for merge, for reference only).
>=20
> Changes since v2:
> - Fixed and slightly improved dt schema.
>=20
> Changes since v1:
> - Switched dt bindings documentation to dt schema;
> - Described more possible dt parameters;
> - Added support for the lvds-3bit interface;
> - Added support for grabbing syscon regmap from parent node;
> - Removed layers count property and count layers child nodes instead.
>=20
> Paul Kocialkowski (4):
>   dt-bindings: display: Document the Xylon LogiCVC display controller
>   dt-bindings: mfd: logicvc: Add patternProperties for the display
>   drm: Add support for the LogiCVC display controller
>   NOTFORMERGE: drm/logicvc: Add plane colorkey support
>=20
>  .../display/xylon,logicvc-display.yaml        | 302 +++++++
>  .../bindings/mfd/xylon,logicvc.yaml           |   3 +
>  MAINTAINERS                                   |   6 +
>  drivers/gpu/drm/Kconfig                       |   2 +
>  drivers/gpu/drm/Makefile                      |   1 +
>  drivers/gpu/drm/logicvc/Kconfig               |   9 +
>  drivers/gpu/drm/logicvc/Makefile              |   9 +
>  drivers/gpu/drm/logicvc/logicvc_crtc.c        | 280 +++++++
>  drivers/gpu/drm/logicvc/logicvc_crtc.h        |  21 +
>  drivers/gpu/drm/logicvc/logicvc_drm.c         | 471 +++++++++++
>  drivers/gpu/drm/logicvc/logicvc_drm.h         |  67 ++
>  drivers/gpu/drm/logicvc/logicvc_interface.c   | 214 +++++
>  drivers/gpu/drm/logicvc/logicvc_interface.h   |  28 +
>  drivers/gpu/drm/logicvc/logicvc_layer.c       | 767 ++++++++++++++++++
>  drivers/gpu/drm/logicvc/logicvc_layer.h       |  71 ++
>  drivers/gpu/drm/logicvc/logicvc_mode.c        |  80 ++
>  drivers/gpu/drm/logicvc/logicvc_mode.h        |  15 +
>  drivers/gpu/drm/logicvc/logicvc_of.c          | 185 +++++
>  drivers/gpu/drm/logicvc/logicvc_of.h          |  46 ++
>  drivers/gpu/drm/logicvc/logicvc_regs.h        |  88 ++
>  20 files changed, 2665 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/xylon,logic=
vc-display.yaml
>  create mode 100644 drivers/gpu/drm/logicvc/Kconfig
>  create mode 100644 drivers/gpu/drm/logicvc/Makefile
>  create mode 100644 drivers/gpu/drm/logicvc/logicvc_crtc.c
>  create mode 100644 drivers/gpu/drm/logicvc/logicvc_crtc.h
>  create mode 100644 drivers/gpu/drm/logicvc/logicvc_drm.c
>  create mode 100644 drivers/gpu/drm/logicvc/logicvc_drm.h
>  create mode 100644 drivers/gpu/drm/logicvc/logicvc_interface.c
>  create mode 100644 drivers/gpu/drm/logicvc/logicvc_interface.h
>  create mode 100644 drivers/gpu/drm/logicvc/logicvc_layer.c
>  create mode 100644 drivers/gpu/drm/logicvc/logicvc_layer.h
>  create mode 100644 drivers/gpu/drm/logicvc/logicvc_mode.c
>  create mode 100644 drivers/gpu/drm/logicvc/logicvc_mode.h
>  create mode 100644 drivers/gpu/drm/logicvc/logicvc_of.c
>  create mode 100644 drivers/gpu/drm/logicvc/logicvc_of.h
>  create mode 100644 drivers/gpu/drm/logicvc/logicvc_regs.h
>=20
> --=20
> 2.32.0
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--2wSxtZfOfgM39D61
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmFW2sUACgkQ3cLmz3+f
v9FMgwf9Fs2B0oM8d3sqUoYw0qzbUOHkbZK6WBGtJYAnHmLWZzPwR7YUtvouCdxe
gsG7Sqc4+Kn4MUNxZtCiAuDBwFd4GSPtl9ngz9931ozynFbqiyl5SItB2skBn7Wt
iYoUCJhZPshfFUsn0AUZOFx88ws0NXgIvEqGMMs6KA5OhJLUCTHaimbaM4aQBc/n
KTVPtgzz9Of+eM3SWg5AumkD1V0eF7nhuT8yO9DcWsznJ6CASogc5tzGiea9uLcX
njp7DIccBiTbbWD29XbTFmoR14clpMId5uDF9Q5ha0UhL0ybzDj27k1ws1oy/QY7
A+/Q6v3tW/pTqVh7t7UpqsjUe8U7hA==
=y2ZG
-----END PGP SIGNATURE-----

--2wSxtZfOfgM39D61--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C968C792204
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 13:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D4410E4A5;
	Tue,  5 Sep 2023 11:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0920410E4AD
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 11:00:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5BBC660039;
 Tue,  5 Sep 2023 11:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C47EC433C7;
 Tue,  5 Sep 2023 11:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693911611;
 bh=Wfk1BuK7Xhfcrf4xZDmH9THWGITu0aqQKjO7PM3R1kk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=phwKNbWl+Q1EF5s4UKKO34pA7mX/nDJdHQO+AJCheMIBRtMD5JQ/mrDJbaWwZqs3c
 OlgUil3K0caYN+kKH4/TNBWGmbV2kkl3o7eFWeKQ8VnOAgvk9jnfA5uQoOb4Ujhojt
 AVeoAlnl2O1GW6Sb1Y7LBXJ8V/NvE46QuNAJpWARUPzn1BC7n/UQUWiEFFZ906Kb6A
 UEC4H0DIYMdyqaAy2822ULAeUcRUIpXaV0anrm6oUZjkLPGhgzTkR94a/EcI51Ywuk
 96CPMIfuyUguLsh+/hXEpWnUVQ+OyvtZ1Q8h3dZg95LvMMqOb4dLqu3aRY3CJwc1pR
 EVEL/1N7/nlhA==
Date: Tue, 5 Sep 2023 13:00:09 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Subject: Re: [PATCH v2 2/7] drm: ci: Force db410c to host mode
Message-ID: <2jz6wurh6ejbaejwtb5r5gukjuw4zs7ujk5hbwfpsn26o6esqe@g2nnb2gjpnjp>
References: <20230904161516.66751-1-vignesh.raman@collabora.com>
 <20230904161516.66751-3-vignesh.raman@collabora.com>
 <CAA8EJpq_cmFQ6TGy1xELh3ButWKLfSkQcp5ix049s_iqKw6DvQ@mail.gmail.com>
 <ueznsu2dlvq5zp3ls262fww54bnlqa3e2ssr6f65vrrionloms@ir2ywgeajj4w>
 <2c812fe4-04ba-0243-5330-c7b7e695cff9@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2c812fe4-04ba-0243-5330-c7b7e695cff9@collabora.com>
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
Cc: robdclark@google.com, daniels@collabora.com, emma@anholt.net,
 gustavo.padovan@collabora.com, linux-arm-msm@vger.kernel.org,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 david.heidelberg@collabora.com, helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, robclark@freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 05, 2023 at 03:39:33PM +0530, Vignesh Raman wrote:
> Hi Dmitry, Maxime,
>=20
> On 05/09/23 14:13, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Mon, Sep 04, 2023 at 07:59:26PM +0300, Dmitry Baryshkov wrote:
> > > On Mon, 4 Sept 2023 at 19:16, Vignesh Raman <vignesh.raman@collabora.=
com> wrote:
> > > >=20
> > > > Force db410c to host mode to fix network issue which results in fai=
lure
> > > > to mount root fs via NFS.
> > > > See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8=
c15c80a54dda510743cefd1c4b65b8
> > > >=20
> > > > Use fdtoverlay command to merge base device tree with an overlay
> > > > which contains the fix for USB controllers to work in host mode.
> > > >=20
> > > > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > > > ---
> > > >=20
> > > > v2:
> > > >    - Use fdtoverlay command to merge overlay dtbo with the base dtb=
 instead of modifying the kernel sources
> > > >=20
> > > > ---
> > > >   drivers/gpu/drm/ci/build.sh                         |  5 +++++
> > > >   .../gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts  | 13 ++++++++=
+++++
> > > >   2 files changed, 18 insertions(+)
> > > >   create mode 100644 drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-ove=
rlay.dts
> > > >=20
> > > > diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build=
=2Esh
> > > > index 7b014287a041..92ffd98cd09e 100644
> > > > --- a/drivers/gpu/drm/ci/build.sh
> > > > +++ b/drivers/gpu/drm/ci/build.sh
> > > > @@ -92,6 +92,11 @@ done
> > > >=20
> > > >   if [[ -n ${DEVICE_TREES} ]]; then
> > > >       make dtbs
> > > > +    if [[ -e arch/arm64/boot/dts/qcom/apq8016-sbc.dtb ]]; then
> > > > +        dtc -@ -I dts -O dtb -o drivers/gpu/drm/ci/dt-overlays/apq=
8016-sbc-overlay.dtbo drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
> > > > +        fdtoverlay -i arch/arm64/boot/dts/qcom/apq8016-sbc.dtb -o =
arch/arm64/boot/dts/qcom/apq8016-sbc-overlay.dtb drivers/gpu/drm/ci/dt-over=
lays/apq8016-sbc-overlay.dtbo
> > > > +        mv arch/arm64/boot/dts/qcom/apq8016-sbc-overlay.dtb arch/a=
rm64/boot/dts/qcom/apq8016-sbc.dtb
> > > > +    fi
> > > >       cp ${DEVICE_TREES} /lava-files/.
> > > >   fi
> > > >=20
> > > > diff --git a/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts=
 b/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
> > > > new file mode 100644
> > > > index 000000000000..57b7604f1c23
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
> > > > @@ -0,0 +1,13 @@
> > > > +/dts-v1/;
> > > > +/plugin/;
> > > > +
> > > > +/ {
> > > > +    fragment@0 {
> > > > +        target-path =3D "/soc@0";
> > > > +        __overlay__ {
> > > > +            usb@78d9000 {
> > > > +                dr_mode =3D "host";
> > > > +            };
> > > > +        };
> > > > +    };
> > > > +};
> > > > --
> > > > 2.40.1
> > >=20
> > > Can we use normal dtso syntax here instead of defining fragments manu=
ally?
> >=20
> > What Dmitry is hinting about is to use the "Sugar Syntax". There a good=
 documentation here:
> > https://source.android.com/docs/core/architecture/dto/syntax
>=20
>=20
> With the below DTO syntax,
> /dts-v1/;
> /plugin/;
>=20
> &usb {
>   usb@78d9000 {
>     dr_mode =3D "host";
>   };
> };
>=20
> Decoded dtbo file is,
> /dts-v1/;
>=20
> / {
>=20
> 	fragment@0 {
> 		target =3D <0xffffffff>;
>=20
> 		__overlay__ {
>=20
> 			usb@78d9000 {
> 				dr_mode =3D "host";
> 			};
> 		};
> 	};
>=20
> 	__fixups__ {
> 		usb =3D "/fragment@0:target:0";
> 	};
> };
>=20
> With the previous fix using fragment we get,
> / {
>=20
> 	fragment@0 {
> 		target-path	 =3D "/soc@0";
>=20
> 		__overlay__ {
>=20
> 			usb@78d9000 {
> 				dr_mode =3D "host";
> 			};
> 		};
> 	};
> };
>=20
> Decoded apq8016-sbc.dtb file with the fix (setting dr_mode to host) is,
> /dts-v1/;
> / {=09
> 	soc@0 {
> 		usb@78d9000 {
> 			dr_mode =3D "host";
> 		};=09
> 	};
> };
>=20
> How can set the target to "soc@0" using the DTO syntax?

To strictly answer your question, that would be something like

&{/soc@0} {
	usb@78d9000 {
		dr_mode =3D "host";
	};
};

You can simplify this further however by doing:


&{/soc@0/usb@78d9000} {
	dr_mode =3D "host";
};

Also, that node actually has a label ("usb"), defined here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arc=
h/arm64/boot/dts/qcom/msm8916.dtsi#n2322

So you can end up with

&usb {
	dr_mode =3D "host";
};

All of them should be equivalent to the one you had in your patch.

Maxime

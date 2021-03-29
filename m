Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE8A34C492
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 09:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60DF06E2D1;
	Mon, 29 Mar 2021 07:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659696E28B;
 Mon, 29 Mar 2021 07:08:36 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id h13so13016064eds.5;
 Mon, 29 Mar 2021 00:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nsgDV40GpgMjdMBehMLStcFSCLaYlMp03YLRRXFE+RA=;
 b=VxMZ7dSGQEdi8XOeWO1BicR5PJXdG9cKLNO6DN3n22tMui9UBI2ot+5PlRjW6qjCKv
 kkBbSAt5V7Y3j3LRRAHs9H5M1AASRp+Z0Hk5xJi1S4YuPya4yGJbKEyVjLVJwaF7yUSG
 0dSr68sCJPigikcaTg4rQNISm5kZwfHkO1AA63bJmhSuCZoeaHbDHPH+bG98njKUO51r
 DWrZ9E5rabkL5rid66HlEq5PRQ6BbxQFNZiGztlvB/wDoo+FZaaKJ62YGqEi6DgrVzKY
 XHDB4llTrEMZTZoCXYzTSsygURQ0muMvLDFU3XRquFpzxTG+7rsX+wseLGmMjJiteyf9
 vZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nsgDV40GpgMjdMBehMLStcFSCLaYlMp03YLRRXFE+RA=;
 b=ZHJhLHJAH5p5ORFWsw4heTjKWRJ/ZeN+b7b4XoLCHpV2bUfGhqby//OrRJ7n7iJZwI
 G2IGjR8guE8GFuMzdDuz3gyMEh0LwLj6b1ES3w83frw1HRfJeFHjy9/qlw2hOTJKi4t1
 XTLSucVWdLGBe698XUz6yk434nCKwTo0Jo2rzDKTKR++95RvNX+k8WULYHjLUrPZe9mZ
 T1jZPIboVseSnV5D4y+2OqYtdTfLiGgqlg2rBdeupCg+msW0n3paOWUO3c0k8p0nrN+W
 81Lh1Q8BIHN17NqEgqZ9+h4eeLQ/lrCkaLe1/lELbMH7oiVOQCJaZYlZ4MrKthX2LJN8
 rxTA==
X-Gm-Message-State: AOAM533RbQ6QICig4fXluK11w9HdQQhcKGizx1me2JgJcSfliy6wdD1Y
 1wwR8r9TBtLZNhOjuvek+K10VtI+7vI=
X-Google-Smtp-Source: ABdhPJwEJT/07GJdbFQtJ2P6vX8qiUN2z0P2wCX/J/CoVqW4cmKzRx2ZrUQ7oHNCPgeOgptcmNi0Rw==
X-Received: by 2002:a05:6402:31a7:: with SMTP id
 dj7mr27411505edb.33.1617001715049; 
 Mon, 29 Mar 2021 00:08:35 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id n16sm8443196edr.42.2021.03.29.00.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 00:08:34 -0700 (PDT)
Date: Mon, 29 Mar 2021 09:08:59 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v2 05/20] drm/dp: Add backpointer to drm_device in
 drm_dp_aux
Message-ID: <YGF9C284EOaf/WZP@orome.fritz.box>
References: <20210326203807.105754-1-lyude@redhat.com>
 <20210326203807.105754-6-lyude@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210326203807.105754-6-lyude@redhat.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 Oleg Vasilev <oleg.vasilev@intel.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Michal Simek <michal.simek@xilinx.com>, amd-gfx@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Vasily Khoruzhick <anarsoul@gmail.com>,
 "Jerry \(Fangzhi\) Zuo" <Jerry.Zuo@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 Swapnil Jakhade <sjakhade@cadence.com>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Jonas Karlman <jonas@kwiboo.se>, Leo Li <sunpeng.li@amd.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org,
 Joe Perches <joe@perches.com>, Yuti Amonkar <yamonkar@cadence.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "open list:DRM DRIVERS FOR NVIDIA TEGRA" <linux-tegra@vger.kernel.org>,
 Mikita Lipski <mikita.lipski@amd.com>, Sean Paul <sean@poorly.run>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Chris Park <Chris.Park@amd.com>,
 Eryk Brol <eryk.brol@amd.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Jyri Sarha <jsarha@ti.com>, open list <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Julia Lawall <Julia.Lawall@inria.fr>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Andy Yan <andy.yan@rock-chips.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============2110801364=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2110801364==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="S4O2kq+aHqU/5PJ1"
Content-Disposition: inline


--S4O2kq+aHqU/5PJ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 26, 2021 at 04:37:52PM -0400, Lyude Paul wrote:
> This is something that we've wanted for a while now: the ability to
> actually look up the respective drm_device for a given drm_dp_aux struct.
> This will also allow us to transition over to using the drm_dbg_*() helpe=
rs
> for debug message printing, as we'll finally have a drm_device to referen=
ce
> for doing so.
>=20
> Note that there is one limitation with this - because some DP AUX adapters
> exist as platform devices which are initialized independently of their
> respective DRM devices, one cannot rely on drm_dp_aux->drm_dev to always =
be
> non-NULL until drm_dp_aux_register() has been called. We make sure to poi=
nt
> this out in the documentation for struct drm_dp_aux.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
[...]
>  drivers/gpu/drm/tegra/dpaux.c                            | 1 +
[...]

Acked-by: Thierry Reding <treding@nvidia.com>

--S4O2kq+aHqU/5PJ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBhfQgACgkQ3SOs138+
s6HzSQ/9Eo9S9xJvfEMo3ZsjRgZiCwhHpK8p3ntNKOfVV0ipfpeo8vw4YguhWC10
loGRu6CMa+hJqNW3xt/Bhjsj3Wu15gLGcW2igvKlQIr8aNWpssLD3lNELgd2ousG
82a+SF/3ljYs/060sFVCTK782CM+kNBw0ODjoohQjNoO++D1Rr2T0oq85DR8SKcu
K+dCQR1V/D7bwL9d2/M9UHM4i9hlOkGUKkFOre0x9FyFeOAAXu4q7dfOg9FCkcU/
4nIFE8mzWkW4o/fNLiF757dB2llZXxOl+pXNOBye31oslqZxGI6tkJQsvof4sODq
s9Eo0qjPjR0rIXZDkVJCScM7yOH2PrzCiVQFTLutTBVuJ6vDd3dmnyzOzRMeqU8h
CRcPTECPt3lP77XvqptSH/qdGiylAy0nnIwbw+9/Q7ZZ4KQM6e9pcj/fiSqOocdv
bz044P8GPgO18yExiKM4xun4K9t6vJ6MckuHTZEG+16DrRsj6ybdxjBosdBiDN2T
OyusX77/sl2KXr9fHW+tWwrDavb7GJ8jpJzZqyxUJa5Tb/ZeVzoScwiSfsLV62Nb
JXM8KHUhdfKqOa9Yefaf2O4yGFwcF6PLpKlTPw73PlNqEyhxEBLDqFgb5q2pEXLF
uo9LCn/Bju7B/15eqK58g9OAN7no8PxXCmaiO7y6w4fjqsFPTjI=
=4qxj
-----END PGP SIGNATURE-----

--S4O2kq+aHqU/5PJ1--

--===============2110801364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2110801364==--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBE882EBC9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 10:42:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E0F10E1A3;
	Tue, 16 Jan 2024 09:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 344 seconds by postgrey-1.36 at gabe;
 Tue, 16 Jan 2024 09:42:45 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2761F10E1A3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 09:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1705398165; x=1736934165;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WaSp1uecU8Hv9kjMQc6rHJ1yWydbl1s07fCkpBLmJ8Q=;
 b=LZw70j4beNBM8qtj8hbccUKEz+/CL9TbXyyeBC7mjGU3xj06PABUFVRX
 TZvOffM8v/TZ/fl9pZ5HGuGgIgvQq7LGVe2Z5FCvnML7YYMYvp+9X62Gg
 wqIjNhnJ1KbtH7nrArUI983G5vxqK7MxGZgoaYYATtsHdYLtCN/3AwyuB
 rpH9tRaW1rnL6gyK4g8xx22RtNDoZToLgoJbNnj5lYw4Cu+CPgq+Ktx9G
 hD4FAeJ78G3hFQSc1o79EteZTWi1+w20SNQBckobJ9d3IfuK98EV1wAR5
 IyEy5tJusQhIVnHOJd4O/liWrnb4zOThT+1CYu8ko52Sy1MNuSHQMWxCS g==;
X-CSE-ConnectionGUID: dZKgwdjESgmVmHbCstXmxQ==
X-CSE-MsgGUID: aeEHy09nT/KGdnPjW7vHHw==
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
 d="asc'?scan'208";a="14820304"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jan 2024 02:39:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 02:39:19 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 16 Jan 2024 02:39:15 -0700
Date: Tue, 16 Jan 2024 09:38:39 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Devarsh Thakkar <devarsht@ti.com>
Subject: Re: [DO NOT MERGE PATCH 2/2] arm64: dts: ti: Add common1 register
 space for AM62x and AM65x SoCs
Message-ID: <20240116-spending-famished-5a5e407d02bb@wendy>
References: <20240115125716.560363-1-devarsht@ti.com>
 <20240115125716.560363-3-devarsht@ti.com>
 <20240115-penpal-pluck-d156ccf21b2f@spud>
 <4c5cb4ed-96a3-7bd8-f660-2a3bb041ca09@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BC6FFMzhPnkn64Jt"
Content-Disposition: inline
In-Reply-To: <4c5cb4ed-96a3-7bd8-f660-2a3bb041ca09@ti.com>
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
Cc: nm@ti.com, devicetree@vger.kernel.org, conor+dt@kernel.org, j-luthra@ti.com,
 tzimmermann@suse.de, krzysztof.kozlowski+dt@linaro.org, praneeth@ti.com,
 tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org,
 jyri.sarha@iki.fi, Conor Dooley <conor@kernel.org>,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, mripard@kernel.org,
 daniel@ffwll.ch, a-bhatia1@ti.com, airlied@gmail.com, kristo@kernel.org,
 vigneshr@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--BC6FFMzhPnkn64Jt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 02:48:53PM +0530, Devarsh Thakkar wrote:
> Hi Conor,
>=20
> Thanks for the review.
>=20
> On 15/01/24 21:44, Conor Dooley wrote:
> > On Mon, Jan 15, 2024 at 06:27:16PM +0530, Devarsh Thakkar wrote:
> >> This adds common1 register space for AM62x and AM65x SoC's which are u=
sing
> >> TI's Keystone display hardware and supporting it as described in
> >> Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml.
> >>
> >> This region is documented in respective Technical Reference Manuals [1=
].
> >>
> >> [1]:
> >> AM62x TRM:
> >> https://www.ti.com/lit/pdf/spruiv7 (Section 14.8.9.1 DSS Registers)
> >>
> >> AM65x TRM:
> >> https://www.ti.com/lit/pdf/spruid7 (Section 12.6.5 DSS Registers)
> >>
> >> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> >> ---
> >=20
> > "[DO NOT MERGE PATCH 2/2]" but no rationale here as to why this cannot
> > be merged? What's the problem with it?
> >=20
>=20
> No problem as such from my point of view, but this is the process I follow
> since maintainer trees for device-tree file and bindings are different. I
> generally mark a [DO NOT MERGE] tag for device-tree file patches until bi=
nding
> patch gets merged so that the device-tree patches don't get applied by mi=
stake
> if binding patch has some pending comments.
>=20
> Once binding patch gets merged, I re-send the device-tree file patches ag=
ain
> to respective list.

I see. Please note this in your patches, under the --- line, in the
future to avoid confusion.

--BC6FFMzhPnkn64Jt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaZOnwAKCRB4tDGHoIJi
0rJvAP4y1i7FM56Lm+nbXDP54G7/zOyfStQD6i7K+5HRE0TukAD/WY69qtoMG6kG
+p/19kPAUGbuxQCH4HeYpl6fP6cBcgU=
=Hg35
-----END PGP SIGNATURE-----

--BC6FFMzhPnkn64Jt--

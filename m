Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2542F82EBD7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 10:44:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A9210E453;
	Tue, 16 Jan 2024 09:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4349010E453
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 09:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1705398248; x=1736934248;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=39czfNO5V3xKHsrOqpHy7us5tDzGWkwldLuCUN58kKA=;
 b=eDUNjJMDp4FSn9JrAaqK/sl8kMv099kHxkn+WoOsSDqFmqyUcsFMhRE5
 O8YCFOiBalkpfGwGNKsouTAyHmxLMKmNdhID0eM2iM3LlotcBpxDbUv1D
 CWO6y0fFcXe4d4H3yN2O1EWjrMNMuQq5Q7vnD6F1ZM0MqzJS/lGWTjesp
 /YiAgCNLVtp2sQuoomb+HPuyCTr62ikwYBx+FXe4V7LDPeMpvf4mFmm0x
 ZeJYdARmRe8D/5mD76e2D+6HuHZGbxPJSkzJyM17dmoERW9mEGNzmPNEn
 OyW+RqiK/Ev4CKmUBJIIG5gfbn+rwUXjUlMX4h6zwzaNZ+OC//a2T/7K8 w==;
X-CSE-ConnectionGUID: KLJlNhuBSmyPaf0y5pvXTg==
X-CSE-MsgGUID: VqOrt//kSvysy5D/p/zs3A==
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
 d="asc'?scan'208";a="245528620"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jan 2024 02:36:55 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 02:36:54 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 16 Jan 2024 02:36:50 -0700
Date: Tue, 16 Jan 2024 09:36:14 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Devarsh Thakkar <devarsht@ti.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: ti,am65x-dss: Add support for
 common1 region
Message-ID: <20240116-unrobed-cornflake-b19d4c8eb6f6@wendy>
References: <20240115125716.560363-1-devarsht@ti.com>
 <20240115125716.560363-2-devarsht@ti.com>
 <20240115-craftsman-capricorn-d2930678c222@spud>
 <060358d6-ade1-b84e-4550-e2ae34a6d53c@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+rwc3dPPDb7jGZPT"
Content-Disposition: inline
In-Reply-To: <060358d6-ade1-b84e-4550-e2ae34a6d53c@ti.com>
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

--+rwc3dPPDb7jGZPT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 02:43:25PM +0530, Devarsh Thakkar wrote:
> Hi Conor,
>=20
> Thanks for the review.
>=20
> On 15/01/24 21:47, Conor Dooley wrote:
> > On Mon, Jan 15, 2024 at 06:27:15PM +0530, Devarsh Thakkar wrote:
> >> TI keystone display subsystem present in AM65 and other SoCs such as A=
M62
> >=20
> > Do all 3 SoCs supported by this binding (am625 am62a7 am65x) have this
> > common1 register? If not, you should limit it the platforms that do have
> > it.
> >=20
>=20
> Yes all 3 SoCs supported by binding have common1 register space supported.

Okay, thanks.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--+rwc3dPPDb7jGZPT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaZODgAKCRB4tDGHoIJi
0k/9AP4h3OJM2KbUAQ+lhul093KnPwadGv739cJyQuGQqMMkCwD/Q9dlnqTU0P80
HKKE2LC1Hw/uyuPyVRQw1kceYE1gFgQ=
=Y0Rt
-----END PGP SIGNATURE-----

--+rwc3dPPDb7jGZPT--

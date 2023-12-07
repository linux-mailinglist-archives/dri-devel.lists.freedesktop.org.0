Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E9C8084C7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 10:36:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E207F10E83B;
	Thu,  7 Dec 2023 09:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A589610E83B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 09:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1701941758; x=1733477758;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zk1dhT6C/KZSArTdzP/p5wqb9G2bfeL3f7SYtKcXyCo=;
 b=XO5nacc41r26Idi/nmianp+cUzaFk893BFOyqYjB6mO0xE4U7H6DonqD
 VFCPPhmpI0yX82UX0nYRn+2zQnMx0LKFJNfFR/GVEsmmnnc5V9RYZukbC
 6AZvb3gz+lfYKzBQ8waveLAzUs8Yom1bCreUwdQYtG6+4w0owtwK0y+Ey
 XkH+uvNY+/F5oamSmMOcAakgQZGLMu04OFaLAFddk5eaBp+9Xg7jfWn5T
 ATeoKUU4g7QW3cK5zhCLtnqysOPuRUVxARmuRKzN9UgiyEuQrF5ZJxLPl
 QZQkNatDzNgJtqpuiaDZRqweZ4Wjif1KSO8BXmOui4lm9FVHYzUUBHO/L A==;
X-CSE-ConnectionGUID: l1+X6HrHTViYXQWuY+0knA==
X-CSE-MsgGUID: 3jqu90UXQHGGuQa2OlUe8A==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
 d="asc'?scan'208";a="12923027"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Dec 2023 02:35:57 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 02:35:33 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Dec 2023 02:35:29 -0700
Date: Thu, 7 Dec 2023 09:34:59 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Shengyang Chen <shengyang.chen@starfivetech.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: display: panel: raspberrypi: Add
 compatible property for waveshare 7inch touchscreen panel
Message-ID: <20231207-dullness-deprive-ece2d47ff69d@wendy>
References: <20231124104451.44271-1-shengyang.chen@starfivetech.com>
 <20231124104451.44271-2-shengyang.chen@starfivetech.com>
 <20231124-lesser-sinister-7f9cd7b80e35@spud>
 <2d48e460-e46e-431f-bd7b-e34ebe73a40c@starfivetech.com>
 <20231206-isolating-smoked-b490952029d0@spud>
 <53b992e8-1b36-4540-a993-fde8e550faf9@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LKkffefepue30ywv"
Content-Disposition: inline
In-Reply-To: <53b992e8-1b36-4540-a993-fde8e550faf9@starfivetech.com>
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
Cc: dri-devel@lists.freedesktop.org, eric@anholt.net, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, florian.fainelli@broadcom.com,
 sam@ravnborg.org, bcm-kernel-feedback-list@broadcom.com,
 quic_jesszhan@quicinc.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 mripard@kernel.org, robh+dt@kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 keith.zhao@starfivetech.com, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, jack.zhu@starfivetech.com,
 tzimmermann@suse.de, changhuang.liang@starfivetech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--LKkffefepue30ywv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 07, 2023 at 11:48:56AM +0800, Shengyang Chen wrote:
> Hi, Conor
>=20
> thanks for comment
>=20
> On 2023/12/6 23:40, Conor Dooley wrote:
> > On Wed, Dec 06, 2023 at 05:43:48PM +0800, Shengyang Chen wrote:
> >> Hi, Conor
> >>=20
> >> On 2023/11/24 20:31, Conor Dooley wrote:
> >> > On Fri, Nov 24, 2023 at 06:44:50PM +0800, Shengyang Chen wrote:
> >> >> The waveshare 7inch touchscreen panel is a kind of raspberrypi pi
> >> >> panel
> >> >=20
> >> > Can you be more specific about what "is a kind of rpi panel" means?
> >> > Are they using identical chips as controllers or something like that?
> >> >=20
> >>=20
> >> Wareshare panel has same i2c slave address and registers address with=
=20
> >> the original raspberry pi panel. They both use Atmel firmware and they
> >> got same reg id. It can be operated by using the driver of raspberry p=
i driver
> >> after some change of the code. So I suppose it may be a kind of raspbe=
rry pi panel=20
> >> and discribe it in this way. It's my own judgement. Sorry about that.
> >> Maybe just like Dave said, It cloned the behaviour of the raspberri pi=
 panel.
> >> I will change the discribtion in next version to not make other confus=
ed.
> >>=20
> >> By the way, we will try Stefan's method before next version.=20
> >> The method we used in this patch may be abandoned if Stefan's method i=
s verified in our platform.
> >> At that time yaml may also be changed to fit new method.
> >=20
> > I don't know what Stefan's approach is, but I do not think that a
> > bindings patch should be dropped. The waveshare might be a clone, but it
> > is a distinct device. If the same driver can control both, then the
> > compatible setups that should be permitted are:
> > compatible =3D "raspberrypi,7inch-touchscreen-panel";
> > and
> > compatible =3D "waveshare,7inch-touchscreen-panel", "raspberrypi,7inch-=
touchscreen-panel";

> If we use Stenfan's method, we can reuse the code of panel-simple.c
> we may submit our patch to
> /Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> /drivers/gpu/drm/panel/panel-simple.c
> as a new panel porting. That may less confuse.

As long as you provide a specific compatible, and not re-use the rpi
one, that's fine. It just sounded like you were intending to reuse that
here, but from this message it seems like I misunderstood.

Thanks,
Conor.

--LKkffefepue30ywv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXGRvwAKCRB4tDGHoIJi
0uepAPsFO121yBy+oxhB7OSau+AELQyXEwausDJX8GujOigD2wD+NWi8eCcUWndt
3hUdUUgCa3P8sLTU12m5hwaHq3cJ9Qo=
=bdsy
-----END PGP SIGNATURE-----

--LKkffefepue30ywv--

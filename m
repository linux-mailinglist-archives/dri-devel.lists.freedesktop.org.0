Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C25899AAB
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 12:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3351A113AD5;
	Fri,  5 Apr 2024 10:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TbhXudkY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Fri, 05 Apr 2024 10:25:20 UTC
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE1D113AD6
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 10:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=k1; bh=XRZ/
 7f9TpBVm+EqkcIlzKupPDZE9c/6S0MGx+T9aWhU=; b=TbhXudkYnme5n6iHh1a7
 RBdhDu2GT6+9PAy8ABhR4DJ4AFeu9vn7KF9NnItdIjxg3lODlyxOWMQzmHvBjUuV
 6C2iJlxx9lPXa2C8k2zkTkCSAQ80w4ipFFE24BRkYFzXyEK7FP0vMNw5j1O2wMwt
 rY3DTBf3ZIZFcTyDbCkD+x2BtRIlE2QfpykSPGqfi0fAa4E69G+hgGGV7l0hOuGb
 eRpF0U2crVKhUWxUBjAZhcKkAmkgy6/e5eOeLvTbIQriGrx9zqcvXZvr+o3oYemF
 ZV3lsTAHA9m7SGPcs05kwS6QKI/86ISnt7+jeteV6CxjkYrq8U88Su9gL7GEhrTR
 qA==
Received: (qmail 4072572 invoked from network); 5 Apr 2024 12:18:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 5 Apr 2024 12:18:37 +0200
X-UD-Smtp-Session: l3s3148p1@a0Brx1YVfIUgAwDPXwEGAANOsN0UmmrN
Date: Fri, 5 Apr 2024 12:18:37 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, 
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, 
 "open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v0 00/14] Make I2C terminology more inclusive for I2C
 Algobit and consumers
Message-ID: <ffumcagmzdstcf3qcn3f26555pnu7i6azjppciyd4zvcoit7pv@vu262tsfnqyr>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Easwar Hariharan <eahariha@linux.microsoft.com>, 
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, 
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, 
 "open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wrrai2fidezv42rs"
Content-Disposition: inline
In-Reply-To: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
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


--wrrai2fidezv42rs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Easwar,

On Fri, Mar 29, 2024 at 05:00:24PM +0000, Easwar Hariharan wrote:
> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
> with more appropriate terms. Inspired by and following on to Wolfram's
> series to fix drivers/i2c/[1], fix the terminology for users of the
> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
> in the specification.

I really appreciate that you want to assist in this task to improve the
I2C core. I do. I am afraid, however, that you took the second step
before the first one, though. As I mentioned in my original cover
letter, this is not only about renaming but also improving the I2C API
(splitting up header files...). So, drivers are not a priority right
now. They can be better fixed once the core is ready.

It is true that I changed quite some controller drivers within the i2c
realm. I did this to gain experience. As you also noticed quite some
questions came up. We need to agree on answers first. And once we are
happy with the answers we found, then IMO we can go outside of the i2c
realm and send patches to other subsystems referencing agreed
precedence. I intentionally did not go outside i2c yet. Since your
patches are already there, you probably want to foster them until they
are ready for inclusion. Yet, regarding further patches, my suggestion
is to wait until the core is ready. That might take a while, though.
However, there is enough to discuss until the core is ready. So, your
collaboration there is highly appreciated!

> The last patch updating the .master_xfer method to .xfer depends on
> patch 1 of Wolfram's series below, but the series is otherwise
> independent. It may make sense for the last patch to go in with

Please drop the last patch from this series. It will nicely remove the
dependency. Also, like above, I first want to gain experience with i2c
before going to other subsystems. That was intended.

All the best and happy hacking,

   Wolfram


--wrrai2fidezv42rs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYPz/kACgkQFA3kzBSg
Kbb2khAArgkbDpks50YTmBYCaMaPYcuR0VEc60/+z8tRAlS4IKaYIXzw2LEXG7Lz
vJE8MMcWs6lGZjapOyfhFrB/U9Zu8Ffpg1qataFG3ZnRZG6BYb8i2cCTCwK9h4Vk
KfijUXjmqXMGKRcaUcIYL/IxYZYRP0Y9yYGfBibDtxV7hnMakp6+XXbfM8FVCj1g
iW3ORBfLYR32dJxnI4unFt15e2aXFDQkJDLqBJ4WGynGPaGr0lmfQpWQDP2aYlN0
Dyormc+6tCEOAN6PBG0cssZbMUj4ABQYOxxNhQ8hP6gAqkMuqqC1+nHAH3PNQjkf
VHMYFPogE0LGrCOOVKzgeU3QIfF9MABirrNB8bx+K3tl1te0EWse1u4CXIKrmBZ7
VS1fVRMUdS25YnzNM5cfZQTGv2JxgebrXUqN1bneFpKmISO66p2hF3/8lsaPO8Rw
6QOTRpcHay1sESrreLn9gAj/NeddgU7XhI3oGqk6PQyYQrE5LbTh0wuZil02rwjJ
ea29MTkK7muy5fQT9dDHOk38fjG0jk48Oyk5NBVMboeLKlvPy6OTiXG6Z1lifGga
xZe0cBBoH5gHPY6ZIVh4HaHfbmzt5jGIpzf8Sx9E9n03K6Njewqu+Wxm24AMr/OR
79BvBK0rlCVMmck+ZJiW969Q/G9JKFieQnUDqHlMc5nIAHMB0Lw=
=T3F5
-----END PGP SIGNATURE-----

--wrrai2fidezv42rs--

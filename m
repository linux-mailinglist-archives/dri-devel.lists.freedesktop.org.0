Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8554F7BA5A
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC596E696;
	Wed, 31 Jul 2019 07:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92FBB89F08
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 18:55:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id AEB3D28B89F
Date: Tue, 30 Jul 2019 11:54:55 -0700
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 6/7] drm/panfrost: Add support for GPU heap allocations
Message-ID: <20190730185455.GA3205@kevin>
References: <20190725011003.30837-1-robh@kernel.org>
 <20190725011003.30837-7-robh@kernel.org>
 <ab9c3277-9e34-2712-975b-7c59b64e52d0@arm.com>
 <9eaf879c-bd7b-aded-e8f6-8efc2394fef5@arm.com>
 <20190725161344.GA2950@kevin>
 <482dc837-3ca8-dd93-bbc6-0eb97f3627e7@arm.com>
 <20190725174006.GA2876@kevin>
 <1c54bd6c-a594-614d-7de0-badb00269ea1@arm.com>
 <CAL_JsqLepsMdvJbi_=3xxgVH-Hasu_6=MK6NnXK0CdM7YPwubg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLepsMdvJbi_=3xxgVH-Hasu_6=MK6NnXK0CdM7YPwubg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Robin Murphy <Robin.Murphy@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1236905449=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1236905449==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> In any case, per process AS is a prerequisite to all this.

Oh, I hadn't realized that was still a todo. In the meantime, what's the
implication of shipping without it? (I.e. in which threat model are
users vulnerable without it?) Malicious userspace process snooping on
other framebuffers (on X11, they could do that anyway...)? Malicious
userspace actually interfering with operation of other processes (is
this really exploitable or just a theoretical concern)? Malicious 3D
apps breaking out of the sandbox (i.e. WebGL) via a driver bug and
snooping on other processes?

---

*wishing we could just delete webgl intensifies*

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl1AknkACgkQ/v5QWgr1
WA215g//SNUM4G6S6o1p1Ft3ouzI/tyFkwX2GLRTz80SirVjUsF0CnqPkuxve7Y+
Ws8p3vL+Udggncr8/LWPZ796yQ5Szzn/jzVmR/mRA+cc9KUU5Oontx1WpCoxn7St
LV+97aAaheRDDpHz3m5e8L4T8k9oDAz1O8SDaC4Swfu4pAQ3q38j4O/YJampm+vk
+36ij+ZlPWHISfn9otGTZVGAZUTTz85g/6aG1jKPYK4O9/yt1d1ogoI7zVybMYjy
8NH/O5tjjt6wjFiQN+7Fq/5Iu6S8SWcDApIw3oPnBmqqEOVx775gIEKNxxQ6cFqG
U9XRsFboJhcS+50i6lsP7rnHfuUCRvcSkvD3KYL4Fgt2okEjcQ27XwNSIipW2cCu
FgtO+0YVcgyn0Nyvi7job+37CxRmDj175XbhJaSM01b0em3Y4GAlRaXG+Hd/myDC
5JFL3l+zGhYQwXroA0w7dlGbOYLtOpqKWqGHuMPBb8JY91vfzzo7uIQ644rU50r8
zjZ7CoGTYTYUmxQTZpXwYT42y/SvzgZEjkwaQozdP8F27T1RpU+ZCNTKtn+Y8CjP
1LrnCeSSpZAtv5cdpdrIHx9vxJXDKgeLEEMM4GyW93ztPKV51jHR0o+E0zKnFT8C
bGV6RjUQrwLL/FJ0/JKmTlVjxpfnlA/QwN42MRD41wFYPHQR3EM=
=dmyL
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--

--===============1236905449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1236905449==--

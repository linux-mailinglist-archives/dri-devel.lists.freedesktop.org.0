Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A36A6AB672
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 12:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CACA6E245;
	Fri,  6 Sep 2019 10:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC426E245
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 10:55:27 +0000 (UTC)
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i6Btk-0001RZ-Pi; Fri, 06 Sep 2019 10:55:24 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id ED8D6D02CE7; Fri,  6 Sep 2019 11:55:23 +0100 (BST)
Date: Fri, 6 Sep 2019 11:55:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm/panfrost: Fix regulator_get_optional() misuse
Message-ID: <20190906105523.GR23391@sirena.co.uk>
References: <20190904123032.23263-1-broonie@kernel.org>
 <CAL_JsqK8hn8aHa0e-QhT5=dMqCd0_HzNWMHM1YbEC_2z8n-tXg@mail.gmail.com>
 <feaf7338-9aa1-5065-7a83-028aeadd5578@arm.com>
 <20190905124014.GA4053@sirena.co.uk>
 <93b8910d-fc01-4c16-fd7e-86abfc3cc617@arm.com>
 <20190905163420.GD4053@sirena.co.uk>
 <58594735-c079-74e5-26c8-4911f073d4df@arm.com>
MIME-Version: 1.0
In-Reply-To: <58594735-c079-74e5-26c8-4911f073d4df@arm.com>
X-Cookie: Don't SANFORIZE me!!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jxvUc8xlampYvLgbd5XOv3nymCzHXx5x8vB16XRysHA=; b=pemxa5WrNHEfFh+9kQ1lN26t3
 jhV8vq8Ob7RSY/A6KfQ7PGth1f5PavwaiVmvnFZbeNoype8JmqDksLfNnBeln5gKIfUHVBYT/LhPU
 QWUN0PL//bAqdFSJUw4UBuXtnQjXuuM05sGUuQEMJtl2EHEqEioEUu2gbIf3dbVTqxlAg=;
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
Cc: David Airlie <airlied@linux.ie>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1955198561=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1955198561==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j1TzbQBGf+ftliiX"
Content-Disposition: inline


--j1TzbQBGf+ftliiX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 06, 2019 at 11:00:53AM +0100, Steven Price wrote:
> On 05/09/2019 17:34, Mark Brown wrote:

> > that information, I'd recommend eliminating individual OPPs if some are
> > supported or just never doing any regulator configuration if none can be
> > set.

> The problem on the Hikey960 is that the voltage control is not done by
> Linux. At the moment I have a DT with a set of operating-points:

Like I said above:

| > > that information, I'd recommend eliminating individual OPPs if some are
| > > supported or just never doing any regulator configuration if none can be
| > > set.

> But while Linux can set the frequency (via the mailbox interface) the
> voltages are not set by Linux but are implicit by choosing a frequency.
> At the moment my DT has a clock but no regulator and with the code in
> drm-next this works.

If you're just not getting any voltages for the OPPs then your
code shouldn't be trying to set voltages in the first place,
regulator or not.

> Your change swapping devm_regulator_get_optional() to
> devm_regulator_get() breaks this because that will return a dummy
> regulator which will reject any regulator_set_voltage() calls.

OTOH the current code won't work on a system which does specify a
regulator but doesn't have voltages configured in the OPP table
or where the regulator constraints for the board haven't been
configured to allow the voltage to be varied (perhaps the voltage
bit hasn't been worked out, perhaps the voltages were just added
to the OPPs in the SoC DT and the board constraints weren't
updated to allow voltage variation).

> I don't currently see how I can write a DT configuration for the
> Hikey960 which would work with the devm_regulator_get() call.

Like I've been saying you can discover if you can configure
individual voltages and use that information to either suppress
the OPPs concerned or just skip setting voltages for them, my
suggestion is to suppress OPPs only if you can set some of them.
At the very least if you don't have a voltage at all on a given
OPP you should skip the set.

> > However you're probably better off hiding all this stuff with the
> > generic OPP code rather than open coding it - this already has much
> > better handling for this, it supports voltage ranges rather than single
> > voltages and optional regulators already.  I'm not 100% clear why this
> > is open coded TBH but I might be missing something, if there's some
> > restriction preventing the generic code being used it seems like those
> > sohuld be fixed.

> To be honest I've no idea how to use the generic OPP code to do this. I
> suspect the original open coding was cargo-culted from another driver:
> the comments in the function look like they were lifted from
> drivers/devfreq/rk3399_dmc.c. Any help tidying this up would be appreciated.

Yes, there's a lot of cargo culting of bad regulator API usage in
the DRM subsystem for some reason, I keep having to do these
periodic sweeps and there's always stuff in there.  I think a lot
of it comes from BSP code that just gets dropped in without
review and then cut'n'pasted but I've not figured out why DRM is
so badly affected.

--j1TzbQBGf+ftliiX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1yOxkACgkQJNaLcl1U
h9CmSwf/b18G7+KT6yxu0T7eY2r1bqKpr84kLCcHDwooTHOade5hoO1sNN+9/W5v
JCYYmg68lRgYIFmQUelfo1RHXMsVlcHyn9pZJFFOGv1j3tVHrAkP5ec8oYViW1V2
6bzLoF/GqPFmfr78g9diZST7SCHX8N2RzLOZuNQVliMbqT8SY9LOBWc0EUkm2dtX
TnNdx1j0nkzDLRLyx3riuBOH5ymjYGbd6Ki/dFMG2zI3jx5JOi2FSXmNiTzjeGmI
/blSGI2TNcR56eJOTND3h6Tsf8QNN24tH+OAIsUFNkqNooJWK3/+xEHrhVaCpH/3
lvf/wx16GU6puuQsEo2ijuCdDydeXQ==
=cmPn
-----END PGP SIGNATURE-----

--j1TzbQBGf+ftliiX--

--===============1955198561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1955198561==--

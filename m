Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C757C5919
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 18:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E7110E5F4;
	Wed, 11 Oct 2023 16:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5030810E999
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 16:27:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 443BFB82189;
 Wed, 11 Oct 2023 16:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40884C433C7;
 Wed, 11 Oct 2023 16:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697041638;
 bh=zYaA2j2ue2uB4R6U1J8+ERVI8gEpOZeSEH/+AHNAPCk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rJLKXaIdciGTbQ8FRwESkX5Qvioj+CgtSrp+uVRbOE7Tfd7n+L8L9DK6tVHYdPGY0
 7kin4cBlUYjXPtKd/n3pdQfsbOaidRVB3SbYiyJfUAr1b6RCG8iBU2V5ymyEY57tOp
 JTbaU5PyB16S13HeDZqHr2xGOoRD3A1zfDjCUF+5cdpVTGL2fkehuoJsNK4RW0vOiI
 CC/9UhV8iV9wTbAgVCVDwd1xnMHIyOuvDKiWnrIgHcfcqUKgx0aJdqdOyacA74DuaB
 mWT3pCY68ruJbVVCyu/bQ5xJqRfEpebxfCUs7SPCaUU4XO1ZwyJ5kxZKxM8XYOWfbg
 Ch9NJgrjO2etQ==
Date: Wed, 11 Oct 2023 18:27:15 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1 0/2] [PATCH] hwmon: (pmbus/max31785) Add minimum delay
 between bus accesses
Message-ID: <ZSbM44TQRYh6F/ee@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Lakshmi Yadlapati <lakshmiy@us.ibm.com>, sumit.semwal@linaro.org,
 christian.koenig@amd.com, jdelvare@suse.com, joel@jms.id.au,
 andrew@aj.id.au, eajames@linux.ibm.com, ninad@linux.ibm.com,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-hwmon@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20231009211420.3454026-1-lakshmiy@us.ibm.com>
 <ZSUaDIfWmEn5edrE@shikoro>
 <1284830f-025e-4e25-8ed0-50a6cc00d223@roeck-us.net>
 <ZSWevlHzu6kVcGWA@shikoro>
 <125cac30-b83d-4530-885b-5008fc3045af@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="npgRRoRwjI+EonaY"
Content-Disposition: inline
In-Reply-To: <125cac30-b83d-4530-885b-5008fc3045af@roeck-us.net>
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
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, andrew@aj.id.au,
 eajames@linux.ibm.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com, ninad@linux.ibm.com,
 joel@jms.id.au, Lakshmi Yadlapati <lakshmiy@us.ibm.com>,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org,
 linux-i2c@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--npgRRoRwjI+EonaY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guenter,

> I didn't (want to) say that. I am perfectly happy with driver specific
> code, and I would personally still very much prefer it. I only wanted to
> suggest that _if_ a generic solution is implemented, it should cover all
> existing use cases and not just this one. But, really, I'd rather leave
> that alone and not risk introducing regressions to existing drivers.

Okay, seems we are aligned again :)

> I don't know about this device, but in general the problem is that the
> devices need some delay between some or all transfers or otherwise react
> badly in one way or another. The problem is not always the same.

Ok, that again doesn't speak for a generic solution IMO.

> Lower bus frequencies don't help, at least not for the devices where
> I have seen to problem myself. The issue is not bus speed, but time between
> transfers. Typically the underlying problem is that there is some
> microcontroller on the affected chips, and the microcode is less than
> perfect. For example, the microcode may not poll its I2C interface
> while it is busy writing into the chip's internal EEPROM or while it is
> updating some internal parameters as result of a previous I2C transfer.

I see. Well, as you probably know, EEPROMs not reacting because they are
busy with an erase cycle is well-known in the I2C world. The bus driver
reports that the transfer couldn't get through, and then the EEPROM
driver knows the details and does something apropriate, probably waiting
a while. This assumes that the EEPROM can still play well on the I2C
bus. If a faulty device will lock up a bus because of bad microcode
while it is busy, then it surely needs handling of that :( And this
convinces me just more that it should be in the driver...

> The latter. I never bothered trying to write up a list. Typically the behavior
> is not documented and needs to be tweaked a couple of times, and it may be
> different across chips supported by the same driver, or even across chip
> revisions. Any list trying to keep track of the various details would
> be difficult to maintain and notoriously be outdated.

... especially because of that. If there is really some repeating
pattern for some of the devices, we could introduce helper functions
for the drivers to use maybe. But the I2C core functions are not the
place to handle it.

All the best,

   Wolfram


--npgRRoRwjI+EonaY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUmzN8ACgkQFA3kzBSg
Kba+5w/7B5EZR84z28gl0sg2NGZCA24M/MJCl14PDRI7XVN/XhvlnWIbshqyklN6
e/sHS4rMJqL3fdAsmv/pJ/N0F+RBR/HdttTW/oTXR6nUk+EQdKuhwwUMHKtfsSiX
MRB1fh4h5iA6+WXfpgl6FnftfhgOuG7HPfy4DfcwQE8MbK5CJirDVtT5ywy2BLpX
t9hsm6uHvaLWCjU6YqeRs+YGA7RExWn51GFA5bZAkK3HBE8AUjmFKDhW+NV5cDOv
6AjQe1+3i1BFYuBciOVrcwlJjagAe5nVmLCXSIKPjy3dsSJVAwGEtwBZ76CFnan3
TKIefU/96DRa75LPJaIowbkG4RhkdggXTJU9ZLHmZlzz/gsy7YzT64/yE2EeBJQf
w1nbkXMmr3Qz5BkxhCyBZwm4GWFHYkMXt5HePIXByJttW337lA/w5GcLmTUFMAQt
tFYpTURv6YYDUaf0Wbk/376yJpBhNJAWPQbYoqzASuh3FZwFfdizxFY/mlH6FpSH
VePifCHbiHWJaVGm+HuTurYJ/5O3WWU1NwQIMWqhxb5x1xosLS0mfPapYefGuiY+
l2IagS7gaIDQioT3p+AxZaaz960L54maf1PYOzjBc+wxBTpJ4VNn7LlSKrBnaLvc
niiS7yvv78mRIPTj7Nf1yKtqjyrJ1wfnfNiPxntTnsxhGJUQzJ8=
=fkFw
-----END PGP SIGNATURE-----

--npgRRoRwjI+EonaY--

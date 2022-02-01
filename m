Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E599B4A59A0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 11:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B2F10E567;
	Tue,  1 Feb 2022 10:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF30E10E567
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 10:08:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5B8F821114;
 Tue,  1 Feb 2022 10:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643710104; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DCA+JZm9s4Y+NL2l66Ugb6RicCc4duY6MT2ld79kHUk=;
 b=XqaksSA/uQnO0VhdLSfdZHpryRJ8prc/2icV8vVanQh+9nNBiJbv5ZU2/nESDUprEPIW0a
 7NAqlMiSkca22eChfKW8OcdrhUWWQopv9YfxO5dxOtXGnEJbKzf4r7Rfvic3HKtzg95R7R
 17V4TLJ/yAdZ4QcNUjtg9ZwjNgIRqK8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643710104;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DCA+JZm9s4Y+NL2l66Ugb6RicCc4duY6MT2ld79kHUk=;
 b=VuS6Vzzju9PFruLAp3ocbwHKoI4+IxsNPMSTrAExDT13FYeory9AOmnEEZDMImUSHyPKdz
 y3FAIT4422WAVQCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F18B013B3D;
 Tue,  1 Feb 2022 10:08:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6/+BOZcG+WEgBQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Feb 2022 10:08:23 +0000
Message-ID: <ce283de9-7412-472e-f72c-cb6a35ede426@suse.de>
Date: Tue, 1 Feb 2022 11:08:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, Simon Ser <contact@emersion.fr>
References: <20220131201225.2324984-1-javierm@redhat.com>
 <tIMIWqepcZGntnez-1ss4Kn4K8btXnzDRL7EWd19-745WK90YIC19E_4di9RNvB3gtx-PzWEjBEGQLPNJE_x0T1yyyaWFCoFcCiG4StR9RU=@emersion.fr>
 <wuXPJN-K-rvjoV51c4EBmTBScov8rcJTPoYmlfHe04_-4wD1khVxo9HnUsP7UFd5m4AkzGSw2hXe_c77jbSRhjEJ0JZIYwuvuIkcv_KsR-Y=@emersion.fr>
 <CAMuHMdXKZ=BkvVqdpiNPNJgxm9SzQ3Z0n4SqV2-4oPRveybd6g@mail.gmail.com>
 <qmhzv6kqs6QdAOP3bNB39glOpc8eeJ6flgjfjcaBniT-shDKZkxo5uB71weGOUKxPE6dq_WBhtHmY5vMmuYwqMoHgtMWnX0ESE5R1Y5g5F8=@emersion.fr>
 <CAMuHMdUHhUkPhq8M0d=p5EgH8bBz6EtH4drajKtQHE0121V1uQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdUHhUkPhq8M0d=p5EgH8bBz6EtH4drajKtQHE0121V1uQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kkmck2qcm4CR4C2hZrjhoXfZ"
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
Cc: Linux PWM List <linux-pwm@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kkmck2qcm4CR4C2hZrjhoXfZ
Content-Type: multipart/mixed; boundary="------------RFHxz4jZDwnaz9HrrasPkvDS";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Simon Ser <contact@emersion.fr>
Cc: Linux PWM List <linux-pwm@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Message-ID: <ce283de9-7412-472e-f72c-cb6a35ede426@suse.de>
Subject: Re: [PATCH 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED
 displays
References: <20220131201225.2324984-1-javierm@redhat.com>
 <tIMIWqepcZGntnez-1ss4Kn4K8btXnzDRL7EWd19-745WK90YIC19E_4di9RNvB3gtx-PzWEjBEGQLPNJE_x0T1yyyaWFCoFcCiG4StR9RU=@emersion.fr>
 <wuXPJN-K-rvjoV51c4EBmTBScov8rcJTPoYmlfHe04_-4wD1khVxo9HnUsP7UFd5m4AkzGSw2hXe_c77jbSRhjEJ0JZIYwuvuIkcv_KsR-Y=@emersion.fr>
 <CAMuHMdXKZ=BkvVqdpiNPNJgxm9SzQ3Z0n4SqV2-4oPRveybd6g@mail.gmail.com>
 <qmhzv6kqs6QdAOP3bNB39glOpc8eeJ6flgjfjcaBniT-shDKZkxo5uB71weGOUKxPE6dq_WBhtHmY5vMmuYwqMoHgtMWnX0ESE5R1Y5g5F8=@emersion.fr>
 <CAMuHMdUHhUkPhq8M0d=p5EgH8bBz6EtH4drajKtQHE0121V1uQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUHhUkPhq8M0d=p5EgH8bBz6EtH4drajKtQHE0121V1uQ@mail.gmail.com>

--------------RFHxz4jZDwnaz9HrrasPkvDS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDEuMDIuMjIgdW0gMDk6MzYgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIFNpbW9uLA0KPiANCj4gT24gVHVlLCBGZWIgMSwgMjAyMiBhdCA5OjM0IEFNIFNp
bW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5mcj4gd3JvdGU6DQo+PiBPbiBUdWVzZGF5LCBG
ZWJydWFyeSAxc3QsIDIwMjIgYXQgMDk6MjYsIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRA
bGludXgtbTY4ay5vcmc+IHdyb3RlOg0KPj4+IFdoYXQncyB0aGUgc3Rvcnkgd2l0aCB0aGUg
Um4gZm9ybWF0cz8NCj4+Pg0KPj4+IFRoZSBjb21tZW50cyBzYXkgIm4gYnBwIFJlZCIsIHdo
aWxlIHRoaXMgaXMgYSBtb25vY2hyb21lIChldmVuDQo+Pj4gaW52ZXJ0ZWQpIGRpc3BsYXk/
DQo+Pg0KPj4gSSBkb24ndCB0aGluayB0aGUgY29sb3IgbWF0dGVycyB0aGF0IG11Y2guICJS
ZWQiIHdhcyBwaWNrZWQganVzdCBiZWNhdXNlIGl0IHdhcw0KPj4gYW4gYXJiaXRyYXJ5IGNv
bG9yLCB0byBtYWtlIHRoZSBkaWZmZXJlbmNlIHdpdGggZS5nLiBDOC4gT3IgYW0gSSBtaXN0
YWtlbj8NCj4gDQo+IEknZCBleHBlY3QgOC1iaXQgZ3JheXNjYWxlIHRvIGJlIFk4IGluc3Rl
YWQuDQoNCkkgbGlrZSB0aGlzIG5hbWluZywgYnV0IERSTV9GT1JNQVRfUjggaXMgdWFwaSBh
bHJlYWR5LiA6LyBJZiBhbnl0aGluZywgDQp3ZSBjb3VsZCBhZGQgWW4gZm9ybWF0cyBpbiBh
ZGRpdGlvbiB0byBleGlzdGluZyBSbiBmb3JtYXRzLg0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJl
J3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0K
PiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUs
IEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpv
dXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRo
YXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZh
bGRzDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9w
ZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4g
NSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcp
DQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------RFHxz4jZDwnaz9HrrasPkvDS--

--------------kkmck2qcm4CR4C2hZrjhoXfZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmH5BpcFAwAAAAAACgkQlh/E3EQov+Bk
GQ//T1ahtrQidsFFYc8qj2Z41/7hEKgM/FKi2/2++8j/TQnA7uQZof4nRc8C5ugGLT8ICH5DP87J
voya1mlsEMvLp4YQq5BhFWh4JgON4R5z06HKD9k5jMHy4zBotqJ7c1SXOIQk1SzA8chlChPKbyuy
S4Nk2IH2nP8dPhOysAPiyA7tQMijJ+ZQI0UTwFcXUIxGArjAs0SxtewzrMlN8vRvH0ZITOwo3CkU
qEcOqdD2QcCGBn6amYLqFXBMu54L81HOJg5KqVh3xAUyHRTN+SLgXh3tGErYoavrhvceLHskC6yz
DPabj7sQ49VNFcNp9JrUxGWgg+ynRnE5sM7Ly6uUE2ITL48scmS2dMZRQHJUTKN5ZqBltxy6bPFV
rap9fi+uX8wVhmOtMoRsbW5woDjEZSd9YnrBmwFm+WmAnHr122xBcv3vn0tJ+Bst7qWPWhSKW4Wm
+VWSIFFJZs/Hi7ob4bmY9J6DVyuuIu4NJIjBrIJzWPvQSSRmAuknD3HjcjUS/fhqm0zrmZoKJpJV
6BXuXrvb2FzYicMemy2ukUTASxGTXysDHJNbEZ7Rdbsc8fO7Rspt3hoUgUUp8BqId9kRpKgfhp/V
osvxuMi1tIQcNitHw+BynitGtbEpduQgwlwz09r9QbcYQQkp4hsMBQXGa/aaDFh2dDcIVgEeEhir
l88=
=KK8i
-----END PGP SIGNATURE-----

--------------kkmck2qcm4CR4C2hZrjhoXfZ--

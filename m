Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 211C572DAF2
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 09:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36D310E342;
	Tue, 13 Jun 2023 07:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EEC10E342
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 07:31:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 721DE22623;
 Tue, 13 Jun 2023 07:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686641483; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8yklOUQliENxVhDaviA5tsO1+HEHxyZMuRKI8/yVe9M=;
 b=T1UnoGOArn7UdIqvXCOBfm+CzjaqmBCYKvGhr/djfyEKpoSKxQgPNhKk9ZVOyzGTkETAvP
 m8ZNHsPWrb8e0vemel14pWCZNnuKgb82ldo558GxgWvuFai0Mgts/ZG2oEYL4GB36w5+oR
 1kjhdQOXehf6/x/lvb0gK4gl61NVHk0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686641483;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8yklOUQliENxVhDaviA5tsO1+HEHxyZMuRKI8/yVe9M=;
 b=rtj1o5JTUo3Kjacbneg0Rlz+Civc6RWPT2N2OPRb+bdhcQfrGM8YULl3xwuWm5oG9PTl1g
 yCzn2iDPDJro1sAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1D67813345;
 Tue, 13 Jun 2023 07:31:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sOxHBksbiGSpFQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Jun 2023 07:31:23 +0000
Message-ID: <41e119bc-5a93-c91e-7451-aa48f829dc1a@suse.de>
Date: Tue, 13 Jun 2023 09:31:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 01/38] backlight/bd6107: Compare against struct
 fb_info.device
Content-Language: en-US
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "javierm@redhat.com"
 <javierm@redhat.com>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "deller@gmx.de" <deller@gmx.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "lee@kernel.org" <lee@kernel.org>,
 "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>
References: <20230612141352.29939-1-tzimmermann@suse.de>
 <20230612141352.29939-2-tzimmermann@suse.de>
 <IA1PR11MB641822AFCB0E0EA5856C7E59C154A@IA1PR11MB6418.namprd11.prod.outlook.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <IA1PR11MB641822AFCB0E0EA5856C7E59C154A@IA1PR11MB6418.namprd11.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pXSHUios00U5kRTo473gtCKr"
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------pXSHUios00U5kRTo473gtCKr
Content-Type: multipart/mixed; boundary="------------U2OCUX5bG0ubHrGWpdK9sORo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "javierm@redhat.com"
 <javierm@redhat.com>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "deller@gmx.de" <deller@gmx.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "lee@kernel.org" <lee@kernel.org>,
 "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Message-ID: <41e119bc-5a93-c91e-7451-aa48f829dc1a@suse.de>
Subject: Re: [PATCH v2 01/38] backlight/bd6107: Compare against struct
 fb_info.device
References: <20230612141352.29939-1-tzimmermann@suse.de>
 <20230612141352.29939-2-tzimmermann@suse.de>
 <IA1PR11MB641822AFCB0E0EA5856C7E59C154A@IA1PR11MB6418.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB641822AFCB0E0EA5856C7E59C154A@IA1PR11MB6418.namprd11.prod.outlook.com>

--------------U2OCUX5bG0ubHrGWpdK9sORo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMDYuMjMgdW0gMTc6MTcgc2NocmllYiBSdWhsLCBNaWNoYWVsIEo6DQpb
Li4uXQ0KPiANCj4gVGhvbWFzLA0KPiANCj4gTG9va2luZyBhdCB0aGUgZmIuaCBmaWxlIEkg
c2VlOg0KPiANCj4gCXN0cnVjdCBkZXZpY2UgKmRldmljZTsJCS8qIFRoaXMgaXMgdGhlIHBh
cmVudCAqLw0KPiAJc3RydWN0IGRldmljZSAqZGV2OwkJLyogVGhpcyBpcyB0aGlzIGZiIGRl
dmljZSAqLw0KPiANCj4gSXMgdGhpcyBkb2N1bWVudGF0aW9uICJjb3JyZWN0Ij8gIElmIHNv
LCBob3cgZG9lcyB0aGF0IG1hdGNoIHdoYXQgeW91IGFyZSBkb2luZyBoZXJlPw0KDQpUaGUg
Y29tbWVudHMgYXJlIGNvcnJlY3QuIExldCdzIGdvIHRocm91Z2ggd2hhdCdzIGhhcHBlbmlu
ZyBoZXJlLg0KDQpUaGUgZmllbGQgJ2RldmljZScgaXMgdGhlIExpbnV4IGRldmljZSAocGxh
dGZvcm1fZGV2aWNlLCBwY2lfZGV2LCBldGMuKSANCmFuZCAnZGV2JyBpcyB0aGUgZmJkZXYg
Y2hhcmFjdGVyIGRldmljZSB0aGF0IGlzIC9kZXYvZmIqLg0KDQpXZSBzZXQgJ2RldmljZScg
d2hlcmUgd2UgYWxsb2NhdGUgdGhlIGZiX2luZm8gaW4gZnJhbWVidWZmZXJfYWxsb2MoKQ0K
DQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4zL3NvdXJjZS9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L2NvcmUvZmJzeXNmcy5jI0w1Nw0KDQphbmQgd2Ugc2V0ICdkZXYnIHdo
ZW4gd2UgcmVnaXN0ZXIgdGhlIGNocmRldiB3aXRoaW4gcmVnaXN0ZXJfZnJhbWVidWZmZXIo
KS4NCg0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMy9zb3VyY2UvZHJp
dmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMjTDE1NTUNCg0KKEFuZCB0aGUgcG9pbnQg
b2YgdGhpcyBwYXRjaCBzZXJpZXMgaXMgdG8gbWFrZSB0aGUgY2hyZGV2IG9wdGlvbmFsLikN
Cg0KVGhlIHByb2JsZW0gd2l0aCBiZDYxMDcgaXMgdGhhdCBpcyBtaXNzZXMgdGhlIHBhcnQg
d2hlcmUgaXQgcmVnaXN0ZXJzIA0KdGhlIHBsYXRmb3JtIGRldmljZS4gVGhlIGRyaXZlciBh
cHBlYXJzIHRvIGJlIHVudXNlZC4NCg0KQnV0IGdwaW9fYmFja2xpZ2h0IGZyb20gcGF0Y2hl
cyAzIGFuZCA0IHdvcmtzLiBUaGUgYXJjaGl0ZWN0dXJlIGNvZGUgDQpzZXRzIHRoZSAnZmJk
ZXYnIGZpZWxkIGZyb20gYSBwbGF0Zm9ybS1kZXZpY2Ugc3RydWN0dXJlIGF0DQoNCmh0dHBz
Oi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjMvc291cmNlL2FyY2gvc2gvYm9hcmRz
L21hY2gtZWNvdmVjMjQvc2V0dXAuYyNMMzg5DQoNCmFuZCBsYXRlciBjcmVhdGVzIHRoZSBw
bGF0Zm9ybSBkZXZpY2UgYXMgcGFydCBvZg0KDQpodHRwczovL2VsaXhpci5ib290bGluLmNv
bS9saW51eC92Ni4zL3NvdXJjZS9hcmNoL3NoL2JvYXJkcy9tYWNoLWVjb3ZlYzI0L3NldHVw
LmMjTDE0ODMNCg0KSXQgd2lsbCBiZSB1c2VkIHdpdGggdGhlIHNoLW1vYmlsZSBmYmRldiBk
cml2ZXIgYW5kIGJlY29tZSB0aGUgJ2RldmljZScgDQpmaWVsZCB0aGVyZS4NCg0KSW4gdGhl
IGJhY2tsaWdodCBjb2RlLCB0aGUgZ3Bpb19iYWNrbGlnaHQgZHJpdmVyIGNvcGllcyB0aGUg
ZmJkZXYgZmllbGQgYXQNCg0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYu
My9zb3VyY2UvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvZ3Bpb19iYWNrbGlnaHQuYyNMNjIN
Cg0KdG8gbGF0ZXIgdXNlIGl0IGluY29ycmVjdGx5IGluIC5jaGVja19mYi4gSGVuY2UsIHRo
ZSBoZWxwZXIgaGFzIHRvIA0KY29tcGFyZSB0aGUgcGxhdGZvcm0gZGV2aWNlIHRvIHRoZSAn
ZGV2aWNlJyBmaWVsZCwgbm90IHRoZSAnZGV2JyBmaWVsZDsgDQp3aGljaCBpcyBiZWluZyBm
aXhlZCBieSB0aGlzIHBhdGNoc2V0Lg0KDQpUaGUgdHdvIG90aGVyIGRyaXZlcnMsIGJkNjEw
NyBhbmQgbHY1MjA3bHAsIGhhdmUgdGhlIHNhbWUgYnVnLg0KDQpCZXN0IHJlZ2FyZHMNClRo
b21hcw0KDQoNCj4gDQo+IFRoYW5rcywNCj4gDQo+IE0NCj4gDQo+PiB9DQo+Pg0KPj4gc3Rh
dGljIGNvbnN0IHN0cnVjdCBiYWNrbGlnaHRfb3BzIGJkNjEwN19iYWNrbGlnaHRfb3BzID0g
ew0KPj4gLS0NCj4+IDIuNDEuMA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0K
R0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4g
TW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------U2OCUX5bG0ubHrGWpdK9sORo--

--------------pXSHUios00U5kRTo473gtCKr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSIG0oFAwAAAAAACgkQlh/E3EQov+Bd
FBAAxy6YlDaU4D9ffnggcGz+xokLfeqLoxNxGVLvcP0g+HsxmRrwCg4Irwazg0GyNyjRKFVyJsw2
jjOQ9HsgSaTU/fxaRsv7D3A+oWwyMhTbYQicLBP1NE0vEjagiqgzWuRrv1omEY8tiol5Lpc+kLEo
VrXKRidqweyYGgjSlv1fMCw+dxZ2KX3pXbFZDJeYDQog69CzahjdE2j6kwC06GdCtgqMl7p088ut
cK7dwXnrtbC+WylRtW7SSkPW8y7hSKwKebOGpZBMP0sBfjB9aPq1tPoXh1cl9oW2pBFrirWkDyAf
hq5iBc0oEkgrR/DFOEYR7cM/dUyKht7077PN3BflK5T5f1G64lwc6/SUDklvnIjzwZ4QjE7vy6dG
qBb6Fm2Ya3hKTwv/5V3dH2WgsZ3Xp6yprCV4KRDRxf498sGqn17rFvwI17pZXta/2jtzlF7VHZHt
EEgin6kvDIgrfG4QqfUB69SsB+zRfXjMkPzBfntdPjyjdy8laZOqIqklEc46ZxmBP26wiPCVALG4
vqjxdyrIRbMrgg4LpBJ6wQx1SAJJx4KdMgdXFDTNagtvJgUqy9A2sN7j17Rq3mbekk847jm/XCcB
yObOT93fkjHi0SUJIsmTR+4azwE0c3TY4j4wFBuHUEMKv2RiEDW8lMwG7uXzSjLzbVb3wr7uB4AA
eCo=
=59Ha
-----END PGP SIGNATURE-----

--------------pXSHUios00U5kRTo473gtCKr--

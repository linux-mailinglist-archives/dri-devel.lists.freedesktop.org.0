Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9C64CAEB7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 20:30:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0427410E900;
	Wed,  2 Mar 2022 19:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405DD10E900
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 19:30:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 997FA1F37E;
 Wed,  2 Mar 2022 19:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646249441; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fcHoM6cQ9at4klEyIoq3bVgBwzGCr3APnq0fqr+Iq5c=;
 b=QCaSewL2i8uH7CA4Zq0V4kDTsEH5rdkyX9S7xMmnfijO75M1kTzv7zkJ8S+824K7E7M4ir
 LIaOniYciCLu+h293ZmKSM80ZVRxTMuQRgJO1RhEFtBpmi1iDvtKpTiPVEDPEg3inDoj30
 wlnGp0EkiUd7Aimcc6KXpjvhWUo4bQc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646249441;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fcHoM6cQ9at4klEyIoq3bVgBwzGCr3APnq0fqr+Iq5c=;
 b=ShPOk5CWFlLLIps+BEXzezAFkSzYpIyZaNtU9pfek0OG4fSfq5TDfW0k83T9QkAXkK6Ksz
 OqSLJYIVnx9533BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 64C4E13AA7;
 Wed,  2 Mar 2022 19:30:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PHOPF+HFH2KWcwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 02 Mar 2022 19:30:41 +0000
Message-ID: <64a99de0-3a22-af8a-fe77-4c19b5f56af3@suse.de>
Date: Wed, 2 Mar 2022 20:30:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 0/5] fbdev: Improve performance of fbdev console
Content-Language: en-US
To: daniel@ffwll.ch, deller@gmx.de, javierm@redhat.com, geert@linux-m68k.org, 
 sam@ravnborg.org, kraxel@redhat.com, ppaalanen@gmail.com
References: <20220223193804.18636-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220223193804.18636-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iYN3qqew3186UAYwbeo9FkBy"
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iYN3qqew3186UAYwbeo9FkBy
Content-Type: multipart/mixed; boundary="------------MRF06PG04iBGucZbDlbaVMDC";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, deller@gmx.de, javierm@redhat.com, geert@linux-m68k.org,
 sam@ravnborg.org, kraxel@redhat.com, ppaalanen@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <64a99de0-3a22-af8a-fe77-4c19b5f56af3@suse.de>
Subject: Re: [PATCH v3 0/5] fbdev: Improve performance of fbdev console
References: <20220223193804.18636-1-tzimmermann@suse.de>
In-Reply-To: <20220223193804.18636-1-tzimmermann@suse.de>

--------------MRF06PG04iBGucZbDlbaVMDC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCm1lcmdlZCB3aXRoIGZpeGVzIGZvciB0aGUgdHlwb2VzIGluIHRoZSBmaW5hbCBw
YXRjaC4gVGhhbmtzIGZvciByZXZpZXdpbmcuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoN
CkFtIDIzLjAyLjIyIHVtIDIwOjM3IHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+IE9w
dGltaXplIHBlcmZvcm1hbmNlIG9mIHRoZSBmYmRldiBjb25zb2xlIGZvciB0aGUgY29tbW9u
IGNhc2Ugb2YNCj4gc29mdHdhcmUtYmFzZWQgY2xlYXJpbmcgYW5kIGltYWdlIGJsaXR0aW5n
Lg0KPiANCj4gVGhlIGNvbW1pdCBkZXNjcmlwdG9uIG9mIGVhY2ggcGF0Y2ggY29udGFpbnMg
cmVzdWxzIG9zIGEgc2ltcGxlDQo+IG1pY3JvYmVuY2htYXJrLiBJIGFsc28gdGVzdGVkIHRo
ZSBmdWxsIHBhdGNoc2V0J3MgZWZmZWN0IG9uIHRoZQ0KPiBjb25zb2xlIG91dHB1dCBieSBw
cmludGluZyBkaXJlY3RvcnkgbGlzdGluZ3MgKGk3LTQ3OTAsIEZ1bGxIRCwNCj4gc2ltcGxl
ZHJtLCBrZXJuZWwgd2l0aCBkZWJ1Z2dpbmcpLg0KPiANCj4gICAgPiB0aW1lIGZpbmQgL3Vz
ci9zaGFyZS9kb2MgLXR5cGUgZg0KPiANCj4gSW4gdGhlIHVub3B0aW1pemVkIGNhc2U6DQo+
IA0KPiAgICByZWFsICAgIDBtNi4xNzNzDQo+ICAgIHVzZXIgICAgMG0wLjA0NHMNCj4gICAg
c3lzICAgICAwbTYuMTA3cw0KPiANCj4gV2l0aCBvcHRpbWl6YXRpb25zIGFwcGxpZWQ6DQo+
IA0KPiAgICByZWFsICAgIDBtNC43NTRzDQo+ICAgIHVzZXIgICAgMG0wLjA0NHMNCj4gICAg
c3lzICAgICAwbTQuNjk4cw0KPiANCj4gSW4gdGhlIG9wdGltaXplZCBjYXNlLCBwcmludGlu
ZyB0aGUgZGlyZWN0b3J5IGxpc3RpbmcgaXMgfjI1JSBmYXN0ZXINCj4gdGhhbiBiZWZvcmUu
DQo+IA0KPiBJbiB2MiBvZiB0aGUgcGF0Y2hzZXQsIGFmdGVyIGltcGxlbWVudGluZyBTYW0n
cyBzdWdnZXN0aW9uIHRvIHVwZGF0ZQ0KPiBjZmJfaW1hZ2VibGl0KCkgYXMgd2VsbCwgaXQg
dHVybnMgb3V0IHRoYXQgdGhlIGNvbXBpbGVkIGNvZGUgaW4NCj4gc3lzX2ltYWdlYmxpdCgp
IGlzIHN0aWxsIHNpZ25pZmljYW50bHkgc2xvd2VyIHRoYW4gdGhlIENGQiB2ZXJzaW9uLiBB
DQo+IGZpeCBpcyBwcm9iYWJseSBhIGxhcmdlciB0YXNrIGFuZCB3b3VsZCBpbmNsdWRlIGFy
Y2hpdGVjdHVyZS1zcGVjaWZpYw0KPiBjaGFuZ2VzLiBBIG5ldyBUT0RPIGl0ZW0gc3VnZ2Vz
dHMgdG8gaW52ZXN0aWdhdGUgdGhlIHBlcmZvcm1hbmNlIG9mIHRoZQ0KPiB2YXJpb3VzIGhl
bHBlcnMgYW5kIGZvcm1hdC1jb252ZXJzaW9uIGZ1bmN0aW9ucyBpbiBEUk0gYW5kIGZiZGV2
Lg0KPiANCj4gdjM6DQo+IAkqIGZpeCBkZXNjcmlwdGlvbiBvZiBjZmJfaW1hZ2VibGl0KCkg
cGF0Y2ggKFBla2thKQ0KPiB2MjoNCj4gCSogaW1wcm92ZSByZWFkYWJpbGl0eSBmb3Igc3lz
X2ltYWdlYmxpdCgpIChHZXJkLCBTYW0pDQo+IAkqIG5ldyBUT0RPIGl0ZW0gZm9yIGZ1cnRo
ZXIgb3B0aW1pemF0aW9uDQo+IA0KPiBUaG9tYXMgWmltbWVybWFubiAoNSk6DQo+ICAgIGZi
ZGV2OiBJbXByb3ZlIHBlcmZvcm1hbmNlIG9mIHN5c19maWxscmVjdCgpDQo+ICAgIGZiZGV2
OiBJbXByb3ZlIHBlcmZvcm1hbmNlIG9mIHN5c19pbWFnZWJsaXQoKQ0KPiAgICBmYmRldjog
UmVtb3ZlIHRyYWlsaW5nIHdoaXRlc3BhY2VzIGZyb20gY2ZiaW1nYmx0LmMNCj4gICAgZmJk
ZXY6IEltcHJvdmUgcGVyZm9ybWFuY2Ugb2YgY2ZiX2ltYWdlYmxpdCgpDQo+ICAgIGRybTog
QWRkIFRPRE8gaXRlbSBmb3Igb3B0aW1pemluZyBmb3JtYXQgaGVscGVycw0KPiANCj4gICBE
b2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCAgICAgICAgICAgICB8ICAyMiArKysrKw0KPiAg
IGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9jZmJpbWdibHQuYyAgIHwgMTA3ICsrKysrKysr
KysrKysrKystLS0tLS0tLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvc3lzZmls
bHJlY3QuYyB8ICAxNiArLS0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9jb3JlL3N5c2lt
Z2JsdC5jICAgfCAgNDkgKysrKysrKystLS0NCj4gICA0IGZpbGVzIGNoYW5nZWQsIDEzMyBp
bnNlcnRpb25zKCspLCA2MSBkZWxldGlvbnMoLSkNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1l
cm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJt
YW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZv
IFRvdGV2DQo=

--------------MRF06PG04iBGucZbDlbaVMDC--

--------------iYN3qqew3186UAYwbeo9FkBy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIfxeAFAwAAAAAACgkQlh/E3EQov+CN
MBAAqqvnn3Ja9uh9l4/JBHvhQm4BRK++FdFiXbUOK+po4kjwep47F9M1Wej85pIoUj0nexQpKsG9
0vVc/iIFJOVUgmR8v0i4kAkHLoFGff0T86Qi+BCksBk7+EyF5xNMbz5C0T4EE8E3XzH2T/ADyjjQ
3OnCGC5BTL862wP91waAI3ftU11GPx7ugu61OY9+sff3Chwo9OKefl4b3jxhOD5J5kjuVaY8Y+ej
uvMx49NYQSwmBp8tZbkWw0PF0rdUBznCIHgsJqL/kDTkXguwjs89YKOIJ0sZZSuX3JNKOKAz+gMB
+VUt39au+58Pn89p56LZ8h+NlcqHbjg/8ZlxpD5KKQKIZLYh7EOy882KU7W/526Nr5uu6CHHM3sy
aTkI6PO/OYzfGdrsNRIBUaPmmd5pz1iSQp5j0sl5bxFGKALRCxH/tZBNPx12C/UzukqjU7JRtXzr
CCkKke5J827R6M3j9GOhpeH0oHm1RxKzdNUlMC8HDfR9TwIPdK5871k0a6s+OOyb/DG50DjCjJVw
2lrZJXvUrrc0ZRehkMYFkA83W84NKlKsAd9278CWcGHqpG9aFqhKVGvrmbwY2A9cg0yqO//PdWya
iUxyyiFdp5v845KLVbrWGlFT2u0Vat/XQkU/ujQvu2ovZZ3Nhmb2u9wvFHc0UdEbpaEXk5MyV0PW
B70=
=KgK4
-----END PGP SIGNATURE-----

--------------iYN3qqew3186UAYwbeo9FkBy--

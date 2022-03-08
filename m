Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 294784D13F6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 10:56:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5708F10EBFE;
	Tue,  8 Mar 2022 09:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC3F10EBFE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 09:56:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F1F471F396;
 Tue,  8 Mar 2022 09:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646733362; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YZM7WvuFCFUjg+iIIoJea5ZxIUUqEBufqM00M5jrvn8=;
 b=MP1goStnAygktWz5XVGzn+Hy0EZ+8PFw45jqoQB79FvEEVIzGApLtXr9e3dG9Y5Nmpn9fa
 JEx7Qvk7RTTTYvv7meXriFXrFaYHzcRNB2PjW3NO45U5qKncVL1qTrcJJdIoiwCJgee9xZ
 ylXPoT3iSaKGasy9PZgtZ9MAIZ/SpLk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646733363;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YZM7WvuFCFUjg+iIIoJea5ZxIUUqEBufqM00M5jrvn8=;
 b=miAbc9sdH0XXawMRt25+/7eM7+qSJJznI+drInXOG3XjkwMz1xJt2y0sMWPar0cZxtdEii
 U7IAlQusWWWqUVBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C0D7313C24;
 Tue,  8 Mar 2022 09:56:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FhMELjIoJ2L1NgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Mar 2022 09:56:02 +0000
Message-ID: <80342fbf-5aee-5769-b439-3e147c44711f@suse.de>
Date: Tue, 8 Mar 2022 10:56:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 1/9] drm/simpledrm: Use fbdev defaults for shadow buffering
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 deller@gmx.de
References: <20220303205839.28484-1-tzimmermann@suse.de>
 <20220303205839.28484-2-tzimmermann@suse.de>
 <a9e7aa2c-9954-94ee-6f7c-0d6822342897@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <a9e7aa2c-9954-94ee-6f7c-0d6822342897@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PuJcK9cmobXnl3tHprlqJAjO"
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
--------------PuJcK9cmobXnl3tHprlqJAjO
Content-Type: multipart/mixed; boundary="------------yGuJiLuY84QuJ9GIIJS8mrhg";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <80342fbf-5aee-5769-b439-3e147c44711f@suse.de>
Subject: Re: [PATCH 1/9] drm/simpledrm: Use fbdev defaults for shadow
 buffering
References: <20220303205839.28484-1-tzimmermann@suse.de>
 <20220303205839.28484-2-tzimmermann@suse.de>
 <a9e7aa2c-9954-94ee-6f7c-0d6822342897@redhat.com>
In-Reply-To: <a9e7aa2c-9954-94ee-6f7c-0d6822342897@redhat.com>

--------------yGuJiLuY84QuJ9GIIJS8mrhg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMDMuMjIgdW0gMTA6MzEgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDMvMy8yMiAyMTo1OCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+
PiBEb24ndCBzZWxlY3Qgc2hhZG93IGJ1ZmZlcmluZyBmb3IgdGhlIGZiZGV2IGNvbnNvbGUg
ZXhwbGljaXRseS4gVGhlDQo+PiBmYmRldiBlbXVsYXRpb24ncyBoZXVyaXN0aWMgd2lsbCBl
bmFibGUgaXQgZm9yIGFueSBmcmFtZWJ1ZmZlciB3aXRoDQo+PiAuZGlydHkgY2FsbGJhY2su
DQo+Pg0KPiANCj4gSW5kZWVkIGl0IGRvZXMuIE5vdCByZWxhdGVkIHRvIHlvdXIgc2VyaWVz
IGJ1dCBsb29raW5nIGF0IHRoaXMNCj4gcGF0Y2ggSSBub3RpY2VkIHRoYXQgZHJpdmVycy9n
cHUvZHJtL3RpbnkvYm9jaHMuYyB3aWxsIGJlIHRoZQ0KPiBvbmx5IGRyaXZlciB0aGF0IHNl
dHMgLnByZWZlcl9zaGFkb3dfZmJkZXYgYWZ0ZXIgdGhpcyBsYW5kcy4NCj4gDQo+IFRoZSBk
cml2ZXIgaXMgdXNpbmcgR0VNIHNvIEkgd29uZGVyIGlmIGFmdGVyIHlvdXIgc2VyaWVzIHRo
aXMNCj4gRFJNIGRyaXZlciBjb3VsZCBoYXZlIGEgLmRpcnR5IGNhbGxiYWNrIGFuZCB0aGUg
ZmllbGQganVzdCBiZQ0KPiBkcm9wcGVkPyBPciB0aGVyZSB3b3VsZCBzdGlsbCBiZSBhIGNh
c2Ugd2hlcmUgaXQgaXMgbmVlZGVkID8NCkJvY2hzIHVzZXMgVlJBTSBoZWxwZXJzIChpLmUu
LCBUVE0pLiBGYmRldiBhbmQgdXNlcnNwYWNlIHdvdWxkIGRpcmVjdGx5IA0Kd3JpdGUgaW50
byB0aGF0IGJ1ZmZlciBtZW1vcnkgd2l0aG91dCBhIGNvcHkuIFNvIHRoZSBkaXJ0eSBmdW5j
dGlvbiANCndvdWxkIGJlIGVtcHR5Lg0KDQpPdGhlciBkcml2ZXJzIHdpdGggVlJBTSBoZWxw
ZXJzIChlLmcuLCBoaWJtYywgYXN0KSBvcGVyYXRlIG9uIHVuY2FjaGVkIA0KSS9PIG1lbW9y
eSBBRkFJQ1QuIFNvIHRoZXkgc2V0IC5wcmVmZXJfc2hhZG93LCB3aGljaCBhbHNvIGFmZmVj
dHMgDQp1c2Vyc3BhY2UuIEJvY2hzIHVzZXMgY2FjaGVkIG1lbW9yeSBhbmQgc2hvdWxkbid0
IG5lZWQgcHJlZmVyX3NoYWRvdy4gDQpTZXR0aW5nIHByZWZlcl9zaGFkb3dfZmJkZXYgaXMg
b25seSB0aGVyZSBmb3IgbWFraW5nIHRoZSBmYmRldiBidWZmZXIgDQpvYmplY3QgZXZpY3Rh
YmxlIGZyb20gdmlkZW8gbWVtb3J5Lg0KDQpBcyBpdCBzdGFuZHMsIHVzaW5nIHByZWZlcl9z
aGFkb3dfZmJkZXYgaXMgdGhlIGNsZWFuZXN0IHNvbHV0aW9uLCBldmVuIA0KaWYgYm9jaHMg
aXMgdGhlIG9ubHkgdXNlciBvZiB0aGF0IGZpZWxkLg0KDQpBbHRlcm5hdGl2ZWx5LCB3ZSBj
b3VsZCBtYWtlIGl0IGEgcmVxdWlyZW1lbnQgdGhhdCBxZW11IHByb3ZpZGVzIGVub3VnaCAN
CnZpZGVvIG1lbW9yeSBmb3IgYm9jaHMgdG8gdW5jb25kaXRpb25hbGx5IHBpbiB0aGUgZmJk
ZXYgQk8gdGhlcmUgd2l0aG91dCANCmV2ZXIgZXZpY3RpbmcuIEkgZ3Vlc3MsIHRoYXQgd291
bGQgbWVhbiAzMiBNaUIgb2YgVlJBTSBhdCBsZWFzdC4NCg0KQmVzdCByZWdhcmRzDQpUaG9t
YXMNCg0KPiANCj4gQW55d2F5LCBqdXN0IHdhbnRlZCB0byBtZW50aW9uIGluIGNhc2UgSSBm
b3JnZXQgbGF0ZXIuDQo+IA0KPiBZb3VyIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUgYW5kIEkg
dGhpbmsgaXQgY291bGQgYmUgcHVzaGVkDQo+IHdpdGhvdXQgd2FpdGluZyBmb3IgdGhlIG90
aGVyIHBhdGNoZXMgaW4gdGhlIHNlcmllcy4NCj4gDQo+IFJldmlld2VkLWJ5OiBKYXZpZXIg
TWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4gDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8
aHJlcjogSXZvIFRvdGV2DQo=

--------------yGuJiLuY84QuJ9GIIJS8mrhg--

--------------PuJcK9cmobXnl3tHprlqJAjO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmInKDIFAwAAAAAACgkQlh/E3EQov+Bw
ixAAwUUW7+533llbTNYN3tvRju3W2omlEY2QQ+ul4QGrPKQLLQJcy1INsVhzIELmkA+MWwkg0JG+
JibY6FYSbU8V5JzCisP+Wr6OWX2Z402m/euAUPt1/qvOULRo15WasqEIRvCFAQmhkTI6ALpS79GF
P4G2lqaW72XW+1k8SSLpPBo5HavRSqM4ccHkDtYKUHFJrNO7tQ8i25E6YEDjltx1UY0pyZjl8CNy
layoJbq4aKmxhzS34p+tV/UqTTVz6CcKcuua2jTwMXclwLhp8/Jq0+8nFIeIC5TXU35fixiIQMlX
e+npDSmoV/Btv3U90wD+MU03hQ2igjSX6ahbUcTj/pvLc92bCAeFMjqyMMKxYbt9IXoBuI9D8nVC
fTysTWr7gjKis1ZkqUa8Lzb6mj8sYhiSKZLIPDUJQkTjiuZZzHv/7Q/CG8WCcOo3dTxWveoRGn0/
wqPXVS5wyetJb7gLJ4UpTWijTzaFALRlCwlzWoWy3oAb/Q39/vACpXwIbdyZrwpDff740kWZn4Di
7KHRhKjs81drP9O9oLaBkiVaBs7SuYpIMkugWE4p1jFirD9QRwNVkpWyxJ2bYDNkJrzywexrfl/a
F9ymTVZpnJz1tfXIfauGERtWZ01GmLD5/VA3cgKosWIKYR2Ekb0zx8qd+J3zP8AoxbbBKv+/HEeV
L8g=
=9I8z
-----END PGP SIGNATURE-----

--------------PuJcK9cmobXnl3tHprlqJAjO--

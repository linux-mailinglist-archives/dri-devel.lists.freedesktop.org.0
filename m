Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C028642541
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 10:00:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F5310E13F;
	Mon,  5 Dec 2022 09:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B23D10E13F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 09:00:22 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 590B51FE42;
 Mon,  5 Dec 2022 09:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670230821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9mE8JW+82N0Nc8L3Y+5ne8li6B8o4ESVFkptCM1+tJk=;
 b=SZFUgZbgw8ddwqWWKYIj9UFJMxD9Gq4WowkNcxDCOVM/JfdBshKd6K/FYtOAjsWpZgiodX
 EM2WPlKMy/OJuKmocTNrc4W3Jp1ZxjE3nzU7jAWCISkIzOUGY/dhzz4pikBefUDb3IzAdy
 62gI1ZinTDsLcN/v9zpy0NMlK4113nw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670230821;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9mE8JW+82N0Nc8L3Y+5ne8li6B8o4ESVFkptCM1+tJk=;
 b=/kn5HI/a/+Y44g8QBwSSSltAw1g/q6vRDfCUCItQMAJb1m9qP4RMBc6PPBAmeUp5RqSVE5
 hWM1+9yCFCHsHvCA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 1983813326;
 Mon,  5 Dec 2022 09:00:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id AHbpBCWzjWO4UgAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Dec 2022 09:00:21 +0000
Message-ID: <1e4d62cf-8893-0bff-51f5-5a2e419ed5a0@suse.de>
Date: Mon, 5 Dec 2022 10:00:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/2] vfio/pci: Remove console drivers
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>, "mb@lab.how" <mb@lab.how>
References: <CAEdEoBYXHq9cCzsbMYTpG1B41Yz=-QAjFx7bJDOnPanN5Tmo7A@mail.gmail.com>
 <20221204175142.658d5c37.alex.williamson@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221204175142.658d5c37.alex.williamson@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1xuPk2XMwFJoYTbm2jYGXdQJ"
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
Cc: kvm@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, lersek@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1xuPk2XMwFJoYTbm2jYGXdQJ
Content-Type: multipart/mixed; boundary="------------8hWQJUaJQcB4rdEGAVAwfJxL";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Alex Williamson <alex.williamson@redhat.com>, "mb@lab.how" <mb@lab.how>
Cc: kvm@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, lersek@redhat.com
Message-ID: <1e4d62cf-8893-0bff-51f5-5a2e419ed5a0@suse.de>
Subject: Re: [PATCH 2/2] vfio/pci: Remove console drivers
References: <CAEdEoBYXHq9cCzsbMYTpG1B41Yz=-QAjFx7bJDOnPanN5Tmo7A@mail.gmail.com>
 <20221204175142.658d5c37.alex.williamson@redhat.com>
In-Reply-To: <20221204175142.658d5c37.alex.williamson@redhat.com>

--------------8hWQJUaJQcB4rdEGAVAwfJxL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMTIuMjIgdW0gMDE6NTEgc2NocmllYiBBbGV4IFdpbGxpYW1zb246DQo+
IE9uIFNhdCwgMyBEZWMgMjAyMiAxNzoxMjozOCAtMDcwMA0KPiAibWJAbGFiLmhvdyIgPG1i
QGxhYi5ob3c+IHdyb3RlOg0KPiANCj4+IEhpLA0KPj4NCj4+IEkgaG9wZSBpdCBpcyBvayB0
byByZXBseSB0byB0aGlzIG9sZCB0aHJlYWQuDQo+IA0KPiBJdCBpcywgYnV0IHRoZSBvbmx5
IHJlbGljIG9mIHRoZSB0aHJlYWQgaXMgdGhlIHN1YmplY3QuICBGb3IgcmVmZXJlbmNlLA0K
PiB0aGUgbGF0ZXN0IHZlcnNpb24gb2YgdGhpcyBwb3N0ZWQgaXMgaGVyZToNCj4gDQo+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMDYyMjE0MDEzNC4xMjc2My00LXR6aW1t
ZXJtYW5uQHN1c2UuZGUvDQo+IA0KPiBXaGljaCBpcyBjb21taXR0ZWQgYXM6DQo+IA0KPiBk
MTczNzgwNjIwNzkgKCJ2ZmlvL3BjaTogUmVtb3ZlIGNvbnNvbGUgZHJpdmVycyIpDQo+IA0K
Pj4gVW5mb3J0dW5hdGVseSwgSSBmb3VuZCBhDQo+PiBwcm9ibGVtIG9ubHkgbm93IGFmdGVy
IHVwZ3JhZGluZyB0byA2LjAuDQo+Pg0KPj4gTXkgc2V0dXAgaGFzIG11bHRpcGxlIEdQVXMg
KDIpLCBhbmQgSSBkZXBlbmQgb24gRUZJRkIgdG8gaGF2ZSBhIHdvcmtpbmcgY29uc29sZS4N
Cg0KV2hpY2ggR1BVcyBkbyB5b3UgaGF2ZT8NCg0KPj4gcHJlLXBhdGNoIGJlaGF2aW9yLCB3
aGVuIEkgYmluZCB0aGUgdmZpby1wY2kgdG8gbXkgc2Vjb25kYXJ5IEdQVSBib3RoDQo+PiB0
aGUgcGFzc3Rocm91Z2ggYW5kIHRoZSBFRklGQiBrZWVwIHdvcmtpbmcgZmluZS4NCj4+IHBv
c3QtcGF0Y2ggYmVoYXZpb3IsIHdoZW4gSSBiaW5kIHRoZSB2ZmlvLXBjaSB0byB0aGUgc2Vj
b25kYXJ5IEdQVSwNCj4+IHRoZSBFRklGQiBkaXNhcHBlYXJzIGZyb20gdGhlIHN5c3RlbSwg
YmluZGluZyB0aGUgY29uc29sZSB0byB0aGUNCj4+ICJkdW1teSBjb25zb2xlIi4NCg0KVGhl
IGVmaWZiIHdvdWxkIGxpa2VseSB1c2UgdGhlIGZpcnN0IEdQVS4gQW5kIHZmaW8tcGNpIHNo
b3VsZCBvbmx5IA0KcmVtb3ZlIHRoZSBnZW5lcmljIGRyaXZlciBmcm9tIHRoZSBzZWNvbmQg
ZGV2aWNlLiBBcmUgeW91IHN1cmUgdGhhdCANCnlvdSdyZSBub3Qgc29tZWhvdyB1c2luZyB0
aGUgZmlyc3QgR1BVIHdpdGggdmZpby1wY2kuDQoNCj4+IFdoZW5ldmVyIHlvdSB0cnkgdG8g
YWNjZXNzIHRoZSB0ZXJtaW5hbCwgeW91IGhhdmUgdGhlIHNjcmVlbiBzdHVjayBpbg0KPj4g
d2hhdGV2ZXIgd2FzIHRoZSBsYXN0IGJ1ZmZlciBjb250ZW50LCB3aGljaCBnaXZlcyB0aGUg
aW1wcmVzc2lvbiBvZg0KPj4gImZyZWV6aW5nLCIgYnV0IEkgY2FuIHN0aWxsIHR5cGUuDQo+
PiBFdmVyeXRoaW5nIGVsc2Ugd29ya3MsIGluY2x1ZGluZyB0aGUgcGFzc3Rocm91Z2guDQo+
IA0KPiBUaGlzIHNvdW5kcyBsaWtlIHRoZSBjYWxsIHRvIGFwZXJ0dXJlX3JlbW92ZV9jb25m
bGljdGluZ19wY2lfZGV2aWNlcygpDQo+IGlzIHJlbW92aW5nIHRoZSBjb25mbGljdGluZyBk
cml2ZXIgaXRzZWxmIHJhdGhlciB0aGFuIHJlbW92aW5nIHRoZQ0KPiBkZXZpY2UgZnJvbSB0
aGUgZHJpdmVyLiAgSXMgaXQgbm90IHBvc3NpYmxlIHRvIHVuYmluZCB0aGUgR1BVIGZyb20N
Cj4gZWZpZmIgYmVmb3JlIGJpbmRpbmcgdGhlIEdQVSB0byB2ZmlvLXBjaSB0byBlZmZlY3Rp
dmVseSBudWxsaWZ5IHRoZQ0KPiBhZGRlZCBjYWxsPw0KPiAgIA0KPj4gSSBjYW4gb25seSB0
aGluayBhYm91dCBhIGZldyBvcHRpb25zOg0KPj4NCj4+IC0gSXMgdGhlcmUgYSB3YXkgdG8g
aGF2ZSBFRklGQiBzaG93IHVwIGFnYWluPyBBZnRlciBhbGwgaXQgbG9va3MgbGlrZQ0KPj4g
dGhlIGtlcm5lbCBoYXMganVzdCBhYmFuZG9uZWQgaXQsIGJ1dCB0aGUgYnVmZmVyIGlzIHN0
aWxsIHRoZXJlLiBJDQo+PiBjYW4ndCBmaW5kIGEgc2luZ2xlIG1lc3NhZ2UgYWJvdXQgdGhl
IHNlY29uZGFyeSBjYXJkIGFuZCBFRklGQiBpbg0KPj4gZG1lc2csIGJ1dCB0aGVyZSdzIGEg
bWVzc2FnZSBmb3IgdGhlIHByaW1hcnkgY2FyZCBhbmQgRUZJRkIuDQo+PiAtIENhbiB3ZSBo
YXZlIGEgYm9vbGVhbiBjb250cm9sbGluZyB0aGUgYmVoYXZpb3Igb2YgdmZpby1wY2kNCj4+
IGFsdG9nZXRoZXIgb3IgYXQgbGVhc3QgY29udHJvbGxpbmcgdGhlIGJlaGF2aW9yIG9mIHZm
aW8tcGNpIGZvciB0aGF0DQo+PiBzcGVjaWZpYyBJRD8gSSBrbm93IHRoZXJlJ3MgYWxyZWFk
eSBzb21lIG9wdGlvbiBmb3IgdmZpby1wY2kgYW5kIFZHQQ0KPj4gY2FyZHMsIHdvdWxkIGl0
IGJlIGFwcHJvcHJpYXRlIHRvIGF0dGFjaCB0aGlzIGJlaGF2aW9yIHRvIHRoYXQgb3B0aW9u
Pw0KPiANCj4gSSBzdXBwb3NlIHdlIGNvdWxkIGhhdmUgYW4gb3B0LW91dCBtb2R1bGUgb3B0
aW9uIG9uIHZmaW8tcGNpIHRvIHNraXANCj4gdGhlIGFib3ZlIGNhbGwsIGJ1dCBjbGVhcmx5
IGl0IHdvdWxkIGJlIGJldHRlciBpZiB0aGluZ3Mgd29ya2VkIGJ5DQo+IGRlZmF1bHQuICBX
ZSBjYW5ub3QgbWFrZSBmdWxsIHVzZSBvZiBHUFVzIHdpdGggdmZpby1wY2kgaWYgdGhleSdy
ZQ0KPiBzdGlsbCBpbiB1c2UgYnkgaG9zdCBjb25zb2xlIGRyaXZlcnMuICBUaGUgaW50ZW50
aW9uIHdhcyBjZXJ0YWlubHkgdG8NCj4gdW5iaW5kIHRoZSBkZXZpY2UgZnJvbSBhbnkgbG93
IGxldmVsIGRyaXZlcnMgcmF0aGVyIHRoYW4gZGlzYWJsZSB1c2Ugb2YNCj4gYSBjb25zb2xl
IGRyaXZlciBlbnRpcmVseS4gIERSTS9HUFUgZm9sa3MsIGlzIHRoYXQgcG9zc2libHkgYW4N
Cj4gaW50ZXJmYWNlIHdlIGNvdWxkIGltcGxlbWVudD8gIFRoYW5rcywNCg0KV2hlbiB2Zmlv
LXBjaSBnaXZlcyB0aGUgR1BVIGRldmljZSB0byB0aGUgZ3Vlc3QsIHdoaWNoIGRyaXZlciBk
cml2ZXIgaXMgDQpib3VuZCB0byBpdD8NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAN
Cj4gQWxleA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhm
ZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7D
vHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------8hWQJUaJQcB4rdEGAVAwfJxL--

--------------1xuPk2XMwFJoYTbm2jYGXdQJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmONsyQFAwAAAAAACgkQlh/E3EQov+Dj
pg//a0JvZ00shXVwnKjlTJ95+HaaY3O7oW9BsTsyGZOvVcG1zlSES2XBMkMV0MTpM/C69KnWXld6
WNcntoouweVEbZj3XCfSCA+FPWPavl7x3gFRG3hL7LiiWQQqc26g6v43aO+9XOXMN3jYpmhZYXlB
bwBBoZhlPSmWFzZAJArbPaHw3XiC8TErNyxsaTs8J4sM9D6maLbvodvomWJlQ/HCWPAshSTRMrRP
/IkSjNWtPv0L60L+VqVqSqZ6IhIexdcbx27UtcdmnxwM3tsVfIw6hcSDUKzT949Rpw756ye+C/zz
YRdRxKislvhn/fh8rVvpjabI3uUFcuPOBH5+Mm8Qi+uLJZbbtblL2W5+L5r8dT0ikznenrprfaoj
hU5OcUxOcBQ4n8Y/1gQ8/k6nNDLKOi4InseZTL/gaw5F1eACd/gJGii7lpNQcDdiy2GmVcrJJ+7I
tWW1nrxV6pMYCjvXYR4VsmosMUoy1Qzd+1Sdu494Pni66R5AMcxdvDx/STh15Xk6HELrXTgqVrPt
3xhebo2OXJjy9eW/mXJx8eYyTWk6R3kYlLFvkCbTpwalOJQegZxUWDP52IhGqX0RVCFSdik70ixe
Ba+gN00EfQPKMTDInXvufbxCJ2UNq2HGovB69UNK6QzyN/8e/a2qhbsY4/U/ov+3ZCdPX5FOYHp4
2sk=
=nMjh
-----END PGP SIGNATURE-----

--------------1xuPk2XMwFJoYTbm2jYGXdQJ--

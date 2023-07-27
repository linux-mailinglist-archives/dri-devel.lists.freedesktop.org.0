Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 781A97657F8
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 17:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8494010E5AE;
	Thu, 27 Jul 2023 15:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D45810E5B5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 15:44:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ED0981F383;
 Thu, 27 Jul 2023 15:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690472690; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BW9VCSWYe0kzefVZfPpHCH+whMuoRpycTt/KTnqnMTQ=;
 b=Y9VDVe62Njlao/NN6IV4wgKd10JMiuIfcf9h7WID6/+nD3P4ZQ/kU7rmMGBNPxapb33a8w
 GLY97wzuJ8h8thPFxSKuSKlez4O2sCXbC+tkEMHEO5pDLFXJOEEZLwM14ZyY/cQ9kRbvrQ
 5X3yElPCzT+4n0Ou0eHjHPBT9DT3HCI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690472690;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BW9VCSWYe0kzefVZfPpHCH+whMuoRpycTt/KTnqnMTQ=;
 b=R3szNIKbaWdaWYve/+HaBwhL3g3ZIEYSxmkaJnXMjJ3hK3KJtClpGGWapj8ABUn26vRH3X
 6nhS8oBcPngZb+DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC05413902;
 Thu, 27 Jul 2023 15:44:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8jDEMPKQwmRoNgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Jul 2023 15:44:50 +0000
Message-ID: <576a5cce-a750-9ea4-c26c-eeb5e0bcddf3@suse.de>
Date: Thu, 27 Jul 2023 17:44:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/ssd130x: Use shadow-buffer helpers when managing
 plane's state
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20230727140453.577445-1-javierm@redhat.com>
 <0ce32153-cfc0-e701-3863-803fcdb897ff@suse.de>
 <87y1j1tme2.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87y1j1tme2.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LgpdNzZn2QYeB0Jmbzy0nGiB"
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
Cc: Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LgpdNzZn2QYeB0Jmbzy0nGiB
Content-Type: multipart/mixed; boundary="------------Vdk1ncLGjBp573q9e4vJcOUc";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Message-ID: <576a5cce-a750-9ea4-c26c-eeb5e0bcddf3@suse.de>
Subject: Re: [PATCH] drm/ssd130x: Use shadow-buffer helpers when managing
 plane's state
References: <20230727140453.577445-1-javierm@redhat.com>
 <0ce32153-cfc0-e701-3863-803fcdb897ff@suse.de>
 <87y1j1tme2.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87y1j1tme2.fsf@minerva.mail-host-address-is-not-set>

--------------Vdk1ncLGjBp573q9e4vJcOUc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI3LjA3LjIzIHVtIDE3OjE2IHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmls
bGFzOg0KPiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JpdGVz
Og0KPiANCj4gSGVsbG8gVGhvbWFzLA0KPiANCj4+IEhpIEphdmllcg0KPj4NCj4+IEFtIDI3
LjA3LjIzIHVtIDE2OjA0IHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzOg0KPj4+
IFRoZSBjb21taXQgNDViNTg2NjllNTMyICgiZHJtL3NzZDEzMHg6IEFsbG9jYXRlIGJ1ZmZl
ciBpbiB0aGUgcGxhbmUncw0KPj4+IC5hdG9taWNfY2hlY2soKSBjYWxsYmFjayIpIG1vdmVk
IHRoZSBidWZmZXJzIGFsbG9jYXRpb24gdG8gYmUgZG9uZSBpbg0KPj4+IHRoZSBwcmltYXJ5
IHBsYW5lJ3MgLmF0b21pY19jaGVjaygpIGNhbGxiYWNrLg0KPj4+DQo+Pj4gQnV0IGl0IG1p
c3NlZCB0aGF0IHNpbmNlIHRoZSBkcml2ZXIgdXNlcyBhIHNoYWRvdy1idWZmZXJlZCBwbGFu
ZSwgdGhlDQo+Pj4gX19kcm1fZ2VtX3tyZXNldCxkdXBsaWNhdGUsZGVzdHJveX1fc2hhZG93
X3BsYW5lKCkgaGVscGVyIGZ1bmN0aW9ucw0KPj4+IG11c3QgYmUgdXNlZCBpbiB0aGUgc3Ry
dWN0IGRybV9wbGFuZV9mdW5jcyBoYW5kbGVycy4NCj4+Pg0KPj4+IFRoaXMgd2FzIG1pc3Nl
ZCBiZWNhdXNlIHRoZSBtZW50aW9uZWQgY29tbWl0IGRpZCBub3QgcmVtb3ZlIHRoZSBtYWNy
bw0KPj4+IERSTV9HRU1fU0hBRE9XX1BMQU5FX0ZVTkNTLCB3aGljaCBsZWFkcyB0byB0aGUg
Y3VzdG9tIHBsYW5lJ3MgYXRvbWljDQo+Pj4gc3RhdGUgbWFuYWdlbWVudCBoYW5kbGVycyB0
byBub3QgYmUgdXNlZC4NCj4+Pg0KPj4+IEZpeGVzOiA0NWI1ODY2OWU1MzIgKCJkcm0vc3Nk
MTMweDogQWxsb2NhdGUgYnVmZmVyIGluIHRoZSBwbGFuZSdzIC5hdG9taWNfY2hlY2soKSBj
YWxsYmFjayIpDQo+Pj4gUmVwb3J0ZWQtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+DQo+Pg0KPj4gUmVwb3J0ZWQtYnkgbmVlZHMgdG8gYmUgZm9sbG93ZWQgYnkNCj4+DQo+
PiBDbG9zZXM6IDx1cmw+DQo+Pg0KPj4gd2hlcmUgPHVybD4gd291bGQgcG9pbnQgdG8gQXJu
ZCdzIGJ1ZyByZXBvcnQgb24gZHJpLWRldmVsLg0KPj4NCj4gDQo+IEFoLCBJIHRob3VnaHQg
Y2hlY2twYXRjaCBjb21wbGFpbmluZyBhYm91dCBpdCBidXQgc2luY2Ugd2UgYWxyZWFkeSBh
ZGQgYQ0KPiBMaW5rOiB3aXRoIGRpbSwgZGlkbid0IGtub3cgd2hhdCB0byBhZGQgdGhlcmUu
IE1ha2VzIHNlbnNlIHRvIGFkZCBBcm5kJ3MNCj4gcmVwb3J0IGluZGVlZC4NCj4gDQo+IEkg
Y2FuIGluY2x1ZGUgaXQgd2hlbiBhcHBseWluZyBpbnN0ZWFkIG9mIHBvc3RpbmcgYSB2MiBp
ZiB5b3UgZG9uJ3QgbWluZC4NCg0KU3VyZSBOUA0KDQo+IA0KPj4+IFN1Z2dlc3RlZC1ieTog
VGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+Pj4gU2lnbmVkLW9m
Zi1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQo+
Pg0KPj4gVGhpcyBsb29rcyBjb3JyZWN0IG5vdy4gVGhhbmtzIGZvciBmaXhpbmcgdGhpcyBi
dWcgcXVpY2tseS4gV2l0aCB0aGUNCj4+IENsb3NlIGFkZGVkOg0KPj4NCj4+IFJldmlld2Vk
LWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+DQo+IA0K
PiBUaGFua3MgYW5kIHRvIHlvdSBmb3IgcG9pbnRpbmcgdGhhdCBvdXQuDQo+IA0KDQotLSAN
ClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNv
ZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0
NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFu
ZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVy
ZykNCg==

--------------Vdk1ncLGjBp573q9e4vJcOUc--

--------------LgpdNzZn2QYeB0Jmbzy0nGiB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTCkPIFAwAAAAAACgkQlh/E3EQov+Aj
OBAArnQkARpMnKowQXBo1eNFQNavzQj4RaLduwdGKrPZxuKLad1dGRe1tP+SaxywuuXVkfYdfaCu
Frewnf7CO6p4PvQLFm9nuuv5lCxdF4CmjOVcmHwPR1AEIpZz6tqjdmErot2/6aU3oycQAsjAgavD
3R8HbmQ47S0Xkxfmd3hcg4SkKUcOrZqlV5kum8bJxr+BFY82Vb5synobdvFTThpYOqrOTyf+tVn+
eK5NcvhsqKt6+DsAoWyf3AhQGk/gUw3a9umFhiidQ56eYokOzRTnzb4Bn7PbbiYHoReleJpBPo1V
55HOVm69U8/ap1qOfQRCviD/pUT/zI4VTBRRgbAfc01wZ8X5iMNyHFvPVkYLmtVKo7/Noig+mMoH
ggL2jAKocgtpPe9c7oBukqH5bC4yLOqTOnxlZB8mZVCVbapjPSbqp7nEDU8ZemLvbyJ8Ed0AXkVb
bz9UWDdqbB0gwZ6oA8KKJVgLCS7l7GBXx51UTYcBq3bAe1d7GzD3BF0UofJv++rnZk3g4zxEEJ1y
kV02ml5YWAB1sD36BfS5zzLcRvEf4ZRLn/IrRtZI/Jl8JF9HObuQcBMLENuVLkoNioOfR51+oFw4
TXNfDuzyvXCjM8+CtJDv+Gf2JJIdhJZRLBh60pTacL0ZFAywMDB3Y188LJxHFbx5D7ncS3GTX3rN
3bY=
=WmCJ
-----END PGP SIGNATURE-----

--------------LgpdNzZn2QYeB0Jmbzy0nGiB--

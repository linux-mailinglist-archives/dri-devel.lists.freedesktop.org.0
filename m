Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA927919F0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 16:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645C110E373;
	Mon,  4 Sep 2023 14:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C4510E373
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 14:45:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 557B221847;
 Mon,  4 Sep 2023 14:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693838724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zwOfbAWdwcxiVEZLogxCvwETbAleNSV4ENBibaw75QE=;
 b=2WCs7309i+x/BqUyDQuQAroHGHyJvPJGW5nh7hDDnsYcacC/+DEOxazTb/8S3XJpyVToc1
 oxYCSk1LqEsg5aZtCrxHlbw8QrkASQQDz+9dvRbgxvZeptmtmRdZHubvx2cC8sQfjb5ghO
 WmTqAn+SwPRhEA4ssqK8mYS4mx9UeEk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693838724;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zwOfbAWdwcxiVEZLogxCvwETbAleNSV4ENBibaw75QE=;
 b=Coek/URptDUKM6d5L5sOSMh1YeT+Br1iQjDDCxQC5XP1dISO7+0jN8FkNTdD/+nSVNxjoG
 mly3oqzZQ7KHyvDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2436C13425;
 Mon,  4 Sep 2023 14:45:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6Wz5B4Tt9WSeNwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 04 Sep 2023 14:45:24 +0000
Message-ID: <9ff7e92a-539e-42fd-031b-d3a256021529@suse.de>
Date: Mon, 4 Sep 2023 16:45:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/8] fbdev/smscufx: Use fb_ops helpers for deferred I/O
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
 daniel@ffwll.ch, sam@ravnborg.org
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-2-tzimmermann@suse.de>
 <877cp66qmp.fsf@minerva.mail-host-address-is-not-set>
 <b9b985e7-4f60-7c59-3121-b26b07b13b03@suse.de>
In-Reply-To: <b9b985e7-4f60-7c59-3121-b26b07b13b03@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PRkXFkMYvCBn8xIvrEX4jg8i"
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
Cc: Steve Glendinning <steve.glendinning@shawell.net>,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PRkXFkMYvCBn8xIvrEX4jg8i
Content-Type: multipart/mixed; boundary="------------nbhjRC7dfWIrkQvkawxwnpwG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
 daniel@ffwll.ch, sam@ravnborg.org
Cc: Steve Glendinning <steve.glendinning@shawell.net>,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org
Message-ID: <9ff7e92a-539e-42fd-031b-d3a256021529@suse.de>
Subject: Re: [PATCH 1/8] fbdev/smscufx: Use fb_ops helpers for deferred I/O
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-2-tzimmermann@suse.de>
 <877cp66qmp.fsf@minerva.mail-host-address-is-not-set>
 <b9b985e7-4f60-7c59-3121-b26b07b13b03@suse.de>
In-Reply-To: <b9b985e7-4f60-7c59-3121-b26b07b13b03@suse.de>

--------------nbhjRC7dfWIrkQvkawxwnpwG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA0LjA5LjIzIHVtIDE2OjM5IHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQpb
Li4uXQ0KPiBBdCBsZWFzdCB0d28gZHJpdmVycyBjb3VsZCB1c2UgX19GQl9ERUZBVUxUX0RF
RkVSUkVEX09QU19NTUFQOiANCj4gcGljb2xjZC1mYiBhbmQgaHlwZXJ2X2ZiLiBBdCBzb21l
IHBvaW50LCB3ZSBtaWdodCB3YW50IHRvIHNldC9jbGVhciANCg0KQm90aCBkcml2ZXJzIGFy
ZSBhbHJlYWR5IGluIHRoaXMgcGF0Y2hzZXQuDQoNCj4gZmJfbW1hcCBkZXBlbmRpbmcgb24g
c29tZSBLY29uZmlnIHZhbHVlLiBIYXZpbmcgDQo+IF9fRkJfREVGQVVMVF9ERUZFUlJFRF9P
UFNfTU1BUCBtaWdodCBiZSBoZWxwZnVsIHRoZW4uDQo+IA0KPj4NCj4+IEFsdGVybmF0aXZl
bHksIF9fRkJfREVGQVVMVF9ERUZFUlJFRF9PUFNfTU1BUCgpIGNvdWxkIHN0aWxsIGJlIGxl
ZnQgYnV0DQo+PiBub3QgdGFraW5nIGEgX19wcmVmaXggYXJndW1lbnQgc2luY2UgdGhhdCBp
cyBub3QgdXNlZCBhbnl3YXlzID8NCj4gDQo+IFRoZSBkcml2ZXIgb3B0aW9uYWxseSBwcm92
aWRlcyBtbWFwIHdpdGhvdXQgZGVmZXJyZWQgSS9PLCBoZW5jZSB0aGUgbW1hcCANCj4gZnVu
Y3Rpb24uIFRoYXQgbWFrZXMgbm8gc2Vuc2UsIGFzIHRoZXNlIHdyaXRlcyB0byB0aGUgYnVm
ZmVyIHdvdWxkIG5ldmVyIA0KPiBtYWtlIGl0IHRvIHRoZSBkZXZpY2UgbWVtb3J5LiBCdXQg
SSBkaWRuJ3Qgd2FudCB0byByZW1vdmUgdGhlIGNvZGUgDQo+IGVpdGhlci4gU28gSSBqdXN0
IGxlZnQgdGhlIGV4aXN0aW5nIGZ1bmN0aW9uIGFzLWlzLiBVc3VhbGx5LCB0aGUgDQo+IGRl
ZmVycmVkLUkvTyBtbWFwIGlzIGNhbGxlZCBpbW1lZGlhdGVseS4gWzFdDQo+IA0KPiBCZXN0
IHJlZ2FyZHMNCj4gVGhvbWFzDQo+IA0KPiBbMV0gDQo+IGh0dHBzOi8vZWxpeGlyLmJvb3Rs
aW4uY29tL2xpbnV4L3Y2LjUuMS9zb3VyY2UvZHJpdmVycy92aWRlby9mYmRldi9zbXNjdWZ4
LmMjTDc4NA0KPiANCj4+DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdt
YkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjog
SXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2Vy
bWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------nbhjRC7dfWIrkQvkawxwnpwG--

--------------PRkXFkMYvCBn8xIvrEX4jg8i
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmT17YMFAwAAAAAACgkQlh/E3EQov+Bl
7g/+IkeJ8BEF+Ndcx15ceam9wUKFmxrZZxzU3LVoh0UKmoqA/1bZ7nZz9X3gO2D1mOe/iyUxqP+1
jKOe7Cc2BG3mz2GekbDQJa4XPIlsJ5Ox/lHMSsQrVe48luAYSqpX9LGzox429Kl2REQM5dPs6/wz
D2c9sfHYFJ6orzHl18rtb+LK0U7pBxirS0sKLcE2Hpt0Z7k2JN6bPJ+cVEkFPa+KA2Ydea2SLfeU
a4lWvRG/F+YvIoN4EA8e7Lo6z8w1aBn6dfqhxyLwORLUvles4UD3Ok6WrCKoUa27Ub4Ui2HSIx2E
UPD7/3QASWkPTh87sJw5u25oe+R0IFxhYaxhC9OoABhjbfZJVz88TSoKMV5s7gjhjWxfEhAH3hhf
cBHtLzkhShL0hst4yFv5kgnDZmlUeIhtEy3aGdK0mrCKVRgLTOJUr9X3ID9aiA+eJoBnDz8UVv4E
PzmHX01HEszSf/8IxP2qkZXlSlHD53mFenzZQ/Xo+OaEZ1ccgeRzpWbQEPs0+Bc7peUZ/CzUGc0C
m84wwZ+bTa3KJN7vNOnTvu8YinMBnu9nlkQXSrv652p1N8hQ3jhrX3J+xPJiA7e0bHrsVy1eWihe
ezMlOHNqpnkNXm3wooPhDXkFzpBV5rnFjrupLgMk8BeeMIiH/ohPHh7r698qLnvyQmuiyn0QbW9M
Eeo=
=uykn
-----END PGP SIGNATURE-----

--------------PRkXFkMYvCBn8xIvrEX4jg8i--

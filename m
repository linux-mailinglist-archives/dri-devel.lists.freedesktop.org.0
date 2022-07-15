Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB935760EE
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 13:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2328C18A740;
	Fri, 15 Jul 2022 11:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18C218A73B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 11:52:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5B3F91FD6E;
 Fri, 15 Jul 2022 11:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657885976; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GsSgQ4OwCbcOJF3WTCcwE3C+x9/o52jYDxy5qSN5wps=;
 b=I0sIVvEWUNbYxB64HEJQYVXPAA1VqMGQeDHwlDxQ6bm0RsDmWEShyC9LWfNgdWXAFFntmF
 fhi+FXxAP++qfeMC5lLpJEPPsCCHTl6PxkVaHmov8fkeGrvFJ33DhkT3BU9Xymm6pH67Qw
 N4UDrn8F7ojFjzD4tldC8mGFdTnAn5Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657885976;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GsSgQ4OwCbcOJF3WTCcwE3C+x9/o52jYDxy5qSN5wps=;
 b=9mAVh6TzrBrv49A+YSBOuCV6EQ7g0f1Xhc9BoGMe46pIev/a0hs3LlkswTEapwurzUEXhr
 lPQurcKPULEhshBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2C42413754;
 Fri, 15 Jul 2022 11:52:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RcMIChhV0WJZfgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 15 Jul 2022 11:52:56 +0000
Message-ID: <d11b2c82-d81e-d466-740d-f1699062a3b9@suse.de>
Date: Fri, 15 Jul 2022 13:52:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 06/11] fbdev: Remove conflicting devices on PCI bus
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
 daniel@ffwll.ch, sam@ravnborg.org, maxime@cerno.tech
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-7-tzimmermann@suse.de>
 <210b1ae1-f663-dfe2-d9b5-2cd827d15f2b@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <210b1ae1-f663-dfe2-d9b5-2cd827d15f2b@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cOb9csh301BIz1B7vtXxJTOO"
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cOb9csh301BIz1B7vtXxJTOO
Content-Type: multipart/mixed; boundary="------------mqWh7NhfYhvIYWjr2u0ZvlXT";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
 daniel@ffwll.ch, sam@ravnborg.org, maxime@cerno.tech
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Message-ID: <d11b2c82-d81e-d466-740d-f1699062a3b9@suse.de>
Subject: Re: [PATCH 06/11] fbdev: Remove conflicting devices on PCI bus
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-7-tzimmermann@suse.de>
 <210b1ae1-f663-dfe2-d9b5-2cd827d15f2b@redhat.com>
In-Reply-To: <210b1ae1-f663-dfe2-d9b5-2cd827d15f2b@redhat.com>

--------------mqWh7NhfYhvIYWjr2u0ZvlXT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMDcuMjIgdW0gMTM6MTMgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDcvNy8yMiAxNzozOSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+
PiBSZW1vdmUgZmlybXdhcmUgZGV2aWNlcyBvbiB0aGUgUENJIGJ1cywgYnkgY2FsbGluZw0K
Pj4gYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX3BjaV9kZXZpY2VzKCkgaW4gdGhlIHBy
b2JlIGZ1bmN0aW9uIG9mDQo+PiBlYWNoIHJlbGF0ZWQgZmJkZXYgZHJpdmVyLiBpU28gZmFy
LCBtb3N0IG9mIHRoZXNlIGRyaXZlcnMgZGlkIG5vdA0KPj4gcmVtb3ZlIGNvbmZsaWN0aW5n
IFZFU0Egb3IgRUZJIGRldmljZXMsIG9yIG91dHJpZGUgZmFpbGVkIGZvcg0KPj4gcmVzb3Vy
Y2UgY29uZmxpY3RzIChpLmUuLCBtYXRyb3hmYi4pIFRoaXMgbXVzdCBoYXZlIGJlZW4gYnJv
a2VuDQo+PiBmb3IgcXVpdGUgc29tZSB0aW1lLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gLS0tDQo+IA0KPiBb
Li4uXQ0KPiANCj4+IEBAIC05NDksNiArOTUwLDEwIEBAIHN0YXRpYyBpbnQgYXJrX3BjaV9w
cm9iZShzdHJ1Y3QgcGNpX2RldiAqZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAq
aWQpDQo+PiAgIAlpbnQgcmM7DQo+PiAgIAl1OCByZWd2YWw7DQo+PiAgIA0KPj4gKwlyYyA9
IGFwZXJ0dXJlX3JlbW92ZV9jb25mbGljdGluZ19wY2lfZGV2aWNlcyhkZXYsICJhcmtmYiIp
Ow0KPj4gKwlpZiAocmMgPCAwKQ0KPj4gKwkJcmV0dXJuIHJjOw0KPj4gKw0KPiANCj4gSSB3
b25kZXIgaWYgd2UgY291bGQgdGhpbmsgb2YgYSB0cmljayB0byBhdm9pZCBvcGVuIGNvZGlu
ZyB0aGUgc2FtZSBjaGVjayBpbg0KPiBhbGwgZHJpdmVycy4gTWF5YmUgYSBjb21iaW5hdGlv
biBvZiB1c2luZyBLQlVJTERfTU9ETkFNRSBmb3IgdGhlIG5hbWUgYW5kDQo+IGEgcHJvYmUg
Y2FsbGJhY2sgd3JhcHBlciBvciBzb21ldGhpbmcgPw0KDQpPcmlnaW5hbGx5LCBJIHRyaWVk
IHRvIGhhY2sgdGhpcyBpbnRvIHJlZ2lzdGVyX2ZyYW1lYnVmZmVyKCksIHdoZXJlIHRoZSAN
CnJlbW92YWwgd2FzIG9yaWdpbmFsbHkgbG9jYXRlZC4gQnV0IHRoYXQncyB0b28gbGF0ZSBh
cyB0aGVyZSBpcyANCmNvbmZsaWN0aW5nIHJlc291cmNlIGFjY2VzcyBpbiBtb3N0IGRyaXZl
cidzIHByb2JlIGZ1bmN0aW9uLiBUaGUgdG9wIG9mIA0KdGhlIHByb2JlIGZ1bmN0aW9uIGlz
IHRoZSBvbmx5IHBsYWNlIHdoZXJlIHRoaXMgY2FsbCBjYW4gcmVhbGlzdGljYWxseSANCmJl
IGxvY2F0ZWQuIEl0J3MgdGhlIHNhbWUgcnVsZSBhcyB3aXRoIERSTSBkcml2ZXJzOiB0aGUg
ZmlybXdhcmUgZHJpdmVyIA0KbmVlZHMgdG8gYmUgZ29uZSBiZWZvcmUgdGhlIG5hdGl2ZSBk
cml2ZXIgdG91Y2hlcyBoYXJkd2FyZS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAN
Cj4gQnV0IHByb2JhYmx5IG5vdCB3b3J0aCB0byBpbnZlc3QgbW9yZSBpbiB0aGUgZmJkZXYg
ZHJpdmVycyBhbmQgY291bGQgYmUgZG9uZQ0KPiBhcyBhIGZvbGxvdy11cCBhbnl3YXlzIGlm
IHNvbWVvbmUgZmVlbHMgbGlrZSBpdC4NCj4gDQo+IFJldmlld2VkLWJ5OiBKYXZpZXIgTWFy
dGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4gDQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJn
LCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJl
cjogSXZvIFRvdGV2DQo=

--------------mqWh7NhfYhvIYWjr2u0ZvlXT--

--------------cOb9csh301BIz1B7vtXxJTOO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLRVRcFAwAAAAAACgkQlh/E3EQov+Am
ow//XuOvuLtnhgX1VLxXqX8N04Ouy79PrqQrfVYF5UueOlSk8Ytp9U72LqziGsdxKSQUeQJ10aT9
bmfYsBpy8ddUljJaYZVUmBH3hBIk2S3GXqMg3OH7ONa4X+axJH/ITc4MHHdHbDDfDFjqhoW2a7fR
fdYFVOb5Fb5uFs/XX44JqE0zT0A9MypJe7AGVV0WuL6GNtfc3gsJxmRuihc3jJASD5W+HlBI/hHr
2qFp330dE4P+4fxQjG4KP+e2oHnuj3zNNBuzODr5tK0DF59VLbaajOd/C3pGPqi5C5ScvEbEwqkc
liT2wVEI6flZzU3vHW21wD64iaGba+FsKO9IvvSi5Lp7vLcybpcacDmUQE4ZbDPC/uPYjffk7Tlh
njFTLYVJFz9Y74dFO//PrcedUeCqObpsY0G8tFMbZ14Ol/hiN6rIbombm8LGAY4t16VBQDVnZUH+
XFP2ckPketjxun8kU6y/xRbrfWchx3Y/SeJDD/xbhliyT1aBgkTcOPMrYtp+ZCvJ3nD/wIMeM3Y1
FKxMyotBSsXR86II8cARCfbrBi+2hH15Pun/bZTDOGcnZ1eJRPu0yRV31FfJL92lFpcD3IVwcmFH
cLGj+ul42FST8Q1jwZWghWTw3nk6STF9xgJs7MiKOYA/J3FBrwNFekRwmzUdGpKUjCaXFfS5D8gQ
Oi0=
=XCGR
-----END PGP SIGNATURE-----

--------------cOb9csh301BIz1B7vtXxJTOO--

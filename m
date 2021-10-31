Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F049441013
	for <lists+dri-devel@lfdr.de>; Sun, 31 Oct 2021 19:13:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FC589B83;
	Sun, 31 Oct 2021 18:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF19C89B83
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Oct 2021 18:13:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 04DC621958;
 Sun, 31 Oct 2021 18:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635703999; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Up7oZPl8s4bWT/CVfU9jOEhgwIrK+zsoVt+amABM9Fc=;
 b=ArBdtU9C55HqEXW5VW+xDG2ExgWnefN7/0hEOiyMnlFqrbrZ7jd2hoGtTN0EAOdia4pU8t
 zIbk7Vk77Y3Ex/WlMqXNy3CGk/H85M5mJfvRasznOJU9SQ2p7B+iE9xyACJozNFBFCTTJu
 H1KMnewRUn4ilztLA+V68yiDt+yWJtg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635703999;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Up7oZPl8s4bWT/CVfU9jOEhgwIrK+zsoVt+amABM9Fc=;
 b=1aQzPD5rSzmZfQjsSfbuJBONG3vE3g38mOslVlrt/rDrmFowKw5l5NTgH6HAcQX3qR0x0d
 jHzXoL72vwfPuHAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 96D711323E;
 Sun, 31 Oct 2021 18:13:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MEk2I77cfmGRVQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 31 Oct 2021 18:13:18 +0000
Message-ID: <eadfa89d-1c39-be25-abaf-4150396e1024@suse.de>
Date: Sun, 31 Oct 2021 19:13:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] drm: import DMA_BUF module namespace
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc: Marcel Ziswiler <marcel@ziswiler.com>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Ripard <mripard@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Linux Kernel Functional Testing <lkft@linaro.org>
References: <20211027212506.3418521-1-marcel@ziswiler.com>
 <2312b5c3-ffc9-b54e-a08b-2548e3837d83@suse.de>
 <20211031132155.7dc972e8@canb.auug.org.au>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211031132155.7dc972e8@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xHcEni6FN9N08ZFYv4DeOYvy"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xHcEni6FN9N08ZFYv4DeOYvy
Content-Type: multipart/mixed; boundary="------------X8nU0lx0ulAy9q1uaU0R0pzt";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Cc: Marcel Ziswiler <marcel@ziswiler.com>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Ripard <mripard@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Linux Kernel Functional Testing <lkft@linaro.org>
Message-ID: <eadfa89d-1c39-be25-abaf-4150396e1024@suse.de>
Subject: Re: [PATCH v2] drm: import DMA_BUF module namespace
References: <20211027212506.3418521-1-marcel@ziswiler.com>
 <2312b5c3-ffc9-b54e-a08b-2548e3837d83@suse.de>
 <20211031132155.7dc972e8@canb.auug.org.au>
In-Reply-To: <20211031132155.7dc972e8@canb.auug.org.au>

--------------X8nU0lx0ulAy9q1uaU0R0pzt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMzEuMTAuMjEgdW0gMDM6MjEgc2NocmllYiBTdGVwaGVuIFJvdGh3ZWxsOg0K
PiBIaSBUaG9tYXMsDQo+IA0KPiBPbiBGcmksIDI5IE9jdCAyMDIxIDIwOjUxOjUyICswMjAw
IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4+DQo+
PiBBbSAyNy4xMC4yMSB1bSAyMzoyNSBzY2hyaWViIE1hcmNlbCBaaXN3aWxlcjoNCj4+PiBG
cm9tOiBNYXJjZWwgWmlzd2lsZXIgPG1hcmNlbC56aXN3aWxlckB0b3JhZGV4LmNvbT4NCj4+
Pg0KPj4+IFRvZGF5J3MgLW5leHQgZmFpbHMgYnVpbGRpbmcgYXJtNjQgZGVmY29uZmlnIGFz
IGZvbGxvd3M6DQo+Pj4NCj4+PiBFUlJPUjogbW9kcG9zdDogbW9kdWxlIGRybV9jbWFfaGVs
cGVyIHVzZXMgc3ltYm9sIGRtYV9idWZfdnVubWFwIGZyb20NCj4+PiAgICBuYW1lc3BhY2Ug
RE1BX0JVRiwgYnV0IGRvZXMgbm90IGltcG9ydCBpdC4NCj4+PiBFUlJPUjogbW9kcG9zdDog
bW9kdWxlIGRybV9jbWFfaGVscGVyIHVzZXMgc3ltYm9sIGRtYV9idWZfdm1hcCBmcm9tDQo+
Pj4gICAgbmFtZXNwYWNlIERNQV9CVUYsIGJ1dCBkb2VzIG5vdCBpbXBvcnQgaXQuDQo+Pj4N
Cj4+PiBSZXBvcnRlZC1ieTogTGludXggS2VybmVsIEZ1bmN0aW9uYWwgVGVzdGluZyA8bGtm
dEBsaW5hcm8ub3JnPg0KPj4+IEZpeGVzOiBjb21taXQgNGIyYjVlMTQyZmY0ICgiZHJtOiBN
b3ZlIEdFTSBtZW1vcnkgbWFuYWdlcnMgaW50byBtb2R1bGVzIikNCj4+PiBTaWduZWQtb2Zm
LWJ5OiBNYXJjZWwgWmlzd2lsZXIgPG1hcmNlbC56aXN3aWxlckB0b3JhZGV4LmNvbT4NCj4+
DQo+PiBJIGFkZGVkIHRoaXMgZml4IGludG8gZHJtLW1pc2MtbmV4dC4gVGhhbmtzIQ0KPj4N
Cj4+IEhvd2V2ZXIsIEkgaGFkIHRvIGltcG9ydCBsaW51eC1uZXh0IHdoaWxlIGRvaW5nIHNv
LiAnR2l0IGFtJyBkaWQgYQ0KPj4gMy13YXkgbWVyZ2UsIHdoaWNoIG1heSByZXN1bHQgaW4g
YSBjb25mbGljdCB3aGVuIHRoZSBmaXggcmVhY2hlcw0KPj4gbGludXgtbmV4dCBhZ2Fpbi4g
SSBhbHNvIHVwZGF0ZWQgdGhlIGNvbW1pdCBkZXNjcmlwdGlvbi4NCj4gDQo+IFlvdSBjYW5u
b3QgbWVyZ2UgbGludXgtbmV4dCBpbnRvIGFueSB0cmVlLCBzb3JyeS4gIEl0IHJlYmFzZXMg
ZXZlcnkgZGF5DQo+IChhbmQgc28gZG8gc2V2ZXJhbCBvZiB0aGUgaW5jbHVkZWQgdHJlZXMp
Lg0KDQpObyBubywgZG9uJ3Qgd29ycnkuIEkgbWVhbnQgJ2ltcG9ydCcgYXMgaW4gJ2dpdCBy
ZW1vdGUgYWRkIGxpbnV4LW5leHQnLiANCkkgd2FzIGFjdHVhbGx5IGNvbXBsYWluaW5nIHRo
YXQgdGhlIHByb3ZpZGVkIGZpeCB3YXMgbm90IGFnYWluc3QgYSBEUk0gdHJlZS4NCg0KQmVz
dCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gWW91ciBmaXggcGF0Y2ggc2hvdWxkIGJlIHNl
bnQgdG8gR3JlZyBLSCBhbmQgQXJuZCBhcyB0aGUgYnVpbGQgZmFpbHVyZQ0KPiBpcyBpbnRy
b2R1Y2VkIGluIHRoZSBjaGFyLW1pc2MgdHJlZS4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1l
cm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJt
YW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogRmVs
aXggSW1lbmTDtnJmZmVyDQo=

--------------X8nU0lx0ulAy9q1uaU0R0pzt--

--------------xHcEni6FN9N08ZFYv4DeOYvy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmF+3L0FAwAAAAAACgkQlh/E3EQov+BY
BA/+KHAwHCFaAsejmukP+E7sYrqLuAjl+4pIhX4woK34y1f7LVav8PjxbTdpN20U2SMdjyPzUsLV
IVHPO4Y4AEM2bNlrF/T+Aybg/lUmDPewknIn15rqi1QM7MngfrqtdLcVwM9fe7uWR9h3ygX6gAo4
3oLIgS7ZWAlihy+DIyN/zasD+aG2YT6g6BL9Z3OX2wFrQKhEiW2f+Ng0ns3dEu8y37bWTWtNatE7
BaWgU5QGMlXNQJ39oDGbnOzZJGttUmUqScTZ7VpmkhlpIRUk8YpJu5aO0ZL4paKqqy9dYvIqakDx
FNXlzBPBaYgk0rrHeyzBzumjGWZY5GFhnZsP8YLK8IEhh4wsMMTdYnYvX9rqGnHvUa7smrG/rigA
RAUawiowToaeEAvsbj9gtVXwwwrlq2uNvD+vCFghn4373hKzYBrW7H+xcYsfAOCI/qMgQPZeTadj
VLM2ZghP5n9JsAyadlGjsgO9DmP0fpa/eulYtrDpAFuf8X6oGT/M5SxEFHXnK3NC7BzQhg1/ZLc6
+pEnvu0UjAht3/RW1IbwhqK9C/x594C+VkjgKiqLb5wB4rDTbYlxTHdRdtUVX+gvO/csIGQitVPg
8+asMtMgZhHyCa66Q8FCUYXrT9HwlYs9YVrd5/nTUyXnUYZf23htXp6oAS2tMbHvyBll5vB3UXgW
TkY=
=CLUF
-----END PGP SIGNATURE-----

--------------xHcEni6FN9N08ZFYv4DeOYvy--

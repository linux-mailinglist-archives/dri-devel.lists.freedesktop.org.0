Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADD16070B0
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 09:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C8B10E59B;
	Fri, 21 Oct 2022 07:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14EC10E2D6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 07:06:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 714121F74D;
 Fri, 21 Oct 2022 07:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666335982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NxNicJe2xmvXOAZFMSnTHjEYGV2DVlr1ZGcxbg8BiMs=;
 b=Mru0m/KPtlE5VgK3Kr8ZZFSw68FL6jZ3eUjGwA2uUCy/DepF9YKHahp/9A4VADA8SZ8tYb
 4eUJIx6BH2W+WPjM/UD3vyCT7Axazm1/k2Om46rZ0/z3KjbLKXvY3w3iel43zkwTZOQasi
 xyRnvzAbmLl7fNDw+W+o8r/y1FMspEo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666335982;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NxNicJe2xmvXOAZFMSnTHjEYGV2DVlr1ZGcxbg8BiMs=;
 b=C1NOnvF7dNsPoobBRBX1XI8VaCKldCO3IDYGnUD0oi0MFqbLnjd2sJrcM+xrscvFEKYUWF
 X560VUfnDnF+J3Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 51AFE13A0E;
 Fri, 21 Oct 2022 07:06:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tNIGE+5EUmOrJgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 21 Oct 2022 07:06:22 +0000
Message-ID: <a3aab1bb-9ba3-c016-cf49-530ff65d7326@suse.de>
Date: Fri, 21 Oct 2022 09:06:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 13/16] drm/vmwgfx: Port the framebuffer code to drm fb
 helpers
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20221020034131.491973-1-zack@kde.org>
 <20221020034131.491973-14-zack@kde.org>
 <dce8c2de-0e2c-0b99-e30f-29411e8d6908@suse.de>
 <737c5dd5e6593e43e5b6cd1aaf4d8a939756ec7c.camel@vmware.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <737c5dd5e6593e43e5b6cd1aaf4d8a939756ec7c.camel@vmware.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3SJpYVX56uBqRawoZXnypwFF"
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
Cc: Martin Krastev <krastevm@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>,
 Michael Banack <banackm@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3SJpYVX56uBqRawoZXnypwFF
Content-Type: multipart/mixed; boundary="------------OON4n5f4nYuxvGsQ8FPREhTD";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: Martin Krastev <krastevm@vmware.com>, Michael Banack
 <banackm@vmware.com>, Maaz Mombasawala <mombasawalam@vmware.com>
Message-ID: <a3aab1bb-9ba3-c016-cf49-530ff65d7326@suse.de>
Subject: Re: [PATCH v2 13/16] drm/vmwgfx: Port the framebuffer code to drm fb
 helpers
References: <20221020034131.491973-1-zack@kde.org>
 <20221020034131.491973-14-zack@kde.org>
 <dce8c2de-0e2c-0b99-e30f-29411e8d6908@suse.de>
 <737c5dd5e6593e43e5b6cd1aaf4d8a939756ec7c.camel@vmware.com>
In-Reply-To: <737c5dd5e6593e43e5b6cd1aaf4d8a939756ec7c.camel@vmware.com>

--------------OON4n5f4nYuxvGsQ8FPREhTD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMTAuMjIgdW0gMjA6Mzcgc2NocmllYiBaYWNrIFJ1c2luOg0KPiBPbiBU
aHUsIDIwMjItMTAtMjAgYXQgMTE6MDYgKzAyMDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3Rl
Og0KPj4gSGkgWmFjaw0KPj4NCj4+IEFtIDIwLjEwLjIyIHVtIDA1OjQxIHNjaHJpZWIgWmFj
ayBSdXNpbjoNCj4+PiBGcm9tOiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPg0KPj4g
Wy4uLl0NCj4+PiBAQCAtMTY3MCw2ICsxNjQwLDEwIEBAIHN0YXRpYyBpbnQgdm13X3Byb2Jl
KHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqZW50
KQ0KPj4+ICAgIAlpZiAocmV0KQ0KPj4+ICAgIAkJZ290byBvdXRfdW5sb2FkOw0KPj4+ICAg
IA0KPj4+ICsJdm13X2ZpZm9fcmVzb3VyY2VfaW5jKHZtdyk7DQo+Pj4gKwl2bXdfc3ZnYV9l
bmFibGUodm13KTsNCj4+PiArCWRybV9mYmRldl9nZW5lcmljX3NldHVwKCZ2bXctPmRybSwg
IHZtdy0+YXNzdW1lXzE2YnBwID8gMTYgOiAzMik7DQo+Pg0KPj4gVGhlIHByZWZlcnJlZCB3
YXkgb2Ygc2V0dGluZyB0aGUgY29sb3IgZGVwdGggaXMgd2l0aCBzdHJ1Y3QNCj4+IGRybV9t
b2RlX2NvbmZpZy5wcmVmZXJyZWRfZGVwdGguIFsxXSBOb3RlIHRoYXQgaXQgaXMgdGhlIGNv
bG9yIGRlcHRoOw0KPj4gbm90IHRoZSBwaXhlbCBzaXplLiBJbiB5b3VyIGNhc2U6DQo+Pg0K
Pj4gaWYgKHZtdy0+YXNzdW1lXzE2YnBwKQ0KPj4gCWRldi0+bW9kZV9jb25maWcucHJlZmVy
cmVkX2RlcHRoID0gMTY7DQo+PiBlbHNlDQo+PiAJZGV2LT5tb2RlX2NvbmZpZy5wcmVmZXJy
ZWRfZGVwdGggPSAyNDsNCj4+DQo+PiBJdCdzIGFsc28gYSBoaW50IHRvIHVzZXJzcGFjZS4g
WzJdDQo+Pg0KPj4gVGhlIHByZWZlcl9icHAgcGFyYW1ldGVyIG9mIGRybV9mYmRldl9nZW5l
cmljX3NldHVwKCkgc2hvdWxkIGJlIDAuIEl0IGlzDQo+PiBhIGZhbGxiYWNrIHRvIGZvcmNl
IGEgY2VydGFpbiBwaXhlbCBzaXplLCBhcyBwcmVmZXJyZWRfZGVwdGggZmFpbHMuDQo+Pg0K
PiANCj4gQWgsIHRoYXQgbWFrZXMgc2Vuc2UuIEknbGwgZml4IHRoYXQsIGJ0dywgdGhlIGRl
di0+bW9kZV9jb25maWcucHJlZmVycmVkX2RlcHRoID0gMjQNCj4gcGFydCwgd2Ugc2hvdWxk
IHByb2JhYmx5IGhhdmUgc29tZSBjaGVjayBpbiBkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cCB0
aGF0IGl0IGlzIG5vdA0KPiAyNC4NCj4gDQo+IFRoYXQncyBiZWNhdXNlIDI0IHdpbGwgaW52
b2tlIHRoZSBidWdneSBjb2RlIGluIGRybSBmYmRldiBoZWxwZXJzIHRoYXQgY29uZnVzZXMN
Cj4gZGVwdGggYW5kIGJwcCBhbmQgd2lsbCBlbmR1cCBpbnZva2luZyBkdW1iIGNyZWF0ZSB3
aXRoIGFyZ3MtPmJwcCA9PSAyNCBhbmQgdGhhdCdzDQo+IHNwZWNpZmljYWxseSBkaXNhbGxv
d2VkIGZvciBkdW1iX2NyZWF0ZS4gSUdUJ3MgaGFzIGV4cGxpY2l0DQo+IChkdW1iX2J1ZmZl
cjo6aW52YWxpZF9icHApIHRlc3QgdGhhdCBjaGVja3Mgd2hldGhlciBkdW1iX2NyZWF0ZSB3
aXRoIGJwcCA9PSAyNA0KPiBmYWlscy4gQW4gZWFybGllciBjb21taXQgaW4gdGhpcyBzZXJp
ZXMgYWN0dWFsbHkgZml4ZXMgdGhhdCBzcGVjaWZpYyB0ZXN0IGluIHZtd2dmeC4NCj4gQSBs
b3Qgb2YgZHJpdmVycyB3aWxsIHdvcmsgYmVjYXVzZSBldmVuIHRob3VnaCB0aGV5IHNldCBw
cmVmZXJyZWRfZGVwdGggdG8gMjQsIHRoZXkNCj4gY2FsbCB0aGUgIGRldi0+bW9kZV9jb25m
aWcucHJlZmVycmVkX2RlcHRoID0gMjQgY2FsbCBkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cCB3
aXRoIDMyDQo+IGJ1dCBpdCdzIGRlZmluaXRlbHkgY29uZnVzaW5nLg0KDQpDYWxsaW5nIGRy
bV9mYmRldl9nZW5lcmljX3NldHVwKCkgd2l0aCAzMiBpcyB0aGUgJ29mZmljaWFsJyB3b3Jr
YXJvdW5kIA0KZm9yIHRoZSBwcm9ibGVtLiBJZiB5b3UgcnVuIGludG8gdGhlIGJ1ZywgaXQn
cyBvayB0byBjYWxsIHRoZSBmdW5jdGlvbiANCndpdGggYSBicHAgdmFsdWUuIFRoZSB3aG9s
ZSB1c2FnZSBvZiBmb3JtYXRzLCBkZXB0aCBhbmQgYnBwIGluIGZiZGV2IA0KaGVscGVycyBp
cyBjb25mdXNpbmcgYW5kIG5lZWRzIHdvcmsuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoN
Cj4gDQo+Pg0KPj4+ICsNCj4+PiAgICAJdm13X2RlYnVnZnNfZ2VtX2luaXQodm13KTsNCj4+
PiAgICAJdm13X2RlYnVnZnNfcmVzb3VyY2VfbWFuYWdlcnNfaW5pdCh2bXcpOw0KPj4+ICAg
IA0KPj4gWy4uLl0NCj4+PiAtDQo+Pj4gLS8qKg0KPj4+IC0gKiB2bXdfZmJfZGlydHlfZmx1
c2ggLSBmbHVzaCBkaXJ0eSByZWdpb25zIHRvIHRoZSBrbXMgZnJhbWVidWZmZXINCj4+PiAt
ICoNCj4+PiAtICogQHdvcms6IFRoZSBzdHJ1Y3Qgd29ya19zdHJ1Y3QgYXNzb2NpYXRlZCB3
aXRoIHRoaXMgdGFzay4NCj4+PiAtICoNCj4+PiAtICogVGhpcyBmdW5jdGlvbiBmbHVzaGVz
IHRoZSBkaXJ0eSByZWdpb25zIG9mIHRoZSB2bWFsbG9jIGZyYW1lYnVmZmVyIHRvIHRoZQ0K
Pj4+IC0gKiBrbXMgZnJhbWVidWZmZXIsIGFuZCBpZiB0aGUga21zIGZyYW1lYnVmZmVyIGlz
IHZpc2libGUsIGFsc28gdXBkYXRlZCB0aGUNCj4+PiAtICogY29ycmVzcG9uZGluZyBkaXNw
bGF5cy4gTm90ZSB0aGF0IHRoaXMgZnVuY3Rpb24gcnVucyBldmVuIGlmIHRoZSBrbXMNCj4+
PiAtICogZnJhbWVidWZmZXIgaXMgbm90IGJvdW5kIHRvIGEgY3J0YyBhbmQgdGh1cyBub3Qg
dmlzaWJsZSwgYnV0IGl0J3MgdHVybmVkDQo+Pj4gLSAqIG9mZiBkdXJpbmcgaGliZXJuYXRp
b24gdXNpbmcgdGhlIHBhci0+ZGlydHkuYWN0aXZlIGJvb2wuDQo+Pj4gLSAqLw0KPj4+IC1z
dGF0aWMgdm9pZCB2bXdfZmJfZGlydHlfZmx1c2goc3RydWN0IHdvcmtfc3RydWN0ICp3b3Jr
KQ0KPj4NCj4+IFRoaXMgaXMgdGhlIGZsdXNoIGZ1bmN0aW9uIGZvciB2bXdnZngnIGRlZmVy
cmVkIEkvTy4gSWYgeW91IHdhbnQgdG8NCj4+IGltcGxlbWVudCBkZWZlcnJlZCBJL08gd2l0
aCB0aGUgZ2VuZXJpYyBmYmRldiBlbXVsYXRpb24sIHlvdSBoYXZlIHRvIHNldA0KPj4gc3Ry
dWN0IGRybV9tb2RlX2NvbmZpZy5wcmVmZXJfc2hhZG93X2ZiZGV2IHRvIHRydWUuIFszXQ0K
PiANCj4gWWVhLCB3ZSBkb24ndCBuZWVkIGl0IGFueW1vcmUuIEJ1dCBpdCBwcm9iYWJseSBp
cyBhIGdvb2QgaWRlYSB0byBwcmVzZXJ2ZSB0aGUgb2xkDQo+IGJlaGF2aW91ciBmb3Igc3lz
dGVtcyB0aGF0IGRpZG4ndCBoYXZlIGd1ZXN0IGJhY2tlZCBtZW1vcnkgc3VwcG9ydC4gSSds
bCBhZGp1c3QNCj4gdGhhdC4gVGhhbmtzIGZvciB0YWtpbmcgYSBsb29rIGF0IHRoaXMhDQo+
IA0KPiB6DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJl
cmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------OON4n5f4nYuxvGsQ8FPREhTD--

--------------3SJpYVX56uBqRawoZXnypwFF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNSRO0FAwAAAAAACgkQlh/E3EQov+AU
OhAAmm/g9rJcoX6PZqYaqCaRcDcf6LhGCV8tYgRWRCBMuG+LHb8xu9DMj8QOyNK4Nhl4RgbgZtFb
sSDWM0avaJLIIcp+E7okIM+Kzm9XGHuxDel0TbFTujN+eT59BCIImATQZN2grLNNGL3hC9p26SVb
E/UZ0QIx6lMmxlY1w60N/22OuU1ju4patiQvdtbYj0VzazkmxPzeYJF+E/nZTaXYuXZo/v3d9xP9
9KojBUnCxRT1pJ4+FmgPE0MmbHOCMvEmWaXXZLrcFr1XCTSPA2VrVTGv+KoP5hGwtRzayJMHQtgo
84SRndeWj0gN2X/1FVJ0caGjPYARhsOQXxJIQ0OGvrE9I5vtJWY2kcY7Mvzy5pDuNj4HAPMXFw2N
C2zw/KjA0VYG49781R1+Xi272GBMakvOd/lKxMT9TYJVtdj8cs7NK1AWwLAc5OddN5tS3vY3Zgcr
gGAOpCHFml4LSND6PMA0L/8GRqBnY10PCX57jkidMG3646h53NBmutaDl7iZPlzVYIyniuiVUA7g
qNlwqnehIo18J5g6/4JdEG1lraxTNhh0nAyOlTUTmTnnCK3aAa6nLcH+pyQfaLt9Nme2fyPRL3ZV
2TQhp2YyQdwGAqyxQk5DQ/qNDg0TF2Hdnr1KqRmeuffEJa2/67oryRpXb74WuNy/VUYj0uZpdGsP
p2s=
=+fnV
-----END PGP SIGNATURE-----

--------------3SJpYVX56uBqRawoZXnypwFF--

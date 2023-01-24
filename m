Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFDB67A045
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 18:36:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB4B10E0A3;
	Tue, 24 Jan 2023 17:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF40C10E0A3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 17:35:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 70AE921A16;
 Tue, 24 Jan 2023 17:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674581754; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1+sKqv23JuyRsnwYvahJ40AGulV4lwiRIYkjLDauOh0=;
 b=lNJ7XcQgbH05Fd7mlr+PVdhO8s9qS7oCJgDcQW6BM+S53RDTBULGG2gNn1Q35tMV2fdTse
 7n6789f3vIMkckFrjdQlJ1cI/8Bc8LPZaBk8IkNtzWuZJ7qMcRHc4qR9WSax2P3inteUrV
 Ka0RAy2pUkIEVysD8boqcKuf66qw9GE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674581754;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1+sKqv23JuyRsnwYvahJ40AGulV4lwiRIYkjLDauOh0=;
 b=vtV0KudITWki35Dcunenp3mAo8m5PhKxCwv6qVNFgNbZR0NrcRFtYXo8VNLhoMPIhYP/oD
 lfc2RmeaklE++4Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 46E4A13487;
 Tue, 24 Jan 2023 17:35:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0ys/EPoW0GOBbQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Jan 2023 17:35:54 +0000
Message-ID: <c297dd63-3322-79ec-f07f-8dafd3a21432@suse.de>
Date: Tue, 24 Jan 2023 18:35:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Amdgpu module is references even after unbinding the vtcon
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <c5001553-6c71-c7ff-36aa-c4712bda0abf@gmail.com>
 <04384589-3bb3-bbb6-ba0d-7a223555c5f4@suse.de>
 <CADnq5_PBZd8k8Q2ZTuOeuZOWfqScTaQWXpn__0FTeUFjRQdhQQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CADnq5_PBZd8k8Q2ZTuOeuZOWfqScTaQWXpn__0FTeUFjRQdhQQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3gh0kCnUXi5ZyWBw0LOVExqa"
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>, "Slivka,
 Danijel" <Danijel.Slivka@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3gh0kCnUXi5ZyWBw0LOVExqa
Content-Type: multipart/mixed; boundary="------------0Ws8oYDHJ5NVmTlvGCdexm8h";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Slivka, Danijel" <Danijel.Slivka@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>
Message-ID: <c297dd63-3322-79ec-f07f-8dafd3a21432@suse.de>
Subject: Re: Amdgpu module is references even after unbinding the vtcon
References: <c5001553-6c71-c7ff-36aa-c4712bda0abf@gmail.com>
 <04384589-3bb3-bbb6-ba0d-7a223555c5f4@suse.de>
 <CADnq5_PBZd8k8Q2ZTuOeuZOWfqScTaQWXpn__0FTeUFjRQdhQQ@mail.gmail.com>
In-Reply-To: <CADnq5_PBZd8k8Q2ZTuOeuZOWfqScTaQWXpn__0FTeUFjRQdhQQ@mail.gmail.com>

--------------0Ws8oYDHJ5NVmTlvGCdexm8h
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjQuMDEuMjMgdW0gMTc6MzYgc2NocmllYiBBbGV4IERldWNoZXI6DQo+IE9u
IFR1ZSwgSmFuIDI0LCAyMDIzIGF0IDExOjE1IEFNIFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4+DQo+PiBIaQ0KPj4NCj4+IEFtIDI0LjAxLjIz
IHVtIDE1OjEyIHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoNCj4+PiBIaSBUaG9tYXMsDQo+
Pj4NCj4+PiB3ZSByYW4gaW50byBhIHByb2JsZW0gd2l0aCB0aGUgZ2VuZXJhbCBmYmNvbi9m
YmRldiBpbXBsZW1lbnRhdGlvbiBhbmQNCj4+PiB0aG91Z2ggdGhhdCB5b3UgbWlnaHQgaGF2
ZSBzb21lIGlkZWEuDQo+Pj4NCj4+PiBXaGF0IGhhcHBlbnMgaXMgdGhlIGZvbGxvd2luZzoN
Cj4+PiAxLiBXZSBsb2FkIGFtZGdwdSBhbmQgZ2V0IG91ciBub3JtYWwgZmJjb24uDQo+Pj4g
Mi4gZmJjb24gYWxsb2NhdGVzIGEgZHVtcCBCTyBhcyBiYWNraW5nIHN0b3JlIGZvciB0aGUg
Y29uc29sZS4NCj4+PiAzLiBHRE0vWC9BcHBsaWNhdGlvbnMgc3RhcnQsIG5ldyBmcmFtZWJ1
ZmZlcnMgYXJlIGNyZWF0ZWQgQk9zIGltcG9ydGVkLA0KPj4+IGV4cG9ydGVkIGV0Yy4uLg0K
Pj4+IDQuIFNvbWVob3cgWCBvciBHRE0gaXRlcmF0ZWQgb3ZlciBhbGwgdGhlIGZyYW1lYnVm
ZmVyIG9iamVjdHMgdGhlDQo+Pj4ga2VybmVscyBrbm93cyBhYm91dCBhbmQgZXhwb3J0IHRo
ZW0gYXMgRE1BLWJ1Zi4NCj4+PiA1LiBBcHBsaWNhdGlvbi9YL0dETSBhcmUgc3RvcHBlZCwg
aGFuZGxlcyBjbG9zZWQsIGZyYW1lYnVmZmVycyByZWxlYXNlZA0KPj4+IGV0Yy4uLg0KPj4+
IDYuIFdlIHVuYmluZCB2dGNvbi4NCj4+Pg0KPj4+IEF0IHRoaXMgcG9pbnQgdGhlIGFtZGdw
dSBtb2R1bGUgdXN1YWxseSBoYXMgYSByZWZlcmVuY2UgY291bnQgb2YgMCBhbmQNCj4+PiBj
YW4gYmUgdW5sb2FkZWQsIGJ1dCBzaW5jZSBHRE0vWC9XaG9ldmVyIGl0ZXJhdGVkIG92ZXIg
YWxsIHRoZSBrbm93bg0KPj4+IGZyYW1lYnVmZmVycyBhbmQgZXhwb3J0ZWQgdGhlbSBhcyBE
TUEtYnVmIChmb3Igd2hhdGV2ZXIgcmVhc29uIGlkaykgd2UNCj4+PiBub3cgc3RpbGwgaGF2
ZSBhbiBleHBvcnRlZCBETUEtYnVmIGFuZCB3aXRoIGl0IGEgcmVmZXJlbmNlIHRvIHRoZSBt
b2R1bGUuDQo+Pj4NCj4+PiBBbnkgaWRlYSBob3cgd2UgY291bGQgcHJldmVudCB0aGF0Pw0K
Pj4NCj4+IE5vIHJlYWwgY2x1ZSwgc29ycnkuDQo+Pg0KPj4gQnV0IGRvZXMgaXQgY2hhbmdl
IGlmIHlvdSB1c2UgYSBzaGFkb3cgYnVmZmVyIG9uIHRvcCBvZiB0aGUgYW1kZ3B1IEJPPw0K
Pj4gU2V0IHByZWZlcl9zaGFkb3dfZmJkZXYgPSAxLiBbMV0gICBJIG9uY2UgdHJpZWQgdG8g
cnVuIGdlbmVyaWMgZmJkZXYNCj4+IHdpdGhvdXQgcHJlZmVyX3NoYWRvd19mYmRldiBhbmQg
aXQgbmV2ZXIgd29ya2VkLiBJIHN1c3BlY3RlZCB0aGF0IHNvbWUNCj4+IHJlZmVyZW5jZSBj
b3VudGluZyBnb3Qgd3JvbmcsIGJ1dCBjb3VsZCBuZXZlciBwaW4gaXQgZG93bi4gIE1heWJl
IHlvdXINCj4+IGlzc3VlIGlzIHNpbWlsYXIuDQo+IA0KPiBJcyB0aGF0IGVxdWl2YWxlbnQg
dG8gc2V0dGluZyBtb2RlX2NvbmZpZy5wcmVmZXJfc2hhZG93ID0gMT8gIElmIHNvLA0KPiB3
ZSBhbHJlYWR5IGRvIHRoYXQuDQoNClllcyBpdCBpcywgdW5mb3J0dW5hdGVseS4NCg0KQmVz
dCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gQWxleA0KPiANCj4+DQo+PiBUaGF0IHNhaWQs
IGdlbmVyaWMgZmJkZXYgaXMgbm90IHNvIHN1cGVyLW9wdGltYWwgZm9yIFRUTS1iYXNlZCBk
cml2ZXJzLg0KPj4gSSdtIHdvcmtpbmcgb24gaW1wcm92aW5nIHRoYXQsIGJ1dCBpdCdzIG5v
dCB0aGVyZSB5ZXQuDQo+Pg0KPj4gQmVzdCByZWdhcmRzDQo+PiBUaG9tYXMNCj4+DQo+Pg0K
Pj4gWzFdDQo+PiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4wL3NvdXJj
ZS9pbmNsdWRlL2RybS9kcm1fbW9kZV9jb25maWcuaCNMODkwDQo+Pg0KPj4+DQo+Pj4gVGhh
bmtzLA0KPj4+IENocmlzdGlhbi4NCj4+DQo+PiAtLQ0KPj4gVGhvbWFzIFppbW1lcm1hbm4N
Cj4+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINCj4+IFNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KPj4gTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBH
ZXJtYW55DQo+PiAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQo+PiBHZXNjaMOkZnRzZsO8
aHJlcjogSXZvIFRvdGV2DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBB
RyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------0Ws8oYDHJ5NVmTlvGCdexm8h--

--------------3gh0kCnUXi5ZyWBw0LOVExqa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPQFvkFAwAAAAAACgkQlh/E3EQov+CM
7A/+OdwR5muvJ/YA5Ne7G9R9rL22ghQbtiCfVvFzFlJf8EoYk1RaGxOoMGBGifIDCzdDyrRu+i29
V49GplFe/6mUPZio3VkJK1RBbLIIMUOkX++aJPyjRG1ss9xpkxg/BX7vxb77EqKJ4yCv/nIUzWwR
5UNEPkqDpgARppD2aAk9OgXc2dKv/2YT0KqgFWPp3ById5buEQ9N7gaPqPfgwaFvVPEAQcYxb0zs
nIuFaSKftvSrjetLTJUnJURzORYCt0JXwD0mv9MsYGv6cuaVVo3c9+xAliZtWiiS6hXBqkbI4a/M
Kz3hdTtkWXz3pfjK5FGsfSpMK9Ql0OmhonFJ0uPYQs6FfYxPerqqOzyPBPjD+w8xR8KHC3y8t4Vg
6y/P15G64V0BSIJ2z6oR2IKANTB28ZP5pkPlPv7N7vw4/Rp5Yxdt0psDEKucjkjl1USHyvQbm8V7
4tVtd5fauFDvhCIWxn5Y5k5hEiFTGmbJxgvyaX8cusENSRb4sPmcJ9FvpKPWOcuw/XaDF0XR6EU+
/Xuy7/Gabm01EyNZ30dhMv/YybyCe0naBKI1cgI+gVjH58v5R8kDupWeGiykUypDuqvjXknEUMci
FtQBWVddtcL0YmMeFripXWCGeslcXJOacW9vXxMRsX+UZWfJzFSx3L4rzh6osiNOfpmQQF3POqOo
mZc=
=8EED
-----END PGP SIGNATURE-----

--------------3gh0kCnUXi5ZyWBw0LOVExqa--

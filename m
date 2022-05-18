Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8842652B466
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 10:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C93AB10E90B;
	Wed, 18 May 2022 08:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28FCA10E90B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 08:17:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AFC9421AF0;
 Wed, 18 May 2022 08:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652861852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OoTMGVjTXMFjqujWft0A9ctd9WVbuIHSWD5PCemQ9gs=;
 b=Cx4thwQpXep3HOjTTlNx1xHOoPd9Y97uthWHNNHohdfpPOheb6XDQg8ucvo1YlVmAu/Ndy
 6wARnWaLqcUFdtn6yaLRjrKebPysB3gPt/9HXycq/4r9vjbo4XS+cRH4P1VaMt1zgce/Ba
 vCVDOHHxRmQdsj1JGYRmb5X4sJPlYp4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652861852;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OoTMGVjTXMFjqujWft0A9ctd9WVbuIHSWD5PCemQ9gs=;
 b=Gmv3CJLLz4Bs8etjr+5plgvJo965a/5DcRS2F32mUH/4qbnVclBQcqTRvZ+i4Aln816bt+
 WdS4/j0OeLx3NvAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 82026133F5;
 Wed, 18 May 2022 08:17:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VjSmHpyrhGIkZwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 18 May 2022 08:17:32 +0000
Message-ID: <0eef46cf-7678-3774-5736-e6f5f133fcc9@suse.de>
Date: Wed, 18 May 2022 10:17:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 0/5] drm: Ignore non-existing color planes in helpers
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, javierm@redhat.com, noralf@tronnes.org
References: <20220517113327.26919-1-tzimmermann@suse.de>
 <d9d8a396-cb1f-054f-1309-c483dc1724f1@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <d9d8a396-cb1f-054f-1309-c483dc1724f1@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EX7RFOPFSzFasW0TNVJWjZCS"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EX7RFOPFSzFasW0TNVJWjZCS
Content-Type: multipart/mixed; boundary="------------wezJm1IBUwF5c1ocZYzZDcz0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, javierm@redhat.com, noralf@tronnes.org
Cc: dri-devel@lists.freedesktop.org
Message-ID: <0eef46cf-7678-3774-5736-e6f5f133fcc9@suse.de>
Subject: Re: [PATCH v2 0/5] drm: Ignore non-existing color planes in helpers
References: <20220517113327.26919-1-tzimmermann@suse.de>
 <d9d8a396-cb1f-054f-1309-c483dc1724f1@amd.com>
In-Reply-To: <d9d8a396-cb1f-054f-1309-c483dc1724f1@amd.com>

--------------wezJm1IBUwF5c1ocZYzZDcz0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDUuMjIgdW0gMTM6NTYgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0K
PiBBbSAxNy4wNS4yMiB1bSAxMzozMyBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOg0KPj4g
U29tZSBEUk0gaGVscGVycyBhc3N1bWUgdGhhdCBhbGwgcG90ZW50aWFsIGNvbG9yIHBsYW5l
cyBvZiBhIGZyYW1lYnVmZmVyDQo+PiBhcmUgYXZhaWxhYmxlOyBldmVuIGlmIHRoZSBjb2xv
ciBmb3JtYXQgZGlkbid0IHNwZWNpZnkgdGhlbS4gTm9uLWV4aXN0aW5nDQo+PiBwbGFuZXMg
YXJlIHNpbGVudGx5IGlnbm9yZWQuIFRoaXMgYmVoYXZpb3IgaXMgaW5jb25zaXN0ZW50IHdp
dGggb3RoZXINCj4+IGhlbHBlcnMgYW5kIGFwcGFyZW50bHkgbGVhZHMgdG8gc3VidGxlIGJ1
Z3Mgd2l0aCB1bmluaXRpYWxpemVkIEdFTSBidWZmZXINCj4+IG1hcHBpbmdzLiBbMV0NCj4+
DQo+PiBDaGFuZ2UgYWxsIGFmZmVjdGVkIGNvZGUgdG8gbG9vayBhdCB0aGUgZnJhbWVidWZm
ZXIgZm9ybWF0J3MgbnVtYmVyIG9mDQo+PiBjb2xvciBwbGFuZXMgYW5kIG9ubHkgcHJvY2Vz
cyB0aGVzZSBwbGFuZXMuIFRoZSB1cGRhdGUgaGFzIGJlZW4gZGlzY3Vzc2VkDQo+PiBpbiBb
Ml0gYmVmb3JlLg0KPj4NCj4+IFRlc3RlZCB3aXRoIEdFTSBTSE1FTSBoZWxwZXJzIG9uIHNp
bXBsZWRybSBhbmQgd2l0aCBHRU0gVlJBTSBoZWxwZXJzIG9uDQo+PiBhc3QuDQo+IA0KPiBJ
J20gbm90IGRlZXAgZW5vdWdoIGludG8gYWxsIHRoZSBkZXRhaWxzIGZvciBhIGZ1bGwgcmV2
aWV3LCBidXQgZmVlbCANCj4gZnJlZSB0byBhZGQgYW4gQWNrZWQtYnk6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gdG8gDQo+IHRoZSBzZXJpZXMuDQoN
ClRoYW5rcyBhIGxvdC4gSSBjYydlZCB5b3UgYmVjYXVzZSB3ZSByZWNlbnRseSB0YWxrZWQg
YWJvdXQgdGhlIA0KaW5jb25zaXN0ZW50IHVzZSBvZiBudW1fcGxhbmVzIHRocm91Z2hvdXQg
dGhlIERSTSBoZWxwZXJzLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBUaGFu
a3MsDQo+IENocmlzdGlhbi4NCj4gDQo+Pg0KPj4gdjI6DQo+PiDCoMKgwqDCoCogcmVmYWN0
b3IgR0VNIFZSQU0gY29kZSBiZWZvcmUgZml4aW5nIGl0IChKYXZpZXIpDQo+PiDCoMKgwqDC
oCogcHJpbnQgbW9yZSBlcnJvciBpbmZvcm1hdGlvbiBpbiAjMSAoSmF2aWVyKQ0KPj4gwqDC
oMKgwqAqIGNvbW1pdC1tZXNzYWdlIGZpeGVzIChKYXZpZXIpDQo+Pg0KPj4gWzFdIA0KPj4g
aHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0
dHBzJTNBJTJGJTJGbG9yZS5rZXJuZWwub3JnJTJGZHJpLWRldmVsJTJGMjAyMTA3MzAxODM1
MTEuMjAwODAtMS10emltbWVybWFubiU0MHN1c2UuZGUlMkZUJTJGJTIzbWQwMTcyYjEwYmI1
ODhkOGYyMGY0ZjQ1NmUzMDRmMDhkMmE0NTA1ZjcmYW1wO2RhdGE9MDUlN0MwMSU3Q2Nocmlz
dGlhbi5rb2VuaWclNDBhbWQuY29tJTdDYzUxMmE5MmMyMDZmNGFmMDY5MTEwOGRhMzdmOTE1
YTElN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3ODgz
ODQwMjU5MzczNzkxJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdN
REFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMw
MDAlN0MlN0MlN0MmYW1wO3NkYXRhPTZmWFJZJTJCV2xvMUk0N3RjdVJIaWFtQVo5SkdNJTJG
SGFZVGZ5R254TnJxVXRzJTNEJmFtcDtyZXNlcnZlZD0wIA0KPj4NCj4+IFsyXSANCj4+IGh0
dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRw
cyUzQSUyRiUyRmxvcmUua2VybmVsLm9yZyUyRmRyaS1kZXZlbCUyRjg3N2RjMGQ5LWM2YzYt
MDIyYy0yMGQ4LTE0YjMzZTg2MzkzNCU0MHN1c2UuZGUlMkYmYW1wO2RhdGE9MDUlN0MwMSU3
Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdDYzUxMmE5MmMyMDZmNGFmMDY5MTEwOGRh
MzdmOTE1YTElN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdD
NjM3ODgzODQwMjU5MzczNzkxJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0
d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUz
RCU3QzMwMDAlN0MlN0MlN0MmYW1wO3NkYXRhPTZpRll3NUV0UU5hU2lQckhJQWF3Qnc4N2xq
Nk02Nm83ajBBRFkwaXBpZnMlM0QmYW1wO3Jlc2VydmVkPTAgDQo+Pg0KPj4NCj4+IFRob21h
cyBaaW1tZXJtYW5uICg1KToNCj4+IMKgwqAgZHJtL2dlbTogU2hhcmUgY29kZSBiZXR3ZWVu
IGRybV9nZW1fZmJfe2JlZ2luLGVuZH1fY3B1X2FjY2VzcygpDQo+PiDCoMKgIGRybS9nZW06
IElnbm9yZSBjb2xvciBwbGFuZXMgdGhhdCBhcmUgdW51c2VkIGJ5IGZyYW1lYnVmZmVyIGZv
cm1hdA0KPj4gwqDCoCBkcm0vZ2VtLXZyYW06IFNoYXJlIGNvZGUgYmV0d2VlbiBHRU0gVlJB
TSdzIF97cHJlcGFyZSxjbGVhbnVwfV9mYigpDQo+PiDCoMKgIGRybS9nZW0tdnJhbTogSWdu
b3JlIHBsYW5lcyB0aGF0IGFyZSB1bnVzZWQgYnkgZnJhbWVidWZmZXIgZm9ybWF0DQo+PiDC
oMKgIGRybS9nZW06IFdhcm4gb24gdHJ5aW5nIHRvIHVzZSBhIG5vbi1leGlzdGluZyBmcmFt
ZWJ1ZmZlciBwbGFuZQ0KPj4NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2F0b21p
Y19oZWxwZXIuY8KgwqDCoMKgwqAgfMKgwqAgNiArLQ0KPj4gwqAgZHJpdmVycy9ncHUvZHJt
L2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmMgfCAxMDQgKysrKysrKysrLS0tLS0tLS0t
LQ0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuY8KgwqDCoMKg
wqDCoMKgIHzCoCA1NCArKysrKystLS0tDQo+PiDCoCBpbmNsdWRlL2RybS9kcm1fZ2VtX2Zy
YW1lYnVmZmVyX2hlbHBlci5owqDCoMKgwqAgfMKgIDEwICstDQo+PiDCoCA0IGZpbGVzIGNo
YW5nZWQsIDkyIGluc2VydGlvbnMoKyksIDgyIGRlbGV0aW9ucygtKQ0KPj4NCj4gDQoNCi0t
IA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkg
TsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOk
ZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------wezJm1IBUwF5c1ocZYzZDcz0--

--------------EX7RFOPFSzFasW0TNVJWjZCS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKEq5wFAwAAAAAACgkQlh/E3EQov+AD
1A/+KCqJ1DXMYabNEudGQr14hIYtznBQDr9ut9L2cZD+XTmUuTh7a0YHBrdo5IpePxYvKZhD3ssw
L8/VywAMtJBOQCxQXPFZnqzNBvA+5mViKh+abs0Fzaa84+OkYiXHipU5Y211mRyh84i5BLeg0OYz
sRgzWdlu1jiMBZ02AtgbVy9jVJ5ztoaJ3iRwt871VitrditmixXT1vScCYb1QD8/KotHpJtmmrEr
F22Rn6qD+u4w9YwbtG8sPJnu4sHOkP6HTwe6jlmN3GWgIKvgwKbdkPL3mkCala5JbrIBQ32IYMNM
6PLgjyQgen6KXAJzsJRjAQxpiVrkFSpt1UpNbRsTft0KLnnYmtSkxokv5jVLuvZdCSph3KLqpIkY
0uMrQWlmrRmCo6WwCE7z4/HY8u141dKLLus0/BUFn0aW0xJDBfWwwBNlSoQq8kERmTCmOVGZ+cO4
x1NUs/4Wypetzt4w47CBLQVzJccJhQvCPbOs+eQZKiMnkUZ7SJJfNwus2u1kgq+58n4UMhlYfWYy
Zzhc7zbjLpH+PhT/5pydaeoRWVNLDhW+FpKySTUQyvbNU710ejHKxDD+ebsuY4XWcpJce4KSCMxQ
jz+XbgVKBDqyJ14UsfSxq/5YEil6FW80ydbXGN1Djazs/KRT5cyDbC4T1tllM1KY/Ob/WMWum8Qu
NBc=
=f0nO
-----END PGP SIGNATURE-----

--------------EX7RFOPFSzFasW0TNVJWjZCS--

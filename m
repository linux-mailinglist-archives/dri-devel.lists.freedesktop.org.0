Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 788935B68CC
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 09:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CF410E626;
	Tue, 13 Sep 2022 07:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC2910E626
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 07:40:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 125B65BF0D;
 Tue, 13 Sep 2022 07:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663054828; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JsTz0X7fGpir0B6n0DtY1q9W97wUE0wJWjwjVGnT+n0=;
 b=r/81jxGaQTLWQmUvPANCRAlMEM+PDTBcAADMlu5euo7T9ItZCjjE0U8UxFMk77gWTgvDwN
 q8XicqqczGqv1MU8lavcAjjSAyRyYaZBsPZmIlBXkc99uEGHy1v7pKEc1XqIGa7T2hrUV5
 Qk1EnIFWDRBdej6jcTeujtaJ7OpWSKo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663054828;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JsTz0X7fGpir0B6n0DtY1q9W97wUE0wJWjwjVGnT+n0=;
 b=3LJn9WjihzC8Oz2+KclZtbtJoEsAux4ZQ2nhI9Uzmv+1ns0cOR+Im4i9qzIJAKEuugrE8K
 HGz7CRXvPzSt6pCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E3CDA13AB5;
 Tue, 13 Sep 2022 07:40:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MtO8NuszIGMiBQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Sep 2022 07:40:27 +0000
Message-ID: <524253ec-b253-bf69-5fbd-cf23602637e9@suse.de>
Date: Tue, 13 Sep 2022 09:40:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/plane-helper: Add a drm_plane_helper_atomic_check()
 helper
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20220912101522.69482-1-javierm@redhat.com>
 <Yx8Ms2jhgwpiDqA6@intel.com> <c6ce4e99-571b-e046-6f03-ab87bd173869@suse.de>
 <Yx8Vo4x7frhbElPq@intel.com> <4002a4d6-04cb-b342-952f-b42ef3188df4@suse.de>
 <Yx8nXZnTDEwuPEvP@intel.com> <d4c00bb6-03be-0348-6a75-c678608114f1@suse.de>
 <Yx9pij4LmFHrq81V@intel.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Yx9pij4LmFHrq81V@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3X3SXk0VkwpxERO6sYKXLfRy"
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
Cc: David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3X3SXk0VkwpxERO6sYKXLfRy
Content-Type: multipart/mixed; boundary="------------Cs8j4vfe00Jkqxf0qSdBOP0R";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <524253ec-b253-bf69-5fbd-cf23602637e9@suse.de>
Subject: Re: [PATCH] drm/plane-helper: Add a drm_plane_helper_atomic_check()
 helper
References: <20220912101522.69482-1-javierm@redhat.com>
 <Yx8Ms2jhgwpiDqA6@intel.com> <c6ce4e99-571b-e046-6f03-ab87bd173869@suse.de>
 <Yx8Vo4x7frhbElPq@intel.com> <4002a4d6-04cb-b342-952f-b42ef3188df4@suse.de>
 <Yx8nXZnTDEwuPEvP@intel.com> <d4c00bb6-03be-0348-6a75-c678608114f1@suse.de>
 <Yx9pij4LmFHrq81V@intel.com>
In-Reply-To: <Yx9pij4LmFHrq81V@intel.com>

--------------Cs8j4vfe00Jkqxf0qSdBOP0R
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMDkuMjIgdW0gMTk6MTYgc2NocmllYiBWaWxsZSBTeXJqw6Rsw6Q6DQo+
IE9uIE1vbiwgU2VwIDEyLCAyMDIyIGF0IDA0OjIyOjQ5UE0gKzAyMDAsIFRob21hcyBaaW1t
ZXJtYW5uIHdyb3RlOg0KPj4gSGkNCj4+DQo+PiBBbSAxMi4wOS4yMiB1bSAxNDozNCBzY2hy
aWViIFZpbGxlIFN5cmrDpGzDpDoNCj4+PiBPbiBNb24sIFNlcCAxMiwgMjAyMiBhdCAwMjow
NTozNlBNICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+Pj4gSGkNCj4+Pj4N
Cj4+Pj4gQW0gMTIuMDkuMjIgdW0gMTM6MTggc2NocmllYiBWaWxsZSBTeXJqw6Rsw6Q6DQo+
Pj4+PiBPbiBNb24sIFNlcCAxMiwgMjAyMiBhdCAwMTowNTo0NVBNICswMjAwLCBUaG9tYXMg
WmltbWVybWFubiB3cm90ZToNCj4+Pj4+PiBIaQ0KPj4+Pj4+DQo+Pj4+Pj4gQW0gMTIuMDku
MjIgdW0gMTI6NDAgc2NocmllYiBWaWxsZSBTeXJqw6Rsw6Q6DQo+Pj4+Pj4+IE9uIE1vbiwg
U2VwIDEyLCAyMDIyIGF0IDEyOjE1OjIyUE0gKzAyMDAsIEphdmllciBNYXJ0aW5leiBDYW5p
bGxhcyB3cm90ZToNCj4+Pj4+Pj4+IFByb3ZpZGVzIGEgZGVmYXVsdCBwbGFuZSBzdGF0ZSBj
aGVjayBoYW5kbGVyIGZvciBwcmltYXJ5IHBsYW5lcyB0aGF0IGFyZSBhDQo+Pj4+Pj4+PiBm
dWxsc2NyZWVuIHNjYW5vdXQgYnVmZmVyIGFuZCB3aG9zZSBzdGF0ZSBzY2FsZSBhbmQgcG9z
aXRpb24gY2FuJ3QgY2hhbmdlLg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IFRoZXJlIGFyZSBzb21l
IGRyaXZlcnMgdGhhdCBkdXBsaWNhdGUgdGhpcyBsb2dpYyBpbiB0aGVpciBoZWxwZXJzLCBz
dWNoIGFzDQo+Pj4+Pj4+PiBzaW1wbGVkcm0gYW5kIHNzZDEzMHguIEZhY3RvciBvdXQgdGhp
cyBjb21tb24gY29kZSBpbnRvIGEgcGxhbmUgaGVscGVyIGFuZA0KPj4+Pj4+Pj4gbWFrZSBk
cml2ZXJzIHVzZSBpdC4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBTdWdnZXN0ZWQtYnk6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4+Pj4+Pj4gU2lnbmVkLW9m
Zi1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQo+
Pj4+Pj4+PiAtLS0NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiAgICAgIGRyaXZlcnMvZ3B1L2RybS9k
cm1fcGxhbmVfaGVscGVyLmMgfCAyOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0K
Pj4+Pj4+Pj4gICAgICBkcml2ZXJzL2dwdS9kcm0vc29sb21vbi9zc2QxMzB4LmMgIHwgMTgg
Ky0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4+Pj4+PiAgICAgIGRyaXZlcnMvZ3B1L2RybS90aW55
L3NpbXBsZWRybS5jICAgfCAyNSArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4+Pj4+
PiAgICAgIGluY2x1ZGUvZHJtL2RybV9wbGFuZV9oZWxwZXIuaCAgICAgfCAgMiArKw0KPj4+
Pj4+Pj4gICAgICA0IGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDQxIGRlbGV0
aW9ucygtKQ0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX3BsYW5lX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZV9oZWxw
ZXIuYw0KPj4+Pj4+Pj4gaW5kZXggYzc3ODU5NjdmNWJmLi5mYjQxZWVlNzQ2OTMgMTAwNjQ0
DQo+Pj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lX2hlbHBlci5jDQo+
Pj4+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lX2hlbHBlci5jDQo+Pj4+
Pj4+PiBAQCAtMjc4LDMgKzI3OCwzMiBAQCB2b2lkIGRybV9wbGFuZV9oZWxwZXJfZGVzdHJv
eShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSkNCj4+Pj4+Pj4+ICAgICAgCWtmcmVlKHBsYW5l
KTsNCj4+Pj4+Pj4+ICAgICAgfQ0KPj4+Pj4+Pj4gICAgICBFWFBPUlRfU1lNQk9MKGRybV9w
bGFuZV9oZWxwZXJfZGVzdHJveSk7DQo+Pj4+Pj4+PiArDQo+Pj4+Pj4+PiArLyoqDQo+Pj4+
Pj4+PiArICogZHJtX3BsYW5lX2hlbHBlcl9hdG9taWNfY2hlY2soKSAtIEhlbHBlciB0byBj
aGVjayBwcmltYXJ5IHBsYW5lcyBzdGF0ZXMNCj4+Pj4+Pj4+ICsgKiBAcGxhbmU6IHBsYW5l
IHRvIGNoZWNrDQo+Pj4+Pj4+PiArICogQG5ld19zdGF0ZTogcGxhbmUgc3RhdGUgdG8gY2hl
Y2sNCj4+Pj4+Pj4NCj4+Pj4+Pj4gVGhhdCBpcyBub3QgYSBwbGFuZSBzdGF0ZS4gQWxzbyBz
aG91bGQgcy9uZXdfLy8gc2luY2UgaXQncyBqdXN0DQo+Pj4+Pj4+IHRoZSBvdmVyYWxsIGF0
b21pYyBzdGF0ZSB0aGluZyByYXRoZXIgdGhhbiBzb21lIG5ldyBvciBvbGQgc3RhdGUuDQo+
Pj4+Pj4NCj4+Pj4+PiBVc2luZyBvbmx5ICdzdGF0ZScgaXMgbm9uLWludHVpdGl2ZSBhbmQg
aGFzIGxlYWQgdG8gYnVncyB3aGVyZSBzdWItc3RhdGUNCj4+Pj4+PiB3YXMgcmV0cmlldmVk
IGZyb20gdGhlIHdyb25nIHN0YXRlIGluZm9ybWF0aW9uLiBTbyB3ZSd2ZSBiZWVuIHVzaW5n
DQo+Pj4+Pj4gJ25ld19zdGF0ZScgYW5kICdvbGRfc3RhdGUnIGV4cGxpY2l0bHkgaW4gc2V2
ZXJhbCBwbGFjZXMgbm93Lg0KPj4+Pj4NCj4+Pj4+IFRoZXJlIGlzIG5vIG9sZCBvciBuZXcg
ZHJtX2F0b21pY19zdGF0ZS4gSXQgY29udGFpbnMgYm90aC4NCj4+Pj4NCj4+Pj4gSSAodmFn
dWVseSkgcmVtZW1iZXIgYSBidWcgd2hlcmUgYSBkcml2ZXIgdHJpZWQNCj4+Pj4gZHJtX2F0
b21pY19nZXRfbmV3X3BsYW5lX3N0YXRlKCkgd2l0aCB0aGUgKG9sZCkgc3RhdGUgdGhhdCdz
IHBhc3NlZCB0bw0KPj4+PiBhdG9taWNfdXBkYXRlLiBJdCBkaWRuJ3QgcmV0dXJuIHRoZSBl
eHBlY3RlZCByZXN1bHRzIGFuZCBtb2Rlc2V0dGluZw0KPj4+PiBnYXZlIHNsaWdodGx5IHdy
b25nIHJlc3VsdHMuDQo+Pj4NCj4+PiBBcyB0aGVyZSBpcyBubyB3cm9uZyBkcm1fYXRvbWlj
X3N0YXRlIHRvIHBhc3MgSSBkb24ndCB0aGluayBpdCBjb3VsZA0KPj4+IGhhdmUgYmVlbiB0
aGUgY2FzZS4NCj4+Pg0KPj4+PiBTbyB3ZSBiZWdhbiB0byBiZSBtb3JlIHByZWNpc2UgYWJv
dXQgbmV3DQo+Pj4+IGFuZCBvbGQuIEFuZCB3aGF0ZXZlciBpcyBzdG9yZWQgaW4gJ3BsYW5l
LT5zdGF0ZScgaXMgdGhlbiBqdXN0ICd0aGUgc3RhdGUnLg0KPj4+DQo+Pj4gVGhlcmUgd2Vy
ZSBjZXJ0YWlubHkgYSBsb3Qgb2YgY29uZnVzaW9uIGJlZm9yZSB0aGUgZXhwbGljaXQgbmV3
L29sZA0KPj4+IHN0YXRlIHN0dWZmIHdhcyBhZGRlZCB3aGV0aGVyIGZvby0+c3RhdGUvZXRj
LiB3YXMgdGhlIG9sZCBvciB0aGUNCj4+PiBuZXcgc3RhdGUuIEFuZCBsYWJlbGluZyB0aGlu
Z3MgYXMgZXhwbGljaXRseSBvbGQgdnMuIG5ldyB3aGVuIHBhc3NpbmcNCj4+PiBpbiBpbmRp
dmlkdWFsIG9iamVjdCBzdGF0ZXMgY2VydGFpbmx5IG1ha2VzIHNlbnNlLiBCdXQgdGhhdCBk
b2Vzbid0DQo+Pj4gcmVhbGx5IGhhdmUgYW55dGhpbmcgdG8gZG8gd2l0aCBtaXNsYWJlbGlu
ZyB0aGUgb3ZlcmFsbCBkcm1fYXRvbWljX3N0YXRlLg0KPj4+DQo+Pj4+DQo+Pj4+IEkgdW5k
ZXJzdGFuZCB0aGF0IHRoZSBzZW1hbnRpY3Mgb2YgYXRvbWljX2NoZWNrIGFyZSBkaWZmZXJl
bnQgZnJvbQ0KPj4+PiBhdG9taWNfdXBkYXRlLCBidXQgaXQgc3RpbGwgZG9lc24ndCBodXJ0
IHRvIHRhbGsgb2YgbmV3X3N0YXRlIElNSE8uDQo+Pj4NCj4+PiBJTU8gaXQncyBqdXN0IGNv
bmZ1c2luZy4gTWFrZXMgdGhlIHJlYWRlciB0aGluayB0aGVyZSBpcyBzb21laG93DQo+Pj4g
ZGlmZmVyZW50IGRybV9hdG9taWNfc3RhdGVzIGZvciBvbGQgdnMuIG5ldyBzdGF0ZXMgd2hl
biB0aGVyZSBpc24ndC4NCj4+PiBJIGFsc28gd291bGRuJ3QgY2FsbCBpdCBuZXdfc3RhdGUg
Zm9yIC5hdG9taWNfdXBkYXRlKCkgZWl0aGVyLg0KPj4+DQo+Pj4gSW4gYm90aCBjYXNlcyB5
b3UgaGF2ZSB0aGUgb2xkIGFuZCBuZXcgc3RhdGVzIGluIHRoZXJlIGFuZCBob3cNCj4+PiBl
eGFjdGx5IHRoZXkgZ2V0IHVzZWQgaW4gdGhlIGhvb2tzIGlzIG1vcmUgb2YgYW4gaW1wbGVt
ZW50YXRpb24NCj4+PiBkZXRhaWwuIFRoZSBvbmx5IHJ1bGVzIHlvdSB3b3VsZCBoYXZlIHRv
IGZvbGxvdyBpcyB0aGF0IGF0IHRoZQ0KPj4+IGVuZCBvZiAuYXRvbWljX3VwZGF0ZSgpIHRo
ZSBoYXJkd2FyZSBzdGF0ZSBtYXRjaGVzIHRoZSBuZXcgc3RhdGUsDQo+Pj4gYW5kIC5hdG9t
aWNfY2hlY2soKSBtYWtlcyBzdXJlIHRoZSB0cmFuc2l0aW9uIGZyb20gdGhlIG9sZCB0byB0
aGUNCj4+PiBuZXcgc3RhdGUgaXMgcG9zc2libGUuDQo+Pg0KPj4gICBGcm9tIHdoYXQgSSB1
bmRlcnN0YW5kOg0KPj4NCj4+IEluIGF0b21pY19jaGVjaygpLCBwbGFuZS0+c3RhdGUgaXMg
dGhlIGN1cnJlbnQgc3RhdGUgYW5kIHRoZSBzdGF0ZQ0KPj4gYXJndW1lbnQgaXMgdGhlIHN0
YXRlIHRvIGJlIHZhbGlkYXRlZC4gQ2FsbGluZw0KPj4gZHJtX2F0b21pY19nZXRfbmV3X3Bs
YW5lX3N0YXRlKCkgd2lsbCByZXR1cm4gdGhlIHBsYW5lJ3MgbmV3IHN0YXRlLg0KPiANCj4g
WW91IHNob3VsZCBwcmV0dHkgbXVjaCBuZXZlciB1c2UgcGxhbmUtPnN0YXRlIGFueXdoZXJl
LiBKdXN0IHVzZQ0KPiBkcm1fYXRvbWljX2dldF97LG9sZCxuZXd9X3BsYW5lX3N0YXRlKCkg
JiBjby4gT3V0c2lkZSBvZiBleGNlcHRpb25hbA0KPiBjYXNlcyBwbGFuZS0+c3RhdGUgc2hv
dWxkIG9ubHkgYmUgYWNjZXNzZWQgYnkgZHVwbGljYXRlX3N0YXRlKCkNCj4gYW5kIHN3YXBf
c3RhdGUoKS4NCj4gDQo+Pg0KPj4gSWYgeW91IGNhbGwgZHJtX2F0b21pY19nZXRfb2xkX3Bs
YW5lX3N0YXRlKCkgZnJvbSBhdG9taWNfY2hlY2soKSwgd2hhdA0KPj4gd2lsbCBpdCByZXR1
cm4/DQo+IA0KPiBCZWZvcmUgc3dhcCBzdGF0ZToNCj4gLSBkcm1fYXRvbWljX2dldF9vbGRf
cGxhbmVfc3RhdGUoKSBwb2ludHMgdG8gdGhlIHNhbWUgdGhpbmcNCj4gICAgYXMgcGxhbmUt
PnN0YXRlLCBvciBOVUxMIGlmIHRoZSBwbGFuZSBpcyBub3QgcGFydCBvZiB0aGUNCj4gICAg
ZHJtX2F0b21pY19zdGF0ZQ0KPiAtIGRybV9hdG9taWNfZ2V0X25ld19wbGFuZV9zdGF0ZSgp
IHBvaW50cyB0byB0aGUgbmV3bHkNCj4gICAgZHVwbGljYXRlZCBzdGF0ZSBvbmx5IHRyYWNr
ZWQgd2l0aGluIGRybV9hdG9taWNfc3RhdGUsDQo+ICAgIG9yIE5VTEwgaWYgdGhlIHBsYW5l
IGlzIG5vdCBwYXJ0IG9mIHRoZSBkcm1fYXRvbWljX3N0YXRlDQo+IA0KPiBBZnRlciBzd2Fw
IHN0YXRlOg0KPiAtIGRybV9hdG9taWNfZ2V0X29sZF9wbGFuZV9zdGF0ZSgpIHN0aWxsIHBv
aW50cyB0byB0aGUgc2FtZQ0KPiAgICB0aGluZyBhcyBiZWZvcmUsIGV2ZW4gdGhvdWdoIHBs
YW5lLT5zdGF0ZSBubyBsb25nZXIgcG9pbnRzIHRoZXJlLg0KPiAgICBUaGlzIG9sZCBzdGF0
ZSBpcyBubyBsb25nZXIgdmlzaWJsZSBvdXRzaWRlIHRoZSBkcm1fYXRvbWljX3N0YXRlDQo+
ICAgIGFuZCB3aWxsIGdldCBkZXN0b3llZCB3aGVuIHRoZSBkcm1fYXRvbWljX3N0YXRlIGdl
dHMgbnVrZWQNCj4gICAgb25jZSB0aGUgY29tbWl0IGhhcyBiZWVuIGRvbmUNCj4gLSBkcm1f
YXRvbWljX2dldF9uZXdfcGxhbmVfc3RhdGUoKSBzdGlsbCBwb2ludHMgdG8gdGhlIHNhbWUN
Cj4gICAgdGhpbmcgYXMgYmVmb3JlLCBhbmQgbm93IHBsYW5lLT5zdGF0ZSBhbHNvIHBvaW50
cyB0byBpdA0KDQpUaGlzIGlzIGV4YWN0bHkgd2hhdCBJIGFsd2F5cyBhc3N1bWVkLCBidXQg
SSByZW1lbWJlciBmaW5kaW5nIGEgDQpzaXR1YXRpb24gd2hlcmUgdGhpcyBkaWRuJ3Qgd29y
ayBhcyBleHBlY3RlZC4gKElmIG9ubHkgSSBjb3VsZCBmaW5kIGl0IA0KYWdhaW4uKSBBbnl3
YXksIGFzIGl0J3Mgc3VwcG9zZWQgdG8gYmUgdGhlIGNvcnJlY3QgbGV0J3MgZG8gZXhhY3Rs
eSB0aGlzLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBCdXQgYWxsIHlvdSBy
ZWFsbHkgbmVlZCB0byBrbm93IGlzIHlvdSBoYXZlIGEgdHJhbnNhY3Rpb24NCj4gKGRybV9h
dG9taWNfc3RhdGUpIGFuZCBlYWNoIG9iamVjdCB0YWtpbmcgcGFydCBpbiBpdA0KPiB3aWxs
IGhhdmUgYW4gb2xkIHN0YXRlICg9IHRoZSBvYmplY3QncyBzdGF0ZSBiZWZvcmUgdGhlDQo+
IHRyYW5zYWN0aW9uIGhhcyBiZWVuIGNvbW1pdGVkKSwgYW5kIG5ldyBzdGF0ZSAoPSB0aGUg
b2JqZWN0J3MNCj4gc3RhdGUgYWZ0ZXIgdGhlIHRyYW5zYWN0aW9uIGhhcyBiZWVuIGNvbW1p
dGVkKS4NCj4gDQo+Pg0KPj4gSW4gYXRvbWljX3VwZGF0ZSgpIHBsYW5lLT5zdGF0ZSBpcyB0
aGUgc3RhdGUgdG8gYmUgY29tbWl0dGVkIGFuZCB0aGUNCj4+IHN0YXRlIGFyZ3VtZW50IGlz
IHRoZSBvbGQgc3RhdGUgYmVmb3JlIHRoZSBzdGFydCBvZiB0aGUgYXRvbWljIGNvbW1pdC4N
Cj4+IEFuZCBjYWxsaW5nIGRybV9hdG9taWNfZ2V0X25ld19wbGFuZV9zdGF0ZSgpIHdpbGwg
Km5vdCogdGhlIHJldHVybiB0aGUNCj4+IHBsYW5lJ3MgbmV3IHN0YXRlIChpLmUuLCB0aGUg
b25lIGluIHBsYW5lLT5zdGF0ZSkgSUlSQy4gKEFzIEkgbWVudGlvbmVkLA0KPj4gdGhlcmUg
d2FzIGEgcmVsYXRlZCBidWcgaW4gb25lIG9mIHRoZSBkcml2ZXJzLikgU28gd2UgYmVnYW4g
dG8gY2FsbCB0aGlzDQo+PiAnb2xkX3N0YXRlJy4NCj4+DQo+PiBNeSBwb2ludCBpczogdGhl
IHN0YXRlIHBhc3NlZCB0byB0aGUgY2hlY2sgYW5kIGNvbW1pdCBmdW5jdGlvbnMgYXJlDQo+
PiBkaWZmZXJlbnQgdGhpbmdzLCBldmVuIHRob3VnaCB0aGV5IGFwcGVhciB0byBiZSB0aGUg
c2FtZS4NCj4+DQo+Pj4NCj4+PiBJJ3ZlIHByb3Bvc2VkIHJlbmFtaW5nIGRybV9hdG9taWNf
c3RhdGUgdG8gZWcuIGRybV9hdG9taWNfdHJhbnNhY3Rpb24NCj4+PiBhIGZldyB0aW1lcyBi
ZWZvcmUgYnV0IG5vIG9uZSB0b29rIHRoZSBiYWl0IHNvIGZhci4uLg0KPj4+DQo+Pg0KPj4g
SWYgeW91IHJlYWxseSBkb24ndCBsaWtlIG5ld19zdGF0ZSwgdGhlbiBsZXQncyBjYWxsIGl0
IHN0YXRlX3R4Lg0KPj4NCj4+IEJlc3QgcmVnYXJkcw0KPj4gVGhvbWFzDQo+Pg0KPj4NCj4+
IC0tIA0KPj4gVGhvbWFzIFppbW1lcm1hbm4NCj4+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9w
ZXINCj4+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KPj4gTWF4ZmVs
ZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQo+PiAoSFJCIDM2ODA5LCBBRyBO
w7xybmJlcmcpDQo+PiBHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo+IA0KPiANCj4g
DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIu
IDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJn
KQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------Cs8j4vfe00Jkqxf0qSdBOP0R--

--------------3X3SXk0VkwpxERO6sYKXLfRy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMgM+sFAwAAAAAACgkQlh/E3EQov+Bo
kA//RyGPV7L68kZA8o69Yc19KomdxBah73adAmmViwZUGyqpEz9wCKVbrxT50SM5b9JjglpHGKun
XC5vvYdPJz1eCcfW759aRBmZiSJIDOELfMJqce52Btpkvs9miW1FVy9XD9dC6BgBQ+N39imsEB6q
1ls8wfMfMPtdhYSPlStFLK0f9+mFyT/xZAEfoNIfYowNx0AzFlhjZJbyl66jxjBmNqS4h0gvz0+e
hkyoeV8NNDsBUg/64qMjpuM+RWqG2sXUlbnH7ISKVvX1/Pd6tPFWEUwtH3HK8uO20a8LnEDzmNra
/MskuKaOyDpS0KMQckgHRTLVWWOWdsz443x4JE0cYMbEmVw86q2iPnz6XdowatZB3Zau+JP4lDWn
fFGkxdbi/lqlF5CDfAzzl+SpdRJvZTK6if0GUb6Bsyrd9jKgPw1sNEQLkKuZ9D5v6AlG+mEv/lxd
rXmoKXH2Sxs8MPovtkPYsN5YFSMKn/EOP9ez9e8TvRZAauT0rMAyf1Csch3Wg8PATc8Yz1c19fvV
/xe80Jm6G1sbhFGLqjD+qEzIoWC7HwydmiOv/fnsTEUIPbpr+CTgzOZJWG9ZVEa/5EVNUKuYkw3S
NpkUEBL04ecflAW3iXE/Sy2rWF/PS1ggPzYjFtKCSWV/zKjyrB8edysDY45AOCVci1c7SLrhaWcQ
17Q=
=Zsi0
-----END PGP SIGNATURE-----

--------------3X3SXk0VkwpxERO6sYKXLfRy--

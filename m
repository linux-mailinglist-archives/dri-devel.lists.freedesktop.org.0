Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3725A70BB49
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 13:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F85010E2CC;
	Mon, 22 May 2023 11:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA9010E2C8;
 Mon, 22 May 2023 11:13:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 137311FE5A;
 Mon, 22 May 2023 11:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684753979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NHJ/DJDhtkWk+ZGEgdNuJP8EJ2MW5HvMyhotu5wmi7s=;
 b=wWrQN1wrUqq9EB9axF0nBb/M1PrjK3YNn+D3lHUOYsKpJer4U+h3fh5Mekf8CXoqSdBePy
 O/X5n1Wx1LySg+J8QPJZ78utAjFRVJKZYy1TFStl5gW7vTYZ8fgDrqSCpqnhOeMYYxs3kn
 G+R0nuzwbYLfL+a2QUOup7/FH1wXdqg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684753979;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NHJ/DJDhtkWk+ZGEgdNuJP8EJ2MW5HvMyhotu5wmi7s=;
 b=sN20CfiZWMXgOGZzX+F5CPe7z50Etu2yDLV3f3rz3Clfe3e5ztHdcNI8DmCfV0+VPsfS6H
 b1xsmp4ZCJ6foICA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D5D3F13336;
 Mon, 22 May 2023 11:12:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ddMyMzpOa2TDLwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 22 May 2023 11:12:58 +0000
Message-ID: <f88260fe-9d86-1489-96a3-8d2dfbf8e4da@suse.de>
Date: Mon, 22 May 2023 13:12:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] drm: fix drmm_mutex_init()
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20230519090733.489019-1-matthew.auld@intel.com>
 <3a7ff212-eda8-1196-3009-0fce68dda7aa@suse.de>
 <b32e9dc2-c450-52aa-12fa-7bc8b207aba4@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <b32e9dc2-c450-52aa-12fa-7bc8b207aba4@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------r0LUhOe8DMvCDT3KleiwJ0Ti"
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, Sarah Walker <sarah.walker@imgtec.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------r0LUhOe8DMvCDT3KleiwJ0Ti
Content-Type: multipart/mixed; boundary="------------s1vWMMVAQlGnTjOJqSa4pboh";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, Sarah Walker
 <sarah.walker@imgtec.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Message-ID: <f88260fe-9d86-1489-96a3-8d2dfbf8e4da@suse.de>
Subject: Re: [PATCH v2] drm: fix drmm_mutex_init()
References: <20230519090733.489019-1-matthew.auld@intel.com>
 <3a7ff212-eda8-1196-3009-0fce68dda7aa@suse.de>
 <b32e9dc2-c450-52aa-12fa-7bc8b207aba4@intel.com>
In-Reply-To: <b32e9dc2-c450-52aa-12fa-7bc8b207aba4@intel.com>

--------------s1vWMMVAQlGnTjOJqSa4pboh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDIyLjA1LjIzIHVtIDExOjUwIHNjaHJpZWIgTWF0dGhldyBBdWxkOg0KPiBPbiAy
Mi8wNS8yMDIzIDEwOjQzLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IEhpDQo+Pg0K
Pj4gQW0gMTkuMDUuMjMgdW0gMTE6MDcgc2NocmllYiBNYXR0aGV3IEF1bGQ6DQo+Pj4gSW4g
bXV0ZXhfaW5pdCgpIGxvY2tkZXAgaWRlbnRpZmllcyBhIGxvY2sgYnkgZGVmaW5pbmcgYSBz
cGVjaWFsIHN0YXRpYw0KPj4+IGtleSBmb3IgZWFjaCBsb2NrIGNsYXNzLiBIb3dldmVyIGlm
IHdlIHdyYXAgdGhlIG1hY3JvIGluIGEgZnVuY3Rpb24sDQo+Pj4gbGlrZSBpbiBkcm1tX211
dGV4X2luaXQoKSwgd2UgZW5kIHVwIGdlbmVyYXRpbmc6DQo+Pj4NCj4+PiBpbnQgZHJtbV9t
dXRleF9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBtdXRleCAqbG9jaykN
Cj4+PiB7DQo+Pj4gwqDCoMKgwqDCoMKgIHN0YXRpYyBzdHJ1Y3QgbG9ja19jbGFzc19rZXkg
X19rZXk7DQo+Pj4NCj4+PiDCoMKgwqDCoMKgwqAgX19tdXRleF9pbml0KChsb2NrKSwgImxv
Y2siLCAmX19rZXkpOw0KPj4+IMKgwqDCoMKgwqDCoCAuLi4uDQo+Pj4gfQ0KPj4+DQo+Pj4g
VGhlIHN0YXRpYyBfX2tleSBoZXJlIGlzIHdoYXQgbG9ja2RlcCB1c2VzIHRvIGlkZW50aWZ5
IHRoZSBsb2NrIGNsYXNzLA0KPj4+IGhvd2V2ZXIgc2luY2UgdGhpcyBpcyBqdXN0IGEgbm9y
bWFsIGZ1bmN0aW9uIHRoZSBrZXkgaGVyZSB3aWxsIGJlDQo+Pj4gY3JlYXRlZCBvbmNlLCB3
aGVyZSBhbGwgY2FsbGVycyB0aGVuIHVzZSB0aGUgc2FtZSBrZXkuIEluIGVmZmVjdCB0aGUN
Cj4+PiBtdXRleC0+ZGVwbWFwLmtleSB3aWxsIGJlIHRoZSBzYW1lIHBvaW50ZXIgZm9yIGRp
ZmZlcmVudA0KPj4+IGRybW1fbXV0ZXhfaW5pdCgpIGNhbGxlcnMuIFRoaXMgdGhlbiByZXN1
bHRzIGluIGltcG9zc2libGUgbG9ja2RlcA0KPj4+IHNwbGF0cyBzaW5jZSBsb2NrZGVwIHRo
aW5rcyBjb21wbGV0ZWx5IHVucmVsYXRlZCBsb2NrcyBhcmUgdGhlIHNhbWUgbG9jaw0KPj4+
IGNsYXNzLg0KPj4+DQo+Pj4gVG8gZml4IHRoaXMgdHVybiBkcm1tX211dGV4X2luaXQoKSBp
bnRvIGEgbWFjcm8gc3VjaCB0aGF0IGl0IGdlbmVyYXRlcyBhDQo+Pj4gZGlmZmVyZW50ICJz
dGF0aWMgc3RydWN0IGxvY2tfY2xhc3Nfa2V5IF9fa2V5IiBmb3IgZWFjaCBpbnZvY2F0aW9u
LA0KPj4+IHdoaWNoIGxvb2tzIHRvIGJlIGlubGluZSB3aXRoIHdoYXQgbXV0ZXhfaW5pdCgp
IHdhbnRzLg0KPj4+DQo+Pj4gdjI6DQo+Pj4gwqDCoCAtIFJldmFtcCB0aGUgY29tbWl0IG1l
c3NhZ2Ugd2l0aCBjbGVhcmVyIGV4cGxhbmF0aW9uIG9mIHRoZSBpc3N1ZS4NCj4+PiDCoMKg
IC0gUmF0aGVyIGV4cG9ydCBfX2RybW1fbXV0ZXhfcmVsZWFzZSgpIHRoYW4gc3RhdGljIGlu
bGluZS4NCj4+Pg0KPj4+IFJlcG9ydGVkLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFz
LmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQo+Pj4gUmVwb3J0ZWQtYnk6IFNhcmFoIFdh
bGtlciA8c2FyYWgud2Fsa2VyQGltZ3RlYy5jb20+DQo+Pj4gRml4ZXM6IGUxM2YxM2UwMzlk
YyAoImRybTogQWRkIERSTS1tYW5hZ2VkIG11dGV4X2luaXQoKSIpDQo+Pj4gQ2M6IFN0YW5p
c2xhdyBHcnVzemthIDxzdGFuaXNsYXcuZ3J1c3prYUBsaW51eC5pbnRlbC5jb20+DQo+Pj4g
Q2M6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+DQo+
Pj4gQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4+IENj
OiBKb2NlbHluIEZhbGVtcGUgPGpmYWxlbXBlQHJlZGhhdC5jb20+DQo+Pj4gQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+DQo+Pj4gQ2M6IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+PiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEF1bGQg
PG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+Pg0KPj4gQWNrZWQtYnk6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4NCj4+IFNoYWxsIEkgYWRkIHRoZSBw
YXRjaCB0byBkcm0tbWlzYy1maXhlcz8NCj4gDQo+IFllcywgcGxlYXNlIGRvLiBUaGFua3Mu
DQoNCk1lcmdlZC4gVGhhbmtzIGZvciB0aGUgcGF0Y2guDQoNCj4gDQo+Pg0KPj4gQmVzdCBy
ZWdhcmRzDQo+PiBUaG9tYXMNCj4+DQo+Pj4gLS0tDQo+Pj4gwqAgZHJpdmVycy9ncHUvZHJt
L2RybV9tYW5hZ2VkLmMgfCAyMiArKy0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4gwqAgaW5j
bHVkZS9kcm0vZHJtX21hbmFnZWQuaMKgwqDCoMKgIHwgMTggKysrKysrKysrKysrKysrKyst
DQo+Pj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlv
bnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21hbmFn
ZWQuYyANCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWFuYWdlZC5jDQo+Pj4gaW5kZXgg
NGNmMjE0ZGU1MGM0Li5jMjFjM2Y2MjMwMzMgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9tYW5hZ2VkLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21h
bmFnZWQuYw0KPj4+IEBAIC0yNjQsMjggKzI2NCwxMCBAQCB2b2lkIGRybW1fa2ZyZWUoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCANCj4+PiAqZGF0YSkNCj4+PiDCoCB9DQo+Pj4g
wqAgRVhQT1JUX1NZTUJPTChkcm1tX2tmcmVlKTsNCj4+PiAtc3RhdGljIHZvaWQgZHJtbV9t
dXRleF9yZWxlYXNlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKnJlcykNCj4+PiAr
dm9pZCBfX2RybW1fbXV0ZXhfcmVsZWFzZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lk
ICpyZXMpDQo+Pj4gwqAgew0KPj4+IMKgwqDCoMKgwqAgc3RydWN0IG11dGV4ICpsb2NrID0g
cmVzOw0KPj4+IMKgwqDCoMKgwqAgbXV0ZXhfZGVzdHJveShsb2NrKTsNCj4+PiDCoCB9DQo+
Pj4gLQ0KPj4+IC0vKioNCj4+PiAtICogZHJtbV9tdXRleF9pbml0IC0gJmRybV9kZXZpY2Ut
bWFuYWdlZCBtdXRleF9pbml0KCkNCj4+PiAtICogQGRldjogRFJNIGRldmljZQ0KPj4+IC0g
KiBAbG9jazogbG9jayB0byBiZSBpbml0aWFsaXplZA0KPj4+IC0gKg0KPj4+IC0gKiBSZXR1
cm5zOg0KPj4+IC0gKiAwIG9uIHN1Y2Nlc3MsIG9yIGEgbmVnYXRpdmUgZXJybm8gY29kZSBv
dGhlcndpc2UuDQo+Pj4gLSAqDQo+Pj4gLSAqIFRoaXMgaXMgYSAmZHJtX2RldmljZS1tYW5h
Z2VkIHZlcnNpb24gb2YgbXV0ZXhfaW5pdCgpLiBUaGUgDQo+Pj4gaW5pdGlhbGl6ZWQNCj4+
PiAtICogbG9jayBpcyBhdXRvbWF0aWNhbGx5IGRlc3Ryb3llZCBvbiB0aGUgZmluYWwgZHJt
X2Rldl9wdXQoKS4NCj4+PiAtICovDQo+Pj4gLWludCBkcm1tX211dGV4X2luaXQoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IG11dGV4ICpsb2NrKQ0KPj4+IC17DQo+Pj4gLcKg
wqDCoCBtdXRleF9pbml0KGxvY2spOw0KPj4+IC0NCj4+PiAtwqDCoMKgIHJldHVybiBkcm1t
X2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LCBkcm1tX211dGV4X3JlbGVhc2UsIGxvY2spOw0K
Pj4+IC19DQo+Pj4gLUVYUE9SVF9TWU1CT0woZHJtbV9tdXRleF9pbml0KTsNCj4+PiArRVhQ
T1JUX1NZTUJPTChfX2RybW1fbXV0ZXhfcmVsZWFzZSk7DQo+Pj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvZHJtL2RybV9tYW5hZ2VkLmggYi9pbmNsdWRlL2RybS9kcm1fbWFuYWdlZC5oDQo+
Pj4gaW5kZXggMzU5ODgzOTQyNjEyLi5hZDA4ZjgzNGFmNDAgMTAwNjQ0DQo+Pj4gLS0tIGEv
aW5jbHVkZS9kcm0vZHJtX21hbmFnZWQuaA0KPj4+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9t
YW5hZ2VkLmgNCj4+PiBAQCAtMTA1LDYgKzEwNSwyMiBAQCBjaGFyICpkcm1tX2tzdHJkdXAo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgY29uc3QgDQo+Pj4gY2hhciAqcywgZ2ZwX3QgZ2Zw
KTsNCj4+PiDCoCB2b2lkIGRybW1fa2ZyZWUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9p
ZCAqZGF0YSk7DQo+Pj4gLWludCBkcm1tX211dGV4X2luaXQoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwgc3RydWN0IG11dGV4ICpsb2NrKTsNCj4+PiArdm9pZCBfX2RybW1fbXV0ZXhfcmVs
ZWFzZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpyZXMpOw0KPj4+ICsNCj4+PiAr
LyoqDQo+Pj4gKyAqIGRybW1fbXV0ZXhfaW5pdCAtICZkcm1fZGV2aWNlLW1hbmFnZWQgbXV0
ZXhfaW5pdCgpDQo+Pj4gKyAqIEBkZXY6IERSTSBkZXZpY2UNCj4+PiArICogQGxvY2s6IGxv
Y2sgdG8gYmUgaW5pdGlhbGl6ZWQNCj4+PiArICoNCj4+PiArICogUmV0dXJuczoNCj4+PiAr
ICogMCBvbiBzdWNjZXNzLCBvciBhIG5lZ2F0aXZlIGVycm5vIGNvZGUgb3RoZXJ3aXNlLg0K
Pj4+ICsgKg0KPj4+ICsgKiBUaGlzIGlzIGEgJmRybV9kZXZpY2UtbWFuYWdlZCB2ZXJzaW9u
IG9mIG11dGV4X2luaXQoKS4gVGhlIA0KPj4+IGluaXRpYWxpemVkDQo+Pj4gKyAqIGxvY2sg
aXMgYXV0b21hdGljYWxseSBkZXN0cm95ZWQgb24gdGhlIGZpbmFsIGRybV9kZXZfcHV0KCku
DQo+Pj4gKyAqLw0KPj4+ICsjZGVmaW5lIGRybW1fbXV0ZXhfaW5pdChkZXYsIGxvY2spICh7
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+
PiArwqDCoMKgIG11dGV4X2luaXQobG9jayk7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4+ICvCoMKgwqAgZHJtbV9hZGRf
YWN0aW9uX29yX3Jlc2V0KGRldiwgX19kcm1tX211dGV4X3JlbGVhc2UsIA0KPj4+IGxvY2sp
O8KgwqDCoMKgwqDCoMKgwqAgXA0KPj4+ICt9KcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFwNCj4+PiDCoCAjZW5kaWYNCj4+DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdG
OiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1v
ZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------s1vWMMVAQlGnTjOJqSa4pboh--

--------------r0LUhOe8DMvCDT3KleiwJ0Ti
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRrTjoFAwAAAAAACgkQlh/E3EQov+Bt
2g//TNN++xE6UxJcR+BWbxUmbeYQf7JrjARnkRoxtzMG7eAzEld1G6+ajdWeU1o5UrgobsdMqht3
DdEAt/UOtypzF9oWuDSMTewolSIunblCxFXbhXth70h1CisDQRWfuMvmn2ZOJk16C+LGwTXcWGJ1
Tt7Jnp0LjV2ETrmxSXNcN/C7FQm59c4c2TJTI6DRf4m5oHaS6968WZ03Tr6iAep6+0wV6kdGFek+
N/Z71m8Gr9zPYG7VgT+9EOtB8NcM4EzO0jPy1+P+GLTR1NHFVzGDemKh/ytX9DGvcmNno+WVv7j0
VrxEw/fst2pMGWbeMXXq/fBxREQ2cMknxFw4bsQsRgk6tCwVQPRbG8sHKjU6y6YQ/98G+xP1298s
ne1r+KOW7jBprqtHYNNWNf3f7v+8jdUjRXwCC3HBpUmi1pa0dma4+w7f1JB5R9OGuiCNuG3jk5lc
u4YFbwPtmXwCXwE9nOOrYByZmvqnpYuMo0WsuTJsUu44Sob3tV5NNwxI9z/evVmeFMdxQ7I/U5Ma
sjSe8WDtyrH0JqG2Vz7HSnzSZd5CMV/O1vQ8pwsPxnVu4IKMyECRlMrg7917r5VJJ3TjZ71Bx+Ix
g73LnTGG4rPR1guZAMkXtlNn+Bq4PU+d5M74PSHu4y+EKPzdG/caaqDkx5D7G1kYp5/SvjZqwD8k
NB4=
=DeoS
-----END PGP SIGNATURE-----

--------------r0LUhOe8DMvCDT3KleiwJ0Ti--

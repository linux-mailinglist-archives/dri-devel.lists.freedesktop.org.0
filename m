Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9118C49F503
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 09:15:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5E210FDE8;
	Fri, 28 Jan 2022 08:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098A110FDE3;
 Fri, 28 Jan 2022 08:15:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 79FF421100;
 Fri, 28 Jan 2022 08:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643357745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v7lx9USLaP9NqVtXbKYtbPVvqqu2Rlzun880eNUsVzM=;
 b=PJ66mx+BBXlPCCsExE3ZFRYvqDYwkPXANH8yFmAVxtn7hdN2U9oD/97b7iH0ITZyMTQnDJ
 0n0YF436Z5BoI6mHrnNeumPLGwNm+TXmNOhl2rU4GI0lEhmSW9gNF3HgUX27PPmI4qUeXo
 lSvminaWIBqcm1e0rXmAJM5XuKohZqU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643357745;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v7lx9USLaP9NqVtXbKYtbPVvqqu2Rlzun880eNUsVzM=;
 b=cnLIHl1DuXQzqQmU9TKsr20vez27Cmq38jcdDymSwW/uJqFu3NG//QoqPNaEGYlGVH5reN
 2Pxf5BzgibPGa2Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4D122139C4;
 Fri, 28 Jan 2022 08:15:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3ZHPETGm82HAVgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Jan 2022 08:15:45 +0000
Message-ID: <f033228e-c914-efb0-534c-41fc3344f272@suse.de>
Date: Fri, 28 Jan 2022 09:15:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH 02/19] dma-buf-map: Add helper to initialize
 second map
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-3-lucas.demarchi@intel.com>
 <b7a3fe1d-3b85-cb7e-19cf-1611ff4f3c9e@suse.de>
 <20220127155913.vt7a74zmsglghzom@ldmartin-desk2>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220127155913.vt7a74zmsglghzom@ldmartin-desk2>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------z0Jm9qzAdckLTdSmXFQL57jX"
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------z0Jm9qzAdckLTdSmXFQL57jX
Content-Type: multipart/mixed; boundary="------------0SjZIcwgEq0qjev9gHgtiNGF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Message-ID: <f033228e-c914-efb0-534c-41fc3344f272@suse.de>
Subject: Re: [Intel-gfx] [PATCH 02/19] dma-buf-map: Add helper to initialize
 second map
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-3-lucas.demarchi@intel.com>
 <b7a3fe1d-3b85-cb7e-19cf-1611ff4f3c9e@suse.de>
 <20220127155913.vt7a74zmsglghzom@ldmartin-desk2>
In-Reply-To: <20220127155913.vt7a74zmsglghzom@ldmartin-desk2>

--------------0SjZIcwgEq0qjev9gHgtiNGF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjcuMDEuMjIgdW0gMTY6NTkgc2NocmllYiBMdWNhcyBEZSBNYXJjaGk6DQo+
IE9uIFRodSwgSmFuIDI3LCAyMDIyIGF0IDAzOjMzOjEyUE0gKzAxMDAsIFRob21hcyBaaW1t
ZXJtYW5uIHdyb3RlOg0KPj4NCj4+DQo+PiBBbSAyNi4wMS4yMiB1bSAyMTozNiBzY2hyaWVi
IEx1Y2FzIERlIE1hcmNoaToNCj4+PiBXaGVuIGRtYV9idWZfbWFwIHN0cnVjdCBpcyBwYXNz
ZWQgYXJvdW5kLCBpdCdzIHVzZWZ1bCB0byBiZSBhYmxlIHRvDQo+Pj4gaW5pdGlhbGl6ZSBh
IHNlY29uZCBtYXAgdGhhdCB0YWtlcyBjYXJlIG9mIHJlYWRpbmcvd3JpdGluZyB0byBhbiBv
ZmZzZXQNCj4+PiBvZiB0aGUgb3JpZ2luYWwgbWFwLg0KPj4+DQo+Pj4gQWRkIGEgaGVscGVy
IHRoYXQgY29waWVzIHRoZSBzdHJ1Y3QgYW5kIGFkZCB0aGUgb2Zmc2V0IHRvIHRoZSBwcm9w
ZXINCj4+PiBhZGRyZXNzLg0KPj4+DQo+Pj4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vt
d2FsQGxpbmFyby5vcmc+DQo+Pj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4NCj4+PiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnDQo+
Pj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+PiBDYzogbGluYXJv
LW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnDQo+Pj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcNCj4+PiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRl
bWFyY2hpQGludGVsLmNvbT4NCj4+PiAtLS0NCj4+PiDCoGluY2x1ZGUvbGludXgvZG1hLWJ1
Zi1tYXAuaCB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4gwqAxIGZp
bGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvbGludXgvZG1hLWJ1Zi1tYXAuaCBiL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi1tYXAu
aA0KPj4+IGluZGV4IDY1ZTkyN2Q5Y2UzMy4uMzUxNGE4NTlmNjI4IDEwMDY0NA0KPj4+IC0t
LSBhL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi1tYXAuaA0KPj4+ICsrKyBiL2luY2x1ZGUvbGlu
dXgvZG1hLWJ1Zi1tYXAuaA0KPj4+IEBAIC0xMzEsNiArMTMxLDM1IEBAIHN0cnVjdCBkbWFf
YnVmX21hcCB7DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoCAuaXNfaW9tZW0gPSBmYWxzZSwgXA0K
Pj4+IMKgwqDCoMKgIH0NCj4+PiArLyoqDQo+Pj4gKyAqIERNQV9CVUZfTUFQX0lOSVRfT0ZG
U0VUIC0gSW5pdGlhbGl6ZXMgc3RydWN0IGRtYV9idWZfbWFwIGZyb20gDQo+Pj4gYW5vdGhl
ciBkbWFfYnVmX21hcA0KPj4+ICsgKiBAbWFwXzrCoMKgwqAgVGhlIGRtYS1idWYgbWFwcGlu
ZyBzdHJ1Y3R1cmUgdG8gY29weSBmcm9tDQo+Pj4gKyAqIEBvZmZzZXQ6wqDCoMKgIE9mZnNl
dCB0byBhZGQgdG8gdGhlIG90aGVyIG1hcHBpbmcNCj4+PiArICoNCj4+PiArICogSW5pdGlh
bGl6ZXMgYSBuZXcgZG1hX2J1Zl9zdHJ1Y3QgYmFzZWQgb24gYW5vdGhlci4gVGhpcyBpcyB0
aGUgDQo+Pj4gZXF1aXZhbGVudCBvZiBkb2luZzoNCj4+PiArICoNCj4+PiArICogLi4gY29k
ZS1ibG9jazogYw0KPj4+ICsgKg0KPj4+ICsgKsKgwqDCoCBkbWFfYnVmX21hcCBtYXAgPSBv
dGhlcl9tYXA7DQo+Pj4gKyAqwqDCoMKgIGRtYV9idWZfbWFwX2luY3IoJm1hcCwgJm9mZnNl
dCk7DQo+Pj4gKyAqDQo+Pj4gKyAqIEV4YW1wbGUgdXNhZ2U6DQo+Pj4gKyAqDQo+Pj4gKyAq
IC4uIGNvZGUtYmxvY2s6IGMNCj4+PiArICoNCj4+PiArICrCoMKgwqAgdm9pZCBmb28oc3Ry
dWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZG1hX2J1Zl9tYXAgKmJhc2VfbWFwKQ0KPj4+ICsg
KsKgwqDCoCB7DQo+Pj4gKyAqwqDCoMKgwqDCoMKgwqAgLi4uDQo+Pj4gKyAqwqDCoMKgwqDC
oMKgwqAgc3RydWN0IGRtYV9idWZfbWFwID0gRE1BX0JVRl9NQVBfSU5JVF9PRkZTRVQoYmFz
ZV9tYXAsIA0KPj4+IEZJRUxEX09GRlNFVCk7DQo+Pj4gKyAqwqDCoMKgwqDCoMKgwqAgLi4u
DQo+Pj4gKyAqwqDCoMKgIH0NCj4+PiArICovDQo+Pj4gKyNkZWZpbmUgRE1BX0JVRl9NQVBf
SU5JVF9PRkZTRVQobWFwXywgb2Zmc2V0XynCoMKgwqAgKHN0cnVjdCANCj4+PiBkbWFfYnVm
X21hcCnCoMKgwqAgXA0KPj4+ICvCoMKgwqAge8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+PiArwqDCoMKgwqDC
oMKgwqAgLnZhZGRyID0gKG1hcF8pLT52YWRkciArIChvZmZzZXRfKSzCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFwNCj4+PiArwqDCoMKgwqDCoMKgwqAgLmlzX2lvbWVtID0gKG1hcF8pLT5p
c19pb21lbSzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4+ICvCoMKgwqAg
fQ0KPj4+ICsNCj4+DQo+PiBJdCdzIGlsbGVnYWwgdG8gYWNjZXNzIC52YWRkcsKgIHdpdGgg
cmF3IHBvaW50ZXIuIEFsd2F5cyB1c2UgYSANCj4+IGRtYV9idWZfbWVtY3B5XygpIGludGVy
ZmFjZS4gU28gd2h5IHdvdWxkIHlvdSBuZWVkIHRoaXMgbWFjcm8gd2hlbiB5b3UgDQo+PiBo
YXZlIGRtYV9idWZfbWVtY3B5XyooKSB3aXRoIGFuIG9mZnNldCBwYXJhbWV0ZXI/DQo+IA0K
PiBJIGRpZCBhIGJldHRlciBqb2Igd2l0aCBhbiBleGFtcGxlIGluIA0KPiAyMDIyMDEyNzA5
MzMzMi53bmtkMnF5NHR2d2c1aTVsQGxkbWFydGluLWRlc2syDQo+IA0KPiBXaGlsZSBkb2lu
ZyB0aGlzIHNlcmllcyBJIGhhZCBjb2RlIGxpa2UgdGhpcyB3aGVuIHVzaW5nIHRoZSBBUEkg
aW4gYSANCj4gZnVuY3Rpb24gdG8NCj4gcGFyc2UvdXBkYXRlIHBhcnQgb2YgdGhlIHN0cnVj
dCBtYXBwZWQ6DQo+IA0KPiAgwqDCoMKgwqBpbnQgYmxhX3BhcnNlX2ZvbyhzdHJ1Y3QgZG1h
X2J1Zl9tYXAgKmJsYV9tYXApDQo+ICDCoMKgwqDCoHsNCj4gIMKgwqDCoMKgwqDCoMKgIHN0
cnVjdCBkbWFfYnVmX21hcCBmb29fbWFwID0gKmJsYV9tYXA7DQo+ICDCoMKgwqDCoMKgwqDC
oCAuLi4NCj4gDQo+ICDCoMKgwqDCoMKgwqDCoCBkbWFfYnVmX21hcF9pbmNyKCZmb29fbWFw
LCBvZmZzZXRvZihzdHJ1Y3QgYmxhLCBmb28pKTsNCj4gDQo+ICDCoMKgwqDCoMKgwqDCoCAu
Li4NCj4gIMKgwqDCoMKgfQ0KPiANCj4gUGFzdGluZyB0aGUgcmVzdCBvZiB0aGUgcmVwbHkg
aGVyZToNCj4gDQo+IEkgaGFkIGV4YWN0bHkgdGhpcyBjb2RlIGFib3ZlLCBidXQgYWZ0ZXIg
d3JpdHRpbmcgcXVpdGUgYSBmZXcgcGF0Y2hlcw0KPiB1c2luZyBpdCwgcGFydGljdWxhcmx5
IHdpdGggZnVuY3Rpb25zIHRoYXQgaGF2ZSB0byB3cml0ZSB0byAyIG1hcHMgKHNlZQ0KPiBw
YXRjaCA2IGZvciBleGFtcGxlKSwgaXQgZmVsdCBtdWNoIGJldHRlciB0byBoYXZlIHNvbWV0
aGluZyB0bw0KPiBpbml0aWFsaXplIGNvcnJlY3RseSBmcm9tIHRoZSBzdGFydA0KPiANCj4g
IMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkbWFfYnVmX21hcCBvdGhlcl9tYXAgPSAqYmxhX21h
cDsNCj4gIMKgwqDCoMKgwqDCoMKgIC8qIHBvb3IgTHVjYXMgZm9yZ2V0dGluZyBkbWFfYnVm
X21hcF9pbmNyKG1hcCwgb2Zmc2V0b2YoLi4uKSk7ICovDQo+IA0KPiBpcyBlcnJvciBwcm9u
ZSBhbmQgaGFyZCB0byBkZWJ1ZyBzaW5jZSB5b3Ugd2lsbCBiZSByZWFkaW5nL3dyaXR0aW5n
DQo+IGZyb20vdG8gYW5vdGhlciBsb2NhdGlvbiByYXRoZXIgdGhhbiBleHBsb2RpbmcNCg0K
SW5kZWVkLiBXZSBoYXZlIHNvZW0gdmVyeSBzcGVjaWZpYyB1c2UgY2FzZXMgaW4gZ3JhcGhp
Y3MgY29kZSwgd2hlbiANCmRtYV9idWZfbWFwX2luY3IoKSBtYWtlcyBzZW5zZS4gQnV0IGl0
J3MgcmVhbGx5IGJhZCBmb3Igb3RoZXJzLiBJIGd1ZXNzIA0KdGhhdCB0aGUgZG9jcyBzaG91
bGQgdGFsayBhYm91dCB0aGlzLg0KDQo+IA0KPiBXaGlsZSB3aXRoIHRoZSBjb25zdHJ1Y3Qg
YmVsb3cNCj4gDQo+ICDCoMKgwqDCoMKgwqDCoCBvdGhlcl9tYXA7DQo+ICDCoMKgwqDCoMKg
wqDCoCAuLi4NCj4gIMKgwqDCoMKgwqDCoMKgIG90aGVyX21hcCA9IElOSVRJQUxJWkVSKCkN
Cj4gDQo+IEkgY2FuIHJlbHkgb24gdGhlIGNvbXBpbGVyIGNvbXBsYWluaW5nIGFib3V0IHVu
aW5pdGlhbGl6ZWQgdmFyLiBBbmQNCj4gaW4gbW9zdCBvZiB0aGUgY2FzZXMgSSBjYW4ganVz
dCBoYXZlIHRoaXMgc2luZ2xlIGxpbmUgaW4gdGhlIGJlZ2dpbmluZyANCj4gb2YgdGhlDQo+
IGZ1bmN0aW9uIHdoZW4gdGhlIG9mZnNldCBpcyBjb25zdGFudDoNCj4gDQo+ICDCoMKgwqDC
oMKgwqDCoCBzdHJ1Y3QgZG1hX2J1Zl9tYXAgb3RoZXJfbWFwID0gSU5JVElBTElaRVIoYmxh
X21hcCwgb2Zmc2V0b2YoLi4pKTsNCj4gDQo+IA0KPiBUaGlzIGlzIHVzZWZ1bCB3aGVuIHlv
dSBoYXZlIHNldmVyYWwgc21hbGwgZnVuY3Rpb25zIGluIGNoYXJnZSBvZg0KPiB1cGRhdGlu
Zy9yZWFkaW5nIGlubmVyIHN0cnVjdCBtZW1iZXJzLg0KDQpZb3Ugd29uJ3QgbmVlZCBhbiBl
eHRyYSB2YXJpYWJsZSBvciB0aGUgaW5pdGlhbGl6ZXIgbWFjcm8gaWYgeW91IGFkZCBhbiAN
Cm9mZnNldCBwYXJhbWV0ZXIgdG8gZG1hX2J1Zl9tZW1jcHlfe2Zyb20sdG99LiAgU2ltcGxl
IHBhc3Mgb2Zmc2V0b2YoLi4pIA0KdG8gdGhhdCBwYXJhbWV0ZXIgYW5kIGl0IHdpbGwgZG8g
dGhlIHJpZ2h0IHRoaW5nLg0KDQpJdCBhdm9pZHMgdGhlIHByb2JsZW1zIG9mIHRoZSBjdXJy
ZW50IG1hY3JvIGFuZCBpcyBldmVuIG1vcmUgZmxleGlibGUuIA0KT24gdG9wIG9mIHRoYXQs
IHlvdSBjYW4gYnVpbGQgd2hhdGV2ZXIgY29udmVuaWVuY2UgbWFjcm9zIHlvdSBuZWVkIGZv
ciBpOTE1Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPj4NCj4+IEkndmUgYWxz
byBiZWVuIHZlcnkgY2FyZWZ1bCB0byBkaXN0aW5ndWlzaCBiZXR3ZWVuIC52YWRkciBhbmQg
DQo+PiAudmFkZHJfaW9tZW0sIGV2ZW4gaW4gcGxhY2VzIHdoZXJlIEkgd291bGRuJ3QgaGF2
ZSB0by4gVGhpcyBtYWNybyANCj4+IGJyZWFrcyB0aGUgYXNzdW1wdGlvbi4NCj4gDQo+IFRo
YXQncyBvbmUgcmVhc29uIEkgdGhpbmsgaWYgd2UgaGF2ZSB0aGlzIG1hY3JvLCBpdCBzaG91
bGQgYmUgaW4gdGhlDQo+IGRtYV9idWZfbWFwLmggaGVhZGVyIChvciB3aGF0ZXZlciB3ZSBy
ZW5hbWUgdGhlc2UgQVBJcyB0bykuIEl0J3MgdGhlDQo+IG9ubHkgcGxhY2Ugd2hlcmUgd2Ug
Y2FuIHNhZmVseSBhZGQgY29kZSB0aGF0IHJlbGllcyBvbiB0aGUgaW1wbGVtZW50YXRpb24N
Cj4gb2YgdGhlICJwcml2YXRlIiBmaWVsZHMgaW4gc3RydWN0IGRtYV9idWZfbWFwLg0KPiAN
Cj4gTHVjYXMgRGUgTWFyY2hpDQo+IA0KPj4NCj4+IEJlc3QgcmVnYXJkcw0KPj4gVGhvbWFz
DQo+Pg0KPj4+IMKgLyoqDQo+Pj4gwqAgKiBkbWFfYnVmX21hcF9zZXRfdmFkZHIgLSBTZXRz
IGEgZG1hLWJ1ZiBtYXBwaW5nIHN0cnVjdHVyZSB0byBhbiANCj4+PiBhZGRyZXNzIGluIHN5
c3RlbSBtZW1vcnkNCj4+PiDCoCAqIEBtYXA6wqDCoMKgIFRoZSBkbWEtYnVmIG1hcHBpbmcg
c3RydWN0dXJlDQo+Pg0KPj4gLS0gDQo+PiBUaG9tYXMgWmltbWVybWFubg0KPj4gR3JhcGhp
Y3MgRHJpdmVyIERldmVsb3Blcg0KPj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQo+PiBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCj4+
IChIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCj4+IEdlc2Now6RmdHNmw7xocmVyOiBJdm8g
VG90ZXYNCj4gDQo+IA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDks
IEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------0SjZIcwgEq0qjev9gHgtiNGF--

--------------z0Jm9qzAdckLTdSmXFQL57jX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHzpjAFAwAAAAAACgkQlh/E3EQov+B/
BA//Xuj97N9DZ6G5bOBe4XaixkCJsTU5kuALrQ0DGk/ISCLGCC9HdpDc643k9QVMmE38qkA8bdBv
WoZEL9gve9Iu9T0P5kJ2gD4G8sR1mFoNEOIaSJ15JInYqwOaZd/2KXTDOsnYWUB3bF8HuNNvX04Y
Ldx482ZwlVnveHwlEkrw+17S5vjHKioR4DUMmZVQldE2+HQ6UVclo9RLEPrr0Tr4mKTYffAohRsx
wR+vvTKnPiOP58NvdXhzKcnaxbf021ikQlosGCQ9im7sC6wTPJat8xYAQ8TWNpEYeuYT2HvLW5o4
6V7rasmanxibVOBKyN9mCcyZZQ92Mu0UxrTnvNibdjgcmf+JlNPZnnVroz0iIApP1CAgzUlA/mua
JvXL1IK8WF5II3TsweUGm+WaJ/jBl7cqMGF9Omg1zGUNq2APeUqLmf7gQVxb1wULyqXTou2KU234
TuKIIxNQjsWNXrCTDmu/kUW8W3EgMIXoj4jjnYwkfBuozvlzdtOSloAV1zcHGYMir9ynNEjnU2QQ
mXMprtaXifrWiv3XZahdxaflePkzLWHz4BdYNL384BbQptpM2QV15CO6IPLXnKBdsuYg5geBw8Xp
7lNA2EKACi7Cxk0eP4EOjCxSXz/MG5Wv5A2/QfU+9eBRaOEJfGdbdkRrL/LyfQw7ZFjoVCuyRgjJ
Y7Y=
=Tt7v
-----END PGP SIGNATURE-----

--------------z0Jm9qzAdckLTdSmXFQL57jX--

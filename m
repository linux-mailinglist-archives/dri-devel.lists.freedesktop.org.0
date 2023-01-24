Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0334167968C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 12:25:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041F110E077;
	Tue, 24 Jan 2023 11:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04CAD10E077
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 11:25:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 60B512185A;
 Tue, 24 Jan 2023 11:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674559545; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DXBqdMHrfSRaGBkXmONO4jBkFprYxen9pgxcOUBcCdk=;
 b=k8IAfCGOIh+rGEXqRaVdN+//iio8Os0LWJcUks3mMdtWhmm/x98A3VwuauKBfITBjsAG6K
 nZOz+v3l2Hp1a25jxmxRP01JV3dSNOI+jYmbun/DUiUotj1RqaI7IhMtx+Opd5NNmIMjWF
 6hHPORL+V07UX2lUzN3HuY2OVO5fTNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674559545;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DXBqdMHrfSRaGBkXmONO4jBkFprYxen9pgxcOUBcCdk=;
 b=FlZHAzucd8ANp5+o5dBxABkHRJNOvtYcC/yabVwz/dU7EdEooxTAQIhzoxz8En6v8bgYwh
 0BaX7KwAX89tXPDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4D86713487;
 Tue, 24 Jan 2023 11:25:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WngMEjnAz2NAGAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Jan 2023 11:25:45 +0000
Message-ID: <428629ec-ab0c-db11-56e7-9377c8d73bab@suse.de>
Date: Tue, 24 Jan 2023 12:25:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 85/86] drm: move drm_timeout_abs_to_jiffies to drm_util
To: Sam Ravnborg <sam@ravnborg.org>
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
 <20230113-drm-include-v1-v1-85-c5cf72d8a5a2@ravnborg.org>
 <43f60723-e1f9-8991-d930-16fec3896219@suse.de>
 <Y87yKPS1UfwL9xp4@ravnborg.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Y87yKPS1UfwL9xp4@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0cE2NZ18P8SxerHZjtNV0nje"
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
--------------0cE2NZ18P8SxerHZjtNV0nje
Content-Type: multipart/mixed; boundary="------------PCf3NPoKB1qEGxMZgST90zgo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <428629ec-ab0c-db11-56e7-9377c8d73bab@suse.de>
Subject: Re: [PATCH 85/86] drm: move drm_timeout_abs_to_jiffies to drm_util
References: <20230113-drm-include-v1-v1-0-c5cf72d8a5a2@ravnborg.org>
 <20230113-drm-include-v1-v1-85-c5cf72d8a5a2@ravnborg.org>
 <43f60723-e1f9-8991-d930-16fec3896219@suse.de>
 <Y87yKPS1UfwL9xp4@ravnborg.org>
In-Reply-To: <Y87yKPS1UfwL9xp4@ravnborg.org>

--------------PCf3NPoKB1qEGxMZgST90zgo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMDEuMjMgdW0gMjE6NDYgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+IEhp
IFRob21hcywNCj4gDQo+IE9uIE1vbiwgSmFuIDIzLCAyMDIzIGF0IDA5OjU3OjEzQU0gKzAx
MDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gSGkgU2FtLA0KPj4NCj4+IHBsZWFz
ZSBzZWUgbXkgY29tbWVudCBiZWxvdy4NCj4+DQo+PiBBbSAyMS4wMS4yMyB1bSAyMTowOSBz
Y2hyaWViIFNhbSBSYXZuYm9yZyB2aWEgQjQgU3VibWlzc2lvbiBFbmRwb2ludDoNCj4+PiBG
cm9tOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+DQo+Pj4NCj4+PiBkcm1fdGlt
ZW91dF9hYnNfdG9famlmZmllcygpIHdhcyBpbXBsbWVudGVkIGluIGRybV9zeW5jb2JqIHdo
ZXJlDQo+Pj4gaXQgcmVhbGx5IGRpZCBub3QgYmVsb25nLiBDcmVhdGUgYSBkcm1fdXRpbCBm
aWxlIGFuZCBtb3ZlIHRoZQ0KPj4+IGltcGxlbWVudGF0aW9uLiBMaWtld2lzZSBtb3ZlIHRo
ZSBwcm90b3R5cGUgYW5kIHVwZGF0ZSBhbGwgdXNlcnMuDQo+Pj4NCj4+PiBTdWdnZXN0ZWQt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4NCj4+PiBbaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvZHJpLWRldmVsLzIwMTkwNTI3MTg1MzExLkdTMjEyMjJAcGhlbm9tLmZm
d2xsLmxvY2FsL10NCj4+PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPg0K
Pj4+IFNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4NCj4+
PiAtLS0NCj4+PiAgICBkcml2ZXJzL2FjY2VsL2l2cHUvaXZwdV9nZW0uYyAgICAgICAgICAg
fCAgMiArLQ0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZSAgICAgICAgICAgICAg
ICB8ICAxICsNCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyAgICAgICAg
ICAgfCAzNCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4gICAgZHJpdmVycy9n
cHUvZHJtL2RybV91dGlsLmMgICAgICAgICAgICAgIHwgNDAgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9nZW0u
YyAgICAgICAgIHwgIDIgKy0NCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfZHJ2LmMgfCAgMiArLQ0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS91YXBp
LmMgICAgICAgICAgICB8ICAyICstDQo+Pj4gICAgaW5jbHVkZS9kcm0vZHJtX3V0aWwuaCAg
ICAgICAgICAgICAgICAgIHwgIDEgKw0KPj4+ICAgIGluY2x1ZGUvZHJtL2RybV91dGlscy5o
ICAgICAgICAgICAgICAgICB8ICAyIC0tDQo+Pj4gICAgOSBmaWxlcyBjaGFuZ2VkLCA0NiBp
bnNlcnRpb25zKCspLCA0MCBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2FjY2VsL2l2cHUvaXZwdV9nZW0uYyBiL2RyaXZlcnMvYWNjZWwvaXZwdS9pdnB1
X2dlbS5jDQo+Pj4gaW5kZXggZDFmOTIzOTcxYjRjLi41NWFhOTRiYTZjMTAgMTAwNjQ0DQo+
Pj4gLS0tIGEvZHJpdmVycy9hY2NlbC9pdnB1L2l2cHVfZ2VtLmMNCj4+PiArKysgYi9kcml2
ZXJzL2FjY2VsL2l2cHUvaXZwdV9nZW0uYw0KPj4+IEBAIC0xMiw3ICsxMiw3IEBADQo+Pj4g
ICAgI2luY2x1ZGUgPGRybS9kcm1fY2FjaGUuaD4NCj4+PiAgICAjaW5jbHVkZSA8ZHJtL2Ry
bV9kZWJ1Z2ZzLmg+DQo+Pj4gICAgI2luY2x1ZGUgPGRybS9kcm1fZmlsZS5oPg0KPj4+IC0j
aW5jbHVkZSA8ZHJtL2RybV91dGlscy5oPg0KPj4+ICsjaW5jbHVkZSA8ZHJtL2RybV91dGls
Lmg+DQo+Pj4gICAgI2luY2x1ZGUgIml2cHVfZHJ2LmgiDQo+Pj4gICAgI2luY2x1ZGUgIml2
cHVfZ2VtLmgiDQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZSBi
L2RyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZQ0KPj4+IGluZGV4IGFiNDQ2MGZjZDYzZi4uNTYx
YjkzZDE5Njg1IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZQ0K
Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZQ0KPj4+IEBAIC00Miw2ICs0Miw3
IEBAIGRybS15IDo9IFwNCj4+PiAgICAJZHJtX3N5bmNvYmoubyBcDQo+Pj4gICAgCWRybV9z
eXNmcy5vIFwNCj4+PiAgICAJZHJtX3RyYWNlX3BvaW50cy5vIFwNCj4+PiArCWRybV91dGls
Lm8gXA0KPj4+ICAgIAlkcm1fdmJsYW5rLm8gXA0KPj4+ICAgIAlkcm1fdmJsYW5rX3dvcmsu
byBcDQo+Pj4gICAgCWRybV92bWFfbWFuYWdlci5vIFwNCj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNv
YmouYw0KPj4+IGluZGV4IDBjMmJlODM2MDUyNS4uMzVmNTQxNmM1Y2ZlIDEwMDY0NA0KPj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jDQo+Pj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9zeW5jb2JqLmMNCj4+PiBAQCAtMTk3LDcgKzE5Nyw2IEBADQo+Pj4g
ICAgI2luY2x1ZGUgPGRybS9kcm1fZ2VtLmg+DQo+Pj4gICAgI2luY2x1ZGUgPGRybS9kcm1f
cHJpbnQuaD4NCj4+PiAgICAjaW5jbHVkZSA8ZHJtL2RybV9zeW5jb2JqLmg+DQo+Pj4gLSNp
bmNsdWRlIDxkcm0vZHJtX3V0aWxzLmg+DQo+Pj4gICAgI2luY2x1ZGUgImRybV9pbnRlcm5h
bC5oIg0KPj4+IEBAIC0xMTE0LDM5ICsxMTEzLDYgQEAgc3RhdGljIHNpZ25lZCBsb25nIGRy
bV9zeW5jb2JqX2FycmF5X3dhaXRfdGltZW91dChzdHJ1Y3QgZHJtX3N5bmNvYmogKipzeW5j
b2JqcywNCj4+PiAgICAJcmV0dXJuIHRpbWVvdXQ7DQo+Pj4gICAgfQ0KPj4+IC0vKioNCj4+
PiAtICogZHJtX3RpbWVvdXRfYWJzX3RvX2ppZmZpZXMgLSBjYWxjdWxhdGUgamlmZmllcyB0
aW1lb3V0IGZyb20gYWJzb2x1dGUgdmFsdWUNCj4+PiAtICoNCj4+PiAtICogQHRpbWVvdXRf
bnNlYzogdGltZW91dCBuc2VjIGNvbXBvbmVudCBpbiBucywgMCBmb3IgcG9sbA0KPj4+IC0g
Kg0KPj4+IC0gKiBDYWxjdWxhdGUgdGhlIHRpbWVvdXQgaW4gamlmZmllcyBmcm9tIGFuIGFi
c29sdXRlIHRpbWUgaW4gc2VjL25zZWMuDQo+Pj4gLSAqLw0KPj4+IC1zaWduZWQgbG9uZyBk
cm1fdGltZW91dF9hYnNfdG9famlmZmllcyhpbnQ2NF90IHRpbWVvdXRfbnNlYykNCj4gDQo+
IFRoYW5rcyBmb3IgdGhlIGNyaXRpY2FsIGxvb2sgYXQgdGhpcyENCj4gDQo+Pg0KPj4gVGhp
cyBmdW5jdGlvbiBjb252ZXJ0cyBhbiBhYnNvbHV0ZSB0aW1lb3V0IGluIG5zZWMgdG8gYSBy
ZWxhdGl2ZSB0aW1lb3V0IGluDQo+PiBqaWZmaWVzLiAoPykNCj4+DQo+PiBJdCBhcHBlYXJz
IHRvIG1lIGFzIGlmIHRoaXMgaGVscGVyIHNob3VsZCBub3QgZXhpc3QuIEl0IHVzZXMgYSBt
aXh0dXJlIG9mDQo+PiBkaWZmZXJlbnQgdGltZSBpbnRlcmZhY2VzOyBjb21iaW5lZCB3aXRo
IGhhcmRjb2RlZCBwb2xpY3kgZm9yIDAgYW5kDQo+PiBNQVhfU0NIRURVTEVfVElNRU9VVC4N
Cj4+DQo+PiBUaGVyZSBhcmUgb25seSAzIGNhbGxlcnMgb2YgdGhpcyBoZWxwZXIuIEkgdGhp
bmsgd2Ugc2hvdWxkIGNvbnNpZGVyIGlubGluaW5nDQo+PiBpdCBpbiBlYWNoLg0KPj4NCj4+
IEFzIHBhcnQgb2YgdGhpcywgbWF5YmUgdGhlIHVzZSBvZiBrdGltZSBjb3VsZCBnbyBhd2F5
LiBDb252ZXJ0IG5zZWNzIHRvDQo+PiBqaWZmaWVzIGFuZCBkbyB0aGUgcmVzdCBvZiB0aGUg
Y29tcHV0YXRpb24gaW4gamlmZmllcy4NCj4gDQo+IEkgYmxpbmRseSBjb3BpZWQgdGhlIGV4
aXN0aW5nIGZ1bmN0aW9uIGFuZCBkaWQgbm90IGNvbnNpZGVyIHRoZQ0KPiBpbXBsZW1lbnRh
dGlvbi4gTG9va2luZyBmb3IgYSBoZWxwZXIgdGhhdCBkbyB3aGF0IHdlIG5lZWRzIGhlcmUg
dHVybmVkDQo+IHVwIGVtcHR5LiBJIGFsc28gbG9va2VkIGF0IHlvdXIgc3VnZ2VzdGlvbiB0
byBkbzoNCj4gbnNlYyBpbiBhYnNvbHV0ZSA9PiBqaWZmaWVzIGluIGFic29sdXRlID0+IGpp
ZmZpZXMgaW4gcmVsYXRpdmUNCj4gQnV0IGRpZCBub3QgZmluZCBzb21ldGhpbmcgdGhhdCBp
cyBiZXR0ZXIgdGhhbiB3aGF0IHdlIGhhdmUuDQo+IA0KPiBJIHdpbGwgbGVhdmUgaXQgZm9y
IG5vdywgYW5kIGZvY3VzIG9uIHRoZSBvdGhlciBwYXJ0cyBvZiB0aGUgcGF0Y2hzZXQuDQo+
IEluIHRoZSB2YWluIGhvcGUgc29tZW9uZSBlbHNlIHRha2VzIGEgbG9vay4NCg0KTm8gcHJv
YmxlbS4gWW91IGNhbiBhZGQNCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPg0KDQp0byBwYXRjaGVzIDg1IGFuZCA4NiBhcyB3ZWxsLg0K
DQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiAJU2FtDQoNCi0tIA0KVGhvbWFzIFpp
bW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBH
ZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjog
SXZvIFRvdGV2DQo=

--------------PCf3NPoKB1qEGxMZgST90zgo--

--------------0cE2NZ18P8SxerHZjtNV0nje
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPPwDgFAwAAAAAACgkQlh/E3EQov+Ad
fBAAzVKILV8HapHTIkbhdWCQ/EcBKt8EkoY3UjAtH5Tz/bwrVBN65T7pt1ExtK0DNgXGQKIUpOOQ
BMxFIhRuGnPUVzGwAeu+SZhTRd4djM2Q20STySSlLXcc4Gt7nZij0xI0RbmsqpxOIjxf5jUhq7SC
OUGSCot81pqLE+tyzLnw5dDfjLUA57q8kmLkblNSKCuznWtF50EqebNx9y/3xw7h9P8eLlbfIxad
hTBQJCoI2hfoDlS0OOfW3ya60KXeROSwvaN2Rgjx+ytd0/qhsvYZRZCLeypY8Nk1H8oLfi3yZAdX
+wEgpxM24XMmYlgKGP1Xq6+2a0JrCC14bRNoGwinw8cso7jeZckJrjGpg+DBh2FhTUVHxxU6JPZ2
rdzD4oZ3Z+VnZTcV8DzO7R9pQ4qDl3EDbYCB27M36GXY7G8tWdGeV8TsDVZz3cxNvq1ZuJxKb2qR
gBNUKNMEN9Zg/GgRXG0ilB2ktHxQymzHq87wBvzhGk5CQKJHmLVG8UXQDRQe69qhKhSjugQ8NoA3
pidrCPRscbbXJNWzPuwJcJjJvDKztahlLKp60y2VIisLdPdshhfGICUPZvd6HFCk5/ofE1x8wqAL
vKwg1+Qz5qd+VXSq/L3whh/9gZE2wsQboTxMfXVTDlRqAS4MKIDd38jO4l3ytClASHYOD/o0JjlO
n94=
=8VFc
-----END PGP SIGNATURE-----

--------------0cE2NZ18P8SxerHZjtNV0nje--

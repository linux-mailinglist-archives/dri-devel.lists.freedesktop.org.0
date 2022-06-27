Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 860DB55B814
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 09:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDAB10FEB1;
	Mon, 27 Jun 2022 07:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E620810FEB1;
 Mon, 27 Jun 2022 07:03:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 77FE721BF3;
 Mon, 27 Jun 2022 07:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656313414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fEscDCfGT7SSZX70cXdSR8hHm5lWCs3WYB30YuOxwyc=;
 b=BTsVsduYead5jnG7Af5TX9bm67MwK0SFchNCblJxvkbavzNjgVn14/icD4hGwxRQhhFtlo
 glwpnvdfd6wKOOJf+dw3PjVjnyBWRK+6s/FkQzDX4ZytRnXiR5Adzt6xZ8gpHUhCYAQQTT
 X6YOTz515K7BYrCoDkLZi7fhyd+an/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656313414;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fEscDCfGT7SSZX70cXdSR8hHm5lWCs3WYB30YuOxwyc=;
 b=J/Z3ExLBClarASDxUd/l5JIBHEWJRof7CiCXsopD7JtvGQv1/oUCn1zMoRPuS/ukoxoh8c
 T0njxFCxYDvVlVDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5444313456;
 Mon, 27 Jun 2022 07:03:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7sZjE0ZWuWIqaAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Jun 2022 07:03:34 +0000
Message-ID: <4fd40305-9b84-e556-8bae-86157148fe0b@suse.de>
Date: Mon, 27 Jun 2022 09:03:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Intel-gfx] [PATCH 2/2] iosys-map: Add per-word write
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220617085204.1678035-1-lucas.demarchi@intel.com>
 <20220617085204.1678035-2-lucas.demarchi@intel.com>
 <20220626210031.4jri3ugykd2x6onu@ldmartin-desk2>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220626210031.4jri3ugykd2x6onu@ldmartin-desk2>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------c1vhNP0Az01iAPXObUhvXyNc"
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------c1vhNP0Az01iAPXObUhvXyNc
Content-Type: multipart/mixed; boundary="------------v99x6oza0yJeYF0G0Kj0mch9";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@intel.com>, christian.koenig@amd.com
Message-ID: <4fd40305-9b84-e556-8bae-86157148fe0b@suse.de>
Subject: Re: [Intel-gfx] [PATCH 2/2] iosys-map: Add per-word write
References: <20220617085204.1678035-1-lucas.demarchi@intel.com>
 <20220617085204.1678035-2-lucas.demarchi@intel.com>
 <20220626210031.4jri3ugykd2x6onu@ldmartin-desk2>
In-Reply-To: <20220626210031.4jri3ugykd2x6onu@ldmartin-desk2>

--------------v99x6oza0yJeYF0G0Kj0mch9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTHVjYXMNCg0KQW0gMjYuMDYuMjIgdW0gMjM6MDEgc2NocmllYiBMdWNhcyBEZSBNYXJj
aGk6DQo+IE9uIEZyaSwgSnVuIDE3LCAyMDIyIGF0IDAxOjUyOjA0QU0gLTA3MDAsIEx1Y2Fz
IERlIE1hcmNoaSB3cm90ZToNCj4+IExpa2Ugd2FzIGRvbmUgZm9yIHJlYWQsIHByb3ZpZGUg
dGhlIGVxdWl2YWxlbnQgZm9yIHdyaXRlLiBFdmVuIGlmDQo+PiBjdXJyZW50IHVzZXJzIGFy
ZSBub3QgaW4gdGhlIGhvdCBwYXRoLCB0aGlzIHNob3VsZCBmdXR1cmUtcHJvb2YgaXQuDQo+
Pg0KPj4gdjI6DQo+PiDCoC0gUmVtb3ZlIGRlZmF1bHQgZnJvbSBfR2VuZXJpYygpIC0gY2Fs
bGVycyB3YW50aW5nIHRvIHdyaXRlIG1vcmUNCj4+IMKgwqAgdGhhbiB1NjQgc2hvdWxkIHVz
ZSBpb3N5c19tYXBfbWVtY3B5X3RvKCkNCj4+IMKgLSBBZGQgV1JJVEVfT05DRSgpIGNhc2Vz
IGRlcmVmZXJlbmNpbmcgdGhlIHBvaW50ZXIgd2hlbiB1c2luZyBzeXN0ZW0NCj4+IMKgwqAg
bWVtb3J5DQo+IA0KPiBUaG9tYXMsIGRvIHlvdSBoYXZlIGFueSBhZGRpdGlvbmFsIGNvbmNl
cm4gb24gdGhpcyBwYXRjaCByZWdhcmRpbmcgeW91cg0KPiBwcmV2aW91cyByZXZpZXc/DQoN
ClNvcnJ5LCB5b3VyIHBhdGNoZXMgc2ltcGx5IGZlbGwgdGhyb3VnaCB0aGUgY3JhY2tzLiBG
b3IgdGhlIHBhdGNoc2V0Og0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+DQoNClRoYW5rcyBmb3IgdGhlIGVmZm9ydCB5b3UgcHV0IGlu
dG8gdGhpcy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gdGhhbmtzDQo+IEx1
Y2FzIERlIE1hcmNoaQ0KPiANCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBEZSBNYXJj
aGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBSZXZpZXdl
ZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiAjIHYx
DQo+PiAtLS0NCj4+IGluY2x1ZGUvbGludXgvaW9zeXMtbWFwLmggfCA0MiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0NCj4+IDEgZmlsZSBjaGFuZ2VkLCAzMyBp
bnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2xpbnV4L2lvc3lzLW1hcC5oIGIvaW5jbHVkZS9saW51eC9pb3N5cy1tYXAuaA0KPj4g
aW5kZXggZjU5ZGQwMGVkMjAyLi41ODBlMTRjZDM2MGMgMTAwNjQ0DQo+PiAtLS0gYS9pbmNs
dWRlL2xpbnV4L2lvc3lzLW1hcC5oDQo+PiArKysgYi9pbmNsdWRlL2xpbnV4L2lvc3lzLW1h
cC5oDQo+PiBAQCAtMzM3LDkgKzMzNywxMyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgaW9zeXNf
bWFwX21lbXNldChzdHJ1Y3QgDQo+PiBpb3N5c19tYXAgKmRzdCwgc2l6ZV90IG9mZnNldCwN
Cj4+ICNpZmRlZiBDT05GSUdfNjRCSVQNCj4+ICNkZWZpbmUgX19pb3N5c19tYXBfcmRfaW9f
dTY0X2Nhc2UodmFsXywgdmFkZHJfaW9tZW1fKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBcDQo+PiDCoMKgwqDCoHU2NDogdmFsXyA9IHJlYWRxKHZhZGRyX2lvbWVtXykNCj4+
ICsjZGVmaW5lIF9faW9zeXNfbWFwX3dyX2lvX3U2NF9jYXNlKHZhbF8sIHZhZGRyX2lvbWVt
XynCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+ICvCoMKgwqAgdTY0OiB3cml0ZXEodmFs
XywgdmFkZHJfaW9tZW1fKQ0KPj4gI2Vsc2UNCj4+ICNkZWZpbmUgX19pb3N5c19tYXBfcmRf
aW9fdTY0X2Nhc2UodmFsXywgdmFkZHJfaW9tZW1fKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBcDQo+PiDCoMKgwqDCoHU2NDogbWVtY3B5X2Zyb21pbygmKHZhbF8pLCB2YWRk
cl9pb21lbV9fLCBzaXplb2YodTY0KSkNCj4+ICsjZGVmaW5lIF9faW9zeXNfbWFwX3dyX2lv
X3U2NF9jYXNlKHZhbF8sIHZhZGRyX2lvbWVtXynCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwN
Cj4+ICvCoMKgwqAgdTY0OiBtZW1jcHlfdG9pbyh2YWRkcl9pb21lbV8sICYodmFsXyksIHNp
emVvZih1NjQpKQ0KPj4gI2VuZGlmDQo+Pg0KPj4gI2RlZmluZSBfX2lvc3lzX21hcF9yZF9p
byh2YWxfXywgdmFkZHJfaW9tZW1fXywgdHlwZV9fKSANCj4+IF9HZW5lcmljKHZhbF9fLMKg
wqDCoMKgwqDCoMKgIFwNCj4+IEBAIC0zNTQsNiArMzU4LDE5IEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCBpb3N5c19tYXBfbWVtc2V0KHN0cnVjdCANCj4+IGlvc3lzX21hcCAqZHN0LCBzaXpl
X3Qgb2Zmc2V0LA0KPj4gwqDCoMKgwqB2YWxfXyA9IFJFQURfT05DRSgqKCh0eXBlX18gKil2
YWRkcl9fKSk7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+IH0pDQo+Pg0K
Pj4gKyNkZWZpbmUgX19pb3N5c19tYXBfd3JfaW8odmFsX18sIHZhZGRyX2lvbWVtX18sIHR5
cGVfXykgDQo+PiBfR2VuZXJpYyh2YWxfXyzCoMKgwqDCoMKgwqDCoCBcDQo+PiArwqDCoMKg
IHU4OiB3cml0ZWIodmFsX18sIHZhZGRyX2lvbWVtX18pLMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+ICvCoMKgwqAgdTE2OiB3cml0ZXcodmFsX18sIHZh
ZGRyX2lvbWVtX18pLMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwN
Cj4+ICvCoMKgwqAgdTMyOiB3cml0ZWwodmFsX18sIHZhZGRyX2lvbWVtX18pLMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+ICvCoMKgwqAgX19pb3N5c19t
YXBfd3JfaW9fdTY0X2Nhc2UodmFsX18sIHZhZGRyX2lvbWVtX18pKQ0KPj4gKw0KPj4gKyNk
ZWZpbmUgX19pb3N5c19tYXBfd3Jfc3lzKHZhbF9fLCB2YWRkcl9fLCB0eXBlX18pICh7wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+ICvCoMKgwqAgY29tcGlsZXRpbWVf
YXNzZXJ0KHNpemVvZih0eXBlX18pIDw9IHNpemVvZih1NjQpLMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgXA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIlVuc3VwcG9ydGVk
IGFjY2VzcyBzaXplIGZvciBfX2lvc3lzX21hcF93cl9zeXMoKSIpOyBcDQo+PiArwqDCoMKg
IFdSSVRFX09OQ0UoKigodHlwZV9fICopdmFkZHJfXyksIHZhbF9fKTvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4gK30pDQo+PiArDQo+PiArDQo+PiAvKioNCj4+IMKg
KiBpb3N5c19tYXBfcmQgLSBSZWFkIGEgQy10eXBlIHZhbHVlIGZyb20gdGhlIGlvc3lzX21h
cA0KPj4gwqAqDQo+PiBAQCAtMzg2LDEyICs0MDMsMTcgQEAgc3RhdGljIGlubGluZSB2b2lk
IGlvc3lzX21hcF9tZW1zZXQoc3RydWN0IA0KPj4gaW9zeXNfbWFwICpkc3QsIHNpemVfdCBv
ZmZzZXQsDQo+PiDCoCogQHR5cGVfXzrCoMKgwqAgVHlwZSBvZiB0aGUgdmFsdWUgYmVpbmcg
d3JpdHRlbg0KPj4gwqAqIEB2YWxfXzrCoMKgwqAgVmFsdWUgdG8gd3JpdGUNCj4+IMKgKg0K
Pj4gLSAqIFdyaXRlIGEgQy10eXBlIHZhbHVlIHRvIHRoZSBpb3N5c19tYXAsIGhhbmRsaW5n
IHBvc3NpYmxlIA0KPj4gdW4tYWxpZ25lZCBhY2Nlc3Nlcw0KPj4gLSAqIHRvIHRoZSBtYXBw
aW5nLg0KPj4gKyAqIFdyaXRlIGEgQyB0eXBlIHZhbHVlICh1OCwgdTE2LCB1MzIgYW5kIHU2
NCkgdG8gdGhlIGlvc3lzX21hcC4gRm9yIA0KPj4gb3RoZXIgdHlwZXMNCj4+ICsgKiBvciBp
ZiBwb2ludGVyIG1heSBiZSB1bmFsaWduZWQgKGFuZCBwcm9ibGVtYXRpYyBmb3IgdGhlIGFy
Y2hpdGVjdHVyZQ0KPj4gKyAqIHN1cHBvcnRlZCksIHVzZSBpb3N5c19tYXBfbWVtY3B5X3Rv
KCkNCj4+IMKgKi8NCj4+IC0jZGVmaW5lIGlvc3lzX21hcF93cihtYXBfXywgb2Zmc2V0X18s
IHR5cGVfXywgdmFsX18pICh7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+PiAtwqDCoMKg
IHR5cGVfXyB2YWwgPSAodmFsX18pO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgXA0KPj4gLcKgwqDCoCBpb3N5c19tYXBfbWVtY3B5X3RvKG1hcF9f
LCBvZmZzZXRfXywgJnZhbCwgc2l6ZW9mKHZhbCkpO8KgwqDCoCBcDQo+PiArI2RlZmluZSBp
b3N5c19tYXBfd3IobWFwX18sIG9mZnNldF9fLCB0eXBlX18sIHZhbF9fKSAoe8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+PiArwqDCoMKgIHR5cGVfXyB2YWwgPSAodmFs
X18pO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBcDQo+PiArwqDCoMKgIGlmICgobWFwX18pLT5pc19pb21lbSkge8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4gK8KgwqDCoMKgwqDC
oMKgIF9faW9zeXNfbWFwX3dyX2lvKHZhbCwgKG1hcF9fKS0+dmFkZHJfaW9tZW0gKyAob2Zm
c2V0X18pLCANCj4+IHR5cGVfXyk7XA0KPj4gK8KgwqDCoCB9IGVsc2Uge8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwN
Cj4+ICvCoMKgwqDCoMKgwqDCoCBfX2lvc3lzX21hcF93cl9zeXModmFsLCAobWFwX18pLT52
YWRkciArIChvZmZzZXRfXyksIA0KPj4gdHlwZV9fKTvCoMKgwqAgXA0KPj4gK8KgwqDCoCB9
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBcDQo+PiB9KQ0KPj4NCj4+IC8qKg0KPj4gQEAgLTQ3MiwxMCAr
NDk0LDEyIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBpb3N5c19tYXBfbWVtc2V0KHN0cnVjdCAN
Cj4+IGlvc3lzX21hcCAqZHN0LCBzaXplX3Qgb2Zmc2V0LA0KPj4gwqAqIEBmaWVsZF9fOsKg
wqDCoMKgwqDCoMKgIE1lbWJlciBvZiB0aGUgc3RydWN0IHRvIHJlYWQNCj4+IMKgKiBAdmFs
X186wqDCoMKgwqDCoMKgwqAgVmFsdWUgdG8gd3JpdGUNCj4+IMKgKg0KPj4gLSAqIFdyaXRl
IGEgdmFsdWUgdG8gdGhlIGlvc3lzX21hcCBjb25zaWRlcmluZyBpdHMgbGF5b3V0IGlzIGRl
c2NyaWJlZCANCj4+IGJ5IGEgQyBzdHJ1Y3QNCj4+IC0gKiBzdGFydGluZyBhdCBAc3RydWN0
X29mZnNldF9fLiBUaGUgZmllbGQgb2Zmc2V0IGFuZCBzaXplIGlzIA0KPj4gY2FsY3VsYXRl
ZCBhbmQgdGhlDQo+PiAtICogQHZhbF9fIGlzIHdyaXR0ZW4gaGFuZGxpbmcgcG9zc2libGUg
dW4tYWxpZ25lZCBtZW1vcnkgYWNjZXNzZXMuIA0KPj4gUmVmZXIgdG8NCj4+IC0gKiBpb3N5
c19tYXBfcmRfZmllbGQoKSBmb3IgZXhwZWN0ZWQgdXNhZ2UgYW5kIG1lbW9yeSBsYXlvdXQu
DQo+PiArICogV3JpdGUgYSB2YWx1ZSB0byB0aGUgaW9zeXNfbWFwIGNvbnNpZGVyaW5nIGl0
cyBsYXlvdXQgaXMgZGVzY3JpYmVkIA0KPj4gYnkgYSBDDQo+PiArICogc3RydWN0IHN0YXJ0
aW5nIGF0IEBzdHJ1Y3Rfb2Zmc2V0X18uIFRoZSBmaWVsZCBvZmZzZXQgYW5kIHNpemUgaXMg
DQo+PiBjYWxjdWxhdGVkDQo+PiArICogYW5kIHRoZSBAdmFsX18gaXMgd3JpdHRlbi4gSWYg
dGhlIGZpZWxkIGFjY2VzcyB3b3VsZCBpbmN1ciBpbiANCj4+IHVuLWFsaWduZWQNCj4+ICsg
KiBhY2Nlc3MsIHRoZW4gZWl0aGVyIGlvc3lzX21hcF9tZW1jcHlfdG8oKSBuZWVkcyB0byBi
ZSB1c2VkIG9yIHRoZQ0KPj4gKyAqIGFyY2hpdGVjdHVyZSBtdXN0IHN1cHBvcnQgaXQuIFJl
ZmVyIHRvIGlvc3lzX21hcF9yZF9maWVsZCgpIGZvciANCj4+IGV4cGVjdGVkDQo+PiArICog
dXNhZ2UgYW5kIG1lbW9yeSBsYXlvdXQuDQo+PiDCoCovDQo+PiAjZGVmaW5lIGlvc3lzX21h
cF93cl9maWVsZChtYXBfXywgc3RydWN0X29mZnNldF9fLCBzdHJ1Y3RfdHlwZV9fLCANCj4+
IGZpZWxkX18sIHZhbF9fKSAoe8KgwqDCoCBcDQo+PiDCoMKgwqDCoHN0cnVjdF90eXBlX18g
KnM7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgXA0KPj4gLS0gDQo+PiAyLjM2LjENCj4+DQoNCi0tIA0KVGhvbWFzIFpp
bW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBH
ZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjog
SXZvIFRvdGV2DQo=

--------------v99x6oza0yJeYF0G0Kj0mch9--

--------------c1vhNP0Az01iAPXObUhvXyNc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmK5VkUFAwAAAAAACgkQlh/E3EQov+Cq
sQ//aWnqAPCKBeZ/FZPjZiORRgzgo1cACAY1T3U5kiOpYIKDjZUCIqmOYHZW+opYtbRNtHIi+R4W
AYEUV8OFrESASR1QlBxNJqOKsEWG91IdB6IsfvRbb1hpWq984nQ9cGboEkdJIm3R6Nm1x427E39m
8ozoujktUr9RszR2aUnkO0vcHciRbTVSG15ONMfvvH3KlzwSmacjFSzARXWpeA3JeE1o/awRGNVl
TmUid0Xnwel2FOrid3nXj8kWndiZGL5KzO2r0sX2qflhXAY8pGwMRmTxN+QjDs826djyZavBgTgd
57f0D/Xkk4vkbcVgWtVQIkrfCbqK5VEP5oxK3jIjdCJawe1SbPINIhlD5ewNGElPfjJfRYWZcDAb
hCIn16TGY/4xwCgStej/MvHunVf6nX023DfKjdA2jaVe85mCJqrpwby9ENg3v9AWZWYue1chZjBb
1CMGi+WfCjEcH4Z1zka18Oy/SH6w8l19JTAEDa95YlCQjZT6lDkG8Yv4+XwjoYsCA+uVhBH160Rb
40jf8BtTPTuv0EcHJF9XCfCpVClEsyYEaXUUGaO1GxcpviiS/GhCFM+cKc4KLRFTBpAmy96oqYOw
ZK1gjoODH4dVnS7AGpUkMeO2snEuSw5X5FkYv3h39vZVqCXX2nIFTJ+Ve9Yqi3BTSHk97tOJywDP
Ht8=
=Kn0T
-----END PGP SIGNATURE-----

--------------c1vhNP0Az01iAPXObUhvXyNc--

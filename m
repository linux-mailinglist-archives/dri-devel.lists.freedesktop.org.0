Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E1444AA17
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 10:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4CA6E532;
	Tue,  9 Nov 2021 09:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42566E532
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 09:06:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4B8CB1FDB9;
 Tue,  9 Nov 2021 09:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636448788; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3MRFGWlUNvnfI7JR1017qsC5IEmSZ3drs8ufv6ocL2M=;
 b=V+C9Yvrz6EfGkGvbEI3KJcAvNZUxrLJRdUOB3vSYLACh1VnMgp0eAljZ49oHcIyU1FHtn6
 kjwP96vlGmzQ4dWsOW7xj+Xcv2VAB4gKdorbIjf148RDiOSuiNjhDZ2DhBTQ4qV7GfA2/R
 WaWPZCjN3MJMv+q0T4k0PiayuzsugFU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636448788;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3MRFGWlUNvnfI7JR1017qsC5IEmSZ3drs8ufv6ocL2M=;
 b=9vS2+p7dKUCkoGRtb3R8jWD273BntINIMeTziIRm83jUIIzOoWvJgjo+O8O9rQtPoz4ddk
 /vbFCQ9sJJE8CHBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D720F13ADA;
 Tue,  9 Nov 2021 09:06:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id emcmMxM6imGlSQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Nov 2021 09:06:27 +0000
Message-ID: <e3acf05c-3215-dd40-a677-76e6df597151@suse.de>
Date: Tue, 9 Nov 2021 10:06:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 8/9] drm/simpledrm: Support virtual screen sizes
Content-Language: en-US
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 aros@gmx.com, joshua@stroblindustries.com, arnd@arndb.de
References: <20211101141532.26655-1-tzimmermann@suse.de>
 <20211101141532.26655-9-tzimmermann@suse.de>
 <597cc1b8-30c1-bdf0-68ad-3ad0fd53fb5f@tronnes.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <597cc1b8-30c1-bdf0-68ad-3ad0fd53fb5f@tronnes.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------N5BSEpWwPsVWVnf9L5B2cDKG"
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
Cc: linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------N5BSEpWwPsVWVnf9L5B2cDKG
Content-Type: multipart/mixed; boundary="------------E2BL7AAL30DVsV0kEYWQcr0S";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 aros@gmx.com, joshua@stroblindustries.com, arnd@arndb.de
Cc: linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Message-ID: <e3acf05c-3215-dd40-a677-76e6df597151@suse.de>
Subject: Re: [PATCH v2 8/9] drm/simpledrm: Support virtual screen sizes
References: <20211101141532.26655-1-tzimmermann@suse.de>
 <20211101141532.26655-9-tzimmermann@suse.de>
 <597cc1b8-30c1-bdf0-68ad-3ad0fd53fb5f@tronnes.org>
In-Reply-To: <597cc1b8-30c1-bdf0-68ad-3ad0fd53fb5f@tronnes.org>

--------------E2BL7AAL30DVsV0kEYWQcr0S
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMTEuMjEgdW0gMjI6MDEgc2NocmllYiBOb3JhbGYgVHLDuG5uZXM6DQo+
IA0KPiANCj4gRGVuIDAxLjExLjIwMjEgMTUuMTUsIHNrcmV2IFRob21hcyBaaW1tZXJtYW5u
Og0KPj4gQWRkIGNvbnN0YW50cyBmb3IgdGhlIG1heGltdW0gc2l6ZSBvZiB0aGUgc2hhZG93
LXBsYW5lIHN1cmZhY2UNCj4+IHNpemUuIFVzZWZ1bCBmb3Igc2hhZG93IHBsYW5lcyB3aXRo
IHZpcnR1YWwgc2NyZWVuIHNpemVzLiBUaGUNCj4+IGN1cnJlbnQgc2l6ZXMgYXJlIDQwOTYg
c2NhbmxpbmVzIHdpdGggNDA5NiBwaXhlbHMgZWFjaC4gVGhpcw0KPj4gc2VlbXMgcmVhc29u
YWJsZSBmb3IgY3VycmVudCBoYXJkd2FyZSwgYnV0IGNhbiBiZSBpbmNyZWFzZWQgYXMNCj4+
IG5lY2Vzc2FyeS4NCj4+DQo+PiBJbiBzaW1wbGVkcm0sIHNldCB0aGUgbWF4aW11bSBmcmFt
ZWJ1ZmZlciBzaXplIGZyb20gdGhlIGNvbnN0YW50cw0KPj4gZm9yIHNoYWRvdyBwbGFuZXMu
IEltcGxlbWVudHMgc3VwcG9ydCBmb3IgdmlydHVhbCBzY3JlZW4gc2l6ZXMgYW5kDQo+PiBw
YWdlIGZsaXBwaW5nIG9uIHRoZSBmYmRldiBjb25zb2xlLg0KPj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gLS0tDQo+
PiAgIGRyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRybS5jICAgIHwgIDkgKysrKysrKy0t
DQo+PiAgIGluY2x1ZGUvZHJtL2RybV9nZW1fYXRvbWljX2hlbHBlci5oIHwgMTggKysrKysr
KysrKysrKysrKysrDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rp
bnkvc2ltcGxlZHJtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYw0KPj4g
aW5kZXggZTg3MjEyMWU5ZmIwLi5lNDJhZTFjNmViY2QgMTAwNjQ0DQo+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3Rpbnkvc2ltcGxlZHJtLmMNCj4+IEBAIC0yLDYgKzIsNyBAQA0KPj4gICANCj4+ICAgI2lu
Y2x1ZGUgPGxpbnV4L2Nsay5oPg0KPj4gICAjaW5jbHVkZSA8bGludXgvb2ZfY2xrLmg+DQo+
PiArI2luY2x1ZGUgPGxpbnV4L21pbm1heC5oPg0KPj4gICAjaW5jbHVkZSA8bGludXgvcGxh
dGZvcm1fZGF0YS9zaW1wbGVmYi5oPg0KPj4gICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1f
ZGV2aWNlLmg+DQo+PiAgICNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4N
Cj4+IEBAIC03NzYsNiArNzc3LDcgQEAgc3RhdGljIGludCBzaW1wbGVkcm1fZGV2aWNlX2lu
aXRfbW9kZXNldChzdHJ1Y3Qgc2ltcGxlZHJtX2RldmljZSAqc2RldikNCj4+ICAgCXN0cnVj
dCBkcm1fZGlzcGxheV9tb2RlICptb2RlID0gJnNkZXYtPm1vZGU7DQo+PiAgIAlzdHJ1Y3Qg
ZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yID0gJnNkZXYtPmNvbm5lY3RvcjsNCj4+ICAgCXN0
cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSA9ICZzZGV2LT5waXBlOw0KPj4g
Kwl1bnNpZ25lZCBsb25nIG1heF93aWR0aCwgbWF4X2hlaWdodDsNCj4+ICAgCWNvbnN0IHVp
bnQzMl90ICpmb3JtYXRzOw0KPj4gICAJc2l6ZV90IG5mb3JtYXRzOw0KPj4gICAJaW50IHJl
dDsNCj4+IEBAIC03ODQsMTAgKzc4NiwxMyBAQCBzdGF0aWMgaW50IHNpbXBsZWRybV9kZXZp
Y2VfaW5pdF9tb2Rlc2V0KHN0cnVjdCBzaW1wbGVkcm1fZGV2aWNlICpzZGV2KQ0KPj4gICAJ
aWYgKHJldCkNCj4+ICAgCQlyZXR1cm4gcmV0Ow0KPj4gICANCj4+ICsJbWF4X3dpZHRoID0g
bWF4X3QodW5zaWduZWQgbG9uZywgbW9kZS0+aGRpc3BsYXksIERSTV9TSEFET1dfUExBTkVf
TUFYX1dJRFRIKTsNCj4+ICsJbWF4X2hlaWdodCA9IG1heF90KHVuc2lnbmVkIGxvbmcsIG1v
ZGUtPnZkaXNwbGF5LCBEUk1fU0hBRE9XX1BMQU5FX01BWF9IRUlHSFQpOw0KPj4gKw0KPj4g
ICAJZGV2LT5tb2RlX2NvbmZpZy5taW5fd2lkdGggPSBtb2RlLT5oZGlzcGxheTsNCj4+IC0J
ZGV2LT5tb2RlX2NvbmZpZy5tYXhfd2lkdGggPSBtb2RlLT5oZGlzcGxheTsNCj4+ICsJZGV2
LT5tb2RlX2NvbmZpZy5tYXhfd2lkdGggPSBtYXhfd2lkdGg7DQo+PiAgIAlkZXYtPm1vZGVf
Y29uZmlnLm1pbl9oZWlnaHQgPSBtb2RlLT52ZGlzcGxheTsNCj4+IC0JZGV2LT5tb2RlX2Nv
bmZpZy5tYXhfaGVpZ2h0ID0gbW9kZS0+dmRpc3BsYXk7DQo+PiArCWRldi0+bW9kZV9jb25m
aWcubWF4X2hlaWdodCA9IG1heF9oZWlnaHQ7DQo+PiAgIAlkZXYtPm1vZGVfY29uZmlnLnBy
ZWZlcl9zaGFkb3dfZmJkZXYgPSB0cnVlOw0KPj4gICAJZGV2LT5tb2RlX2NvbmZpZy5wcmVm
ZXJyZWRfZGVwdGggPSBzZGV2LT5mb3JtYXQtPmNwcFswXSAqIDg7DQo+PiAgIAlkZXYtPm1v
ZGVfY29uZmlnLmZ1bmNzID0gJnNpbXBsZWRybV9tb2RlX2NvbmZpZ19mdW5jczsNCj4+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZ2VtX2F0b21pY19oZWxwZXIuaCBiL2luY2x1
ZGUvZHJtL2RybV9nZW1fYXRvbWljX2hlbHBlci5oDQo+PiBpbmRleCA0ODIyMmExMDc4NzMu
LjU0OTgzZWNmNjQxYSAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9nZW1fYXRv
bWljX2hlbHBlci5oDQo+PiArKysgYi9pbmNsdWRlL2RybS9kcm1fZ2VtX2F0b21pY19oZWxw
ZXIuaA0KPj4gQEAgLTIyLDYgKzIyLDI0IEBAIGludCBkcm1fZ2VtX3NpbXBsZV9kaXNwbGF5
X3BpcGVfcHJlcGFyZV9mYihzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUs
DQo+PiAgICAqIEhlbHBlcnMgZm9yIHBsYW5lcyB3aXRoIHNoYWRvdyBidWZmZXJzDQo+PiAg
ICAqLw0KPj4gICANCj4+ICsvKioNCj4+ICsgKiBEUk1fU0hBRE9XX1BMQU5FX01BWF9XSURU
SCAtIE1heGltdW0gd2lkdGggb2YgYSBwbGFuZSdzIHNoYWRvdyBidWZmZXIgaW4gcGl4ZWxz
DQo+PiArICoNCj4+ICsgKiBGb3IgZHJpdmVycyB3aXRoIHNoYWRvdyBwbGFuZXMsIHRoZSBt
YXhpbXVtIHdpZHRoIG9mIHRoZSBmcmFtZWJ1ZmZlciBpcw0KPj4gKyAqIHVzdWFsbHkgaW5k
ZXBlbmRlbnQgZnJvbSBoYXJkd2FyZSBsaW1pdGF0aW9ucy4gRHJpdmVycyBjYW4gaW5pdGlh
bGl6ZSBzdHJ1Y3QNCj4+ICsgKiBkcm1fbW9kZV9jb25maWcubWF4X3dpZHRoIGZyb20gRFJN
X1NIQURPV19QTEFORV9NQVhfV0lEVEguDQo+IA0KPiBXaHkgd291bGQgYSBkcml2ZXIgZG8g
dGhhdCBpbnN0ZWFkIG9mIHVzaW5nIGEgdmFsdWUgb2YgaXRzIG93bj8gSXMgaXQNCj4gc29t
ZSBraW5kIG9mIHN0YW5kYXJkaXphdGlvbj8NCg0KRXhhY3RseS4gVGhlIHNoYWRvdyBmcmFt
ZWJ1ZmZlciBpcyBpbiBzeXN0ZW0gbWVtb3J5LCBzbyBpdHMgc2l6ZSBpcyANCmFyYml0cmFy
aWx5IGxhcmdlLiBJZiBlYWNoIGRyaXZlciBzZXRzIGl0cyBvd24gbGltaXQsIGl0IGp1c3Qg
ZnJhZ21lbnRzIA0KdGhlIERSTSBmZWF0dXJlIHNldC4gVGhlcmUncyB1c3VhbGx5IG5vIHJl
YXNvbiB3aHkgb25lIGRyaXZlciBjYW4gaGF2ZSANCjQwOTYgcGl4ZWxzIGFuZCBhbm90aGVy
IG9uZSBqdXN0IDIwNDggb3IgZXZlbiA4MTkyLiBTZXR0aW5nIGEgY29uc3RhbnQgDQpoYXJt
b25pemVzIHRoaXMgYW1vbmcgZHJpdmVycy4NCg0KUGxlYXNlIG5vdGUgdGhhdCBub3RoaW5n
IHJlYWxseSBkZXBlbmRzIG9uIHRoaXMgdmFsdWUuIERyaXZlcnMgY2FuIHN0aWxsIA0KdXNl
IGEgZGlmZmVyZW50IGxpbWl0IGlmIHRoZXkgaGF2ZSB0by4NCg0KPiANCj4+ICsgKi8NCj4+
ICsjZGVmaW5lIERSTV9TSEFET1dfUExBTkVfTUFYX1dJRFRICSgxdWwgPDwgMTIpDQo+IA0K
PiBQbGVhc2UgdXNlIGEgZGVjaW1hbCBudW1iZXIsIEknbSBzbyBzbG93IGF0IGRvaW5nIHRo
aXMgaW4gbXkgaGVhZCB0aGF0IEkNCj4gdXNlIGJhc2ggdG8gY2FsY3VsYXRlIGl0IGZvciBt
ZSwgd2hpY2ggcmVhbGx5IHNsb3dzIGRvd24gcGFyc2luZyB0aGUgY29kZS4NCg0KT2suIDpE
DQoNCkJlc3QgcmVnYXJkDQpUaG9tYXMNCg0KPiANCj4gTm9yYWxmLg0KPiANCj4+ICsNCj4+
ICsvKioNCj4+ICsgKiBEUk1fU0hBRE9XX1BMQU5FX01BWF9IRUlHSFQgLSBNYXhpbXVtIGhl
aWdodCBvZiBhIHBsYW5lJ3Mgc2hhZG93IGJ1ZmZlciBpbiBzY2FubGluZXMNCj4+ICsgKg0K
Pj4gKyAqIEZvciBkcml2ZXJzIHdpdGggc2hhZG93IHBsYW5lcywgdGhlIG1heGltdW0gaGVp
Z2h0IG9mIHRoZSBmcmFtZWJ1ZmZlciBpcw0KPj4gKyAqIHVzdWFsbHkgaW5kZXBlbmRlbnQg
ZnJvbSBoYXJkd2FyZSBsaW1pdGF0aW9ucy4gRHJpdmVycyBjYW4gaW5pdGlhbGl6ZSBzdHJ1
Y3QNCj4+ICsgKiBkcm1fbW9kZV9jb25maWcubWF4X2hlaWdodCBmcm9tIERSTV9TSEFET1df
UExBTkVfTUFYX0hFSUdIVC4NCj4+ICsgKi8NCj4+ICsjZGVmaW5lIERSTV9TSEFET1dfUExB
TkVfTUFYX0hFSUdIVAkoMXVsIDw8IDEyKQ0KPj4gKw0KPj4gICAvKioNCj4+ICAgICogc3Ry
dWN0IGRybV9zaGFkb3dfcGxhbmVfc3RhdGUgLSBwbGFuZSBzdGF0ZSBmb3IgcGxhbmVzIHdp
dGggc2hhZG93IGJ1ZmZlcnMNCj4+ICAgICoNCj4+DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1h
bm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55
DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRv
dGV2DQo=

--------------E2BL7AAL30DVsV0kEYWQcr0S--

--------------N5BSEpWwPsVWVnf9L5B2cDKG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGKOhMFAwAAAAAACgkQlh/E3EQov+AO
nQ/+Jtwuw6Zjadu+qsI+zyhoNIFfdUKylkCk5dbomkYNPNR5VXpFXf/fCaFHGkx9sHIPJcTV/uri
ulIWyB+CADBoArIWK3WAQ/6d+61IFeb8M0Gzbun4FKOaIoMgGsTusCQo/PrlxOCijTbDgNliCPlN
NDK+0vn7kohuNS9wtyP4XF0yR7IJS8/2DKqrmcOPoWZw1B4eLWnU68oLPHbm+RFm7Bhi3Y7rxgAu
jKLMvLGRe/7fKNeaVMSc7Ziox8J4o++Kn/KtA+L+4EsJI4OMLVzVbcMED21bxeQ04XIwd3eRVPdJ
WKVNJBH5fr7HNqJz7mLxiQu6eTjFvCYZ+eeOHWVy43GeeIUtiZhMQL3aWBpMW5ntsrYErqt2BUfy
no0LVJuqXSrVqa9U8y4z2V+K2ey3A6HeNWudCAQwl1hAs9YMlU/VmjW/NEZOuhmEm42pz+JLsSdQ
XG0zWKtm1O42o1WtFhQrdVzCRi0KmXs3zkv8POA1BlEU+uoa+dv7IB0j5EcxXgpieIBe8t25/HCS
+BJtrB+jH9MOV98gS8U+kkVrTPbVvi8sWq2B00bVV2Y/BYM1k0xhqC0n8lNrP85ILC85LsMjqa+L
9xBTx45Bk3h9aCErubVXyfsY50TS+eOVNnCoUAwdgBAlB5gC/hlPHXPQz+s/LNWWyv/SW3DIQbV/
fS4=
=g/B5
-----END PGP SIGNATURE-----

--------------N5BSEpWwPsVWVnf9L5B2cDKG--

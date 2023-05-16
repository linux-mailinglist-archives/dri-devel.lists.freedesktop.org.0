Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 557AB704EEE
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 15:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E7810E1CB;
	Tue, 16 May 2023 13:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7277E10E1C2;
 Tue, 16 May 2023 13:13:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 261CB1FE6D;
 Tue, 16 May 2023 13:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684242785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ogdt9jSbi0tvxD4d3F6VeNsH8BYjTttGkeT43PALy5E=;
 b=wYGJ6+OnghGS2a+yu/AjPwtJV17WnSvQQCiAnSED73wvJV7x0V5FddzCwSJryuKnOToMut
 cUWvNND+TVir4jApxrF4N4dFhQvfglinuNu0lbjcDS9jJNxFRmBHqe1gEBO4yoKD1tsDtq
 hxiePLzY8LITkzD+iySVZ3hYhjKhQgo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684242785;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ogdt9jSbi0tvxD4d3F6VeNsH8BYjTttGkeT43PALy5E=;
 b=+R5i2rwoPF/2rMlRCY+3hyEXs0TvhAHXyIwKUnOtGJ+MIkPvnYpWXa8+/R+Hr2vtCBo/oZ
 Rs3QdcTwPZRcXeBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B3544138F5;
 Tue, 16 May 2023 13:13:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3RSvKmCBY2SzQAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 16 May 2023 13:13:04 +0000
Message-ID: <297a1808-f36a-1bbb-8a7e-dd41c5ee2a7b@suse.de>
Date: Tue, 16 May 2023 15:13:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 02/12] drm/armada: Use regular fbdev I/O helpers
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20230515094033.2133-1-tzimmermann@suse.de>
 <20230515094033.2133-3-tzimmermann@suse.de>
 <20230515175544.GB1745913@ravnborg.org>
 <ZGJ0QIQrF/a0Wkri@shell.armlinux.org.uk>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <ZGJ0QIQrF/a0Wkri@shell.armlinux.org.uk>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2T0MthFqqog40rzw0G3raXj4"
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
Cc: freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2T0MthFqqog40rzw0G3raXj4
Content-Type: multipart/mixed; boundary="------------VmgaSFKk8JQLm74FK1PaEpjV";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, javierm@redhat.com, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Message-ID: <297a1808-f36a-1bbb-8a7e-dd41c5ee2a7b@suse.de>
Subject: Re: [PATCH v2 02/12] drm/armada: Use regular fbdev I/O helpers
References: <20230515094033.2133-1-tzimmermann@suse.de>
 <20230515094033.2133-3-tzimmermann@suse.de>
 <20230515175544.GB1745913@ravnborg.org>
 <ZGJ0QIQrF/a0Wkri@shell.armlinux.org.uk>
In-Reply-To: <ZGJ0QIQrF/a0Wkri@shell.armlinux.org.uk>

--------------VmgaSFKk8JQLm74FK1PaEpjV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTUuMDUuMjMgdW0gMjA6MDQgc2NocmllYiBSdXNzZWxsIEtpbmcgKE9yYWNs
ZSk6DQo+IE9uIE1vbiwgTWF5IDE1LCAyMDIzIGF0IDA3OjU1OjQ0UE0gKzAyMDAsIFNhbSBS
YXZuYm9yZyB3cm90ZToNCj4+IEhpIFRob21hcywNCj4+DQo+PiBPbiBNb24sIE1heSAxNSwg
MjAyMyBhdCAxMTo0MDoyM0FNICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+
PiBVc2UgdGhlIHJlZ3VsYXIgZmJkZXYgaGVscGVycyBmb3IgZnJhbWVidWZmZXIgSS9PIGlu
c3RlYWQgb2YgRFJNJ3MNCj4+PiBoZWxwZXJzLiBBcm1hZGEgZG9lcyBub3QgdXNlIGRhbWFn
ZSBoYW5kbGluZywgc28gRFJNJ3MgZmJkZXYgaGVscGVycw0KPj4+IGFyZSBtZXJlIHdyYXBw
ZXJzIGFyb3VuZCB0aGUgZmJkZXYgY29kZS4NCj4+Pg0KPj4+IEJ5IHVzaW5nIGZiZGV2IGhl
bHBlcnMgZGlyZWN0bHkgd2l0aGluIGVhY2ggRFJNIGZiZGV2IGVtdWxhdGlvbiwNCj4+PiB3
ZSBjYW4gZXZlbnR1YWxseSByZW1vdmUgRFJNJ3Mgd3JhcHBlciBmdW5jdGlvbnMgZW50aXJl
bHkuDQo+Pj4NCj4+PiB2MjoNCj4+PiAJKiB1c2UgRkJfSU9fSEVMUEVSUyBvcHRpb24NCj4+
Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPg0KPj4+IENjOiBSdXNzZWxsIEtpbmcgPGxpbnV4QGFybWxpbnV4Lm9yZy51az4N
Cj4+PiAtLS0NCj4+PiAgIGRyaXZlcnMvZ3B1L2RybS9hcm1hZGEvS2NvbmZpZyAgICAgICAg
fCAxICsNCj4+PiAgIGRyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRhX2ZiZGV2LmMgfCA5
ICsrKystLS0tLQ0KPj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Fy
bWFkYS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL2FybWFkYS9LY29uZmlnDQo+Pj4gaW5k
ZXggZjVjNjZkODliYTk5Li41YWZhZGUyNWUyMTcgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FybWFkYS9LY29uZmlnDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bWFkYS9LY29uZmlnDQo+Pj4gQEAgLTMsNiArMyw3IEBAIGNvbmZpZyBEUk1fQVJNQURBDQo+
Pj4gICAJdHJpc3RhdGUgIkRSTSBzdXBwb3J0IGZvciBNYXJ2ZWxsIEFybWFkYSBTb0NzIg0K
Pj4+ICAgCWRlcGVuZHMgb24gRFJNICYmIEhBVkVfQ0xLICYmIEFSTSAmJiBNTVUNCj4+PiAg
IAlzZWxlY3QgRFJNX0tNU19IRUxQRVINCj4+PiArCXNlbGVjdCBGQl9JT19IRUxQRVJTIGlm
IERSTV9GQkRFVl9FTVVMQVRJT04NCj4+PiAgIAloZWxwDQo+Pj4gICAJICBTdXBwb3J0IHRo
ZSAiTENEIiBjb250cm9sbGVycyBmb3VuZCBvbiB0aGUgTWFydmVsbCBBcm1hZGEgNTEwDQo+
Pj4gICAJICBkZXZpY2VzLiAgVGhlcmUgYXJlIHR3byBjb250cm9sbGVycyBvbiB0aGUgZGV2
aWNlLCBlYWNoIGNvbnRyb2xsZXINCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FybWFkYS9hcm1hZGFfZmJkZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm1hZGEvYXJtYWRh
X2ZiZGV2LmMNCj4+PiBpbmRleCAwYTVmZDFhYTg2ZWIuLjZjM2JiYWY1MzU2OSAxMDA2NDQN
Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9mYmRldi5jDQo+Pj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfZmJkZXYuYw0KPj4+IEBAIC01
LDYgKzUsNyBAQA0KPj4+ICAgICovDQo+Pj4gICANCj4+PiAgICNpbmNsdWRlIDxsaW51eC9l
cnJuby5oPg0KPj4+ICsjaW5jbHVkZSA8bGludXgvZmIuaD4NCj4+PiAgICNpbmNsdWRlIDxs
aW51eC9rZXJuZWwuaD4NCj4+PiAgICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4+PiAg
IA0KPj4+IEBAIC0zNCwxMSArMzUsOSBAQCBzdGF0aWMgdm9pZCBhcm1hZGFfZmJkZXZfZmJf
ZGVzdHJveShzdHJ1Y3QgZmJfaW5mbyAqaW5mbykNCj4+PiAgIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgZmJfb3BzIGFybWFkYV9mYl9vcHMgPSB7DQo+Pj4gICAJLm93bmVyCQk9IFRISVNfTU9E
VUxFLA0KPj4+ICAgCURSTV9GQl9IRUxQRVJfREVGQVVMVF9PUFMsDQo+Pj4gLQkuZmJfcmVh
ZAk9IGRybV9mYl9oZWxwZXJfY2ZiX3JlYWQsDQo+Pj4gLQkuZmJfd3JpdGUJPSBkcm1fZmJf
aGVscGVyX2NmYl93cml0ZSwNCj4+IEkgaGFkIGV4cGVjdGVkIHRvIHNlZQ0KPj4gLmZiX3Jl
YWQgPSBmYl9pb19yZWFkLA0KPj4NCj4+IEJ1dCBtYXliZSB0aGlzIG9ubHkgdXNlZCB3aGVu
IHVzaW5nIGRhbWFnZSBoYW5kbGluZz8NCj4+DQo+PiBMaWtld2lzZSBmb3IgZHJtX2ZiX2hl
bHBlcl9jZmJfd3JpdGUuDQo+Pg0KPj4gPz8NCj4+DQo+Pj4gLQkuZmJfZmlsbHJlY3QJPSBk
cm1fZmJfaGVscGVyX2NmYl9maWxscmVjdCwNCj4+PiAtCS5mYl9jb3B5YXJlYQk9IGRybV9m
Yl9oZWxwZXJfY2ZiX2NvcHlhcmVhLA0KPj4+IC0JLmZiX2ltYWdlYmxpdAk9IGRybV9mYl9o
ZWxwZXJfY2ZiX2ltYWdlYmxpdCwNCj4+PiArCS5mYl9maWxscmVjdAk9IGNmYl9maWxscmVj
dCwNCj4+PiArCS5mYl9jb3B5YXJlYQk9IGNmYl9jb3B5YXJlYSwNCj4+PiArCS5mYl9pbWFn
ZWJsaXQJPSBjZmJfaW1hZ2VibGl0LA0KPj4NCj4+IFRoaXMgcGFydCBpcyBhcyBleHBlY3Rl
ZC4NCj4gDQo+IFdlbGwsIHRvIG1lIGl0IGxvb2tzIGxpa2UgdGhpcyBoYXMgZ29uZSB0aHJv
dWdoIGFuIGVudGlyZSBjaXJjdWxhciBzZXQNCj4gb2YgcmV2aXNpb25zOg0KPiANCj4gY29t
bWl0IGU4YjcwZTRkZDdiNWRhZDdjMjM3OWRlNmUwODUxNTg3YmY4NmJmZDYNCj4gQXV0aG9y
OiBBcmNoaXQgVGFuZWphIDxhcmNoaXR0QGNvZGVhdXJvcmEub3JnPg0KPiBEYXRlOiAgIFdl
ZCBKdWwgMjIgMTQ6NTg6MDQgMjAxNSArMDUzMA0KPiANCj4gICAgICBkcm0vYXJtYWRhOiBV
c2UgbmV3IGRybV9mYl9oZWxwZXIgZnVuY3Rpb25zDQo+IA0KPiAtICAgICAgIC5mYl9maWxs
cmVjdCAgICA9IGNmYl9maWxscmVjdCwNCj4gLSAgICAgICAuZmJfY29weWFyZWEgICAgPSBj
ZmJfY29weWFyZWEsDQo+IC0gICAgICAgLmZiX2ltYWdlYmxpdCAgID0gY2ZiX2ltYWdlYmxp
dCwNCj4gKyAgICAgICAuZmJfZmlsbHJlY3QgICAgPSBkcm1fZmJfaGVscGVyX2NmYl9maWxs
cmVjdCwNCj4gKyAgICAgICAuZmJfY29weWFyZWEgICAgPSBkcm1fZmJfaGVscGVyX2NmYl9j
b3B5YXJlYSwNCj4gKyAgICAgICAuZmJfaW1hZ2VibGl0ICAgPSBkcm1fZmJfaGVscGVyX2Nm
Yl9pbWFnZWJsaXQsDQo+IA0KPiBjb21taXQgOTgzNzgwOTE4Yzc1OWZkYmJmMGJmMDMzZTcw
MWJiZmY3NWQyYWYyMw0KPiBBdXRob3I6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFu
bkBzdXNlLmRlPg0KPiBEYXRlOiAgIFRodSBOb3YgMyAxNjoxNDo0MCAyMDIyICswMTAwDQo+
IA0KPiAgICAgIGRybS9mYi1oZWxwZXI6IFBlcmZvcm0gYWxsIGZiZGV2IEkvTyB3aXRoIHRo
ZSBzYW1lIGltcGxlbWVudGF0aW9uDQo+IA0KPiArICAgICAgIC5mYl9yZWFkICAgICAgICA9
IGRybV9mYl9oZWxwZXJfY2ZiX3JlYWQsDQo+ICsgICAgICAgLmZiX3dyaXRlICAgICAgID0g
ZHJtX2ZiX2hlbHBlcl9jZmJfd3JpdGUsDQo+IA0KPiBhbmQgbm93IGVmZmVjdGl2ZWx5IHRo
b3NlIHR3byBjaGFuZ2VzIGFyZSBiZWluZyByZXZlcnRlZCwgc28gd2UnZA0KPiBub3cgYmUg
YmFjayB0byB0aGUgcHJlLUp1bHkgMjAxNSBzdGF0ZSBvZiBhZmZhaXJzLiBBcyBJIGJlbGll
dmUNCj4gdGhlIGZiZGV2IGxheWVyIGhhcyBiZWVuIHN0YWJsZSwgdGhpcyBjaGFuZ2UgbWVy
ZWx5IHJldmVydHMgdGhlDQo+IGRyaXZlciBiYWNrIHRvIHdoYXQgaXQgb25jZSB3YXMuDQoN
Ck5vdCBxdWl0ZS4gT25lIGxvbmctc3RhbmRpbmcgcHJvYmxlbSBoYXMgYmVlbiB0aGF0IGZi
ZGV2IGRvZXMgbm90IA0KcHJvdGVjdCBpdHMgcHVibGljIGludGVyZmFjZXMgd2l0aCBDT05G
SUdfRkIuIElmIGZiZGV2IGhhZCBiZWVuIA0KZGlzYWJsZWQsIERSTSBkcml2ZXJzIGNvdWxk
IG5vIGxvbmdlciBiZSBsaW5rZWQvbG9hZGVkLiBEUk0gd3JhcHBlcnMgDQpzb2x2ZWQgdGhp
cy4gVGhlIGlzc3VlIGhhcyByZWNlbnRseSBiZWVuIGZpeGVkIGZvciBhbGwgb2YgRFJNLiBE
Uk0gZG9lcyANCm5vdCBidWlsZCBpdCdzIGZiZGV2IGVtdWxhdGlvbiBpZiBDT05GSUdfRkIg
aGFzIGJlZW4gZGlzYWJsZWQuDQoNCkFub3RoZXIgdGhpbmcgd2FzIHRoYXQgdGhlIG9yaWdp
bmFsIERSTSB3cmFwcGVycyBtaWdodCBoYXZlIGJlZW4gDQpkaWZmZXJlbnQgZnJvbSBmYmRl
didzIEkvTyBoZWxwZXJzIGluIHN1YnRsZSB3YXlzLiBCdXQgbm93IHRoZXkgYXJlIA0Kc2lt
cGxlIHdyYXBwZXJzIGFyb3VuZCB0aGVpciBmYmRldiBjb3VudGVycGFydHM7IHBsdXMgdGhl
IG9wdGlvbiBvZiANCmFkZGl0aW9uYWwgZGFtYWdlIGhhbmRsaW5nLiAgQnV0IHN1Y2ggZGFt
YWdlIGhhbmRsaW5nIGlzIGJldHRlciANCmltcGxlbWVudGVkIGJ5IHRoZSBkcml2ZXIgaXRz
ZWxmLiBUaGUgdHdvIGNhc2VzIHRoYXQgcmVxdWlyZSBpdCwgaTkxNSANCmFuZCBmYmRldi1n
ZW5lcmljLCBhcmUgZGlmZmVyZW50IGVub3VnaCB0aGF0IGVhY2ggc2hvdWxkIHByb2JhYmx5
IGhhdmUgDQppdCdzIG93biBjb2RlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0K
DQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0
NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXll
cnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51
ZXJuYmVyZykNCg==

--------------VmgaSFKk8JQLm74FK1PaEpjV--

--------------2T0MthFqqog40rzw0G3raXj4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRjgWAFAwAAAAAACgkQlh/E3EQov+AP
jRAAwwKH9s/OU5FEOdFhofJdQds0AENMzHbfz4wwkve69TDD5BypitQp2nS84xFHvd7AZK2K2S/J
ZQPOQQ5TJHpC1PfYRstQtN4l/Db0E3P3xFYhjgdIUxa/B/ICiB1zrLcl/N8gvrXm81DCiZonTJzP
WPJGhQV+VQwjc06//ynbyeRtrxLUar6ZPBscBtmKo1vPmpbgeAj7AonyPKE7YuiHL5dmSgIdS0/h
fr393sm9KwhdKHFpnQAcsrabAUCu4+T10EcYWeJXjNYQvi5ptbVMoyjV+1MySeOTne+IJ21LoTNP
oXJ3v8BJd+w9xm6vdfnhIkhlXi5cAIZjAMA65984bERd3PygsKYLzYOtm7XsKE34ZGcUfOCyTBwu
f4MMGt8toM22ToQJg29meHpceO7oWOY7HzpOrfnRXqkW+bdZdBkn3OJVWu5T1QhShnUKriyNN0zu
GmiCTFZUSrRI75V+UHK8I86LZGbUwoLdHWizBWBh7ZFsTYyYSh375LmtV8Iplxl7+Y9viYcxkBO2
USfeCw3mgNGcxtAeCX1KrkD0SvW24izC8/Wh8469Mfw/WD+gKgpQXPJSe4ot18mRzXcEQDUij34Z
sAN3+oVetyb+9Qi5F303/SwUGkvhfTD2vIINJzUGvJxvqJOy4lDX8xdjDxjgEIY+6NCgf01diiYC
qTE=
=XZcT
-----END PGP SIGNATURE-----

--------------2T0MthFqqog40rzw0G3raXj4--

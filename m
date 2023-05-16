Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44944704EFD
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 15:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8911B10E1EC;
	Tue, 16 May 2023 13:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D947F10E1E0;
 Tue, 16 May 2023 13:14:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 748C71FE71;
 Tue, 16 May 2023 13:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684242882; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GKjzpGS7tW9V68LhGYL4giB4gAwlkVhk3ib1w3wujrY=;
 b=08y7cz0zUoL+B1F0ZnnVCoCB/4jFvI7X20l0zIjXaQlTqZMqx9sgy/LKRMVrrRUuzmfAnf
 i9O12SAtRYGwB9Jrjw/wo88lScIA3GftZmlhAg2xN1CD3rlS4xUGVNLuhuOGpEFiD7AUyi
 lTUbiJWgyj8oRALacVljgEIzReffcpw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684242882;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GKjzpGS7tW9V68LhGYL4giB4gAwlkVhk3ib1w3wujrY=;
 b=Ub4B6xfMkjIbfuZNAczm4TfxQQ1Ry/K1sr6L+BhKR6AnThvExTqMkDNNkLfGD0Qp2q+DB4
 9oj//2UjAe4mDyBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0E3F2138F5;
 Tue, 16 May 2023 13:14:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3qNtAsKBY2R/QQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 16 May 2023 13:14:42 +0000
Message-ID: <09028144-8666-ba64-d94d-92139e469efe@suse.de>
Date: Tue, 16 May 2023 15:14:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 03/12] drm/exynos: Use regular fbdev I/O helpers
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20230515094033.2133-1-tzimmermann@suse.de>
 <20230515094033.2133-4-tzimmermann@suse.de>
 <20230515174320.GA1745913@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230515174320.GA1745913@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lmicXarUWLuzvl3cSPm20cMq"
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
 Alim Akhtar <alim.akhtar@samsung.com>, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 javierm@redhat.com, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lmicXarUWLuzvl3cSPm20cMq
Content-Type: multipart/mixed; boundary="------------mIKpmu0MXjw05PYRo3QM4tHe";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, javierm@redhat.com, linux-samsung-soc@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>,
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Message-ID: <09028144-8666-ba64-d94d-92139e469efe@suse.de>
Subject: Re: [PATCH v2 03/12] drm/exynos: Use regular fbdev I/O helpers
References: <20230515094033.2133-1-tzimmermann@suse.de>
 <20230515094033.2133-4-tzimmermann@suse.de>
 <20230515174320.GA1745913@ravnborg.org>
In-Reply-To: <20230515174320.GA1745913@ravnborg.org>

--------------mIKpmu0MXjw05PYRo3QM4tHe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2FtDQoNCkFtIDE1LjA1LjIzIHVtIDE5OjQzIHNjaHJpZWIgU2FtIFJhdm5ib3JnOg0K
PiBIaSBUaG9tYXMsDQo+IA0KPiBPbiBNb24sIE1heSAxNSwgMjAyMyBhdCAxMTo0MDoyNEFN
ICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IFVzZSB0aGUgcmVndWxhciBm
YmRldiBoZWxwZXJzIGZvciBmcmFtZWJ1ZmZlciBJL08gaW5zdGVhZCBvZiBEUk0ncw0KPj4g
aGVscGVycy4gRXh5bm9zIGRvZXMgbm90IHVzZSBkYW1hZ2UgaGFuZGxpbmcsIHNvIERSTSdz
IGZiZGV2IGhlbHBlcnMNCj4+IGFyZSBtZXJlIHdyYXBwZXJzIGFyb3VuZCB0aGUgZmJkZXYg
Y29kZS4NCj4+DQo+PiBCeSB1c2luZyBmYmRldiBoZWxwZXJzIGRpcmVjdGx5IHdpdGhpbiBl
YWNoIERSTSBmYmRldiBlbXVsYXRpb24sDQo+PiB3ZSBjYW4gZXZlbnR1YWxseSByZW1vdmUg
RFJNJ3Mgd3JhcHBlciBmdW5jdGlvbnMgZW50aXJlbHkuDQo+Pg0KPj4gdjI6DQo+PiAJKiB1
c2UgRkJfSU9fSEVMUEVSUyBvcHRpb24NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IENjOiBJbmtpIERhZSA8aW5r
aS5kYWVAc2Ftc3VuZy5jb20+DQo+PiBDYzogU2V1bmctV29vIEtpbSA8c3cwMzEyLmtpbUBz
YW1zdW5nLmNvbT4NCj4+IENjOiBLeXVuZ21pbiBQYXJrIDxreXVuZ21pbi5wYXJrQHNhbXN1
bmcuY29tPg0KPj4gQ2M6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dz
a2lAbGluYXJvLm9yZz4NCj4+IENjOiBBbGltIEFraHRhciA8YWxpbS5ha2h0YXJAc2Ftc3Vu
Zy5jb20+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9LY29uZmlnICAg
ICAgICAgICAgfCAgMSArDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvTWFrZWZpbGUg
ICAgICAgICAgIHwgIDIgKy0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3Nf
ZHJtX2ZiZGV2LmMgfCAxMCArKysrKy0tLS0tDQo+PiAgIDMgZmlsZXMgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZXh5bm9zL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL0tj
b25maWcNCj4+IGluZGV4IDBjYjkyZDY1MWZmMS4uN2NhN2UxZGFiNTJjIDEwMDY0NA0KPj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9LY29uZmlnDQo+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL0tjb25maWcNCj4+IEBAIC03LDYgKzcsNyBAQCBjb25maWcgRFJN
X0VYWU5PUw0KPj4gICAJc2VsZWN0IERSTV9ESVNQTEFZX0hFTFBFUiBpZiBEUk1fRVhZTk9T
X0RQDQo+PiAgIAlzZWxlY3QgRFJNX0tNU19IRUxQRVINCj4+ICAgCXNlbGVjdCBWSURFT01P
REVfSEVMUEVSUw0KPj4gKwlzZWxlY3QgRkJfSU9fSEVMUEVSUyBpZiBEUk1fRkJERVZfRU1V
TEFUSU9ODQo+PiAgIAlzZWxlY3QgU05EX1NPQ19IRE1JX0NPREVDIGlmIFNORF9TT0MNCj4+
ICAgCWhlbHANCj4+ICAgCSAgQ2hvb3NlIHRoaXMgb3B0aW9uIGlmIHlvdSBoYXZlIGEgU2Ft
c3VuZyBTb0MgRXh5bm9zIGNoaXBzZXQuDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2V4eW5vcy9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvTWFrZWZpbGUN
Cj4+IGluZGV4IDJmZDJmM2VlNGZjZi4uMjMzYTY2MDM2NTg0IDEwMDY0NA0KPj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9NYWtlZmlsZQ0KPj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2V4eW5vcy9NYWtlZmlsZQ0KPj4gQEAgLTYsNyArNiw2IEBADQo+PiAgIGV4eW5vc2Ry
bS15IDo9IGV4eW5vc19kcm1fZHJ2Lm8gZXh5bm9zX2RybV9jcnRjLm8gZXh5bm9zX2RybV9m
Yi5vIFwNCj4+ICAgCQlleHlub3NfZHJtX2dlbS5vIGV4eW5vc19kcm1fcGxhbmUubyBleHlu
b3NfZHJtX2RtYS5vDQo+PiAgIA0KPj4gLWV4eW5vc2RybS0kKENPTkZJR19EUk1fRkJERVZf
RU1VTEFUSU9OKSArPSBleHlub3NfZHJtX2ZiZGV2Lm8NCj4+ICAgZXh5bm9zZHJtLSQoQ09O
RklHX0RSTV9FWFlOT1NfRklNRCkJKz0gZXh5bm9zX2RybV9maW1kLm8NCj4+ICAgZXh5bm9z
ZHJtLSQoQ09ORklHX0RSTV9FWFlOT1M1NDMzX0RFQ09OKQkrPSBleHlub3M1NDMzX2RybV9k
ZWNvbi5vDQo+PiAgIGV4eW5vc2RybS0kKENPTkZJR19EUk1fRVhZTk9TN19ERUNPTikJKz0g
ZXh5bm9zN19kcm1fZGVjb24ubw0KPj4gQEAgLTIzLDUgKzIyLDYgQEAgZXh5bm9zZHJtLSQo
Q09ORklHX0RSTV9FWFlOT1NfUk9UQVRPUikJKz0gZXh5bm9zX2RybV9yb3RhdG9yLm8NCj4+
ICAgZXh5bm9zZHJtLSQoQ09ORklHX0RSTV9FWFlOT1NfU0NBTEVSKQkrPSBleHlub3NfZHJt
X3NjYWxlci5vDQo+PiAgIGV4eW5vc2RybS0kKENPTkZJR19EUk1fRVhZTk9TX0dTQykJKz0g
ZXh5bm9zX2RybV9nc2Mubw0KPj4gICBleHlub3Nkcm0tJChDT05GSUdfRFJNX0VYWU5PU19N
SUMpICAgICArPSBleHlub3NfZHJtX21pYy5vDQo+PiArZXh5bm9zZHJtLSQoQ09ORklHX0RS
TV9GQkRFVl9FTVVMQVRJT04pCSs9IGV4eW5vc19kcm1fZmJkZXYubw0KPiBXaGF0IGRvZXMg
dGhpcyBjaGFuZ2UgZG8/DQo+IE1heWJlIHNvbWV0aGluZyB0aGF0IHdhcyBsZWZ0IGJ5IGFj
Y2lkZW50Pw0KDQpJdCByZW9yZGVycyB0aGUgc3RhdGVtZW50cyBhbHBoYWJldGljYWxseS4g
SSBjYW4gcmVtb3ZlIHRoaXMsIGlmIHVud2FudGVkLg0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQo+IA0KPiAJU2FtDQo+IA0KPj4gICANCj4+ICAgb2JqLSQoQ09ORklHX0RSTV9FWFlO
T1MpCQkrPSBleHlub3Nkcm0ubw0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9l
eHlub3MvZXh5bm9zX2RybV9mYmRldi5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlu
b3NfZHJtX2ZiZGV2LmMNCj4+IGluZGV4IGVhNGIzZDI0OGFhYy4uYjMzMzNkZDFkMDg3IDEw
MDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZiZGV2
LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9mYmRldi5j
DQo+PiBAQCAtOCw2ICs4LDggQEANCj4+ICAgICoJU2V1bmctV29vIEtpbSA8c3cwMzEyLmtp
bUBzYW1zdW5nLmNvbT4NCj4+ICAgICovDQo+PiAgIA0KPj4gKyNpbmNsdWRlIDxsaW51eC9m
Yi5oPg0KPj4gKw0KPj4gICAjaW5jbHVkZSA8ZHJtL2RybV9jcnRjX2hlbHBlci5oPg0KPj4g
ICAjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4NCj4+ICAgI2luY2x1ZGUgPGRybS9kcm1fZmJf
aGVscGVyLmg+DQo+PiBAQCAtNDksMTEgKzUxLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBm
Yl9vcHMgZXh5bm9zX2RybV9mYl9vcHMgPSB7DQo+PiAgIAkub3duZXIJCT0gVEhJU19NT0RV
TEUsDQo+PiAgIAlEUk1fRkJfSEVMUEVSX0RFRkFVTFRfT1BTLA0KPj4gICAJLmZiX21tYXAg
ICAgICAgID0gZXh5bm9zX2RybV9mYl9tbWFwLA0KPj4gLQkuZmJfcmVhZAk9IGRybV9mYl9o
ZWxwZXJfY2ZiX3JlYWQsDQo+PiAtCS5mYl93cml0ZQk9IGRybV9mYl9oZWxwZXJfY2ZiX3dy
aXRlLA0KPj4gLQkuZmJfZmlsbHJlY3QJPSBkcm1fZmJfaGVscGVyX2NmYl9maWxscmVjdCwN
Cj4+IC0JLmZiX2NvcHlhcmVhCT0gZHJtX2ZiX2hlbHBlcl9jZmJfY29weWFyZWEsDQo+PiAt
CS5mYl9pbWFnZWJsaXQJPSBkcm1fZmJfaGVscGVyX2NmYl9pbWFnZWJsaXQsDQo+PiArCS5m
Yl9maWxscmVjdAk9IGNmYl9maWxscmVjdCwNCj4+ICsJLmZiX2NvcHlhcmVhCT0gY2ZiX2Nv
cHlhcmVhLA0KPj4gKwkuZmJfaW1hZ2VibGl0CT0gY2ZiX2ltYWdlYmxpdCwNCj4+ICAgCS5m
Yl9kZXN0cm95CT0gZXh5bm9zX2RybV9mYl9kZXN0cm95LA0KPj4gICB9Ow0KPj4gICANCj4+
IC0tIA0KPj4gMi40MC4xDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
RnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8g
VG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4N
CkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------mIKpmu0MXjw05PYRo3QM4tHe--

--------------lmicXarUWLuzvl3cSPm20cMq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRjgcEFAwAAAAAACgkQlh/E3EQov+Ap
7xAAtDTqOO+cWdlVRZdjXBhkoahIqQTYsq6fXRlqOzJCc3QOiIqEoH6TKVXImK5JxjzEDfLsei5P
nifoeeMVEo6LeBIIYBSPNbNVmLDp6LXRD4lYQGFtQYRXHz/BmPV0htc2aDtCGX5sd9Y5rHQJM9pD
uUbJ3KoYRfr4vUXUpUgVhVWQ8EhJPkjKweiftJcP1R8nEKxEIlkg5iY3sebsuoFHqQEfZf0phelw
DyBnl9PvxGlMh8jN9zR9E5kepTqUZ1u64gdtC2lBvovBFXCiZSKRwlOaGuGzSJKSIcl2zrlxW30R
H5CA12nGNICsX6weA9eZbCWhTGn6cEVETY8fbs5MOSYtxMlAmwtToBmiKYRTsE4BtykSsXinzm5V
RSy4LeVLsWl0lVHW1n8XvjBS6A6JVHmrZchgGTJsFGNjCO4Utb8r8q/4VxmWIkozDshwFIG1DoPL
1FsE1WlbadqGGF1sSyS5xhedv3MvyxXXHrbnMEAGRIErmKjUUxbPZ2eb0CCyUhx7R/UhIkgOxpR+
qIPoMq61Q5PVOJua34IR9ncJR+VTgF8C1nnZEzJRW1O3EOc06fEHRxBDKwBhvDrzQy//cA+bDzyc
zB9s1hbttJgRR4zdYRmm+1A4yXuoWWPnvGG6tNGK2p33kSlwa/XOvvWlOSkeEV9DMkHIjODU+g3S
iwo=
=27yr
-----END PGP SIGNATURE-----

--------------lmicXarUWLuzvl3cSPm20cMq--

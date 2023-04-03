Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D106D4259
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 12:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0849F10E3D8;
	Mon,  3 Apr 2023 10:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BE910E3D8
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 10:41:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0A1351FDD9;
 Mon,  3 Apr 2023 10:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680518483; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wQIR61yAWGcWO9b4ZCc2ThYgy4SqxvwsfZqCj9g+n0I=;
 b=VSWtuO+15Exy6VXmAzHqsZCxsAE4IPaJu+79fRZ/pE+tRV2XVP1MDV/iwh1CZrdU4j1BjE
 mfiowUoN1taL1kwkN3ZXM7lKUOIVv1uN2SzLXFfdEAMpU73Zx0ybh/HOuoVwdf4tn6LkOB
 Bj4IANX+VcF+mci6ZBxSn/l8kP7M7gQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680518483;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wQIR61yAWGcWO9b4ZCc2ThYgy4SqxvwsfZqCj9g+n0I=;
 b=fMXBzJ/pgXQnKj3xYCYhgLW1S1azd5neZN3BoCPmSL5Mwscfz2gmJotrdf5bb1GztVKmrV
 qsaerLknnKhnXUBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C0D591331A;
 Mon,  3 Apr 2023 10:41:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7wsVLlKtKmSGDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 03 Apr 2023 10:41:22 +0000
Message-ID: <93b82d93-39d9-7e2f-2ac9-dad048e6851f@suse.de>
Date: Mon, 3 Apr 2023 12:41:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/5] drm/exynos: Convert fbdev to DRM client
Content-Language: en-US
To: Marek Szyprowski <m.szyprowski@samsung.com>, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, krzysztof.kozlowski@linaro.org,
 alim.akhtar@samsung.com
References: <CGME20230330073654eucas1p26d62d618ad8792ec4f2adcce8cfc2414@eucas1p2.samsung.com>
 <20230330073635.7409-1-tzimmermann@suse.de>
 <0d1e8fd9-e2a8-1ddf-943d-58fb3be3a0cf@samsung.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <0d1e8fd9-e2a8-1ddf-943d-58fb3be3a0cf@samsung.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hrzpZm0yAcHq0hHuX02m3RmK"
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hrzpZm0yAcHq0hHuX02m3RmK
Content-Type: multipart/mixed; boundary="------------srua5kjIPGL4v32Z0oAeEBq0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, krzysztof.kozlowski@linaro.org,
 alim.akhtar@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Message-ID: <93b82d93-39d9-7e2f-2ac9-dad048e6851f@suse.de>
Subject: Re: [PATCH 0/5] drm/exynos: Convert fbdev to DRM client
References: <CGME20230330073654eucas1p26d62d618ad8792ec4f2adcce8cfc2414@eucas1p2.samsung.com>
 <20230330073635.7409-1-tzimmermann@suse.de>
 <0d1e8fd9-e2a8-1ddf-943d-58fb3be3a0cf@samsung.com>
In-Reply-To: <0d1e8fd9-e2a8-1ddf-943d-58fb3be3a0cf@samsung.com>

--------------srua5kjIPGL4v32Z0oAeEBq0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDMxLjAzLjIzIHVtIDEyOjM2IHNjaHJpZWIgTWFyZWsgU3p5cHJvd3NraToNCj4g
T24gMzAuMDMuMjAyMyAwOTozNiwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+PiBDb252
ZXJ0IGV4eW5vcycgZmJkZXYgY29kZSB0byBzdHJ1Y3QgZHJtX2NsaWVudC4gUmVwbGFjZXMg
dGhlIGN1cnJlbnQNCj4+IGFkLWhvYyBpbnRlZ3JhdGlvbi4gVGhlIGNvbnZlcnNpb24gaW5j
bHVkZXMgYSBudW1iZXIgb2YgY2xlYW51cHMuIEFzDQo+PiB3aXRoIG1vc3Qgb3RoZXIgZHJp
dmVycycgZmJkZXYgZW11bGF0aW9uLCBmYmRldiBpbiBleHlub3MgaXMgbm93IGp1c3QNCj4+
IGFub3RoZXIgRFJNIGNsaWVudCB0aGF0IHJ1bnMgYWZ0ZXIgdGhlIERSTSBkZXZpY2UgaGFz
IGJlZW4gcmVnaXN0ZXJlZC4NCj4+DQo+PiBPbmNlIGFsbCBkcml2ZXJzJyBmYmRldiBlbXVs
YXRpb24gaGFzIGJlZW4gY29udmVydGVkIHRvIHN0cnVjdCBkcm1fY2xpZW50LA0KPj4gd2Ug
Y2FuIGF0dGVtcHQgdG8gYWRkIGFkZGl0aW9uYWwgaW4ta2VybmVsIGNsaWVudHMuIEEgRFJN
LWJhc2VkIGRtZXNnDQo+PiBsb2cgb3IgYSBib290c3BsYXNoIGFyZSBjb21tb25seSBtZW50
aW9uZWQuIERSTSBjYW4gdGhlbiBzd2l0Y2ggZWFzaWx5DQo+PiBhbW9uZyB0aGUgZXhpc3Rp
bmcgY2xpZW50cyBpZi93aGVuIHJlcXVpcmVkLg0KPj4NCj4+IEkgZGlkIHRoZSBjb252ZXJz
aW9uIGZyb20gc2ltaWxhciBleHBlcmllbmNlIHdpdGggb3RoZXIgZHJpdmVycy4gQnV0IEkN
Cj4+IGRvbid0IGhhdmUgdGhlIGhhcmR3YXJlIHRvIHRlc3QgdGhpcy4gQW55IHRlc3Rpbmcg
aXMgd2VsY29tZS4NCj4gDQo+IFNlZW1zIHRvIGJlIHdvcmtpbmcgZmluZS4gVGVzdGVkIHdp
dGggZGVmYXVsdCBmcmFtZWJ1ZmZlciBiYXNlZCBjb25zb2xlDQo+IGFuZCBzaW1wbGUgdG9v
bCB0aGF0IHdyaXRlcyBSR0IgZGF0YSB0byAvZGV2L2ZiMC4NCj4gDQo+IFRlc3RlZC1ieTog
TWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPg0KDQpUaGFua3Mg
YSBsb3QgZm9yIHRlc3RpbmcuDQoNCj4gDQo+IA0KPj4gVGhvbWFzIFppbW1lcm1hbm4gKDUp
Og0KPj4gICAgIGRybS9leHlub3M6IFJlbW92ZSBleHlub3NfZ2VtIGZyb20gc3RydWN0IGV4
eW5vc19kcm1fZmJkZXYNCj4+ICAgICBkcm0vZXh5bm9zOiBSZW1vdmUgc3RydWN0IGV4eW5v
c19kcm1fZmJkZXYNCj4+ICAgICBkcm0vZXh5bm9zOiBSZW1vdmUgZmJfaGVscGVyIGZyb20g
c3RydWN0IGV4eW5vc19kcm1fcHJpdmF0ZQ0KPj4gICAgIGRybS9leHlub3M6IEluaXRpYWxp
emUgZmJkZXYgRFJNIGNsaWVudA0KPj4gICAgIGRybS9leHlub3M6IEltcGxlbWVudCBmYmRl
diBlbXVsYXRpb24gYXMgaW4ta2VybmVsIGNsaWVudA0KPj4NCj4+ICAgIGRyaXZlcnMvZ3B1
L2RybS9leHlub3MvZXh5bm9zX2RybV9kcnYuYyAgIHwgIDEzICstDQo+PiAgICBkcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHJ2LmggICB8ICAgMiAtDQo+PiAgICBkcml2
ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmIuYyAgICB8ICAgMiAtDQo+PiAgICBk
cml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmJkZXYuYyB8IDE3NCArKysrKysr
KysrKy0tLS0tLS0tLS0tDQo+PiAgICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19k
cm1fZmJkZXYuaCB8ICAyMCArLS0NCj4+ICAgIDUgZmlsZXMgY2hhbmdlZCwgOTQgaW5zZXJ0
aW9ucygrKSwgMTE3IGRlbGV0aW9ucygtKQ0KPj4NCj4gQmVzdCByZWdhcmRzDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8
cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRz
ZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------srua5kjIPGL4v32Z0oAeEBq0--

--------------hrzpZm0yAcHq0hHuX02m3RmK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQqrVIFAwAAAAAACgkQlh/E3EQov+Da
FA//eDj4h6JDxQI17llLZsangcQvgSnHdXyfhsTalkniW0f8gmiwfx2XGLT+eBvTff3EM8EIAliH
Hqe5Cj95qIss3T5O42I+D160O5Jy8DLj8QFJljiDL3rwX3VycJN9Tt5uV9XKxRlWQt+RgI0D9O9b
jkLIFEWVCAds0Oy9qfuxyujCMBScWzrvKADp0yyHn14wn+ZYm6QTvTBBq4xJgUx1bhpyf7z2xxxm
axtOe2v5iuh2bRJ39IsfRtKhe60oSfcZeJf4VIVtqEsRi+OZnNQGq564Ff06pYslvELG7tRzoxqo
Jqzd/9vuChSl9N0PHkZO2FUjDQP4kzPej++0ZL1nSH0JLxOpa3JvXQp9OuyewvEpHHECEBYDptH/
6B/OQhbsodnvE6Gq4QT0ljeOIu1tWJ/jAUSPQM9ToNLCPuAaKjy89M1U6tcoAp5A1RJaEPnt5xOL
jkvwCCkX5VtHldbxsNfPylbMoKbbEaqhEB/MSrqJLN6IUmezJICtDFKPRciUZ9zPqSAq3PTvbfFi
/il0jxnG4eIr8JiEuqYsR/nSp4s3o152RbgBTOHAigIDmmMBlm7ih4mlEU1g04uotnEfmmuylvaN
ZBmAmGdkLCBSULX3f/Nj91GJhaWKWGb3f5+6iHAFngBYQdKfHcwAtMcH/D/lUxwGtN30MpVNfHgd
CyE=
=ml1b
-----END PGP SIGNATURE-----

--------------hrzpZm0yAcHq0hHuX02m3RmK--

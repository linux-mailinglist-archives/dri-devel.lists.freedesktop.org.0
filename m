Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BE4749F7A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 16:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1A810E415;
	Thu,  6 Jul 2023 14:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ADE410E415
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 14:47:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6D1A9225F6;
 Thu,  6 Jul 2023 14:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688654823; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zxFRTe1s/AyQFaamG/WE4NHjFP87zNjruuubNEspJbM=;
 b=XTN51SjkX3EOTNpTW9uUDNqX/qxrnqGJUL4KyoXgOlvcfLC9WkKSX5LxzuSvYwiFpQBtFK
 ZSLHjpZE4hozqgeUyRiX4y0TCI1tc1XvURzS8YaglDAtNyuy1aSi3CNAxyxQ4I4zs0UW5G
 KBdnsww8btNjU6vs9hkbb+jpVB0k0Sg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688654823;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zxFRTe1s/AyQFaamG/WE4NHjFP87zNjruuubNEspJbM=;
 b=Q/s6FD0+pYeji9OpHYj4Z6B1zYlht34F9jmdI3Je6e8Zx1gffJ4QdP5oQc7NcXZB2iFG9s
 NMcvlScMZeyPU8Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 39287138FC;
 Thu,  6 Jul 2023 14:47:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id icnaDOfTpmTefgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Jul 2023 14:47:03 +0000
Message-ID: <515dfb8b-e79e-f0fd-3d3f-5ac110527220@suse.de>
Date: Thu, 6 Jul 2023 16:47:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 04/11] drm/tegra: Set fbdev FBINFO_VIRTFB flag
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
References: <20230706124905.15134-1-tzimmermann@suse.de>
 <20230706124905.15134-5-tzimmermann@suse.de> <ZKbQM2SsPcdiWXnB@orome>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <ZKbQM2SsPcdiWXnB@orome>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OofbKFw7gQ99Ec3r33Cc4so4"
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, mripard@kernel.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OofbKFw7gQ99Ec3r33Cc4so4
Content-Type: multipart/mixed; boundary="------------KzMOJKPziQXwXDjbMNqQFRgH";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: javierm@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Message-ID: <515dfb8b-e79e-f0fd-3d3f-5ac110527220@suse.de>
Subject: Re: [PATCH v2 04/11] drm/tegra: Set fbdev FBINFO_VIRTFB flag
References: <20230706124905.15134-1-tzimmermann@suse.de>
 <20230706124905.15134-5-tzimmermann@suse.de> <ZKbQM2SsPcdiWXnB@orome>
In-Reply-To: <ZKbQM2SsPcdiWXnB@orome>

--------------KzMOJKPziQXwXDjbMNqQFRgH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMDcuMjMgdW0gMTY6MzEgc2NocmllYiBUaGllcnJ5IFJlZGluZzoNCj4g
T24gVGh1LCBKdWwgMDYsIDIwMjMgYXQgMDI6NDY6NDJQTSArMDIwMCwgVGhvbWFzIFppbW1l
cm1hbm4gd3JvdGU6DQo+PiBNYXJrIHRoZSBmcmFtZWJ1ZmZlciB3aXRoIEZCSU5GT19WSVJU
RkIuIFRoZSBmcmFtZWJ1ZmZlciByYW5nZSBpcw0KPj4gaW4gRE1BLWFibGUgbWVtb3J5IGFu
ZCBzaG91bGQgYmUgYWNjZXNzZWQgd2l0aCB0aGUgQ1BVJ3MgcmVndWxhcg0KPj4gbWVtb3J5
IG9wcy4NCj4+DQo+PiB2MjoNCj4+IAkqIGRyb3AgRkJJTkZPX0RFRkFVTFQNCj4+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4N
Cj4+IFJldmlld2VkLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVk
aGF0LmNvbT4NCj4+IEFja2VkLWJ5OiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5v
cmc+DQo+PiBDYzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4N
Cj4+IENjOiBNaWtrbyBQZXJ0dHVuZW4gPG1wZXJ0dHVuZW5AbnZpZGlhLmNvbT4NCj4+IC0t
LQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZmJkZXYuYyB8IDEgKw0KPj4gICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3RlZ3JhL2ZiZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZmJkZXYu
Yw0KPj4gaW5kZXggODI1NzdiN2M4OGRhLi5kODQ2MGM1ZGM5MWUgMTAwNjQ0DQo+PiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZmJkZXYuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3RlZ3JhL2ZiZGV2LmMNCj4+IEBAIC0xMzIsNiArMTMyLDcgQEAgc3RhdGljIGludCB0
ZWdyYV9mYmRldl9wcm9iZShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqaGVscGVyLA0KPj4gICAJ
CX0NCj4+ICAgCX0NCj4+ICAgDQo+PiArCWluZm8tPmZsYWdzIHw9IEZCSU5GT19WSVJURkI7
DQo+PiAgIAlpbmZvLT5zY3JlZW5fYmFzZSA9ICh2b2lkIF9faW9tZW0gKiliby0+dmFkZHIg
KyBvZmZzZXQ7DQo+IA0KPiBBcyBwYXJ0IG9mIHRoaXMsIGRvIHdlIGFsc28gbmVlZCB0byBz
ZXQgaW5mby0+c2NyZWVuX2J1ZmZlciBpbnN0ZWFkIG9mDQo+IGluZm8tPnNjcmVlbl9iYXNl
PyBUaGUgZHJtX2ZiZGV2X2RtYV9oZWxwZXIgZnVuY3Rpb25zIGRvIHRoYXQuDQoNCkluZGVl
ZCwgZ29vZCBwb2ludC4gSSdsbCB1cGRhdGUgdGhpcyBpbiB0aGUgbmV4dCBpdGVyYXRpb24u
DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFRoaWVycnkNCj4gDQo+PiAgIAlp
bmZvLT5zY3JlZW5fc2l6ZSA9IHNpemU7DQo+PiAgIAlpbmZvLT5maXguc21lbV9zdGFydCA9
ICh1bnNpZ25lZCBsb25nKShiby0+aW92YSArIG9mZnNldCk7DQo+PiAtLSANCj4+IDIuNDEu
MA0KPj4NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVs
b3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3Ry
YXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5k
cmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5
IChBRyBOdWVybmJlcmcpDQo=

--------------KzMOJKPziQXwXDjbMNqQFRgH--

--------------OofbKFw7gQ99Ec3r33Cc4so4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSm0+YFAwAAAAAACgkQlh/E3EQov+DT
+A/8CuNQo/vSIOVB+6XSEamWRL9Pw1ZfmA59h5L1FkNnso02jNeL2y9CJP9+S0WKJqxism5G+K5y
YtOUxuGgG0nk2mJ1w6I8HPm68NOtUS4Nk91JxVJlbenzpBWN8nRCpb8vFOvLWrW4Wk1ZvFXVjllR
Yphm1Yeo2/eJDbOn45lH408brxDxXwLu6gPF+EUVjDRwoGH6lp/LRH7MGMorb5NuuExCO69Wx+t7
tj+Hf5fR7z6V7Lw1p/1zk3KO82+CbZuk9NeyRCwuRFHQP7IhumEr5s/i1KYQJ/4JynMMdOT7dJ8M
2jkEImEUDgvFH7QE2Gt3Lhgi4bjGwD3/t33YUtqneLsY+AGZGJ+0iD6qNUrWAHKm5ueuyamynR3A
GHm+fCoBZjEXMAihQ1bpKZ/0k8Dl9LfRb2mp1+u5u7SVO0opdXDLGKWl/QMlO2o2gNeuqi1d2n8Z
mqI6b3RmiTpTaO0HXKNBk2ET+gDs8y8/2b5JJhZ0CCnaPnoI/SE0kTkKs6xcXKvfitQo1yhYDvEh
xow1p70hj2kFj6b3lrvbere+j0NX9Xl445/qalfFm/d23JSI0GzgweT0s4N8TpWLknXkfdO38J6U
16gJDi3tbUo2c+15M8gst7ibxZNhzh9stMXPinU+7eaJc5mtJxEQQG3KQ8QN3qo3wk2c8iaIKxT8
fAM=
=Q66m
-----END PGP SIGNATURE-----

--------------OofbKFw7gQ99Ec3r33Cc4so4--

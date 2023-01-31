Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5375683688
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 20:28:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7165A10E389;
	Tue, 31 Jan 2023 19:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1879E10E389
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 19:28:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9A1A02012A;
 Tue, 31 Jan 2023 19:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675193282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hVsJxJR+NZ86+KEnON9fveEJZWLUM+FrlwGeUPdHZLw=;
 b=PFt/Hy2s6rlfGN62oYD6emu1+MsT5HLf0c1uOZSD4ORZVDqF8uyPTQF4UhM2QHrVzpWp2K
 YbssRdBg5ZRtiBa1Mwnid29ScWJV+5Y7uMygTU+MHPgxn+2mAn13hZrJrZRHTxSLYS4g9p
 okx4aRP1Yqib9uF8eZrMZJX3aIXgj8o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675193282;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hVsJxJR+NZ86+KEnON9fveEJZWLUM+FrlwGeUPdHZLw=;
 b=L5OvGYzZK9DcEh/YHca8CgUHIXDzs4ayocCU5uDGAOuMxlTJGQokIheUCgZ+7ccmVPtoss
 SmOKZ9783IvgzHAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7CAE913585;
 Tue, 31 Jan 2023 19:28:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sfmZHcJr2WP2NgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 31 Jan 2023 19:28:02 +0000
Message-ID: <446db473-ddb2-623c-c0d0-4a1bbd501aa9@suse.de>
Date: Tue, 31 Jan 2023 20:28:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 0/8] drm/vmwgfx: Refactor the buffer object code
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20230131033542.953249-1-zack@kde.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230131033542.953249-1-zack@kde.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------t7MlRON40OVrpr98PSQsCeqf"
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com, banackm@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------t7MlRON40OVrpr98PSQsCeqf
Content-Type: multipart/mixed; boundary="------------4rMZHa4pu38nUoMjvlRGuuOw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
Cc: krastevm@vmware.com, banackm@vmware.com, mombasawalam@vmware.com
Message-ID: <446db473-ddb2-623c-c0d0-4a1bbd501aa9@suse.de>
Subject: Re: [PATCH v2 0/8] drm/vmwgfx: Refactor the buffer object code
References: <20230131033542.953249-1-zack@kde.org>
In-Reply-To: <20230131033542.953249-1-zack@kde.org>

--------------4rMZHa4pu38nUoMjvlRGuuOw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkkgY2Fubm90IGNvbW1lbnQgbXVjaCBvbiB0aGUgaW50ZXJuYWwgd29ya2luZ3Mg
b2YgdGhlIHZtd2dmeCBkcml2ZXIsIGJ1dCANCmZlZWwgZnJlZSB0byBhZGQNCg0KQWNrZWQt
Ynk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KDQp0byB0aGUg
cGF0Y2hlcyB0aGF0IGRvbid0IGFscmVhZHkgaGF2ZSBteSByLWIuDQoNCkJlc3QgcmVnYXJk
cw0KVGhvbWFzDQoNCkFtIDMxLjAxLjIzIHVtIDA0OjM1IHNjaHJpZWIgWmFjayBSdXNpbjoN
Cj4gRnJvbTogWmFjayBSdXNpbiA8emFja3JAdm13YXJlLmNvbT4NCj4gDQo+IHYyOiBGaXgg
YWxsIHRoZSBpc3N1ZXMgd2hpY2ggVGhvbWFzIHBvaW50ZWQgb3V0IGluIHRoZSBpbml0aWFs
IHJldmlldw0KPiBhbmQgc3BsaXQgdGhlICJzaW1wbGlmeSBmYiBwaW5uaW5nIiBjaGFuZ2Ug
aW50byB0d28gY29tbWl0cyB3aXRoIHRoZQ0KPiBzZWNvbmQgb25lIGJlaW5nIGp1c3QgdGhl
IHJlbmFtZS4NCj4gDQo+IFRoZSBzZXJpZXMgcmVmYWN0b3JzIHRoZSBidWZmZXIgb2JqZWN0
IGNvZGUgdG8gbWFrZSBtb3JlIGFsaWtlIHRoZQ0KPiBvdGhlciB0dG0gZHJpdmVycy4gVGhl
IHBsYWNlbWVudCBiZWNvbWVzIGEgcHJvcGVydHkgb2YgdGhlIGJvIHdoaWNoIG1ha2VzDQo+
IGl0IGEgbG90IGVhc2llciB0byBjb3JyZWN0bHkgdmFsaWRhdGUgYmFzZWQgb24gdGhlIGN1
cnJlbnQgdXNhZ2UuDQo+IHZtd2dmeCB0ZW5kcyB0byBkbyBtb3JlIHZhbGlkYXRpb24gZHVl
IHRvIGZvcmNlZCBtb3ZlcywgYmVjYXVzZSB0aGUNCj4gYnVmZmVyIHBsYWNlbWVudCBzb21l
dGltZXMgbmVlZCB0byBjaGFuZ2UgZHVlIHRvIHVzZXJzcGFjZSBjb21tYW5kcywgaS5lLg0K
PiBzb21lIGNvbW1hbmRzIGUuZy4gU1VSRkFDRV9ETUEgaW1wbGllcyBHTVIncyB3aGljaCBh
cmUgcmVhbGx5IGRlcHJlY2F0ZWQNCj4gaW4gZmF2b3Igb2YgTU9CJ3MsIGJ1dCB0aGUgeDEx
IGRyaXZlciBzdGlsbCB1c2VzIEdNUidzIHNvIGJ1ZmZlcnMgdGVuZA0KPiB0byBmbGlwIGJl
dHdlZW4gR01SJ3MgYW5kIE1PQidzIGEgYml0IHdoZW4gcnVubmluZyBvbiBYMTEuDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICANCj4gVGhlIGZ1bmN0aW9uYWxpdHkgcmVtYWlucyBsYXJn
ZWx5IHVuY2hhbmdlZCwgYnV0IHRoZSBMT0MgYXJlIHJlZHVjZWQgYnkNCj4gYWJvdXQgNDAw
IGFuZCB0aGUgZ3JvdW5kd29yayBpcyBkb25lIGZvciBhZGRpbmcgcHJpbWUgc3VwcG9ydCB3
aXRoIFNHDQo+IHR0bSBidWZmZXJzLg0KPiANCj4gWmFjayBSdXNpbiAoOCk6DQo+ICAgIGRy
bS92bXdnZng6IFVzZSB0aGUgY29tbW9uIGdlbSBtbWFwIGluc3RlYWQgb2YgdGhlIGN1c3Rv
bSBjb2RlDQo+ICAgIGRybS92bXdnZng6IFJlbW92ZSB0aGUgZHVwbGljYXRlIGJvX2ZyZWUg
ZnVuY3Rpb24NCj4gICAgZHJtL3Ztd2dmeDogUmVuYW1lIHZtd19idWZmZXJfb2JqZWN0IHRv
IHZtd19ibw0KPiAgICBkcm0vdm13Z2Z4OiBTaW1wbGlmeSBmYiBwaW5uaW5nDQo+ICAgIGRy
bS92bXdnZng6IENsZWFudXAgdGhlIHZtdyBibyB1c2FnZSBpbiB0aGUgY3Vyc29yIHBhdGhz
DQo+ICAgIGRybS92bXdnZng6IFJlbmFtZSBkdW1teSB0byBpc19pb21lbQ0KPiAgICBkcm0v
dm13Z2Z4OiBBYnN0cmFjdCBwbGFjZW1lbnQgc2VsZWN0aW9uDQo+ICAgIGRybS92bXdnZng6
IFN0b3AgdXNpbmcgcmF3IHR0bV9idWZmZXJfb2JqZWN0J3MNCj4gDQo+ICAgZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgICAyICstDQo+ICAgZHJp
dmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfYm8uYyAgICAgICAgICAgIHwgMzkyICsrKysr
KysrKy0tLS0tLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2JvLmgg
ICAgICAgICAgICB8IDIwMyArKysrKysrKysNCj4gICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF9jbWQuYyAgICAgICAgICAgfCAgMTQgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
dm13Z2Z4L3Ztd2dmeF9jbWRidWYuYyAgICAgICAgfCAgNTMgKy0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC92bXdnZnhfY29udGV4dC5jICAgICAgIHwgIDM2ICstDQo+ICAgZHJp
dmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfY290YWJsZS5jICAgICAgIHwgIDY1ICstLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jICAgICAgICAgICB8ICAy
NiArLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5oICAgICAgICAg
ICB8IDI0NSArKystLS0tLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4
X2V4ZWNidWYuYyAgICAgICB8IDEwMiArKystLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X2ZlbmNlLmMgICAgICAgICB8ICAgMiArLQ0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS92bXdnZngvdm13Z2Z4X2dlbS5jICAgICAgICAgICB8ICA4OSArKy0tDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfa21zLmMgICAgICAgICAgIHwgMjMwICsrKystLS0t
LS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuaCAgICAgICAgICAg
fCAgNDMgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9sZHUuYyAgICAg
ICAgICAgfCAgNTcgKystDQo+ICAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfbW9i
LmMgICAgICAgICAgIHwgIDQ1ICstDQo+ICAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
Znhfb3ZlcmxheS5jICAgICAgIHwgIDIwICstDQo+ICAgZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC92bXdnZnhfcGFnZV9kaXJ0eS5jICAgIHwgIDY4ICsrLQ0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS92bXdnZngvdm13Z2Z4X3Jlc291cmNlLmMgICAgICB8IDI0MyArKysrKy0tLS0tLQ0KPiAg
IGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3Jlc291cmNlX3ByaXYuaCB8ICAxMCAr
LQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3Njcm4uYyAgICAgICAgICB8
ICA1MyArLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9zaGFkZXIuYyAg
ICAgICAgfCAgNjUgKy0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfc28u
YyAgICAgICAgICAgIHwgICA2ICstDQo+ICAgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
Znhfc3RkdS5jICAgICAgICAgIHwgMzIzICsrLS0tLS0tLS0tLS0tLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS92bXdnZngvdm13Z2Z4X3N0cmVhbW91dHB1dC5jICB8ICAyMCArLQ0KPiAgIGRy
aXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3N1cmZhY2UuYyAgICAgICB8IDExMSArKy0t
LQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9idWZmZXIuYyAgICB8
IDExNiArLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fZ2x1
ZS5jICAgICAgfCAxMTAgLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF92YS5jICAgICAgICAgICAgfCAgIDYgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF92YWxpZGF0aW9uLmMgICAgfCAxNTAgKysrLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1
L2RybS92bXdnZngvdm13Z2Z4X3ZhbGlkYXRpb24uaCAgICB8ICAxMCArLQ0KPiAgIDMxIGZp
bGVzIGNoYW5nZWQsIDEyNDggaW5zZXJ0aW9ucygrKSwgMTY2NyBkZWxldGlvbnMoLSkNCj4g
ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfYm8u
aA0KPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF90dG1fZ2x1ZS5jDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBE
cml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgN
Ck1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwg
QUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------4rMZHa4pu38nUoMjvlRGuuOw--

--------------t7MlRON40OVrpr98PSQsCeqf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPZa8IFAwAAAAAACgkQlh/E3EQov+Af
rg//Sf2olKU/8ePeAwrXi7i8nbYe9O/mCynJNEhkTQQNgIt0O1vdHiJclJiuBzgmvx7fKlxDzhAW
8S4yQrh/0ntjGDq5fZoaRMFIHIrLlzxlY/FmGvraXc/0JgJFQvca7n2sXPxivwxrBdYvBSW2szR3
jbBy1YrwlotPLtErRjYiDESHpXICOmxdiIRMr5qOFYjiiAr3BWNaq0vPl3HFvFqsPuk4bv377tcL
Jx6wgh0lcuVVv0ZpbGu4lInVbF5kgLqVTvj4Hb7u6MmFrqjvxgOQ2Boe2ewufdEE3Hryz9HcXJft
lrUfEea8YfitWETMMBbKsygjUemvoEPOrVDbaRyr+undiY3NLfOQRPGYAkyrxVy7N7Mz7Snt8Jex
JrVVx/iYothGqSzN2ytDMoWLoLzBXMER6mSz6uENJn2lBAi/O1WR3qyN3/Z9nlKCxdiWSO5jAMuF
idMqKUIIJzQttGSjz6jSwFLuVKyoU6G3hh1G1R2WLOuIyBzwxN6GtxxJvqithQZSMV1AwJUQYLlC
6HkYiyvkkP14DH/FKCySd0z9dyh2Uf9XMa/CToWKE/co/epQyTrTkWL+yhpBV5wuWz4droc8RUpH
9n4TsgINjVKh5w/xkzoVH/CsqV5Z7UtnO9HVCBzbwaP4aNoVMNKuzdpjcao9XRryLsdHLjbZmdqt
zck=
=7tYY
-----END PGP SIGNATURE-----

--------------t7MlRON40OVrpr98PSQsCeqf--

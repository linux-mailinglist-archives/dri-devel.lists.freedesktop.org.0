Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E596BCB22
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 10:38:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6675C10EC73;
	Thu, 16 Mar 2023 09:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009F910EC5D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:38:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9EED31FE00;
 Thu, 16 Mar 2023 09:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678959484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xJRwI6ICZiBypibZ0Jpnv3OhYOwyDNdVPEfUL1Y5hdQ=;
 b=QzPl+6ppM8gRt41f7qiA9wSbu2tQK3WDGmF+c6B4esX7RWTxO5wdH55w53q5/tMfYvzD4B
 Vj+RhPrIOW8GwXRCwmaKroHo/l6q91MO8bto3vlWGa5HyFLcEy2JEPSm33ZiX4OQEyV+TO
 oeERK495NxD48uWTMonBwsbOOMCCVfU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678959484;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xJRwI6ICZiBypibZ0Jpnv3OhYOwyDNdVPEfUL1Y5hdQ=;
 b=/wd6EWPtNVslla5qf6Ro5sP9YbsYWZ4ITFLVn2xhchkOv1aaLr+htek3x/bt4EgilHGN0c
 sMoyzK3Z1cd/YnBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6B321133E0;
 Thu, 16 Mar 2023 09:38:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Cnc+GXzjEmTrRwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Mar 2023 09:38:04 +0000
Message-ID: <268e1cad-017f-2489-ccb0-5e8c10da999f@suse.de>
Date: Thu, 16 Mar 2023 10:38:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/6] drm/fbdev-generic: Remove unused prefer_shadow_fbdev
 flag
To: Zack Rusin <zackr@vmware.com>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
References: <20230315161442.27318-1-tzimmermann@suse.de>
 <20230315161442.27318-3-tzimmermann@suse.de>
 <2d96f229beffdf8416a3f183bac8b147c4a3d77f.camel@vmware.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <2d96f229beffdf8416a3f183bac8b147c4a3d77f.camel@vmware.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3AF260xk1AMFFov0LzpLuGIH"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3AF260xk1AMFFov0LzpLuGIH
Content-Type: multipart/mixed; boundary="------------MrEht54eu8uXPxyi28pfcpuO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Zack Rusin <zackr@vmware.com>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Message-ID: <268e1cad-017f-2489-ccb0-5e8c10da999f@suse.de>
Subject: Re: [PATCH 2/6] drm/fbdev-generic: Remove unused prefer_shadow_fbdev
 flag
References: <20230315161442.27318-1-tzimmermann@suse.de>
 <20230315161442.27318-3-tzimmermann@suse.de>
 <2d96f229beffdf8416a3f183bac8b147c4a3d77f.camel@vmware.com>
In-Reply-To: <2d96f229beffdf8416a3f183bac8b147c4a3d77f.camel@vmware.com>

--------------MrEht54eu8uXPxyi28pfcpuO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTYuMDMuMjMgdW0gMDM6MTYgc2NocmllYiBaYWNrIFJ1c2luOg0KPiBPbiBX
ZWQsIDIwMjMtMDMtMTUgYXQgMTc6MTQgKzAxMDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3Rl
Og0KPj4gUmVtb3ZlIHRoZSBmbGFnIHByZWZlcl9zaGFkb3dfZmJkZXYgZnJvbSBzdHJ1Y3Qg
ZHJtX21vZGVfY29uZmlnLg0KPj4gRHJpdmVycyBzZXQgdGhpcyBmbGFnIHRvIGVuYWJsZSBz
aGFkb3cgYnVmZmVyaW5nIGluIHRoZSBnZW5lcmljDQo+PiBmYmRldiBlbXVsYXRpb24uIFN1
Y2ggc2hhZG93IGJ1ZmZlcmluZyBpcyBub3cgbWFuZGF0b3J5LCBzbyB0aGUNCj4+IGZsYWcg
aXMgdW51c2VkLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPg0KPj4gLS0tDQo+PiAgwqBkcml2ZXJzL2dwdS9kcm0vdGlu
eS9ib2Nocy5jwqDCoMKgwqDCoMKgwqAgfCAxIC0NCj4+ICDCoGRyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X2ttcy5jIHwgMSAtDQo+PiAgwqBpbmNsdWRlL2RybS9kcm1fbW9kZV9j
b25maWcuaMKgwqDCoMKgwqDCoCB8IDcgLS0tLS0tLQ0KPj4gIMKgMyBmaWxlcyBjaGFuZ2Vk
LCA5IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dGlueS9ib2Nocy5jIGIvZHJpdmVycy9ncHUvZHJtL3RpbnkvYm9jaHMuYw0KPj4gaW5kZXgg
MDI0MzQ2MDU0YzcwLi5kMjU0Njc5YTEzNmUgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdGlueS9ib2Nocy5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9ib2No
cy5jDQo+PiBAQCAtNTQ1LDcgKzU0NSw2IEBAIHN0YXRpYyBpbnQgYm9jaHNfa21zX2luaXQo
c3RydWN0IGJvY2hzX2RldmljZSAqYm9jaHMpDQo+PiAgIA0KPj4gIMKgwqDCoMKgwqDCoMKg
wqBib2Nocy0+ZGV2LT5tb2RlX2NvbmZpZy5wcmVmZXJyZWRfZGVwdGggPSAyNDsNCj4+ICDC
oMKgwqDCoMKgwqDCoMKgYm9jaHMtPmRldi0+bW9kZV9jb25maWcucHJlZmVyX3NoYWRvdyA9
IDA7DQo+PiAtwqDCoMKgwqDCoMKgwqBib2Nocy0+ZGV2LT5tb2RlX2NvbmZpZy5wcmVmZXJf
c2hhZG93X2ZiZGV2ID0gMTsNCj4+ICDCoMKgwqDCoMKgwqDCoMKgYm9jaHMtPmRldi0+bW9k
ZV9jb25maWcucXVpcmtfYWRkZmJfcHJlZmVyX2hvc3RfYnl0ZV9vcmRlciA9IHRydWU7DQo+
PiAgIA0KPj4gIMKgwqDCoMKgwqDCoMKgwqBib2Nocy0+ZGV2LT5tb2RlX2NvbmZpZy5mdW5j
cyA9ICZib2Noc19tb2RlX2Z1bmNzOw0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS92bXdnZngvdm13Z2Z4X2ttcy5jDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X2ttcy5jDQo+PiBpbmRleCA4NGQ2MzgwYjk4OTUuLjUxNjJhN2ExMjc5MiAxMDA2NDQN
Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5jDQo+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuYw0KPj4gQEAgLTIxMTIsNyAr
MjExMiw2IEBAIGludCB2bXdfa21zX2luaXQoc3RydWN0IHZtd19wcml2YXRlICpkZXZfcHJp
dikNCj4+ICDCoMKgwqDCoMKgwqDCoMKgZGV2LT5tb2RlX2NvbmZpZy5tYXhfd2lkdGggPSBk
ZXZfcHJpdi0+dGV4dHVyZV9tYXhfd2lkdGg7DQo+PiAgwqDCoMKgwqDCoMKgwqDCoGRldi0+
bW9kZV9jb25maWcubWF4X2hlaWdodCA9IGRldl9wcml2LT50ZXh0dXJlX21heF9oZWlnaHQ7
DQo+PiAgwqDCoMKgwqDCoMKgwqDCoGRldi0+bW9kZV9jb25maWcucHJlZmVycmVkX2RlcHRo
ID0gZGV2X3ByaXYtPmFzc3VtZV8xNmJwcCA/IDE2IDogMzI7DQo+PiAtwqDCoMKgwqDCoMKg
wqBkZXYtPm1vZGVfY29uZmlnLnByZWZlcl9zaGFkb3dfZmJkZXYgPSAhZGV2X3ByaXYtPmhh
c19tb2I7DQo+PiAgIA0KPj4gIMKgwqDCoMKgwqDCoMKgwqBkcm1fbW9kZV9jcmVhdGVfc3Vn
Z2VzdGVkX29mZnNldF9wcm9wZXJ0aWVzKGRldik7DQo+PiAgwqDCoMKgwqDCoMKgwqDCoHZt
d19rbXNfY3JlYXRlX2hvdHBsdWdfbW9kZV91cGRhdGVfcHJvcGVydHkoZGV2X3ByaXYpOw0K
Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oIGIvaW5jbHVk
ZS9kcm0vZHJtX21vZGVfY29uZmlnLmgNCj4+IGluZGV4IGU1YjA1MzAwMWQyMi4uOTczMTE5
YTkxNzZiIDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmgN
Cj4+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oDQo+PiBAQCAtODkwLDEz
ICs4OTAsNiBAQCBzdHJ1Y3QgZHJtX21vZGVfY29uZmlnIHsNCj4+ICDCoMKgwqDCoMKgwqDC
oMKgLyogZHVtYiBpb2N0bCBwYXJhbWV0ZXJzICovDQo+PiAgwqDCoMKgwqDCoMKgwqDCoHVp
bnQzMl90IHByZWZlcnJlZF9kZXB0aCwgcHJlZmVyX3NoYWRvdzsNCj4+ICAgDQo+PiAtwqDC
oMKgwqDCoMKgwqAvKioNCj4+IC3CoMKgwqDCoMKgwqDCoCAqIEBwcmVmZXJfc2hhZG93X2Zi
ZGV2Og0KPj4gLcKgwqDCoMKgwqDCoMKgICoNCj4+IC3CoMKgwqDCoMKgwqDCoCAqIEhpbnQg
dG8gZnJhbWVidWZmZXIgZW11bGF0aW9uIHRvIHByZWZlciBzaGFkb3ctZmIgcmVuZGVyaW5n
Lg0KPj4gLcKgwqDCoMKgwqDCoMKgICovDQo+PiAtwqDCoMKgwqDCoMKgwqBib29sIHByZWZl
cl9zaGFkb3dfZmJkZXY7DQo+PiAtDQo+PiAgwqDCoMKgwqDCoMKgwqDCoC8qKg0KPj4gIMKg
wqDCoMKgwqDCoMKgwqAgKiBAcXVpcmtfYWRkZmJfcHJlZmVyX3hiZ3JfMzBicHA6DQo+PiAg
wqDCoMKgwqDCoMKgwqDCoCAqDQo+IA0KPiBGb3IgdGhpcyBvbmU6DQo+IFJldmlld2VkLWJ5
OiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPg0KPiANCj4gVGhlIGVudGlyZSBzZXJp
ZXMgbG9va3MgZ3JlYXQuIEkgdGhpbmsgaXQncyBhIGdyZWF0IGNsZWFudXA6DQo+IEFja2Vk
LWJ5OiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPg0KPiBGb3IgdGhlIHJlc3QuDQoN
ClRoYW5rcyBhIGxvdCENCg0KPiANCj4geg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFu
bg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMg
R2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkN
CihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90
ZXYNCg==

--------------MrEht54eu8uXPxyi28pfcpuO--

--------------3AF260xk1AMFFov0LzpLuGIH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQS43sFAwAAAAAACgkQlh/E3EQov+Bs
Fw//eHS7f+jHhD3gPILkruTdFS2SfT7j3dSxjKcmsQxWwEn9VpYRjAy624uNfsSf1wZ2oBs2myqB
QbLdwvaE1F/apfDXB5kkAPYtPq0DWaNQMAWbZY5qObhVPnkGlPuVu+C4HZdGuvZnRbX8ee43YtIF
BWJuceeDDaLi+JDQSLbYVceKa2aA+mocGWJcTxxFZ/prXvThY+NrLozCRLveGWfCu5lOrj7iYKNj
8HYAB0qnjGr25t6zlNku1lfjBN11SP8DR/iMMr89HHdY/IxU1DyErDNXXBwsj6Mu4xmDpm1VMupA
Vfv6+rOi1l2F7Tavi6paBBpW8IUWnoPj4m3YTDGooCMUY22zd9caXjI5fNMyA/WPqfPMnphaO+YR
JnWLk9ZG00Q/3gqyvFa/Ry5yOdyKK4VN++jdt1G/GpeCznNuuFdu12Z10bLN8GnSI3SmNzKf8Wbd
QrSYDSe6PbvEA/MN7P8inrYz8CH0h8KnYRy3IIFt2oYOysy6ejCLcuqhzLS059I9g/gPjHRmmmrs
qIsJsH9pYSqRIYpTCKgnSAni16zeyvcqXQwwwi5kbH4jaOUFDlyMH6ZltyYLt4w2BB3QsMIdVio7
Psr5tbPnsRGvhs4uESaMgHBfsuP90MguTueyBzuuPRnyd+MgzyuwbCNoSDzzLtzdvaPutep5GjU5
TsA=
=Qhx7
-----END PGP SIGNATURE-----

--------------3AF260xk1AMFFov0LzpLuGIH--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BB466D788
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 09:08:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1425C10E2E0;
	Tue, 17 Jan 2023 08:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F4210E2E0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 08:08:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6E918380B9;
 Tue, 17 Jan 2023 08:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673942918; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s+FVJGMlx6jTfAj1Qho//c3LWCwRBGzJ7pcddiglrE4=;
 b=eJc76AFtbNjSo8LnsD1fPWl5O21maaBalnAy0KXnK6raEWC1MGj3irxVv9WyQHIG8EKqoi
 n/O75RvHmc5noRQK1lK80+hPJj2E4i2p1IjAOJto4+61dJIBg5xSXf3m7UbXuqJkHz7ACA
 9bXE2S2KrteXSkvaxkgHgH6I1WHAUfE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673942918;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s+FVJGMlx6jTfAj1Qho//c3LWCwRBGzJ7pcddiglrE4=;
 b=iCHQjx1gq5khS7u6lfwoaC8GXc0s2aEy6Ugc+iTk2nHIRxQhtxX87P4Raz89GUhHJlTW1D
 mkVX92yiOiFFOxAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4EEEE13357;
 Tue, 17 Jan 2023 08:08:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id d1p5EoZXxmOvSwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 17 Jan 2023 08:08:38 +0000
Message-ID: <4ec5db18-0965-ef47-5c18-74af80234fc4@suse.de>
Date: Tue, 17 Jan 2023 09:08:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/ttm: Include <linux/vmalloc.h> to fix MIPS build
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 ray.huang@amd.com, airlied@gmail.com, daniel@ffwll.ch
References: <20230116121023.14245-1-tzimmermann@suse.de>
 <ee7ef7be-7d9d-d6eb-7adf-0b03a2abb3ab@suse.de>
 <904299c4-9752-40d5-854c-95fc1583993f@amd.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <904299c4-9752-40d5-854c-95fc1583993f@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YPtYvz2WsPWzF2JYCK9cHi2i"
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
--------------YPtYvz2WsPWzF2JYCK9cHi2i
Content-Type: multipart/mixed; boundary="------------WJS0kliFUdgTBULWW4En4gCJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 ray.huang@amd.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Message-ID: <4ec5db18-0965-ef47-5c18-74af80234fc4@suse.de>
Subject: Re: [PATCH] drm/ttm: Include <linux/vmalloc.h> to fix MIPS build
References: <20230116121023.14245-1-tzimmermann@suse.de>
 <ee7ef7be-7d9d-d6eb-7adf-0b03a2abb3ab@suse.de>
 <904299c4-9752-40d5-854c-95fc1583993f@amd.com>
In-Reply-To: <904299c4-9752-40d5-854c-95fc1583993f@amd.com>

--------------WJS0kliFUdgTBULWW4En4gCJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTYuMDEuMjMgdW0gMTU6NDAgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0K
PiBBbSAxNi4wMS4yMyB1bSAxMzoxMyBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOg0KPj4g
SSdkIGFkZCBhIEZpeGVzIHRhZywgYnV0IGRvbid0IGtub3cgdGhlIGNvbW1pdCB3aGVuIHRo
aXMgd2FzIGludHJvZHVjZWQuDQo+IA0KPiBNaG0sIHRoYXQgY29kZSBpcyAxMCsgeWVhcnMg
b2xkLiBNeSBlZHVjYXRlZCBndWVzcyBpcyB0aGF0IHdlIHNvbWVob3cgDQo+IHB1bGxlZCBp
biB2bWFwL3Z1bm1hcCB0aHJvdWdoIGEgaGVhZGVyIHdoaWNoIHdhcyBub3cgY2xlYW5lZCB1
cC4NCg0KWWVhaCwgSSBhc3N1bWUgaXQgd2FzIGludHJvZHVjZWQgYnkgYTMxODVmOTFkMDU3
ICgiZHJtL3R0bTogbWVyZ2UgDQp0dG1fYm9fYXBpLmggYW5kIHR0bV9ib19kcml2ZXIuaCB2
MiIpDQoNCj4gDQo+IEFueXdheSB5b3VyIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUsIGZlZWwg
ZnJlZSB0byBhZGQgbXkgcmIuDQoNClRoYW5rIHlvdS4gTWVyZ2VkIGludG8gZHJtLW1pc2Mt
bmV4dCBub3cuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IENocmlzdGlhbi4N
Cj4gDQo+Pg0KPj4gQW0gMTYuMDEuMjMgdW0gMTM6MTAgc2NocmllYiBUaG9tYXMgWmltbWVy
bWFubjoNCj4+PiBPbiBNSVBTLCB2bWFwKCkgYW5kIHZ1bm1hcCgpIGFyZSB1bmRlY2xhcmVk
IGluIHR0bV9ib191dGlsLmMuIEFuDQo+Pj4gZXJyb3IgbWVzc2FnZSBpcyBzaG93biBiZWxv
dy4NCj4+Pg0KPj4+IMKgwqAgQ0PCoMKgwqDCoMKgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X2JvX3V0aWwubw0KPj4+IMKgwqAgLi4vZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRp
bC5jOiBJbiBmdW5jdGlvbiAndHRtX2JvX2ttYXBfdHRtJzoNCj4+PiDCoMKgIC4uL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYzozNjQ6MzI6IGVycm9yOiBpbXBsaWNpdCAN
Cj4+PiBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAndm1hcCc7IGRpZCB5b3UgbWVhbiAna21h
cCc/IA0KPj4+IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQ0KPj4+
IMKgwqDCoMKgIDM2NCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWFwLT52
aXJ0dWFsID0gdm1hcCh0dG0tPnBhZ2VzICsgDQo+Pj4gc3RhcnRfcGFnZSwgbnVtX3BhZ2Vz
LA0KPj4+IMKgwqDCoMKgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fn4NCj4+PiDCoMKgwqDCoHzCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBr
bWFwDQo+Pj4gwqDCoCAuLi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmM6MzY0
OjMwOiB3YXJuaW5nOiBhc3NpZ25tZW50IA0KPj4+IHRvICd2b2lkIConIGZyb20gJ2ludCcg
bWFrZXMgcG9pbnRlciBmcm9tIGludGVnZXIgd2l0aG91dCBhIGNhc3QgDQo+Pj4gWy1XaW50
LWNvbnZlcnNpb25dDQo+Pj4gwqDCoMKgwqAgMzY0IHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBtYXAtPnZpcnR1YWwgPSB2bWFwKHR0bS0+cGFnZXMgKyANCj4+PiBzdGFy
dF9wYWdlLCBudW1fcGFnZXMsDQo+Pj4gwqDCoMKgwqB8wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBeDQo+Pj4gwqDCoCAuLi9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmM6IEluIGZ1bmN0aW9uICd0dG1fYm9f
a3VubWFwJzoNCj4+PiDCoMKgIC4uL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwu
Yzo0Mjk6MTc6IGVycm9yOiBpbXBsaWNpdCANCj4+PiBkZWNsYXJhdGlvbiBvZiBmdW5jdGlv
biAndnVubWFwJzsgZGlkIHlvdSBtZWFuICdrdW5tYXAnPyANCj4+PiBbLVdlcnJvcj1pbXBs
aWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0NCj4+PiDCoMKgwqDCoCA0MjkgfMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZ1bm1hcChtYXAtPnZpcnR1YWwpOw0KPj4+IMKg
wqDCoMKgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+fg0KPj4+IMKg
wqDCoMKgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGt1bm1hcA0KPj4+IMKg
wqAgLi4vZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jOiBJbiBmdW5jdGlvbiAn
dHRtX2JvX3ZtYXAnOg0KPj4+IMKgwqAgLi4vZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9f
dXRpbC5jOjUwOToyMzogd2FybmluZzogYXNzaWdubWVudCANCj4+PiB0byAndm9pZCAqJyBm
cm9tICdpbnQnIG1ha2VzIHBvaW50ZXIgZnJvbSBpbnRlZ2VyIHdpdGhvdXQgYSBjYXN0IA0K
Pj4+IFstV2ludC1jb252ZXJzaW9uXQ0KPj4+IMKgwqDCoMKgIDUwOSB8wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgdmFkZHIgPSB2bWFwKHR0bS0+cGFnZXMsIHR0bS0+bnVt
X3BhZ2VzLCANCj4+PiAwLCBwcm90KTsNCj4+PiDCoMKgwqDCoHzCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBeDQo+Pj4NCj4+PiBGaXggdGhpcyBieSBp
bmNsdWRpbmcgPGxpbnV4L3ZtYWxsb2MuaD4uDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+PiAtLS0NCj4+PiDC
oCBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMgfCAyICsrDQo+Pj4gwqAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYyANCj4+PiBiL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvX3V0aWwuYw0KPj4+IGluZGV4IDEyMDE3ZWMyNGQ5Zi4uOGUxOWE0MGNi
NDFkIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwu
Yw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYw0KPj4+IEBA
IC0yOSw2ICsyOSw4IEBADQo+Pj4gwqDCoCAqIEF1dGhvcnM6IFRob21hcyBIZWxsc3Ryb20g
PHRoZWxsc3Ryb20tYXQtdm13YXJlLWRvdC1jb20+DQo+Pj4gwqDCoCAqLw0KPj4+IMKgICsj
aW5jbHVkZSA8bGludXgvdm1hbGxvYy5oPg0KPj4+ICsNCj4+PiDCoCAjaW5jbHVkZSA8ZHJt
L3R0bS90dG1fYm8uaD4NCj4+PiDCoCAjaW5jbHVkZSA8ZHJtL3R0bS90dG1fcGxhY2VtZW50
Lmg+DQo+Pj4gwqAgI2luY2x1ZGUgPGRybS90dG0vdHRtX3R0Lmg+DQo+Pg0KPiANCg0KLS0g
DQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBO
w7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6Rm
dHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------WJS0kliFUdgTBULWW4En4gCJ--

--------------YPtYvz2WsPWzF2JYCK9cHi2i
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPGV4UFAwAAAAAACgkQlh/E3EQov+Cx
BBAAt00xFy+R/6cEjBurGm0IfFpgoVyZnouegTD74xaatkTBYHvYV3dE2UjZlYm4y8Iqt4QGBTR5
iP26Gi87Thh2afABEjeX3ucIW+cfZDYrsQ/hYIBi+DllEAnqiTYxAYb44H4+i/eIDssiX+yiHTzm
VPvWtGPbLJN/6Mo7niuwu7HR6V+aoP9+YthaCjLu/1oW7LrdHpgZz0GlgMOrTGMTrqaSVQLwwZ6d
aisHnDSfRJAVcA4u5lcRa21zVsIVCA+Y1HH9Ue+Gh2I4hXlsyKRFRQ+Vu2TKsA6pVdFuz7s1tRBL
nDYf2sQgy03k/nf0x4SVkP7OYIQB25uj9f263zTsBr9RBI6VMulWFdDhWk+K3a1HN0MBCc9uQrDa
7CL+je5CrQifiOfwUo6gGfzGnNQj5KK7PkFx21sqNth6jZ+BkN//vxSBcLV1evL4fV7cOJHJ4TBX
6/S6n38BOEnf/PIlP0mppciskblujn1NiPsrmlsZ5+uv546F7jOzc/XCGUeo5RQmBeTGrRq6xoBc
YdAjH9i2fhHdjyDbqgws9dLkqTD/qhjITl8CX145CKUqB8acdIgXpMwCqHJRp57lmYN0XkRI7CWM
8BmxfvXNPq/RRtU/yeTq8x/t73JtpUU+0PeMmARe7oUwBANnQ9/BBRVFdwyFbscQycQWVRFvgt4D
hpo=
=GmC7
-----END PGP SIGNATURE-----

--------------YPtYvz2WsPWzF2JYCK9cHi2i--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E180669C92
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 16:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F9510EA27;
	Fri, 13 Jan 2023 15:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02E910EA23;
 Fri, 13 Jan 2023 15:38:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EA74C3ED04;
 Fri, 13 Jan 2023 15:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673624299; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yZ63ucHm+CbxyutEFMxxdOAPNKxldaw5i/kT+04LaWc=;
 b=2T/l/emzAreqGFdQveZ4qw0fogX29R38Dlt+DmzWenLId2bWb+i0NGgB3uA6+UYQMUUiG5
 8oXmBl5+IBu0ct9xtMWyiGcOZAZ6e8HZfjRkredgVIBpukUQI2l3YU66hsEOS79wX5pliR
 SuFJH+vg1zjZPvUJDwTOYb329yKbhs8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673624299;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yZ63ucHm+CbxyutEFMxxdOAPNKxldaw5i/kT+04LaWc=;
 b=piy0CWf35Dsp+SeNnBhmak9uU0kJRk9bYockc7qIKwvCHYeZnLRSZdc7ks8sk736Ah3I1B
 rDWWOQj2zBEb4PAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AB8D313913;
 Fri, 13 Jan 2023 15:38:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hsPkKOt6wWPgPQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 13 Jan 2023 15:38:19 +0000
Message-ID: <91385d70-a58e-bc3e-d171-eb71dcb65ef5@suse.de>
Date: Fri, 13 Jan 2023 16:38:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 01/10] drm: Include <linux/backlight.h> where needed
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20230111130206.29974-1-tzimmermann@suse.de>
 <20230111130206.29974-2-tzimmermann@suse.de> <Y8F0EW3rVPiuzciK@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Y8F0EW3rVPiuzciK@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Lkgm8dNnII7GyCNNXTvXw0tK"
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
Cc: f.fainelli@gmail.com, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, james.qian.wang@arm.com,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 bcm-kernel-feedback-list@broadcom.com, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Lkgm8dNnII7GyCNNXTvXw0tK
Content-Type: multipart/mixed; boundary="------------1jgr0EovOjZDVbH0Kh0i4KuW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: f.fainelli@gmail.com, amd-gfx@lists.freedesktop.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 james.qian.wang@arm.com, alexander.deucher@amd.com,
 bcm-kernel-feedback-list@broadcom.com, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Message-ID: <91385d70-a58e-bc3e-d171-eb71dcb65ef5@suse.de>
Subject: Re: [PATCH v2 01/10] drm: Include <linux/backlight.h> where needed
References: <20230111130206.29974-1-tzimmermann@suse.de>
 <20230111130206.29974-2-tzimmermann@suse.de> <Y8F0EW3rVPiuzciK@ravnborg.org>
In-Reply-To: <Y8F0EW3rVPiuzciK@ravnborg.org>

--------------1jgr0EovOjZDVbH0Kh0i4KuW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTMuMDEuMjMgdW0gMTY6MDkgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+IEhp
IFRob21hcywNCj4gT24gV2VkLCBKYW4gMTEsIDIwMjMgYXQgMDI6MDE6NTdQTSArMDEwMCwg
VGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+PiBJbmNsdWRlIDxsaW51eC9iYWNrbGlnaHQu
aD4gaW4gc291cmNlIGZpbGVzIHRoYXQgbmVlZCBpdC4gU29tZSBvZg0KPj4gRFJNJ3Mgc291
cmNlIGNvZGUgZ2V0cyB0aGUgYmFja2xpZ2h0IGhlYWRlciB2aWEgZHJtX2NydGNfaGVscGVy
LmgNCj4+IGFuZCA8bGludXgvZmIuaD4sIHdoaWNoIGNhbiBsZWVkIHRvIHVubmVjZXNzYXJ5
IHJlY29tcGlsYXRpb24uIElmDQo+PiBwb3NzaWJsZSwgZG8gbm90IGluY2x1ZGUgZHJtX2Ny
dGNfaGVscGVyLmggYW55IGxvbmdlci4NCj4gQXJlIHlvdSBwbGFubmluZyBhIGNsZWFuLXVw
IG9mIGRybV9jcnRjX2hlbHBlci5oIGxhdGVyPw0KDQo+IFdpdGggYSBoYW5kZnVsIG9mIGZv
cndhcmQgaXQgY291bGQgbG9zc2UgYWxsIGluY2x1ZGVzLg0KDQpJbmRlZWQsIGxvb2tzIGxp
a2UgaXQuIEFuZCBhIHF1aWNrIGdyZXAgc2hvd3MgdGhhdCBtYW55IHNvdXJjZSBmaWxlcyAN
CmluY2x1ZGUgdGhpcyBoZWFkZXIuIEkga2VlcCBpdCBpbiBtaW5kIHRvIHRyeSB0byBpbXBy
b3ZlIHRoYXQuDQoNCj4gDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiBBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiAjIGFtZA0KPiBSZXZpZXdlZC1ieTogU2Ft
IFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPg0KDQpJJ3ZlIGFscmVhZHkgbWVyZ2VkIHRo
ZSBzZXJpZXMuIE1heGltZSBnYXZlIGFuIGEtYiB2aWEgSVJDLiBTdGlsbCB0aGFua3MgDQpm
b3IgcmV2aWV3aW5nLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+PiAtLS0NCj4+ICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FjcGkuYyAgICAgICAgICB8IDIg
Ky0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uYyB8IDEgKw0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2JhY2tsaWdodC5jICAg
ICAgICAgICAgICAgIHwgMiArKw0KPj4gICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9hY3BpLmMgICAgICAgICAgICAgIHwgMiArLQ0KPj4gICA0IGZpbGVzIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FjcGkuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9hY3BpLmMNCj4+IGluZGV4IDU3YjVlMTE0NDZjNi4uZjI5
YzFkMGFkNGMxIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2FjcGkuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2FjcGkuYw0KPj4gQEAgLTI0LDYgKzI0LDcgQEANCj4+ICAgDQo+PiAgICNpbmNsdWRl
IDxsaW51eC9wY2kuaD4NCj4+ICAgI2luY2x1ZGUgPGxpbnV4L2FjcGkuaD4NCj4+ICsjaW5j
bHVkZSA8bGludXgvYmFja2xpZ2h0Lmg+DQo+PiAgICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+
DQo+PiAgICNpbmNsdWRlIDxsaW51eC9wb3dlcl9zdXBwbHkuaD4NCj4+ICAgI2luY2x1ZGUg
PGxpbnV4L3BtX3J1bnRpbWUuaD4NCj4+IEBAIC0zMSw3ICszMiw2IEBADQo+PiAgICNpbmNs
dWRlIDxhY3BpL3ZpZGVvLmg+DQo+PiAgICNpbmNsdWRlIDxhY3BpL2FjdGJsLmg+DQo+PiAg
IA0KPj4gLSNpbmNsdWRlIDxkcm0vZHJtX2NydGNfaGVscGVyLmg+DQo+PiAgICNpbmNsdWRl
ICJhbWRncHUuaCINCj4+ICAgI2luY2x1ZGUgImFtZGdwdV9wbS5oIg0KPj4gICAjaW5jbHVk
ZSAiYW1kZ3B1X2Rpc3BsYXkuaCINCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYw0KPj4gaW5kZXggMWI3ZjIwYTlkNGFl
Li41NWE4NDVlYjBjNmQgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+PiBAQCAtNjcsNiArNjcsNyBA
QA0KPj4gICAjaW5jbHVkZSAiaXZzcmNpZC9pdnNyY2lkX3Zpc2xhbmRzMzAuaCINCj4+ICAg
DQo+PiAgICNpbmNsdWRlICJpMmNhdXhfaW50ZXJmYWNlLmgiDQo+PiArI2luY2x1ZGUgPGxp
bnV4L2JhY2tsaWdodC5oPg0KPj4gICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+PiAg
ICNpbmNsdWRlIDxsaW51eC9tb2R1bGVwYXJhbS5oPg0KPj4gICAjaW5jbHVkZSA8bGludXgv
dHlwZXMuaD4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2JhY2ts
aWdodC5jIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9iYWNrbGlnaHQuYw0KPj4gaW5kZXgg
NTc3YTQ5ODdiMTkzLi44NzExYTdhNWI4ZGEgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZ21hNTAwL2JhY2tsaWdodC5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZ21h
NTAwL2JhY2tsaWdodC5jDQo+PiBAQCAtNyw2ICs3LDggQEANCj4+ICAgICogQXV0aG9yczog
RXJpYyBLbm9wcA0KPj4gICAgKi8NCj4+ICAgDQo+PiArI2luY2x1ZGUgPGxpbnV4L2JhY2ts
aWdodC5oPg0KPj4gKw0KPj4gICAjaW5jbHVkZSA8YWNwaS92aWRlby5oPg0KPj4gICANCj4+
ICAgI2luY2x1ZGUgInBzYl9kcnYuaCINCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl9hY3BpLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9hY3BpLmMNCj4+IGluZGV4IGI2MDNjMGI3NzA3NS4uNTc3MWQxZmNiMDczIDEwMDY0NA0K
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYWNwaS5jDQo+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9hY3BpLmMNCj4+IEBAIC0yMiw2ICsy
Miw3IEBADQo+PiAgICAqLw0KPj4gICANCj4+ICAgI2luY2x1ZGUgPGxpbnV4L2FjcGkuaD4N
Cj4+ICsjaW5jbHVkZSA8bGludXgvYmFja2xpZ2h0Lmg+DQo+PiAgICNpbmNsdWRlIDxsaW51
eC9wY2kuaD4NCj4+ICAgI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4NCj4+ICAgI2lu
Y2x1ZGUgPGxpbnV4L3Bvd2VyX3N1cHBseS5oPg0KPj4gQEAgLTMwLDcgKzMxLDYgQEANCj4+
ICAgI2luY2x1ZGUgPGFjcGkvYWNwaV9idXMuaD4NCj4+ICAgI2luY2x1ZGUgPGFjcGkvdmlk
ZW8uaD4NCj4+ICAgDQo+PiAtI2luY2x1ZGUgPGRybS9kcm1fY3J0Y19oZWxwZXIuaD4NCj4+
ICAgI2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+DQo+PiAgIA0KPj4gICAjaW5j
bHVkZSAiYXRvbS5oIg0KPj4gLS0gDQo+PiAyLjM5LjANCg0KLS0gDQpUaG9tYXMgWmltbWVy
bWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1h
bnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8g
VG90ZXYNCg==

--------------1jgr0EovOjZDVbH0Kh0i4KuW--

--------------Lkgm8dNnII7GyCNNXTvXw0tK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPBeusFAwAAAAAACgkQlh/E3EQov+BX
gRAAzMAFXiW6nyZ/XKvxeAliz6cmsRLu7yD+w1ZksIAyp2Dq1SZG0D3o1Y6i53yy7xaEazVYBqYw
DBUu8LFsxaqlcThwb2NNpwLZjCcs4eRT+MepVCTDHEBE9KsAdzM7HORvAiDeLJFXGO3JfFt0QiXO
I40D/vx/UC8QpBRfwdt4eH7/7ommD7kPaLAag1/Pzt6kEL4buk8w6GuVbS2LQOvbXoMAuBvb3b0Y
3q1VIVrwgTxRXmZ2yS3lTVMuFoBpwNLSbxQYanKLTambyDlHkg2mpmsi8zcKvCv6PHy/raAJaImu
voCwZvAqnDkWw/JB09ppmin0W3ZUUhOPEYBc99UoYTWGr0D/7FsZ9wM6YWM+VcK6WXecb/++EdWu
MAz/XHvTvdj/DKWv67v5jEZowbd6IiqpbS+Yoa8VFk+t9mI+ezXP7D0eOxDi8cnzAlvNybGg6iDq
amRC/8xVxj3H1cgDp0MOItG3qWhbRZv6ji7VshJ7cb2RRoYRZkQUM5+B9meWzxjWc35HLCXNtUdL
cBilviJ2BEvgw997uQfxW469LLcWwD4pFuLD1PkbI8335pSRBvGIms9AxED5ao/6dfhvLnxm9tVJ
KQaPWCFIiEVgtbHzL/4IMVGIWo2s1FhOTJ8sk7jPF9woURDzgCyzJWHVH3Wdbstjd1SBL6yKOu/Z
Jh4=
=gZMw
-----END PGP SIGNATURE-----

--------------Lkgm8dNnII7GyCNNXTvXw0tK--

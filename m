Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F223466E15C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 15:55:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7877410E54D;
	Tue, 17 Jan 2023 14:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AEAE10E54D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 14:55:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 643981FF3B;
 Tue, 17 Jan 2023 14:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673967322; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7zn+qbPC9I/AxsnszqwMEG/nee6e1k7IdY2WL8XPEkE=;
 b=Ac7lxLdRIZz8VvRyMe7Pur7EIetFqX8gasSKI3fnp2JauUYCr3XROmw6Etg5GbZ53C3taq
 aKANSNEVI2VM3sZUe97tXvDz2rVUjmHO+nm+HTJwewWKV5lp5UM2fqIf/pjVto72W5HHtH
 7vYIy8av189lvJniHskekfRCBh5lX0U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673967322;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7zn+qbPC9I/AxsnszqwMEG/nee6e1k7IdY2WL8XPEkE=;
 b=hwm8dx7nsGQpvezCrPvur7s28NvbH1dqZWIb1SzORDYemMo2ka06G1oC1/6tzfTPN6nnG0
 wZsRiqjm1ZlYesAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 356011390C;
 Tue, 17 Jan 2023 14:55:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GqX8C9q2xmPtOQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 17 Jan 2023 14:55:22 +0000
Message-ID: <12cff1b1-b8dc-7fb4-2228-8af4b30c09c5@suse.de>
Date: Tue, 17 Jan 2023 15:55:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 8/8] arm64: tegra: Add simple framebuffer on Jetson
 Xavier NX
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
 <20221117184039.2291937-9-thierry.reding@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221117184039.2291937-9-thierry.reding@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JdpoF82CkkDZeNdPqNF054Kw"
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JdpoF82CkkDZeNdPqNF054Kw
Content-Type: multipart/mixed; boundary="------------7ToGNKb16hhOGsfc7HUcQvvk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Jon Hunter <jonathanh@nvidia.com>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org
Message-ID: <12cff1b1-b8dc-7fb4-2228-8af4b30c09c5@suse.de>
Subject: Re: [PATCH v3 8/8] arm64: tegra: Add simple framebuffer on Jetson
 Xavier NX
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
 <20221117184039.2291937-9-thierry.reding@gmail.com>
In-Reply-To: <20221117184039.2291937-9-thierry.reding@gmail.com>

--------------7ToGNKb16hhOGsfc7HUcQvvk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMTEuMjIgdW0gMTk6NDAgc2NocmllYiBUaGllcnJ5IFJlZGluZzoNCj4g
RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4NCj4gDQo+IEFkZCB0
aGUgZnJhbWVidWZmZXIgY2FydmVvdXQgcmVzZXJ2ZWQgbWVtb3J5IG5vZGUgYXMgd2VsbCBh
cyBhIHNpbXBsZS0NCj4gZnJhbWVidWZmZXIgbm9kZSB0aGF0IGlzIHVzZWQgdG8gYmluZCB0
byB0aGUgZnJhbWVidWZmZXIgdGhhdCB0aGUNCj4gYm9vdGxvYWRlciBoYXMgc2V0IHVwLg0K
DQpJIGRvbid0IGtub3cgYWJvdXQgdGhlIGN1cnJlbnQgc3RhdHVzIG9mIHRoaXMgcGF0Y2hz
ZXQsIGJ1dCBmZWVsIGZyZWUgdG8gDQpzZW5kIHdoYXRldmVyIHVwZGF0ZSB5b3UgaGF2ZS4N
Cg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGhpZXJy
eSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4NCj4gLS0tDQo+IENoYW5nZXMgaW4gdjI6
DQo+IC0gY2xlYXIgb3V0IGR5bmFtaWMgZmllbGRzIGFuZCBsZWF2ZSBpdCB1cCB0byBmaXJt
d2FyZSB0byBmaWxsIHRoZW0gaW4NCj4gLSBtYXJrIHNpbXBsZS1mcmFtZWJ1ZmZlciBub2Rl
IGFzIGRpc2FibGVkIGJ5IGRlZmF1bHQNCj4gDQo+ICAgLi4uL252aWRpYS90ZWdyYTE5NC1w
MzUwOS0wMDAwK3AzNjY4LTAwMDEuZHRzIHwgNDMgKysrKysrKysrKysrKysrKysrKw0KPiAg
IGFyY2gvYXJtNjQvYm9vdC9kdHMvbnZpZGlhL3RlZ3JhMTk0LmR0c2kgICAgICB8ICAyICst
DQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9udmlkaWEvdGVncmEx
OTQtcDM1MDktMDAwMCtwMzY2OC0wMDAxLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbnZp
ZGlhL3RlZ3JhMTk0LXAzNTA5LTAwMDArcDM2NjgtMDAwMS5kdHMNCj4gaW5kZXggMjM4ZmQ5
OGU4ZTQ1Li44NWI0YWFhMmFkNGUgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvbnZpZGlhL3RlZ3JhMTk0LXAzNTA5LTAwMDArcDM2NjgtMDAwMS5kdHMNCj4gKysrIGIv
YXJjaC9hcm02NC9ib290L2R0cy9udmlkaWEvdGVncmExOTQtcDM1MDktMDAwMCtwMzY2OC0w
MDAxLmR0cw0KPiBAQCAtNyw0ICs3LDQ3IEBADQo+ICAgLyB7DQo+ICAgCW1vZGVsID0gIk5W
SURJQSBKZXRzb24gWGF2aWVyIE5YIERldmVsb3BlciBLaXQgKGVNTUMpIjsNCj4gICAJY29t
cGF0aWJsZSA9ICJudmlkaWEscDM1MDktMDAwMCtwMzY2OC0wMDAxIiwgIm52aWRpYSx0ZWdy
YTE5NCI7DQo+ICsNCj4gKwljaG9zZW4gew0KPiArCQlmcmFtZWJ1ZmZlciB7DQo+ICsJCQlj
b21wYXRpYmxlID0gInNpbXBsZS1mcmFtZWJ1ZmZlciI7DQo+ICsJCQlzdGF0dXMgPSAiZGlz
YWJsZWQiOw0KPiArCQkJbWVtb3J5LXJlZ2lvbiA9IDwmZmI+Ow0KPiArCQkJcG93ZXItZG9t
YWlucyA9IDwmYnBtcCBURUdSQTE5NF9QT1dFUl9ET01BSU5fRElTUD47DQo+ICsJCQljbG9j
a3MgPSA8JmJwbXAgVEVHUkExOTRfQ0xLX1NPUjFfUkVGPiwNCj4gKwkJCQkgPCZicG1wIFRF
R1JBMTk0X0NMS19TT1IxX09VVD4sDQo+ICsJCQkJIDwmYnBtcCBURUdSQTE5NF9DTEtfU09S
MV9QQURfQ0xLT1VUPiwNCj4gKwkJCQkgPCZicG1wIFRFR1JBMTk0X0NMS19QTExEMj4sDQo+
ICsJCQkJIDwmYnBtcCBURUdSQTE5NF9DTEtfUExMRFA+LA0KPiArCQkJCSA8JmJwbXAgVEVH
UkExOTRfQ0xLX05WRElTUExBWV9ESVNQPiwNCj4gKwkJCQkgPCZicG1wIFRFR1JBMTk0X0NM
S19OVkRJU1BMQVlIVUI+LA0KPiArCQkJCSA8JmJwbXAgVEVHUkExOTRfQ0xLX05WRElTUExB
WV9QMD47DQo+ICsJCQl3aWR0aCA9IDwwPjsNCj4gKwkJCWhlaWdodCA9IDwwPjsNCj4gKwkJ
CXN0cmlkZSA9IDwwPjsNCj4gKwkJCWZvcm1hdCA9ICJ4OGI4ZzhyOCI7DQo+ICsJCX07DQo+
ICsJfTsNCj4gKw0KPiArCXJlc2VydmVkLW1lbW9yeSB7DQo+ICsJCSNhZGRyZXNzLWNlbGxz
ID0gPDI+Ow0KPiArCQkjc2l6ZS1jZWxscyA9IDwyPjsNCj4gKwkJcmFuZ2VzOw0KPiArDQo+
ICsJCWZiOiBmcmFtZWJ1ZmZlckAwLDAgew0KPiArCQkJY29tcGF0aWJsZSA9ICJmcmFtZWJ1
ZmZlciI7DQo+ICsJCQlyZWcgPSA8MHgwIDB4MCAweDAgMHgwPjsNCj4gKwkJCWlvbW11LWFk
ZHJlc3NlcyA9IDwmZGMwIDB4MCAweDAgMHgwIDB4MD47DQo+ICsJCX07DQo+ICsJfTsNCj4g
Kw0KPiArCWJ1c0AwIHsNCj4gKwkJaG9zdDF4QDEzZTAwMDAwIHsNCj4gKwkJCWRpc3BsYXkt
aHViQDE1MjAwMDAwIHsNCj4gKwkJCQlkaXNwbGF5QDE1MjAwMDAwIHsNCj4gKwkJCQkJbWVt
b3J5LXJlZ2lvbiA9IDwmZmI+Ow0KPiArCQkJCX07DQo+ICsJCQl9Ow0KPiArCQl9Ow0KPiAr
CX07DQo+ICAgfTsNCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbnZpZGlh
L3RlZ3JhMTk0LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL252aWRpYS90ZWdyYTE5NC5k
dHNpDQo+IGluZGV4IGQwZGJmYWZiYzkzMC4uZWMzMThiOWU3MDBjIDEwMDY0NA0KPiAtLS0g
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL252aWRpYS90ZWdyYTE5NC5kdHNpDQo+ICsrKyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvbnZpZGlhL3RlZ3JhMTk0LmR0c2kNCj4gQEAgLTE5NzIsNyAr
MTk3Miw3IEBAIGRpc3BsYXktaHViQDE1MjAwMDAwIHsNCj4gICANCj4gICAJCQkJcmFuZ2Vz
ID0gPDB4MTUyMDAwMDAgMHgxNTIwMDAwMCAweDQwMDAwPjsNCj4gICANCj4gLQkJCQlkaXNw
bGF5QDE1MjAwMDAwIHsNCj4gKwkJCQlkYzA6IGRpc3BsYXlAMTUyMDAwMDAgew0KPiAgIAkJ
CQkJY29tcGF0aWJsZSA9ICJudmlkaWEsdGVncmExOTQtZGMiOw0KPiAgIAkJCQkJcmVnID0g
PDB4MTUyMDAwMDAgMHgxMDAwMD47DQo+ICAgCQkJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkg
MTUzIElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhS
QiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K


--------------7ToGNKb16hhOGsfc7HUcQvvk--

--------------JdpoF82CkkDZeNdPqNF054Kw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPGttkFAwAAAAAACgkQlh/E3EQov+An
Gw//clp/pBn5J+tUISX27Ps3E8yNcZZELXgDzZIq1YZNZ1+S+tA6dMwZ4yJRqtV/Sts9NCZCgtxc
JfbR63EN0rEpVOa3avBdktxxhLJRE1bvdnOo6KpPc8HQ31UKw35fRekrHKqa4QleIxdHgyf0nXvw
4PxG1Ozi6fm7gCU+XlfPnyU4QsAWWGFvm/wv6NCOmUWX/XRikg91VMOOeA080C7xNTk/uez/kY5Z
vBkgHXmcx1LFhuBffdQFFAMn4wSrJb505S+9VlnuLzNfuuCvyce2vCwSj0vEZUEu/zlCboHgdP67
kFm3RYK1lrFFPqPfNJTw1g4r2uP59Mmc/0c/HMl1Y2fQkiQa5SXuQs5ZUHHYjaGRN8viGLGeuM21
8MI//hxWm/JHaK4FSUqgAhUBU8HaRiopBip5pG4DQMq+N7CE++0phBxh/IJNfaoo4FcwgED3cLNp
vHCxFlyfEneHHoTKymRXk+9uuFRHKiXFmvmYUnw2T00gQgmYhVDW1bKQjTfmFr3DeJoTgM/kQmzZ
9i1vtYxFeIhgCBECNEnpKfrohF39jBH72jnio42mrzXLqcv9roe/a9m9Gh83hV1zwyKw207Av/LK
D8TLhezEABE6g+6fr3G6TbpIlCto/yB7BbHQISvLm++2iqudMF3FVz1G6HB4XI0ESkH2RDg5lHPW
stc=
=Fbk7
-----END PGP SIGNATURE-----

--------------JdpoF82CkkDZeNdPqNF054Kw--

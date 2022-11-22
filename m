Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C78633706
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 09:27:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F8510E3A2;
	Tue, 22 Nov 2022 08:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from danwin1210.de (danwin1210.de [IPv6:2a01:4f8:c010:d56::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60C110E1A2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 00:34:24 +0000 (UTC)
Received: from danwin1210.de (unknown [10.9.0.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X448 server-signature ECDSA (secp384r1)
 client-signature ED448)
 (Client CN "danwin1210.me", Issuer "danwin1210.me" (verified OK))
 by mail.danwin1210.de (Postfix) with ESMTPS id 444361F4A2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 00:34:22 +0000 (UTC)
Received: from [127.0.0.1] (unknown [10.9.0.1])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by danwin1210.de (Postfix) with ESMTPSA id 34AB03C144
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 00:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=danwin1210.de;
 s=20211204-rsa; t=1669077261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zge/xWZNOq8qrDouu3X8Yo5kaKakVeO1y5elsjN9ulQ=;
 b=xB+4R9yY8hi0inXwZNEYWDsSxRAalVq19pI85zIpYdcFZtR2qHI7yVeEtg9RBPOQ6A1Dtr
 6zZZ71xTVkb+0G56kwHKKEeB6iZ7IC5HuYk1r9tnZVk1nmGA2HBxq0zMcbkAi+9vhjC97O
 QI/JC49WAyW/qY7Y0jMyZJLrBlM95A70Ojzy7cpEq5ng5GlI3v1yTfQJp+fZPh6OVadf17
 Ud7gPchk/q8iVg9r7//uZQZQ5jNccQumXVFQwhS5Nfy8Yoo7LgMx+DHOu6wfJG6gJDrr9I
 zTNoEVibR42faCj5cgK9neqcYAxUGnSkr26F4jj3jcwtqjh0zYdJl5SP9KpfQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=danwin1210.de;
 s=20211204-ed25519; t=1669077261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zge/xWZNOq8qrDouu3X8Yo5kaKakVeO1y5elsjN9ulQ=;
 b=WmLuDMnpFmwUVnj3/sNHrZOfB/qRzNePIv6dYIb3jQYM9OH+9ccMQw5iVA/IW+aTFWrxUv
 vdA58RAVjfZnuwCw==
Message-ID: <fc4fb250-430c-af85-cafb-58d606b07d71@danwin1210.de>
Date: Tue, 22 Nov 2022 00:33:46 +0000
MIME-Version: 1.0
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <ff36cca2-d4c7-1e1f-9853-9c4af716a889@danwin1210.de>
 <f61043d2-72e8-11e1-4f8c-2e55d9dad076@suse.de>
From: Jeremy Rand <jeremyrand@danwin1210.de>
Subject: Re: ast: resolutions that require single-buffering (due to VRAM
 limitations) are unavailable
In-Reply-To: <f61043d2-72e8-11e1-4f8c-2e55d9dad076@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VCMo0tnSqUTLFPOCtV0mSGpp"
X-Mailman-Approved-At: Tue, 22 Nov 2022 08:27:33 +0000
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
--------------VCMo0tnSqUTLFPOCtV0mSGpp
Content-Type: multipart/mixed; boundary="------------hKB6oUAiypQ2fbuRl2TaWtmm";
 protected-headers="v1"
From: Jeremy Rand <jeremyrand@danwin1210.de>
To: dri-devel@lists.freedesktop.org
Message-ID: <fc4fb250-430c-af85-cafb-58d606b07d71@danwin1210.de>
Subject: Re: ast: resolutions that require single-buffering (due to VRAM
 limitations) are unavailable
References: <ff36cca2-d4c7-1e1f-9853-9c4af716a889@danwin1210.de>
 <f61043d2-72e8-11e1-4f8c-2e55d9dad076@suse.de>
In-Reply-To: <f61043d2-72e8-11e1-4f8c-2e55d9dad076@suse.de>

--------------hKB6oUAiypQ2fbuRl2TaWtmm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

VGhvbWFzIFppbW1lcm1hbm46DQo+IEhpDQo+IA0KPiBBbSAyNS4xMC4yMiB1bSAwOToxMiBz
Y2hyaWViIEplcmVteSBSYW5kOg0KPj4gSGkgZHJpLWRldmVsLA0KPj4NCj4+IEkgaGF2ZSB0
d28gbWFjaGluZXMgd2l0aCBBU1BFRUQgR1BVJ3MgKGFzdCBMaW51eCBkcml2ZXIpLsKgIE9u
ZSBtYWNoaW5lIA0KPj4gaXMgeDg2XzY0LCBydW5uaW5nIGFuIEFTUm9jayBSYWNrIFRvbW15
IDkwLVNDMDJQMS0wMFVCTlogR1BVIChBU1QyNTEwIA0KPj4gY2hpcHNldCkgd2l0aCBLREUg
UGxhc21hIFdheWxhbmQ7IHRoZSBvdGhlciBpcyBwcGM2NGxlLCBydW5uaW5nIGFuIA0KPj4g
aW50ZWdyYXRlZCBBU1QyNTAwIEdQVSB3aXRoIEtERSBQbGFzbWEgWDExLsKgIEJvdGggdGhl
IEFTVDI1MTAgYW5kIA0KPj4gQVNUMjUwMCBoYXZlIDE2IE1pQiBWUkFNIGFjY29yZGluZyB0
byBsc3BjaS7CoCBCb3RoIEFTUEVFRCBHUFUncyBhcmUgDQo+PiBhZHZlcnRpc2VkIGFzIHN1
cHBvcnRpbmcgdXAgdG8gMTkyMHgxMjAwIHJlc29sdXRpb24sIGJ1dCBLREUgb25seSANCj4+
IGRldGVjdHMgYSBtYXhpbXVtIHJlc29sdXRpb24gb2YgMTkyMHgxMDgwLg0KPj4NCj4+IFNv
bWUgYWRkaXRpb25hbCBpbmZvcm1hdGlvbiBhYm91dCB0aGlzIGJ1ZyBjYW4gYmUgZm91bmQg
YXQgDQo+PiBodHRwczovL2ZvcnVtcy5yYXB0b3Jjcy5jb20vaW5kZXgucGhwL3RvcGljLDMx
LjAuaHRtbCAuDQo+Pg0KPj4gSSBiZWxpZXZlIHRoaXMgaXMgYSBMaW51eCBidWcsIGJlY2F1
c2UgaXQgaXMgc29sZWx5IGRlcGVuZGVudCBvbiB0aGUgDQo+PiBMaW51eCB2ZXJzaW9uLsKg
IFRoZSBmb2xsb3dpbmcgTGludXggdmVyc2lvbnMgYXJlIGNvbmZpcm1lZCB0byBoYXZlIHRo
ZSANCj4+IGJ1ZzoNCj4+DQo+PiBEZWJpYW46DQo+PiA1LjYuMC0xIChwcGM2NGVsKQ0KPj4g
RmVkb3JhOg0KPj4gNS42LjAtMS5mYzMzLng4Nl82NA0KPj4gNS42LjAtMS5mYzMzLnBwYzY0
bGUNCj4+IDUuMTcuNS0zMDAuZmMzNi54ODZfNjQNCj4+IDUuMTguNi0yMDAuZmMzNi5wcGM2
NGxlDQo+PiA2LjEuMC0wLnJjMC4yMDIyMTAwN2dpdDRjODYxMTQxOTRlNi41LmZjMzgucHBj
NjRsZQ0KPj4NCj4+IFdoZXJlYXMgdGhlIGZvbGxvd2luZyBMaW51eCB2ZXJzaW9ucyBhcmUg
Y29uZmlybWVkIHRvIHdvcmsgZmluZSAobWF4IA0KPj4gcmVzb2x1dGlvbiBkZXRlY3RlZCBi
eSBLREUgaXMgMTkyMHgxMjAwIGFzIGl0IHNob3VsZCBiZSwgYW5kIHRoYXQgDQo+PiByZXNv
bHV0aW9uIHdvcmtzIGZpbmUgd2hlbiBzZWxlY3RlZCk6DQo+Pg0KPj4gRGViaWFuOg0KPj4g
NS41LjAtMiAocHBjNjRlbCkNCj4+IEZlZG9yYToNCj4+IDUuNS4xNy0yMDAuZmMzMS54ODZf
NjQNCj4+IDUuNS4xNy0yMDAuZmMzMS5wcGM2NGxlDQo+Pg0KPj4gSSBiZWxpZXZlIHRoZSBi
dWcgd2FzIGludHJvZHVjZWQgYnkgTGludXggY29tbWl0IA0KPj4gOTI1M2Y4MzBjOTE2NmJm
YTZjYzA3ZDVlZDU5ZTE3NGU5ZDVlYzZjYSwgd2hpY2ggYWRkcyBhIFZSQU0gc2l6ZSBjaGVj
ayANCj4+IHRoYXQgYXNzdW1lcyBkb3VibGUtYnVmZmVyaW5nLsKgIDE5MjB4MTA4MCByZXNv
bHV0aW9uIGF0IDQgYnl0ZXMgcGVyIA0KPj4gcGl4ZWwgd2l0aCAyIGJ1ZmZlcnMgaXMgMTYu
NiBNQiwgd2hpbGUgYnVtcGluZyB0aGF0IHRvIDE5MjB4MTIwMCANCj4+IHJlc3VsdHMgaW4g
MTguNCBNQi7CoCBTaW5jZSB0aGUgVlJBTSBzaXplIGlzIDE2IE1pQiA9PSAxNi44IE1CLCB0
aGF0IA0KPj4gZXhwbGFpbnMgdGhlIGlzc3VlLg0KPiANCj4gVGhhbmtzIGZvciByZXBvcnRp
bmcuIEl0J3MgYmVlbiBhIGtub3duIGlzc3VlIGZvciBhIHdoaWxlLg0KPiANCj4gQnV0IGlu
IHRoZSBtb3N0IHJlY2VudCBkZXZlbCB0cmVlLCB3ZSBoYXZlIHJlcGxhY2VkIGFzdCBtZW1v
cnkgDQo+IG1hbmFnZW1lbnQsIHNvIHRoYXQgaXQgY2FuIG5vdyB1c2UgdGhlIGZ1bGwgdnJh
bSBzaXplIGZvciBzY2Fub3V0IA0KPiBidWZmZXJzLiBTZWUNCj4gDQo+IA0KPiBodHRwczov
L2NnaXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tdGlwL2NvbW1pdC9kcml2ZXJzL2dwdS9k
cm0vYXN0L2FzdF9tb2RlLmM/aWQ9ZjJmYTVhOTljYTgxY2UxMDU2NTM5ZTgzYzcwNWYzZDZi
ZWM2MmUzMSANCj4gDQo+IA0KPiBUbyB0ZXN0LCBnZXQgdGhlIGxhdGVzdCBkcm0tdGlwIGZy
b20NCj4gDQo+ICDCoCBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLXRp
cA0KPiANCj4gYW5kIHRyeSBvbiB5b3VyIG1hY2hpbmUuDQo+IA0KPiBUaGUgdXBkYXRlZCBk
cml2ZXIgc2hvdWxkIGJlY29tZSBhdmFpbGFibGUgaW4gTGludXggdjYuMy4NCj4gDQo+IEJl
c3QgcmVnYXJkcw0KPiBUaG9tYXMNCg0KSGkgVGhvbWFzIQ0KDQpUaGFua3MgZm9yIHBvaW50
aW5nIG1lIHRvIHRoYXQgYnJhbmNoLiAgSXQgdG9vayBtZSBzb21lIHdlZWtzIHRvIGdldCBp
dCANCnRvIGJ1aWxkIGR1ZSB0byBteSBsYWNrIG9mIGV4cGVyaWVuY2UgYnVpbGRpbmcga2Vy
bmVscyBmcm9tIHNvdXJjZSANCihoZW5jZSB0aGUgZGVsYXllZCByZXBseSksIGJ1dCBJIGNh
biBjb25maXJtIHRoYXQgdGhlIGlzc3VlIGlzIGZpeGVkIGluIA0KZHJtLXRpcCAoMTkyMHgx
MjAwIHdvcmtzIGFzIGl0IHNob3VsZCBvbiBteSBwcGM2NGxlIHN5c3RlbTsgSSBkaWRuJ3Qg
DQp0ZXN0IG9uIG15IHg4Nl82NCBzeXN0ZW0pLiAgQWRkaXRpb25hbGx5LCBkcm0tdGlwIGZp
eGVzIGEgZGlmZmVyZW50IEFTVCANCmJ1ZyB0aGF0IHdhcyBjYXVzaW5nIGNlcnRhaW4gV2F5
bGFuZCBwcGM2NGxlIHN5c3RlbXMgKG1haW5seSBHTk9NRSwgS0RFLCANCmFuZCBHRE0pIHRv
IGhhbmcgb24gYSBibGFjayBzY3JlZW4gKGZvciB3aGljaCBJIHdhcyBoYWxmd2F5IHRocm91
Z2ggDQpwcmVwYXJpbmcgYSBidWcgcmVwb3J0KSwgc28gdGhhdCBpcyBhIHBsZWFzYW50IHN1
cnByaXNlLg0KDQpMb29raW5nIGZvcndhcmQgdG8gTGludXggdjYuMy4NCg0KQ2hlZXJzLA0K
LS0gDQotSmVyZW15IFJhbmQNCkxlYWQgQXBwbGljYXRpb24gRW5naW5lZXIgYXQgTmFtZWNv
aW4NCg==

--------------hKB6oUAiypQ2fbuRl2TaWtmm--

--------------VCMo0tnSqUTLFPOCtV0mSGpp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQQdBPudUL8qjp8+WK3cfn+K4w5z5gUCY3wY6gUDAAAAAAAKCRDcfn+K4w5z5kXV
AQDXjw5hCBvRH+Sp8b1a0KP6O7YTAkNrzsPZgMxFYCOjWQEA7YsorGy8DsQ26MjETg4OoTSHjE6m
Y2OsRnIpNWvq4Ac=
=557G
-----END PGP SIGNATURE-----

--------------VCMo0tnSqUTLFPOCtV0mSGpp--

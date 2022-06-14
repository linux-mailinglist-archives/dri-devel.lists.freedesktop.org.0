Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F24E54ABC9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 10:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BE410E27F;
	Tue, 14 Jun 2022 08:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92DE810FAF1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 08:29:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 430761F894;
 Tue, 14 Jun 2022 08:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655195361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4WTVk6G9nUzhpysAZt1RnEduyQYGdaFvpvXMr3jn9RA=;
 b=GwSqsDqropK2mihlbiE4lzeL2vREBNo/E5H28OsRVi/QEZwd4GCidO+2/pb1MTGa8Sfnlz
 TKT4P0FzIKyItZqn6XYYnli5q9L7hxUc7i+ojoj4drDwJkTRhJffQk6CM/otk+kpfDzeyV
 xSVu61cfLO3P4VHOoMiysvfrDX0ynV8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655195361;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4WTVk6G9nUzhpysAZt1RnEduyQYGdaFvpvXMr3jn9RA=;
 b=TdDVptVcwiSjNTEhvdMVfAGE4uLBj4FRCUoieXrpw0CRgxzZCLwC2T7CiKdfJx4gn7VnMD
 i66rWB02bGzMSVBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 21E2E1361C;
 Tue, 14 Jun 2022 08:29:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dJBWB+FGqGICHwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 14 Jun 2022 08:29:21 +0000
Message-ID: <ef19ba8b-ec66-9a00-5456-b4eefbec95cd@suse.de>
Date: Tue, 14 Jun 2022 10:29:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 02/64] drm/crtc: Introduce drmm_crtc_init_with_planes
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-3-maxime@cerno.tech>
 <d975dc1d-7573-7976-427f-e941cbfa0caf@suse.de>
 <20220614073716.zwshdcf3q5fjobuq@houat>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220614073716.zwshdcf3q5fjobuq@houat>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xc64ghTSnrEF6Lx7bj6D2S2M"
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xc64ghTSnrEF6Lx7bj6D2S2M
Content-Type: multipart/mixed; boundary="------------MUguF7wP3nUDiLY12dlro4eF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <ef19ba8b-ec66-9a00-5456-b4eefbec95cd@suse.de>
Subject: Re: [PATCH 02/64] drm/crtc: Introduce drmm_crtc_init_with_planes
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-3-maxime@cerno.tech>
 <d975dc1d-7573-7976-427f-e941cbfa0caf@suse.de>
 <20220614073716.zwshdcf3q5fjobuq@houat>
In-Reply-To: <20220614073716.zwshdcf3q5fjobuq@houat>

--------------MUguF7wP3nUDiLY12dlro4eF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMDYuMjIgdW0gMDk6Mzcgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBI
aSBUaG9tYXMsDQo+IA0KPiBPbiBNb24sIEp1biAxMywgMjAyMiBhdCAwMToyMzo1NFBNICsw
MjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IEFtIDEwLjA2LjIyIHVtIDExOjI4
IHNjaHJpZWIgTWF4aW1lIFJpcGFyZDoNCj4+PiBUaGUgRFJNLW1hbmFnZWQgZnVuY3Rpb24g
dG8gcmVnaXN0ZXIgYSBDUlRDIGlzDQo+Pj4gZHJtbV9jcnRjX2FsbG9jX3dpdGhfcGxhbmVz
KCksIHdoaWNoIHdpbGwgYWxsb2NhdGUgdGhlIHVuZGVybHlpbmcNCj4+PiBzdHJ1Y3R1cmUg
YW5kIGluaXRpYWxpc2F0aW9uIHRoZSBDUlRDLg0KPj4+DQo+Pj4gSG93ZXZlciwgd2UgbWln
aHQgd2FudCB0byBzZXBhcmF0ZSB0aGUgc3RydWN0dXJlIGNyZWF0aW9uIGFuZCB0aGUgQ1JU
Qw0KPj4+IGluaXRpYWxpc2F0aW9uLCBmb3IgZXhhbXBsZSBpZiB0aGUgc3RydWN0dXJlIGlz
IHNoYXJlZCBhY3Jvc3MgbXVsdGlwbGUNCj4+PiBEUk0gZW50aXRpZXMsIGZvciBleGFtcGxl
IGFuIGVuY29kZXIgYW5kIGEgY29ubmVjdG9yLg0KPj4+DQo+Pj4gTGV0J3MgY3JlYXRlIGFu
IGhlbHBlciB0byBvbmx5IGluaXRpYWxpc2UgYSBDUlRDIHRoYXQgd291bGQgYmUgcGFzc2Vk
IGFzDQo+Pj4gYW4gYXJndW1lbnQuDQo+Pg0KPj4gQmVmb3JlIEkgcmV2aWV3IGFsbCBvZiB0
aGVzIHBhdGNoZXMsIG9uZSBxdWVzdGlvbi4gaXQncyB5ZXQgbm90IGNsZWFyIHRvIG1lDQo+
PiB3aHkgZHJtX2NydGNfaW5pdF93aXRoX3BsYW5lcygpIHdvdWxkbid0IHdvcmsuIChJIGtu
b3cgd2UgZGlzY3Vzc2VkIHRoaXMgb24NCj4+IElSQy4pDQo+Pg0KPj4gSWYgeW91J3JlIGNh
bGxpbmcgZHJtbV9tb2RlX2NvbmZpZ19pbml0KCksIGl0IHdpbGwgY2xlYW4gdXAgYWxsIHRo
ZSBDUlRDLA0KPj4gZW5jb2RlciBjb25uZWN0b3IsIGV0Yy4gZGF0YSBzdHJ1Y3R1cmVzIGZv
ciB5b3UuIEZvciBDUlRDIGluc3RhbmNlcyBpbg0KPj4ga21hbGxvY2VkIG1lbW9yeSwgd291
bGRuJ3QgaXQgYmUgc2ltcGxlciB0byBwdXQgdGhlIGNvcnJlc3BvbmRpbmcga2ZyZWUgaW50
bw0KPj4gdmM0X2NydGNfZGVzdHJveSgpPw0KPiANCj4gTXkgaW50ZW50IHdhcyB0byByZW1v
dmUgYXMgbXVjaCBvZiB0aGUgbGlmZXRpbWUgaGFuZGxpbmcgYW5kDQo+IG1lbW9yeS1tYW5h
Z2VtZW50IGZyb20gZHJpdmVycyBhcyBwb3NzaWJsZS4NCj4gDQo+IE15IGZlZWxpbmcgaXMg
dGhhdCB3aGlsZSB0aGUgc29sdXRpb24geW91IHN1Z2dlc3Qgd291bGQgZGVmaW5pdGVseSB3
b3JrLA0KPiBpdCByZWxpZXMgb24gZHJpdmVycyBhdXRob3JzIHRvIGtub3cgYWJvdXQgdGhp
cywgYW5kIG1ha2UgdGhlIGVmZm9ydCB0bw0KPiBjb252ZXJ0IHRoZSBkcml2ZXJzIHRoZW1z
ZWx2ZXMuIEFuZCB0aGVuIHdlIHdvdWxkIGhhdmUgdG8gcmV2aWV3IHRoYXQsDQo+IHdoaWNo
IHdlIHdpbGwgcHJvYmFibHkgbWlzcyAoY29sbGVjdGl2ZWx5KSwgYmVjYXVzZSBpdCdzIGEg
Yml0IG9ic2N1cmUuDQo+IA0KPiBXaGlsZSB3aXRoIGVpdGhlciB0aGUgZHJtbV9hbGxvY18q
IGZ1bmN0aW9ucywgb3IgdGhlIG5ldyBmdW5jdGlvbnMgSQ0KPiBpbnRyb2R1Y2UgdGhlcmUs
IHdlIGNhbiBqdXN0IGRlcHJlY2F0ZSB0aGUgb2xkIG9uZXMsIGNyZWF0ZSBhIFRPRE8gZW50
cnkNCj4gYW5kIGEgY29jY2luZWxsZSBzY3JpcHQgYW5kIHRydXN0IHRoYXQgaXQgd29ya3Mg
cHJvcGVybHkuDQoNClRoYW5rcyBmb3IgZXhwbGFpbmluZyB0aGUgbW90aXZhdGlvbi4NCg0K
SSB3b3VsZCBub3Qgd2FudCB0byBkZXByZWNhdGUgYW55IG9mIHRoZSBleGlzdGluZyBmdW5j
dGlvbnMsIGFzIHRoZXkgDQp3b3JrIGZvciBtYW55IGRyaXZlcnMuIFRoZSBkcm1tXyBmdW5j
dGlvbnMgYWRkIGFkZGl0aW9uYWwgb3ZlcmhlYWQgdGhhdCANCm5vdCBldmVyeW9uZSBpcyB3
aWxsaW5nIHRvIHBheS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gTWF4aW1l
DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIN
ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwg
OTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpH
ZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------MUguF7wP3nUDiLY12dlro4eF--

--------------xc64ghTSnrEF6Lx7bj6D2S2M
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKoRuAFAwAAAAAACgkQlh/E3EQov+Bz
PhAAoQCA/zxJhj2lJ2Uyfo1M2tYlcI76jNxEQrTapT3PJAAGBKI+KA85GmQp8FuHHWrvgqz0MbTs
CdADvW2wLB5+4VNWvflFBetXcqhzM8kU2IYEdrhVlSN0zW8slzU7jfxJScx2ZUEkCL5/M80b6NAr
vpVHBGYWuv+VcsBSgOU4oE4j8DLjvrMf9j4NKRegtYtPgmajCLVFbjXkke5ZzpZEbyzEiK2oEnbI
nuCfNLEWmUf9F1wc84m4KLl1gbphdQyTqq3O4oLlQmKjIDsZQOE6bWK2Yh+rLmTWe+nMZ7IuaY+y
/mQVl3TG4TRsKGKSWEV84CLZQ0XHI2WvB+hmuDo5DfTVoVtCz+NV6vDjuJ2+1Iq7GgvopIBtV0cA
FTzZpqRx9cgaSE/KLV81RaDAI2Ey80971FycnQ2DvIfy12lxF5rz3Mk6Ee2t+14EToBIf0xSjkSV
G0Ozz6k9/pJDq+hyRr/vZbMF1aQJjt7xgJ4qaasGfTqmmWpiKT3NaqOXJkhU2lqPklykNNNauL/0
9HcrSQPg870fUXtFAiLhgaP+9Hq/kJ132DNWVB819ZbZIJkIDkn3PwakAAq6cUCQho0bueMKNXdB
+nFoRgJHGO8oafUEYM3mJZQdDqGOehHqivRcOsv+Zd1DmIeOX8wUHzHfvGI+ji41RtJwnxma12XJ
mQg=
=nBM5
-----END PGP SIGNATURE-----

--------------xc64ghTSnrEF6Lx7bj6D2S2M--

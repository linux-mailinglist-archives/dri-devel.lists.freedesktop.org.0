Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB463512D46
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 09:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C327C10E58A;
	Thu, 28 Apr 2022 07:45:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A391C10E5FE
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 07:45:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1676521873;
 Thu, 28 Apr 2022 07:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651131937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cufGTPO84j6WedhhOL9c40/67cCG/urbR7nYRMt7+KQ=;
 b=BTk7TOg+2WZXr+b0qywRubY8fZjWB2urkbNVsDUHdBPAsAWWoyACwWzrz7tlyUP27+8XMm
 SgTngPQ7JQ+KsQDTzqj/EaTNqUgD8JaH6DNmJ0FaGPpGEmXhKwWl24O8zPRJb0+poiW4GH
 wEhbfHCZHyfwiDJvS8iaGVcI6qzB7eE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651131937;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cufGTPO84j6WedhhOL9c40/67cCG/urbR7nYRMt7+KQ=;
 b=mpC5PFzDvLMVNX9zlVklvuYJn1Po/qoAa8Eon2iH1Hb6/aWh9AFUnJxcfii1zJ1naBoKFS
 OtWZzBP7R/bjlQAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F091E13AF8;
 Thu, 28 Apr 2022 07:45:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xtTTOSBGamIIGAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 28 Apr 2022 07:45:36 +0000
Message-ID: <af31d343-202b-ffaa-c6a9-b20247938dfd@suse.de>
Date: Thu, 28 Apr 2022 09:45:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] drm/display: Select DP helper for DRM_DP_AUX_CHARDEV
 and DRM_DP_CEC
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220427215528.237861-1-javierm@redhat.com>
 <46446e78-60a6-1b8c-1bb6-1c005489d58c@suse.de>
 <6f3b8d37-0a70-a035-e87b-5aa72926fff9@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <6f3b8d37-0a70-a035-e87b-5aa72926fff9@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IrW65zLf6tfVwvHM751lr396"
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------IrW65zLf6tfVwvHM751lr396
Content-Type: multipart/mixed; boundary="------------WamMDks024C9JFKX6lPPy04O";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Message-ID: <af31d343-202b-ffaa-c6a9-b20247938dfd@suse.de>
Subject: Re: [PATCH v2] drm/display: Select DP helper for DRM_DP_AUX_CHARDEV
 and DRM_DP_CEC
References: <20220427215528.237861-1-javierm@redhat.com>
 <46446e78-60a6-1b8c-1bb6-1c005489d58c@suse.de>
 <6f3b8d37-0a70-a035-e87b-5aa72926fff9@redhat.com>
In-Reply-To: <6f3b8d37-0a70-a035-e87b-5aa72926fff9@redhat.com>

--------------WamMDks024C9JFKX6lPPy04O
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjguMDQuMjIgdW0gMDk6MjYgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIFRob21hcywNCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBmZWVkYmFj
ay4NCj4gDQo+IE9uIDQvMjgvMjIgMDk6MDIsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0K
PiANCj4gW3NuaXBdDQo+IA0KPj4+IENoYW5nZXMgaW4gdjI6DQo+Pj4gLSBFeHBsYWluIGJl
dHRlciB0aGUgaXNzdWUgaW4gdGhlIGNoYW5nZSBkZXNjcmlwdGlvbi4NCj4+PiAtIE9ubHkg
c2VsZWN0IERSTV9ESVNQTEFZX0RQX0hFTFBFUiBhbmQgbm90IERSTV9ESVNQTEFZX0hFTFBF
Ui4NCj4+Pg0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L0tjb25maWcgfCAyICsr
DQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPj4+DQo+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L0tjb25maWcgYi9kcml2ZXJzL2dw
dS9kcm0vZGlzcGxheS9LY29uZmlnDQo+Pj4gaW5kZXggZjg0ZjFiMGNkMjNmLi45ZmU4MGM0
ZTU1NWMgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvS2NvbmZp
Zw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L0tjb25maWcNCj4+PiBAQCAt
MzIsNiArMzIsNyBAQCBjb25maWcgRFJNX0RJU1BMQVlfSERNSV9IRUxQRVINCj4+PiAgICBj
b25maWcgRFJNX0RQX0FVWF9DSEFSREVWDQo+Pj4gICAgCWJvb2wgIkRSTSBEUCBBVVggSW50
ZXJmYWNlIg0KPj4+ICAgIAlkZXBlbmRzIG9uIERSTQ0KPj4+ICsJc2VsZWN0IERSTV9ESVNQ
TEFZX0RQX0hFTFBFUg0KPj4NCj4+IFlvdSBjYW5ub3Qgc2VsZWN0IERJU1BMQVlfRFBfSEVM
UEVSIHdpdGhvdXQgRElTUExBWV9IRUxQRVIuDQo+Pg0KPiANCj4gVGhhdCB3YXMgbXkgb3Jp
Z2luYWwgdGhvdWdodCBhcyB3ZWxsIGFuZCB3aGF0IGRpZCBpbiB2MSwgYnV0IHRoZW4gSSBu
b3RpY2VkDQo+IHRoYXQgZG9pbmcgdGhhdCBpdCB3b3VsZCBmb3JjZSBEUk1fRElTUExBWV9I
RUxQRVIgdG8gYmUgc2V0IGFzIGJ1aWx0LWluIGFuZA0KPiBub3QgYWxsb3cgdG8gYmUgYnVp
bHQgYXMgYSBtb2R1bGUuDQoNCkl0IHdhcyBhIHJoZXRvcmljYWwgb25seS4gSSBkaWRuJ3Qg
bWVhbiB0byBhY3R1YWxseSBzZXQgRElTUExBWV9IRUxQRVIuDQoNCj4gICANCj4+IENhbid0
IHlvdSBzaW1wbHkgbWFrZSBpdCBkZXBlbmQgb24gRElTUExBWV9EUF9IRUxQRVIuICBUaGUg
bWVudSBlbnRyeQ0KPj4gd2lsbCBzaG93IHVwIGFzIHNvb24gYXMgdGhlcmUncyBhIGRyaXZl
ciB0aGF0IHNlbGNldHMgRElTUExBWV9EUF9IRUxQRVIuDQo+Pg0KPiANCj4gSSBjb3VsZCBi
dXQgdGhlbiB0aGF0IG1lYW5zIHRoYXQgb25jZSB3b24ndCBiZSBhYmxlIHRvIHNlbGVjdCB0
aGVzZSB0d28gY29uZmlnDQo+IG9wdGlvbnMgdW5sZXNzIHNvbWUgZW5hYmxlIHN5bWJvbCBz
ZWxlY3RzIERSTV9ESVNQTEFZX0RQX0hFTFBFUi4NCj4gDQo+IEluIG15IG9waW5pb24sIERS
TV9EUF9BVVhfQ0hBUkRFViBhbmQgRFJNX0RQX0NFQyBhcmUgZGlmZmVyZW50IHRoYW4gYWxs
IG90aGVyDQo+IG9wdGlvbnMgdGhhdCBzZWxlY3QgRFJNX0RJU1BMQVlfRFBfSEVMUEVSLCBz
aW5jZSB0aG9zZSBhcmUgZHJpdmVycyBhbmQgd2FudCB0bw0KPiBoYXZlIGJvdGggRFJNX0RJ
U1BMQVlfRFBfSEVMUEVSIGFuZCBEUk1fRElTUExBWV9IRUxQRVIgc2V0Lg0KPiANCj4gQnV0
IERSTV9EUF9BVVhfQ0hBUkRFViBhbmQgRFJNX0RQX0NFQyBhcmUganVzdCBpbmNsdWRlZCBp
biBkcm1fZGlzcGxheV9oZWxwZXIubw0KPiBpZiBlbmFibGVkLCBhbmQgZGVwZW5kIG9uIHN5
bWJvbHMgdGhhdCBhcmUgcHJlc2VudCBpZiBDT05GSUdfRFJNX0RJU1BMQVlfRFBfSEVMUEVS
DQo+IGlzIGVuYWJsZWQuIFNvIGp1c3QgbmVlZCB0aGUgbGF0dGVyLCBpZiBEUk1fRElTUExB
WV9IRUxQRVIgaXMgbm90IGVuYWJsZWQgdGhlbiBpdA0KPiB3aWxsIGp1c3QgYmUgYSBuby1v
cC4NCj4gDQo+IEhhdmluZyB3cml0dGVuIHRoYXQgdGhvdWdoIEkgbm90aWNlZCB0aGF0IGEg
ImRlcGVuZHMgb24gRFJNX0RJU1BMQVlfSEVMUEVSIiBtYWtlcw0KPiBzZW5zZS4gSWYgeW91
IGFncmVlIEkgY2FuIGFkZCBpdCBhbmQgcG9zdCBhIHYzLg0KDQpZZXMgcGxlYXNlLiAgVGhl
c2Ugb3B0aW9ucyBlbmFibGUgZmVhdHVyZXMgb2YgdGhlIERQIGNvZGUuIElmIHRoZXJlJ3Mg
bm8gDQpkcml2ZXIgd2l0aCBEUCwgaXQgZG9lc24ndCBtYWtlIHNlbnNlIHRvIGFsbG93IHRo
ZW0uDQoNCkkga25vdyB0aGF0IHRoZXJlIGNvdWxkIGJlIGFuIG9kZCBzaXR1YXRpb24gd2hl
cmUgdXNlcnNwYWNlIG1pZ2h0IG5vdCANCmhhdmUgRFAsIGJ1dCBzdGlsbCB3YW50cyB0aGUg
Y2hhcmRldiBmaWxlIG9mIGF1eCBidXMuICBCdXQgdGhhdCANCnNpdHVhdGlvbiBleGlzdGVk
IGFscmVhZHkgd2hlbiB0aGUgY29kZSB3YXMgbG9jYXRlZCB3aXRoaW4gS01TIGhlbHBlcnMu
DQoNCj4gDQo+IE5vdywgcG9uZGVyaW5nIG1vcmUgYWJvdXQgdGhpcyBpc3N1ZSwgcHJvYmFi
bHkgdGhlIG1vc3QgY29ycmVjdCB0aGluZyB0byBkbyBpcyBmb3INCj4gdGhlIGRyaXZlcnMg
dGhhdCBtYWtlIHVzZSBvZiB0aGUgc3ltYm9scyBleHBvcnRlZCBieSBEUk1fRFBfe0FVWF9D
SEFSREVWLENFQ30gdG8NCj4gc2VsZWN0IHRoZXNlLiBXaGF0IGRvIHlvdSB0aGluayA/DQoN
ClRoYXQncyBub3QgY29uc2lkZXJlZCBnb29kIHN0eWxlLiBTZWxlY3Qgc2hvdWxkIG5vdCBi
ZSB1c2VkIGZvciBhbnl0aGluZyANCnRoYXQgaXMgdXNlci1jb25maWd1cmFibGUuIFsxXQ0K
DQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQpbMV0gDQpodHRwczovL2VsaXhpci5ib290bGlu
LmNvbS9saW51eC92NS4xNy40L3NvdXJjZS9Eb2N1bWVudGF0aW9uL2tidWlsZC9rY29uZmln
LWxhbmd1YWdlLnJzdCNMMTQ4DQoNCj4gICAtLQ0KPiBCZXN0IHJlZ2FyZHMsDQo+IA0KPiBK
YXZpZXIgTWFydGluZXogQ2FuaWxsYXMNCj4gTGludXggRW5naW5lZXJpbmcNCj4gUmVkIEhh
dA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVs
b3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3Ry
LiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVy
ZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------WamMDks024C9JFKX6lPPy04O--

--------------IrW65zLf6tfVwvHM751lr396
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJqRiAFAwAAAAAACgkQlh/E3EQov+BY
IRAAg16uXpYvIwjzS87eukz0wnys7/SLBT9wdZqsD0Jh+egr6DCBmnn2y4Q4x9Pr2gHDtwApVyUF
Qa9/DvwCF1xNN6fuXUpkcMo3I58ysMxfXlLVkTJU2AVl4ZCfH62q6lrc3nBdOhLq8d1qUR3IJaMT
Td6q7psdgQ0BY/eF9pBm8BJml5fhBFp5/5Of80BOLr03Ks38i8RBpqBw+rnqWUP3jIW8fFvm7iHM
0lJtOYkrPtsGemAtejHDlQ4PknEuUcuMG65HIWGNeSGclx1UChISWGiWYdDVN4JpO5nzE7IYqjeV
y5HqvjdVV034X7rNAlZy56s0nJZ6c/s27DnWw6mzFVl5QYxOl4/8KT19FaA/hrqLyVa6s1NVF8d3
Gp2IcWrpNTT0OL4Sh7OEDOZ25abnmj3lLNNL7I8pII5MhCMX4P1anjucVCoinf9YXh2pLJo1cQDA
jnlp0Nskc4RD2ke1P+ZMeyH53BebRZGINces5cBPd1b7bafbwG7LFsIfH7Y+UzBEXbgw+vxv3AM8
88ZERZw3+VLOdHUft+Ed7TsAg7p3WoadYUivuBfSu/iD/UNy4+QcOcABIaoHQnmBJ5pn5EvRyW4j
pk+htskPIDj8urTQ79D0EXX5eTBsIM+dJwI69jlU1AgjRF8Gj8qJ1VhDVh6LAHNcO9Dd5xX77Qkx
2o0=
=6F7s
-----END PGP SIGNATURE-----

--------------IrW65zLf6tfVwvHM751lr396--

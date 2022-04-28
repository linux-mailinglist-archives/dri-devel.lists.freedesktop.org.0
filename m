Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 545F6512DB0
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 10:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F0E10E5AD;
	Thu, 28 Apr 2022 08:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D872B10E543
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 08:04:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8A2E51F37F;
 Thu, 28 Apr 2022 08:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651133072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JfBuW9n6hV69VlwYjASC6G/wOiJtCD9V09eMKqA9IP8=;
 b=DSg7Kr/baV9bwV1H/DOVD3qRcGT59ABuFCI2CTIA4O7ArEyrPuP9KblyJTGDnwF5GpdGl+
 HMdQjFVxgBG871Ijyvm4lw2EyELwpVsLKxe+ZzmX5uq5BJqRE0sNmr2Xh8rCenFj2iAc+Y
 nmaODGCfbzTMOqoyVxrts58vxYM7Pg8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651133072;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JfBuW9n6hV69VlwYjASC6G/wOiJtCD9V09eMKqA9IP8=;
 b=MbIHlgnBpotMsYrq3vIeKG9K6zVncP89Til/fUn458TYPMrrOuorvA1TCXd8rbUMV5QRH0
 HRn4tai0XbpRy7AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6B97C13AF8;
 Thu, 28 Apr 2022 08:04:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CwXlGJBKamIWIgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 28 Apr 2022 08:04:32 +0000
Message-ID: <cdad47d0-939d-9eda-feae-78cf204a0ae6@suse.de>
Date: Thu, 28 Apr 2022 10:04:32 +0200
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
 <af31d343-202b-ffaa-c6a9-b20247938dfd@suse.de>
 <1d456654-6d06-ef35-b9a0-519db7d5b35e@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <1d456654-6d06-ef35-b9a0-519db7d5b35e@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HymPwEzotzyHwGNRJcHQ2PsB"
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
--------------HymPwEzotzyHwGNRJcHQ2PsB
Content-Type: multipart/mixed; boundary="------------J0GKenp6ktGu46s0O538IgOt";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Message-ID: <cdad47d0-939d-9eda-feae-78cf204a0ae6@suse.de>
Subject: Re: [PATCH v2] drm/display: Select DP helper for DRM_DP_AUX_CHARDEV
 and DRM_DP_CEC
References: <20220427215528.237861-1-javierm@redhat.com>
 <46446e78-60a6-1b8c-1bb6-1c005489d58c@suse.de>
 <6f3b8d37-0a70-a035-e87b-5aa72926fff9@redhat.com>
 <af31d343-202b-ffaa-c6a9-b20247938dfd@suse.de>
 <1d456654-6d06-ef35-b9a0-519db7d5b35e@redhat.com>
In-Reply-To: <1d456654-6d06-ef35-b9a0-519db7d5b35e@redhat.com>

--------------J0GKenp6ktGu46s0O538IgOt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjguMDQuMjIgdW0gMDk6NTIgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDQvMjgvMjIgMDk6NDUsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0K
PiANCj4gW3NuaXBdDQo+IA0KPj4+PiBZb3UgY2Fubm90IHNlbGVjdCBESVNQTEFZX0RQX0hF
TFBFUiB3aXRob3V0IERJU1BMQVlfSEVMUEVSLg0KPj4+Pg0KPj4+DQo+Pj4gVGhhdCB3YXMg
bXkgb3JpZ2luYWwgdGhvdWdodCBhcyB3ZWxsIGFuZCB3aGF0IGRpZCBpbiB2MSwgYnV0IHRo
ZW4gSSBub3RpY2VkDQo+Pj4gdGhhdCBkb2luZyB0aGF0IGl0IHdvdWxkIGZvcmNlIERSTV9E
SVNQTEFZX0hFTFBFUiB0byBiZSBzZXQgYXMgYnVpbHQtaW4gYW5kDQo+Pj4gbm90IGFsbG93
IHRvIGJlIGJ1aWx0IGFzIGEgbW9kdWxlLg0KPj4NCj4+IEl0IHdhcyBhIHJoZXRvcmljYWwg
b25seS4gSSBkaWRuJ3QgbWVhbiB0byBhY3R1YWxseSBzZXQgRElTUExBWV9IRUxQRVIuDQo+
Pg0KPiANCj4gQWgsIHNvcnJ5IGZvciBtaXN1bmRlcnN0YW5kaW5nLg0KPiANCj4+PiAgICAN
Cj4+Pj4gQ2FuJ3QgeW91IHNpbXBseSBtYWtlIGl0IGRlcGVuZCBvbiBESVNQTEFZX0RQX0hF
TFBFUi4gIFRoZSBtZW51IGVudHJ5DQo+Pj4+IHdpbGwgc2hvdyB1cCBhcyBzb29uIGFzIHRo
ZXJlJ3MgYSBkcml2ZXIgdGhhdCBzZWxjZXRzIERJU1BMQVlfRFBfSEVMUEVSLg0KPj4+Pg0K
Pj4+DQo+Pj4gSSBjb3VsZCBidXQgdGhlbiB0aGF0IG1lYW5zIHRoYXQgb25jZSB3b24ndCBi
ZSBhYmxlIHRvIHNlbGVjdCB0aGVzZSB0d28gY29uZmlnDQo+Pj4gb3B0aW9ucyB1bmxlc3Mg
c29tZSBlbmFibGUgc3ltYm9sIHNlbGVjdHMgRFJNX0RJU1BMQVlfRFBfSEVMUEVSLg0KPj4+
DQo+Pj4gSW4gbXkgb3BpbmlvbiwgRFJNX0RQX0FVWF9DSEFSREVWIGFuZCBEUk1fRFBfQ0VD
IGFyZSBkaWZmZXJlbnQgdGhhbiBhbGwgb3RoZXINCj4+PiBvcHRpb25zIHRoYXQgc2VsZWN0
IERSTV9ESVNQTEFZX0RQX0hFTFBFUiwgc2luY2UgdGhvc2UgYXJlIGRyaXZlcnMgYW5kIHdh
bnQgdG8NCj4+PiBoYXZlIGJvdGggRFJNX0RJU1BMQVlfRFBfSEVMUEVSIGFuZCBEUk1fRElT
UExBWV9IRUxQRVIgc2V0Lg0KPj4+DQo+Pj4gQnV0IERSTV9EUF9BVVhfQ0hBUkRFViBhbmQg
RFJNX0RQX0NFQyBhcmUganVzdCBpbmNsdWRlZCBpbiBkcm1fZGlzcGxheV9oZWxwZXIubw0K
Pj4+IGlmIGVuYWJsZWQsIGFuZCBkZXBlbmQgb24gc3ltYm9scyB0aGF0IGFyZSBwcmVzZW50
IGlmIENPTkZJR19EUk1fRElTUExBWV9EUF9IRUxQRVINCj4+PiBpcyBlbmFibGVkLiBTbyBq
dXN0IG5lZWQgdGhlIGxhdHRlciwgaWYgRFJNX0RJU1BMQVlfSEVMUEVSIGlzIG5vdCBlbmFi
bGVkIHRoZW4gaXQNCj4+PiB3aWxsIGp1c3QgYmUgYSBuby1vcC4NCj4+Pg0KPj4+IEhhdmlu
ZyB3cml0dGVuIHRoYXQgdGhvdWdoIEkgbm90aWNlZCB0aGF0IGEgImRlcGVuZHMgb24gRFJN
X0RJU1BMQVlfSEVMUEVSIiBtYWtlcw0KPj4+IHNlbnNlLiBJZiB5b3UgYWdyZWUgSSBjYW4g
YWRkIGl0IGFuZCBwb3N0IGEgdjMuDQo+Pg0KPj4gWWVzIHBsZWFzZS4gIFRoZXNlIG9wdGlv
bnMgZW5hYmxlIGZlYXR1cmVzIG9mIHRoZSBEUCBjb2RlLiBJZiB0aGVyZSdzIG5vDQo+PiBk
cml2ZXIgd2l0aCBEUCwgaXQgZG9lc24ndCBtYWtlIHNlbnNlIHRvIGFsbG93IHRoZW0uDQo+
Pg0KPj4gSSBrbm93IHRoYXQgdGhlcmUgY291bGQgYmUgYW4gb2RkIHNpdHVhdGlvbiB3aGVy
ZSB1c2Vyc3BhY2UgbWlnaHQgbm90DQo+PiBoYXZlIERQLCBidXQgc3RpbGwgd2FudHMgdGhl
IGNoYXJkZXYgZmlsZSBvZiBhdXggYnVzLiAgQnV0IHRoYXQNCj4+IHNpdHVhdGlvbiBleGlz
dGVkIGFscmVhZHkgd2hlbiB0aGUgY29kZSB3YXMgbG9jYXRlZCB3aXRoaW4gS01TIGhlbHBl
cnMuDQo+Pg0KPiANCj4gQWdyZWVkLg0KPiANCj4+Pg0KPj4+IE5vdywgcG9uZGVyaW5nIG1v
cmUgYWJvdXQgdGhpcyBpc3N1ZSwgcHJvYmFibHkgdGhlIG1vc3QgY29ycmVjdCB0aGluZyB0
byBkbyBpcyBmb3INCj4+PiB0aGUgZHJpdmVycyB0aGF0IG1ha2UgdXNlIG9mIHRoZSBzeW1i
b2xzIGV4cG9ydGVkIGJ5IERSTV9EUF97QVVYX0NIQVJERVYsQ0VDfSB0bw0KPj4+IHNlbGVj
dCB0aGVzZS4gV2hhdCBkbyB5b3UgdGhpbmsgPw0KPj4NCj4+IFRoYXQncyBub3QgY29uc2lk
ZXJlZCBnb29kIHN0eWxlLiBTZWxlY3Qgc2hvdWxkIG5vdCBiZSB1c2VkIGZvciBhbnl0aGlu
Zw0KPj4gdGhhdCBpcyB1c2VyLWNvbmZpZ3VyYWJsZS4gWzFdDQo+Pg0KPiANCj4gUmlnaHQu
IFNvIGdpdmluZyBldmVuIG1vcmUgdGhvdWdodCB0byB0aGlzLCBub3cgSSB0aGluayB0aGF0
IHdlIHNob3VsZCBqdXN0IGluY2x1ZGUNCj4gZHJtX2RwX2F1eF9kZXYubywgZHJtX2RwX2Nl
Yy5vIChhbmQgcHJvYmFibHkgZHJtX2RwX2F1eF9idXMubz8pIHVuY29uZGl0aW9uYWxseSB0
bw0KPiBkcm1fZGlzcGxheV9oZWxwZXItJChDT05GSUdfRFJNX0RJU1BMQVlfRFBfSEVMUEVS
KS4NCj4gDQo+IEFmdGVyIGFsbCwgdGhlc2UgYXJlIG5vdCBiaWcgb2JqZWN0cyBhbmQgZHJt
X2Rpc3BsYXlfaGVscGVyIGNhbiBub3cgYmUgYnVpbHQgYXMgbW9kdWxlLg0KPiANCj4gSSBk
b24ndCBzZWUgdGhhdCBtdWNoIHZhbHVlIHRvIGhhdmUgc2VwYXJhdGUgdXNlci1jb25maWd1
cmFibGUgY29uZmlnIG9wdGlvbnMuLi4NCj4gDQoNCkkgZG9uJ3Qga25vdyB0aGUgc2lkZSBl
ZmZlY3RzIG9mIHRoaXMuIFdlJ3JlIGV4cG9ydGluZyBhbm90aGVyIGRldmljZSANCmZpbGUg
YWZ0ZXIgYWxsLg0KDQpGb3Iga25vdyBJJ2QgbWFrZSB0aGVtIGRlcGVuZCBvbiBEUk1fRElT
UExBWV9EUF9IRUxQRVIuIElmIHNvbWVvbmUgDQpjb21wbGFpbnMgd2UgY2FuIHJldmVydCBh
bmQgZml4IHRoZSBsaW5rZXIgZXJyb3IgYnkgYWRkaW5nIHN0dWIgDQpmdW5jdGlvbnMgZm9y
IHRoZSBtaXNzaW5nIHN5bWJvbHMuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8
cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRz
ZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------J0GKenp6ktGu46s0O538IgOt--

--------------HymPwEzotzyHwGNRJcHQ2PsB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJqSpAFAwAAAAAACgkQlh/E3EQov+AM
fQ//dQxA3p1pbhTPktg5ppYbQ50lBuu0P6E9WcoiP+D0VqAS8EAb6Jd86dcg4lv6UVcCJ2upA/Jb
e3K5p2EgEM0MvX9x3L7d1/B4swxhlvuP5OarjUQBBl4Tq7by++jd254kl2rgBrTjY7qVut224rsV
kFjHkal7vLYU6a7916fD2ORioyD+V3XSiOyf5du7JWJnlvDxzROpN1NqYzQDL6ZC3Csk+WYQubdU
BRhSqvv7CAdyr6avFhdy5/tQxs/gPuipD0QstFnlwEJ7WH/x5zZQ2cj4WSy3gWG+yZYr7VYBuBMB
XGF/e5JqYPlOAMgm4ktDhJiS8URvuy1mhQg4NXYaRGv28q6OURTtZqRcn/Eo0aGXA86tCxGi1p9R
ImKbwyzrSghYrbLE/XyCBVnetO0Fzev+Jou97/eDC0EMwWDHHCVR9JPlLQ2eW1XM/iwX6zwX6fiF
1wUieu5PWgcWptLBW75LMb5wUNehGSntQFiRHyQAxwroqPg2MqBCECTeb/DWGLdW17VRDI6k8d5B
9yle1Nigh/YABErAglTMbzAPoqygMX877Hxx3o2gBpdzq3vZqiOpXmuKP9lS7nqBWldKdQNlpfRE
GqPyXs3DWehbLC1QU80B3qnQyw1qyGneuS/xkkERmTec4TdFoGM21kEgKhurgE6nho3RYaTpLde+
8H0=
=gX4t
-----END PGP SIGNATURE-----

--------------HymPwEzotzyHwGNRJcHQ2PsB--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F35558212C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 09:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125108FF0D;
	Wed, 27 Jul 2022 07:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CBC11B786
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 07:36:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 894F533CFE;
 Wed, 27 Jul 2022 07:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658907368; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3oswvSkWBFVjCa9IzyjEBc1aXqvjMN4pOryAwvI7BZQ=;
 b=GX3fek/lHBy15d2KjPjn47SyHt57v5OuKrP6XfEDzdGcIdaCYSYH1VNQrTf7mVuXRe3sAv
 OeF9uXyn3mUX8Hk6AIELLVJrhUfT8wrf87U+7vvGNS6ZEKZJI/vdRwmG6aZlw3/ogqWpRb
 Bm8UG5NGnirITbBw2/mjtZ9V3Tblcro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658907368;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3oswvSkWBFVjCa9IzyjEBc1aXqvjMN4pOryAwvI7BZQ=;
 b=WRFHuLrtBeLoy/VzqrozeA5JAmknJ7w1WEoVVHvhUlxcRpYEzSzCIymPgoxt4Ou02gGrPp
 C5hn+MDYTKUfdhAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5B66E13AD7;
 Wed, 27 Jul 2022 07:36:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id p18BFejq4GL9FQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Jul 2022 07:36:08 +0000
Message-ID: <31357fb3-e3aa-4b07-e3c4-d9ec39644516@suse.de>
Date: Wed, 27 Jul 2022 09:36:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm.h
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>
References: <20220725235359.20516-1-kevinbrace@gmx.com>
 <20220725235359.20516-7-kevinbrace@gmx.com> <YuAnXcz0ImO+cAHu@ravnborg.org>
 <6e3473a8-f668-efdc-92b4-0a085e6531d7@suse.de>
 <CAPM=9tx9JFVFdBpEkxVF5AjtpBuVcyWY-xA=-u=ZZMemz4jafA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAPM=9tx9JFVFdBpEkxVF5AjtpBuVcyWY-xA=-u=ZZMemz4jafA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CaAZwaFi35q0Bx3TZeQUbre6"
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Kevin Brace <kevinbrace@gmx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CaAZwaFi35q0Bx3TZeQUbre6
Content-Type: multipart/mixed; boundary="------------rPKfOGOh3Ac04PqmAG8L0q1g";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Kevin Brace <kevinbrace@gmx.com>
Message-ID: <31357fb3-e3aa-4b07-e3c4-d9ec39644516@suse.de>
Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm.h
References: <20220725235359.20516-1-kevinbrace@gmx.com>
 <20220725235359.20516-7-kevinbrace@gmx.com> <YuAnXcz0ImO+cAHu@ravnborg.org>
 <6e3473a8-f668-efdc-92b4-0a085e6531d7@suse.de>
 <CAPM=9tx9JFVFdBpEkxVF5AjtpBuVcyWY-xA=-u=ZZMemz4jafA@mail.gmail.com>
In-Reply-To: <CAPM=9tx9JFVFdBpEkxVF5AjtpBuVcyWY-xA=-u=ZZMemz4jafA@mail.gmail.com>

--------------rPKfOGOh3Ac04PqmAG8L0q1g
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDcuMjIgdW0gMjI6MjAgc2NocmllYiBEYXZlIEFpcmxpZToNCj4gT24g
V2VkLCAyNyBKdWwgMjAyMiBhdCAwNDoxOCwgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4NCj4+IEhpDQo+Pg0KPj4gQW0gMjYuMDcuMjIgdW0g
MTk6NDEgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+Pj4gSGkgS2V2aW4uDQo+Pj4NCj4+PiBP
biBNb24sIEp1bCAyNSwgMjAyMiBhdCAwNDo1Mzo1M1BNIC0wNzAwLCBLZXZpbiBCcmFjZSB3
cm90ZToNCj4+Pj4gRnJvbTogS2V2aW4gQnJhY2UgPGtldmluYnJhY2VAYnJhY2Vjb21wdXRl
cmxhYi5jb20+DQo+Pj4+DQo+Pj4+IENoYW5nZWQgdGhlIHVBUEkuDQo+Pj4+DQo+Pj4+IFNp
Z25lZC1vZmYtYnk6IEtldmluIEJyYWNlIDxrZXZpbmJyYWNlQGJyYWNlY29tcHV0ZXJsYWIu
Y29tPg0KPj4+DQo+Pj4gSXQgd291bGQgYmUgZ3JlYXQgdG8gaGF2ZSB0aGUgbmV3IGV4dGVu
c2lvbnMgdG8gdGhlIFVBUEkgZG9jdW1lbnRlZA0KPj4+IHVzaW5nIGtlcm5lbC1kb2MuDQo+
Pj4gQXMgYW4gZXhhbXBsZSBzZWU6IHZjNF9kcm0uaA0KPj4+DQo+Pj4gVGhlcmUgYXJlIGEg
bG90IG9mIFVBUEkgdGhhdCBpcyBtaXNzaW5nIGRvY3VtZW50YXRpb24sIGJ1dCBpZiB3ZSBk
byBub3QNCj4+PiBhZGQgaXQgZm9yIG5ldyBVQVBJIHRoZW4gdGhpcyBzaXR1YXRpb24gbmV2
ZXIgaW1wcm92ZXMuDQo+Pj4NCj4+PiBQbGVhc2UgdXNlIF9fdTMyLCBfX3U2NCBsaWtlIHlv
dSBzZWUgaW4gb3RoZXIgZHJtIFVBUEkgZmlsZXMuDQo+Pj4NCj4+PiBQUy4gSWYgeW91IHJl
cGx5IHRvIHRoaXMgbWFpbCwgdGhlbiBwbGVhc2Uga2VlcCB0aGUgZnVsbCBtYWlsIGFzDQo+
Pj4gdXN1YWxseSBteSBtYWlscyB0byBLZXZpbiBib3VuY2VzIChzb21ldGhpbmcgd2l0aCBT
VEFSVFRMUykuDQo+Pj4NCj4+PiAgICAgICAgU2FtDQo+Pj4NCj4+Pj4gLS0tDQo+Pj4+ICAg
IGluY2x1ZGUvdWFwaS9kcm0vdmlhX2RybS5oIHwgMzUgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0tLS0NCj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3Vh
cGkvZHJtL3ZpYV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0vdmlhX2RybS5oDQo+Pj4+IGlu
ZGV4IGExZTEyNWQ0MjIwOC4uZTlkYTQ1Y2UxMzBhIDEwMDY0NA0KPj4+PiAtLS0gYS9pbmNs
dWRlL3VhcGkvZHJtL3ZpYV9kcm0uaA0KPj4+PiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL3Zp
YV9kcm0uaA0KPj4+PiBAQCAtMSw0ICsxLDUgQEANCj4+Pj4gICAgLyoNCj4+Pj4gKyAqIENv
cHlyaWdodCDCqSAyMDIwIEtldmluIEJyYWNlDQo+Pj4+ICAgICAqIENvcHlyaWdodCAxOTk4
LTIwMDMgVklBIFRlY2hub2xvZ2llcywgSW5jLiBBbGwgUmlnaHRzIFJlc2VydmVkLg0KPj4+
PiAgICAgKiBDb3B5cmlnaHQgMjAwMS0yMDAzIFMzIEdyYXBoaWNzLCBJbmMuIEFsbCBSaWdo
dHMgUmVzZXJ2ZWQuDQo+Pj4+ICAgICAqDQo+Pj4+IEBAIC0xNiwxMCArMTcsMTAgQEANCj4+
Pj4gICAgICogVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FS
UkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1INCj4+Pj4gICAgICogSU1QTElFRCwgSU5D
TFVESU5HIEJVVCBOT1QgTElNSVRFRCBUTyBUSEUgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFC
SUxJVFksDQo+Pj4+ICAgICAqIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFO
RCBOT04tSU5GUklOR0VNRU5ULiBJTiBOTyBFVkVOVCBTSEFMTA0KPj4+PiAtICogVklBLCBT
MyBHUkFQSElDUywgQU5EL09SIElUUyBTVVBQTElFUlMgQkUgTElBQkxFIEZPUiBBTlkgQ0xB
SU0sIERBTUFHRVMgT1INCj4+Pj4gLSAqIE9USEVSIExJQUJJTElUWSwgV0hFVEhFUiBJTiBB
TiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLA0KPj4+PiAtICogQVJJ
U0lORyBGUk9NLCBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBP
UiBUSEUgVVNFIE9SIE9USEVSDQo+Pj4+IC0gKiBERUFMSU5HUyBJTiBUSEUgU09GVFdBUkUu
DQo+Pj4+ICsgKiBUSEUgQVVUSE9SUywgQ09QWVJJR0hUIEhPTERFUlMsIEFORC9PUiBJVFMg
U1VQUExJRVJTIEJFIExJQUJMRSBGT1IgQU5ZDQo+Pj4+ICsgKiBDTEFJTSwgREFNQUdFUyBP
UiBPVEhFUiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBU
T1JUDQo+Pj4+ICsgKiBPUiBPVEhFUldJU0UsIEFSSVNJTkcgRlJPTSwgT1VUIE9GIE9SIElO
IENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1INCj4+Pj4gKyAqIFRIRSBVU0UgT1Ig
T1RIRVIgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLg0KPj4+PiAgICAgKi8NCj4+PiBEbyBu
b3QgbWl4IGxpY2Vuc2UgY2hhbmdlcyB3aXRoIG90aGVyIGNoYW5nZXMgLSBhbmQgdXNlIFNQ
RFggdGFnIGlmDQo+Pj4gcG9zc2libGUgZm9yIHRoZSB1cGRhdGVkIGxpY2Vuc2UuDQo+Pj4g
U2VlIG90aGVyIGRybSBVQVBJIGZpbGVzIGZvciBleGFtcGxlcy4NCj4+Pg0KPj4+DQo+Pj4+
ICAgICNpZm5kZWYgX1ZJQV9EUk1fSF8NCj4+Pj4gICAgI2RlZmluZSBfVklBX0RSTV9IXw0K
Pj4+PiBAQCAtODEsNiArODIsMTEgQEAgZXh0ZXJuICJDIiB7DQo+Pj4+ICAgICNkZWZpbmUg
RFJNX1ZJQV9ETUFfQkxJVCAgICAgICAgMHgwZQ0KPj4+PiAgICAjZGVmaW5lIERSTV9WSUFf
QkxJVF9TWU5DICAgICAgIDB4MGYNCj4+Pj4NCj4+Pj4gKyNkZWZpbmUgICAgIERSTV9WSUFf
R0VNX0NSRUFURSAgICAgIDB4MTANCj4+Pj4gKyNkZWZpbmUgICAgIERSTV9WSUFfR0VNX01B
UCAgICAgICAgIDB4MTENCj4+Pj4gKyNkZWZpbmUgICAgIERSTV9WSUFfR0VNX1VOTUFQICAg
ICAgIDB4MTINCj4+Pj4gKw0KPj4+IFVzZSB0aGUgc2FtZSBhbGlnbm1lbnQgYXMgdGhlIHBy
ZXZpb3VzIGxpbmVzLg0KPj4+PiArDQo+Pj4gRHJvcCBleHRyYSBlbXB0eSBsaW5lLg0KPj4+
DQo+Pj4+ICAgICNkZWZpbmUgRFJNX0lPQ1RMX1ZJQV9BTExPQ01FTSAgICAgICBEUk1fSU9X
UihEUk1fQ09NTUFORF9CQVNFICsgRFJNX1ZJQV9BTExPQ01FTSwgZHJtX3ZpYV9tZW1fdCkN
Cj4+Pj4gICAgI2RlZmluZSBEUk1fSU9DVExfVklBX0ZSRUVNRU0gICAgICAgIERSTV9JT1co
IERSTV9DT01NQU5EX0JBU0UgKyBEUk1fVklBX0ZSRUVNRU0sIGRybV92aWFfbWVtX3QpDQo+
Pj4+ICAgICNkZWZpbmUgRFJNX0lPQ1RMX1ZJQV9BR1BfSU5JVCAgICAgICBEUk1fSU9XUihE
Uk1fQ09NTUFORF9CQVNFICsgRFJNX1ZJQV9BR1BfSU5JVCwgZHJtX3ZpYV9hZ3BfdCkNCj4+
Pj4gQEAgLTk3LDYgKzEwMywxMCBAQCBleHRlcm4gIkMiIHsNCj4+Pj4gICAgI2RlZmluZSBE
Uk1fSU9DVExfVklBX0RNQV9CTElUICAgIERSTV9JT1coRFJNX0NPTU1BTkRfQkFTRSArIERS
TV9WSUFfRE1BX0JMSVQsIGRybV92aWFfZG1hYmxpdF90KQ0KPj4+PiAgICAjZGVmaW5lIERS
TV9JT0NUTF9WSUFfQkxJVF9TWU5DICAgRFJNX0lPVyhEUk1fQ09NTUFORF9CQVNFICsgRFJN
X1ZJQV9CTElUX1NZTkMsIGRybV92aWFfYmxpdHN5bmNfdCkNCj4+Pj4NCj4+Pj4gKyNkZWZp
bmUgICAgIERSTV9JT0NUTF9WSUFfR0VNX0NSRUFURSAgICAgICAgRFJNX0lPV1IoRFJNX0NP
TU1BTkRfQkFTRSArIERSTV9WSUFfR0VNX0NSRUFURSwgc3RydWN0IGRybV92aWFfZ2VtX2Ny
ZWF0ZSkNCj4+Pj4gKyNkZWZpbmUgICAgIERSTV9JT0NUTF9WSUFfR0VNX01BUCAgICAgICAg
ICAgRFJNX0lPV1IoRFJNX0NPTU1BTkRfQkFTRSArIERSTV9WSUFfR0VNX01BUCwgc3RydWN0
IGRybV92aWFfZ2VtX21hcCkNCj4+Pj4gKyNkZWZpbmUgICAgIERSTV9JT0NUTF9WSUFfR0VN
X1VOTUFQICAgICAgICAgRFJNX0lPUihEUk1fQ09NTUFORF9CQVNFICsgRFJNX1ZJQV9HRU1f
VU5NQVAsIHN0cnVjdCBkcm1fdmlhX2dlbV91bm1hcCkNCj4+Pj4gKw0KPj4+IFVzZSBzYW1l
IGFsaWdubWVudCBhcyBwcmV2aW91cyBsaW5lcy4NCj4+Pg0KPj4+PiAgICAvKiBJbmRpY2Vz
IGludG8gYnVmLlNldHVwIHdoZXJlIHZhcmlvdXMgYml0cyBvZiBzdGF0ZSBhcmUgbWlycm9y
ZWQgcGVyDQo+Pj4+ICAgICAqIGNvbnRleHQgYW5kIHBlciBidWZmZXIuICBUaGVzZSBjYW4g
YmUgZmlyZWQgYXQgdGhlIGNhcmQgYXMgYSB1bml0LA0KPj4+PiAgICAgKiBvciBpbiBhIHBp
ZWNld2lzZSBmYXNoaW9uIGFzIHJlcXVpcmVkLg0KPj4+PiBAQCAtMjc1LDYgKzI4NSwyMyBA
QCB0eXBlZGVmIHN0cnVjdCBkcm1fdmlhX2RtYWJsaXQgew0KPj4+PiAgICAgICBkcm1fdmlh
X2JsaXRzeW5jX3Qgc3luYzsNCj4+Pj4gICAgfSBkcm1fdmlhX2RtYWJsaXRfdDsNCj4+Pj4N
Cj4+Pj4gK3N0cnVjdCBkcm1fdmlhX2dlbV9jcmVhdGUgew0KPj4+PiArICAgIHVpbnQ2NF90
IHNpemU7DQo+Pj4+ICsgICAgdWludDMyX3QgYWxpZ25tZW50Ow0KPj4+PiArICAgIHVpbnQz
Ml90IGRvbWFpbjsNCj4+Pj4gKyAgICB1aW50MzJfdCBoYW5kbGU7DQo+Pj4+ICsgICAgdWlu
dDY0X3Qgb2Zmc2V0Ow0KPj4+PiArfTsNCj4+PiBJIGRvIG5vdCBrbm93IGlmIHRoaXMgaXMg
cmVsZXZhbnQsIGJ1dCBhZGRpbmcgYSA2NCBiaXQgcGFyYW1ldGVyDQo+Pj4gKG9mZnNldCkg
dGhhdCBpcyBvbmx5IDMyIGJpdCBhbGlnbmVkIGxvb2tzIGxpa2UgdHJvdWJsZSB0byBtZS4N
Cj4+PiBJIGhvcGUgb3RoZXJzIHRoYXQga25vd3MgdGhpcyBiZXR0ZXIgY2FuIGNvbW1lbnQg
aGVyZS4NCj4+DQo+PiBUaGUgY29tcGlsZXIgd2lsbCBsZWF2ZSBhIDQtYnl0ZSBnYXAgYmV0
d2VlbiBoYW5kbGUgYW5kIG9mZnNldC4NCj4+IFN0cnVjdHVyZSBhbGxvY2F0aW9uIGd1YXJh
bnRlZXMgYSBtaW5pbWFsIGFsaWdubWVudCBvZiA4IGJ5dGVzLCBzbyB0aGUNCj4+IGZpZWxk
IGFsaWdubWVudCB3aWxsIGJlIGNvcnJlY3QuIEl0J3MgYWxsIGRlcGVuZGVuZCBvbiBhcmNo
aXRlY3R1cmUsDQo+PiBwbGF0b2ZybSwgY2FsbGluZyBjb252ZW50aW9uLCBidXQgdGhhdCdz
IHRoZSBydWxlIG9mIHRodW1iLg0KPj4NCj4+IEhhdmUgYSBsb29rIGF0IHRoZSB0b29sICdw
YWhvbGUnIHRvIGluc3BlY3QgZGF0YS1zdHJ1Y3R1cmUgYWxpZ25tZW50IGluDQo+PiBvYmpl
Y3QgZmlsZXMuIFlvdSdsbCBmaW5kIHBsZW50eSBvZiBnYXBzIGluIGNvbXBpbGVkIHN0cnVj
dHVyZS4NCj4+DQo+PiBJdCdzIHN0aWxsIHF1ZXN0aW9uYWJsZSB0byBsZWF2ZSB0aGUgZ2Fw
IHRoZXJlLiBFaXRoZXIgZGVjbGFyZSBpdA0KPj4gZXhwbGljaXR5IChlLmcuLCBfX3UzMiBl
bXB0eTA7ICkgIG9yIGRlY2xhcmUgdGhlIHN0cnVjdHVyZSB3aXRoDQo+PiBfX2F0dHJpYnV0
ZV9fKChfX3BhY2tlZF9fKSkuICBQZXJzb25hbGx5LCBJJ2QgdXNlIHRoZSBmb3JtZXIuDQo+
IA0KPiBJdCdzIG5vdCBhbGxvd2VkIGF0IGFsbCB0byB1c2UgcGFja2VkIG9yIGxlYXZlIHRo
ZSBnYXAuDQo+IA0KPiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9w
cm9jZXNzL2JvdGNoaW5nLXVwLWlvY3Rscy5odG1sDQo+IA0KPiBUaGUgMm5kIHByZXJlcSBj
b3ZlcnMgdGhpcy4NCg0KSSB3YXNuJ3QgYXdhcmUgb2YgdGhpcyBwYWdlLiBUaGFua3MuDQoN
CkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IERhdmUuDQoNCi0tIA0KVGhvbWFzIFpp
bW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBH
ZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjog
SXZvIFRvdGV2DQo=

--------------rPKfOGOh3Ac04PqmAG8L0q1g--

--------------CaAZwaFi35q0Bx3TZeQUbre6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLg6ugFAwAAAAAACgkQlh/E3EQov+CR
sRAArbtuMSamihZZ5U5oKbqEZ2oxpy2syYMGKxKMT7wsCNXWbSgO3704YbwOZ/IUlNuyj5qsmiQT
nHb0MbNUGWZLzjMoMsrK1WaGWzjWqJq2pa5mKI+0dgw9fqtXEkhBn7QaFI/R31LbhkmOm3WzhUE1
+rU4bvigp0EPSxXwGF0ha/zRGMjcnb53GYWzqw52wXAM/H+jBGWL7xyviYjgDsPloxAYeIyZ6xbj
Gf4eqHp2vO1IgoQ6VAlCYTEu3WT77khRj9Uae9/1gZeRKfgCyVyWhYgPBk8v3IL6j1JPUgemP09u
TnRilFSYB7OsBWYt8YAKFXpzTty+qgOFjUM7cfsHtC/pMFQx2SWpVyZwu++aEGQkkoaJjQbepUIX
zxZnRxJVcHNQBJaKlwxVbSWbANyxDu09c7/zBNpMMwI7kvvaCwNr16xy7++YtNtYpyKM2AkLsOIe
C7g1wrN5FqAQYtEp2RWzexXyKYpdGndSVwmOQdhXyFu1amLhvEeLfFn2QN1MHotXTPlk7Z5rcXql
w4pV5sBVSnVdg2JHzwydwMvjgt1Oa2gtuL5xJztn4LT/372xG8K0LSlVN86NpyhwbpMDoxQNBW9D
ZFBnblk0LrMYMNHa0X2Cg64XxYeJujp7PkAk5VU8/mQP79DKqlwO852GMadLfV7wHrsbt7GBGfhT
Ykk=
=YnJu
-----END PGP SIGNATURE-----

--------------CaAZwaFi35q0Bx3TZeQUbre6--

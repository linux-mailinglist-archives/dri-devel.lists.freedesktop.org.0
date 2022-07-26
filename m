Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCDC581991
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 20:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F2C97F59;
	Tue, 26 Jul 2022 18:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A138397F9A
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 18:18:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4F54F37A35;
 Tue, 26 Jul 2022 18:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658859532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mQLONBuAApsSawkkXtE9QphUJ9RGlb2aQJYhQ+JAFJc=;
 b=SdlsSUfBftwZ4fbfNlt4rssf66yPCCAo8lt+TT0+ixhp++Bx3SECjIrX/xPOh4Wya47dlQ
 kBtNAPOnadtrTrLikaNupe02AMZ2Lj2CdQya4Nb3w/9J2nSyNg+oRew9nzkV0pmcgo4Y17
 ymJ/e4SL5ESeWnnuyQx0zrlAzx+BPQc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658859532;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mQLONBuAApsSawkkXtE9QphUJ9RGlb2aQJYhQ+JAFJc=;
 b=48ic/HVVo09baiLI9K+xuA2ihWVQ3KWfMYIWIEiszKmvTRM0itPOhOfHS3QkjxAp/Ceuhp
 aJWiomws1Z4J7WBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3184113A7C;
 Tue, 26 Jul 2022 18:18:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +sDZCQww4GLgFwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 26 Jul 2022 18:18:52 +0000
Message-ID: <6e3473a8-f668-efdc-92b4-0a085e6531d7@suse.de>
Date: Tue, 26 Jul 2022 20:18:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm.h
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>, Kevin Brace <kevinbrace@gmx.com>
References: <20220725235359.20516-1-kevinbrace@gmx.com>
 <20220725235359.20516-7-kevinbrace@gmx.com> <YuAnXcz0ImO+cAHu@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YuAnXcz0ImO+cAHu@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Od0s0XnOTY5qlTDSLjZnUbOi"
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Od0s0XnOTY5qlTDSLjZnUbOi
Content-Type: multipart/mixed; boundary="------------Bnym0SJVN0d0iQ6n4b1qmo68";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, Kevin Brace <kevinbrace@gmx.com>
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <6e3473a8-f668-efdc-92b4-0a085e6531d7@suse.de>
Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm.h
References: <20220725235359.20516-1-kevinbrace@gmx.com>
 <20220725235359.20516-7-kevinbrace@gmx.com> <YuAnXcz0ImO+cAHu@ravnborg.org>
In-Reply-To: <YuAnXcz0ImO+cAHu@ravnborg.org>

--------------Bnym0SJVN0d0iQ6n4b1qmo68
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDcuMjIgdW0gMTk6NDEgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+IEhp
IEtldmluLg0KPiANCj4gT24gTW9uLCBKdWwgMjUsIDIwMjIgYXQgMDQ6NTM6NTNQTSAtMDcw
MCwgS2V2aW4gQnJhY2Ugd3JvdGU6DQo+PiBGcm9tOiBLZXZpbiBCcmFjZSA8a2V2aW5icmFj
ZUBicmFjZWNvbXB1dGVybGFiLmNvbT4NCj4+DQo+PiBDaGFuZ2VkIHRoZSB1QVBJLg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IEtldmluIEJyYWNlIDxrZXZpbmJyYWNlQGJyYWNlY29tcHV0
ZXJsYWIuY29tPg0KPiANCj4gSXQgd291bGQgYmUgZ3JlYXQgdG8gaGF2ZSB0aGUgbmV3IGV4
dGVuc2lvbnMgdG8gdGhlIFVBUEkgZG9jdW1lbnRlZA0KPiB1c2luZyBrZXJuZWwtZG9jLg0K
PiBBcyBhbiBleGFtcGxlIHNlZTogdmM0X2RybS5oDQo+IA0KPiBUaGVyZSBhcmUgYSBsb3Qg
b2YgVUFQSSB0aGF0IGlzIG1pc3NpbmcgZG9jdW1lbnRhdGlvbiwgYnV0IGlmIHdlIGRvIG5v
dA0KPiBhZGQgaXQgZm9yIG5ldyBVQVBJIHRoZW4gdGhpcyBzaXR1YXRpb24gbmV2ZXIgaW1w
cm92ZXMuDQo+IA0KPiBQbGVhc2UgdXNlIF9fdTMyLCBfX3U2NCBsaWtlIHlvdSBzZWUgaW4g
b3RoZXIgZHJtIFVBUEkgZmlsZXMuDQo+IA0KPiBQUy4gSWYgeW91IHJlcGx5IHRvIHRoaXMg
bWFpbCwgdGhlbiBwbGVhc2Uga2VlcCB0aGUgZnVsbCBtYWlsIGFzDQo+IHVzdWFsbHkgbXkg
bWFpbHMgdG8gS2V2aW4gYm91bmNlcyAoc29tZXRoaW5nIHdpdGggU1RBUlRUTFMpLg0KPiAN
Cj4gCVNhbQ0KPiANCj4+IC0tLQ0KPj4gICBpbmNsdWRlL3VhcGkvZHJtL3ZpYV9kcm0uaCB8
IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tDQo+PiAgIDEgZmlsZSBj
aGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL3ZpYV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0v
dmlhX2RybS5oDQo+PiBpbmRleCBhMWUxMjVkNDIyMDguLmU5ZGE0NWNlMTMwYSAxMDA2NDQN
Cj4+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vdmlhX2RybS5oDQo+PiArKysgYi9pbmNsdWRl
L3VhcGkvZHJtL3ZpYV9kcm0uaA0KPj4gQEAgLTEsNCArMSw1IEBADQo+PiAgIC8qDQo+PiAr
ICogQ29weXJpZ2h0IMKpIDIwMjAgS2V2aW4gQnJhY2UNCj4+ICAgICogQ29weXJpZ2h0IDE5
OTgtMjAwMyBWSUEgVGVjaG5vbG9naWVzLCBJbmMuIEFsbCBSaWdodHMgUmVzZXJ2ZWQuDQo+
PiAgICAqIENvcHlyaWdodCAyMDAxLTIwMDMgUzMgR3JhcGhpY3MsIEluYy4gQWxsIFJpZ2h0
cyBSZXNlcnZlZC4NCj4+ICAgICoNCj4+IEBAIC0xNiwxMCArMTcsMTAgQEANCj4+ICAgICog
VEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0Yg
QU5ZIEtJTkQsIEVYUFJFU1MgT1INCj4+ICAgICogSU1QTElFRCwgSU5DTFVESU5HIEJVVCBO
T1QgTElNSVRFRCBUTyBUSEUgV0FSUkFOVElFUyBPRiBNRVJDSEFOVEFCSUxJVFksDQo+PiAg
ICAqIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT04tSU5GUklOR0VN
RU5ULiBJTiBOTyBFVkVOVCBTSEFMTA0KPj4gLSAqIFZJQSwgUzMgR1JBUEhJQ1MsIEFORC9P
UiBJVFMgU1VQUExJRVJTIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLCBEQU1BR0VTIE9SDQo+
PiAtICogT1RIRVIgTElBQklMSVRZLCBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05UUkFD
VCwgVE9SVCBPUiBPVEhFUldJU0UsDQo+PiAtICogQVJJU0lORyBGUk9NLCBPVVQgT0YgT1Ig
SU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SIE9USEVSDQo+
PiAtICogREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLg0KPj4gKyAqIFRIRSBBVVRIT1JTLCBD
T1BZUklHSFQgSE9MREVSUywgQU5EL09SIElUUyBTVVBQTElFUlMgQkUgTElBQkxFIEZPUiBB
TlkNCj4+ICsgKiBDTEFJTSwgREFNQUdFUyBPUiBPVEhFUiBMSUFCSUxJVFksIFdIRVRIRVIg
SU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBUT1JUDQo+PiArICogT1IgT1RIRVJXSVNFLCBB
UklTSU5HIEZST00sIE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJF
IE9SDQo+PiArICogVEhFIFVTRSBPUiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09GVFdBUkUu
DQo+PiAgICAqLw0KPiBEbyBub3QgbWl4IGxpY2Vuc2UgY2hhbmdlcyB3aXRoIG90aGVyIGNo
YW5nZXMgLSBhbmQgdXNlIFNQRFggdGFnIGlmDQo+IHBvc3NpYmxlIGZvciB0aGUgdXBkYXRl
ZCBsaWNlbnNlLg0KPiBTZWUgb3RoZXIgZHJtIFVBUEkgZmlsZXMgZm9yIGV4YW1wbGVzLg0K
PiANCj4gDQo+PiAgICNpZm5kZWYgX1ZJQV9EUk1fSF8NCj4+ICAgI2RlZmluZSBfVklBX0RS
TV9IXw0KPj4gQEAgLTgxLDYgKzgyLDExIEBAIGV4dGVybiAiQyIgew0KPj4gICAjZGVmaW5l
IERSTV9WSUFfRE1BX0JMSVQgICAgICAgIDB4MGUNCj4+ICAgI2RlZmluZSBEUk1fVklBX0JM
SVRfU1lOQyAgICAgICAweDBmDQo+Pg0KPj4gKyNkZWZpbmUJRFJNX1ZJQV9HRU1fQ1JFQVRF
CTB4MTANCj4+ICsjZGVmaW5lCURSTV9WSUFfR0VNX01BUAkJMHgxMQ0KPj4gKyNkZWZpbmUJ
RFJNX1ZJQV9HRU1fVU5NQVAJMHgxMg0KPj4gKw0KPiBVc2UgdGhlIHNhbWUgYWxpZ25tZW50
IGFzIHRoZSBwcmV2aW91cyBsaW5lcy4NCj4+ICsNCj4gRHJvcCBleHRyYSBlbXB0eSBsaW5l
Lg0KPiANCj4+ICAgI2RlZmluZSBEUk1fSU9DVExfVklBX0FMTE9DTUVNCSAgRFJNX0lPV1Io
RFJNX0NPTU1BTkRfQkFTRSArIERSTV9WSUFfQUxMT0NNRU0sIGRybV92aWFfbWVtX3QpDQo+
PiAgICNkZWZpbmUgRFJNX0lPQ1RMX1ZJQV9GUkVFTUVNCSAgRFJNX0lPVyggRFJNX0NPTU1B
TkRfQkFTRSArIERSTV9WSUFfRlJFRU1FTSwgZHJtX3ZpYV9tZW1fdCkNCj4+ICAgI2RlZmlu
ZSBEUk1fSU9DVExfVklBX0FHUF9JTklUCSAgRFJNX0lPV1IoRFJNX0NPTU1BTkRfQkFTRSAr
IERSTV9WSUFfQUdQX0lOSVQsIGRybV92aWFfYWdwX3QpDQo+PiBAQCAtOTcsNiArMTAzLDEw
IEBAIGV4dGVybiAiQyIgew0KPj4gICAjZGVmaW5lIERSTV9JT0NUTF9WSUFfRE1BX0JMSVQg
ICAgRFJNX0lPVyhEUk1fQ09NTUFORF9CQVNFICsgRFJNX1ZJQV9ETUFfQkxJVCwgZHJtX3Zp
YV9kbWFibGl0X3QpDQo+PiAgICNkZWZpbmUgRFJNX0lPQ1RMX1ZJQV9CTElUX1NZTkMgICBE
Uk1fSU9XKERSTV9DT01NQU5EX0JBU0UgKyBEUk1fVklBX0JMSVRfU1lOQywgZHJtX3ZpYV9i
bGl0c3luY190KQ0KPj4NCj4+ICsjZGVmaW5lCURSTV9JT0NUTF9WSUFfR0VNX0NSRUFURQlE
Uk1fSU9XUihEUk1fQ09NTUFORF9CQVNFICsgRFJNX1ZJQV9HRU1fQ1JFQVRFLCBzdHJ1Y3Qg
ZHJtX3ZpYV9nZW1fY3JlYXRlKQ0KPj4gKyNkZWZpbmUJRFJNX0lPQ1RMX1ZJQV9HRU1fTUFQ
CQlEUk1fSU9XUihEUk1fQ09NTUFORF9CQVNFICsgRFJNX1ZJQV9HRU1fTUFQLCBzdHJ1Y3Qg
ZHJtX3ZpYV9nZW1fbWFwKQ0KPj4gKyNkZWZpbmUJRFJNX0lPQ1RMX1ZJQV9HRU1fVU5NQVAJ
CURSTV9JT1IoRFJNX0NPTU1BTkRfQkFTRSArIERSTV9WSUFfR0VNX1VOTUFQLCBzdHJ1Y3Qg
ZHJtX3ZpYV9nZW1fdW5tYXApDQo+PiArDQo+IFVzZSBzYW1lIGFsaWdubWVudCBhcyBwcmV2
aW91cyBsaW5lcy4NCj4gDQo+PiAgIC8qIEluZGljZXMgaW50byBidWYuU2V0dXAgd2hlcmUg
dmFyaW91cyBiaXRzIG9mIHN0YXRlIGFyZSBtaXJyb3JlZCBwZXINCj4+ICAgICogY29udGV4
dCBhbmQgcGVyIGJ1ZmZlci4gIFRoZXNlIGNhbiBiZSBmaXJlZCBhdCB0aGUgY2FyZCBhcyBh
IHVuaXQsDQo+PiAgICAqIG9yIGluIGEgcGllY2V3aXNlIGZhc2hpb24gYXMgcmVxdWlyZWQu
DQo+PiBAQCAtMjc1LDYgKzI4NSwyMyBAQCB0eXBlZGVmIHN0cnVjdCBkcm1fdmlhX2RtYWJs
aXQgew0KPj4gICAJZHJtX3ZpYV9ibGl0c3luY190IHN5bmM7DQo+PiAgIH0gZHJtX3ZpYV9k
bWFibGl0X3Q7DQo+Pg0KPj4gK3N0cnVjdCBkcm1fdmlhX2dlbV9jcmVhdGUgew0KPj4gKwl1
aW50NjRfdCBzaXplOw0KPj4gKwl1aW50MzJfdCBhbGlnbm1lbnQ7DQo+PiArCXVpbnQzMl90
IGRvbWFpbjsNCj4+ICsJdWludDMyX3QgaGFuZGxlOw0KPj4gKwl1aW50NjRfdCBvZmZzZXQ7
DQo+PiArfTsNCj4gSSBkbyBub3Qga25vdyBpZiB0aGlzIGlzIHJlbGV2YW50LCBidXQgYWRk
aW5nIGEgNjQgYml0IHBhcmFtZXRlcg0KPiAob2Zmc2V0KSB0aGF0IGlzIG9ubHkgMzIgYml0
IGFsaWduZWQgbG9va3MgbGlrZSB0cm91YmxlIHRvIG1lLg0KPiBJIGhvcGUgb3RoZXJzIHRo
YXQga25vd3MgdGhpcyBiZXR0ZXIgY2FuIGNvbW1lbnQgaGVyZS4NCg0KVGhlIGNvbXBpbGVy
IHdpbGwgbGVhdmUgYSA0LWJ5dGUgZ2FwIGJldHdlZW4gaGFuZGxlIGFuZCBvZmZzZXQuIA0K
U3RydWN0dXJlIGFsbG9jYXRpb24gZ3VhcmFudGVlcyBhIG1pbmltYWwgYWxpZ25tZW50IG9m
IDggYnl0ZXMsIHNvIHRoZSANCmZpZWxkIGFsaWdubWVudCB3aWxsIGJlIGNvcnJlY3QuIEl0
J3MgYWxsIGRlcGVuZGVuZCBvbiBhcmNoaXRlY3R1cmUsIA0KcGxhdG9mcm0sIGNhbGxpbmcg
Y29udmVudGlvbiwgYnV0IHRoYXQncyB0aGUgcnVsZSBvZiB0aHVtYi4NCg0KSGF2ZSBhIGxv
b2sgYXQgdGhlIHRvb2wgJ3BhaG9sZScgdG8gaW5zcGVjdCBkYXRhLXN0cnVjdHVyZSBhbGln
bm1lbnQgaW4gDQpvYmplY3QgZmlsZXMuIFlvdSdsbCBmaW5kIHBsZW50eSBvZiBnYXBzIGlu
IGNvbXBpbGVkIHN0cnVjdHVyZS4NCg0KSXQncyBzdGlsbCBxdWVzdGlvbmFibGUgdG8gbGVh
dmUgdGhlIGdhcCB0aGVyZS4gRWl0aGVyIGRlY2xhcmUgaXQgDQpleHBsaWNpdHkgKGUuZy4s
IF9fdTMyIGVtcHR5MDsgKSAgb3IgZGVjbGFyZSB0aGUgc3RydWN0dXJlIHdpdGggDQpfX2F0
dHJpYnV0ZV9fKChfX3BhY2tlZF9fKSkuICBQZXJzb25hbGx5LCBJJ2QgdXNlIHRoZSBmb3Jt
ZXIuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+PiArDQo+PiArc3RydWN0IGRy
bV92aWFfZ2VtX21hcCB7DQo+PiArCXVpbnQzMl90IGhhbmRsZTsNCj4+ICsJdWludDY0X3Qg
bWFwX29mZnNldDsNCj4+ICt9Ow0KPiBTYW1lIGhlcmUgd2l0aCB0aGUgYWxpZ25tZW50Lg0K
PiANCj4gSWYgZHJtX3ZpYV9nZW1fY3JlYXRlLm9mZnNldCBhbmQgZHJtX3ZpYV9nZW1fbWFw
Lm1hcF9vZmZzZXQgaXMgdGhlIHNhbWUNCj4gdGhlIGZpZWxkIHNob3VsZCBoYXZlIHRoZSBz
YW1lIG5hbWUgLSB0byBtYWtlIHRoZSBBUEkgZWFzaWVyIHRvIHVzZS4NCj4gDQo+IA0KPj4g
Kw0KPj4gK3N0cnVjdCBkcm1fdmlhX2dlbV91bm1hcCB7DQo+PiArCXVpbnQzMl90IGhhbmRs
ZTsNCj4+ICt9Ow0KPj4gKw0KPj4gICAjaWYgZGVmaW5lZChfX2NwbHVzcGx1cykNCj4+ICAg
fQ0KPj4gICAjZW5kaWYNCj4+IC0tDQo+PiAyLjM1LjENCg0KLS0gDQpUaG9tYXMgWmltbWVy
bWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1h
bnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8g
VG90ZXYNCg==

--------------Bnym0SJVN0d0iQ6n4b1qmo68--

--------------Od0s0XnOTY5qlTDSLjZnUbOi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLgMAsFAwAAAAAACgkQlh/E3EQov+Dq
hRAAxCssHF9kC96GHyTu34meK9wOBgumyac79M/s98rtirJ7ZpzPF8i2uamO/eTDZRoDBt76j813
6ubp3TPUrukeaz2KmjlWImGGT+bsZF/E8qDt4ykzbPgite5d+KyVgIJJZyjQ3lR6x9hXvCvAz9+X
Y56tby2I8XDtINgtPoAD2l0uFPBgr6qgT3OUxuNkByM4YgAJYzntvhp7WGFOCS6kKX2FbHl8G2c1
jnOknDX8HP6ND0WZgj1UaGRwjAs3BhD1U9qUtIzFE59uL0qhrlaswq9q7oNIRNe6/rYxUii7zUxQ
F95funVwkSMDPJyn9vG5Mcf42gIw05jIlbkXfgdI/Swg86/4KYIU8f1M8bPY1zfoLGaEjsu1cSml
OYXaxKvkDZThDPbptXHa7NTVM0gnB36u2ax5lqg5DMjsRbIKznYjbfoBWgbhwxkH4glfLBB2HNni
aMTE+RojZzskCVQmgmNAWdjG8xecdQEtZ/QLnhE2ioaTG5FOh+RbYVwiCZtyBBt2F56xoquwyQqu
dDs7MkuiWu42auFo1Z239aU7v+vyEczuzbTXlQ17zyz0uiwThlnb7BwRIdlw79D22DFD6FRlHCpN
mHWF5wrszBszUVPICbl+OqW98PPDSdE6N92RC/zNS7IsyKUKNdk29AjFHCQnBgXcBIH5hxtHHtPz
PIM=
=bNS2
-----END PGP SIGNATURE-----

--------------Od0s0XnOTY5qlTDSLjZnUbOi--

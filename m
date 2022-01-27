Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3521B49E53B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 15:54:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBAA10E7B5;
	Thu, 27 Jan 2022 14:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E81A10E7B5;
 Thu, 27 Jan 2022 14:54:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F04DC218DF;
 Thu, 27 Jan 2022 14:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643295261; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v8fWXhbyoXcazfhZo3hv5O1RuBmr1XMNYj+pSAtIS1Q=;
 b=BgYzEH4XlP9nGQv8GoiDP1R0T9x0TU5+PNYjxGsTuPXTOc0O/MCDbwVDHY1m18+mma9RC3
 KCzUw6JuwXWyAwkdRqq8NyvfewUFS7+9eOmNp/hPsL4rAwBm7PhrAAn6tNvpqaedYWR+LH
 u8i3/lyUwVdhDlro16DpS2lfGJWZfRI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643295261;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v8fWXhbyoXcazfhZo3hv5O1RuBmr1XMNYj+pSAtIS1Q=;
 b=ljw22gscG6ryGrzLVqc+LdSSJVRgkn0lrv1cKXmS5NEDQEZRo+Rzz9zGKUzU9qolDWbW5v
 jCTRD/SYlTy66zDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C4E3213C03;
 Thu, 27 Jan 2022 14:54:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id r00TLx2y8mFsUAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Jan 2022 14:54:21 +0000
Message-ID: <7cb8a8a2-718d-6d5c-5de6-05bf990dd479@suse.de>
Date: Thu, 27 Jan 2022 15:54:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 09/19] dma-buf-map: Add wrapper over memset
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-10-lucas.demarchi@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220126203702.1784589-10-lucas.demarchi@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qRmQ02gbb1I86kFPwqzaVpbh"
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
Cc: linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qRmQ02gbb1I86kFPwqzaVpbh
Content-Type: multipart/mixed; boundary="------------nI0Yh6km02ArpMTUoS57PPJq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Message-ID: <7cb8a8a2-718d-6d5c-5de6-05bf990dd479@suse.de>
Subject: Re: [PATCH 09/19] dma-buf-map: Add wrapper over memset
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-10-lucas.demarchi@intel.com>
In-Reply-To: <20220126203702.1784589-10-lucas.demarchi@intel.com>

--------------nI0Yh6km02ArpMTUoS57PPJq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDEuMjIgdW0gMjE6MzYgc2NocmllYiBMdWNhcyBEZSBNYXJjaGk6DQo+
IEp1c3QgbGlrZSBtZW1jcHlfdG9pbygpLCB0aGVyZSBpcyBhbHNvIG5lZWQgdG8gd3JpdGUg
YSBkaXJlY3QgdmFsdWUgdG8gYQ0KPiBtZW1vcnkgYmxvY2suIEFkZCBkbWFfYnVmX21hcF9t
ZW1zZXQoKSB0byBhYnN0cmFjdCBtZW1zZXQoKSB2cyBtZW1zZXRfaW8oKQ0KPiANCj4gQ2M6
IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+IENjOiBTdW1pdCBT
ZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPg0KPiBDYzogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiBDYzogbGludXgtbWVkaWFAdmdlci5r
ZXJuZWwub3JnDQo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENj
OiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcNCj4gQ2M6IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmcNCj4gU2lnbmVkLW9mZi1ieTogTHVjYXMgRGUgTWFyY2hpIDxsdWNh
cy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgIGluY2x1ZGUvbGludXgvZG1hLWJ1
Zi1tYXAuaCB8IDE3ICsrKysrKysrKysrKysrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE3
IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2RtYS1i
dWYtbWFwLmggYi9pbmNsdWRlL2xpbnV4L2RtYS1idWYtbWFwLmgNCj4gaW5kZXggMzUxNGE4
NTlmNjI4Li5jOWZiMDQyNjRjZDAgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgvZG1h
LWJ1Zi1tYXAuaA0KPiArKysgYi9pbmNsdWRlL2xpbnV4L2RtYS1idWYtbWFwLmgNCj4gQEAg
LTMxNyw2ICszMTcsMjMgQEAgc3RhdGljIGlubGluZSB2b2lkIGRtYV9idWZfbWFwX21lbWNw
eV90byhzdHJ1Y3QgZG1hX2J1Zl9tYXAgKmRzdCwgY29uc3Qgdm9pZCAqc3INCj4gICAJCW1l
bWNweShkc3QtPnZhZGRyLCBzcmMsIGxlbik7DQo+ICAgfQ0KPiAgIA0KPiArLyoqDQo+ICsg
KiBkbWFfYnVmX21hcF9tZW1zZXQgLSBNZW1zZXQgaW50byBkbWEtYnVmIG1hcHBpbmcNCj4g
KyAqIEBkc3Q6CVRoZSBkbWEtYnVmIG1hcHBpbmcgc3RydWN0dXJlDQo+ICsgKiBAdmFsdWU6
CVRoZSB2YWx1ZSB0byBzZXQNCj4gKyAqIEBsZW46CVRoZSBudW1iZXIgb2YgYnl0ZXMgdG8g
c2V0IGluIGRzdA0KPiArICoNCj4gKyAqIFNldCB2YWx1ZSBpbiBkbWEtYnVmIG1hcHBpbmcu
IERlcGVuZGluZyBvbiB0aGUgYnVmZmVyJ3MgbG9jYXRpb24sIHRoZSBoZWxwZXINCj4gKyAq
IHBpY2tzIHRoZSBjb3JyZWN0IG1ldGhvZCBvZiBhY2Nlc3NpbmcgdGhlIG1lbW9yeS4NCj4g
KyAqLw0KPiArc3RhdGljIGlubGluZSB2b2lkIGRtYV9idWZfbWFwX21lbXNldChzdHJ1Y3Qg
ZG1hX2J1Zl9tYXAgKmRzdCwgaW50IHZhbHVlLCBzaXplX3QgbGVuKQ0KPiArew0KPiArCWlm
IChkc3QtPmlzX2lvbWVtKQ0KPiArCQltZW1zZXRfaW8oZHN0LT52YWRkcl9pb21lbSwgdmFs
dWUsIGxlbik7DQo+ICsJZWxzZQ0KPiArCQltZW1zZXQoZHN0LT52YWRkciwgdmFsdWUsIGxl
bik7DQo+ICt9DQoNCk1heWJlIGFkZCBhbiBvZmZzZXQgcGFyYW1ldGVyIGhlcmUuDQoNCkJl
c3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gKw0KPiAgIC8qKg0KPiAgICAqIGRtYV9idWZfbWFw
X2luY3IgLSBJbmNyZW1lbnRzIHRoZSBhZGRyZXNzIHN0b3JlZCBpbiBhIGRtYS1idWYgbWFw
cGluZw0KPiAgICAqIEBtYXA6CVRoZSBkbWEtYnVmIG1hcHBpbmcgc3RydWN0dXJlDQoNCi0t
IA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkg
TsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOk
ZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------nI0Yh6km02ArpMTUoS57PPJq--

--------------qRmQ02gbb1I86kFPwqzaVpbh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHysh0FAwAAAAAACgkQlh/E3EQov+A3
ZxAAr5VXWQlRsbS8cSvWZ6EQYkXbTAu3e9bmzCT4dEaTn9l/lcOs50+nU1tOts6eCL57N8BpE6JL
ALTmdjZ4uTYn5JubCyVECPZmqVH81qPPJoPHoX5moiJon+jcc7YYohAbrTS0nR5MIV/AKucZiY6f
6SJfryLv6CcKytF+2DP7ebPyneXG5e4nyQC7ar4f839YaXcKkcmsJSFDVI6b3jwpYw7Pvv4uJ/6m
o8SRUzSq0I+7vvtS0kuQB1SY8RHEMEr1hmw0IO5K15Eu0XIltumaATF5hbe/pikfJZRxNBjoT/6X
g3alHMsJhKcL4GFpeZzQIhYAhO59zlrTr6GWVxOa+MSXC5K8v0YeGaHwFEMDID30qO5r22Sd+Qya
8i7ntYy+VdcbdBf0IiLmwAVgRZdfnI1CNeV2Q+TKGAp2YUd+7re9A32gSKoWmy47788MrEzOU2UM
S8m/xSL2Yftwdczy5UerUUCgjzT9qibXCjRrS9xXW2uUSeQvyO2tv7Mu0qPTTQODwJfVCsZVqxHR
YKi1a4bc6voQau/OfByZr/hIaQEJzu1N7z5LeIPQsAXTnyr0+MF5T5GKfrrESODLSKl0x1vQwbpF
6VxFzz/gcIoU0GfoLVBzoaXMdGNswoxbjBT4v3D6iNpNL7GF1MPTDDR506W6BqbfpJe4Hkgp1NsL
jH8=
=gmeQ
-----END PGP SIGNATURE-----

--------------qRmQ02gbb1I86kFPwqzaVpbh--

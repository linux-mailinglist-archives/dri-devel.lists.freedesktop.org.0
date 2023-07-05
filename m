Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C92E3748079
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 11:08:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0999810E31B;
	Wed,  5 Jul 2023 09:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B8810E31B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 09:08:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E29261F890;
 Wed,  5 Jul 2023 09:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688548119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nCqvRYw6+xokOEyOjAg8Z1ew/iNTwqZl1xt4Ki2PQf0=;
 b=GZrveshmit45yqAh8rO7/7DRA87WkbvMdDNVgT3ziVtVI0cVHDtSxfeRLK4aXS9+gt3Jyy
 8KDbp29DOqm8Ab8CTInBBF3E5dX6uBO+zNbQV+NG4RwOfTERW6YGV2pv00snyXGxSTwAhU
 WEHOzbpUJYlQ547+mxP+jIiXnTR6T9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688548119;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nCqvRYw6+xokOEyOjAg8Z1ew/iNTwqZl1xt4Ki2PQf0=;
 b=T689o8tRz1z3eRSk3c86tFmWTBmWqc2yLM20iBB2mDs6Oqv13oruzpEejQ+7eQmBWjpjIi
 senD5DZ3ejISYYDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B145C134F3;
 Wed,  5 Jul 2023 09:08:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YeU9KhczpWQkYwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Jul 2023 09:08:39 +0000
Message-ID: <45ed59d1-32a5-86cb-094f-5ce7ad758d5b@suse.de>
Date: Wed, 5 Jul 2023 11:08:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 01/10] fbdev: Add fb_ops init macros for framebuffers in
 DMA-able memory
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-2-tzimmermann@suse.de>
 <875y6ysr6g.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <875y6ysr6g.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DSsyXgywvRAKtkTazazBzV0j"
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DSsyXgywvRAKtkTazazBzV0j
Content-Type: multipart/mixed; boundary="------------ke1NSCnTChFDaBiTrn3IJd0T";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Message-ID: <45ed59d1-32a5-86cb-094f-5ce7ad758d5b@suse.de>
Subject: Re: [PATCH 01/10] fbdev: Add fb_ops init macros for framebuffers in
 DMA-able memory
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-2-tzimmermann@suse.de>
 <875y6ysr6g.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <875y6ysr6g.fsf@minerva.mail-host-address-is-not-set>

--------------ke1NSCnTChFDaBiTrn3IJd0T
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDA1LjA3LjIzIHVtIDEwOjIzIHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4gd3JpdGVzOg0KPiANCj4gSGVsbG8gVGhvbWFzLA0KPiANCj4+IEFkZCBpbml0aWFsaXpl
ciBtYWNyb3MgZm9yIHN0cnVjdCBmYl9vcHMgZm9yIGZyYW1lYnVmZmVycyBpbiBETUEtYWJs
ZQ0KPj4gbWVtb3J5IGFyZWFzLiBBbHNvIGFkZCBhIGNvcnJlc3BvbmRpbmcgS2NvbmZpZyB0
b2tlbi4gQXMgb2Ygbm93LCB0aGlzDQo+PiBpcyBlcXVpdmFsZW50IHRvIHN5c3RlbSBmcmFt
ZWJ1ZmZlcnMgYW5kIG1vc3RseSB1c2VmdWwgZm9yIGxhYmVsaW5nDQo+PiBkcml2ZXJzIGNv
cnJlY3RseS4NCj4+DQo+PiBBIGxhdGVyIHBhdGNoIG1heSBhZGQgYSBnZW5lcmljIERNQS1z
cGVjaWZpYyBtbWFwIG9wZXJhdGlvbi4gTGludXgNCj4+IG9mZmVycyBhIG51bWJlciBvZiBk
bWFfbW1hcF8qKCkgaGVscGVycyBmb3IgZGlmZmVyZW50IHVzZSBjYXNlcy4NCj4+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4N
Cj4+IENjOiBIZWxnZSBEZWxsZXIgPGRlbGxlckBnbXguZGU+DQo+PiAtLS0NCj4+ICAgZHJp
dmVycy92aWRlby9mYmRldi9LY29uZmlnIHwgIDggKysrKysrKysNCj4+ICAgaW5jbHVkZS9s
aW51eC9mYi5oICAgICAgICAgIHwgMTMgKysrKysrKysrKysrKw0KPj4gICAyIGZpbGVzIGNo
YW5nZWQsIDIxIGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92
aWRlby9mYmRldi9LY29uZmlnIGIvZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnDQo+PiBp
bmRleCBjZWNmMTU0MTg2MzIuLmYxNDIyOTc1NzMxMSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZl
cnMvdmlkZW8vZmJkZXYvS2NvbmZpZw0KPj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9L
Y29uZmlnDQo+PiBAQCAtMTY4LDYgKzE2OCwxNCBAQCBjb25maWcgRkJfREVGRVJSRURfSU8N
Cj4+ICAgCWJvb2wNCj4+ICAgCWRlcGVuZHMgb24gRkINCj4+ICAgDQo+PiArY29uZmlnIEZC
X0RNQV9IRUxQRVJTDQo+PiArCWJvb2wNCj4+ICsJZGVwZW5kcyBvbiBGQg0KPj4gKwlzZWxl
Y3QgRkJfU1lTX0NPUFlBUkVBDQo+PiArCXNlbGVjdCBGQl9TWVNfRklMTFJFQ1QNCj4+ICsJ
c2VsZWN0IEZCX1NZU19GT1BTDQo+PiArCXNlbGVjdCBGQl9TWVNfSU1BR0VCTElUDQo+PiAr
DQo+PiAgIGNvbmZpZyBGQl9JT19IRUxQRVJTDQo+PiAgIAlib29sDQo+PiAgIAlkZXBlbmRz
IG9uIEZCDQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9mYi5oIGIvaW5jbHVkZS9s
aW51eC9mYi5oDQo+PiBpbmRleCAxZDVjMTNmMzRiMDkuLjExOTFhNzhjNTI4OSAxMDA2NDQN
Cj4+IC0tLSBhL2luY2x1ZGUvbGludXgvZmIuaA0KPj4gKysrIGIvaW5jbHVkZS9saW51eC9m
Yi5oDQo+PiBAQCAtNTk0LDYgKzU5NCwxOSBAQCBleHRlcm4gc3NpemVfdCBmYl9zeXNfd3Jp
dGUoc3RydWN0IGZiX2luZm8gKmluZm8sIGNvbnN0IGNoYXIgX191c2VyICpidWYsDQo+PiAg
IAlfX0ZCX0RFRkFVTFRfU1lTX09QU19EUkFXLCBcDQo+PiAgIAlfX0ZCX0RFRkFVTFRfU1lT
X09QU19NTUFQDQo+PiAgIA0KPj4gKy8qDQo+PiArICogSGVscGVycyBmb3IgZnJhbWVidWZm
ZXJzIGluIERNQS1hYmxlIG1lbW9yeQ0KPj4gKyAqLw0KPj4gKw0KPiANCj4gVGhlIGNvbW1l
bnQgZm9yIEkvTyBtZW1vcnkgaGVscGVycyBzYXlzOg0KPiANCj4gLyoNCj4gICAqIEluaXRp
YWxpemVzIHN0cnVjdCBmYl9vcHMgZm9yIGZyYW1lYnVmZmVycyBpbiBJL08gbWVtb3J5Lg0K
PiAgICovDQo+IA0KPiBJIHRoaW5rIHRoYXQgd291bGQgYmUgZ29vZCB0byBoYXZlIGNvbnNp
c3RlbmN5IGJldHdlZW4gdGhlc2UgdHdvLA0KDQpTdXJlLCBJIGhhZCB0aGUgc2FtZSB0aG91
Z2h0LiBJIHRoaW5rIEknbGwgcmF0aGVyIGNoYW5nZSB0aGUgZXhpc3RpbmcgDQpjb21tZW50
cyBhIGJpdC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KDQo+IHNvIHNvbWV0aGluZyBs
aWtlOg0KPiANCj4gLyoNCj4gICAqIEluaXRpYWxpemVzIHN0cnVjdCBmYl9vcHMgZm9yIGZy
YW1lYnVmZmVycyBpbiBETUEtYWJsZSBtZW1vcnkuDQo+ICAgKi8NCj4gDQo+PiArI2RlZmlu
ZSBfX0ZCX0RFRkFVTFRfRE1BX09QU19SRFdSIFwNCj4+ICsJLmZiX3JlYWQJPSBmYl9zeXNf
cmVhZCwgXA0KPj4gKwkuZmJfd3JpdGUJPSBmYl9zeXNfd3JpdGUNCj4+ICsNCj4+ICsjZGVm
aW5lIF9fRkJfREVGQVVMVF9ETUFfT1BTX0RSQVcgXA0KPj4gKwkuZmJfZmlsbHJlY3QJPSBz
eXNfZmlsbHJlY3QsIFwNCj4+ICsJLmZiX2NvcHlhcmVhCT0gc3lzX2NvcHlhcmVhLCBcDQo+
PiArCS5mYl9pbWFnZWJsaXQJPSBzeXNfaW1hZ2VibGl0DQo+PiArDQo+IA0KPiBSZXZpZXdl
ZC1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQo+
IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3Nl
IDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcg
TXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFH
IE51ZXJuYmVyZykNCg==

--------------ke1NSCnTChFDaBiTrn3IJd0T--

--------------DSsyXgywvRAKtkTazazBzV0j
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSlMxYFAwAAAAAACgkQlh/E3EQov+Dr
NBAArgLkjnNOyy3WrhjOi6DrP0uWuMNDID2zLhx3QZlZuF7r0OK7UdcAUt3zxY/G/8iJZ55m663D
e9+qWh7zczNjg8mQ5tTK0WQCQ06cS3+9/lL9fCEi3SYvNmqjKCyYjYcCTJOwexOV/UMAI2nwoPTG
NTlHBqyMaqFlgAphNeOP3PEgvkTeI/+eqmquHAMsgsRrDyyhEAAQBkaWk6sDNoV6m1pMBd0jJ3gn
U4z4zul09xvku2/fSbNLJoP3nIBcDhx55V4Y5oKmT+VpkYLIZvSrPmcGUpgQMccWJkWyn+VHknCM
1cz+CbQgZLPlGjms3OiJxFAUhV6/+sg5Z2lKejqRKxWIylw14fcKNWgxoq63AvqO8CLblxVpq488
rRBXoEnleRAKrVufNwYPSJ1JxJW9hhbl2VCvVeGkLAF9tY1OtVsqXWVCZ/uPbQA0eJhN8zo9Esys
G2dAP8roe4mTAlVFf3WDhjBK9ZsRItnHE9f4tJBedcdmINVXh92hZN02sRSMm9hCC11QNs+Op4x/
I+lqAD0RXSdmwBCdX5c/hhrIwQPTByRGZW9I2zMAMc3SQvbkN7KkDRga8TBHh+yrZfYudXL0d0Jb
foumBqatUmsWB7qb8SFMljxmUin5K8OgTCYRBdUsBxVQd666OkCRC0BswaS1JVCsrN8ZFLMh0saC
s2o=
=DbR5
-----END PGP SIGNATURE-----

--------------DSsyXgywvRAKtkTazazBzV0j--

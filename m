Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 398EE4ABECB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 14:07:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8FD10E648;
	Mon,  7 Feb 2022 13:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B41A10E648
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 13:07:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 408AB210F5;
 Mon,  7 Feb 2022 13:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644239267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AJX4CiuVAOLqVJOZ9/lxezrgIUeubZaYwRDYOdaReK8=;
 b=m/KirqksB7aeBt3hzAvEMqxx/vwxPjeF8E5DvurHWCRVzwPIwo1l80+AXsohk190ln/eDQ
 q+/cBEGreobSpF9XJLxf6+R5YFF8J1hFALI8jJmV3Bdwjxv1iaeluc4HqiazTOOPTYScpJ
 5IfdtroP3MmMX75xnRJiZSJsV3Dt8Go=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644239267;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AJX4CiuVAOLqVJOZ9/lxezrgIUeubZaYwRDYOdaReK8=;
 b=DIz9/g3+vLIXHQEkqvJ3krSu6lUZ9lVqUdQdjtCA5oM2qp2LGxv/sM6ceYvMjWR1NhHap5
 gbi3iI2nSn4mQ6DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0841113C00;
 Mon,  7 Feb 2022 13:07:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Pnr/AKMZAWKSFwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 07 Feb 2022 13:07:47 +0000
Message-ID: <dec19fcd-8fee-1d2c-de10-7109d079a27f@suse.de>
Date: Mon, 7 Feb 2022 14:07:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 8/8] drm/ast: Move SIL164-based connector code into
 separate helpers
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
 kuohsiang_chou@aspeedtech.com
References: <20220111120058.10510-1-tzimmermann@suse.de>
 <20220111120058.10510-9-tzimmermann@suse.de>
 <8bf294da-f2fa-2679-b179-3a742dba8280@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <8bf294da-f2fa-2679-b179-3a742dba8280@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zo1EJh2PpaxxbuEw1gv38I1X"
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
Cc: jenmin_yuan@aspeedtech.com, tommy_huang@aspeedtech.com,
 dri-devel@lists.freedesktop.org, arc_sung@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zo1EJh2PpaxxbuEw1gv38I1X
Content-Type: multipart/mixed; boundary="------------j1fNGxDbDl7BWxYkoMmpgxR9";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
 kuohsiang_chou@aspeedtech.com
Cc: jenmin_yuan@aspeedtech.com, dri-devel@lists.freedesktop.org,
 tommy_huang@aspeedtech.com, arc_sung@aspeedtech.com
Message-ID: <dec19fcd-8fee-1d2c-de10-7109d079a27f@suse.de>
Subject: Re: [PATCH 8/8] drm/ast: Move SIL164-based connector code into
 separate helpers
References: <20220111120058.10510-1-tzimmermann@suse.de>
 <20220111120058.10510-9-tzimmermann@suse.de>
 <8bf294da-f2fa-2679-b179-3a742dba8280@redhat.com>
In-Reply-To: <8bf294da-f2fa-2679-b179-3a742dba8280@redhat.com>

--------------j1fNGxDbDl7BWxYkoMmpgxR9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDMuMDIuMjIgdW0gMTg6NTcgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDEvMTEvMjIgMTM6MDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0K
Pj4gQWRkIGhlbHBlcnMgZm9yIGluaXRpYWxpemluZyBTSUwxNjQtYmFzZWQgY29ubmVjdG9y
cy4gVGhlc2UgdXNlZCB0byBiZQ0KPj4gaGFuZGxlZCBieSB0aGUgVkdBIGNvbm5lY3RvciBj
b2RlLiBCdXQgU0lMMTY0IHByb3ZpZGVzIG91dHB1dCB2aWEgRFZJLUksDQo+PiBzbyBzZXQg
dGhlIGVuY29kZXIgYW5kIGNvbm5lY3RvciB0eXBlcyBhY2NvcmRpbmdseS4NCj4+DQo+PiBJ
ZiBhIFNJTDE2NCBjaGlwIGhhcyBiZWVuIGRldGVjdGVkLCBhc3Qgd2lsbCBub3cgY3JlYXRl
IGEgRFZJLUkNCj4+IGNvbm5lY3RvciBpbnN0ZWFkIG9mIGEgVkdBIGNvbm5lY3Rvci4NCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaCAgfCAx
NSArKysrKysNCj4+ICAgZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jIHwgOTkgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPj4gICAyIGZpbGVzIGNoYW5nZWQs
IDExMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9hc3Qv
YXN0X2Rydi5oDQo+PiBpbmRleCA0MjBkMTlkODQ1OWUuLmMzYTU4MjM3MjY0OSAxMDA2NDQN
Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5oDQo+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaA0KPj4gQEAgLTE0MCw2ICsxNDAsMTcgQEAgdG9f
YXN0X3ZnYV9jb25uZWN0b3Ioc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikNCj4+
ICAgCXJldHVybiBjb250YWluZXJfb2YoY29ubmVjdG9yLCBzdHJ1Y3QgYXN0X3ZnYV9jb25u
ZWN0b3IsIGJhc2UpOw0KPj4gICB9DQo+PiAgIA0KPiANCj4gW3NuaXBdDQo+IA0KPj4gK3N0
YXRpYyBpbnQgYXN0X3NpbDE2NF9jb25uZWN0b3JfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LA0KPj4gKwkJCQkgICAgIHN0cnVjdCBhc3Rfc2lsMTY0X2Nvbm5lY3RvciAqYXN0X3Np
bDE2NF9jb25uZWN0b3IpDQo+PiArew0KPj4gKwlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
bmVjdG9yID0gJmFzdF9zaWwxNjRfY29ubmVjdG9yLT5iYXNlOw0KPj4gKwlpbnQgcmV0Ow0K
Pj4gKw0KPj4gKwlhc3Rfc2lsMTY0X2Nvbm5lY3Rvci0+aTJjID0gYXN0X2kyY19jcmVhdGUo
ZGV2KTsNCj4+ICsJaWYgKCFhc3Rfc2lsMTY0X2Nvbm5lY3Rvci0+aTJjKQ0KPj4gKwkJZHJt
X2VycihkZXYsICJmYWlsZWQgdG8gYWRkIGRkYyBidXMgZm9yIGNvbm5lY3RvclxuIik7DQo+
PiArDQo+PiArCWlmIChhc3Rfc2lsMTY0X2Nvbm5lY3Rvci0+aTJjKQ0KPj4gKwkJcmV0ID0g
ZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKGRldiwgY29ubmVjdG9yLCAmYXN0X3NpbDE2
NF9jb25uZWN0b3JfZnVuY3MsDQo+PiArCQkJCQkJICBEUk1fTU9ERV9DT05ORUNUT1JfRFZJ
SSwNCj4+ICsJCQkJCQkgICZhc3Rfc2lsMTY0X2Nvbm5lY3Rvci0+aTJjLT5hZGFwdGVyKTsN
Cj4+ICsJZWxzZQ0KPj4gKwkJcmV0ID0gZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgY29ubmVj
dG9yLCAmYXN0X3NpbDE2NF9jb25uZWN0b3JfZnVuY3MsDQo+PiArCQkJCQkgRFJNX01PREVf
Q09OTkVDVE9SX0RWSUkpOw0KPj4gKwlpZiAocmV0KQ0KPiANCj4gSSB0aGluayB5b3Ugd2Fu
dCBhIGtmcmVlKGkyYykgaGVyZSBiZWZvcmUgcmV0dXJuaW5nLg0KPiANCj4gQW5kIHdoZXJl
IGlzIHRoZSBzdHJ1Y3QgYXN0X2kyY19jaGFuIGZyZWVkIGlmIHRoZSBmdW5jdGlvbiBzdWNj
ZWVkcyA/DQoNClRoZSBtZW1vcnkgYW5kIGRhdGEgc3RydWN0dXJlIGlzIG1hbmFnZWQgd2l0
aCANCmRybW1fYWRkX2FjdGlvbl9vcl9yZXNldCgpLiBJdCB3aWxsIGJlIHJlbGVhc2VkIHRv
Z2V0aGVyIHdpdGggdGhlIERSTSANCmRyaXZlciAoZWl0aGVyIG9uIHN1Y2Nlc3Mgb3IgZmFp
bHVyZSkuIFNlZSBhc3RfaTJjX2NyZWF0ZSgpIGZvciB0aGUgZGV0YWlscy4NCg0KQmVzdCBy
ZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gV2l0aCB0aGF0LA0KPiANCj4gUmV2aWV3ZWQtYnk6
IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPiANCj4g
QmVzdCByZWdhcmRzLA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcg
TsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------j1fNGxDbDl7BWxYkoMmpgxR9--

--------------zo1EJh2PpaxxbuEw1gv38I1X
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIBGaIFAwAAAAAACgkQlh/E3EQov+AS
2BAAzn1VX5tEGtMQ5qpdKKair1mrWBehdZ/qmji++9gd+fc8VDR/eI53RLkWwalTz/MX/cEQjFhK
o3KBfaifjP8FRueOkamZ//cx7B+w7i1DgxSji4DKTlMXFquknZ5tI4Fm2iYDSnosQUiyWsuWjzaH
ciVCdBCLIj3miES5+ACzVhect4QOSo10tQcmyV+tXjVbJq309D88c0d4yhfgPcwi0vVEi5W6Ruck
u9CkXdmyN32/9L5/VXj+Dxnb5cCbAasA0qYDwQPB0w9jHdOtDxZdlYOVIgpDaO77uzKFOtAw0ds7
bACF27IjOjCSksviCT36kI3YSmNyft6uHsJgUV+/UpvTNrLpr75xvoh6vd3nFIFoJVMKcwVqPk9I
LUkOVRUFKhps3+YCxkDc4A7Orur8teW6/MtYU3ZHSEPdNCN9y49A33YCostrcFpOV3q13xiCVgUe
nF02RDUBuuBnXqxHIlzOMeHda4B57ns2bb36wOmKkuqVsAACu6Z0Av2+dUE/XLHg2seZQGF/fNIn
88/AIEEYj8QmQMbJHkdLaX2yNACRQIQCX0k/Dqods7MRFtxuOMJiiVRRC7LY6Z9nxdbJQcGATbmp
tB/8jeO2n+xtODNaWcc+pFxCyAdf3oi1v8nwzYCha4pTAquuaFYidh/GmihibnAt8I4NW2QCJysT
iZc=
=4DWy
-----END PGP SIGNATURE-----

--------------zo1EJh2PpaxxbuEw1gv38I1X--

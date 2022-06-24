Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BE155943B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 09:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D89F2112A8F;
	Fri, 24 Jun 2022 07:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048D5112A8F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 07:31:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7ABFB21A84;
 Fri, 24 Jun 2022 07:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656055880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s6hv+ilsgyEZGg6ddwUKGSihzdSIvqcZ/s76CmUUSXY=;
 b=VLp+eWRTgHWNCQ5ExNsIP6D9W1U/aVn8VoopImTkhs6qk6MyfRsa8vAb5kWUfqGcHzTyjk
 c1N3VVKk3whHLmLBl4MRfjyV1dPzhUVIbwZKRb85mSdT5E/cRNvcUdTCnQ2MWh7U5YX3x8
 KGaOX1YAqh9hJE4MUqrN1kKth7hXgXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656055880;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s6hv+ilsgyEZGg6ddwUKGSihzdSIvqcZ/s76CmUUSXY=;
 b=m5lCHPVCTvG+JEx+xobHO8JvF+/adfP7ZKAzBO5ZtSUk3ZDXlVUJL1iPCjd/cXZwcEtdgY
 WGcaKHTzBfq3IECw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4E16613ACA;
 Fri, 24 Jun 2022 07:31:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MSEZEkhotWKoTQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 24 Jun 2022 07:31:20 +0000
Message-ID: <6ae07bc7-7cde-0554-e939-0873998fd423@suse.de>
Date: Fri, 24 Jun 2022 09:31:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/ast: Fix black screen when getting out of suspend
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 kuohsiang_chou@aspeedtech.com
References: <20220622124815.356035-1-jfalempe@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220622124815.356035-1-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4jmKQJFQIe0YhibLbUIvrwC4"
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
Cc: charles_kuan@aspeedtech.com, michel@daenzer.net, luke_chen@aspeedtech.com,
 Venkat Tadikonda <venkateswara.rao@intel.com>, hungju_huang@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4jmKQJFQIe0YhibLbUIvrwC4
Content-Type: multipart/mixed; boundary="------------BuFEjBzlmpJjnp2kJrzwpvb0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 kuohsiang_chou@aspeedtech.com
Cc: Venkat Tadikonda <venkateswara.rao@intel.com>,
 hungju_huang@aspeedtech.com, michel@daenzer.net,
 charles_kuan@aspeedtech.com, luke_chen@aspeedtech.com
Message-ID: <6ae07bc7-7cde-0554-e939-0873998fd423@suse.de>
Subject: Re: [PATCH] drm/ast: Fix black screen when getting out of suspend
References: <20220622124815.356035-1-jfalempe@redhat.com>
In-Reply-To: <20220622124815.356035-1-jfalempe@redhat.com>

--------------BuFEjBzlmpJjnp2kJrzwpvb0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjIuMDYuMjIgdW0gMTQ6NDggc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IFdpdGggYW4gQVNUMjYwMCwgdGhlIHNjcmVlbiBpcyBnYXJiYWdlIHdoZW4gZ29pbmcgb3V0
IG9mIHN1c3BlbmQuDQo+IFRoaXMgaXMgYmVjYXVzZSBjb2xvciBzZXR0aW5ncyBhcmUgbG9z
dCwgYW5kIG5vdCByZXN0b3JlZCBvbiByZXN1bWUuDQo+IEZvcmNlIHRoZSBjb2xvciBzZXR0
aW5ncyBvbiBEUE1TX09OLCB0byBtYWtlIHN1cmUgdGhlIHNldHRpbmdzIGFyZSBjb3JyZWN0
Lg0KPiANCj4gSSBkaWRuJ3Qgd3JpdGUgdGhpcyBjb2RlLCBpdCBjb21lcyBmcm9tIHRoZSBv
dXQtb2YtdHJlZSBhc3BlZWQgZHJpdmVyIHYxLjEzDQo+IGh0dHBzOi8vd3d3LmFzcGVlZHRl
Y2guY29tL3N1cHBvcnRfZHJpdmVyLw0KPiANCj4gU2lnbmVkLW9mZi1ieTogSm9jZWx5biBG
YWxlbXBlIDxqZmFsZW1wZUByZWRoYXQuY29tPg0KPiBUZXN0ZWQtYnk6IFZlbmthdCBUYWRp
a29uZGEgPHZlbmthdGVzd2FyYS5yYW9AaW50ZWwuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJz
L2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgfCAxMyArKysrKysrKysrKysrDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2Rl
LmMNCj4gaW5kZXggM2ViOWFmZWNkOWQ0Li5jZGRkY2I1YzQ0MzkgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYXN0L2FzdF9tb2RlLmMNCj4gQEAgLTk5MCw2ICs5OTAsOSBAQCBzdGF0aWMgdm9pZCBh
c3RfY3J0Y19kcG1zKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywgaW50IG1vZGUpDQo+ICAgew0K
PiAgIAlzdHJ1Y3QgYXN0X3ByaXZhdGUgKmFzdCA9IHRvX2FzdF9wcml2YXRlKGNydGMtPmRl
dik7DQo+ICAgCXU4IGNoID0gQVNUX0RQTVNfVlNZTkNfT0ZGIHwgQVNUX0RQTVNfSFNZTkNf
T0ZGOw0KPiArCXN0cnVjdCBhc3RfY3J0Y19zdGF0ZSAqYXN0X3N0YXRlOw0KPiArCWNvbnN0
IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKmZvcm1hdDsNCj4gKwlzdHJ1Y3QgYXN0X3ZiaW9z
X21vZGVfaW5mbyAqdmJpb3NfbW9kZV9pbmZvOw0KPiAgIA0KPiAgIAkvKiBUT0RPOiBNYXli
ZSBjb250cm9sIGRpc3BsYXkgc2lnbmFsIGdlbmVyYXRpb24gd2l0aA0KPiAgIAkgKiAgICAg
ICBTeW5jIEVuYWJsZSAoYml0IENSMTcuNykuDQo+IEBAIC0xMDA3LDYgKzEwMTAsMTYgQEAg
c3RhdGljIHZvaWQgYXN0X2NydGNfZHBtcyhzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIGludCBt
b2RlKQ0KPiAgIAkJCWFzdF9kcF9zZXRfb25fb2ZmKGNydGMtPmRldiwgMSk7DQo+ICAgCQl9
DQo+ICAgDQo+ICsJCWFzdF9zdGF0ZSA9IHRvX2FzdF9jcnRjX3N0YXRlKGNydGMtPnN0YXRl
KTsNCj4gKwkJZm9ybWF0ID0gYXN0X3N0YXRlLT5mb3JtYXQ7DQo+ICsNCj4gKwkJaWYgKGZv
cm1hdCl7DQo+ICsJCQl2Ymlvc19tb2RlX2luZm8gPSAmYXN0X3N0YXRlLT52Ymlvc19tb2Rl
X2luZm87DQo+ICsNCj4gKwkJCWFzdF9zZXRfY29sb3JfcmVnKGFzdCwgZm9ybWF0KTsNCj4g
KwkJCWFzdF9zZXRfdmJpb3NfY29sb3JfcmVnKGFzdCwgZm9ybWF0LCB2Ymlvc19tb2RlX2lu
Zm8pOw0KPiArCQl9DQo+ICsNCg0KSSd2ZSBzZWVuIHN1c3BlbmQgaXNzdWVzIG9uIG90aGVy
IEFTVCBkZXZpY2VzIGJlc2lkZXMgdGhlIDI2MDAuIFRoaXMgDQpzZWVtcyB0byBiZSBhbiBp
bXByb3ZlbWVudCBvbiBBU1QyMzAwIGF0IGxlYXN0LiBUaGVyZWZvcmUNCg0KVGVzdGVkLWJ5
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KVGhlIERQTVMg
Y29kZSBuZWVkIHRvIGJlIGludGVncmF0ZWQgaW50byBhdG9taWNfZW5hYmxlIGF0IHNvbWUg
cG9pbnQuIA0KKEl0J3MgZm9yIGEgbGF0ZXIgcGF0Y2hzZXQuKSBJdCdzIGEgcmVsaWN0IG9m
IHRoZSBvbGQgbm9uLWF0b21pYyANCm1vZGVzZXR0aW5nIHRoYXQgbmV2ZXIgZ290IGRvbmUg
Y29ycmVjdGx5Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICAgCQlhc3RfY3J0Y19s
b2FkX2x1dChhc3QsIGNydGMpOw0KPiAgIAkJYnJlYWs7DQo+ICAgCWNhc2UgRFJNX01PREVf
RFBNU19TVEFOREJZOg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcg
TsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------BuFEjBzlmpJjnp2kJrzwpvb0--

--------------4jmKQJFQIe0YhibLbUIvrwC4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmK1aEcFAwAAAAAACgkQlh/E3EQov+Dd
dRAAzNSRoc/gY+qJwiAv6r5J68AHnkqx45o+OZ8/OdKCcfuEn3mCXc4RDWDwhNaXCAugd2nlls2B
/76jM/33SWZ2sLOcdAeTZIFS5+ca28fZG1yuJlrbQ/8wCwWxWHX0E+tgWKY5IeqXWQsytf4pRSk2
DzxWYilVNBtQDoFV5xCyiYbqbKhra9YAgOnFZIiFMhvDSN7AfE8JABvnBQbWLIKo1vBk5MMFbVFG
aNpNm5G0RcBSmhUK43Do3K5A7+ZEk3228AdyHiGA0ckPwVQFY4RgK+QvkweBm6JxVwge4BmG2AiK
yV6ohQvLk569pXjU9WaIBd3ACqxoy0dmbh6/HJoUOq7AUavod6SP1kIk4PTFZT5+7VrWnQGTAAHB
Cy7SKsqcfrg2ZIMDrJEV/ima7qS3yEsHF00jZHMhS0nJxhp+ERu4y9FoWp1EeWHvxsxpgbP+MuNV
pI8SDo0YVebJyQSbf9osldrlOVw8j4PraRtHhqTh6SJl21YPtkOmF1AnOC+bk8rn8x24LS0dvhlJ
pUqp/F3YbC3ozoefbRXqH9HFAqnps1Qu5TmVIMeyGnrcWqoeEJ4DZtm/KDCvGpisL7PN05swiMEW
B376lrW1Ci2L0L/CAZ1X7laqwp+nHnqGv2USoQ/Gd+897WOaTKEvIN6FLY4Ar7d8v0oczmlySOjy
aIE=
=tyUp
-----END PGP SIGNATURE-----

--------------4jmKQJFQIe0YhibLbUIvrwC4--

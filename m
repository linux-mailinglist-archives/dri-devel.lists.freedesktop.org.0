Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F035755753C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 10:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90F311A189;
	Thu, 23 Jun 2022 08:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB9011A187
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 08:21:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DB7391FB3F;
 Thu, 23 Jun 2022 08:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655972458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p/SDUEi7R1xRDXOKyJGcoe5/l/TJKXT0EOiP5opbGu8=;
 b=Mxve+tGdbIiAvBIrJWhTxaVyNIPJFHoZ8XJiF5GX6qtIWpEB9jr9/KZNKgdR8/iMi9FZmr
 ZUlM6y1tanYflq7Qs1XNWT9w8wNaJOWo2mdY3t1pfg6nZMU81+mSFtY3rfmvTlBh0tsrwb
 KBhWqbd5gFNYuwa7UUpg01m6KvdmOqs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655972458;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p/SDUEi7R1xRDXOKyJGcoe5/l/TJKXT0EOiP5opbGu8=;
 b=VON8RrMJQFjxSdqowKBNL0VzMwwt4ZIcUgVKZGg9ejlqXat4U1rMdaFb06UHqZHeiysZ4h
 Wci013pfWi+/gBCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AD5E9133A6;
 Thu, 23 Jun 2022 08:20:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Lpc5KWoitGL4AQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 23 Jun 2022 08:20:58 +0000
Message-ID: <914e5062-3647-aed7-e3b4-9e6945ef443b@suse.de>
Date: Thu, 23 Jun 2022 10:20:58 +0200
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
 boundary="------------L8fZQ0ofevwCT3wkPnnzlTeh"
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
--------------L8fZQ0ofevwCT3wkPnnzlTeh
Content-Type: multipart/mixed; boundary="------------RcCEZEnG04Rs0s105xMNhNqk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 kuohsiang_chou@aspeedtech.com
Cc: Venkat Tadikonda <venkateswara.rao@intel.com>,
 hungju_huang@aspeedtech.com, michel@daenzer.net,
 charles_kuan@aspeedtech.com, luke_chen@aspeedtech.com
Message-ID: <914e5062-3647-aed7-e3b4-9e6945ef443b@suse.de>
Subject: Re: [PATCH] drm/ast: Fix black screen when getting out of suspend
References: <20220622124815.356035-1-jfalempe@redhat.com>
In-Reply-To: <20220622124815.356035-1-jfalempe@redhat.com>

--------------RcCEZEnG04Rs0s105xMNhNqk
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
a29uZGEgPHZlbmthdGVzd2FyYS5yYW9AaW50ZWwuY29tPg0KDQpXaXRoIHRoZSBzbWFsbCBm
aXhlcyB0aGF0IEx5dWRlIG1lbnRpb25lZDoNCg0KQWNrZWQtYnk6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+
IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyB8IDEzICsrKysrKysr
KysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hc3QvYXN0X21vZGUuYw0KPiBpbmRleCAzZWI5YWZlY2Q5ZDQuLmNkZGRjYjVjNDQz
OSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYw0KPiBAQCAtOTkwLDYgKzk5MCw5
IEBAIHN0YXRpYyB2b2lkIGFzdF9jcnRjX2RwbXMoc3RydWN0IGRybV9jcnRjICpjcnRjLCBp
bnQgbW9kZSkNCj4gICB7DQo+ICAgCXN0cnVjdCBhc3RfcHJpdmF0ZSAqYXN0ID0gdG9fYXN0
X3ByaXZhdGUoY3J0Yy0+ZGV2KTsNCj4gICAJdTggY2ggPSBBU1RfRFBNU19WU1lOQ19PRkYg
fCBBU1RfRFBNU19IU1lOQ19PRkY7DQo+ICsJc3RydWN0IGFzdF9jcnRjX3N0YXRlICphc3Rf
c3RhdGU7DQo+ICsJY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqZm9ybWF0Ow0KPiAr
CXN0cnVjdCBhc3RfdmJpb3NfbW9kZV9pbmZvICp2Ymlvc19tb2RlX2luZm87DQo+ICAgDQo+
ICAgCS8qIFRPRE86IE1heWJlIGNvbnRyb2wgZGlzcGxheSBzaWduYWwgZ2VuZXJhdGlvbiB3
aXRoDQo+ICAgCSAqICAgICAgIFN5bmMgRW5hYmxlIChiaXQgQ1IxNy43KS4NCj4gQEAgLTEw
MDcsNiArMTAxMCwxNiBAQCBzdGF0aWMgdm9pZCBhc3RfY3J0Y19kcG1zKHN0cnVjdCBkcm1f
Y3J0YyAqY3J0YywgaW50IG1vZGUpDQo+ICAgCQkJYXN0X2RwX3NldF9vbl9vZmYoY3J0Yy0+
ZGV2LCAxKTsNCj4gICAJCX0NCj4gICANCj4gKwkJYXN0X3N0YXRlID0gdG9fYXN0X2NydGNf
c3RhdGUoY3J0Yy0+c3RhdGUpOw0KPiArCQlmb3JtYXQgPSBhc3Rfc3RhdGUtPmZvcm1hdDsN
Cj4gKw0KPiArCQlpZiAoZm9ybWF0KXsNCj4gKwkJCXZiaW9zX21vZGVfaW5mbyA9ICZhc3Rf
c3RhdGUtPnZiaW9zX21vZGVfaW5mbzsNCj4gKw0KPiArCQkJYXN0X3NldF9jb2xvcl9yZWco
YXN0LCBmb3JtYXQpOw0KPiArCQkJYXN0X3NldF92Ymlvc19jb2xvcl9yZWcoYXN0LCBmb3Jt
YXQsIHZiaW9zX21vZGVfaW5mbyk7DQo+ICsJCX0NCj4gKw0KPiAgIAkJYXN0X2NydGNfbG9h
ZF9sdXQoYXN0LCBjcnRjKTsNCj4gICAJCWJyZWFrOw0KPiAgIAljYXNlIERSTV9NT0RFX0RQ
TVNfU1RBTkRCWToNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhm
ZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7D
vHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------RcCEZEnG04Rs0s105xMNhNqk--

--------------L8fZQ0ofevwCT3wkPnnzlTeh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmK0ImoFAwAAAAAACgkQlh/E3EQov+Cq
3hAAlZytWfyXzzklYdtyQjxCjF6yMDt9cNuD1dM5B1q7GZcmGRuq8OBnprPZ8FPA7i5e6uZDiSip
68G/nrRT364fNypjWyubjCA0lP1GaBS5ZRSGfE5nuWIvtHGrCXzubW0UA5DUo15PNE6XOV8z6k2S
vXb6ukOyuK2qvxkBpXe22J80HovZFbNuq7jPbyP9hlCVncdQvZ7EChSk0b1xg9j8540Jw7ZIfR7E
0+zMX+cVJUV9p/JUDvtTpsQV0K1R7PZfAtgYRm3ADOs2/f1GDwSAsM11y0K/+8rtvFVuiYJhaPIe
sUovES5+GWRwrPXn4WLFQCg/xU/0Fd+ccrJN526eR+Dsx2/2IvPowlPB8ZVBLt4DOCJzETCJilnZ
aHiB+Hpj4N7wmB4l2sObYb+ojG/7BKOoI20T1YpXchqHXSbdyAdxL8mPW40aFjfoqJiKEwiasW3b
F3gG1UtjsW/DoyLse0F7NCmVGfVdQ755R4FbWtH00PVEn5IxeUc3gRvzqmPW0QxPahYrkMTr0xNL
9TFuCcSYWdg5QgOW2uIFYFJBXH0pET/UFXMf+z1NkOYRWGvwdE2u6UAjbxfvrWrvSIFl8ksqKUbw
lnijiBQs++92Ky92GHGZ9fVgbFfOImpf22Ozzid7wUdk9QKFS8Re8qKw0W/fAhEelqhpaIq7hWUm
ilo=
=DHtr
-----END PGP SIGNATURE-----

--------------L8fZQ0ofevwCT3wkPnnzlTeh--

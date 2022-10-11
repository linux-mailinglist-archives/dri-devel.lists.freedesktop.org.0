Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 597C65FB5D4
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 16:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BE110E821;
	Tue, 11 Oct 2022 14:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FCA10E087
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 14:59:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 714FC20150;
 Tue, 11 Oct 2022 14:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665500370; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ht0pV9CPxzKVOtW/OM7Gl5TR0d0l9JG3vyhsy/OftnU=;
 b=N6r8jPEcjPegYJtyIEHYJbZltqBY5kV3cmFZlHtYQTAzzK24bavHvp5F9ZhnaVWNXx6onu
 1h55lyWdKty6ujHCTDOFesexfSi3fSWeIN9zm3rcpKi7FbORoaZINzlIGJO3tgVa+DtUQW
 5f2Lz46zLBza+Mbqagv44LGfcjv4vbc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665500370;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ht0pV9CPxzKVOtW/OM7Gl5TR0d0l9JG3vyhsy/OftnU=;
 b=u8Ul2r95hP6coNsgKmTYneYNgcaI/RD9QD/5Z+cgMFPs+YWUC7OU8T1PjzZyKqP0AoadvC
 JqWmCH1ZtLtMzgBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 30EC8139ED;
 Tue, 11 Oct 2022 14:59:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Ath0CtKERWMDSQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Oct 2022 14:59:30 +0000
Message-ID: <1f29c829-fcca-eec6-50c8-0a35d7c31599@suse.de>
Date: Tue, 11 Oct 2022 16:59:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 8/8] drm/ast: Avoid reprogramming primary-plane scanout
 address
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 daniel@ffwll.ch, kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 ilpo.jarvinen@cs.helsinki.fi
References: <20221010103625.19958-1-tzimmermann@suse.de>
 <20221010103625.19958-9-tzimmermann@suse.de>
 <73eb1f19-5900-a758-bf80-38cbd69395e6@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <73eb1f19-5900-a758-bf80-38cbd69395e6@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YhRXoz2tkz3VZedXTxi2hTL1"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YhRXoz2tkz3VZedXTxi2hTL1
Content-Type: multipart/mixed; boundary="------------n2H80niXdCqhpRsEHq69UmDJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 daniel@ffwll.ch, kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 ilpo.jarvinen@cs.helsinki.fi
Cc: dri-devel@lists.freedesktop.org
Message-ID: <1f29c829-fcca-eec6-50c8-0a35d7c31599@suse.de>
Subject: Re: [PATCH 8/8] drm/ast: Avoid reprogramming primary-plane scanout
 address
References: <20221010103625.19958-1-tzimmermann@suse.de>
 <20221010103625.19958-9-tzimmermann@suse.de>
 <73eb1f19-5900-a758-bf80-38cbd69395e6@redhat.com>
In-Reply-To: <73eb1f19-5900-a758-bf80-38cbd69395e6@redhat.com>

--------------n2H80niXdCqhpRsEHq69UmDJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMTAuMjIgdW0gMTY6MjEgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IE9uIDEwLzEwLzIwMjIgMTI6MzYsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gU29t
ZSBBU1QtYmFzZWQgQk1DcyBzdG9wIGRpc3BsYXkgb3V0cHV0IGZvciB1cCB0byA1IHNlY29u
ZHMgYWZ0ZXINCj4+IHJlcHJvZ3JhbW1pbmcgdGhlIHNjYW5vdXQgYWRkcmVzcy4gQXMgdGhl
IGFkZHJlc3MgaXMgZml4ZWQsIGF2b2lkDQo+PiByZS1zZXR0aW5nIHRoZSBhZGRyZXNzJyB2
YWx1ZS4NCj4+DQo+PiBSZXBvcnRlZC1ieTogSm9jZWx5biBGYWxlbXBlIDxqZmFsZW1wZUBy
ZWRoYXQuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+DQo+PiAtLS0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0
X21vZGUuYyB8IDEyICsrKysrKysrKystLQ0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEwIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyANCj4+IGIvZHJpdmVycy9ncHUvZHJtL2FzdC9h
c3RfbW9kZS5jDQo+PiBpbmRleCAxYjk5MTY1ODI5MGIuLjU0YTk2NDNkODZjZSAxMDA2NDQN
Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYw0KPj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jDQo+PiBAQCAtNjcyLDkgKzY3MiwxNyBAQCBz
dGF0aWMgdm9pZCANCj4+IGFzdF9wcmltYXJ5X3BsYW5lX2hlbHBlcl9hdG9taWNfdXBkYXRl
KHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KPj4gwqDCoMKgwqDCoCB9DQo+PiDCoMKgwqDC
oMKgIGFzdF9zZXRfb2Zmc2V0X3JlZyhhc3QsIGZiKTsNCj4+IC3CoMKgwqAgYXN0X3NldF9z
dGFydF9hZGRyZXNzX2NydDEoYXN0LCAodTMyKWFzdF9wbGFuZS0+b2Zmc2V0KTsNCj4+IC3C
oMKgwqAgYXN0X3NldF9pbmRleF9yZWdfbWFzayhhc3QsIEFTVF9JT19TRVFfUE9SVCwgMHgx
LCAweGRmLCAweDAwKTsNCj4+ICvCoMKgwqAgLyoNCj4+ICvCoMKgwqDCoCAqIFNvbWUgQk1D
cyBzdG9wIHNjYW5uaW5nIG91dCB0aGUgdmlkZW8gc2lnbmFsIGFmdGVyIHRoZSBkcml2ZXIN
Cj4+ICvCoMKgwqDCoCAqIHJlcHJvZ3JhbW1lZCB0aGUgc2Nhbm91dCBhZGRyZXNzLiBUaGlz
IHN0YWxscyBkaXNwbGF5IG91dHB1dA0KPj4gK8KgwqDCoMKgICogZm9yIHNldmVyYWwgc2Vj
b25kcyBhbmQgbWFrZXMgdGhlIGRpc3BsYXkgdW51c2FibGUuIFRoZXJlZm9yZQ0KPj4gK8Kg
wqDCoMKgICogb25seSByZXByb2dyYW0gdGhlIGFkZHJlc3MgYWZ0ZXIgZW5hYmxpbmcgdGhl
IHBsYW5lLg0KPj4gK8KgwqDCoMKgICovDQo+PiArwqDCoMKgIGlmICghb2xkX2ZiICYmIGZi
KSB7DQo+PiArwqDCoMKgwqDCoMKgwqAgYXN0X3NldF9zdGFydF9hZGRyZXNzX2NydDEoYXN0
LCAodTMyKWFzdF9wbGFuZS0+b2Zmc2V0KTsNCj4+ICvCoMKgwqDCoMKgwqDCoCBhc3Rfc2V0
X2luZGV4X3JlZ19tYXNrKGFzdCwgQVNUX0lPX1NFUV9QT1JULCAweDEsIDB4ZGYsIDB4MDAp
Ow0KPj4gK8KgwqDCoCB9DQo+PiDCoCB9DQo+IA0KPiBJJ3ZlIHRlc3RlZCB0aGUgc2VyaWVz
LCBhbmQgQk1DIGlzIHN0aWxsIHZlcnkgc2xvdyB3aXRoIEdub21lL1dheWxhbmQuDQo+IA0K
PiBJdCdzIGJlY2F1c2UgYXN0X3NldF9vZmZzZXRfcmVnKCkgYWxzbyB0cmlnZ2VyIGEgNXMg
ZnJlZXplIG9mIHRoZSBCTUMuDQo+IA0KPiBJIGFkZGVkIHRoaXMsIGFuZCBpdCB3b3JrcyB3
ZWxsOg0KPiANCj4gaWYgKCFvbGRfZmIgfHwgb2xkX2ZiLT5waXRjaGVzWzBdICE9IGZiLT5w
aXRjaGVzWzBdKQ0KPiAgwqDCoMKgIGFzdF9zZXRfb2Zmc2V0X3JlZyhhc3QsIGZiKTsNCg0K
R3JlYXQgdGhhbmtzIGZvciB0ZXN0aW5nLiBJJ2xsIGFkZCB0aGlzIHRvIHRoZSBuZXh0IHZl
cnNpb24uDQoNCkkgd29uZGVyIGlmIHRoYXQgcHJvYmxlbSBpcyBpbiBhbGwgYXN0IGNoaXBz
IG9yIGp1c3QgdGhpcyBvbmUuIDovDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+
IA0KPj4gwqAgc3RhdGljIHZvaWQgYXN0X3ByaW1hcnlfcGxhbmVfaGVscGVyX2F0b21pY19k
aXNhYmxlKHN0cnVjdCBkcm1fcGxhbmUgDQo+PiAqcGxhbmUsDQo+IA0KPiANCj4gDQo+IA0K
DQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkw
NDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2Vz
Y2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------n2H80niXdCqhpRsEHq69UmDJ--

--------------YhRXoz2tkz3VZedXTxi2hTL1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNFhNEFAwAAAAAACgkQlh/E3EQov+Dk
rQ//dVA85SuFxPhJ0Wd0MvFNey9iukPOHD9NcO4boyKiO86YoSWcDFSAeQD4m2VAT9pm0NmctY7y
2GanOtyhUqjkSn1aCw5lPqQOX9Ptk4DP3t66Jdf0WheLLhPP7WdD4TXJy6aeutqEDC3bypvAf3I+
4cazRJM4uo+xmClULXaHI/7N7I5OCtGqMfrER1rmigYAGLEwoWH57UGQEU/yq6h8wchk6W1t43xQ
W1YB6c+xys/V+VW4MuAFauTu/Vt2U5RLqx8r5/cHIhRJ+JrXFqkPPU+P91DHnhLmv626SL5nB9Wo
sPSJxKHgqeHOe8bUVfdcnk2iwQ5I8a+JyBFikt3uMku+iESkOVHqWwisFoCIOhMYscqsdQ5ShxKX
8sRiDitXnfWbzS3v2/fKbriOahuDpcRg7sTAQfX6wHapAgn1dIQkooXyRq9DjqEZWCpUfSg0b77W
rD22PbCSXB06Ep8VW+Cc1w2bqSS5TtzsIdpuxyaFaBNFE7apxg18IIwREHNdC7x1bw73Xq3C7aSX
4G/18yeH4wn0YcSj/tUsHFx2IE+Hx1vZ6BWsm3f4WNRFRlII8MADuGjEkJMrtZDJyA03kV8Qx+fU
nzXj6sU9pcAo7GzHfC1mXpbNl7EfMOCVf3bXEyZa+Dx8XwLlGlppUFucNFjwcxjiquie50fG3m9u
QR0=
=Az4w
-----END PGP SIGNATURE-----

--------------YhRXoz2tkz3VZedXTxi2hTL1--

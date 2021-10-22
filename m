Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4276437769
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 14:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0E16ED82;
	Fri, 22 Oct 2021 12:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A9F6ED82
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 12:50:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BB88E21987;
 Fri, 22 Oct 2021 12:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634906998; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BiWtDBKtsfoffHAX2HzgkG+VhLk/jg095GQlHHeB6cA=;
 b=gxueBIlv4mE5oZXdxd4ZOC1NZpObPbH7Siy+hL0ZjNF5173HyOHDfPnyILTsIkdCwA09Ue
 iQzXZTk0wVzgaycoMvRGgqRdPoN75yUC3CPCG1sMQa0hSSNehsr9Ns6LrkPQXs3vKz17bB
 5WZLCg6ol1tDqCOULYO0dNCzmu3s090=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634906998;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BiWtDBKtsfoffHAX2HzgkG+VhLk/jg095GQlHHeB6cA=;
 b=inN93mQcvTnwhHJUybYgXyyMpsFHTGupGiW35d6nUOzfVUnzg/fbFIhvkmqqR2zHb4LMfz
 h7GpUZtTxdrfCwDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9957B13CDA;
 Fri, 22 Oct 2021 12:49:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QdvJI3azcmFtTAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 22 Oct 2021 12:49:58 +0000
Message-ID: <a19a6412-edba-e120-d9e6-0d70455bf567@suse.de>
Date: Fri, 22 Oct 2021 14:49:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Linux >= 5.14.12 and 5.15-rc5 fail to show anything on the screen
 with CONFIG_DRM_SIMPLEDRM=y
Content-Language: en-US
To: "Artem S. Tashkinov" <aros@gmx.com>, dri-devel@lists.freedesktop.org
Cc: Joshua Strobl <joshua@stroblindustries.com>, Arnd Bergmann <arnd@arndb.de>
References: <488e87e6-00af-d514-dc95-25bce5160eda@gmx.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <488e87e6-00af-d514-dc95-25bce5160eda@gmx.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------C0Ws86293TDY2SWfZel0RfHM"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------C0Ws86293TDY2SWfZel0RfHM
Content-Type: multipart/mixed; boundary="------------HeFDLpqqMKj3Zh6NBmwRVvH8";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "Artem S. Tashkinov" <aros@gmx.com>, dri-devel@lists.freedesktop.org
Cc: Joshua Strobl <joshua@stroblindustries.com>, Arnd Bergmann <arnd@arndb.de>
Message-ID: <a19a6412-edba-e120-d9e6-0d70455bf567@suse.de>
Subject: Re: Linux >= 5.14.12 and 5.15-rc5 fail to show anything on the screen
 with CONFIG_DRM_SIMPLEDRM=y
References: <488e87e6-00af-d514-dc95-25bce5160eda@gmx.com>
In-Reply-To: <488e87e6-00af-d514-dc95-25bce5160eda@gmx.com>

--------------HeFDLpqqMKj3Zh6NBmwRVvH8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjIuMTAuMjEgdW0gMTQ6MTUgc2NocmllYiBBcnRlbSBTLiBUYXNoa2lub3Y6
DQo+IEhlbGxvLA0KPiANCj4gS2VybmVsIDUuMTQuMTIgaW50cm9kdWNlZCB0aGlzIGNoYW5n
ZSwgZ2l0IGNvbW1pdA0KPiBlYzdjYzNmNzRiNDIzNjg2MGNlNjEyNjU2YWE1YmU3OTM2ZDFj
NTk0Og0KPiANCj4gLS0tIGEvbGludXgtNS4xNC4xMS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L0tj
b25maWcNCj4gKysrIGIvbGludXgtNS4xNC4xMi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25m
aWcNCj4gQEAgLTIxOTEsOCArMjE5MSw5IEBAIGNvbmZpZyBGQl9IWVBFUlYNCj4gIMKgwqDC
oMKgwqAgVGhpcyBmcmFtZWJ1ZmZlciBkcml2ZXIgc3VwcG9ydHMgTWljcm9zb2Z0IEh5cGVy
LVYgU3ludGhldGljIFZpZGVvLg0KPiANCj4gIMKgY29uZmlnIEZCX1NJTVBMRQ0KPiAtwqDC
oCBib29sICJTaW1wbGUgZnJhbWVidWZmZXIgc3VwcG9ydCINCj4gLcKgwqAgZGVwZW5kcyBv
biAoRkIgPSB5KSAmJiAhRFJNX1NJTVBMRURSTQ0KPiArwqDCoCB0cmlzdGF0ZSAiU2ltcGxl
IGZyYW1lYnVmZmVyIHN1cHBvcnQiDQo+ICvCoMKgIGRlcGVuZHMgb24gRkINCj4gK8KgwqAg
ZGVwZW5kcyBvbiAhRFJNX1NJTVBMRURSTQ0KPiAgwqDCoMKgIHNlbGVjdCBGQl9DRkJfRklM
TFJFQ1QNCj4gIMKgwqDCoCBzZWxlY3QgRkJfQ0ZCX0NPUFlBUkVBDQo+ICDCoMKgwqAgc2Vs
ZWN0IEZCX0NGQl9JTUFHRUJMSVQNCj4gDQo+IA0KPiBIb3dldmVyIGlmIHlvdSBlbmFibGUg
Q09ORklHX0RSTV9TSU1QTEVEUk09eSBhbG9uZyB3aXRoIGl0LCB0aGUgc3lzdGVtDQo+IHdp
bGwgc2hvdyBhIGJsYWNrIHNjcmVlbiBvbiBib290IHdoaWxlIGxvZ2dpbmcgdGhlc2UgbWVz
c2FnZXM6DQo+IA0KPiBbZHJtXSBJbml0aWFsaXplZCBzaW1wbGVkcm0gMS4wLjAgMjAyMDA2
MjUgZm9yIHNpbXBsZS1mcmFtZWJ1ZmZlci4wIG9uDQo+IG1pbm9yIDANCj4gc2ltcGxlLWZy
YW1lYnVmZmVyIHNpbXBsZS1mcmFtZWJ1ZmZlci4wOiBbZHJtXSAqRVJST1IqIGZiZGV2OiBG
YWlsZWQgdG8NCj4gc2V0dXAgZ2VuZXJpYyBlbXVsYXRpb24gKHJldD0tMjIpDQo+IGZiY29u
OiBUYWtpbmcgb3ZlciBjb25zb2xlDQo+IA0KPiANCj4gV2hlbiBDT05GSUdfRFJNX1NJTVBM
RURSTSBpcyBkaXNhYmxlZCBpdCBwcm9jZWVkcyB0byBib290IG5vcm1hbGx5Og0KPiANCj4g
c2ltcGxlLWZyYW1lYnVmZmVyIHNpbXBsZS1mcmFtZWJ1ZmZlci4wOiBmcmFtZWJ1ZmZlciBh
dCAweGUxMDAwMDAwLA0KPiAweDMwMDAwMCBieXRlcw0KPiBzaW1wbGUtZnJhbWVidWZmZXIg
c2ltcGxlLWZyYW1lYnVmZmVyLjA6IGZvcm1hdD1hOHI4ZzhiOCwNCj4gbW9kZT0xMDI0eDc2
OHgzMiwgbGluZWxlbmd0aD00MDk2DQo+IGZiY29uOiBEZWZlcnJpbmcgY29uc29sZSB0YWtl
LW92ZXINCj4gc2ltcGxlLWZyYW1lYnVmZmVyIHNpbXBsZS1mcmFtZWJ1ZmZlci4wOiBmYjA6
IHNpbXBsZWZiIHJlZ2lzdGVyZWQhDQo+IA0KPiANCj4gVGhpcyBpcyBkaXNjdXNzZWQgaGVy
ZTogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTQ3MjMN
Cj4gDQo+IEkgcmVhbGx5IGRvbid0IGtub3cgd2hhdCB0byBtYWtlIG9mIGl0IGJ1dCBJIGRl
ZmluaXRlbHkgZG9uJ3QgbGlrZSB0aGlzDQo+IHNpdHVhdGlvbi4NCg0KWW91IG1pZ2h0IG5l
ZWQgY29tbWl0IGI2OTNlNDI5MjFlMCAoImRybS9mYmRldjogQ2xhbXAgZmJkZXYgc3VyZmFj
ZSBzaXplIA0KaWYgdG9vIGxhcmdlIiksIHdoaWNoIGlzIG9ubHkgaW4gLXJjNi4NCg0KQWx0
ZXJuYXRpdmVseSwgbWFrZSBzdXJlIHRoYXQgZmJkZXYgb3ZlcmFsbG9jYXRpb24gaGFzIGJl
ZW4gZGlzYWJsZWQuIA0KVGhlIGNvbmZpZyB0aGF0IGlzIGF0dGFjaGVkIHRvIHRoYXQgYnVn
IHJlcG9ydCBpbmRpY2F0ZSB0aGF0IGl0J3MgZW5hYmxlZC4NCg0KICAgQ09ORklHX0RSTV9G
QkRFVl9PVkVSQUxMT0M9MzAwDQoNClRlbXBvcmFyaWx5IHNldCB0aGlzIHZhbHVlIHRvIDEw
MCBmb3Igbm93Lg0KDQpTb3JyeSBmb3IgYW55IHByb2JsZW1zIHdpdGggc2ltcGxlZHJtLiBJ
dCdzIHN0aWxsIG5ldyBhbmQgd2UncmUgZml4aW5nIA0KdGhlIGJ1ZyB0aGF0IGl0IGV4cG9z
ZXMuDQoNCkJUVywgeW91IGFsc28gaGF2ZSB0byBtYWtlIHlvdXIgYm9vdGxvYWRlciBwYXNz
IHRoZSBncmFwaGljcyBtb2RlIHRvIA0KTGludXguIChHUlVCX0dGWFBBWUxPQURfTElOVVg9
ImtlZXAiIGZvciBHUlVCIFsxXSkuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNClsxXSBo
dHRwczovL3d3dy5nbnUub3JnL3NvZnR3YXJlL2dydWIvbWFudWFsL2dydWIvaHRtbF9ub2Rl
L2dmeHBheWxvYWQuaHRtbA0KDQo+IA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBBcnRlbQ0K
DQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkw
NDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2Vz
Y2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcg0K

--------------HeFDLpqqMKj3Zh6NBmwRVvH8--

--------------C0Ws86293TDY2SWfZel0RfHM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFys3YFAwAAAAAACgkQlh/E3EQov+C+
bg/8D/sSnCYkq7vyeKJYVZw1TxLm6VkQoGGbLlp8BvjTkzwTNAgcLcTpJMwYJ5Eeg0aAhS5tSl1t
0xhT2b8PXTXTrOUntqNY6JG0An0uc2zw59xYXE8VidfLorOpc8QSoAgoxxX3K5HmznDc8aQUgy7z
Gx9EsxB3LkF1mqHC6X49ksDHOpgjCL8RlLbzmqSAKOWo8GcmwemiCSU653z379xpbwGJkmcse03D
gvD8bSEAjVwXa9xbWmVfkKDJqmjQvMvgr/w9T67ZyPXJRHwhjAut88y4MuhQbl5Ns8I6eWRuAHlA
OBaFvFRKdnUu8zGhxBNUduCs39GXhrdRQ5F1+tCcFsz6GgGZMq1itcdtPJC6IoA32EO7bL2ddaVs
/pZGjEIIh+X0TXQXfNe1v8KIa9Q/u3vTxWX6RQXcVnw8iQhdWSwdIMh89UWD9Awyihs3jX+iiXXa
xd/MieIY5lkNftDtoyi0EQ1X6HNWfDaVz3FmV7ynJ8JeeOT6s+lvvq7S7UdJ6FisI083qfmLjbjQ
97Dhr9Agkxy8Iuyu9sJVg6E9WZyV8mfY5JvETK5TNPySwlSrqEnO5F3ILHfFGsGTNCA2HW9PITm1
r1gmyifvWwT7vajRFzyruaM0NjnH5kCuW9yF9aLLDzuGcd5rhgVFDDLyojE1iM9rceknphMq2cMS
tLo=
=lq5z
-----END PGP SIGNATURE-----

--------------C0Ws86293TDY2SWfZel0RfHM--

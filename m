Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 756FB5ACB85
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 08:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84CF110E1DC;
	Mon,  5 Sep 2022 06:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C0C10E1C1
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 06:57:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9AD235FA65;
 Mon,  5 Sep 2022 06:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662361054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Du+MlP2Yl1ABAUJ9kkgAnwYcYjALA4LIxIbsigEof6M=;
 b=i/KAkOmivK5BZuthVnmMCMoTnoVEXDwjxeYb829YRhITj3Oh1sic0w1qxJXtF2fU14nyvf
 FlDo+vVzOKF/HKDSB3qmNFdmzZiLGQAH+UIeS39lLRKIFcwlGh3+7Fkje9NV5wddOa0CF0
 qPj9i+w/+XEC7tTjasrvsbKfIc/nk+g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662361054;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Du+MlP2Yl1ABAUJ9kkgAnwYcYjALA4LIxIbsigEof6M=;
 b=QALCGGTl9WDHcggn3ZAv7PRsS93kqFPYMa9C3WTj1PzvA9qlbdbwuLY/M6UAF7ve+58sg5
 8oKYtCANn0EGXOBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8A33B139C7;
 Mon,  5 Sep 2022 06:57:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /KTfIN6dFWNtYwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Sep 2022 06:57:34 +0000
Message-ID: <44b97fac-e879-e396-b8f2-f9459a5f913c@suse.de>
Date: Mon, 5 Sep 2022 08:57:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: mgag200 broken on kernel-6.0-rc3 on DELL/T620
Content-Language: en-US
To: Wang Yugui <wangyugui@e16-tech.com>
References: <20220902135242.2447.409509F4@e16-tech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220902135242.2447.409509F4@e16-tech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UM8pkqILa6GdZDzceZxhHLD7"
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UM8pkqILa6GdZDzceZxhHLD7
Content-Type: multipart/mixed; boundary="------------afWQ3cfDllIgPOkaJu5D0Rii";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Wang Yugui <wangyugui@e16-tech.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <44b97fac-e879-e396-b8f2-f9459a5f913c@suse.de>
Subject: Re: mgag200 broken on kernel-6.0-rc3 on DELL/T620
References: <20220902135242.2447.409509F4@e16-tech.com>
In-Reply-To: <20220902135242.2447.409509F4@e16-tech.com>

--------------afWQ3cfDllIgPOkaJu5D0Rii
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMDkuMjIgdW0gMDc6NTIgc2NocmllYiBXYW5nIFl1Z3VpOg0KPiBIaSwN
Cj4gDQo+IG1nYWcyMDAgYnJva2VuIG9uIGtlcm5lbC02LjAtcmMzIG9uIERFTEwvVDYyMC4N
Cj4gDQo+IFNlZSB0aGUgYXR0YWNoZW1lbnRtZW50IGZpbGUgZm9yIHRoZSBncmFwaCBvdXRw
dXQuDQoNClRoYW5rcyBmb3IgcmVwb3J0aW5nIHRoZSBidWcuIFdlIHJlY2VudGx5IHJlZmFj
dG9yZWQgc29tZSBjb2RlIG9mIHRoZSANCmRyaXZlci4gQ2FuIHlvdSBiaXNlY3QgdG8gdGhl
IGNoYW5nZSB0aGF0IGludHJvZHVjZWQgdGhlIHByb2JsZW0/DQoNCkJlc3QgcmVnYXJkcw0K
VGhvbWFzDQoNCj4gDQo+IFtyb290QFQ2MjAgfl0jIGRtZXNnICB8Z3JlcCAtaSAndmdhXHxt
Z2EnDQo+IFsgICAgMC41ODg5NDBdIENvbnNvbGU6IGNvbG91ciBWR0ErIDgweDI1DQo+IFsg
ICAgNC45MTgyMTRdIHBjaSAwMDAwOjBhOjAwLjA6IHZnYWFyYjogc2V0dGluZyBhcyBib290
IFZHQSBkZXZpY2UNCj4gWyAgICA0LjkxOTAyOF0gcGNpIDAwMDA6MGE6MDAuMDogdmdhYXJi
OiBicmlkZ2UgY29udHJvbCBwb3NzaWJsZQ0KPiBbICAgIDQuOTE5MDI4XSBwY2kgMDAwMDow
YTowMC4wOiB2Z2FhcmI6IFZHQSBkZXZpY2UgYWRkZWQ6IGRlY29kZXM9aW8rbWVtLG93bnM9
aW8rbWVtLGxvY2tzPW5vbmUNCj4gWyAgICA0Ljk0MTA1OF0gdmdhYXJiOiBsb2FkZWQNCj4g
WyAgICA5LjM4NTQ4NV0gbWdhZzIwMCAwMDAwOjBhOjAwLjA6IHZnYWFyYjogZGVhY3RpdmF0
ZSB2Z2EgY29uc29sZQ0KPiBbICAgIDkuNTEwNjg4XSBbZHJtXSBJbml0aWFsaXplZCBtZ2Fn
MjAwIDEuMC4wIDIwMTEwNDE4IGZvciAwMDAwOjBhOjAwLjAgb24gbWlub3IgMA0KPiBbICAg
IDkuNTIzMTQ1XSBmYmNvbjogbWdhZzIwMGRybWZiIChmYjApIGlzIHByaW1hcnkgZGV2aWNl
DQo+IFsgICAgOS42NDE1NDNdIG1nYWcyMDAgMDAwMDowYTowMC4wOiBbZHJtXSBmYjA6IG1n
YWcyMDBkcm1mYiBmcmFtZSBidWZmZXIgZGV2aWNlDQo+IA0KPiANCj4gbW9yZSBpbmZvOg0K
PiAxLCBUaGlzIERFTEwvVDYyMCB3b3JrcyB3ZWxsIHdpdGgga2VybmVsIDUuMTUuNjMsDQo+
ICAgICAgc28gdGhpcyBpcyBub3QgYSAgaGFyZHdhcmUgZXJyb3IuDQo+IA0KPiAyLCBERUxM
L1Q2NDAgd29ya3Mgd2VsbCB3aXRoIGtlcm5lbCA2LjAtcmMgYW5kIDUuMTUuNjMuDQo+ICAg
ICAgYm90aCBERUxML1Q2MjAgYW5kIERFTEwvVDY0MCB1c2UgdGhlIGRyaXZlciAnbWdhZzIw
MCcuDQo+IA0KPiBbcm9vdEBUNjQwIH5dIyAgZG1lc2cgIHxncmVwIC1pICd2Z2FcfG1nYScN
Cj4gWyAgIDEwLjE2MTUwMF0gcGNpIDAwMDA6MDM6MDAuMDogdmdhYXJiOiBzZXR0aW5nIGFz
IGJvb3QgVkdBIGRldmljZQ0KPiBbICAgMTAuMTYyNDYzXSBwY2kgMDAwMDowMzowMC4wOiB2
Z2FhcmI6IFZHQSBkZXZpY2UgYWRkZWQ6IGRlY29kZXM9aW8rbWVtLG93bnM9aW8rbWVtLGxv
Y2tzPW5vbmUNCj4gWyAgIDEwLjE3NjUyN10gcGNpIDAwMDA6MDM6MDAuMDogdmdhYXJiOiBi
cmlkZ2UgY29udHJvbCBwb3NzaWJsZQ0KPiBbICAgMTAuMTgyNDY1XSB2Z2FhcmI6IGxvYWRl
ZA0KPiBbICAgMTEuODMyODM5XSBmYjA6IEVGSSBWR0EgZnJhbWUgYnVmZmVyIGRldmljZQ0K
PiBbICAgMjEuMzAzODI2XSBtZ2FnMjAwIDAwMDA6MDM6MDAuMDogdmdhYXJiOiBkZWFjdGl2
YXRlIHZnYSBjb25zb2xlDQo+IFsgICAyMS4zMTk0OThdIFtkcm1dIEluaXRpYWxpemVkIG1n
YWcyMDAgMS4wLjAgMjAxMTA0MTggZm9yIDAwMDA6MDM6MDAuMCBvbiBtaW5vciAwDQo+IFsg
ICAyMS4zMzAyMjNdIGZiY29uOiBtZ2FnMjAwZHJtZmIgKGZiMCkgaXMgcHJpbWFyeSBkZXZp
Y2UNCj4gWyAgIDIxLjMzMjE0MF0gbWdhZzIwMCAwMDAwOjAzOjAwLjA6IFtkcm1dIGRybV9w
bGFuZV9lbmFibGVfZmJfZGFtYWdlX2NsaXBzKCkgbm90IGNhbGxlZA0KPiBbICAgMjEuNzQx
NjI5XSBtZ2FnMjAwIDAwMDA6MDM6MDAuMDogW2RybV0gZmIwOiBtZ2FnMjAwZHJtZmIgZnJh
bWUgYnVmZmVyIGRldmljZQ0KPiANCj4gQmVzdCBSZWdhcmRzDQo+IFdhbmcgWXVndWkgKHdh
bmd5dWd1aUBlMTYtdGVjaC5jb20pDQo+IDIwMjIvMDkvMDINCj4gDQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJn
LCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJl
cjogSXZvIFRvdGV2DQo=

--------------afWQ3cfDllIgPOkaJu5D0Rii--

--------------UM8pkqILa6GdZDzceZxhHLD7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMVnd4FAwAAAAAACgkQlh/E3EQov+CA
yhAAqZ1yOlZoVsQU571eJySV4p6KJOrAgR/JJgkN3jCai0jcxYikf674JabbeIdP5n353lxOjlMa
qAnhIwaD084Q05Vh01i9poyVS2C2smhUJiLzXyqc/ZiAjSt9XD1XT+3rdMSdnGaI4LaaJX4I33gU
LiS+dsSR139Xowa2AIainCR/cuWSehSibvyi45/9QRQ5Oaa0Pylb1QqnqL11MHdHwnBp6aUO3A3O
GMrKUXjw0q56EOjwrFnPN1HogcCRYmnFz2f40vMxQe1yBP516zi5aUHDa8wfofxtFysG5FIl7MPC
xht2yPKYDgiljGT8tIPIrE3DZPoblI7gxGRA7gANcSV64LjMHAeEBZp1q70cA5oskjBqAN71rIhK
6+ytlOYAqs1NEG7/+Yt6oFEB2NMUUorceQ8g6Tr8ZCueYNhiBLbThzSXN3qbuk3BO6qqQtcW/MHA
h28dMa1bd4xnq3xtLVDxy5dXSb4KMBjmgAgqLW/0wbThbqOLkhFl/LOZDH3jKaZ+6p2PQs9SpZNO
P0SV3AD77aoRnWvcuLsicdM5BE0aMLPH2FYHKBMbYEzaswQEVLvW0ea5IqYlApDegOKAWNxAwJ5o
Z/y+HZAWAaM/m+rYWGH17X6UgQZH2LaNqRpxbjALLvy7IyasG/6pSfhF1isQ9USGGzQfBcz5iQqS
MQc=
=DRaX
-----END PGP SIGNATURE-----

--------------UM8pkqILa6GdZDzceZxhHLD7--

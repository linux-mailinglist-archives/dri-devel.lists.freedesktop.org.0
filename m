Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCFD557523
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 10:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6981E113C47;
	Thu, 23 Jun 2022 08:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F43113626
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 08:13:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8E3F31FB42;
 Thu, 23 Jun 2022 08:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655972036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aVJweXdz9Jf/NVEgCyaFEqirlfoYOjh6Fl7CRM17eqg=;
 b=z/2fHE9Vhjo5lsBQhdQxp70kwGuZMxrAx7ktHeJzRtsjQo5A4AT8s4DuIcHqV18TGNjvz0
 hjQziUU4dDLTSNjBW5fOjC4ccC9yH85cQPwouSx9D1N3nyBMTRg23sDZmvB9GpWZHrD+oW
 S/OxO1vj1ZMAdiyBLHkrvdqf1s4NoEI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655972036;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aVJweXdz9Jf/NVEgCyaFEqirlfoYOjh6Fl7CRM17eqg=;
 b=7bTonw3Op5mC3r47udV9QcuK6VoYhDhv5oOs19KKiY4dgdRxg8Q/P99SdPAZ/9d0zdxQFe
 gVGP+aDkG+o4H5Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6C1DE133A6;
 Thu, 23 Jun 2022 08:13:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 08lzGcQgtGLCfAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 23 Jun 2022 08:13:56 +0000
Message-ID: <58e11013-01ab-8a2c-732e-860ae83a3df6@suse.de>
Date: Thu, 23 Jun 2022 10:13:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: DMA-buf and uncached system memory
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 lkml <linux-kernel@vger.kernel.org>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ferUzV1300awBJHgsRuRCOIj"
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
Cc: "Sharma, Shashank" <Shashank.Sharma@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ferUzV1300awBJHgsRuRCOIj
Content-Type: multipart/mixed; boundary="------------O8pK0OQ9gFlyUhIn2IOyy4Z1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 lkml <linux-kernel@vger.kernel.org>
Cc: "Sharma, Shashank" <Shashank.Sharma@amd.com>
Message-ID: <58e11013-01ab-8a2c-732e-860ae83a3df6@suse.de>
Subject: Re: DMA-buf and uncached system memory
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
In-Reply-To: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>

--------------O8pK0OQ9gFlyUhIn2IOyy4Z1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgQ2hyaXN0aWFuDQoNCkFtIDE1LjAyLjIxIHVtIDA5OjU4IHNjaHJpZWIgQ2hyaXN0aWFu
IEvDtm5pZzoNCj4gSGkgZ3V5cywNCj4gDQo+IHdlIGFyZSBjdXJyZW50bHkgd29ya2luZyBh
biBGcmVlc3luYyBhbmQgZGlyZWN0IHNjYW4gb3V0IGZyb20gc3lzdGVtIA0KPiBtZW1vcnkg
b24gQU1EIEFQVXMgaW4gQStBIGxhcHRvcHMuDQo+IA0KPiBPbiBwcm9ibGVtIHdlIHN0dW1i
bGVkIG92ZXIgaXMgdGhhdCBvdXIgZGlzcGxheSBoYXJkd2FyZSBuZWVkcyB0byBzY2FuIA0K
PiBvdXQgZnJvbSB1bmNhY2hlZCBzeXN0ZW0gbWVtb3J5IGFuZCB3ZSBjdXJyZW50bHkgZG9u
J3QgaGF2ZSBhIHdheSB0byANCj4gY29tbXVuaWNhdGUgdGhhdCB0aHJvdWdoIERNQS1idWYu
DQo+IA0KPiBGb3Igb3VyIHNwZWNpZmljIHVzZSBjYXNlIGF0IGhhbmQgd2UgYXJlIGdvaW5n
IHRvIGltcGxlbWVudCBzb21ldGhpbmcgDQo+IGRyaXZlciBzcGVjaWZpYywgYnV0IHRoZSBx
dWVzdGlvbiBpcyBzaG91bGQgd2UgaGF2ZSBzb21ldGhpbmcgbW9yZSANCj4gZ2VuZXJpYyBm
b3IgdGhpcz8NCg0KSSBoYWQgYSBwYXRjaHNldCBoZXJlIHRoYXQgZXh0ZW5kcyBpb3N5cy1t
YXAgKGZvcm1lciBkbWEtYnVmLW1hcCkgd2l0aCANCmNhY2hpbmcgaW5mb3JtYXRpb24uIEkn
bGwgcG9zdCBhIGNvcHkuDQoNClNvcnJ5IGZvciBiZWluZyBsYXRlIHRvIHJlcGx5Lg0KDQpC
ZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBBZnRlciBhbGwgdGhlIHN5c3RlbSBtZW1v
cnkgYWNjZXNzIHBhdHRlcm4gaXMgYSBQQ0llIGV4dGVuc2lvbiBhbmQgYXMgDQo+IHN1Y2gg
c29tZXRoaW5nIGdlbmVyaWMuDQo+IA0KPiBSZWdhcmRzLA0KPiBDaHJpc3RpYW4uDQo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QNCj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIu
IDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJn
KQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------O8pK0OQ9gFlyUhIn2IOyy4Z1--

--------------ferUzV1300awBJHgsRuRCOIj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmK0IMQFAwAAAAAACgkQlh/E3EQov+Bc
fw//WLTSrJpOVDrFBR41LD8rDtxfVvpqOjzLHsqJW7bfTLi4cu/fyp82KRogBgbw7DQ09R0IL7jo
gx6cYGc7sAxD69K+AJg6XdorFlkbfGAU5yS5pc3LqcuFlMKWti+LRuPaR7j0H+vKNkWYWRn9xBTJ
UBXiIfCFTRvnUZUJskn1ZhTt7gMf0ef9YQK+uG17qsMn7l50HI7HYc5tqOfzShFx1/daDfhtPfp/
zJt0adybMIeyzMGqUMFCxkVvsfB7Hr3Lt8wf9jwqeI1snM7RIXY7YBhObys4yieFhQY7ABTb34Iz
r8L6Sz4I/idplvoORvDlA3749ljNxwITnc1tVes1CDyAIQ5MMzE4qt3iryhbQAyHm25yqTvcDqCX
4eR8ozx0h39b+6j6RL8xJtPrhQc5IiU+HeuJooU6AVbZAuYIznWRpSp+t0/9yLgB7pNHMDfLAhZZ
+e1Fs4yUlgz6aQaw3d9edwIZLi/aRtXxejOrhULAbJyJLnQjhrx/Nvh6UYlgkHuHh5YtAGcAjZ8S
GIXVa3z5bTZkA/AWhseL+hMyXs9wNA4ut9bVfwWYCDpwGkVUQM+C/fUEsoVcBqguSKKAj3Gad+6m
dwuydLfeqCp5S6980FXloN+69T+tc2Gl+vT3KiICWfcox+B8efv3wZI9VPDELoDBc6p1IR3atvaW
7Js=
=fkQx
-----END PGP SIGNATURE-----

--------------ferUzV1300awBJHgsRuRCOIj--

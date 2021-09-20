Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E39411098
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 10:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDDFD6E419;
	Mon, 20 Sep 2021 08:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86426E415
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 08:01:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 41F3920040;
 Mon, 20 Sep 2021 08:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632124902; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K/Q48xVIUam769GlXZe8nYaK3Va5vJEREiL6lZZZ+8M=;
 b=1jnc3s261C+PZ8fyTONGQr6hUBaqpVsyR/ULOAJXzze59wsCJbM2wqBYi6CoQSNZPAq+Ln
 BFahLrR8Vq/3ACFXjRs0iKgU0O/pFHPj2MHoJMO/8TUFdcghEMJ+NlKjc+fnsygLOvC6w/
 nAPW0hg4eukRZWRpmYEjIttt3DVP+V8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632124902;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K/Q48xVIUam769GlXZe8nYaK3Va5vJEREiL6lZZZ+8M=;
 b=H2WoDc/lEg4MXnvzgV0M2GotLF+CaG5QQJdm0Q6v0e+0WAayuv1WddqcYDppFylBsC8kdb
 q/50pSed21obCZDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F2D3A13ACC;
 Mon, 20 Sep 2021 08:01:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4Tf4OeU/SGGFDQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Sep 2021 08:01:41 +0000
Message-ID: <70962c8d-ba1a-8c68-b509-393b6a2ecdca@suse.de>
Date: Mon, 20 Sep 2021 10:01:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH 0/5] lib: devres: Add managed helpers for write-combine
 setup
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, marcan@marcan.st, maz@kernel.org,
 akpm@linux-foundation.org, npiggin@gmail.com, thunder.leizhen@huawei.com,
 gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210916181601.9146-1-tzimmermann@suse.de>
 <9e5e73d1-bb7b-055f-8c48-a877a2e9c0fd@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <9e5e73d1-bb7b-055f-8c48-a877a2e9c0fd@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Vi0AU3w4scFb3TEYgp0ludRF"
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
--------------Vi0AU3w4scFb3TEYgp0ludRF
Content-Type: multipart/mixed; boundary="------------I7HspwuMO30IutpXRTmopKhv";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hans de Goede <hdegoede@redhat.com>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, marcan@marcan.st, maz@kernel.org,
 akpm@linux-foundation.org, npiggin@gmail.com, thunder.leizhen@huawei.com,
 gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <70962c8d-ba1a-8c68-b509-393b6a2ecdca@suse.de>
Subject: Re: [PATCH 0/5] lib: devres: Add managed helpers for write-combine
 setup
References: <20210916181601.9146-1-tzimmermann@suse.de>
 <9e5e73d1-bb7b-055f-8c48-a877a2e9c0fd@redhat.com>
In-Reply-To: <9e5e73d1-bb7b-055f-8c48-a877a2e9c0fd@redhat.com>

--------------I7HspwuMO30IutpXRTmopKhv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDkuMjEgdW0gMTY6NDcgc2NocmllYiBIYW5zIGRlIEdvZWRlOg0KPiBI
aSwNCj4gDQo+IE9uIDkvMTYvMjEgODoxNSBQTSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6
DQo+PiBBZGQgZGV2bV9hcmNoX3BoeXNfd2NfYWRkKCkgYW5kIGRldm1fYXJjaF9pb19yZXNl
cnZlX21lbXR5cGVfd2MoKSBmb3INCj4+IGF1dG9tYXRpYyBjbGVhbnVwIG9mIHdyaXRlY29t
YmluZSBzZXR1cC4NCj4+DQo+PiBTZXZlcmFsIERSTSBkcml2ZXJzIHVzZSB0aGUgbm9uLW1h
bmFnZWQgZnVuY3Rpb25zIGZvciBzZXR0aW5nIHRoZWlyDQo+PiBmcmFtZWJ1ZmZlciBtZW1v
cnkgdG8gd3JpdGUtY29tYmluZSBhY2Nlc3MuIENvbnZlcnQgYXN0LCBtZ2FnMjAwIGFuZA0K
Pj4gdmJveHZpZGVvLiBSZW1vdmUgcnNwIGNsZWFuLXVwIGNvZGUgZm9ybSBkcml2ZXJzLg0K
Pj4NCj4+IFRlc3RlZCBvbiBtZ2FnMjAwIGhhcmR3YXJlLg0KPj4NCj4+IFRob21hcyBaaW1t
ZXJtYW5uICg1KToNCj4+ICAgIGxpYjogZGV2cmVzOiBBZGQgbWFuYWdlZCBhcmNoX3BoeXNf
d2NfYWRkKCkNCj4+ICAgIGxpYjogZGV2cmVzOiBBZGQgbWFuYWdlZCBhcmNoX2lvX3Jlc2Vy
dmVfbWVtdHlwZV93YygpDQo+PiAgICBkcm0vYXN0OiBVc2UgbWFuYWdlZCBpbnRlcmZhY2Vz
IGZvciBmcmFtZWJ1ZmZlciB3cml0ZSBjb21iaW5pbmcNCj4+ICAgIGRybS9tZ2FnMjAwOiBV
c2UgbWFuYWdlZCBpbnRlcmZhY2VzIGZvciBmcmFtZWJ1ZmZlciB3cml0ZSBjb21iaW5pbmcN
Cj4+ICAgIGRybS92Ym94dmlkZW86IFVzZSBtYW5hZ2VkIGludGVyZmFjZXMgZm9yIGZyYW1l
YnVmZmVyIHdyaXRlIGNvbWJpbmluZw0KPiANCj4gVGhhbmtzLCB0aGUgZW50aXJlIHNlcmll
cyBsb29rcyBnb29kIHRvIG1lOg0KPiANCj4gUmV2aWV3ZWQtYnk6IEhhbnMgZGUgR29lZGUg
PGhkZWdvZWRlQHJlZGhhdC5jb20+DQo+IA0KPiBGb3IgdGhlIHNlcmllcy4NCg0KVGhhbmtz
LiBMZXQgbWUga25vdyBpZiBJIGNhbiByZXZpZXcgc29tZSBEUk0gY29kZSBmb3IgeW91LCBh
cyBEYW5pZWwgDQpzdWdnZXN0ZWQuDQoNCkknbGwgd2FpdCBhIGJpdCBiZWZvcmUgbWVyZ2lu
ZyB0aGUgcGF0Y2hlcy4gTWF5YmUgZGV2cmVzIGRldnMgd2FudCB0byANCmNvbW1lbnQuDQoN
CkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiBIYW5zDQo+
IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcg0K

--------------I7HspwuMO30IutpXRTmopKhv--

--------------Vi0AU3w4scFb3TEYgp0ludRF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFIP+QFAwAAAAAACgkQlh/E3EQov+Cq
MRAAyeiIEplPHJj9B+Aswn5Gur69MFyy4RT+aVg51zH/zheRJ6RzWWGsr9J5Ba4EnZqogkOiDRS8
yDqOa47XqMywjYogUVa5N5FxPJji+n0PN0QByGjpQ2BlQHWfoVhX31ora6hI+uQvT8HiVLLhKmqF
RTuHTQOYmMhaQckX3x6wB8++KZOVBbzRnFlYq7y07+7bWxWGzk0jc9bYvlEkyz8RomFy5tOeRykG
D3OweVIGXgtA3kh3Rgegp0W/apuJVMofp6BmXkg9lQ2JQhtPn56axvLB9SO+FabOkn+YVyA8BbES
lkbUdwIRRQQt6Ss+2aXpwwQEb67UvgSo8wNs46eRJte0QuGkeYRQS5WRHkXlxptnuzRibo8v5Xgo
7Grgnn+guu0D6wcIKowqbKj1VTt4gV5dG628ACOG76yvFSFUs41+hT//TrwefmKlraG2m44aM4Af
1/eHZ46hDlFcn69TB5QZwUkN7qetpu1Q1PQ06WY2RcTDmXU88LQt0ebPYWO8ZNBvLQyA2RHQTFHN
d8CSijP+iqfgsGMQQS+eszmOL1k16z875daFh5GRm8t5U5V/bSHT2PxKV7e41inU05gU565/s/Tq
FGPVA3tThOap5qX/51WdKonHXuqHxD8uFXKQryPi/USf15qkViH2grYOLp8KjtaYonbzTmml0Rvw
Ztc=
=CHJO
-----END PGP SIGNATURE-----

--------------Vi0AU3w4scFb3TEYgp0ludRF--

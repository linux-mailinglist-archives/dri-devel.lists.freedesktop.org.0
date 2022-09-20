Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBA85BDDB3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 09:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2177610E2DF;
	Tue, 20 Sep 2022 07:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9EA10E2EC
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 07:01:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C50AD1F8BA;
 Tue, 20 Sep 2022 07:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663657269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gKhwrzIjpCF54D+4JihkKCAKKp2ydkZEkS5paPUlzVc=;
 b=epvGp0Isy5LYwOfzYxeLVdep9G6AiD4IW/STRpp2s48SpnQTs3gziJiyWTRcPtR2+kJRpg
 eeneh9wjHOQZBtzgwy/NtW3sVcRF3C3zP/fhb/hR/+OIA/X7WP4tRS3yzedWbb0iYc2QO3
 NXS46SMXc1rC5GKHxpzAct5dTZDID4o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663657269;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gKhwrzIjpCF54D+4JihkKCAKKp2ydkZEkS5paPUlzVc=;
 b=1gFPMk0Aqm4yR0/bZHle6Np5a9eSqZlaiwwjLK7Ute3xh7xtPajB4QlL2qmbovgBdJjMkP
 2wI8mZROlL7PVwCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A3E001346B;
 Tue, 20 Sep 2022 07:01:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WLcGJzVlKWMSPgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Sep 2022 07:01:09 +0000
Message-ID: <6052b01b-e534-211d-6e5f-bf44c49ebfd1@suse.de>
Date: Tue, 20 Sep 2022 09:01:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/mgag200: Force 32 bpp on the console
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 daniel@ffwll.ch, wangyugui@e16-tech.com
References: <20220915150348.31504-1-tzimmermann@suse.de>
 <9447ffca-4383-eccd-3f9e-f87696b188d4@redhat.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <9447ffca-4383-eccd-3f9e-f87696b188d4@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PmCBtHzRGer0uL9hkQ3gwQzj"
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
--------------PmCBtHzRGer0uL9hkQ3gwQzj
Content-Type: multipart/mixed; boundary="------------Y6DZu9VqeA4B9qzLAha6lnle";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 daniel@ffwll.ch, wangyugui@e16-tech.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <6052b01b-e534-211d-6e5f-bf44c49ebfd1@suse.de>
Subject: Re: [PATCH] drm/mgag200: Force 32 bpp on the console
References: <20220915150348.31504-1-tzimmermann@suse.de>
 <9447ffca-4383-eccd-3f9e-f87696b188d4@redhat.com>
In-Reply-To: <9447ffca-4383-eccd-3f9e-f87696b188d4@redhat.com>

--------------Y6DZu9VqeA4B9qzLAha6lnle
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTkuMDkuMjIgdW0gMTc6MjUgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IE9uIDE1LzA5LzIwMjIgMTc6MDMsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gRzIw
MEVSIGRvZXMgbm90IHNlZW0gdG8gc3VwcG9ydCAyNCBicHAsIHNvIGZvcmNlIHRoZSBjb25z
b2xlIHRvDQo+PiB1c2UgMzIgYnBwLiBUaGUgcHJvYmxlbSB3YXMgaW50cm9kdWNlZCwgd2hl
biBjb21taXQgNzNmNTRkNWQ5NjgyDQo+PiAoImRybS9tZ2FnMjAwOiBSZW1vdmUgc3BlY2lh
bCBjYXNlIGZvciBHMjAwU0Ugd2l0aCA8MiBNaUIiKSBjaGFuZ2VkDQo+PiB0aGUgcHJlZmVy
cmVkIGNvbG9yIGRlcHRoIGZyb20gMzIgYml0IHRvIDI0IGJpdC4NCj4+DQo+PiBBIHNldHRp
bmcgb2YgMjQgaXMgdGhlIGNvcnJlY3QgY29sb3IgZGVwdGgsIGJ1dCBHMjAwRVIgZG9lc24n
dCBzZWVtDQo+PiB0byBiZSBhYmxlIHRvIHVzZSB0aGUgcmVzcGVjdGl2ZSBSR0I4ODggY29s
b3IgZm9ybWF0LiBVc2luZyAyNC1iaXQNCj4+IGNvbG9yIHdpdGggZm9yY2VkIDMyIGJwcCB3
b3JrcyBhcm91bmQgdGhlIHByb2JsZW0uDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4N
Cj4gQXQgbGVhc3Qgb24gbXkgRzIwMEVXLCAyNCBicHAgaXMgd29ya2luZyB3ZWxsLiBTbyBt
YXliZSBvbmx5IHRoZSBHMjAwRVIgDQo+IGlzIGFmZmVjdGVkLg0KDQpJIGNvdWxkIG5vdCBy
ZXByb2R1Y2UgdGhlIHByb2JsZW0gZWl0aGVyLiBQcm9iYWJseSBvbmx5IEcyMDBFUiBpcyAN
CmFmZmVjdGVkLiBKYXZpZXIgc3VnZ2VzdGVkIHRvIG1ha2UgYWRkIGEgcXVpcmsgc3BlY2lm
aWNhbGx5IGZvciB0aGUgDQpwYXJ0aWN1bGFyIERFTEwgbWFjaGluZS4NCg0KSW4gdGhlIGRy
bS10aXAsIHRoZSBjb2RlIGhhcyBtZWFud2hpbGUgYmVlbiBzcGxpdCB1cCBieSBoYXJkd2Fy
ZSANCnJldmlzaW9ucy4gU28gd2UgY2FuIGZpeCB0aGUgcHJvYmxlbSBieSBub3QgZXhwb3J0
aW5nIFJHQjg4OCBhdCBhbGwgb24gDQpHMjAwRVIuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFz
DQoNCj4gSSB0aGluayBpdCBtYXkgaGF2ZSBhIHBlcmZvcm1hbmNlIHBlbmFsdHksIEkgd2ls
bCB0cnkgdG8gbWVhc3VyZSBpdC4gPg0KPiBSZXZpZXdlZC1ieTogSm9jZWx5biBGYWxlbXBl
IDxqZmFsZW1wZUByZWRoYXQuY29tPg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYN
Cg==

--------------Y6DZu9VqeA4B9qzLAha6lnle--

--------------PmCBtHzRGer0uL9hkQ3gwQzj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMpZTQFAwAAAAAACgkQlh/E3EQov+Ab
HRAAmE/Ez4Y5VTBPsxVX5OKkx0U8IpZrX6WA4lKrB6Nl/qJzuLXDJg/PmmY86liVjq2GAt21hsFE
WadsUn7m84Jl7+iwF6XALMrlpS0GkwmyUI0P0dULsWv6ld9AUeuib6e7TXbeW+2Dhjc+s1djkRxz
WdvH8ZASqcb2CnNHQhOAriRdmRJQnJg3JiWxWEEvVCrYAwS1RIFwoMIgllTupYAeb9AF77tg4Iag
8YxBWOaEWW4V2jtVMME7lXB3efNTSGFlr4hoa0gI+1JLg08DiTfiy44W79Da27cCZ3Qat7uNyMwp
bR6mLmJNY8g8eyeINyoMnX3OheK8xmneYe7UGLodLuuacNq93XAa80R/d09Y3UmGoMJWDTdqnoxn
FKx+0IXf+AJV7B0bs2j8jDhIeBvsT+TUKbAJaNn//UoeUnoHtbJt2fAs2QC7qQSIi6HvW7q/pGM5
g2blT7FaKs2jpv7zArlrerML8vFNYkBZiyGo/vM1NYzYZ+k12MaQyuNk5B4CE5eN+yWWa5krXkrS
LJUMXL3wiu93k6nPvdKpFRU14BFvEG+mSz9jlb3VHBfoO7VgImJswGU43rb6fc58oFmZ4+NIdNAi
VyL0Jk5kbHBDHVXGIxjMJBlwKXz7U/gmOyWNLwYDRyzR7tFOXtxI+kYHBwnbWNdfLwyCV8exDmgs
njw=
=Y4y3
-----END PGP SIGNATURE-----

--------------PmCBtHzRGer0uL9hkQ3gwQzj--

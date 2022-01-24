Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 054BF497B16
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 10:11:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85CB610E7E3;
	Mon, 24 Jan 2022 09:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461C210E7DE;
 Mon, 24 Jan 2022 09:11:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C70A11F38B;
 Mon, 24 Jan 2022 09:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643015465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FUts7vQ92wluF1V0YPo5RkzNxvApLVxpQXqmeie6FVA=;
 b=SCdzbanNZdKT/LN3mP/ZCU86SIsEoAj8SWD3OKY3yvLJksBfySiUS00qiDXlvAXXucGMR0
 3vcSTYx8KwT1px3C9XLUNpxjEUo5suvR4VJPVn/EmeRlnl3AQuqYH+Ij+WjOAbbly45SIu
 jguq3SHJwu90kUuKV/PXQNAkwjf+mSw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643015465;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FUts7vQ92wluF1V0YPo5RkzNxvApLVxpQXqmeie6FVA=;
 b=I/CaaI7FvZew1vkLtLBv/m2N/TznQHHebqNbiUc2kMiSM0ooMKxUIOi2VwTu1mfeTnT0pR
 w97hz2pv5X3LHtDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8E36313A7C;
 Mon, 24 Jan 2022 09:11:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xSp9ISlt7mG6PQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Jan 2022 09:11:05 +0000
Message-ID: <ff4310c7-a663-a2f8-5c08-8c5557f58350@suse.de>
Date: Mon, 24 Jan 2022 10:11:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/i915: fix header file inclusion for might_alloc()
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
References: <20220124010811.1640-1-andi.shyti@linux.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220124010811.1640-1-andi.shyti@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OXWjDP0gZrvQJHO5gl2TUZYr"
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OXWjDP0gZrvQJHO5gl2TUZYr
Content-Type: multipart/mixed; boundary="------------344vYNP0349cIGsZdLARaj0I";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Andi Shyti <andi@etezian.org>
Message-ID: <ff4310c7-a663-a2f8-5c08-8c5557f58350@suse.de>
Subject: Re: [PATCH] drm/i915: fix header file inclusion for might_alloc()
References: <20220124010811.1640-1-andi.shyti@linux.intel.com>
In-Reply-To: <20220124010811.1640-1-andi.shyti@linux.intel.com>

--------------344vYNP0349cIGsZdLARaj0I
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjQuMDEuMjIgdW0gMDI6MDggc2NocmllYiBBbmRpIFNoeXRpOg0KPiBSZXBs
YWNlICJsaW51eC9zbGFiLmgiIHdpdGggImxpbnV4L3NjaGVkL21tLmgiIGhlYWRlciBpbmNs
dXNpb24NCj4gYXMgdGhlIGZpcnN0IGlzIG5vdCByZXF1aXJlZCwgd2hpbGUgdGhlIHNlY29u
ZCwgaWYgbm90IGluY2x1ZGVkLA0KPiBwcmRvdWNlcyB0aGUgZm9sbG93aW5nIGVycm9yOg0K
DQoncHJvZHVjZXMnDQoNCj4gDQo+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdm1hX3Jl
c291cmNlLmM6IEluIGZ1bmN0aW9uIOKAmGk5MTVfdm1hX3Jlc291cmNlX2JpbmRfZGVwX2F3
YWl04oCZOg0KPiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3ZtYV9yZXNvdXJjZS5jOjM4
MTo5OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYbWlnaHRf
YWxsb2PigJk7IGRpZCB5b3UgbWVhbiDigJhtaWdodF9sb2Nr4oCZPyBbLVdlcnJvcj1pbXBs
aWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0NCj4gICAgMzgxIHwgICAgICAgICBtaWdodF9h
bGxvYyhnZnApOw0KPiAgICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+DQo+ICAgICAgICB8
ICAgICAgICAgbWlnaHRfbG9jaw0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kaSBTaHl0aSA8
YW5kaS5zaHl0aUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBUaG9tYXMgSGVsbHN0csO2bSA8
dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTVfdm1hX3Jlc291cmNlLmMgfCAyICstDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV92bWFfcmVzb3VyY2UuYyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTVfdm1hX3Jlc291cmNlLmMNCj4gaW5kZXggMWY0MWMwYzY5OWVi
Li5iYmIwZmYxNDI3MmYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5
MTVfdm1hX3Jlc291cmNlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV92
bWFfcmVzb3VyY2UuYw0KPiBAQCAtNCw3ICs0LDcgQEANCj4gICAgKi8NCj4gICANCj4gICAj
aW5jbHVkZSA8bGludXgvaW50ZXJ2YWxfdHJlZV9nZW5lcmljLmg+DQo+IC0jaW5jbHVkZSA8
bGludXgvc2xhYi5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L3NjaGVkL21tLmg+DQo+ICAgDQo+
ICAgI2luY2x1ZGUgImk5MTVfc3dfZmVuY2UuaCINCj4gICAjaW5jbHVkZSAiaTkxNV92bWFf
cmVzb3VyY2UuaCINCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhm
ZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7D
vHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------344vYNP0349cIGsZdLARaj0I--

--------------OXWjDP0gZrvQJHO5gl2TUZYr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHubSgFAwAAAAAACgkQlh/E3EQov+DX
fg//dRjQrn86knRzBTkjQ+gLPV48Rw9BV/AnCYzAjtBueG3fpq0pK2kN2Ud0M+tq/mlky4waValC
bJa9MucWLgQuinvQT2rZbft97XMUPW+YftZu23E2714A7oFPTFS2qZC3P43cNQMgnXVrygEDPgxf
Ut7AKOX66pDTn139tNfcZUFjMFuVRkJRzmM6JIxwsdvDMld1QETPsOUSzUbqa98/ZqtBKqCC1y/s
9pujNvQzKgT8FnIyXemYXVgrVeIjz7Uset7DV887izCW14HLPzFK7/d9GSw/1udOZdz1yfc93bKU
F1a31EuaYU5IMe/ikTQi8rm6JAmLIoIKN1RGVJC/GnsUnvwR3Km95sXgZ7otwwDto6nGUlsqjwuj
ZVRZIgC76CvGKLKKsD3iOI/PcOCp7acGbgfOhcLcO9Bro8Vwcw3+LT55qcwAfOd6z3XEPd4IdGas
/WHrxLaQWzmMGO+dMSkOVZarx5COvYhS6AUl332BC/myDfbcgZ583iHVgFXe2zmhu/WLoZl6pqdU
6jVxMNBy1q0QGcHc2FbyXjWwc0J780+7cUgHG8YEDTJmtM2zsRYEwQpjtY2itCf66em3OmuK4+Ct
o63rLA2MVaCeV1nV0mQQG4t38bOa+IF0doAYZDGeMklRuINMMT/yAWytOY5rzpftJwT5h9GY17z2
uac=
=axx8
-----END PGP SIGNATURE-----

--------------OXWjDP0gZrvQJHO5gl2TUZYr--

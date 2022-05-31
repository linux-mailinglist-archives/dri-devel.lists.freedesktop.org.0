Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A8A538F8A
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 13:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4BE4112A55;
	Tue, 31 May 2022 11:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E24112A55
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 11:16:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E5DAC1F988;
 Tue, 31 May 2022 11:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1653995783; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zj8rAYFCtRMMf2kbTLP0d7F5MHuNL1DzZ64spMT3vEg=;
 b=J2Pnre+UQNVX3BfGxfjEYrvfaNq/rTmhYiq2puDSaQbIM8FPaed/6mTvF40nU2SSzrh4Wm
 yglZeocingO8hsNwu7eBQvJS2b2cg/VbX515CEVxZy2ondzcfPJ9X3odKbrvq90O2uXHXI
 KTneOwsBkzVYr/GDhkH0R8RXQ/aAy10=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1653995783;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zj8rAYFCtRMMf2kbTLP0d7F5MHuNL1DzZ64spMT3vEg=;
 b=bjwKL2hoTHpZTjnSzXjhKuYRD0RcE92nRi+aoaqkx/QXYGqkiVFkAzbhiHS3TZns342lZL
 mXDCJXoG4r/lPICA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C12E713AA2;
 Tue, 31 May 2022 11:16:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UGtQLgf5lWJJSQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 31 May 2022 11:16:23 +0000
Message-ID: <fc6f7963-5abf-bf53-b671-a4d10bb68d10@suse.de>
Date: Tue, 31 May 2022 13:16:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 0/5] drm/ast: Connector cleanups and polling
Content-Language: en-US
To: airlied@redhat.com, kuohsiang_chou@aspeedtech.com, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20220531111502.4470-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220531111502.4470-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------K3pc2bzX0LWS03OK4nnbf20z"
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
--------------K3pc2bzX0LWS03OK4nnbf20z
Content-Type: multipart/mixed; boundary="------------7CxxZIw2XPYxLU2HevlV3HA1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, kuohsiang_chou@aspeedtech.com, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org
Message-ID: <fc6f7963-5abf-bf53-b671-a4d10bb68d10@suse.de>
Subject: Re: [PATCH v2 0/5] drm/ast: Connector cleanups and polling
References: <20220531111502.4470-1-tzimmermann@suse.de>
In-Reply-To: <20220531111502.4470-1-tzimmermann@suse.de>

--------------7CxxZIw2XPYxLU2HevlV3HA1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDMxLjA1LjIyIHVtIDEzOjE0IHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+
IFZhcmlvdXMgY2xlYW51cHMgdG8gYXN0J3MgY29uZW5jdG9yIGNvZGUuIFNpbXBsaWZpZXMg
dGhlIGNvZGUsIGFkZHMNCj4gc3VwcG9ydCBmb3IgdXNpbmcgVkdBIGFuZCBBU1REUCBjb25u
ZWN0b3JzIGF0IHRoZSBzYW1lIHRpbWUsIGFuZA0KPiBpbml0aWFsaXplcyBwb2xsaW5nIG9m
IHRoZSBjb25uZWN0b3Igc3RhdHVzLg0KPiANCj4gUGF0Y2ggMSB3YXMgZmlyc3QgcG9zdGVk
IGF0IFsxXSwgc28gdGhpcyBwYXRjaHNldCBzdGFydHMgYXQgdmVyc2lvbg0KDQpbMV0gDQpo
dHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjAyMjA1MTAxMDUwMTAuMjA3MTIt
MS10emltbWVybWFubkBzdXNlLmRlLw0KDQo+IDIuIFRoZSBpbXBsZW1lbnRhdGlvbiBvZiBk
ZXRlY3RfY3R4IGluIHBhdGNoIDMgaGFzIGJlZW4gYWRkZWQgdG8gRFJNDQo+IGhlbHBlcnMg
YXMgaXQgd2lsbCBiZSB1c2VmdWwgZm9yIG90aGVyIGRyaXZlcnMsIHN1Y2ggYXMgbWdhZzIw
MCBhbmQNCj4gdWRsLg0KPiANCj4gVGhvbWFzIFppbW1lcm1hbm4gKDUpOg0KPiAgICBkcm0v
YXN0OiBTdXBwb3J0IG11bHRpcGxlIG91dHB1dHMNCj4gICAgZHJtL2FzdDogRml4IHVwZGF0
aW5nIHRoZSBjb25uZWN0b3IncyBFRElEIHByb3BlcnR5DQo+ICAgIGRybS9hc3Q6IFN1cHBv
cnQgb3V0cHV0IHBvbGxpbmcNCj4gICAgZHJtL2FzdDogRmFpbCBwcm9iaW5nIGlmIERDQyBj
aGFubmVsIGNvdWxkIG5vdCBiZSBpbml0aWFsaXplZA0KPiAgICBkcm0vYXN0OiBSZW1vdmUg
c3RydWN0IGFzdF97dmdhLHNpbDE2NH1fY29ubmVjdG9yDQo+IA0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9hc3QvYXN0X2RwLmMgICAgICAgfCAgIDUgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
YXN0L2FzdF9kcDUwMS5jICAgIHwgICAyICstDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FzdC9h
c3RfZHJ2LmggICAgICB8ICAzMCArLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYXN0L2Fz
dF9pMmMuYyAgICAgIHwgICA3ICstDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFp
bi5jICAgICB8ICAyMSArKy0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5j
ICAgICB8IDE2NSArKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9hc3QvYXN0X3Bvc3QuYyAgICAgfCAgIDIgKy0NCj4gICBkcml2ZXJzL2dwdS9k
cm0vZHJtX3Byb2JlX2hlbHBlci5jIHwgIDM1ICsrKysrKw0KPiAgIGluY2x1ZGUvZHJtL2Ry
bV9wcm9iZV9oZWxwZXIuaCAgICAgfCAgIDMgKw0KPiAgIDkgZmlsZXMgY2hhbmdlZCwgMTE2
IGluc2VydGlvbnMoKyksIDE1NCBkZWxldGlvbnMoLSkNCj4gDQo+IA0KPiBiYXNlLWNvbW1p
dDogMmM4Y2M1Y2QyMGUyOGFmZTZiNjNhY2IyODg5MGU1ZjU3ZDliZjA1NQ0KDQotLSANClRo
b21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bD
vGhyZXI6IEl2byBUb3Rldg0K

--------------7CxxZIw2XPYxLU2HevlV3HA1--

--------------K3pc2bzX0LWS03OK4nnbf20z
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKV+QcFAwAAAAAACgkQlh/E3EQov+Af
Ug/+K68m6FudqsLhdqwkjSu3U+wFgzQR9nV9flqvnhalyLkcx74nH3As8tNp1D/izpcRsoeaALGv
y2wb8OYfrbh6SUy8lCJe/TNeXVUvFU6Gs8h4utZiQiUM6Woy8RdUqdHrDfMpm6M1uva0e6NibuZH
jkG5ETBmD06tRSFriFU1vumGHS58iNT96TmB8TUDOiQ23pICzDKTm2ZarP9P5WprA+VZoadJMq63
MP2fnI3rwI/5RatwALGK88GfT6TUQARHKOkM4tZcW38GBXTPb5T4kJhJQcHbVObHy4Ah1pkTBunQ
dntcGOC2ukHA6/7Owk8qXxKkkPZIKVqVOt+SfdHXTXoHLRkaf6au9wl0eySpuj+UnDuJOd6F+mFj
rlp1ZSfPyGF7/wD2FWSi+/KXeKzBYwB35WCMd8npBaM+tpbt+o5QWHvZpXiNSe46wF4PhM4KZnwZ
0eNwrcZjYJJTBAQHzLmpjsvzypIZuyHq8l8kjk6GQz5fmY1VsG0MQhNBxAYHJTvNOgQ6GgOiUXud
bjXkYai2lOcCmSPu+BT6dmLJjzR3wW1G/L5boFqyBrmKHowB7jhVW6ypsI1v7hnxm0cRJg/UGa6x
fvm3YaKAySA4EUZSXXo2JIqUGqptBmMtFZgHILrBlfmYRSr0tJ55gTt4BWqcF38O/Uy2Ipi5s+wi
ekM=
=jQyY
-----END PGP SIGNATURE-----

--------------K3pc2bzX0LWS03OK4nnbf20z--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6C558AADC
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 14:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00DAB5326;
	Fri,  5 Aug 2022 12:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D8EB530D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 12:21:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5BC461FB38;
 Fri,  5 Aug 2022 12:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659702063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I0oY5YWPhgM2IlpoF7mZNylwLRRP1KQGnETW5/3iDT8=;
 b=kqUYgshwg4iQ2O+0Jv+MpzwodvJh/2298p4V5io04RyriA32JIlwg3X27Fm9jJ65PSe2pR
 Vmowuf0W65uBJLAKVf/5KOim14XRe2J0T6tvjIq4aIzGjbNcJ7no5qmxvy/jOHvzy91CEz
 2IJrEOKAckb0e4Dp9PiOz164jXtXU/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659702063;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I0oY5YWPhgM2IlpoF7mZNylwLRRP1KQGnETW5/3iDT8=;
 b=r0IPwi/iF3xcmSqV3466v+5SiM9nB9wzh2n7tcpyb603XbknzzMKLDthd0464aYk9I5e1Z
 gaRWlCM8l20KdyDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A7EB13A9C;
 Fri,  5 Aug 2022 12:21:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id r7gvDS8L7WLMFgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 05 Aug 2022 12:21:03 +0000
Message-ID: <2dfa9d52-e547-ea25-645d-4e4793a0c9ce@suse.de>
Date: Fri, 5 Aug 2022 14:21:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/4] drm/udl: Fix stray URBs and cleanup
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, dri-devel@lists.freedesktop.org
References: <20220804075826.27036-1-tiwai@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220804075826.27036-1-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------L5o39UAhZTPm0xcOvB4jeVmw"
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
Cc: Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------L5o39UAhZTPm0xcOvB4jeVmw
Content-Type: multipart/mixed; boundary="------------yTYSTv9eefGIpsT9p6gkhhhD";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>, dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Message-ID: <2dfa9d52-e547-ea25-645d-4e4793a0c9ce@suse.de>
Subject: Re: [PATCH 0/4] drm/udl: Fix stray URBs and cleanup
References: <20220804075826.27036-1-tiwai@suse.de>
In-Reply-To: <20220804075826.27036-1-tiwai@suse.de>

--------------yTYSTv9eefGIpsT9p6gkhhhD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgVGFrYXNoaSwNCg0KQW0gMDQuMDguMjIgdW0gMDk6NTggc2NocmllYiBUYWthc2hpIEl3
YWk6DQo+IEhpLA0KPiANCj4gdGhpcyBpcyBhIHNlcmllcyBvZiBmaXhlcyBmb3IgVURMIGRy
aXZlciB0byBhZGRyZXNzIHRoZSBsZWZ0b3ZlciBVUkJzDQo+IGF0IHN1c3BlbmQvcmVzdW1l
LiAgSXQgYmVnaW5zIHdpdGggdGhlIHNpbXBsaWZpY2F0aW9uIG9mIEZJRk8gY29udHJvbA0K
PiBjb2RlIHdpdGggdGhlIHN0YW5kYXJkIHdhaXQgcXVldWUsIGZvbGxvd2VkIGJ5IHRoZSBo
YW5kbGluZyBvZiBwZW5kaW5nDQo+IFVSQnMsIGFuZCByZXBsYWNlIEJVR19PTigpIHdpdGgg
V0FSTl9PTigpIGFzIGEgY2xlYW51cC4NCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KDQpUaGF0J3MgYSBsb3QgYmV0dGVyIHRoYW4g
d2hhdCdzIGN1cnJlbnRseSB0aGVyZS4gSWYgbm8gb3RoZXIgcmV2aWV3cyANCmNvbWUgaW4s
IEknbGwgYWRkIHRoZSBwYXRjaGVzIG5leHQgd2Vlay4NCg0KQmVzdCByZWdhcmRzDQpUaG9t
YXMNCg0KPiANCj4gDQo+IFRha2FzaGkNCj4gDQo+ID09PQ0KPiANCj4gVGFrYXNoaSBJd2Fp
ICg0KToNCj4gICAgZHJtL3VkbDogUmVwbGFjZSBzZW1hcGhvcmUgd2l0aCBhIHNpbXBsZSB3
YWl0IHF1ZXVlDQo+ICAgIGRybS91ZGw6IFN5bmMgcGVuZGluZyBVUkJzIGF0IHN1c3BlbmQg
LyBkaXNjb25uZWN0DQo+ICAgIGRybS91ZGw6IEtpbGwgcGVuZGluZyBVUkJzIGF0IHN1c3Bl
bmQgYW5kIGRpc2Nvbm5lY3QNCj4gICAgZHJtL3VkbDogUmVwbGFjZSBCVUdfT04oKSB3aXRo
IFdBUk5fT04oKQ0KPiANCj4gICBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuaCAgICAg
IHwgIDE0ICsrKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMgICAgIHwg
MTI1ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJt
L3VkbC91ZGxfbW9kZXNldC5jICB8ICAgNCArDQo+ICAgZHJpdmVycy9ncHUvZHJtL3VkbC91
ZGxfdHJhbnNmZXIuYyB8ICAgMyArLQ0KPiAgIDQgZmlsZXMgY2hhbmdlZCwgNzkgaW5zZXJ0
aW9ucygrKSwgNjcgZGVsZXRpb25zKC0pDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5u
DQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBH
ZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0K
KEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rl
dg0K

--------------yTYSTv9eefGIpsT9p6gkhhhD--

--------------L5o39UAhZTPm0xcOvB4jeVmw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLtCy4FAwAAAAAACgkQlh/E3EQov+C7
1w//VKahL1slF0E4gpAKSaeMj5F0uCyAblwJ1XldBx/bm8iZNC2DD9bSpvh1izNORRVXr+Puigr8
hYCnFIVDxqMBmVso9A4WZxQNPviDtBfjNa6ucupLwzZU/0TlNml5Fo8sfd43rSD/Ou+n0gkuigLi
sdOcA+1QdOI63uwvy1MONxtcduW2ddLB32aDtVFI7Q9voFWnN4Oj5jzxADkw6vU7JLYMy15KKWqf
yxdNxQmuVBiKz/ynjuKaBD0EHQ8ZNNifHyL5iAHoTyADI41m+mNHPun8GNWAZx0wIL1kUeF4QOcc
/m6ruWRjL3FTLThYvp89/MoNdyC96cvIxwWxSFCNmDpCaT1SVMr+11xw7j1+URy2DRXY/Axsbg6Z
BV4YkuW2BXJ0rxUZsZtlHL4du1Gs93UaBGvC77rIsqmdV08VwtJxxNmt/rcaOdRf+R3J7OC1+0GO
RzJjwEw7QsPHqt1KLZhjXtN2ZWZLx55bD3AfD7sB7XAR+ncMQ+SZ5i+Z8eKNKenoiYTMveGqnm8u
cRZRhgJxcKydPVpCC9F8Tj5heGII4zvN6xPUCjfmUMtyBvYLjhWgG0tJTyANbMDDmONuQQoC1fnv
6yVR2QWGhkvpINc8AHrTRpo+I0+H/WUui7eHfZJqZrFfiaz9eUXK6PPzEjWvY+BiHJXtTS4fU5l1
89o=
=mw3w
-----END PGP SIGNATURE-----

--------------L5o39UAhZTPm0xcOvB4jeVmw--

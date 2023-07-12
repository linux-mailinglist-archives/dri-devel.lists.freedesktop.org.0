Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F59750B68
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 16:51:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C679E10E55C;
	Wed, 12 Jul 2023 14:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ADA010E55C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 14:51:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B7CFB204B5;
 Wed, 12 Jul 2023 14:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689173491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rjjbsrOGOs27w0po8Idik5y/Ddq8mc4ujC1cXkLfgm4=;
 b=dhNtLDcRgf2mezfB/N8nbl/D6hMAIALJ4IPpqNov31khtnvdIU3FJ32BtAJQdwuy7jna15
 Lrt97rg8WuHvYR+pj+lQRSb+qQdggOvKXuOjL0F6drG/yXZTQE51RtqgiyIjODoyZg87Iw
 iNSWR2KvcibJc/3S/eM6nr471fp6uXk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689173491;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rjjbsrOGOs27w0po8Idik5y/Ddq8mc4ujC1cXkLfgm4=;
 b=yjvEC2FXDqORmQRSJpY/awtn8Nuolm584mbsLiHmJS4ZHihif6xCLXc3KVOr24j2oszDlP
 YpoOajiSRTYBdjCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 80BFC133DD;
 Wed, 12 Jul 2023 14:51:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id X2otHvO9rmSpHAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 12 Jul 2023 14:51:31 +0000
Message-ID: <b3357699-174a-394d-0595-a636cca75057@suse.de>
Date: Wed, 12 Jul 2023 16:51:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 2/2] drm/ast: report connection status on Display Port.
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 jani.nikula@linux.intel.com, dianders@chromium.org
References: <20230712132826.287126-1-jfalempe@redhat.com>
 <20230712132826.287126-2-jfalempe@redhat.com>
 <e37d95f9-bcb5-237a-4c7e-2ae38f8b247d@suse.de>
 <af5ab6ed-2f8f-f02e-bc5d-9d13d9e8c87a@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <af5ab6ed-2f8f-f02e-bc5d-9d13d9e8c87a@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------oQyvmYPSmqLzoSNEDCZ0Evs5"
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
--------------oQyvmYPSmqLzoSNEDCZ0Evs5
Content-Type: multipart/mixed; boundary="------------XDz6aQgcd0piT9RSYnmUBErx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 jani.nikula@linux.intel.com, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org
Message-ID: <b3357699-174a-394d-0595-a636cca75057@suse.de>
Subject: Re: [PATCH v4 2/2] drm/ast: report connection status on Display Port.
References: <20230712132826.287126-1-jfalempe@redhat.com>
 <20230712132826.287126-2-jfalempe@redhat.com>
 <e37d95f9-bcb5-237a-4c7e-2ae38f8b247d@suse.de>
 <af5ab6ed-2f8f-f02e-bc5d-9d13d9e8c87a@redhat.com>
In-Reply-To: <af5ab6ed-2f8f-f02e-bc5d-9d13d9e8c87a@redhat.com>

--------------XDz6aQgcd0piT9RSYnmUBErx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMDcuMjMgdW0gMTY6Mzkgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IE9uIDEyLzA3LzIwMjMgMTU6NTUsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gSGkN
Cj4+DQo+PiBBbSAxMi4wNy4yMyB1bSAxNToyNyBzY2hyaWViIEpvY2VseW4gRmFsZW1wZToN
Cj4+PiBBc3BlZWQgYWx3YXlzIHJlcG9ydCB0aGUgZGlzcGxheSBwb3J0IGFzICJjb25uZWN0
ZWQiLCBiZWNhdXNlIGl0DQo+Pj4gZG9lc24ndCBzZXQgYSAuZGV0ZWN0IGNhbGxiYWNrLg0K
Pj4+IEZpeCB0aGlzIGJ5IHByb3ZpZGluZyB0aGUgcHJvcGVyIGRldGVjdCBjYWxsYmFjayBm
b3IgYXN0ZHAgYW5kIGRwNTAxLg0KPj4+DQo+Pj4gVGhpcyBhbHNvIGZpeGVzIHRoZSBmb2xs
b3dpbmcgcmVncmVzc2lvbjoNCj4+PiBTaW5jZSBjb21taXQgZmFlN2QxODY0MDNlICgiZHJt
L3Byb2JlLWhlbHBlcjogRGVmYXVsdCB0byA2NDB4NDgwIGlmIG5vDQo+Pj4gRURJRCBvbiBE
UCIpDQo+Pj4gVGhlIGRlZmF1bHQgcmVzb2x1dGlvbiBpcyBub3cgNjQweDQ4MCB3aGVuIG5v
IG1vbml0b3IgaXMgY29ubmVjdGVkLiBCdXQNCj4+PiBBc3BlZWQgZ3JhcGhpY3MgaXMgbW9z
dGx5IHVzZWQgaW4gc2VydmVycywgd2hlcmUgbm8gbW9uaXRvciBpcyBhdHRhY2hlZC4NCj4+
PiBUaGlzIGFsc28gYWZmZWN0cyB0aGUgcmVtb3RlIEJNQyByZXNvbHV0aW9uIHRvIDY0MHg0
ODAsIHdoaWNoIGlzDQo+Pj4gaW5jb252ZW5pZW50LCBhbmQgYnJlYWtzIHRoZSBhbmFjb25k
YSBpbnN0YWxsZXIuDQo+Pg0KPj4gVGhlIGZvcm1hdHRpbmcgb2YgdGhlc2UgcGFyYWdyYXBo
cyBzdGlsbCBsb29rcyBvZmYuDQo+IA0KPiBvaywgSSB0aGluayBpdCdzIGJlY2F1c2UgSSBz
dGFydCBhIG5ldyBsaW5lIGluIHRoZSBtaWRkbGUgb2YgdGhlIA0KPiBzZW50ZW5jZSwgYmVm
b3JlICJUaGUgZGVmYXVsdCByZXNvbHV0aW9uIC4uLiIgPw0KPiBJIHdpbGwgZml4IHRoYXQu
DQo+Pg0KPj4gSXQganVzdCBvY2N1cmVkIHRvIG1lIHRoYXQgeW91IHByb2JhYmx5IHdhbnQg
b3V0cHV0IHBvbGxpbmcgdG8gbWFrZSANCj4+IGRldGVjdGlvbiB3b3JrIGR5bmFtaWNhbGx5
LiBTZWUgYW4gb2xkIHBhdGNoIG9mIG1pbmUgb24gaG93IHRoYXQgd29ya3M6DQo+Pg0KPj4g
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzQ4ODQ2MC8NCj4gDQo+
IFNvLCBpZiBJIHVuZGVyc3RhbmQgd2VsbCwgSSBqdXN0IG5lZWQgdG8gYWRkOg0KPiANCj4g
Y29ubmVjdG9yLT5wb2xsZWQgPSBEUk1fQ09OTkVDVE9SX1BPTExfQ09OTkVDVCB8IA0KPiBE
Uk1fQ09OTkVDVE9SX1BPTExfRElTQ09OTkVDVDsNCj4gDQo+IGFuZCBjYWxsIGRybV9rbXNf
aGVscGVyX3BvbGxfaW5pdCgpID8NCg0KVGhhdCdzIGl0LCBJIHRoaW5rLiBUaGUgZmxhZ3Mg
dGVsbCB3aGF0IHRvIHBvbGwgZm9yIGFuZCB0aGUgY2FsbCBzdGFydHMgDQp0aGUgcG9sbGlu
ZyB0aW1lb3V0LiBJdCB3b3JrZWQgd2hlbiBJIHRlc3RlZCBpdCB3aXRoIHZnYSBiYWNrIHRo
ZW4uDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4+DQo+PiBXZSBhbHNvIGdldCBhbiBp
bnRlcnJ1cHQgd2hlbiB0aGUgY29ubmVjdG9yIHN0YXRlIGNoYW5nZXMsIGJ1dCBJREsgaG93
IA0KPj4gdGhhdCBoYXMgdG8gYmUgaGFuZGxlZC4gU28gcG9sbGluZyBpcyB0aGUgbmV4dCBi
ZXN0IHRoaW5nLiBTb3JyeSBmb3IgDQo+PiBtaXNzaW5nIHRoaXMgaW4gdGhlIGVhcmxpZXIg
cmV2aWV3cy4NCj4gDQo+IFllcywgdGhlcmUgaXMgbm8gaXJxIGNvbmZpZ3VyZWQgaW4gdGhl
IGFzdCBkcml2ZXIsIHNvIGxldCdzIGZhbGxiYWNrIHRvIA0KPiBwb2xsaW5nLg0KPiANCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYs
IDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJz
LCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVy
bmJlcmcpDQo=

--------------XDz6aQgcd0piT9RSYnmUBErx--

--------------oQyvmYPSmqLzoSNEDCZ0Evs5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSuvfIFAwAAAAAACgkQlh/E3EQov+A7
8g//dQhrzYlt5Pktyax2PrpC8bmaZ+u+IxMmILxciS4OqERzusnLH/aEQE5QNUVtYIsSJ9oM/4cY
duFvCnCcnLpwVZMhbMGl0XkR8IcCf4bHN0vra6j5bneBtBxftrXwkXQ3W8YoCcFxLaW6RMhFMlPj
MLVJw0DYHJeH/1F0OISTXohhPQNINBKeqdg6lCBtXYzMC9ZQ0VQDZDq8EAbTC1HwrLYSjWm74a5w
m5BL2Hi2YTc9vNOaVYgr4fGcZi7wJoGXa2HrvEGubdqjG71brygGJxk6nhT6CbFh3VKLsQ2/HylO
CDTqU40aStJ/AA0hS2TbXO8PnmPRqbNheXpNdu4776cCXnlAz87Mqeyg1d6Xce+2N8OssHJMJb4w
0DsT1mC5RTHtUcjnUQ9T+qfWOSHo1iZHmNVKJiufy2LotOsz7rKz0KJxFLpMmLB8U/8swDk/6Gly
ML92aqVJNCi2eA6NqlSvLYc9gPdVnpuPEM2tus666I6P9vBQ64EHAsaxOgIxGbP4z9DxlwGe5Rq4
TYlmyon3eC46ilWWqNeAIGOTvOUE/UeJB1E4CW5vxccFP/Cq9necH+T/c48GoziqbKhIMYqI5ZpP
B/27hEeLwdvD0JJcXnHSvSOfEpRt0T16a7SNuyi/933v53Ts0PGjDQTp+8EIOP0YrPLQW3ggc71p
WFc=
=iksm
-----END PGP SIGNATURE-----

--------------oQyvmYPSmqLzoSNEDCZ0Evs5--

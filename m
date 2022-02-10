Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 264E14B0C7A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 12:39:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CEAC10E814;
	Thu, 10 Feb 2022 11:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8265010E814;
 Thu, 10 Feb 2022 11:38:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 271E621117;
 Thu, 10 Feb 2022 11:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644493133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KgtNWZ/ohKrNPsB6sPY/+1TA/1q4bWE2L3IAgKLQ4fY=;
 b=rknGoZj5CF2fwSOIym8ZDz1rxYva/yD5pKBBXngxqNPgUzzAtN8ZYfHBDYubIFYssrocqD
 84fCAdFJmMdMBuYtanmjlSn/4bMJcwf1cGg6N4MWMEl5dZmzI9p5pYLH10WP+dlBsrCwZ+
 6tzNTbgvR8QJrXqMk1N2hCusRE+rvyg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644493133;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KgtNWZ/ohKrNPsB6sPY/+1TA/1q4bWE2L3IAgKLQ4fY=;
 b=jGZ9rxr6RJ4xf3OuY7pjcj0QBLFb6oza6ZcSefEST0wpDlytAVMHkL1h5/n9bnyp2FuJyq
 Xb48Li7Avh02LiDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E8C6C13B53;
 Thu, 10 Feb 2022 11:38:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zd/VN0z5BGJmFAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Feb 2022 11:38:52 +0000
Message-ID: <c4067be6-c28c-ba27-d311-c19d6c1cd93a@suse.de>
Date: Thu, 10 Feb 2022 12:38:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 08/19] fb: Delete fb_info->queue
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-9-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220208210824.2238981-9-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------g2wH0CuXhVZzWZSAqvYK7PEy"
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
Cc: linux-fbdev@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------g2wH0CuXhVZzWZSAqvYK7PEy
Content-Type: multipart/mixed; boundary="------------hzN9cle7d0VwO0jV48D3qCk5";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: linux-fbdev@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter
 <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Helge Deller <deller@gmx.de>
Message-ID: <c4067be6-c28c-ba27-d311-c19d6c1cd93a@suse.de>
Subject: Re: [PATCH v2 08/19] fb: Delete fb_info->queue
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-9-daniel.vetter@ffwll.ch>
In-Reply-To: <20220208210824.2238981-9-daniel.vetter@ffwll.ch>

--------------hzN9cle7d0VwO0jV48D3qCk5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA4LjAyLjIyIHVtIDIyOjA4IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoNCj4gSXQg
d2FzIG9ubHkgdXNlZCBieSBmYmNvbiwgYW5kIHRoYXQgbm93IHN3aXRjaGVkIHRvIGl0cyBv
d24sDQo+IHByaXZhdGUgd29yay4NCj4gDQo+IEFja2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNh
bUByYXZuYm9yZy5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAaW50ZWwuY29tPg0KPiBDYzogSGVsZ2UgRGVsbGVyIDxkZWxsZXJAZ214LmRl
Pg0KPiBDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnDQoNCkFja2VkLWJ5OiBUaG9t
YXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KPiAtLS0NCj4gICBpbmNs
dWRlL2xpbnV4L2ZiLmggfCAxIC0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZmIuaCBiL2luY2x1ZGUvbGlu
dXgvZmIuaA0KPiBpbmRleCAzZDczMDZjOWE3MDYuLjIzYjE5Y2Y4YmNjZCAxMDA2NDQNCj4g
LS0tIGEvaW5jbHVkZS9saW51eC9mYi5oDQo+ICsrKyBiL2luY2x1ZGUvbGludXgvZmIuaA0K
PiBAQCAtNDQ5LDcgKzQ0OSw2IEBAIHN0cnVjdCBmYl9pbmZvIHsNCj4gICAJc3RydWN0IGZi
X3Zhcl9zY3JlZW5pbmZvIHZhcjsJLyogQ3VycmVudCB2YXIgKi8NCj4gICAJc3RydWN0IGZi
X2ZpeF9zY3JlZW5pbmZvIGZpeDsJLyogQ3VycmVudCBmaXggKi8NCj4gICAJc3RydWN0IGZi
X21vbnNwZWNzIG1vbnNwZWNzOwkvKiBDdXJyZW50IE1vbml0b3Igc3BlY3MgKi8NCj4gLQlz
dHJ1Y3Qgd29ya19zdHJ1Y3QgcXVldWU7CS8qIEZyYW1lYnVmZmVyIGV2ZW50IHF1ZXVlICov
DQo+ICAgCXN0cnVjdCBmYl9waXhtYXAgcGl4bWFwOwkvKiBJbWFnZSBoYXJkd2FyZSBtYXBw
ZXIgKi8NCj4gICAJc3RydWN0IGZiX3BpeG1hcCBzcHJpdGU7CS8qIEN1cnNvciBoYXJkd2Fy
ZSBtYXBwZXIgKi8NCj4gICAJc3RydWN0IGZiX2NtYXAgY21hcDsJCS8qIEN1cnJlbnQgY21h
cCAqLw0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIu
IDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJn
KQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------hzN9cle7d0VwO0jV48D3qCk5--

--------------g2wH0CuXhVZzWZSAqvYK7PEy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIE+UwFAwAAAAAACgkQlh/E3EQov+BD
pQ/8CibP+cHmPP9vCiTG2GwTNHiRmnVgxAzzkOpQ98Uv1HGdaTjUGa9vLMlGdgTEbLMbJZN/sYBG
9lpW63Estor/bdctOsf9rxFhab2wJeoXT5KoUdcbGm8youaYPYUaG0s4TgYu9NSexBCVtvQuofr5
Gs6Y/huDIgORGr7wM5EOKLaNtFM0IrXhFg+uK0QKicTzgCG6uL6kIyLqGzjbZqnulXLpwCp/w79l
wGVVr+umlOPivWXEONSUab575WhU164l40NL5g3ymlBMgq2EehvIC2A5PTM77tpV80tG57h/tB28
mJnHF6wuRnhfu7Uo3Dn+nX4KOMVarTZISKplHbGtHxafKVVL8j0GkxAOtWJ6sJpT+QgSpiOlrM1G
i/0fsU1sWYqBD0wbcynYVlACcYAIb6gAVrkUMQEfdm/aVO6cNozkQfLprr103wcn9Kae8LCB+Ktd
5MscU7u/9zkps1BkxegjHCqqdXhCTmC4TCrb/S98Cq1MGcWNlTTSXlnzJb5ltwgZwgAVP/XySD0M
dummy2+Xng/p/prC5mM3EX2euYvpena5mE8J3cBIQWA4Qy08thC4DvXFx6qdcJNlwTu8c2kLNR7F
yBVoPFBU14Zq/uNN5TL1KV0VgPcah1OHDIsUUGIRTFxwZNfRUIt4ykQIIXFOdVkZt1RawenfDo5d
H4c=
=CP73
-----END PGP SIGNATURE-----

--------------g2wH0CuXhVZzWZSAqvYK7PEy--

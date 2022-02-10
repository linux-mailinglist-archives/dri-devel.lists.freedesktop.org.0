Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7254A4B0C3F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 12:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AAA510E80C;
	Thu, 10 Feb 2022 11:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4D410E80B;
 Thu, 10 Feb 2022 11:22:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B474B210E0;
 Thu, 10 Feb 2022 11:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644492123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X49zO3S9nO4v6oiABAqIdkYeWKWFbmwumQfrXbuxtMA=;
 b=aid7pTtFVZ1UfvaRrF9hH5jrcmEmIn8wh07l/o4YodqeES6ckI1QVtR+f7hs78rtyfJpp7
 wWDZhWvMxy0/MlBuj1/gSNr+A6ptUyXbgfAgak7YASAblczQjz7VWU3cAohuNfCmqJGpGW
 oAOcOqvdFranaqlp4bgM7T+/UPn+Op8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644492123;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X49zO3S9nO4v6oiABAqIdkYeWKWFbmwumQfrXbuxtMA=;
 b=MVS0v+H/F/ixG41usvIS5O3wtYav9F9GMtcybwAiVp0jqK27fKG1PN5keL0OsFdw7qg8ac
 fuxqF+5TZMINq2Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8549513B43;
 Thu, 10 Feb 2022 11:22:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VOibH1v1BGIVCwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Feb 2022 11:22:03 +0000
Message-ID: <2be5ba75-c04c-fad1-2b59-80836d241e0a@suse.de>
Date: Thu, 10 Feb 2022 12:22:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 05/19] fbdev/sysfs: Fix locking
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-6-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220208210824.2238981-6-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7pW0iiL2LOpjjS6t2sZTZIW4"
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
 LKML <linux-kernel@vger.kernel.org>, Qing Wang <wangqing@vivo.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7pW0iiL2LOpjjS6t2sZTZIW4
Content-Type: multipart/mixed; boundary="------------K5NZTsrNRyxBfTb34lUQD7gD";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: linux-fbdev@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Qing Wang <wangqing@vivo.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Helge Deller <deller@gmx.de>
Message-ID: <2be5ba75-c04c-fad1-2b59-80836d241e0a@suse.de>
Subject: Re: [PATCH v2 05/19] fbdev/sysfs: Fix locking
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-6-daniel.vetter@ffwll.ch>
In-Reply-To: <20220208210824.2238981-6-daniel.vetter@ffwll.ch>

--------------K5NZTsrNRyxBfTb34lUQD7gD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA4LjAyLjIyIHVtIDIyOjA4IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoNCj4gZmJf
c2V0X3ZhciByZXF1aXJlcyB3ZSBob2xkIHRoZSBmYl9pbmZvIGxvY2suIE9yIGF0IGxlYXN0
IHRoaXMgbm93DQo+IG1hdGNoZXMgd2hhdCB0aGUgaW9jdGwgZG9lcyAuLi4NCj4gDQo+IE5v
dGUgdGhhdCBwczNmYiBhbmQgc2hfbW9iaWxlX2xjZGNmYiBhcmUgYnVzdGVkIGluIGRpZmZl
cmVudCB3YXlzIGhlcmUsDQo+IGJ1dCBJIHdpbGwgbm90IGZpeCB0aGVtIHVwLg0KPiANCj4g
QWxzbyBpbiBwcmFjdGljZSB0aGlzIGlzbid0IGEgYmlnIGRlYWwsIGJlY2F1c2UgcmVhbGx5
IHZhcmlhYmxlIGZiZGV2DQo+IHN0YXRlIGlzIGFjdHVhbGx5IHByb3RlY3RlZCBieSBjb25z
b2xlX2xvY2sgKGJlY2F1c2UgZmJjb24ganVzdA0KPiBkb2Vzbid0IGJvdGhlciB3aXRoIGxv
Y2tfZmJfaW5mbygpIGF0IGFsbCksIGFuZCBsb2NrX2ZiX2luZm8NCj4gcHJvdGVjdGluZyBh
bnl0aGluZyBpcyByZWFsbHkganVzdCBhIG5lYXQgbGllLiBCdXQgdGhhdCdzIGEgbXVjaA0K
PiBiaWdnZXIgZmlzaCB0byBmcnkuDQo+IA0KPiBBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGludGVsLmNvbT4NCj4gQ2M6IEhlbGdlIERlbGxlciA8ZGVsbGVyQGdteC5k
ZT4NCj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4NCj4gQ2M6IFFpbmcg
V2FuZyA8d2FuZ3FpbmdAdml2by5jb20+DQo+IENjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZu
Ym9yZy5vcmc+DQoNCkFja2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJzeXNm
cy5jIHwgMiArKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJzeXNmcy5jIGIvZHJp
dmVycy92aWRlby9mYmRldi9jb3JlL2Zic3lzZnMuYw0KPiBpbmRleCAyNjg5Mjk0MGMyMTMu
LjhjMWVlOWVjZWMzZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3Jl
L2Zic3lzZnMuYw0KPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJzeXNmcy5j
DQo+IEBAIC05MSw5ICs5MSwxMSBAQCBzdGF0aWMgaW50IGFjdGl2YXRlKHN0cnVjdCBmYl9p
bmZvICpmYl9pbmZvLCBzdHJ1Y3QgZmJfdmFyX3NjcmVlbmluZm8gKnZhcikNCj4gICANCj4g
ICAJdmFyLT5hY3RpdmF0ZSB8PSBGQl9BQ1RJVkFURV9GT1JDRTsNCj4gICAJY29uc29sZV9s
b2NrKCk7DQo+ICsJbG9ja19mYl9pbmZvKGZiX2luZm8pOw0KPiAgIAllcnIgPSBmYl9zZXRf
dmFyKGZiX2luZm8sIHZhcik7DQo+ICAgCWlmICghZXJyKQ0KPiAgIAkJZmJjb25fdXBkYXRl
X3ZjcyhmYl9pbmZvLCB2YXItPmFjdGl2YXRlICYgRkJfQUNUSVZBVEVfQUxMKTsNCj4gKwl1
bmxvY2tfZmJfaW5mbyhmYl9pbmZvKTsNCj4gICAJY29uc29sZV91bmxvY2soKTsNCj4gICAJ
aWYgKGVycikNCj4gICAJCXJldHVybiBlcnI7DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQoo
SFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2
DQo=

--------------K5NZTsrNRyxBfTb34lUQD7gD--

--------------7pW0iiL2LOpjjS6t2sZTZIW4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIE9VoFAwAAAAAACgkQlh/E3EQov+AJ
iQ/+J/wY7Tp8ZOUgAih8VuNd7/FdOIOUFkUodS53AphruLcjSC2bOJot8j7ZHmGs5r2bCPsfRP28
EXIw7sjnpwlXLmSTi5IgUtTZ7P21GtjqWlze0T4PYvkLS93MiqyKkEg1CU+EN/t+eZ/4Snz3JhmI
NR/94ZF+PLOnATIBh0xWfSOCkJk5BkslcjkTSGBGYcGhOdcOam/aR4s1MUJDefgzWZdhtytdP9vk
NoZKdM72NEFQK3czVSTf2eD9jZQ9jBUL5aaTx9+gE2t7T7s2GV97ttMPdoxFMx6QUR1hCJyIcYaH
eLRsVYgieRME6YyNh8q9C3LZRlxHyT3XdSVbdcly0x53hUVvg8vPM5/zhL6WvpHlV/VNjttcuKsa
6eBUyjfW/QdN9id3PpZFmeT3NRhlRXuKXb/KrmCnJF8iurS89jZnWEVT9I3+91ulCXKuTb3wVlAW
RIa+4VurGoxnfuiN/Twmbe5Yfsa8J0g9Z+1rIgsDyyCrmRc1dykEenb6dtv3t8m4rf8ZBJrCGdto
b8x9yyppfj5z27GRuk5a33vEjzSAMEz7U920+w7tlie6GfKw8mwvkDLeSiEnx7+3mdSdBka5SMKk
FOhBEi34mQ+wTOYcetyjtoy/uFpYE/ASkcYXpN6+1OZVQEnNanrDqLdTFrY0NjB0giGLFu25F6Z7
Nw4=
=n690
-----END PGP SIGNATURE-----

--------------7pW0iiL2LOpjjS6t2sZTZIW4--

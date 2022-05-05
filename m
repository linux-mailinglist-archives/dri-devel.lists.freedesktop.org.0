Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB4F51B901
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 09:29:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A5110E052;
	Thu,  5 May 2022 07:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573B710E052
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 07:29:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E82741F891;
 Thu,  5 May 2022 07:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651735780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7oszj393KfchLXHg916YqCIeRK1AJbaDk3ClmN+/Bh4=;
 b=KdLoTN4Z75Y80d7DYk9en/+bOUYMRXtWatVyv7dJiVIBls8UFNV99CZuO6NwRWNGnUmIWE
 2MEbQJ8AHYjtzQMWGXF8ZMd6P65JGgaWUbbhs108yX/XngaaR9htNy0OpeFFZ+qoOJu0aO
 ikHel9TmvzGJxuYVkAjIL4zVhuQNXTA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651735780;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7oszj393KfchLXHg916YqCIeRK1AJbaDk3ClmN+/Bh4=;
 b=xXwR5T8/3cxrsCpiuRH/xS7eWWLDuAie/ZvWTTQ/JmGVcpQmWw0OeaCDHWQpy3r8ojlK6o
 aSv4lpGtJnZYsbDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B5FAF13A65;
 Thu,  5 May 2022 07:29:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ahhCK+R8c2LwcAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 05 May 2022 07:29:40 +0000
Message-ID: <974f4d00-89bc-a2da-6d65-ca4207300794@suse.de>
Date: Thu, 5 May 2022 09:29:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/3] fbdev/simplefb: Cleanup fb_info in .fb_destroy rather
 than .remove
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220504215151.55082-1-javierm@redhat.com>
 <20220504215722.56970-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220504215722.56970-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------M6QrRRNoD3q2fMmWOKHoyYDu"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------M6QrRRNoD3q2fMmWOKHoyYDu
Content-Type: multipart/mixed; boundary="------------UIiPyxvlLyMVaz0POf4AxHbW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>
Message-ID: <974f4d00-89bc-a2da-6d65-ca4207300794@suse.de>
Subject: Re: [PATCH 2/3] fbdev/simplefb: Cleanup fb_info in .fb_destroy rather
 than .remove
References: <20220504215151.55082-1-javierm@redhat.com>
 <20220504215722.56970-1-javierm@redhat.com>
In-Reply-To: <20220504215722.56970-1-javierm@redhat.com>

--------------UIiPyxvlLyMVaz0POf4AxHbW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMDUuMjIgdW0gMjM6NTcgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRoZSBkcml2ZXIgaXMgY2FsbGluZyBmcmFtZWJ1ZmZlcl9yZWxlYXNlKCkg
aW4gaXRzIC5yZW1vdmUgY2FsbGJhY2ssIGJ1dA0KPiB0aGlzIHdpbGwgY2F1c2UgdGhlIHN0
cnVjdCBmYl9pbmZvIHRvIGJlIGZyZWVkIHRvbyBlYXJseS4gU2luY2UgaXQgY291bGQNCj4g
YmUgdGhhdCBhIHJlZmVyZW5jZSBpcyBzdGlsbCBob2xkIHRvIGl0IGlmIHVzZXItc3BhY2Ug
b3BlbmVkIHRoZSBmYmRldi4NCj4gDQo+IFRoaXMgd291bGQgbGVhZCB0byBhIHVzZS1hZnRl
ci1mcmVlIGVycm9yIGlmIHRoZSBmcmFtZWJ1ZmZlciBkZXZpY2Ugd2FzDQo+IHVucmVnaXN0
ZXJlZCBidXQgbGF0ZXIgYSB1c2VyLXNwYWNlIHByb2Nlc3MgdHJpZXMgdG8gY2xvc2UgdGhl
IGZiZGV2IGZkLg0KPiANCj4gVGhlIGNvcnJlY3QgdGhpbmcgdG8gZG8gaXMgdG8gb25seSB1
bnJlZ2lzdGVyIHRoZSBmcmFtZWJ1ZmZlciBpbiB0aGUNCj4gZHJpdmVyJ3MgLnJlbW92ZSBj
YWxsYmFjaywgYnV0IGRvIGFueSBjbGVhbnVwIGluIHRoZSBmYl9vcHMuZmJfZGVzdHJveS4N
Cj4gDQo+IFN1Z2dlc3RlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZnds
bC5jaD4NCj4gU2lnbmVkLW9mZi1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZp
ZXJtQHJlZGhhdC5jb20+DQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4NCg0KUGxlYXNlIHNlZSBteSBxdWVzdGlvbiBiZWxvdy4NCg0K
PiAtLS0NCj4gDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9zaW1wbGVmYi5jIHwgOCArKysr
KysrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NpbXBsZWZiLmMg
Yi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NpbXBsZWZiLmMNCj4gaW5kZXggOTRmYzljNmQwNDEx
Li4yYzE5ODU2MWMzMzggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvc2lt
cGxlZmIuYw0KPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NpbXBsZWZiLmMNCj4gQEAg
LTg0LDYgKzg0LDEwIEBAIHN0cnVjdCBzaW1wbGVmYl9wYXIgew0KPiAgIHN0YXRpYyB2b2lk
IHNpbXBsZWZiX2Nsb2Nrc19kZXN0cm95KHN0cnVjdCBzaW1wbGVmYl9wYXIgKnBhcik7DQo+
ICAgc3RhdGljIHZvaWQgc2ltcGxlZmJfcmVndWxhdG9yc19kZXN0cm95KHN0cnVjdCBzaW1w
bGVmYl9wYXIgKnBhcik7DQo+ICAgDQo+ICsvKg0KPiArICogZmJfb3BzLmZiX2Rlc3Ryb3kg
aXMgY2FsbGVkIGJ5IHRoZSBsYXN0IHB1dF9mYl9pbmZvKCkgY2FsbCBhdCB0aGUgZW5kDQo+
ICsgKiBvZiB1bnJlZ2lzdGVyX2ZyYW1lYnVmZmVyKCkgb3IgZmJfcmVsZWFzZSgpLiBEbyBh
bnkgY2xlYW51cCBoZXJlLg0KPiArICovDQo+ICAgc3RhdGljIHZvaWQgc2ltcGxlZmJfZGVz
dHJveShzdHJ1Y3QgZmJfaW5mbyAqaW5mbykNCj4gICB7DQo+ICAgCXN0cnVjdCBzaW1wbGVm
Yl9wYXIgKnBhciA9IGluZm8tPnBhcjsNCj4gQEAgLTk0LDYgKzk4LDggQEAgc3RhdGljIHZv
aWQgc2ltcGxlZmJfZGVzdHJveShzdHJ1Y3QgZmJfaW5mbyAqaW5mbykNCj4gICAJaWYgKGlu
Zm8tPnNjcmVlbl9iYXNlKQ0KPiAgIAkJaW91bm1hcChpbmZvLT5zY3JlZW5fYmFzZSk7DQo+
ICAgDQo+ICsJZnJhbWVidWZmZXJfcmVsZWFzZShpbmZvKTsNCj4gKw0KPiAgIAlpZiAobWVt
KQ0KPiAgIAkJcmVsZWFzZV9tZW1fcmVnaW9uKG1lbS0+c3RhcnQsIHJlc291cmNlX3NpemUo
bWVtKSk7DQoNClRoZSBvcmlnaW5hbCBwcm9ibGVtIHdpdGggZmJkZXYgaG90LXVucGx1ZyB3
YXMgdGhhdCB2bXdnZnggbmVlZGVkIHRoZSANCmZyYW1lYnVmZmVyIHJlZ2lvbiB0byBiZSBy
ZWxlYXNlZC4gSWYgd2UgcmVsZWFzZSBpdCBvbmx5IGFmdGVyIHVzZXJzcGFjZSANCmNsb3Nl
ZCBpdCdzIGZpbmFsIGZpbGUgZGVzY3JpcHRvciwgdm13Z2Z4IGNvdWxkIGhhdmUgYWxyZWFk
eSBmYWlsZWQuDQoNCkkgc3RpbGwgZG9uJ3QgZnVsbHkgZ2V0IHdoeSB0aGlzIGNvZGUgYXBw
YXJlbnRseSB3b3JrcyBvciBhdCBsZWFzdCANCmRvZXNuJ3QgYmxvdyB1cCBvY2Nhc2lvbmFs
bHkuIEFueSBpZGVhcz8NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAgIH0NCj4gQEAg
LTU0NSw4ICs1NTEsOCBAQCBzdGF0aWMgaW50IHNpbXBsZWZiX3JlbW92ZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgIHsNCj4gICAJc3RydWN0IGZiX2luZm8gKmluZm8g
PSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gICANCj4gKwkvKiBzaW1wbGVmYl9k
ZXN0cm95IHRha2VzIGNhcmUgb2YgaW5mbyBjbGVhbnVwICovDQo+ICAgCXVucmVnaXN0ZXJf
ZnJhbWVidWZmZXIoaW5mbyk7DQo+IC0JZnJhbWVidWZmZXJfcmVsZWFzZShpbmZvKTsNCj4g
ICANCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhS
QiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K


--------------UIiPyxvlLyMVaz0POf4AxHbW--

--------------M6QrRRNoD3q2fMmWOKHoyYDu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJzfOQFAwAAAAAACgkQlh/E3EQov+D3
Xg/9HjoP34X+CZ1CZUlKTe8unr/01RG2xvoO67jA9JafUhE5+LdK6wDeDOL4KMsxtg8cIh7qWNBX
pN4vxSieVJB96bfisMmFNc+1H4XK0AqxG0d9UscOCvl2H3R/gvDMm0NUmLPVPe9ZXB4P3/zFQzTs
oSjhCjUwMP/3HwJofYMImSreDOHOCgHEYS33MR8aAEi5gy6e/yZfQrt57SZyEXlmW0lyC8FXmcFz
J+1zEvQ9OijFvguegpyUD8p8htJisk7hbm4VdodnDPUCAvz0XqqpjdNdgkybZf5NO22cGP/kF8DG
M5hmxD5uOIkjXML/1lIa327Hbfi6lWSJ1Dhdjlj7GNdqUJ3N4LrMhh2V/L5zrBQu6Z5VYGNmIgkB
5Kw1rpAobocgO5VQNvWtxGMgKLGndl4u78Ue91YoWmcpC3KwHyPub6HncH6fnVXo0sdjqXeTJX2c
JYucSPQmF0aaDRdbStokM1PgVOtsWDX8OlRBOZSUjhZoyau5TqA87MwpgnkIhsk2yRjzr9s417Rd
KflWlcUkrpTCQx751Npvt7tOQQ8CV7fH1JnpWKnLD7z4nYr0FlskUvo1MqE1LXi7gMoVSJNi64jR
Zp6iHP8KbItbaia1/glFvbs9aK+Wl+FIkKvEhoTLDHybeHa43i8H4DaLod16NuPFBaXJPd5RlFv1
aa0=
=adqs
-----END PGP SIGNATURE-----

--------------M6QrRRNoD3q2fMmWOKHoyYDu--

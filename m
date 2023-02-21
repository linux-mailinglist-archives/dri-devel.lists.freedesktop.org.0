Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C90C69E03D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 13:23:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2F510E16B;
	Tue, 21 Feb 2023 12:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476D410E16B;
 Tue, 21 Feb 2023 12:23:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DFBF55C5B6;
 Tue, 21 Feb 2023 12:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676982192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bVogKeiYJl46fE6Q0XH+sR2jo+peJbifE+YPYJKeGh0=;
 b=DC6KNE8tXoZxcaKWvIIpm/1f6ZYkOnX/PS2E8hDSsq9kvTTk/+vrcFWhXbAfgeXXzyHqmu
 sdwBv6wuQwO9hkQC5rSHe8kszMRA2t3NcSzaeLH0yNO9n/BFDeq8SUP3p+Lcow54zPvUu8
 as5F6CfusAfLpJtUTSDQVrab7j5s21A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676982192;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bVogKeiYJl46fE6Q0XH+sR2jo+peJbifE+YPYJKeGh0=;
 b=NOJWInHK8cUqJl0kCbN9ekfxIS3KtImgsMX2ahiBRlYIBaKwFQrE2kK8TnK/JMxSmRgr91
 mROgNbItxdCGAyAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9EC2213223;
 Tue, 21 Feb 2023 12:23:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id C5nnJbC39GPhDQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 21 Feb 2023 12:23:12 +0000
Message-ID: <95ea4783-8eb4-63e5-767b-3b7feece955d@suse.de>
Date: Tue, 21 Feb 2023 13:23:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] drm/fb-helper: Remove drm_fb_helper_unprepare() from
 drm_fb_helper_fini()
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20230216140620.17699-1-tzimmermann@suse.de>
 <87y1orxqiz.fsf@minerva.mail-host-address-is-not-set>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87y1orxqiz.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gQcEHzXT0TlEBfedgKN7FskG"
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gQcEHzXT0TlEBfedgKN7FskG
Content-Type: multipart/mixed; boundary="------------5XDQIKa00bWVBDsjXVbbbSYS";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org
Message-ID: <95ea4783-8eb4-63e5-767b-3b7feece955d@suse.de>
Subject: Re: [PATCH] drm/fb-helper: Remove drm_fb_helper_unprepare() from
 drm_fb_helper_fini()
References: <20230216140620.17699-1-tzimmermann@suse.de>
 <87y1orxqiz.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87y1orxqiz.fsf@minerva.mail-host-address-is-not-set>

--------------5XDQIKa00bWVBDsjXVbbbSYS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMDIuMjMgdW0gMTE6Mjcgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cml0
ZXM6DQo+IA0KPj4gTW92ZSBkcm1fZmJfaGVscGVyX3VucHJlcGFyZSgpIGZyb20gZHJtX2Zi
X2hlbHBlcl9maW5pKCkgaW50byB0aGUNCj4+IGNhbGxpbmcgZmJkZXYgaW1wbGVtZW50YXRp
b24uIEF2b2lkcyBhIHBvc3NpYmxlIHN0YWxlIG11dGV4IHdpdGgNCj4+IGdlbmVyaWMgZmJk
ZXYgY29kZS4NCj4+DQo+PiBBcyBpbmRpY2F0ZWQgYnkgaXRzIG5hbWUsIGRybV9mYl9oZWxw
ZXJfcHJlcGFyZSgpIHByZXBhcmVzIHN0cnVjdA0KPj4gZHJtX2ZiX2hlbHBlciBiZWZvcmUg
c2V0dGluZyB1cCB0aGUgZmJkZXYgc3VwcG9ydCB3aXRoIGEgY2FsbCB0bw0KPj4gZHJtX2Zi
X2hlbHBlcl9pbml0KCkuIEluIGxlZ2FjeSBmYmRldiBlbXVsYXRpb24sIHRoaXMgaGFwcGVu
cyBuZXh0DQo+PiB0byBlYWNoIG90aGVyLiBJZiBzdWNjZXNzZnVsLCBkcm1fZmJfaGVscGVy
X2ZpbmkoKSBsYXRlciB0ZWFyIGRvd24NCj4+IHRoZSBmYmRldiBkZXZpY2UgYW5kIGFsc28g
dW5wcmVwYXJlIHZpYSBkcm1fZmJfaGVscGVyX3VucHJlcGFyZSgpLg0KPj4NCj4+IEdlbmVy
aWMgZmJkZXYgZW11bGF0aW9uIHByZXBhcmVzIHN0cnVjdCBkcm1fZmJfaGVscGVyIGltbWVk
aWF0ZWx5DQo+PiBhZnRlciBhbGxvY2F0aW5nIHRoZSBpbnN0YW5jZS4gSXQgb25seSBjYWxs
cyBkcm1fZmJfaGVscGVyX2luaXQoKQ0KPj4gYXMgcGFydCBvZiBwcm9jZXNzaW5nIGEgaG90
cGx1ZyBldmVudC4gSWYgdGhlIGhvdHBsdWctaGFuZGxpbmcgZmFpbHMsDQo+PiBpdCBydW5z
IGRybV9mYl9oZWxwZXJfZmluaSgpLiBUaGlzIHVucHJlcGFyZXMgdGhlIGZiLWhlbHBlciBp
bnN0YW5jZQ0KPj4gYW5kIHRoZSBuZXh0IGhvdHBsdWcgZXZlbnQgcnVucyBvbiBzdGFsZSBk
YXRhLg0KPj4NCj4+IFNvbHZlIHRoaXMgYnkgbW92aW5nIGRybV9mYl9oZWxwZXJfdW5wcmVw
YXJlKCkgZnJvbSBkcm1fZmJfaGVscGVyX2ZpbmkoKQ0KPj4gaW50byB0aGUgZmJkZXYgaW1w
bGVtZW50YXRpb25zLiBDYWxsIGl0IHJpZ2h0IGJlZm9yZSBmcmVlaW5nIHRoZQ0KPj4gZmIt
aGVscGVyIGluc3RhbmNlLg0KPj4NCj4+IEZpeGVzOiA0ODI1Nzk3YzM2ZGEgKCJkcm0vZmIt
aGVscGVyOiBJbnRyb2R1Y2UgZHJtX2ZiX2hlbHBlcl91bnByZXBhcmUoKSIpDQo+IA0KPiBJ
IHRoaW5rIHRoaXMgc2hvdWxkIGJlIEZpeGVzOiAwMzIxMTZiYmUxNTIgKCJkcm0vZmJkZXYt
Z2VuZXJpYzogTWluaW1pemUNCj4gY2xpZW50IHVucmVnaXN0ZXJpbmciKSBpbnN0ZWFkPyBC
ZWNhdXNlIGNvbW1pdCA0ODI1Nzk3YzM2ZGEganVzdCBhZGRlZCBhDQo+IHdyYXBwZXIgZnVu
Y3Rpb24gZm9yIG11dGV4X2Rlc3Ryb3koJmZiX2hlbHBlci0+bG9jayksIGJ1dCBpdCB3YXMg
Y29tbWl0DQo+IDAzMjExNmJiZTE1MiB0aGF0IG1hZGUgZHJtX2ZiZGV2X2NsZWFudXAoKSB0
byBjYWxsIHRoYXQgaGVscGVyIGZ1bmN0aW9uLg0KDQpHb29kIHBvaW50LiBBZnRlciBsb29r
aW5nIHRocm91Z2ggdGhlIHJlY2VudCBmYmRldiBjb21taXRzLCBJJ2xsIHVzZSANCmNvbW1p
dCA2NDMyMzFiMjgzODAgKCJkcm0vZmJkZXYtZ2VuZXJpYzogTWluaW1pemUgaG90cGx1ZyBl
cnJvciANCmhhbmRsaW5nIikgZm9yIHRoZSB0YWcuIFRoaXMgaXMgdGhlIG9uZSB0aGF0IGFk
ZGVkIHRoZSBjYWxsIHRvIA0KZHJtX2ZiX2hlbHBlcl9maW5pKCkgdG8gdGhlIGNsaWVudCdz
IGhvdHBsdWcgaGFuZGxlci4gQW5kIF9maW5pKCkgDQpjdXJyZW50bHkgZG9lcyB0aGUgX3Vu
cHJlcGFyZSgpLCB3aGVuIGl0IHNob3VsZG4ndC4NCg0KPiANCj4+IENjOiBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IENjOiBKYXZpZXIgTWFydGluZXog
Q2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4+IENjOiBNYWFydGVuIExhbmtob3Jz
dCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPj4gQ2M6IE1heGltZSBS
aXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4NCj4+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxp
ZWRAZ21haWwuY29tPg0KPj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4N
Cj4+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Pg0KPj4gU2lnbmVk
LW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiAt
LS0NCj4gDQo+IFRoZSBjaGFuZ2UgaXRzZWxmIGxvb2tzIGdvb2QgdG8gbWUuDQo+IA0KPiBS
ZXZpZXdlZC1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5j
b20+DQo+IA0KDQpUaGFua3MgYSBsb3QuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2No
w6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------5XDQIKa00bWVBDsjXVbbbSYS--

--------------gQcEHzXT0TlEBfedgKN7FskG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmP0t68FAwAAAAAACgkQlh/E3EQov+DZ
QA//VoXz82PV55b8Lfi8ZzTLbB7Rq3P6Sqzn2O0XZys952VSpOLISegHR8uKg3sa3QEY+4OswGR+
bE3lycMHCpHXXhl9N/z4NWY9uhlxt4iYSkpeGh3vbyxxAG3CmjqgyenaUbx+XNkbWspqqYdTNhQF
hzTDmIna+u5d1GU08Otg+V3CoJpH18PjkfkJO6ANTdYS5P69dNzSRYme7R2D0DhnTnWgqQTTya7F
I8qP543IGpEtTUEcI/HkUzD7rKM6gruL5zhQL1isrnRbfopxSa3HnDMy3rNKqhDVTmHb7BfrLnd4
bjzzPfWJwyAAg19Szw9HOzGCA1f7nyB/l755M6WlLl9qW2TX+9MjRnGTXE5XGsS74Sl85DvW3kkV
WSViGzmJ9tb/df1UeaouSCTFvkGgB1SHRCi4OHwZ70tTCqvM+uPBymh3f8VukMBDs7BliCROk00a
xZUrTbQuKZhw8/bE8FCueAetmfL9PCVaokhfODjP+MxF9NMBrEBQiApYNvb+ElxKg0AgVtfa2Whq
ozaQifZoqjn7D4zO6WSwtl8TcGF1bsFxyNhCBc5aUk7pTuKJUrQvcQTFMIUR+yEMBhsHeQLQAxUB
QMKWkk5i5NNrcnl4/R+CuJSFz7dN8y7qMUOmDVTA20T0Ra+JQvy3hR1xR1svuC5zy45Ui2Wky9no
OsQ=
=1Qbn
-----END PGP SIGNATURE-----

--------------gQcEHzXT0TlEBfedgKN7FskG--

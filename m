Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7036259A5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 12:42:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA55610E084;
	Fri, 11 Nov 2022 11:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6309A10E084
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 11:42:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2591A201A1;
 Fri, 11 Nov 2022 11:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668166921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kCZJU6lcgG1QoR22yV3CvbarbQLgFKZyKaAWzv+tV8g=;
 b=Y2WapCfrkkaO3BDq8Lv2EtBNSBm4H8kj+KbUgy0rSEdivPsT7xXykoEvbd73jlQn1IJz4z
 OpNOtjFWLLKvbHMe+zN5ieUdXYk9cjvGxH12hwbt5vUOHJDXtOBqI7x+EyBOulWwfFkS0m
 nAPVsDXyG7Gawpu9Rn/avhdF3OfOmZI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668166921;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kCZJU6lcgG1QoR22yV3CvbarbQLgFKZyKaAWzv+tV8g=;
 b=R89D452yh+ICmX7ST6/CgfqSyNcJmX/VCF4vxNRc+9bVp6DlvNjO1AuEVaO0FaXFaMfF9d
 TsHLYH5XVRgNh8Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 07E9013273;
 Fri, 11 Nov 2022 11:42:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 98L0AAk1bmNoLgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Nov 2022 11:42:01 +0000
Message-ID: <33481e86-8c8a-b464-6112-4ffa6decceaa@suse.de>
Date: Fri, 11 Nov 2022 12:42:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 2/2] fbdev: Add support for the nomodeset kernel parameter
To: Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch
References: <20221107104916.18733-1-tzimmermann@suse.de>
 <20221107104916.18733-3-tzimmermann@suse.de>
 <2e2d23f3-9c2d-e75e-f390-4651a4da730f@gmx.de>
 <6547fba2-a002-f339-2997-5b28df794095@suse.de>
 <d21a0a0d-22fb-99bf-0d29-75b1fe1db677@gmx.de>
 <dfa83c75-4062-93ee-380c-3e0e4f41c448@suse.de>
 <73c7243d-b1b7-ac3c-7b17-1f0084821aa4@redhat.com>
 <3b3d0af7-0ad2-bd45-26ec-bd00eebfa905@gmx.de>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <3b3d0af7-0ad2-bd45-26ec-bd00eebfa905@gmx.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------N77seTBh4NkXZFJpJJ0ElVhe"
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------N77seTBh4NkXZFJpJJ0ElVhe
Content-Type: multipart/mixed; boundary="------------WrTR0PnQSOI6Az3Di2Pw6gMW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <33481e86-8c8a-b464-6112-4ffa6decceaa@suse.de>
Subject: Re: [PATCH 2/2] fbdev: Add support for the nomodeset kernel parameter
References: <20221107104916.18733-1-tzimmermann@suse.de>
 <20221107104916.18733-3-tzimmermann@suse.de>
 <2e2d23f3-9c2d-e75e-f390-4651a4da730f@gmx.de>
 <6547fba2-a002-f339-2997-5b28df794095@suse.de>
 <d21a0a0d-22fb-99bf-0d29-75b1fe1db677@gmx.de>
 <dfa83c75-4062-93ee-380c-3e0e4f41c448@suse.de>
 <73c7243d-b1b7-ac3c-7b17-1f0084821aa4@redhat.com>
 <3b3d0af7-0ad2-bd45-26ec-bd00eebfa905@gmx.de>
In-Reply-To: <3b3d0af7-0ad2-bd45-26ec-bd00eebfa905@gmx.de>

--------------WrTR0PnQSOI6Az3Di2Pw6gMW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMTEuMjIgdW0gMTE6NDkgc2NocmllYiBIZWxnZSBEZWxsZXI6DQo+IE9u
IDExLzExLzIyIDEwOjQ5LCBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgd3JvdGU6DQo+PiBP
biAxMS84LzIyIDA5OjE2LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+PiBIaQ0KPj4N
Cj4+IFsuLi5dDQo+Pg0KPj4+DQo+Pj4gTXkgcHJvcG9zYWwgd291bGQgYmUgdG8gYWRkIGEg
bGl0dGxlIGhlbHBlciB0byBmYmRldiB0aGF0IGluY2x1ZGVzIHlvdXINCj4+PiBzdWdnZXN0
aW9uczoNCj4+Pg0KPj4+IMKgwqDCoCBib29sIGZiX21vZGVzZXR0aW5nX2Rpc2FibGVkKGNv
bnN0IGNoYXIgKmRydm5hbWUpDQo+Pj4gwqDCoMKgIHsNCj4+PiDCoMKgwqDCoMKgwqAgZndv
bmx5ID0gdmlkZW9fZmlybXdhcmVfZHJpdmVyc19vbmx5KCkNCj4+PiDCoMKgwqDCoMKgwqAg
aWYgKGZib25seSAmJiBkcnZuYW1lKQ0KPj4+IMKgwqDCoMKgcHJfd2FybigiIikNCj4+PiDC
oMKgwqDCoMKgwqAgcmV0dXJuIGZib25seTsNCj4+PiDCoMKgwqAgfQ0KPiANCj4gSSdtIHN0
aWxsIHdvbmRlcmluZyB3aHkgeW91IGNhbid0IHNpbXBseSBtZXJnZSBpdCB3aXRoIHdoYXQg
aXMgcHJpbnRlZCBpbg0KPiAgwqBbMV0gDQo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29t
L2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL2RybV9ub21vZGVzZXQuYyNM
MTgNCg0KSSBkb24ndCB1bmRlcnN0YW5kLiBUaGF0IG1lc3NhZ2UgaXMgc3RpbGwgdGhlcmUg
YWZ0ZXIgbW92aW5nIHRoZSBjb2RlIA0KYXJvdW5kLiBJdCBpcyBhbHdheXMgcHJpbnRlZCBp
ZiB0aGUgbm9tb2Rlc2V0IHBhcmFtZXRlciBpcyBnaXZlbi4NCg0KSW4gYWRkaXRpb24gdG8g
dGhhdCwgeW91IGdldCBhIHBlci1kcml2ZXIgd2FybmluZyBmb3IgZmJkZXYsIHNvIHRoYXQg
DQppdCdzIGNsZWFyIHdoaWNoIGRyaXZlcnMgYXJlIGFmZmVjdGVkLg0KDQpCZXN0IHJlZ2Fy
ZHMNClRob21hcw0KDQo+IA0KPiBPdGhlciB0aGFuIHRoYXQsIHlvdXIgdGhlIHByb3Bvc2Fs
IGlzIG9rYXksIGlmIHlvdSBhZGp1c3QgeW91ciBwYXRjaGVzIHRvDQo+IGNhbGwgdGhpcyBu
ZXcgZnVuY3Rpb24gImZiX21vZGVzZXR0aW5nX2Rpc2FibGVkKCkiIGluc3RlYWQgb2YNCj4g
Y2FsbGluZyB2aWRlb19maXJtd2FyZV9kcml2ZXJzX29ubHkoKSBsaWtlIHRoaXM6DQo+IA0K
Pj4gK8KgwqDCoCBpZiAodmlkZW9fZmlybXdhcmVfZHJpdmVyc19vbmx5KCkpDQo+PiArwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9ERVY7DQo+IA0KPiBIZWxnZQ0KDQotLSANClRob21h
cyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVy
ZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhy
ZXI6IEl2byBUb3Rldg0K

--------------WrTR0PnQSOI6Az3Di2Pw6gMW--

--------------N77seTBh4NkXZFJpJJ0ElVhe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNuNQgFAwAAAAAACgkQlh/E3EQov+BF
Rw//ScS+CiSi32N2B4/m6r/TE4gsvZd2IP2Uh8MzSheGTE3q+fFoixP++rF2ddPDXxsKeE1LGNtT
6lOJJJk7IJtqGk3BDXSYJb1+hRh2/dOx6IpWIrmsDD+fbf1SjE0i/c+vxejGgTpZDzaVqB+T9HLr
hCLFQ4pJiVEYWGbIFvGiM0rW1/0IGAgBD8JRDrlA3VY8fLSxThgbQ6MHjvuqH72P+jxid4AJqREp
exNGhDvJR4pOUr26/MIHrU21VisW2ssGtb0/gxMnmNxiPPVbBGqGW22Ra6EvDbVUu/VqM+r+3L0p
n4nCDwZJNO3wSgXq94W0XztlJxqNTuiHnzw4EBGXbBLVawWxGV+TAixTZ1660hO//1xx+bhLo2hy
8z6RoCoGf78Rk8NYOHgtr364cnP4VjxnxzYhBhHk50nIIDndVl8/ZZM4Vri4k74BMxskt2l9ia8o
zMgrozRGUIZKXgeLd6DV8YKmXVLUFjJqF++k7GdgQJiiRQiNMUTbfv8MBnGfjAatMY9yafrJSGV2
jhAFrCd8TheS7lkHnoMtu0a5AdFz4i/GL+eeDxfIfn/9jjqNo44FVPWMcr23TcSGU5f52HpcYECY
Oh1cYQTWadnW3t8U1v3Oe1fKZySIbScaOHfg9mLqBikXnUdTzoecnjf4F1sEUHR0KdDedFDkJBwO
STo=
=mJt6
-----END PGP SIGNATURE-----

--------------N77seTBh4NkXZFJpJJ0ElVhe--

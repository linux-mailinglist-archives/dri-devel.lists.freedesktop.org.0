Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A69E5797099
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 10:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C623010E789;
	Thu,  7 Sep 2023 08:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339FF10E789
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 08:06:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EBE3B1F88C;
 Thu,  7 Sep 2023 08:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694073991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jevjVCyb8VagHsqKJkzCUKGGkbaXB8mZNS25TIrybjE=;
 b=JtBm/ROc0o5WYZkKvGbkGK7rtCH7iyOxcFVi74/vLweQ2jgUn3brhvRmGHjzA3iaqHad/e
 yNDpaYu2Uyesuik7vmtds2vIvzxM+0CvkEhZwKg/1L+klpGqlo4JR7vIy9gYqb7HvU5ho8
 OEsHqimzTuvW/Ko9OYF6OwFsBiJOBnA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694073991;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jevjVCyb8VagHsqKJkzCUKGGkbaXB8mZNS25TIrybjE=;
 b=h8M/uegszXSJcfHVF2EqQMDGmge+KBZKySD0/FO6VUvfjBWQbqKXfLhaTenfAPJB2zxx7l
 N5jC6aU1BVcmR+Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B96DD13AD5;
 Thu,  7 Sep 2023 08:06:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id m1JiLISE+WQ6CgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 07 Sep 2023 08:06:28 +0000
Message-ID: <a34d8e85-38cd-c64b-9698-e0b9d4195620@suse.de>
Date: Thu, 7 Sep 2023 10:06:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 5/7] fbdev/core: Build fb_logo iff CONFIG_LOGO has been
 selected
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Helge Deller <deller@gmx.de>, daniel@ffwll.ch, javierm@redhat.com,
 sam@ravnborg.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20230829142109.4521-1-tzimmermann@suse.de>
 <20230829142109.4521-6-tzimmermann@suse.de>
 <bf8e8402-2def-a365-18be-3b426cb1830a@gmx.de>
 <a0f9f34f-0c4f-9fc8-83ef-899a8f368529@suse.de>
In-Reply-To: <a0f9f34f-0c4f-9fc8-83ef-899a8f368529@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------83VqkkgoLHZLC0YE3Esn64Ch"
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
Cc: linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------83VqkkgoLHZLC0YE3Esn64Ch
Content-Type: multipart/mixed; boundary="------------GmuOlb1GKUyW2IrHE6ZaqG0o";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Helge Deller <deller@gmx.de>, daniel@ffwll.ch, javierm@redhat.com,
 sam@ravnborg.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Message-ID: <a34d8e85-38cd-c64b-9698-e0b9d4195620@suse.de>
Subject: Re: [PATCH 5/7] fbdev/core: Build fb_logo iff CONFIG_LOGO has been
 selected
References: <20230829142109.4521-1-tzimmermann@suse.de>
 <20230829142109.4521-6-tzimmermann@suse.de>
 <bf8e8402-2def-a365-18be-3b426cb1830a@gmx.de>
 <a0f9f34f-0c4f-9fc8-83ef-899a8f368529@suse.de>
In-Reply-To: <a0f9f34f-0c4f-9fc8-83ef-899a8f368529@suse.de>

--------------GmuOlb1GKUyW2IrHE6ZaqG0o
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpBbSAwNC4wOS4yMyB1bSAwOTowOCBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOg0KPiBI
aQ0KPiANCj4gQW0gMDEuMDkuMjMgdW0gMTA6MjIgc2NocmllYiBIZWxnZSBEZWxsZXI6DQo+
PiBPbiA4LzI5LzIzIDE2OjE1LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+PiBPbmx5
IGJ1aWxkIGZiX2xvZ28uYyBpZiBDT05GSUdfTE9HTyBoYXMgYmVlbiBzZWxlY3RlZC4gT3Ro
ZXJ3aXNlDQo+Pj4gcHJvdmlkZSBlbXB0eSBpbXBsZW1lbnRhdGlvbnMgb2YgdGhlIGNvbnRh
aW5lZCBpbnRlcmZhY2VzIGFuZCBhdm9pZA0KPj4+IHVzaW5nIHRoZSBleHBvcnRlZCB2YXJp
YWJsZXMuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4NCj4+IC4uLg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2NvcmUvZmJjb24uYyANCj4+PiBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29y
ZS9mYmNvbi5jDQo+Pj4gaW5kZXggZjE1N2E1YTFkZmZjLi4yNGIwMzg1MTBhNzEgMTAwNjQ0
DQo+Pj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMNCj4+PiArKysg
Yi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjb24uYw0KPj4+IEBAIC00NzQsMTUgKzQ3
NCwxOSBAQCBzdGF0aWMgaW50IF9faW5pdCBmYl9jb25zb2xlX3NldHVwKGNoYXIgKnRoaXNf
b3B0KQ0KPj4+DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghc3RybmNtcChvcHRpb25z
LCAibG9nby1wb3M6IiwgOSkpIHsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBv
cHRpb25zICs9IDk7DQo+Pj4gKyNpZmRlZiBDT05GSUdfTE9HTw0KPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmICghc3RyY21wKG9wdGlvbnMsICJjZW50ZXIiKSkNCj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZiX2NlbnRlcl9sb2dvID0gdHJ1
ZTsNCj4+PiArI2VuZGlmDQo+Pg0KPj4gSU1ITywgKnNvbWV0aW1lcyogaXQgbWFrZXMgc2Vu
c2UgdG8gbm90IHVzZSAjaWZkZWYgYW5kIGNvZGUgaXQgaW5zdGVhZCANCj4+IGxpa2UgdGhp
czoNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKElTX0VOQUJMRUQoQ09O
RklHX0xPR08pICYmDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAhc3Ry
Y21wKG9wdGlvbnMsICJjZW50ZXIiKSkNCj4+IC4uLg0KPj4gVGhhdCB3YXkgdGhlIGNvbXBp
bGVyIHdpbGwgb3B0aW1pemUgdGhhdCBjb2RlIGF3YXkgYXMgd2VsbCwgYnV0IGluDQo+PiBh
ZGRpdGlvbiBpdCB3aWxsIGNvbXBpbGUtY2hlY2sgdGhhdCB5b3UgaGF2ZSBjb3JyZWN0IGNv
ZGluZyBpbmRlcGVuZGVuZA0KPj4gaWYgQ09ORklHX0xPR08gaXMgc2V0IG9yIG5vdC4NCj4g
DQo+IEdvb2QgaWRlYS4gSSdsbCBjaGFuZ2UgaXQuIFRoZSBJU19FTkFCTEVEIGNvZGUgaXMg
YWxzbyBlYXNpZXIgdG8gcmVhZCBJTUhPLg0KDQpJJ2xsIGtlZXAgdGhlIGN1cnJlbnQgYXBw
cm9hY2gsIGJ1dCBpbiBhIHNpbXBsaWZpZWQgZm9ybS4NCg0KPiANCj4gQmVzdCByZWdhcmRz
DQo+IFRob21hcw0KPiANCj4+DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29u
dGludWU7DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0NCj4+Pg0KPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBpZiAoIXN0cm5jbXAob3B0aW9ucywgImxvZ28tY291bnQ6IiwgMTEpKSB7DQo+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb3B0aW9ucyArPSAxMTsNCj4+PiArI2lm
ZGVmIENPTkZJR19MT0dPDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCpv
cHRpb25zKQ0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmJfbG9n
b19jb3VudCA9IHNpbXBsZV9zdHJ0b2wob3B0aW9ucywgJm9wdGlvbnMsIDApOw0KPj4+ICsj
ZW5kaWYNCj4+DQo+PiBzYW1lIGhlcmUuDQo+Pg0KPj4gSGVsZ2UNCj4gDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBO
dWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3
IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K


--------------GmuOlb1GKUyW2IrHE6ZaqG0o--

--------------83VqkkgoLHZLC0YE3Esn64Ch
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmT5hIMFAwAAAAAACgkQlh/E3EQov+C9
JRAAyVsIVuoW2zowfQG0TA89CrPzDvh64zoaeA2iO1xVE3LJo9LnHla78PjtSAQiuqGUKNuxtDz+
eNk4aGsHC/5/VILjDwtX3MvB8wJ9UHCMbH986m/+v6l8xJWsd8E0Q9Fui43i5jWzXpyiT8navZZs
ipKH54hJR0M5LeplSshSeCBKtcYNLkMTFNy1haxkAnC+YBU2T53Gp5swCQB93mdJjSRfka+95ly4
BUnonVqXyu1Pi9qLDeuGraLxhVXYUNggzAS7Dbhx/MUaxrd/vhgCKl5xbpIA0LAFE6z/sem6C2yB
0OJlLLlkPrzyt6ic6fM71aW+kIxVjh3ubrLISwiG1rkDODw8FhKnKGpKqWF11ClYB0spsf+PlRjQ
JOy1vywwxO+Fh+F17iLAYuRdXab9pVRWis8mLmZx0295JcUz7BsG0Asank+fOOdyyzGPJlJl4zPA
NkhzZuRr3Jeasl9smjX2I+qwI3x4GX7FQO+vNowJLR66S+3VMnEj1eji+uV8Xh3S3UTI+6uI8C98
8JjI8yfLPsX/+E5sD/A/sb8PAXPg4OI9FDIJzPotxx4ytAi30lmsWbaaS5aOe3RIzoRtlGrr+e+h
Ycey8OchZ4Gz2MpsDHOd5Rgq9bu0Hw80iKfsjxPfn6mTKnLx+gqTguVVP1wJOw6KXTP4dFQheBoW
tZc=
=A55L
-----END PGP SIGNATURE-----

--------------83VqkkgoLHZLC0YE3Esn64Ch--

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46514472237
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 09:16:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E1510E367;
	Mon, 13 Dec 2021 08:16:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2FF10E367
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 08:16:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AE9C2210FE;
 Mon, 13 Dec 2021 08:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639383396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FLRLtv4IRxfHgr0wbdouUbBaPowwy6AH8eiPZToUe/Q=;
 b=1bI4moOfQb2K9Aj0ZCEOPXWcYPGOstJtT/V8Lvo0SwLbzkwT4wGStTR+0pGXoZYJFwveKj
 Mg901XsS4+tZKrVOe8Sdm3tVVlp7pJ2L1PUeYCb/R2jB1sT1N0pOVlJHplzxSRKGMc1EyI
 kVz0H4fL9TToxalxEZ4CFZksZRUgSkA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639383396;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FLRLtv4IRxfHgr0wbdouUbBaPowwy6AH8eiPZToUe/Q=;
 b=0uNUrJvtIjJiT/+OrGuhvitb/8c91gFQ0s5kvVZvy3kL6T+gZ+sW4dPMldjM7oCZlf8HpX
 sbs1GTveLuYaKgAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7DD4713310;
 Mon, 13 Dec 2021 08:16:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id K+6XHWQBt2EIAwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 13 Dec 2021 08:16:36 +0000
Message-ID: <251204bb-18f6-36cb-377a-557135633318@suse.de>
Date: Mon, 13 Dec 2021 09:16:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v3 1/3] of: Move simple-framebuffer device handling from
 simplefb to of
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>, Hector Martin <marcan@marcan.st>
References: <20211212062407.138309-1-marcan@marcan.st>
 <20211212062407.138309-2-marcan@marcan.st>
 <CAL_Jsq+0=3V7noGbK2-h+yXeCPZ4QMXVroWvTTL5u7i22ibc6w@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAL_Jsq+0=3V7noGbK2-h+yXeCPZ4QMXVroWvTTL5u7i22ibc6w@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PH0T7yAtYZIRqUago0AulNh3"
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PH0T7yAtYZIRqUago0AulNh3
Content-Type: multipart/mixed; boundary="------------8JKj2L3nlW7eEFLPxADymROa";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh+dt@kernel.org>, Hector Martin <marcan@marcan.st>
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Message-ID: <251204bb-18f6-36cb-377a-557135633318@suse.de>
Subject: Re: [PATCH v3 1/3] of: Move simple-framebuffer device handling from
 simplefb to of
References: <20211212062407.138309-1-marcan@marcan.st>
 <20211212062407.138309-2-marcan@marcan.st>
 <CAL_Jsq+0=3V7noGbK2-h+yXeCPZ4QMXVroWvTTL5u7i22ibc6w@mail.gmail.com>
In-Reply-To: <CAL_Jsq+0=3V7noGbK2-h+yXeCPZ4QMXVroWvTTL5u7i22ibc6w@mail.gmail.com>

--------------8JKj2L3nlW7eEFLPxADymROa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMTIuMjEgdW0gMjI6Mjkgc2NocmllYiBSb2IgSGVycmluZzoNCj4gT24g
U3VuLCBEZWMgMTIsIDIwMjEgYXQgMTI6MjQgQU0gSGVjdG9yIE1hcnRpbiA8bWFyY2FuQG1h
cmNhbi5zdD4gd3JvdGU6DQo+Pg0KPj4gVGhpcyBjb2RlIGlzIHJlcXVpcmVkIGZvciBib3Ro
IHNpbXBsZWZiIGFuZCBzaW1wbGVkcm0sIHNvIGxldCdzIG1vdmUgaXQNCj4+IGludG8gdGhl
IE9GIGNvcmUgaW5zdGVhZCBvZiBoYXZpbmcgaXQgYXMgYW4gYWQtaG9jIGluaXRjYWxsIGlu
IHRoZQ0KPj4gZHJpdmVycy4NCj4+DQo+PiBBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4g
PHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiBTaWduZWQtb2ZmLWJ5OiBIZWN0b3IgTWFydGlu
IDxtYXJjYW5AbWFyY2FuLnN0Pg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvb2YvcGxhdGZvcm0u
YyAgICAgICAgICB8ICA0ICsrKysNCj4+ICAgZHJpdmVycy92aWRlby9mYmRldi9zaW1wbGVm
Yi5jIHwgMjEgKy0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkNCj4gDQo+IFJldmlld2VkLWJ5OiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiANCg0KQ2FuIEkgbWVyZ2UgdGhpcyBw
YXRjaCB0aHJvdWdoIERSTSB0cmVlcz8NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KLS0g
DQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBO
w7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6Rm
dHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------8JKj2L3nlW7eEFLPxADymROa--

--------------PH0T7yAtYZIRqUago0AulNh3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmG3AWMFAwAAAAAACgkQlh/E3EQov+By
RQ/+JFh+782OTUmNJbLISJ9izCWVpP06NbUEH2w806+rRYv+wmEGnZ4oqoNt5S0EAOVJQUfuFQob
41AzRDhI5oW5hcXBRYZ87GhslQRTv8Y8AkZ9x+IlBSwUh9H5Y9XYQb6FdxH4GP8GZ0lviIWYsBzM
Hf8XwY6NJbMkNtiQJS5iE8O4THh1EhCy3ISFVMEdnfjgc+j+G4vvWy1MFfxOXEyz+DwYVvc09tW+
26afW4P1MFPJP52Z3lPS6Qzch5Ky0Rw7MeiC2rb+OdR3zvaOYXsPbALEO4IdcM8pKr5c5U8vJGCA
aHwETL1ZjbxRVFwhWifg2tTbJkaVz5K2+MeVOGp7BlJiKjwqsveTyS0pW5jY35lDVt6Mv1CGuB1B
IC4Aukhp/bcTGUWEBDgT4RWk3VU9IWEGU4xZueVLlx46/WEEDd3ayy8cmfz3lbv1O3w34jkV1M0w
Uit6BrTjLn7w26kflVUUW/JPBA57JT4Bv+vTVSVNcxbhnRcFjJjNyN3zPM5gnRaVFcexig/ZkoxB
POs5LB0biAYnWJ/5qa48hshZWUHDiL0Ajn7bfd4bh8i2dqVI16axtIH3Ho3kpfr55y19Qw+klOXb
nYXHwi0hIGHrngkjvGrQkEtKtYrqq6emH+Nurx1GC+hxRNunaTMpXca5+hQLf+m9UBhdURgDEick
OT8=
=pKie
-----END PGP SIGNATURE-----

--------------PH0T7yAtYZIRqUago0AulNh3--

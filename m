Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B09B46217AD
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 16:08:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650D210E28B;
	Tue,  8 Nov 2022 15:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA1D10E28B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 15:08:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0A748219FD;
 Tue,  8 Nov 2022 15:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667920113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1TuCjvfBbroOppGO0Vny0TCSCCxEQLQgJL32UFs60qg=;
 b=ucQa5NixxlxwEcrCkB44clQlpdFm6PSvfU/K3Y3/0M3OM6ahDZXB0ZwnAmm/GIoGiNkuCl
 T5ShN9u3TnyJ4NRGgjXeHfRAYyX8G8gl52sWUWVa6EeuKQR/qHk39BS+SNMZ9iSDqEzP4H
 nMXZvhDaeUBAtW4A9e+m9v8n6Y+Aymk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667920113;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1TuCjvfBbroOppGO0Vny0TCSCCxEQLQgJL32UFs60qg=;
 b=F9MTTpdls/iu8/40uIrTt4GtB7IPpgzPx2bx4V99+XBZPZNGcZeoE/unlhS5ZLvlz0JoiN
 Q5uXVjaJ+h7SNpCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C44ED13398;
 Tue,  8 Nov 2022 15:08:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SUr5LvBwamO3SwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Nov 2022 15:08:32 +0000
Message-ID: <3e613842-4e50-30b3-1eaa-ba6eee8f42f2@suse.de>
Date: Tue, 8 Nov 2022 16:08:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 0/3] drm/fb-helper: Build fixes for cleanup
Content-Language: en-US
To: javierm@redhat.com, daniel@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, jstultz@google.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com
References: <20221107125329.12842-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221107125329.12842-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LEGlTgQIoGRYdyC0DmzmhCTt"
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
--------------LEGlTgQIoGRYdyC0DmzmhCTt
Content-Type: multipart/mixed; boundary="------------UrAAfGccwyKAUbWlcJIWXCAu";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, jstultz@google.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <3e613842-4e50-30b3-1eaa-ba6eee8f42f2@suse.de>
Subject: Re: [PATCH 0/3] drm/fb-helper: Build fixes for cleanup
References: <20221107125329.12842-1-tzimmermann@suse.de>
In-Reply-To: <20221107125329.12842-1-tzimmermann@suse.de>

--------------UrAAfGccwyKAUbWlcJIWXCAu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

YS1iOiBkYW52ZXQgdmlhIGlyYw0KDQpBbSAwNy4xMS4yMiB1bSAxMzo1MyBzY2hyaWViIFRo
b21hcyBaaW1tZXJtYW5uOg0KPiBDbGVhbmluZyB1cCB0aGUgZmJkZXYgY29kZSBwcm9kdWNl
ZCBhIG51bWJlciBvZiBzaW1wbGUgYnVpbGQNCj4gZXJyb3JzLiBGaXggdGhlbS4NCj4gDQo+
IFRob21hcyBaaW1tZXJtYW5uICgzKToNCj4gICAgZHJtL2ZiZGV2OiBJbmNsdWRlIDxsaW51
eC92bWFsbG9jLmg+DQo+ICAgIGRybS9oaXNpbGljb24vaGlibWM6IEluY2x1ZGUgPGxpbnV4
L2lvLmg+IGZvciByZWFkbCgpIGFuZCB3cml0ZWwoKQ0KPiAgICBkcm0vZmItaGVscGVyOiBE
b2N1bWVudCBzdHJ1Y3QgZHJtX2ZiX2hlbHBlci5oaW50X2xlYWtfc21lbV9zdGFydA0KPiAN
Cj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYyAgICAgICAgICAgICAg
fCAxICsNCj4gICBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV92
ZGFjLmMgfCAyICsrDQo+ICAgaW5jbHVkZS9kcm0vZHJtX2ZiX2hlbHBlci5oICAgICAgICAg
ICAgICAgICAgICAgIHwgNyArKysrKysrDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcg
TsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------UrAAfGccwyKAUbWlcJIWXCAu--

--------------LEGlTgQIoGRYdyC0DmzmhCTt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNqcPAFAwAAAAAACgkQlh/E3EQov+CI
jBAAnSfqAP3BCEnK69RHauz4XrunIJkfUvbHmqe5J6pjqIuJ2gV9wdzcv72EsQJKtrLD5Wnzr1xY
6FJMwroSatQH6Zi5XUBUPafABHOIlcSq4N2+ebEvkUfoTdDCtA5mk8dFVJtJO7Th+D0S9cm2Sxky
PD/eYL/UWHMDA8KfOMiYjBomGr/sfPhnFBp6fORLfL8LGfWTD6K3cLhbYM+AG46/ILHfmj683FGa
t7tA+3bMOpzYq1a8XYSUDiRkBg58Fvwos6w3cxul/LgQF3vNYMWq5XgHj05WEQV0E6TFD/Q3CGIy
J1BWnrC/EaRw9KMjc9PEfkfPD7m4vE4bWeUQysn+T/dv7fKeCNBc8wBuTdvjGygktFaiCxQjyR8H
CTRfK+Djjm18odFoV8TIFpEUn4kMXkmJpD6ejCjYM4nIbpIgGQ1H3Ejc0NjMESDEqTnUCMQ6PueQ
IQRXtXKJX7gEDRa/EPoL6HMDNPzFK4Z/m6cXpbK/5nANMSLALM4pvHQic2CKWc/Wyu2aKcETQwiP
UYTgKa348Hi16NtLKYssdYyxMN+PnJ45/fexdxs/ReebkfLuQMVaT/iYZoLC7Unme/BqIUVkuE/W
l1MKhDnA43pgyXvReMURsunGbcJzSDsySYEsJGmJw2QOM1NIH2MKb2lgmrZt5eNBxKU17G2KPPdY
QI4=
=WNQE
-----END PGP SIGNATURE-----

--------------LEGlTgQIoGRYdyC0DmzmhCTt--

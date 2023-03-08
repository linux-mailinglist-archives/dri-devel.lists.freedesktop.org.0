Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D116B030B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 10:38:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EA910E612;
	Wed,  8 Mar 2023 09:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D7E10E608
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 09:38:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 041E521A01;
 Wed,  8 Mar 2023 09:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678268314; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MFjwcD4Vp6zee18l/hOx+s0LnKajCjdYROBFnAJWXn8=;
 b=06nbHXetL2+U8ybThhgCxE9ADDEQxGB6srtfy+202zHewUt8bM8MU5VEHPnXZ4smi9oT1S
 iYej2uLtwQJCxgR88k1yaZzudj6hNLi07Z+UgDhAjlUvR7L/k15+3ZstMeUDHXYa5FcUGP
 wbCZ8Mriw3df69T874Cpvw9HxMFC/DY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678268314;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MFjwcD4Vp6zee18l/hOx+s0LnKajCjdYROBFnAJWXn8=;
 b=kxDkmpn61fYNatyGv6yEFn5yAb0Rg/+7q7eImlcAJFmcc6VukSeH/EFIdG/DC9vdH3VHqq
 pjbJeTCaTJfs1WBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D28331391B;
 Wed,  8 Mar 2023 09:38:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SItDMplXCGQnQAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 08 Mar 2023 09:38:33 +0000
Message-ID: <cf8135bc-a255-1f02-28df-dec42342fb71@suse.de>
Date: Wed, 8 Mar 2023 10:38:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] MAINTAINERS: orphan SIS FRAMEBUFFER DRIVER
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Thomas Winischhofer <thomas@winischhofer.net>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230308071921.10963-1-lukas.bulwahn@gmail.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230308071921.10963-1-lukas.bulwahn@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Fn5fYfi1pyf0sw01AuM9f1QD"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Fn5fYfi1pyf0sw01AuM9f1QD
Content-Type: multipart/mixed; boundary="------------DpXEUfGRdJxUN3aO8OlXX3ln";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Thomas Winischhofer <thomas@winischhofer.net>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <cf8135bc-a255-1f02-28df-dec42342fb71@suse.de>
Subject: Re: [PATCH] MAINTAINERS: orphan SIS FRAMEBUFFER DRIVER
References: <20230308071921.10963-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20230308071921.10963-1-lukas.bulwahn@gmail.com>

--------------DpXEUfGRdJxUN3aO8OlXX3ln
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA4LjAzLjIzIHVtIDA4OjE5IHNjaHJpZWIgTHVrYXMgQnVsd2FobjoNCj4gVGhp
cyB3YXMgdHJpZ2dlcmVkIGJ5IHRoZSBmYWN0IHRoYXQgdGhlIHdlYnBhZ2U6DQo+IA0KPiAg
ICBodHRwOi8vd3d3LndpbmlzY2hob2Zlci5uZXQvbGludXhzaXN2Z2Euc2h0bWwNCj4gDQo+
IGNhbm5vdCBiZSByZWFjaGVkIGFueW1vcmUuDQo+IA0KPiBUaG9tYXMgV2luaXNjaGhvZmVy
IGlzIHN0aWxsIHJlYWNoYWJsZSBhdCB0aGUgZ2l2ZW4gZW1haWwgYWRkcmVzcywgYnV0IGhl
DQo+IGhhcyBub3QgYmVlbiBhY3RpdmUgc2luY2UgMjAwNS4NCj4gDQo+IE1hcmsgdGhlIFNJ
UyBGUkFNRUJVRkZFUiBEUklWRVIgYXMgb3JwaGFuIHRvIHJlZmxlY3QgdGhlIGN1cnJlbnQg
c3RhdGUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMdWthcyBCdWx3YWhuIDxsdWthcy5idWx3
YWhuQGdtYWlsLmNvbT4NCg0KQWNrZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPg0KDQo+IC0tLQ0KPiAgIE1BSU5UQUlORVJTIHwgNCArLS0tDQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMNCj4gaW5kZXggNWQ4ZjQ2
ZjM1YWE0Li4zNTQ1Nzc1MzRhZWYgMTAwNjQ0DQo+IC0tLSBhL01BSU5UQUlORVJTDQo+ICsr
KyBiL01BSU5UQUlORVJTDQo+IEBAIC0xOTE5MSw5ICsxOTE5MSw3IEBAIFc6CWh0dHA6Ly93
d3cuYnJvd25oYXQub3JnL3NpczkwMC5odG1sDQo+ICAgRjoJZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc2lzL3NpczkwMC4qDQo+ICAgDQo+ICAgU0lTIEZSQU1FQlVGRkVSIERSSVZFUg0KPiAt
TToJVGhvbWFzIFdpbmlzY2hob2ZlciA8dGhvbWFzQHdpbmlzY2hob2Zlci5uZXQ+DQo+IC1T
OglNYWludGFpbmVkDQo+IC1XOglodHRwOi8vd3d3LndpbmlzY2hob2Zlci5uZXQvbGludXhz
aXN2Z2Euc2h0bWwNCj4gK1M6CU9ycGhhbg0KPiAgIEY6CURvY3VtZW50YXRpb24vZmIvc2lz
ZmIucnN0DQo+ICAgRjoJZHJpdmVycy92aWRlby9mYmRldi9zaXMvDQo+ICAgRjoJaW5jbHVk
ZS92aWRlby9zaXNmYi5oDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBB
RyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------DpXEUfGRdJxUN3aO8OlXX3ln--

--------------Fn5fYfi1pyf0sw01AuM9f1QD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQIV5kFAwAAAAAACgkQlh/E3EQov+Ct
ZBAAyvCPSk+foGIpM75INZQNCaVicv9az/FZKN/zoESZFGvr5YKRR/G82Iu8EWUKnKGjJnsd5+v5
0fV+AOpFUONNFPq9mPt4VYUtmvv4iZHF+u38uoxbDKCGAU5YWaJ6vE0fbN43Gj87DJ+8iSwMG1Pp
Sjs37Z6atV2YhnLKPnoznXB5zoWuzqQPVCbwBJePGAUFNjTBWDKMVlJkEfuK6Abg2qGo04eXhNkp
1dMure1a87vF1M0Xp5Xnq7cD0xJDOLmueXgrwhqp5+pJHG0z9x98RMiEd38tCln6ONhB3GIpfZ5/
x2xBSMbofXaRcb2FwDOgbodvR55zGHnEENgwBENGfuk0E37wG1BOCipiCQjzGvW+RFAVwMqunMpu
iYnup//IFSXdr6EEZu5dWEWqUxD/5eJOqpF0z2bXO1zfzoBV3icSz6LfPrlKBX4JbbqqmmcwyxaZ
2SbvzLujU/oeOdQewwpklX+z8qt5p+cJ54ME53HE7GVuzlahhSAv4nK37kaVJJkibWLNuWk6xAL8
IR0NWHqJfzFAlGZZ4gsYa8qa/Koil4SGGzsKB5whcVYUrPEIyRONhGAxoOTt4S+Gp0a6ZPUNrTfb
1QrJ/oEh0/DBPnB8du8r951t025yIvPQgmRhf5h13ADR6U0h9ugA6aCWu2xt785bhXMrAwr3eAin
bT0=
=3WCc
-----END PGP SIGNATURE-----

--------------Fn5fYfi1pyf0sw01AuM9f1QD--

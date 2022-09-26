Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D76D5E9A30
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 09:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E443B10E586;
	Mon, 26 Sep 2022 07:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7C410E586
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 07:09:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 132E01FCEC;
 Mon, 26 Sep 2022 07:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664176173; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ly+mBMSjR5+99cJhp0egOPTS0O5Jsqu/1wb5COyw4qg=;
 b=2ZYPATPuV9rCu3ZsZUoJr+r0YOyszTY3I00wZvm+4U8hD0zqy0otFlAgwUVtVeIDWyRGc2
 3CEHH+zaPKGcYCCsIuMvemmUyoKsB3ciG21W8CeYx7GHhlno+/EiUdJoJebcZuHyqzVxEc
 SGXDga9JWTiw6HT0gISSC1Bngu7IcDA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664176173;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ly+mBMSjR5+99cJhp0egOPTS0O5Jsqu/1wb5COyw4qg=;
 b=fqdoShhKRxBCqclbllvOLjI3mgC12oqkx8mmAIvQslAtqju93TYaJqLsk9wdvd2iwafRMX
 PqWcwKZc9w3rpxDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DE456139BD;
 Mon, 26 Sep 2022 07:09:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IuxKNSxQMWNzMAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 26 Sep 2022 07:09:32 +0000
Message-ID: <e3571e46-40d2-9b96-848b-ea7ceb8646be@suse.de>
Date: Mon, 26 Sep 2022 09:09:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/2] video: fbdev: gbefb: Remove unproper information
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 broonie@kernel.org, maarten.lankhorst@linux.intel.com, daniel.vetter@ffwll.ch
References: <20220902025612.3833972-1-jiasheng@iscas.ac.cn>
 <d57755de-44dc-e39c-6f79-1c139a77525f@gmx.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <d57755de-44dc-e39c-6f79-1c139a77525f@gmx.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------v0PzPimV8QeGSfy1gdg0YYsv"
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------v0PzPimV8QeGSfy1gdg0YYsv
Content-Type: multipart/mixed; boundary="------------BzsH74bs3ZPyVla2BMGSwHvF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Helge Deller <deller@gmx.de>, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 broonie@kernel.org, maarten.lankhorst@linux.intel.com, daniel.vetter@ffwll.ch
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <e3571e46-40d2-9b96-848b-ea7ceb8646be@suse.de>
Subject: Re: [PATCH 2/2] video: fbdev: gbefb: Remove unproper information
References: <20220902025612.3833972-1-jiasheng@iscas.ac.cn>
 <d57755de-44dc-e39c-6f79-1c139a77525f@gmx.de>
In-Reply-To: <d57755de-44dc-e39c-6f79-1c139a77525f@gmx.de>

--------------BzsH74bs3ZPyVla2BMGSwHvF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMDkuMjIgdW0gMTM6MjQgc2NocmllYiBIZWxnZSBEZWxsZXI6DQo+IE9u
IDkvMi8yMiAwNDo1NiwgSmlhc2hlbmcgSmlhbmcgd3JvdGU6DQo+PiBXaGVuIGRyaXZlcnMg
YXJlIHdvcmtpbmcgcHJvcGVybHksIHRoZXkgYXJlIHF1aWV0Lg0KPj4gVGhlcmVmb3JlLCB0
aGUgZmJfaW5mbygpIHNob3VsZCBiZSByZW1vdmVkLg0KPiANCj4gTkFLLg0KPiBUaGlzIHNl
ZW1zIHRvIGJlIHVzZWZ1bCBpbmZvIGFib3V0IHRoZSBkZXRlY3RlZCBjYXJkIGFuZCBpdCdz
IG9ubHkNCj4gcHJpbnRlZCBvbmNlLg0KDQpXZWxsLCBoZSBoYXMgYSBwb2ludC4gTWF5YmUg
dGhpcyBjb3VsZCBiZWNvbWUgYW4gZmJfZGJnKCkgPyAgKEJUVywgaXQncyANCmEgYml0IHVu
Zm9ydHVuYXRlIHRoYXQgdGhlcmUncyBhbiBmYl9pbmZvIG1hY3JvIGFuZCBhbiBmYl9pbmZv
IHN0cnVjdC4gOi8pDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IEhlbGdlDQo+
IA0KPj4gU2lnbmVkLW9mZi1ieTogSmlhc2hlbmcgSmlhbmcgPGppYXNoZW5nQGlzY2FzLmFj
LmNuPg0KPj4gLS0tDQo+PiDCoCBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2diZWZiLmMgfCA0IC0t
LS0NCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2diZWZiLmMgYi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2diZWZiLmMNCj4+IGluZGV4IDE1ODJjNzE4MzI5Yy4uN2UzOWFiOTM5NjkxIDEwMDY0
NA0KPj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9nYmVmYi5jDQo+PiArKysgYi9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L2diZWZiLmMNCj4+IEBAIC0xMjE3LDEwICsxMjE3LDYgQEAgc3Rh
dGljIGludCBnYmVmYl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlIA0KPj4gKnBfZGV2
KQ0KPj4NCj4+IMKgwqDCoMKgwqAgcGxhdGZvcm1fc2V0X2RydmRhdGEocF9kZXYsIGluZm8p
Ow0KPj4NCj4+IC3CoMKgwqAgZmJfaW5mbyhpbmZvLCAiJXMgcmV2ICVkIEAgMHglMDh4IHVz
aW5nICVka0IgbWVtb3J5XG4iLA0KPj4gLcKgwqDCoMKgwqDCoMKgIGluZm8tPmZpeC5pZCwg
Z2JlX3JldmlzaW9uLCAodW5zaWduZWQpR0JFX0JBU0UsDQo+PiAtwqDCoMKgwqDCoMKgwqAg
Z2JlX21lbV9zaXplID4+IDEwKTsNCj4+IC0NCj4+IMKgwqDCoMKgwqAgcmV0dXJuIDA7DQo+
Pg0KPj4gwqAgb3V0X2diZV91bm1hcDoNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQoo
SFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2
DQo=

--------------BzsH74bs3ZPyVla2BMGSwHvF--

--------------v0PzPimV8QeGSfy1gdg0YYsv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMxUCwFAwAAAAAACgkQlh/E3EQov+AS
PA//epTyk0Ro2IGTikWzKpIsZN0JI5xqkfkmwM9oTVdU3N3uTRJpJxj4xAsEv4n0uvgI8Olg3+ci
tdbweiMnDeKHhoSBsH+DRhbXSKA/UkDoj32VwHbgoAiFFA0VmXrAGIvLlrju4YxjckNEKnb/9E3i
YT+8KURmi24Rqs5VC82YZeleImgybQUE/5UjOdyouKh6ixCdgal0WI+ijNU9ECIDbvcDE58xHDSx
+I1tOtjHOj+KFX6JxoMErNREMQOv5Sgv3J9zVnOaR9ZxHiozCli71VgxvWTtwM+uRa5HBAmhe0NT
VazjJVw4OsuK60I0cM0jurbw/4dtPRaGe1SVlH3+BGL79cR37R8H3verjj48mJmU6cO4GyJJF04u
vxLFjwENlwxZr8SP9p2g/oR9xVOK2/pHFVGFvT+MCRDu02mPsvu30Yr8B0BhadXXBeMRUeJ4Bqnw
OgGicbHcel2EVC64k2au0g7aZXJ4Jhae81cKYQA2HGTqEpKt0A7uMHzoaO0AHKIQzGb/5+UBUsul
w40zTV1MHkYVr3vCluDQefM6KH68Hm68z2gBVa2KktlRd3s5PErMIyVuMNrwDQXVw4yd6kBPRht2
vDxZ4WpvwARv72ZK3OjJzoAoVYXygmIWtJ1BqicJPfXzqecepjED6sIN+KyHAJ7ML27HO7lUY1xw
V3I=
=p1Ou
-----END PGP SIGNATURE-----

--------------v0PzPimV8QeGSfy1gdg0YYsv--

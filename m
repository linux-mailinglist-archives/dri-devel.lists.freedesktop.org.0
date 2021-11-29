Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D9D46116B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 10:51:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FEB6EDD2;
	Mon, 29 Nov 2021 09:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3076EDD2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 09:51:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B0CCF212C5;
 Mon, 29 Nov 2021 09:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638179492; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fJ1eEIEjTh5+4Z/b79xBvV+FqXDwjskU2z2SoTOwtv0=;
 b=fdeT3YOS3f+xbRIObZrxnWZ7zT2K99y0ohEK3aFA1qxDASWi0RZUaWoPDcTE/QXLfVwIf1
 56Q8g3/Jyw4Qs2UhvdJbb+AJrxzarAyRPEcHNXvgiTL4NjwHcCNQY4qGQymmFePIK2Vnb3
 A+28c80ZbZzfInURiGClOe73qEaFKuc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638179492;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fJ1eEIEjTh5+4Z/b79xBvV+FqXDwjskU2z2SoTOwtv0=;
 b=cPBAOQSZWaunvrcqI56YONEK40xnU/yAMf/ZxMLPumIOWgYTDKfL4PPyqcJ/kvfDwZySOX
 gfmcIDCTbEQLj9Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7C8CB13B53;
 Mon, 29 Nov 2021 09:51:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Hnz1HKSipGEnYgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 29 Nov 2021 09:51:32 +0000
Message-ID: <9518975e-89c2-b863-e514-a8c68b6dbb03@suse.de>
Date: Mon, 29 Nov 2021 10:51:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 0/3] drm/cma-helper: Clean up public interface
Content-Language: en-US
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, laurent.pinchart@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, emma@anholt.net
References: <20211115120148.21766-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211115120148.21766-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CxkZP7xMadMy0QjpTSxpu0gZ"
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
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CxkZP7xMadMy0QjpTSxpu0gZ
Content-Type: multipart/mixed; boundary="------------1msTdiMgPe6TNWtS9FKGetcn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, laurent.pinchart@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, emma@anholt.net
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Message-ID: <9518975e-89c2-b863-e514-a8c68b6dbb03@suse.de>
Subject: Re: [PATCH 0/3] drm/cma-helper: Clean up public interface
References: <20211115120148.21766-1-tzimmermann@suse.de>
In-Reply-To: <20211115120148.21766-1-tzimmermann@suse.de>

--------------1msTdiMgPe6TNWtS9FKGetcn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

cGluZy4gQXJlIHRoZXJlIGZ1cnRoZXIgY29tbWVudHMgb24gdGhpcyBwYXRjaHNldD8NCg0K
QW0gMTUuMTEuMjEgdW0gMTM6MDEgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoNCj4gQ29u
dmVydCBHRU0gQ01BIGZ1bmN0aW9ucyB0byBhY2NlcHQgc3RydWN0IGRybV9nZW1fY21hX29i
amVjdCwgcHJvdmlkZQ0KPiBzbWFsbCB3cmFwcGVycyBmb3IgR0VNIG9iamVjdCBjYWxsYmFj
a3MgYW5kIHVwZGF0ZSBhbGwgdXNlcnMuIEJyaW5ncw0KPiB1cCB0aGUgaW50ZXJmYWNlIHRv
IHRoZSBwYXR0ZXJuIHVzZWQgaW4gU0hNRU0gYW5kIFZSQU0gaGVscGVycy4NCj4gDQo+IENv
bnZlcnRpbmcgYWxsIEdFTSBvYmplY3QgZnVuY3Rpb25zIHRvIHVzZSBkcm1fZ2VtX2NtYV9v
YmplY3QgZW5hYmxlcw0KPiB0eXBlIGNoZWNraW5nIGJ5IHRoZSBDIGNvbXBpbGVyLiBQcmV2
aW91cyBjYWxsZXJzIGNvdWxkIGhhdmUgcGFzc2VkIGFueQ0KPiBpbXBsZW1lbnRhdGlvbiBv
ZiBkcm1fZ2VtX29iamVjdCB0byB0aGUgR0VNIENNQSBoZWxwZXJzLiBJdCBhbHNvDQo+IHJl
bW92ZXMgdXBjYXN0aW5nIGluIHRoZSBHRU0gZnVuY3Rpb25zIGFuZCBzaW1wbGlmaWVzIHRo
ZSBjYWxsZXIgc2lkZS4NCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzLg0KPiANCj4gRm9yIEdF
TSBvYmplY3QgY2FsbGJhY2tzLCB0aGUgQ01BIGhlbHBlciBsaWJyYXJ5IG5vdyBwcm92aWRl
cyBhDQo+IG51bWJlciBvZiBzbWFsbCB3cmFwcGVycyB0aGF0IGRvIHRoZSBuZWNlc3Nhcnkg
dXBjYXN0aW5nLiBBZ2FpbiBubw0KPiBmdW5jdGlvbmFsIGNoYW5nZXMuDQo+IA0KPiBUaG9t
YXMgWmltbWVybWFubiAoMyk6DQo+ICAgIGRybS9jbWEtaGVscGVyOiBNb3ZlIGRyaXZlciBh
bmQgZmlsZSBvcHMgdG8gdGhlIGVuZCBvZiBoZWFkZXINCj4gICAgZHJtL2NtYS1oZWxwZXI6
IEV4cG9ydCBkZWRpY2F0ZWQgd3JhcHBlcnMgZm9yIEdFTSBvYmplY3QgZnVuY3Rpb25zDQo+
ICAgIGRybS9jbWEtaGVscGVyOiBQYXNzIEdFTSBDTUEgb2JqZWN0IGluIHB1YmxpYyBpbnRl
cmZhY2VzDQo+IA0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2NtYV9oZWxwZXIuYyAg
fCAgNzMgKysrKystLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVf
a21zLmMgfCAgMTAgKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9iby5jICAgICAg
ICAgIHwgICA4ICstDQo+ICAgaW5jbHVkZS9kcm0vZHJtX2dlbV9jbWFfaGVscGVyLmggICAg
ICB8IDE4OSArKysrKysrKysrKysrKysrKysrLS0tLS0tLQ0KPiAgIDQgZmlsZXMgY2hhbmdl
ZCwgMTgwIGluc2VydGlvbnMoKyksIDEwMCBkZWxldGlvbnMoLSkNCj4gDQo+IA0KPiBiYXNl
LWNvbW1pdDogOWZjY2QxMmNmYWMxYzg2M2ZhNDZkNGQxN2MyZDhhYzI1YTQ0YjE5MA0KPiAt
LQ0KPiAyLjMzLjENCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBB
RyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------1msTdiMgPe6TNWtS9FKGetcn--

--------------CxkZP7xMadMy0QjpTSxpu0gZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGkoqMFAwAAAAAACgkQlh/E3EQov+D1
8A/+PibFx3AiYi7VHqcu+ChB7aTvu//3yigbx9InM5eUFFmyJ1SSoh103U0zga6btCNRvsebfaQT
2ZGQoLmXYjKudAflvNwaPxycJ2D9GIObVWvHinigxma3bB+mD9jprfyvaMgqTA5noCpnNl4yXJAJ
hnw7tjy8yUeCQ8spUCVwUihmyU59P1NcSvre8UAP3hTaB39vG+vi9ajdCHH4ErSxeeMXWqQ5+cgw
6LLrct995sK+eZSwjq8GAL++2NbKV2vHyuqshsNk9PBH/Puv1569yvk9P0UjBsfMdewhas/8sOa5
vIKsRF2g6fp38MVXS6Yyi8OAdJJt791Pr4pg8DCqbI2+2bHttAo5BnI5lYJ0ua5u6XVws32Hl65+
nLmxdEa1mW3o47jMz7sLWBhVx4dukAUgy6y/hzDUdqMNLZ0kKOfk/8KQUtoxWSwpICLhFySLF81e
YYVMvOXW44KFUgXDuXcoZ1gTJf8yXd+iuSS6F9uAo9H+XF8m8kTN9bASTLIWDWIL43DOoLhx2ig0
ZQdUwhtZNOrKEaL/Qn+JBi6zLXgyQwfSxqFQGrUP7Kqfep2l4jrf8t/a3Uc1l/q455Fp9D1Hrqlr
hnmEXlekpSGDJaTQZo4mXHOovRtrWrTJPTFJXq/pBmeF76BvRz/XnXuJ0EeG0tkJYTKfAl7MwbZd
czU=
=0rdh
-----END PGP SIGNATURE-----

--------------CxkZP7xMadMy0QjpTSxpu0gZ--

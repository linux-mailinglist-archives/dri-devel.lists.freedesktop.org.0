Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE9C5B54FA
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 09:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9CE10E22F;
	Mon, 12 Sep 2022 07:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BDA10E22B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 07:03:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D45BE2276B;
 Mon, 12 Sep 2022 07:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662966234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o23KHUPjVFejyNtY98FmaJxfMASgEIXC+XgS4W+x+II=;
 b=0/jErJy2G2N1m1QG82spTkVCHVn8e2cRL/Dg+0e//QIQwMMuxfA+Ayyl5dpY52eJ0/72uZ
 /KhLBveWu2WB9Novcg3ApcUrfPrbMuHNBqldni/iqu9hs/4aujf/t07xBQsDMYSMJRyOFn
 RwA9Zc7Yk7hAPLWnPBZboI3O6yeb398=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662966234;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o23KHUPjVFejyNtY98FmaJxfMASgEIXC+XgS4W+x+II=;
 b=xi6xC+xGcnPTb4RE1MpmnuAiLb95T8PZ7llhT00/o13fdJL+E6D4E4aNR+LYDCeGihZMLT
 2250Y60ICLAs+QAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A7D30139C8;
 Mon, 12 Sep 2022 07:03:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jrH6J9rZHmOYBAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Sep 2022 07:03:54 +0000
Message-ID: <34e6ccfe-d6a0-e832-14a9-0445b61db106@suse.de>
Date: Mon, 12 Sep 2022 09:03:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/hyperv: Don't rely on screen_info.lfb_base for Gen1
 VMs
To: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
References: <1662734639-27164-1-git-send-email-ssengar@linux.microsoft.com>
 <14302178-c797-8635-4325-070f78b7f805@suse.de>
 <20220911162119.GB7754@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220911162119.GB7754@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Z0yg9rMNaNgSK69xDmzJvR6y"
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
Cc: linux-hyperv@vger.kernel.org, airlied@linux.ie, ssengar@microsoft.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mikelley@microsoft.com, drawat.floss@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Z0yg9rMNaNgSK69xDmzJvR6y
Content-Type: multipart/mixed; boundary="------------uTUVGSPzFQ1V00PJzhsjSO72";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, airlied@linux.ie, ssengar@microsoft.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mikelley@microsoft.com, drawat.floss@gmail.com
Message-ID: <34e6ccfe-d6a0-e832-14a9-0445b61db106@suse.de>
Subject: Re: [PATCH] drm/hyperv: Don't rely on screen_info.lfb_base for Gen1
 VMs
References: <1662734639-27164-1-git-send-email-ssengar@linux.microsoft.com>
 <14302178-c797-8635-4325-070f78b7f805@suse.de>
 <20220911162119.GB7754@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
In-Reply-To: <20220911162119.GB7754@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>

--------------uTUVGSPzFQ1V00PJzhsjSO72
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMDkuMjIgdW0gMTg6MjEgc2NocmllYiBTYXVyYWJoIFNpbmdoIFNlbmdh
cjoNCj4gT24gU2F0LCBTZXAgMTAsIDIwMjIgYXQgMDg6MTE6MjRQTSArMDIwMCwgVGhvbWFz
IFppbW1lcm1hbm4gd3JvdGU6DQo+PiBIaQ0KPj4NCj4+IEFtIDA5LjA5LjIyIHVtIDE2OjQz
IHNjaHJpZWIgU2F1cmFiaCBTZW5nYXI6DQo+Pj4gaHlwZXJ2X3NldHVwX3ZyYW0gdHJpZXMg
dG8gcmVtb3ZlIGNvbmZsaWN0aW5nIGZyYW1lYnVmZmVyIGJhc2VkIG9uDQo+Pj4gJ3NjcmVl
bl9pbmZvJy4gQXMgb2JzZXJ2ZWQgaW4gcGFzdCBkdWUgdG8gc29tZSBidWcgb3Igd3Jvbmcg
c2V0dGluZw0KPj4+IGluIGdydWIsIHRoZSAnc2NyZWVuX2luZm8nIGZpZWxkcyBtYXkgbm90
IGJlIHNldCBmb3IgR2VuMSwgYW5kIGluIHN1Y2gNCj4+PiBjYXNlcyBkcm1fYXBlcnR1cmVf
cmVtb3ZlX2NvbmZsaWN0aW5nX2ZyYW1lYnVmZmVycyB3aWxsIG5vdCBkbyBhbnl0aGluZw0K
Pj4+IHVzZWZ1bC4NCj4+PiBGb3IgR2VuMSBWTXMsIGl0IHNob3VsZCBhbHdheXMgYmUgcG9z
c2libGUgdG8gZ2V0IGZyYW1lYnVmZmVyDQo+Pj4gY29uZmxpY3QgcmVtb3ZlZCB1c2luZyBQ
Q0kgZGV2aWNlIGluc3RlYWQuDQo+Pj4NCj4+PiBGaXhlczogYTBhYjVhYmNlZDU1ICgiZHJt
L2h5cGVydiA6IFJlbW92aW5nIHRoZSByZXN0cnVjdGlvbiBvZiBWUkFNIGFsbG9jYXRpb24g
d2l0aCBQQ0kgYmFyIHNpemUiKQ0KPj4+IFNpZ25lZC1vZmYtYnk6IFNhdXJhYmggU2VuZ2Fy
IDxzc2VuZ2FyQGxpbnV4Lm1pY3Jvc29mdC5jb20+DQo+Pj4gLS0tDQo+Pj4gICBkcml2ZXJz
L2dwdS9kcm0vaHlwZXJ2L2h5cGVydl9kcm1fZHJ2LmMgfCAyNCArKysrKysrKysrKysrKysr
KysrKy0tLS0NCj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oeXBl
cnYvaHlwZXJ2X2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9oeXBlcnYvaHlwZXJ2X2Ry
bV9kcnYuYw0KPj4+IGluZGV4IDZkMTFlNzkzOGM4My4uYjBjYzk3NGVmYTQ1IDEwMDY0NA0K
Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9oeXBlcnYvaHlwZXJ2X2RybV9kcnYuYw0KPj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9oeXBlcnYvaHlwZXJ2X2RybV9kcnYuYw0KPj4+IEBA
IC03MywxMiArNzMsMjggQEAgc3RhdGljIGludCBoeXBlcnZfc2V0dXBfdnJhbShzdHJ1Y3Qg
aHlwZXJ2X2RybV9kZXZpY2UgKmh2LA0KPj4+ICAgCQkJICAgICBzdHJ1Y3QgaHZfZGV2aWNl
ICpoZGV2KQ0KPj4+ICAgew0KPj4+ICAgCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSAmaHYt
PmRldjsNCj4+PiArCXN0cnVjdCBwY2lfZGV2ICpwZGV2Ow0KPj4+ICAgCWludCByZXQ7DQo+
Pj4gLQlkcm1fYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX2ZyYW1lYnVmZmVycyhzY3Jl
ZW5faW5mby5sZmJfYmFzZSwNCj4+PiAtCQkJCQkJICAgICBzY3JlZW5faW5mby5sZmJfc2l6
ZSwNCj4+PiAtCQkJCQkJICAgICBmYWxzZSwNCj4+PiAtCQkJCQkJICAgICAmaHlwZXJ2X2Ry
aXZlcik7DQo+Pj4gKwlpZiAoZWZpX2VuYWJsZWQoRUZJX0JPT1QpKSB7DQo+Pj4gKwkJZHJt
X2FwZXJ0dXJlX3JlbW92ZV9jb25mbGljdGluZ19mcmFtZWJ1ZmZlcnMoc2NyZWVuX2luZm8u
bGZiX2Jhc2UsDQo+Pj4gKwkJCQkJCQkgICAgIHNjcmVlbl9pbmZvLmxmYl9zaXplLA0KPj4N
Cj4+IFVzaW5nIHNjcmVlbl9pbmZvIGhlcmUgc2VlbXMgd3JvbmcgaW4gYW55IGNhc2UuIFlv
dSB3YW50IHRvIHJlbW92ZQ0KPj4gdGhlIGZyYW1lYnVmZmVyIGRldmljZXMgdGhhdCBjb25m
bGljdCB3aXRoIHlvdXIgZHJpdmVyLCB3aGljaCBtaWdodA0KPj4gYmUgdW5yZWxhdGVkIHRv
IHNjcmVlbl9pbmZvLiBBRkFJQ1QgdGhlIGNvcnJlY3Qgc29sdXRpb24gd291bGQNCj4+IGFs
d2F5cyByZXRyaWV2ZSB0aGUgUENJIGRldmljZSBmb3IgcmVtb3ZhbCAoaS5lLiwgYWx3YXlz
IGRvIHRoZSBlbHNlDQo+PiBicmFuY2gpLg0KPiANCj4gSW4gYSBHZW4yIFZNLCB0aGUgSHlw
ZXItViBmcmFtZSBidWZmZXIgZGV2aWNlIGlzIHByZXNlbnRlZCBvbmx5IGFzIGEgVk1idXMg
ZGV2aWNlLg0KPiBJdCdzIG5vdCBwcmVzZW50ZWQgYXMgYSBQQ0kgZGV2aWNlIGxpa2UgaXQg
aXMgaW4gYSBHZW4xIFZNLiBUaGlzIHdvdWxkIGhhdmUgd29ya2VkDQo+IGlmIHdlIGhhZCB0
aGUgZnJhbWUgYnVmZmVyIGRldmljZSBhdmFpbGFibGUgYXMgUENJIGRldmljZSBpbiBHZW4y
IGJ1dCB1bmZvcnR1bmF0ZWx5DQo+IHRoYXRzIG5vdCB0aGUgY2FzZSBoZXJlLg0KDQpUaGFu
a3MgZm9yIGV4cGxhaW5pbmcuIFRoZXJlIGlzIGFuIGluc3RhbmNlIG9mIHN0cnVjdCBodl9k
ZXZpY2UgcGFzc2VkIA0KdG8gdGhlIHByb2JlIGZ1bmN0aW9uLiBJIHN1c3BlY3QgeW91IGNh
bm5vdCBnZXQgdGhlIGZyYW1lYnVmZmVyIHJhbmdlIA0KZnJvbSB0aGlzIGluc3RhbmNlIChl
LmcuLCB2aWEgdGhlIGRldmljZSdzIHBsYXRmb3JtX2RhdGEpPw0KDQpJZiB5b3UgYWJzb2x1
dGVseSBjYW4ndCBnZXQgdGhlIGFjdHVhbCBtZW1vcnkgcmVnaW9uIGZyb20gdGhlIGRldmlj
ZSwgDQppdCdzIGJldHRlciB0byByZW1vdmUgYWxsIGZyYW1lYnVmZmVycyB2aWEgDQpkcm1f
YXBlcnR1cmVfcmVtb3ZlX2ZyYW1lYnVmZmVycygpIHRoYW4gdG8gdXNlIHNjcmVlbl9pbmZv
Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBSZWdhcmRzLA0KPiBTYXVyYWJo
DQo+IA0KPj4NCj4+IEJlc3QgcmVnYXJkDQo+PiBUaG9tYXMNCj4+DQo+Pj4gKwkJCQkJCQkg
ICAgIGZhbHNlLA0KPj4+ICsJCQkJCQkJICAgICAmaHlwZXJ2X2RyaXZlcik7DQo+Pj4gKwl9
IGVsc2Ugew0KPj4+ICsJCXBkZXYgPSBwY2lfZ2V0X2RldmljZShQQ0lfVkVORE9SX0lEX01J
Q1JPU09GVCwgUENJX0RFVklDRV9JRF9IWVBFUlZfVklERU8sIE5VTEwpOw0KPj4+ICsJCWlm
ICghcGRldikgew0KPj4+ICsJCQlkcm1fZXJyKGRldiwgIlVuYWJsZSB0byBmaW5kIFBDSSBI
eXBlci1WIHZpZGVvXG4iKTsNCj4+PiArCQkJcmV0dXJuIC1FTk9ERVY7DQo+Pj4gKwkJfQ0K
Pj4+ICsNCj4+PiArCQlyZXQgPSBkcm1fYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX3Bj
aV9mcmFtZWJ1ZmZlcnMocGRldiwgJmh5cGVydl9kcml2ZXIpOw0KPj4+ICsJCXBjaV9kZXZf
cHV0KHBkZXYpOw0KPj4+ICsJCWlmIChyZXQpIHsNCj4+PiArCQkJZHJtX2VycihkZXYsICJO
b3QgYWJsZSB0byByZW1vdmUgYm9vdCBmYlxuIik7DQo+Pj4gKwkJCXJldHVybiByZXQ7DQo+
Pj4gKwkJfQ0KPj4+ICsJfQ0KPj4+ICAgCWh2LT5mYl9zaXplID0gKHVuc2lnbmVkIGxvbmcp
aHYtPm1taW9fbWVnYWJ5dGVzICogMTAyNCAqIDEwMjQ7DQo+Pg0KPj4gLS0gDQo+PiBUaG9t
YXMgWmltbWVybWFubg0KPj4gR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KPj4gU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQo+PiBNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIEdlcm1hbnkNCj4+IChIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCj4+
IEdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCj4gDQo+IA0KPiANCg0KLS0gDQpUaG9t
YXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2Fy
ZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJl
cmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xo
cmVyOiBJdm8gVG90ZXYNCg==

--------------uTUVGSPzFQ1V00PJzhsjSO72--

--------------Z0yg9rMNaNgSK69xDmzJvR6y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMe2dkFAwAAAAAACgkQlh/E3EQov+Am
3g//TUJJQQVz3rBqs9oq2z3xy/uqrVBlZFcM+hI9/F9fDIb8A+PtA9KJFJbPmLRaEJpQcv/uo5XV
4X4xdj/gJ81cx9kGXlB2lcxdStyN4vvdsz8Nzl/Ga0Fm9HYKA4wNIyK2IA6URpPMBU45LD0Fxj2e
HIlIPtKvxkeFD3jw5bPWzNS87iHhrwiDakpbf74YpaYYoZRVCh4Q3qHn6AHaepyGSX5clCS22dSP
ZkbgEQ03YVhHjdvd7rDFHFbUg0YzFx85p2/kkx20qKx76NgUReA1WeuTEAKnUORHlb2qFgIwWAW9
P6Cvvs/yQ+FKUNIZQ2i3CpmVYQuupy0rcbDDGRh+6QGx4AnFDCYHkQC0k6j9vSpc4fn94qYLtTBx
yVVsvqEY+nHkqussWiTmhWy1MfCxzS0nfVg7vT3Dosgyri7GXRQeAsBi+IuODKVPGiXaYq7P6Ugw
zNAmaHYH3zhzgg5sKm7QZny6f0v9kxKpW1xE4Fo51UtmJqGhBIq6cU+tEx+7Zkc3ky+TeDRxZdiN
RufMLH5Fs8X8Viw0sp8bbg4aigXt0mS4tCXKDboa+iIl0YYnmlPLL1OkTDDDHYnU+q+2mf26Rcl/
WJLVWqLC8j/bfFg10fORRVLbsPPgIUjgzag7u6EeWjFFJBPhWCw/+WBogvyXn/Ld16/owb2tsCAz
evM=
=7qMS
-----END PGP SIGNATURE-----

--------------Z0yg9rMNaNgSK69xDmzJvR6y--

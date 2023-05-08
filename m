Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 736526FA0B8
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 09:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F074410E11D;
	Mon,  8 May 2023 07:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C7B10E11D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 07:12:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D112921D4A;
 Mon,  8 May 2023 07:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683529957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t9nbsSPBx5UbLEUugNvV+0zHxmB47zd7t9MZkauFl0k=;
 b=Oz7NIvFKojxCPuH04QnTz3x4BAy9Zef3FYI6N4pmVzXdRQb7dRDRnL492vnLOKEis2kBuf
 I/mBDmHWCbEuGTiffYerCo4GXSMQ3O3qPK4TfrDLL4wcDBvWGd/5VellEuo86NzvgqaTwP
 Y+Eq+qR4kY2hq+yU1g5nqlz+JYPg38g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683529957;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t9nbsSPBx5UbLEUugNvV+0zHxmB47zd7t9MZkauFl0k=;
 b=a1dZMkp7o/zHI9tM6ZjV5SIzjHxk2dawHSuhs2YuWUDkyLStotIwy5hNkoD0bmWYKu556m
 X0zzPvCS0VYu+dBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A52821346B;
 Mon,  8 May 2023 07:12:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MSlUJ+WgWGRiLQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 08 May 2023 07:12:37 +0000
Message-ID: <fec178d3-6b42-7caa-844d-c9cfdfd43526@suse.de>
Date: Mon, 8 May 2023 09:12:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 RESEND] drm/vram-helper: fix function names in vram
 helper doc
Content-Language: en-US
To: Luc Ma <onion0709@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <64583db2.630a0220.eb75d.8f51@mx.google.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <64583db2.630a0220.eb75d.8f51@mx.google.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5Ra3rHOGbCIVhbRnWW4J8rsV"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5Ra3rHOGbCIVhbRnWW4J8rsV
Content-Type: multipart/mixed; boundary="------------h6TlGLATF5qdMsxaIQRnbX9K";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Luc Ma <onion0709@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <fec178d3-6b42-7caa-844d-c9cfdfd43526@suse.de>
Subject: Re: [PATCH v2 RESEND] drm/vram-helper: fix function names in vram
 helper doc
References: <64583db2.630a0220.eb75d.8f51@mx.google.com>
In-Reply-To: <64583db2.630a0220.eb75d.8f51@mx.google.com>

--------------h6TlGLATF5qdMsxaIQRnbX9K
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMDUuMjMgdW0gMDI6MDkgc2NocmllYiBMdWMgTWE6DQo+IEZyb206IEx1
YyBNYSA8bHVjQHNpZXRpdW0uY29tPg0KPiANCj4gUmVmZXIgdG8gZHJtbV92cmFtX2hlbHBl
cl9pbml0KCkgaW5zdGVhZCBvZiB0aGUgbm9uLWV4aXN0ZW50DQo+IGRybW1fdnJhbV9oZWxw
ZXJfYWxsb2NfbW0oKS4NCj4gDQo+IEZpeGVzOiBhNWYyM2E3MjM1NWQgKCJkcm0vdnJhbS1o
ZWxwZXI6IE1hbmFnZWQgdnJhbSBoZWxwZXJzIikNCj4gU2lnbmVkLW9mZi1ieTogTHVjIE1h
IDxsdWNAc2lldGl1bS5jb20+DQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KVGhhbmtzIGZvciB0aGUgcGF0Y2guIEknbGwgYWRk
IGl0IHRvIGRybS1taXNjLW5leHQuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gLS0t
DQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYyB8IDYgKysrLS0t
DQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBl
ci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYw0KPiBpbmRleCBk
NDBiM2VkYjUyZDAuLmYxNTM5ZDQ0NDhjNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2dlbV92cmFtX2hlbHBlci5jDQo+IEBAIC00NSw3ICs0NSw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MgZHJtX2dlbV92cmFtX29iamVjdF9mdW5jczsN
Cj4gICAgKiB0aGUgZnJhbWUncyBzY2Fub3V0IGJ1ZmZlciBvciB0aGUgY3Vyc29yIGltYWdl
LiBJZiB0aGVyZSdzIG5vIG1vcmUgc3BhY2UNCj4gICAgKiBsZWZ0IGluIFZSQU0sIGluYWN0
aXZlIEdFTSBvYmplY3RzIGNhbiBiZSBtb3ZlZCB0byBzeXN0ZW0gbWVtb3J5Lg0KPiAgICAq
DQo+IC0gKiBUbyBpbml0aWFsaXplIHRoZSBWUkFNIGhlbHBlciBsaWJyYXJ5IGNhbGwgZHJt
bV92cmFtX2hlbHBlcl9hbGxvY19tbSgpLg0KPiArICogVG8gaW5pdGlhbGl6ZSB0aGUgVlJB
TSBoZWxwZXIgbGlicmFyeSBjYWxsIGRybW1fdnJhbV9oZWxwZXJfaW5pdCgpLg0KPiAgICAq
IFRoZSBmdW5jdGlvbiBhbGxvY2F0ZXMgYW5kIGluaXRpYWxpemVzIGFuIGluc3RhbmNlIG9m
ICZzdHJ1Y3QgZHJtX3ZyYW1fbW0NCj4gICAgKiBpbiAmc3RydWN0IGRybV9kZXZpY2UudnJh
bV9tbSAuIFVzZSAmRFJNX0dFTV9WUkFNX0RSSVZFUiB0byBpbml0aWFsaXplDQo+ICAgICog
JnN0cnVjdCBkcm1fZHJpdmVyIGFuZCAgJkRSTV9WUkFNX01NX0ZJTEVfT1BFUkFUSU9OUyB0
byBpbml0aWFsaXplDQo+IEBAIC03Myw3ICs3Myw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZHJtX2dlbV9vYmplY3RfZnVuY3MgZHJtX2dlbV92cmFtX29iamVjdF9mdW5jczsNCj4gICAg
KgkJLy8gc2V0dXAgZGV2aWNlLCB2cmFtIGJhc2UgYW5kIHNpemUNCj4gICAgKgkJLy8gLi4u
DQo+ICAgICoNCj4gLSAqCQlyZXQgPSBkcm1tX3ZyYW1faGVscGVyX2FsbG9jX21tKGRldiwg
dnJhbV9iYXNlLCB2cmFtX3NpemUpOw0KPiArICoJCXJldCA9IGRybW1fdnJhbV9oZWxwZXJf
aW5pdChkZXYsIHZyYW1fYmFzZSwgdnJhbV9zaXplKTsNCj4gICAgKgkJaWYgKHJldCkNCj4g
ICAgKgkJCXJldHVybiByZXQ7DQo+ICAgICoJCXJldHVybiAwOw0KPiBAQCAtODYsNyArODYs
NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1bmNzIGRybV9nZW1f
dnJhbV9vYmplY3RfZnVuY3M7DQo+ICAgICogdG8gdXNlcnNwYWNlLg0KPiAgICAqDQo+ICAg
ICogWW91IGRvbid0IGhhdmUgdG8gY2xlYW4gdXAgdGhlIGluc3RhbmNlIG9mIFZSQU0gTU0u
DQo+IC0gKiBkcm1tX3ZyYW1faGVscGVyX2FsbG9jX21tKCkgaXMgYSBtYW5hZ2VkIGludGVy
ZmFjZSB0aGF0IGluc3RhbGxzIGENCj4gKyAqIGRybW1fdnJhbV9oZWxwZXJfaW5pdCgpIGlz
IGEgbWFuYWdlZCBpbnRlcmZhY2UgdGhhdCBpbnN0YWxscyBhDQo+ICAgICogY2xlYW4tdXAg
aGFuZGxlciB0byBydW4gZHVyaW5nIHRoZSBEUk0gZGV2aWNlJ3MgcmVsZWFzZS4NCj4gICAg
Kg0KPiAgICAqIEZvciBkcmF3aW5nIG9yIHNjYW5vdXQgb3BlcmF0aW9ucywgcnNwLiBidWZm
ZXIgb2JqZWN0cyBoYXZlIHRvIGJlIHBpbm5lZA0KDQotLSANClRob21hcyBaaW1tZXJtYW5u
DQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBH
ZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJt
YW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91
ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------h6TlGLATF5qdMsxaIQRnbX9K--

--------------5Ra3rHOGbCIVhbRnWW4J8rsV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRYoOUFAwAAAAAACgkQlh/E3EQov+BT
KBAAmeH7sAld0RN7j3f2Yf61c316mUU0HBHwmoPbvVTDOhkM9j7slnD4PpCWxEF5tppsyXeZeMxS
QlCrdDJ1GepPjjlRkOXulgJli5jWeFh9Xme5J0DRaSjG4YtpkDdKnDWrAV/HzVVv2n8Blqc3lO5p
Xus0bu2x9ShA9c+JEUneqno0zq1quFN240GxfwEc3AiOkeU/MLjwDMdmVWpmgP3pVw++zdbiNrGF
94u4Qa/YDLCkQHboWWcRRAsnh2w10hSZwq7ogkht7G0RWe833M7DeMfqv3trdG2IQBM/KSJ6BVhc
gxxyAvLuZrQTe/Lt8br7w8VJx9dJqJTleokf0vRsYaL19Z6y6T4k852rzPwMlw7XeeXbjROhUM57
dkexf3Cq2xxIkyxmHl2UDOiQNx5ekqwVsT48TthVluc30QUKicQmztmGkr23LG+BMXIh34/b/7NS
jvahRZnQvl6z1FY0Y1jYgtUJDYGbySmKzNxx5rmp8AqL1hte9BEnlVV9sMcn+8X7NFaySHKW+L2q
dgx5lapbfGwIGVNAjwom0u70DwgGMn7y/EJZZ1+kkFzPnd8FAicJPdy85806/AwT4+qw6wIRo/7e
kceipUmc0fQk00Thbtp/f4sQ1JfNNawopKfs733CMKHc6iSixq+qxcWmOO0/D6LNKigbk+o5KKld
W5g=
=D3Fc
-----END PGP SIGNATURE-----

--------------5Ra3rHOGbCIVhbRnWW4J8rsV--

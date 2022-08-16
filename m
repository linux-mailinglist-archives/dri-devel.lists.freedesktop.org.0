Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A8F595DE9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 16:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BC6113F2B;
	Tue, 16 Aug 2022 14:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D24A9DB7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 14:01:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C121837145;
 Tue, 16 Aug 2022 14:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1660658494; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F+2rvcWRPQ06YBzrPJow+/Gfzs8JhzTs1YVr2XJT/OE=;
 b=atVYaO+TBZUL+KaHrfViV48jfc60UBGNdk3nWHKFCDuwbiVAdenZdcpe/qMx3bMG4iC/lA
 hfQtcydKvNENCiZxMhxfQwUAwc9rMMyCKHOvQbwRo//yLp+59DqV73wtqt1yGGkyP6qMIb
 LsVnVGZq+bMc+tEyWXZlCLbbE2RS6JE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1660658494;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F+2rvcWRPQ06YBzrPJow+/Gfzs8JhzTs1YVr2XJT/OE=;
 b=s+8qCa9jHxn/8FGJmOidPbZV/FRAy6RzUksTUvPBOL/NA+MwbCvX3K02k7gI3isoS8UiZj
 CQU+P2R2v25dl2Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 849F0139B7;
 Tue, 16 Aug 2022 14:01:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uf0eHz6j+2KdeQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 16 Aug 2022 14:01:34 +0000
Message-ID: <b6e4ec4d-f238-12d5-6501-69cda175a1b9@suse.de>
Date: Tue, 16 Aug 2022 16:01:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [PATCH 3/4] drm/udl: Kill pending URBs at suspend and disconnect
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220804075826.27036-1-tiwai@suse.de>
 <20220804075826.27036-4-tiwai@suse.de>
 <bebcfa4a-7908-d8ba-3bff-ea7c2ee2d7a9@suse.de> <87h72lx4yw.wl-tiwai@suse.de>
 <2a307221-62a8-a5f8-354f-d92e90f74f04@suse.de> <87a68dwzzi.wl-tiwai@suse.de>
 <32d98960-a952-b3ab-c3fb-0d615626a3d1@suse.de> <875yj1wz8d.wl-tiwai@suse.de>
 <87fshwxph0.wl-tiwai@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87fshwxph0.wl-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vohV9Q40rlPbK3jZ5QFg4eUb"
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
Cc: Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vohV9Q40rlPbK3jZ5QFg4eUb
Content-Type: multipart/mixed; boundary="------------7myU4HPEk8RUA5vrGWt06Bhp";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <b6e4ec4d-f238-12d5-6501-69cda175a1b9@suse.de>
Subject: Re: [PATCH 3/4] drm/udl: Kill pending URBs at suspend and disconnect
References: <20220804075826.27036-1-tiwai@suse.de>
 <20220804075826.27036-4-tiwai@suse.de>
 <bebcfa4a-7908-d8ba-3bff-ea7c2ee2d7a9@suse.de> <87h72lx4yw.wl-tiwai@suse.de>
 <2a307221-62a8-a5f8-354f-d92e90f74f04@suse.de> <87a68dwzzi.wl-tiwai@suse.de>
 <32d98960-a952-b3ab-c3fb-0d615626a3d1@suse.de> <875yj1wz8d.wl-tiwai@suse.de>
 <87fshwxph0.wl-tiwai@suse.de>
In-Reply-To: <87fshwxph0.wl-tiwai@suse.de>

--------------7myU4HPEk8RUA5vrGWt06Bhp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgVGFrYXNoaQ0KDQpBbSAxNi4wOC4yMiB1bSAxNTo1NSBzY2hyaWViIFRha2FzaGkgSXdh
aToNCj4gT24gVHVlLCAwOSBBdWcgMjAyMiAxMToxOTozMCArMDIwMCwNCj4gVGFrYXNoaSBJ
d2FpIHdyb3RlOg0KPj4NCj4+IE9uIFR1ZSwgMDkgQXVnIDIwMjIgMTE6MTM6NDYgKzAyMDAs
DQo+PiBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+Pg0KPj4+IEhpDQo+Pj4NCj4+PiBB
bSAwOS4wOC4yMiB1bSAxMTowMyBzY2hyaWViIFRha2FzaGkgSXdhaToNCj4+Pj4gT24gVHVl
LCAwOSBBdWcgMjAyMiAwOTo0MToxOSArMDIwMCwNCj4+Pj4gVGhvbWFzIFppbW1lcm1hbm4g
d3JvdGU6DQo+Pj4+Pg0KPj4+Pj4gSGkNCj4+Pj4+DQo+Pj4+PiBBbSAwOS4wOC4yMiB1bSAw
OToxNSBzY2hyaWViIFRha2FzaGkgSXdhaToNCj4+Pj4+PiBPbiBUdWUsIDA5IEF1ZyAyMDIy
IDA5OjEzOjE2ICswMjAwLA0KPj4+Pj4+IFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4+
Pj4+Pg0KPj4+Pj4+PiBIaQ0KPj4+Pj4+Pg0KPj4+Pj4+PiBBbSAwNC4wOC4yMiB1bSAwOTo1
OCBzY2hyaWViIFRha2FzaGkgSXdhaToNCj4+Pj4+Pj4+IEF0IGJvdGggc3VzcGVuZCBhbmQg
ZGlzY29ubmVjdCwgd2Ugc2hvdWxkIHJhdGhlciBjYW5jZWwgdGhlIHBlbmRpbmcNCj4+Pj4+
Pj4+IFVSQnMgaW1tZWRpYXRlbHkuICBGb3IgdGhlIHN1c3BlbmQgY2FzZSwgdGhlIGRpc3Bs
YXkgd2lsbCBiZSB0dXJuZWQNCj4+Pj4+Pj4+IG9mZiwgc28gaXQgbWFrZXMgbm8gc2Vuc2Ug
dG8gcHJvY2VzcyB0aGUgcmVuZGVyaW5nLiAgQW5kIGZvciB0aGUNCj4+Pj4+Pj4+IGRpc2Nv
bm5lY3QgY2FzZSwgdGhlIGRldmljZSBtYXkgYmUgbm8gbG9uZ2VyIGFjY2Vzc2libGUsIGhl
bmNlIHdlDQo+Pj4+Pj4+PiBzaG91bGRuJ3QgZG8gYW55IHN1Ym1pc3Npb24uDQo+Pj4+Pj4+
Pg0KPj4+Pj4+Pj4gVGVzdGVkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4NCj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFRha2FzaGkgSXdhaSA8dGl3YWlA
c3VzZS5kZT4NCj4+Pj4+Pj4+IC0tLQ0KPj4+Pj4+Pj4gICAgICBkcml2ZXJzL2dwdS9kcm0v
dWRsL3VkbF9kcnYuaCAgICAgfCAgMiArKw0KPj4+Pj4+Pj4gICAgICBkcml2ZXJzL2dwdS9k
cm0vdWRsL3VkbF9tYWluLmMgICAgfCAyNSArKysrKysrKysrKysrKysrKysrKysrLS0tDQo+
Pj4+Pj4+PiAgICAgIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21vZGVzZXQuYyB8ICAyICsr
DQo+Pj4+Pj4+PiAgICAgIDMgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3VkbC91ZGxfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuaA0K
Pj4+Pj4+Pj4gaW5kZXggZjAxZTUwYzViN2I3Li4yOGFhZjc1ZDcxY2YgMTAwNjQ0DQo+Pj4+
Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuaA0KPj4+Pj4+Pj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmgNCj4+Pj4+Pj4+IEBAIC0zOSw2ICsz
OSw3IEBAIHN0cnVjdCB1cmJfbm9kZSB7DQo+Pj4+Pj4+PiAgICAgICAgc3RydWN0IHVyYl9s
aXN0IHsNCj4+Pj4+Pj4+ICAgICAgCXN0cnVjdCBsaXN0X2hlYWQgbGlzdDsNCj4+Pj4+Pj4+
ICsJc3RydWN0IGxpc3RfaGVhZCBpbl9mbGlnaHQ7DQo+Pj4+Pj4+PiAgICAgIAlzcGlubG9j
a190IGxvY2s7DQo+Pj4+Pj4+PiAgICAgIAl3YWl0X3F1ZXVlX2hlYWRfdCBzbGVlcDsNCj4+
Pj4+Pj4+ICAgICAgCWludCBhdmFpbGFibGU7DQo+Pj4+Pj4+PiBAQCAtODQsNiArODUsNyBA
QCBzdGF0aWMgaW5saW5lIHN0cnVjdCB1cmIgKnVkbF9nZXRfdXJiKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYpDQo+Pj4+Pj4+PiAgICAgICAgaW50IHVkbF9zdWJtaXRfdXJiKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsIHN0cnVjdCB1cmIgKnVyYiwNCj4+Pj4+Pj4+IHNpemVfdCBsZW4p
Ow0KPj4+Pj4+Pj4gICAgICBpbnQgdWRsX3N5bmNfcGVuZGluZ191cmJzKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYpOw0KPj4+Pj4+Pj4gK3ZvaWQgdWRsX2tpbGxfcGVuZGluZ191cmJzKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYpOw0KPj4+Pj4+Pj4gICAgICB2b2lkIHVkbF91cmJfY29t
cGxldGlvbihzdHJ1Y3QgdXJiICp1cmIpOw0KPj4+Pj4+Pj4gICAgICAgIGludCB1ZGxfaW5p
dChzdHJ1Y3QgdWRsX2RldmljZSAqdWRsKTsNCj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9t
YWluLmMNCj4+Pj4+Pj4+IGluZGV4IDkzNjE1NjQ4NDE0Yi4uNDcyMDRiN2ViMTBlIDEwMDY0
NA0KPj4+Pj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbWFpbi5jDQo+Pj4+
Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMNCj4+Pj4+Pj4+IEBA
IC0xMzUsNyArMTM1LDcgQEAgdm9pZCB1ZGxfdXJiX2NvbXBsZXRpb24oc3RydWN0IHVyYiAq
dXJiKQ0KPj4+Pj4+Pj4gICAgICAJdXJiLT50cmFuc2Zlcl9idWZmZXJfbGVuZ3RoID0gdWRs
LT51cmJzLnNpemU7IC8qIHJlc2V0IHRvIGFjdHVhbCAqLw0KPj4+Pj4+Pj4gICAgICAgIAlz
cGluX2xvY2tfaXJxc2F2ZSgmdWRsLT51cmJzLmxvY2ssIGZsYWdzKTsNCj4+Pj4+Pj4+IC0J
bGlzdF9hZGRfdGFpbCgmdW5vZGUtPmVudHJ5LCAmdWRsLT51cmJzLmxpc3QpOw0KPj4+Pj4+
Pj4gKwlsaXN0X21vdmUoJnVub2RlLT5lbnRyeSwgJnVkbC0+dXJicy5saXN0KTsNCj4+Pj4+
Pj4+ICAgICAgCXVkbC0+dXJicy5hdmFpbGFibGUrKzsNCj4+Pj4+Pj4+ICAgICAgCXNwaW5f
dW5sb2NrX2lycXJlc3RvcmUoJnVkbC0+dXJicy5sb2NrLCBmbGFncyk7DQo+Pj4+Pj4+PiAg
ICAgIEBAIC0xODAsNiArMTgwLDcgQEAgc3RhdGljIGludCB1ZGxfYWxsb2NfdXJiX2xpc3Qo
c3RydWN0DQo+Pj4+Pj4+PiBkcm1fZGV2aWNlICpkZXYsIGludCBjb3VudCwgc2l6ZV90IHNp
emUpDQo+Pj4+Pj4+PiAgICAgIHJldHJ5Og0KPj4+Pj4+Pj4gICAgICAJdWRsLT51cmJzLnNp
emUgPSBzaXplOw0KPj4+Pj4+Pj4gICAgICAJSU5JVF9MSVNUX0hFQUQoJnVkbC0+dXJicy5s
aXN0KTsNCj4+Pj4+Pj4+ICsJSU5JVF9MSVNUX0hFQUQoJnVkbC0+dXJicy5pbl9mbGlnaHQp
Ow0KPj4+Pj4+Pj4gICAgICAgIAlpbml0X3dhaXRxdWV1ZV9oZWFkKCZ1ZGwtPnVyYnMuc2xl
ZXApOw0KPj4+Pj4+Pj4gICAgICAJdWRsLT51cmJzLmNvdW50ID0gMDsNCj4+Pj4+Pj4+IEBA
IC0yNDYsNyArMjQ3LDcgQEAgc3RydWN0IHVyYiAqdWRsX2dldF91cmJfdGltZW91dChzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LCBsb25nIHRpbWVvdXQpDQo+Pj4+Pj4+PiAgICAgIAl9DQo+
Pj4+Pj4+PiAgICAgICAgCXVub2RlID0gbGlzdF9maXJzdF9lbnRyeSgmdWRsLT51cmJzLmxp
c3QsIHN0cnVjdCB1cmJfbm9kZSwNCj4+Pj4+Pj4+IGVudHJ5KTsNCj4+Pj4+Pj4+IC0JbGlz
dF9kZWxfaW5pdCgmdW5vZGUtPmVudHJ5KTsNCj4+Pj4+Pj4+ICsJbGlzdF9tb3ZlKCZ1bm9k
ZS0+ZW50cnksICZ1ZGwtPnVyYnMuaW5fZmxpZ2h0KTsNCj4+Pj4+Pj4+ICAgICAgCXVkbC0+
dXJicy5hdmFpbGFibGUtLTsNCj4+Pj4+Pj4+ICAgICAgICB1bmxvY2s6DQo+Pj4+Pj4+PiBA
QCAtMjc5LDcgKzI4MCw3IEBAIGludCB1ZGxfc3luY19wZW5kaW5nX3VyYnMoc3RydWN0IGRy
bV9kZXZpY2UgKmRldikNCj4+Pj4+Pj4+ICAgICAgCXNwaW5fbG9ja19pcnEoJnVkbC0+dXJi
cy5sb2NrKTsNCj4+Pj4+Pj4+ICAgICAgCS8qIDIgc2Vjb25kcyBhcyBhIHNhbmUgdGltZW91
dCAqLw0KPj4+Pj4+Pj4gICAgICAJaWYgKCF3YWl0X2V2ZW50X2xvY2tfaXJxX3RpbWVvdXQo
dWRsLT51cmJzLnNsZWVwLA0KPj4+Pj4+Pj4gLQkJCQkJIHVkbC0+dXJicy5hdmFpbGFibGUg
PT0gdWRsLT51cmJzLmNvdW50LA0KPj4+Pj4+Pj4gKwkJCQkJIGxpc3RfZW1wdHkoJnVkbC0+
dXJicy5pbl9mbGlnaHQpLA0KPj4+Pj4+Pj4gICAgICAJCQkJCSB1ZGwtPnVyYnMubG9jaywN
Cj4+Pj4+Pj4+ICAgICAgCQkJCQkgbXNlY3NfdG9famlmZmllcygyMDAwKSkpDQo+Pj4+Pj4+
PiAgICAgIAkJcmV0ID0gLUVUSU1FRE9VVDsNCj4+Pj4+Pj4+IEBAIC0yODcsNiArMjg4LDIz
IEBAIGludCB1ZGxfc3luY19wZW5kaW5nX3VyYnMoc3RydWN0IGRybV9kZXZpY2UgKmRldikN
Cj4+Pj4+Pj4+ICAgICAgCXJldHVybiByZXQ7DQo+Pj4+Pj4+PiAgICAgIH0NCj4+Pj4+Pj4+
ICAgICAgKy8qIGtpbGwgcGVuZGluZyBVUkJzICovDQo+Pj4+Pj4+PiArdm9pZCB1ZGxfa2ls
bF9wZW5kaW5nX3VyYnMoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4+Pj4+Pj4+ICt7DQo+
Pj4+Pj4+PiArCXN0cnVjdCB1ZGxfZGV2aWNlICp1ZGwgPSB0b191ZGwoZGV2KTsNCj4+Pj4+
Pj4+ICsJc3RydWN0IHVyYl9ub2RlICp1bm9kZTsNCj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+ICsJ
c3Bpbl9sb2NrX2lycSgmdWRsLT51cmJzLmxvY2spOw0KPj4+Pj4+Pj4gKwl3aGlsZSAoIWxp
c3RfZW1wdHkoJnVkbC0+dXJicy5pbl9mbGlnaHQpKSB7DQo+Pj4+Pj4+PiArCQl1bm9kZSA9
IGxpc3RfZmlyc3RfZW50cnkoJnVkbC0+dXJicy5pbl9mbGlnaHQsDQo+Pj4+Pj4+PiArCQkJ
CQkgc3RydWN0IHVyYl9ub2RlLCBlbnRyeSk7DQo+Pj4+Pj4+PiArCQlzcGluX3VubG9ja19p
cnEoJnVkbC0+dXJicy5sb2NrKTsNCj4+Pj4+Pj4+ICsJCXVzYl9raWxsX3VyYih1bm9kZS0+
dXJiKTsNCj4+Pj4+Pj4+ICsJCXNwaW5fbG9ja19pcnEoJnVkbC0+dXJicy5sb2NrKTsNCj4+
Pj4+Pj4+ICsJfQ0KPj4+Pj4+Pj4gKwlzcGluX3VubG9ja19pcnEoJnVkbC0+dXJicy5sb2Nr
KTsNCj4+Pj4+Pj4+ICt9DQo+Pj4+Pj4+PiArDQo+Pj4+Pj4+PiAgICAgIGludCB1ZGxfaW5p
dChzdHJ1Y3QgdWRsX2RldmljZSAqdWRsKQ0KPj4+Pj4+Pj4gICAgICB7DQo+Pj4+Pj4+PiAg
ICAgIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gJnVkbC0+ZHJtOw0KPj4+Pj4+Pj4gQEAg
LTMzNSw2ICszNTMsNyBAQCBpbnQgdWRsX2Ryb3BfdXNiKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYpDQo+Pj4+Pj4+PiAgICAgIHsNCj4+Pj4+Pj4+ICAgICAgCXN0cnVjdCB1ZGxfZGV2aWNl
ICp1ZGwgPSB0b191ZGwoZGV2KTsNCj4+Pj4+Pj4+ICAgICAgKwl1ZGxfa2lsbF9wZW5kaW5n
X3VyYnMoZGV2KTsNCj4+Pj4+Pj4+ICAgICAgCXVkbF9mcmVlX3VyYl9saXN0KGRldik7DQo+
Pj4+Pj4+PiAgICAgIAlwdXRfZGV2aWNlKHVkbC0+ZG1hZGV2KTsNCj4+Pj4+Pj4+ICAgICAg
CXVkbC0+ZG1hZGV2ID0gTlVMTDsNCj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tb2Rl
c2V0LmMNCj4+Pj4+Pj4+IGluZGV4IDUwMDI1NjA2YjZhZC4uMTY5MTEwZDhmYzJlIDEwMDY0
NA0KPj4+Pj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jDQo+
Pj4+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMNCj4+Pj4+
Pj4+IEBAIC0zOTcsNiArMzk3LDggQEAgdWRsX3NpbXBsZV9kaXNwbGF5X3BpcGVfZGlzYWJs
ZShzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUpDQo+Pj4+Pj4+PiAgICAg
IAlzdHJ1Y3QgdXJiICp1cmI7DQo+Pj4+Pj4+PiAgICAgIAljaGFyICpidWY7DQo+Pj4+Pj4+
PiAgICAgICsJdWRsX2tpbGxfcGVuZGluZ191cmJzKGRldik7DQo+Pj4+Pj4+PiArDQo+Pj4+
Pj4+DQo+Pj4+Pj4+IEkgYWxyZWFkeSByZXZpZXdlZCB0aGUgcGF0Y2hzZXQsIGJ1dCBJIGhh
dmUgYW5vdGhlciBjb21tZW50LiBJIHRoaW5rDQo+Pj4+Pj4+IHdlIHNob3VsZCBvbmx5IGtp
bGwgdXJicyBmcm9tIHdpdGhpbiB0aGUgc3VzcGVuZCBoYW5kbGVyLiBTYW1lIGZvciB0aGUN
Cj4+Pj4+Pj4gY2FsbCB0byB0aGUgVVJCLXN5bmMgZnVuY3Rpb24gaW4gcGF0Y2ggMi4NCj4+
Pj4+Pj4NCj4+Pj4+Pj4gVGhpcyBkaXNhYmxlIGZ1bmN0aW9uIGlzIHBhcnQgb2YgdGhlIHJl
Z3VsYXIgbW9kZXNldCBwYXRoLiBJdCdzDQo+Pj4+Pj4+IHByb2JhYmx5IG5vdCBhcHByb3By
aWF0ZSB0byBvdXRyaWdodCByZW1vdmUgcGVuZGluZyBVUkJzIGhlcmUuIFRoaXMNCj4+Pj4+
Pj4gY2FuIGxlYWQgdG8gZmFpbGVkIG1vZGVzZXRzLCB3aGljaCB3b3VsZCBoYXZlIHN1Y2Nl
ZWRlZCBvdGhlcndpc2UuDQo+Pj4+Pj4NCj4+Pj4+PiBXZWxsLCB0aGUgZGV2aWNlIHNoYWxs
IGJlIHR1cm5lZCBvZmYgcmlnaHQgYWZ0ZXIgdGhhdCBwb2ludCwgc28gdGhlDQo+Pj4+Pj4g
YWxsIHBlbmRpbmcgcmVuZGVyaW5nIG1ha2VzIGxpdHRsZSBzZW5zZSwgbm8/DQo+Pj4+Pg0K
Pj4+Pj4gdWRsX3NpbXBsZV9kaXNwbGF5X3BpcGVfZGlzYWJsZSgpIG9ubHkgZGlzYWJsZXMg
dGhlIGRpc3BsYXksIGJ1dCBub3QNCj4+Pj4+IHRoZSBkZXZpY2UuIFRoZSBraWxsIG9wZXJh
dGlvbiBoZXJlIGNvdWxkIHBvdGVudGlhbGx5IGtpbGwgc29tZSB2YWxpZA0KPj4+Pj4gbW9k
ZXNldCBvcGVyYXRpb24gdGhhdCB3YXMgc3RpbGwgZ29pbmcgb24uIEFuZCB3aG8ga25vd3Mg
d2hhdCB0aGUNCj4+Pj4+IGRldmljZSBzdGF0ZSBpcyBhZnRlciB0aGF0Lg0KPj4+Pg0KPj4+
PiBCdXQgdWRsX3NpbXBsZV9kaXNwbGF5X3BpcGVfZGlzYWJsZSgpIGludm9rZXMgVURMX0JM
QU5LX01PREVfUE9XRVJET1dODQo+Pj4+IGNvbW1hbmQgcmlnaHQgYWZ0ZXIgdGhlIHBsYWNl
IEkndmUgcHV0IHVkbF9raWxsX3BlbmRpbmdfdXJicygpLiAgU28gaXQNCj4+Pj4gc2hhbGwg
YmxhbmsgLyB0dXJuIG9mZiB0aGUgcG93ZXIgKG9mIHRoZSBkZXZpY2UsIGFzIGl0IGhhcyBh
IHNpbmdsZQ0KPj4+PiBvdXRwdXQpLiAgQW5kIHRoZSBVUkIgY29tcGxldGlvbiBkb2Vzbid0
IGRvIGFueSBlcnJvciBoYW5kbGluZyBidXQNCj4+Pj4ganVzdCByZS1saW5rcyBVUkIgY2hh
aW4gYW5kIHdha2VzIHVwIHRoZSBxdWV1ZS4gIFNvIGtpbGxpbmcgYSBwZW5kaW5nDQo+Pj4+
IFVSQiB3b3VsZCBub3RoaW5nIGJ1dCBjYW5jZWxpbmcgdGhlIGluLWZsaWdodCBVUkJzLCBh
bmQgdGhlcmUgc2hvdWxkDQo+Pj4+IGJlIG5vIGRpc3R1cmJhbmNlIHRvIHRoZSBtb2Rlc2V0
IG9wZXJhdGlvbiBpdHNlbGYsIGFzIHRoZSBzY3JlZW4gd2lsbA0KPj4+PiBiZSBibGFua2Vk
IGltbWVkaWF0ZWx5Lg0KPj4+DQo+Pj4gVGhlIGJsYW5rIG1vZGUgaXMgZXNzZW50aWFsbHkg
RFBNUy4gSXQncyB1bnJlbGF0ZWQgdG8gdGhlIGRldmljZSdzDQo+Pj4gZGlzcGxheSBtb2Rl
Lg0KPj4NCj4+IFRoZSBmdW5jdGlvbiBpbnZva2VzIHRoZSBVRExfQkxBTktfTU9ERV9QT1dF
UkRPV04gY29tbWFuZDsgdGhhdCB3aWxsDQo+PiBkaXNjYXJkIHRoZSB3aG9sZSByZW5kZXJl
ZCBwaWN0dXJlLiAgQW5kLCB0aGUgY291bnRlcnBhcnQsDQo+PiB1ZGxfc2ltcGxlX2Rpc3Bs
YXlfcGlwZV9lbmFibGUoKSwgcmUtaW5pdGlhbGl6ZXMgdGhlIG1vZGUgZnVsbHkgZnJvbQ0K
Pj4gdGhlIHNjcmF0Y2ggYWdhaW4uDQo+PiBTbyB3aGF0J3MgdGhlIHBvaW50IHRvIGNvbnRp
bnVlIHJlbmRlcmluZyB0aGF0IGlzIGltbWVkaWF0ZWx5IGNsZWFyZWQNCj4+IChmcm9tIHRo
ZSBzY3JlZW4gYW5kIGZyb20gdGhlIGRldmljZSBzdGF0ZSk/ICBLaWxsaW5nIHBlbmRpbmcg
VVJCcw0KPj4gZG9lc24ndCBpbmZsdWVuY2Ugb24gdGhlIGludGVybmFsIChtb2Rlc2V0KSBz
dGF0ZSBvZiB0aGUgZHJpdmVyLg0KPiANCj4gSW4gYW55d2F5LCB0aGlzIHBhdGNoc2V0IHNl
ZW1zIHByb2JsZW1hdGljIGFyb3VuZCB0aGUgZGlzY29ubmVjdGlvbiwNCj4gYW5kIG1heWJl
IHRoaXMgcGFydGljdWxhciBvbmUgaXMgbm8gbXVjaCBpbXByb3ZlbWVudCwgYmV0dGVyIHRv
IGRyb3ANCj4gZm9yIG5vdy4NCj4gDQo+IEknbGwgcmVzdWJtaXQgdGhlIHYyIHBhdGNoIHNl
dCBpbmNsdWRpbmcgeW91ciByZXN1bWUgZml4ZXMgbGF0ZXIuDQoNCkkgYWxyZWFkeSBtZXJn
ZWQgdGhlIHBhdGNoZXMgYmVmb3JlIHNlZWluZyB0aGUgZGlzY3Vzc2lvbiBvbiB0aGUgcnNw
IGJ1ZyANCnJlcG9ydC4gSWYgeW91IHN1Ym1pdCBhbiB1cGRhdGUsIG1heWJlIHlvdSBjYW4g
ZG8gc28gd2l0aCBGaXhlcyB0YWdzPw0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0K
PiANCj4gdGhhbmtzLA0KPiANCj4gVGFrYXNoaQ0KDQotLSANClRob21hcyBaaW1tZXJtYW5u
DQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBH
ZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0K
KEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rl
dg0K

--------------7myU4HPEk8RUA5vrGWt06Bhp--

--------------vohV9Q40rlPbK3jZ5QFg4eUb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmL7oz4FAwAAAAAACgkQlh/E3EQov+CG
sg//a92D59/S4+L7A/3tDNKBqS6WUrj49uwUV8ezO/4hdujb4AUUqa6ng4JOHzL+yxpERVqiPqQy
LriN3qI/ICRcrkbolTdiFOc8E9bz+6EdMt6mH3ds3SeCMpGXQZZpCHP0hPVaw/RaPur0+qFU4chZ
i15WqBbeCDMX5Rje8fmU3Im3ngweTW7ve3C0uROnFTu+YpdTdA8BwyMtsgymbnip92meGV0JRF/V
cvnahp3GSAjzxE3/abZ3ORIDf05H8tg5thIcBzKtNOos4Z59beAaBFH53dTdC4Dcld2QxfBkKON8
ibB3O95/9unMDkFCBzgyc+0FhkGiOBXiYQW0HkK/6Et8yPD5UeMfu5r+qTOUb+JDiAcNeoAn8i5U
CGx3nRObzPRiLnlagekewm1sB+k1RJDQIFBgLG5UuvZ5yP1X9Xtv2wGQYeJZekSWaHOIGkL+66KB
R3S45gw0O9UYGelqdeUfI8+xXJQ3WsNgFHAtJPv5WqzGDja0XDXE/d4P5cxMTujT297yLVltyjbK
ASUmEGiOfJZdhCoXaqd2yYzHD5km5RzaydoRgAPjFqj6R+q4V510Uwm4xSuvqPXvSsmcM1nCM2Wm
KOEFcfuvEdbVSqluDYeW0arQqrKNPMPfKJkiY+3v6jtKN2Q/IpTBu3HdvQ24tnsDOzACqdpwqhL0
Y/w=
=TLfg
-----END PGP SIGNATURE-----

--------------vohV9Q40rlPbK3jZ5QFg4eUb--

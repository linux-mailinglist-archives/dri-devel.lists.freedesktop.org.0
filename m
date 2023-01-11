Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0C166622A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 18:40:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6C810E7C1;
	Wed, 11 Jan 2023 17:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 16722 seconds by postgrey-1.36 at gabe;
 Wed, 11 Jan 2023 17:40:55 UTC
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B6E610E7C0;
 Wed, 11 Jan 2023 17:40:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2AD8F33A8F;
 Wed, 11 Jan 2023 17:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673458852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5WJ+2F+v7cxChhkTOttYvW1x81iULv+MbAxDOloRLew=;
 b=ASMHXX6Byq70gZ4RE+skrlsEWRkQBHPjw8n+RxV2p3ndSUm5CIWKACTYDWqzAqhoZg5Kh7
 hPcIPc6Lny4ptkgsZxOCGGIqV22zORmT2cekvB9KtnBRKJVeIw62b6wu8GHaYhtPy1pzjx
 yNr5QzCW7bFuU/oVf+qqjXpa1gm2kmM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673458852;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5WJ+2F+v7cxChhkTOttYvW1x81iULv+MbAxDOloRLew=;
 b=K8URnxE4hXY4C5+z94YR9xwMXEd/ZW6Sz0RSDzNs7nfMbWb4IjyQaEtEVpMKUp1rstjP9b
 suL8sCIK2wd4VpCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ED04913591;
 Wed, 11 Jan 2023 17:40:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gfndOKP0vmMFeQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Jan 2023 17:40:51 +0000
Message-ID: <07368afa-10ff-bfa0-a6a9-c85ef143b14d@suse.de>
Date: Wed, 11 Jan 2023 18:40:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/fb-helper: Set framebuffer for vga-switcheroo clients
Content-Language: en-US
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, evan.quan@amd.com
References: <20230111153813.16051-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230111153813.16051-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dqms9Y1BokhNNzn0vQDBSHND"
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dqms9Y1BokhNNzn0vQDBSHND
Content-Type: multipart/mixed; boundary="------------oaCi6JtuEywvKm7goNkZhSeC";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, evan.quan@amd.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Message-ID: <07368afa-10ff-bfa0-a6a9-c85ef143b14d@suse.de>
Subject: Re: [PATCH] drm/fb-helper: Set framebuffer for vga-switcheroo clients
References: <20230111153813.16051-1-tzimmermann@suse.de>
In-Reply-To: <20230111153813.16051-1-tzimmermann@suse.de>

--------------oaCi6JtuEywvKm7goNkZhSeC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMDEuMjMgdW0gMTY6Mzggc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoN
Cj4gU2V0IHRoZSBmcmFtZWJ1ZmZlciBpbmZvIGZvciBkcml2ZXJzIHRoYXQgc3VwcG9ydCBW
R0Egc3dpdGNoZXJvby4gT25seQ0KPiBhZmZlY3RzIHRoZSBhbWRncHUgZHJpdmVyLCB3aGlj
aCB1c2VzIFZHQSBzd2l0Y2hlcm9vIGFuZCBnZW5lcmljIGZiZGV2DQo+IGVtdWxhdGlvbi4g
Rm9yIG90aGVyIGRyaXZlcnMsIHRoaXMgZG9lcyBub3RoaW5nLg0KPiANCj4gQW1kZ3B1J3Mg
bGFzdGNsb3NlIGhlbHBlciBjYWxsZWQgdmdhX3N3aXRjaGVyb29fcHJvY2Vzc19kZWxheWVk
X3N3aXRjaCgpLg0KPiBCdXQgYXMgYW1kZ3B1IHVzZXMgZ2VuZXJpYyBmYmRldiBlbXVsYXRp
b24sIGl0J3MgYmV0dGVyIHRvIGNhbGwgdGhlIGhlbHBlcg0KPiBmcm9tIGRybV9sYXN0Y2xv
c2UoKSwgYWZ0ZXIgdGhlIGtlcm5lbCBjbGllbnQncyBzY3JlZW4gaGFzIGJlZW4gcmVzdG9y
ZWQuDQo+IFNvIGFsbCBkcml2ZXJzIGFuZCBjbGllbnRzIGNhbiBiZW5lZml0LiBSYWRlb24g
YW5kIG5vdXZlYXUgd2l0aCBtb2Rlcm5pemVkDQo+IGZiZGV2IGNvZGUgYXJlIHBvc3NpYmxl
IGNhbmRpZGF0ZXMuDQoNClRoaW5raW5nIGFib3V0IGl0LiBOb3V2ZWF1IGFsc28gc3dpdGNo
ZWQgdG8gZ2VuZXJpYyBlbXVsYXRpb24gcmVjZW50bHkuIA0KU28gdGhlIGNvbW1pdCBtZXNz
YWdlIGlzIG5vdCByZWFsbHkgdXB0b2RhdGUuIEFuZCBub3V2ZWF1IG1heSBuZWVkIGEgDQpj
bGVhbnVwIGFzIHdlbGwuDQoNCkdpdmVuIHRoYXQgdGhlIGdlbmVyaWMgZW11bGF0aW9uIGRp
ZCBub3QgY2FsbCANCnZnYV9zd2l0Y2hlcm9vX2NsaWVudF9mYl9zZXQoKSB1bnRpbCBub3cs
IHRoaXMgcGF0Y2ggbWF5IGZpeCBhIA0KcmVncmVzc2lvbiBvbiBzb21lIHN5c3RlbXMuDQoN
CkknbGwgZGVmaW5hdGVsbHkgc2VuZCBvdXQgYSBzZWNvbmQgcmV2aXNpb24uDQoNCkJlc3Qg
cmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFRoZXJlIHdhcyBhbiBlYXJsaWVyIHBhdGNoc2V0
IHRvIGRvIHNvbWV0aGluZyBzaW1pbGFyLiBbMV0NCj4gDQo+IFN1Z2dlc3RlZC1ieTogQWxl
eGFuZGVyIERldWNoZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+DQo+IFNpZ25lZC1v
ZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiBMaW5r
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbWQtZ2Z4LzIwMjIxMDIwMTQzNjAzLjU2Mzky
OS0xLWFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20vICMgMQ0KPiAtLS0NCj4gICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCAgICAgfCAgMSAtDQo+ICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgIDEgLQ0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYyB8IDEyIC0tLS0tLS0tLS0tLQ0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgICAgICAgICB8ICA4ICsrKysrKysrDQo+
ICAgZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMgICAgICAgICAgICAgIHwgIDMgKysrDQo+
ICAgNSBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUu
aCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oDQo+IGluZGV4IDYzYzky
MWM1NWZiOS4uNzEyMGI5YjZlNTgwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHUuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHUuaA0KPiBAQCAtMTMzMCw3ICsxMzMwLDYgQEAgZXh0ZXJuIGNvbnN0IGludCBh
bWRncHVfbWF4X2ttc19pb2N0bDsNCj4gICANCj4gICBpbnQgYW1kZ3B1X2RyaXZlcl9sb2Fk
X2ttcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdW5zaWduZWQgbG9uZyBmbGFncyk7
DQo+ICAgdm9pZCBhbWRncHVfZHJpdmVyX3VubG9hZF9rbXMoc3RydWN0IGRybV9kZXZpY2Ug
KmRldik7DQo+IC12b2lkIGFtZGdwdV9kcml2ZXJfbGFzdGNsb3NlX2ttcyhzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2KTsNCj4gICBpbnQgYW1kZ3B1X2RyaXZlcl9vcGVuX2ttcyhzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdik7DQo+ICAgdm9p
ZCBhbWRncHVfZHJpdmVyX3Bvc3RjbG9zZV9rbXMoc3RydWN0IGRybV9kZXZpY2UgKmRldiwN
Cj4gICAJCQkJIHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2KTsNCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KPiBpbmRleCBlYmM2ZTZjYmUyYWIuLjAy
ZDYzNmY3ODFhMiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kcnYuYw0KPiBAQCAtMjc4NCw3ICsyNzg0LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBk
cm1fZHJpdmVyIGFtZGdwdV9rbXNfZHJpdmVyID0gew0KPiAgIAkgICAgRFJJVkVSX1NZTkNP
QkpfVElNRUxJTkUsDQo+ICAgCS5vcGVuID0gYW1kZ3B1X2RyaXZlcl9vcGVuX2ttcywNCj4g
ICAJLnBvc3RjbG9zZSA9IGFtZGdwdV9kcml2ZXJfcG9zdGNsb3NlX2ttcywNCj4gLQkubGFz
dGNsb3NlID0gYW1kZ3B1X2RyaXZlcl9sYXN0Y2xvc2Vfa21zLA0KPiAgIAkuaW9jdGxzID0g
YW1kZ3B1X2lvY3Rsc19rbXMsDQo+ICAgCS5udW1faW9jdGxzID0gQVJSQVlfU0laRShhbWRn
cHVfaW9jdGxzX2ttcyksDQo+ICAgCS5kdW1iX2NyZWF0ZSA9IGFtZGdwdV9tb2RlX2R1bWJf
Y3JlYXRlLA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jDQo+
IGluZGV4IDdhYTdlNTJjYTc4NC4uODg2NzM5NTc2ZDNkIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jDQo+IEBAIC0xMTA0LDE4ICsxMTA0LDYg
QEAgaW50IGFtZGdwdV9pbmZvX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQg
KmRhdGEsIHN0cnVjdCBkcm1fZmlsZSAqZmlscCkNCj4gICAvKg0KPiAgICAqIE91dGRhdGVk
IG1lc3MgZm9yIG9sZCBkcm0gd2l0aCBYb3JnIGJlaW5nIGluIGNoYXJnZSAodm9pZCBmdW5j
dGlvbiBub3cpLg0KPiAgICAqLw0KPiAtLyoqDQo+IC0gKiBhbWRncHVfZHJpdmVyX2xhc3Rj
bG9zZV9rbXMgLSBkcm0gY2FsbGJhY2sgZm9yIGxhc3QgY2xvc2UNCj4gLSAqDQo+IC0gKiBA
ZGV2OiBkcm0gZGV2IHBvaW50ZXINCj4gLSAqDQo+IC0gKiBTd2l0Y2ggdmdhX3N3aXRjaGVy
b28gc3RhdGUgYWZ0ZXIgbGFzdCBjbG9zZSAoYWxsIGFzaWNzKS4NCj4gLSAqLw0KPiAtdm9p
ZCBhbWRncHVfZHJpdmVyX2xhc3RjbG9zZV9rbXMoc3RydWN0IGRybV9kZXZpY2UgKmRldikN
Cj4gLXsNCj4gLQlkcm1fZmJfaGVscGVyX2xhc3RjbG9zZShkZXYpOw0KPiAtCXZnYV9zd2l0
Y2hlcm9vX3Byb2Nlc3NfZGVsYXllZF9zd2l0Y2goKTsNCj4gLX0NCj4gICANCj4gICAvKioN
Cj4gICAgKiBhbWRncHVfZHJpdmVyX29wZW5fa21zIC0gZHJtIGNhbGxiYWNrIGZvciBvcGVu
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPiBpbmRleCA0Mjc2MzE3MDYxMjguLjVl
NDQ1YzYxMjUyZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxw
ZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+IEBAIC0z
MCw3ICszMCw5IEBADQo+ICAgI2RlZmluZSBwcl9mbXQoZm10KSBLQlVJTERfTU9ETkFNRSAi
OiAiIGZtdA0KPiAgIA0KPiAgICNpbmNsdWRlIDxsaW51eC9jb25zb2xlLmg+DQo+ICsjaW5j
bHVkZSA8bGludXgvcGNpLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3N5c3JxLmg+DQo+ICsj
aW5jbHVkZSA8bGludXgvdmdhX3N3aXRjaGVyb28uaD4NCj4gICANCj4gICAjaW5jbHVkZSA8
ZHJtL2RybV9hdG9taWMuaD4NCj4gICAjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4NCj4gQEAg
LTE5NDAsNiArMTk0Miw3IEBAIHN0YXRpYyBpbnQgZHJtX2ZiX2hlbHBlcl9zaW5nbGVfZmJf
cHJvYmUoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlciwNCj4gICAJCQkJCSBpbnQg
cHJlZmVycmVkX2JwcCkNCj4gICB7DQo+ICAgCXN0cnVjdCBkcm1fY2xpZW50X2RldiAqY2xp
ZW50ID0gJmZiX2hlbHBlci0+Y2xpZW50Ow0KPiArCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYg
PSBmYl9oZWxwZXItPmRldjsNCj4gICAJc3RydWN0IGRybV9mYl9oZWxwZXJfc3VyZmFjZV9z
aXplIHNpemVzOw0KPiAgIAlpbnQgcmV0Ow0KPiAgIA0KPiBAQCAtMTk2MSw2ICsxOTY0LDEx
IEBAIHN0YXRpYyBpbnQgZHJtX2ZiX2hlbHBlcl9zaW5nbGVfZmJfcHJvYmUoc3RydWN0IGRy
bV9mYl9oZWxwZXIgKmZiX2hlbHBlciwNCj4gICAJCXJldHVybiByZXQ7DQo+ICAgDQo+ICAg
CXN0cmNweShmYl9oZWxwZXItPmZiLT5jb21tLCAiW2ZiY29uXSIpOw0KPiArDQo+ICsJLyog
U2V0IHRoZSBmYiBpbmZvIGZvciB2Z2Fzd2l0Y2hlcm9vIGNsaWVudHMuIERvZXMgbm90aGlu
ZyBvdGhlcndpc2UuICovDQo+ICsJaWYgKGRldl9pc19wY2koZGV2LT5kZXYpKQ0KPiArCQl2
Z2Ffc3dpdGNoZXJvb19jbGllbnRfZmJfc2V0KHRvX3BjaV9kZXYoZGV2LT5kZXYpLCBmYl9o
ZWxwZXItPmluZm8pOw0KPiArDQo+ICAgCXJldHVybiAwOw0KPiAgIH0NCj4gICANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5jIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9maWxlLmMNCj4gaW5kZXggYTUxZmY4Y2VlMDQ5Li4zMTRjMzA5ZGI5YTMgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZmlsZS5jDQo+IEBAIC0zOCw2ICszOCw3IEBADQo+ICAgI2luY2x1ZGUg
PGxpbnV4L3BjaS5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9wb2xsLmg+DQo+ICAgI2luY2x1
ZGUgPGxpbnV4L3NsYWIuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC92Z2Ffc3dpdGNoZXJvby5o
Pg0KPiAgIA0KPiAgICNpbmNsdWRlIDxkcm0vZHJtX2NsaWVudC5oPg0KPiAgICNpbmNsdWRl
IDxkcm0vZHJtX2Rydi5oPg0KPiBAQCAtNDYwLDYgKzQ2MSw4IEBAIHZvaWQgZHJtX2xhc3Rj
bG9zZShzdHJ1Y3QgZHJtX2RldmljZSAqIGRldikNCj4gICAJCWRybV9sZWdhY3lfZGV2X3Jl
aW5pdChkZXYpOw0KPiAgIA0KPiAgIAlkcm1fY2xpZW50X2Rldl9yZXN0b3JlKGRldik7DQo+
ICsNCj4gKwl2Z2Ffc3dpdGNoZXJvb19wcm9jZXNzX2RlbGF5ZWRfc3dpdGNoKCk7DQo+ICAg
fQ0KPiAgIA0KPiAgIC8qKg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBE
cml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgN
Ck1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwg
QUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------oaCi6JtuEywvKm7goNkZhSeC--

--------------dqms9Y1BokhNNzn0vQDBSHND
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO+9KMFAwAAAAAACgkQlh/E3EQov+Ct
lRAAwKn6XDA9cJ0pDWyxzQa+8FbtUNXjXKu/6Enc7bUwteNp3t1p+CuBjIjFTTDMTyyu0LRhLbc+
y43jcgerFgtRJ7rL++kV15ny7GmtpgEf80MYPT1+V+DnOOLI4cP9aJVhzMSyT65uZYv1ytZ/sQPD
YMuieGp0eUPEfFIt1OTdgicpIginwycDNf88Gjs3qSxG3O0b6kAig5kBUmcM8bvZ9smy2GcJbqA6
IKZsH35n0Lbb1GjNCcDjYIUHNlmXVyRsAy3VdmkUlmxitexs7wl7EZT+mr/27ZtZBDHFGrtgi+An
TI7JMkV3ZbEdB4YYtd/d+JoBTKJRH5g/glZ3Jtvlub6vxP8XhHX9qkWzFIuikOh5Ohy3ocTyP4Fb
7EM8wxeMGmh6bdGLJJm7GBZUaDa8BWy2GDuZgWQarGt2xfv9bUKxhBN0CoNMLbHKA4iRpiMmjl54
j1xI8jfSi3p9vGJJp877N+pFpCFQSWcHBkCq7iuBimB8iW2+vWjuF4e3WHUbkUtA2UID6yy+/e9K
pvGFZtC1MmLj0kRsWA7wW4Vkp0CMzVghKgqHZGKu2GpPkWmnS5PFU7hSTL8tz1J4jsRgBZs5LqT+
PqR3rVZOt0g28h5s2qnIHXjtz+G0dRhz0exTWi8Hur24bGOTqmXQ9T5l0YIVVQH59yR4PsieMXlW
4X0=
=KZl8
-----END PGP SIGNATURE-----

--------------dqms9Y1BokhNNzn0vQDBSHND--

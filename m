Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 808066A58F1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 13:23:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D9A10E4A7;
	Tue, 28 Feb 2023 12:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BB810E4A7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 12:23:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9669721954;
 Tue, 28 Feb 2023 12:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677586982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qe9LaQqlz0Rvcm+4GWx3FTDiiVR6J191bAYxqKFZY1k=;
 b=JkklOna8Hdg7NhARG/VHwt00WXyRRIATojl1DYkIYCiTAd09Fg+wB8afyWAGLbj93mW7gi
 rRq4oGqzQm6w2VkGvLD8MdgWfYViVbKigsUpTXpIm+fBRa8kM1s8pxD4RFDuvqiQTdyFDJ
 WJ3IGomnop68EBICr6oJKbu/YnIILPA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677586982;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qe9LaQqlz0Rvcm+4GWx3FTDiiVR6J191bAYxqKFZY1k=;
 b=HciiFLFeUJ7kFcL/0Ro+2BsTIF/j11xZKYTvaF+YKY997dngdyfie7BpDsp0XmjjdWkv4Z
 2zdBSFCUdHmNjmAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5B9751333C;
 Tue, 28 Feb 2023 12:23:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KYn/FCby/WPFCwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Feb 2023 12:23:02 +0000
Message-ID: <4c1b8f71-6f1a-88d5-ed87-620edc8f4fff@suse.de>
Date: Tue, 28 Feb 2023 13:23:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/virtio: Add option to disable KMS support
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230224180225.2477641-1-robdclark@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230224180225.2477641-1-robdclark@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3THst69zsGQO8wv6fA1VduEE"
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
Cc: Rob Clark <robdclark@chromium.org>, Ryan Neph <ryanneph@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3THst69zsGQO8wv6fA1VduEE
Content-Type: multipart/mixed; boundary="------------IjOC2rWyHD0ClTUblu18PexJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>, Ryan Neph <ryanneph@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Message-ID: <4c1b8f71-6f1a-88d5-ed87-620edc8f4fff@suse.de>
Subject: Re: [PATCH] drm/virtio: Add option to disable KMS support
References: <20230224180225.2477641-1-robdclark@gmail.com>
In-Reply-To: <20230224180225.2477641-1-robdclark@gmail.com>

--------------IjOC2rWyHD0ClTUblu18PexJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjQuMDIuMjMgdW0gMTk6MDIgc2NocmllYiBSb2IgQ2xhcms6DQo+IEZyb206
IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4NCj4gDQo+IEFkZCBhIGJ1aWxk
IG9wdGlvbiB0byBkaXNhYmxlIG1vZGVzZXR0aW5nIHN1cHBvcnQuICBUaGlzIGlzIHVzZWZ1
bCBpbg0KPiBjYXNlcyB3aGVyZSB0aGUgZ3Vlc3Qgb25seSBuZWVkcyB0byB1c2UgdGhlIEdQ
VSBpbiBhIGhlYWRsZXNzIG1vZGUsIG9yDQo+IChzdWNoIGFzIGluIHRoZSBDck9TIHVzYWdl
KSB3aW5kb3cgc3VyZmFjZXMgYXJlIHByb3hpZWQgdG8gYSBob3N0DQo+IGNvbXBvc2l0b3Iu
DQoNCldlJ3ZlIGp1c3QgYmVlbiBkaXNjdXNzaW5nIHRoaXMgb24gSVJDLCBidXQgZmFpbGVk
IHRvIHNlZSB0aGUgcHJhY3RpY2FsIA0KYmVuZWZpdC4gSXQncyBub3QgbGlrZSB0aGUgbW9k
ZXNldHRpbmcgY29kZSB0YWtlcyB1cCBsb3RzIG9mIG1lbW9yeS4gDQpXaGF0J3MgdGhlIHJl
YWwtd29ybGQgdXNlIGNhc2U/DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4NCj4gLS0t
DQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby9LY29uZmlnICAgICAgIHwgMTEgKysrKysr
KysrKysNCj4gICBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL01ha2VmaWxlICAgICAgfCAgNSAr
KysrLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuYyB8ICA2ICsr
KysrLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaCB8IDEwICsr
KysrKysrKysNCj4gICBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfa21zLmMgfCAg
NiArKysrKysNCj4gICA1IGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby9L
Y29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby9LY29uZmlnDQo+IGluZGV4IDUxZWM3
YzMyNDBjOS4uZWEwNmZmMmFhNGI0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dmlydGlvL0tjb25maWcNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby9LY29uZmln
DQo+IEBAIC0xMSwzICsxMSwxNCBAQCBjb25maWcgRFJNX1ZJUlRJT19HUFUNCj4gICAJICAg
UUVNVSBiYXNlZCBWTU1zIChsaWtlIEtWTSBvciBYZW4pLg0KPiAgIA0KPiAgIAkgICBJZiB1
bnN1cmUgc2F5IE0uDQo+ICsNCj4gK2NvbmZpZyBEUk1fVklSVElPX0dQVV9LTVMNCj4gKwli
b29sICJWaXJ0aW8gR1BVIGRyaXZlciBtb2Rlc2V0dGluZyBzdXBwb3J0Ig0KPiArCWRlcGVu
ZHMgb24gRFJNX1ZJUlRJT19HUFUNCj4gKwlkZWZhdWx0IHkNCj4gKwloZWxwDQo+ICsJICAg
RW5hYmxlIG1vZGVzZXR0aW5nIHN1cHBvcnQgZm9yIHZpcnRpbyBHUFUgZHJpdmVyLiAgVGhp
cyBjYW4gYmUNCj4gKwkgICBkaXNhYmxlZCBpbiBjYXNlcyB3aGVyZSBvbmx5ICJoZWFkbGVz
cyIgdXNhZ2Ugb2YgdGhlIEdQVSBpcw0KPiArCSAgIHJlcXVpcmVkLg0KPiArDQo+ICsJICAg
SWYgdW5zdXJlLCBzYXkgWS4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0
aW8vTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL01ha2VmaWxlDQo+IGluZGV4
IGI5OWZhNGE3M2I2OC4uMjRjN2ViZTg3MDMyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdmlydGlvL01ha2VmaWxlDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8v
TWFrZWZpbGUNCj4gQEAgLTQsOCArNCwxMSBAQA0KPiAgICMgRGlyZWN0IFJlbmRlcmluZyBJ
bmZyYXN0cnVjdHVyZSAoRFJJKSBpbiBYRnJlZTg2IDQuMS4wIGFuZCBoaWdoZXIuDQo+ICAg
DQo+ICAgdmlydGlvLWdwdS15IDo9IHZpcnRncHVfZHJ2Lm8gdmlydGdwdV9rbXMubyB2aXJ0
Z3B1X2dlbS5vIHZpcnRncHVfdnJhbS5vIFwNCj4gLQl2aXJ0Z3B1X2Rpc3BsYXkubyB2aXJ0
Z3B1X3ZxLm8gXA0KPiArCXZpcnRncHVfdnEubyBcDQo+ICAgCXZpcnRncHVfZmVuY2UubyB2
aXJ0Z3B1X29iamVjdC5vIHZpcnRncHVfZGVidWdmcy5vIHZpcnRncHVfcGxhbmUubyBcDQo+
ICAgCXZpcnRncHVfaW9jdGwubyB2aXJ0Z3B1X3ByaW1lLm8gdmlydGdwdV90cmFjZV9wb2lu
dHMubw0KPiAgIA0KPiArdmlydGlvLWdwdS0kKENPTkZJR19EUk1fVklSVElPX0dQVV9LTVMp
ICs9IFwNCj4gKwl2aXJ0Z3B1X2Rpc3BsYXkubw0KPiArDQo+ICAgb2JqLSQoQ09ORklHX0RS
TV9WSVJUSU9fR1BVKSArPSB2aXJ0aW8tZ3B1Lm8NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8v
dmlydGdwdV9kcnYuYw0KPiBpbmRleCBhZTk3Yjk4NzUwYjYuLjljYjdkNmRkM2RhNiAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuYw0KPiBAQCAtMTcyLDcg
KzE3MiwxMSBAQCBNT0RVTEVfQVVUSE9SKCJBbG9uIExldnkiKTsNCj4gICBERUZJTkVfRFJN
X0dFTV9GT1BTKHZpcnRpb19ncHVfZHJpdmVyX2ZvcHMpOw0KPiAgIA0KPiAgIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZHJtX2RyaXZlciBkcml2ZXIgPSB7DQo+IC0JLmRyaXZlcl9mZWF0dXJl
cyA9IERSSVZFUl9NT0RFU0VUIHwgRFJJVkVSX0dFTSB8IERSSVZFUl9SRU5ERVIgfCBEUklW
RVJfQVRPTUlDLA0KPiArCS5kcml2ZXJfZmVhdHVyZXMgPQ0KPiArI2lmIGRlZmluZWQoQ09O
RklHX0RSTV9WSVJUSU9fR1BVX0tNUykNCj4gKwkJCURSSVZFUl9NT0RFU0VUIHwgRFJJVkVS
X0FUT01JQyB8DQo+ICsjZW5kaWYNCj4gKwkJCURSSVZFUl9HRU0gfCBEUklWRVJfUkVOREVS
LA0KPiAgIAkub3BlbiA9IHZpcnRpb19ncHVfZHJpdmVyX29wZW4sDQo+ICAgCS5wb3N0Y2xv
c2UgPSB2aXJ0aW9fZ3B1X2RyaXZlcl9wb3N0Y2xvc2UsDQo+ICAgDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmggYi9kcml2ZXJzL2dwdS9k
cm0vdmlydGlvL3ZpcnRncHVfZHJ2LmgNCj4gaW5kZXggYWY2ZmZiNjk2MDg2Li5mZmU4ZmFm
NjcyNDcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9k
cnYuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmgNCj4g
QEAgLTQyNiw4ICs0MjYsMTggQEAgdmlydGlvX2dwdV9jbWRfc2V0X3NjYW5vdXRfYmxvYihz
dHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnZnZGV2LA0KPiAgIAkJCQl1aW50MzJfdCB4LCB1
aW50MzJfdCB5KTsNCj4gICANCj4gICAvKiB2aXJ0Z3B1X2Rpc3BsYXkuYyAqLw0KPiArI2lm
IGRlZmluZWQoQ09ORklHX0RSTV9WSVJUSU9fR1BVX0tNUykNCj4gICBpbnQgdmlydGlvX2dw
dV9tb2Rlc2V0X2luaXQoc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2Rldik7DQo+ICAg
dm9pZCB2aXJ0aW9fZ3B1X21vZGVzZXRfZmluaShzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2Ug
KnZnZGV2KTsNCj4gKyNlbHNlDQo+ICtzdGF0aWMgaW5saW5lIGludCB2aXJ0aW9fZ3B1X21v
ZGVzZXRfaW5pdChzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnZnZGV2KQ0KPiArew0KPiAr
CXJldHVybiAwOw0KPiArfQ0KPiArc3RhdGljIGlubGluZSB2b2lkIHZpcnRpb19ncHVfbW9k
ZXNldF9maW5pKHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYpDQo+ICt7DQo+ICt9
DQo+ICsjZW5kaWYNCj4gICANCj4gICAvKiB2aXJ0Z3B1X3BsYW5lLmMgKi8NCj4gICB1aW50
MzJfdCB2aXJ0aW9fZ3B1X3RyYW5zbGF0ZV9mb3JtYXQodWludDMyX3QgZHJtX2ZvdXJjYyk7
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfa21zLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfa21zLmMNCj4gaW5kZXggMjdiN2Yx
NGRhZTg5Li4yOTNlNmYwYmYxMzMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92
aXJ0aW8vdmlydGdwdV9rbXMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfa21zLmMNCj4gQEAgLTE2MSw5ICsxNjEsMTEgQEAgaW50IHZpcnRpb19ncHVfaW5p
dChzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldiwgc3RydWN0IGRybV9kZXZpY2UgKmRldikN
Cj4gICAJaWYgKHZpcnRpb19oYXNfZmVhdHVyZSh2Z2Rldi0+dmRldiwgVklSVElPX0dQVV9G
X1ZJUkdMKSkNCj4gICAJCXZnZGV2LT5oYXNfdmlyZ2xfM2QgPSB0cnVlOw0KPiAgICNlbmRp
Zg0KPiArI2lmIGRlZmluZWQoQ09ORklHX0RSTV9WSVJUSU9fR1BVX0tNUykNCj4gICAJaWYg
KHZpcnRpb19oYXNfZmVhdHVyZSh2Z2Rldi0+dmRldiwgVklSVElPX0dQVV9GX0VESUQpKSB7
DQo+ICAgCQl2Z2Rldi0+aGFzX2VkaWQgPSB0cnVlOw0KPiAgIAl9DQo+ICsjZW5kaWYNCj4g
ICAJaWYgKHZpcnRpb19oYXNfZmVhdHVyZSh2Z2Rldi0+dmRldiwgVklSVElPX1JJTkdfRl9J
TkRJUkVDVF9ERVNDKSkgew0KPiAgIAkJdmdkZXYtPmhhc19pbmRpcmVjdCA9IHRydWU7DQo+
ICAgCX0NCj4gQEAgLTIxOCw2ICsyMjAsNyBAQCBpbnQgdmlydGlvX2dwdV9pbml0KHN0cnVj
dCB2aXJ0aW9fZGV2aWNlICp2ZGV2LCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPiAgIAkJ
Z290byBlcnJfdmJ1ZnM7DQo+ICAgCX0NCj4gICANCj4gKyNpZiBkZWZpbmVkKENPTkZJR19E
Uk1fVklSVElPX0dQVV9LTVMpDQo+ICAgCS8qIGdldCBkaXNwbGF5IGluZm8gKi8NCj4gICAJ
dmlydGlvX2NyZWFkX2xlKHZnZGV2LT52ZGV2LCBzdHJ1Y3QgdmlydGlvX2dwdV9jb25maWcs
DQo+ICAgCQkJbnVtX3NjYW5vdXRzLCAmbnVtX3NjYW5vdXRzKTsNCj4gQEAgLTIyOSw2ICsy
MzIsNyBAQCBpbnQgdmlydGlvX2dwdV9pbml0KHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2
LCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPiAgIAkJZ290byBlcnJfc2Nhbm91dHM7DQo+
ICAgCX0NCj4gICAJRFJNX0lORk8oIm51bWJlciBvZiBzY2Fub3V0czogJWRcbiIsIG51bV9z
Y2Fub3V0cyk7DQo+ICsjZW5kaWYNCj4gICANCj4gICAJdmlydGlvX2NyZWFkX2xlKHZnZGV2
LT52ZGV2LCBzdHJ1Y3QgdmlydGlvX2dwdV9jb25maWcsDQo+ICAgCQkJbnVtX2NhcHNldHMs
ICZudW1fY2Fwc2V0cyk7DQo+IEBAIC0yNDYsMTAgKzI1MCwxMiBAQCBpbnQgdmlydGlvX2dw
dV9pbml0KHN0cnVjdCB2aXJ0aW9fZGV2aWNlICp2ZGV2LCBzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2KQ0KPiAgIAkJdmlydGlvX2dwdV9nZXRfY2Fwc2V0cyh2Z2RldiwgbnVtX2NhcHNldHMp
Ow0KPiAgIAlpZiAodmdkZXYtPmhhc19lZGlkKQ0KPiAgIAkJdmlydGlvX2dwdV9jbWRfZ2V0
X2VkaWRzKHZnZGV2KTsNCj4gKyNpZiBkZWZpbmVkKENPTkZJR19EUk1fVklSVElPX0dQVV9L
TVMpDQo+ICAgCXZpcnRpb19ncHVfY21kX2dldF9kaXNwbGF5X2luZm8odmdkZXYpOw0KPiAg
IAl2aXJ0aW9fZ3B1X25vdGlmeSh2Z2Rldik7DQo+ICAgCXdhaXRfZXZlbnRfdGltZW91dCh2
Z2Rldi0+cmVzcF93cSwgIXZnZGV2LT5kaXNwbGF5X2luZm9fcGVuZGluZywNCj4gICAJCQkg
ICA1ICogSFopOw0KPiArI2VuZGlmDQo+ICAgCXJldHVybiAwOw0KPiAgIA0KPiAgIGVycl9z
Y2Fub3V0czoNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------IjOC2rWyHD0ClTUblu18PexJ--

--------------3THst69zsGQO8wv6fA1VduEE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmP98iUFAwAAAAAACgkQlh/E3EQov+DQ
MhAA0aYScKzC0jvP65/QvLnKIFqxNrXArtMG1avsP7jvKziAXPvNJrNOB4SWOwXhSpdtrKDwlfB8
G8PhCtxlH7+NAmIY1N+k/y6GaTj2b5Icq1/yzECf/BoUvg7hpVyUQ/CjH4CDhr7giD855tqmyJXT
6zME5tQRvNDBeLd3VKUN995bzrnFjbhl9YV7mBDNX57zjE5GCeU6Gu/7fU+wF6MDJrmX6NizLnC9
DifS0ToZ6YN6dsq5/AcZ6eJAJbCisqCZnUX3IlzRPHh79MSP9ytFnKpyfPn7MdiXtAfJn1HO+Bg/
DnDHx3QuiNyOVbdCz6+Q3lslMw51I4xgigLkEAyTEdHgvRBKZol+2t/SG+edUaKD3WZzz0v4vQyJ
kuTLmMeowecyrivOCFA5VZ7SIz8/VD2bNVYEFAgt6rqhVWbHQQZ5FlzWcnE79Zc1Vd9sR73NhqPI
780d5GXud2jTxerYyV/P1fmj9o5AqtwWjK5MzbP1yLIzDnQPT4bwh5Cwqyh26+USwOQiIRPxlKz4
YIWGAX2vWswCWTmJ3bJYBjgTKO0l36bysrbnULIgU7hk7HC6V9KEXM9dauSTz45Q8PdFwgxt264+
odiMIcd+6ILXniT5TO9txDDtuAXs2AV727nhzfLlRIVYMyWmQBNI1yIxYtML/eBOxpcEHQkvVSHu
KNk=
=0wCx
-----END PGP SIGNATURE-----

--------------3THst69zsGQO8wv6fA1VduEE--

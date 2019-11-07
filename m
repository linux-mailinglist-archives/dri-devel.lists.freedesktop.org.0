Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A295F292E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 09:34:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4506EEEC;
	Thu,  7 Nov 2019 08:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B316EEED
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 08:34:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 11F11B12D;
 Thu,  7 Nov 2019 08:34:07 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, sam@ravnborg.org,
 yc_chen@aspeedtech.com
Subject: [PATCH v2 0/9] drm/ast: Convert to atomic modesetting
Date: Thu,  7 Nov 2019 09:33:55 +0100
Message-Id: <20191107083404.6852-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBzZXQgYWRkcyB1bml2ZXJzYWwgcGxhbmVzIHRvIGFzdCBhbmQgY29udmVydHMg
dGhlIGRyaXZlciB0bwphdG9taWMgbW9kZXNldHRpbmcuCgpUaGUgZmlyc3QgcGF0Y2ggaXMgcHVy
ZWx5IGZvciBjbGVhbi11cC4KClBhdGNoZXMgMiB0byA1IHByZXBhcmUgdGhlIGFzdCBtb2Rlc2V0
dGluZyBjb2RlIGZvciB1bml2ZXJzYWwgcGxhbmVzIGFuZAphdG9taWMgbW9kZXNldHRpbmcuIFRo
ZSBzaXplIGNhbGN1bGF0aW9uIGZvciBlYWNoIG1vZGUgaGFzIHRvIHRha2UgZG91YmxlCmJ1ZmZl
cmluZyBpbnRvIGFjY291bnQuIFNldmVyYWwgZnVuY3Rpb25zIGhhdmUgdG8gYmUgc3BsaXQgdG8g
bWFrZSB0aGVtCndvcmsgd2l0aCB0aGUgc2VwYXJhdGUgY2hlY2sgYW5kIHVwZGF0ZSBvbiBDUlRD
cyBhbmQgcGxhbmVzLiBUaGVyZSBhcmUgbm8KZnVuY3Rpb25hbCBjaGFuZ2VzLgoKUGF0Y2hlcyA2
IHRvIDggYWRkIGF0b21pYyBtb2Rlc2V0dGluZyBjb2RlIGZvciBwbGFuZXMgYW5kIENSVEMuIFBs
YW5lcwppbW1lZGlhdGVseSBwcm92aWRlIGF0b21pYyBmdW5jdGlvbnMuIFRoZXJlJ3Mgbm8gaW50
ZXJtZWRpYXRlIHN0ZXAgd2l0aApsZWdhY3kgZnVuY3Rpb25zIGZvciBub24tYXRvbWljIGRyaXZl
cnMuIFRoZSBjdXJzb3IgcGxhbmUgSFcgb25seQpzdXBwb3J0cyBBUkdCNDQ0NCwgc28gdGhlIGN1
cnNvciBwbGFuZSBjb252ZXJ0cyB0aGUgZm9ybWF0IGludGVybmFsbHk7Cmp1c3QgYXMgdGhlIGxl
Z2FjeSBpbXBsZW1lbnRhdGlvbiBkaWQuCgpGaW5hbGx5LCBwYXRjaCA5IGFkZHMgbWlzc2luZyBo
ZWxwZXJzIGFuZCBlbmFibGVzIGF0b21pYyBtb2Rlc2V0dGluZy4gVGhlCkNSVEMgZnVuY3Rpb25z
IG5vdyBwcm92aWRlIHBhZ2VfZmxpcCwgd2hpY2ggZW5hYmxlcyBXZXN0b24gc3VwcG9ydCBvbgph
c3QgaGFyZHdhcmUuCgpUaGUgcGF0Y2hzZXQgaGFzIGJlZW4gdGVzdGVkIGJ5IHJ1bm5pbmcgdGhl
IGZiZGV2IGNvbnNvbGUsIFgxMSAoR25vbWUpCmFuZCBXZXN0b24gb24gYW4gQVNUMjEwMCBjaGlw
c2V0LgoKdjI6CgkqIGRvbid0IHNldCBwbGFuZSBjYWxsLWJhY2sgZnVuY3Rpb25zIHRvIE5VTEwg
ZXhwbGljaXRseQoJKiBkZWZpbmUgcGxhbmUgZm9ybWF0IGFycmF5cyBpbiBnbG9iYWwgc2NvcGUK
ClRob21hcyBaaW1tZXJtYW5uICg5KToKICBkcm0vYXN0OiBSZW1vdmUgbGFzdCB0cmFjZXMgb2Yg
c3RydWN0IGFzdF9nZW1fb2JqZWN0CiAgZHJtL2FzdDogQ2hlY2sgdmlkZW8tbW9kZSByZXF1aXJl
bWVudHMgYWdhaW5zdCBWUkFNIHNpemUKICBkcm0vYXN0OiBEb24ndCBjbGVhciBiYXNlIGFkZHJl
c3MgYW5kIG9mZnNldCB3aXRoIGRlZmF1bHQgdmFsdWVzCiAgZHJtL2FzdDogU3BsaXQgYXN0X3Nl
dF9leHRfcmVnKCkgaW50byBjb2xvciBhbmQgdGhyZXNob2xkIGZ1bmN0aW9uCiAgZHJtL2FzdDog
U3BsaXQgYXN0X3NldF92Ymlvc19tb2RlX2luZm8oKQogIGRybS9hc3Q6IEFkZCBwcmltYXJ5IHBs
YW5lCiAgZHJtL2FzdDogQWRkIENSVEMgaGVscGVycyBmb3IgYXRvbWljIG1vZGVzZXR0aW5nCiAg
ZHJtL2FzdDogQWRkIGN1cnNvciBwbGFuZQogIGRybS9hc3Q6IEVuYWJsZSBhdG9taWMgbW9kZXNl
dHRpbmcKCiBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuYyAgfCAgMjQgKy0KIGRyaXZlcnMv
Z3B1L2RybS9hc3QvYXN0X2Rydi5oICB8ICAgOSArLQogZHJpdmVycy9ncHUvZHJtL2FzdC9hc3Rf
bWFpbi5jIHwgIDU0ICstLQogZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jIHwgNjg1ICsr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQogNCBmaWxlcyBjaGFuZ2VkLCA0NDkgaW5z
ZXJ0aW9ucygrKSwgMzIzIGRlbGV0aW9ucygtKQoKLS0KMi4yMy4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

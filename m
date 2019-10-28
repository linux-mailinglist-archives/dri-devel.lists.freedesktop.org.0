Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97731E7580
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 16:49:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F7E6E95A;
	Mon, 28 Oct 2019 15:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09416E956
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 15:49:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EBDBCB59A;
 Mon, 28 Oct 2019 15:49:30 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, sam@ravnborg.org,
 chen@aspeedtech.com
Subject: [PATCH 0/9] drm/ast: Convert to atomic modesetting
Date: Mon, 28 Oct 2019 16:49:19 +0100
Message-Id: <20191028154928.4058-1-tzimmermann@suse.de>
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
c2V0LgoKVGhvbWFzIFppbW1lcm1hbm4gKDkpOgogIGRybS9hc3Q6IFJlbW92ZSBsYXN0IHRyYWNl
cyBvZiBzdHJ1Y3QgYXN0X2dlbV9vYmplY3QKICBkcm0vYXN0OiBDaGVjayB2aWRlby1tb2RlIHJl
cXVpcmVtZW50cyBhZ2FpbnN0IFZSQU0gc2l6ZQogIGRybS9hc3Q6IERvbid0IGNsZWFyIGJhc2Ug
YWRkcmVzcyBhbmQgb2Zmc2V0IHdpdGggZGVmYXVsdCB2YWx1ZXMKICBkcm0vYXN0OiBTcGxpdCBh
c3Rfc2V0X2V4dF9yZWcoKSBpbnRvIGNvbG9yIGFuZCB0aHJlc2hvbGQgZnVuY3Rpb24KICBkcm0v
YXN0OiBTcGxpdCBhc3Rfc2V0X3ZiaW9zX21vZGVfaW5mbygpCiAgZHJtL2FzdDogQWRkIHByaW1h
cnkgcGxhbmUKICBkcm0vYXN0OiBBZGQgQ1JUQyBoZWxwZXJzIGZvciBhdG9taWMgbW9kZXNldHRp
bmcKICBkcm0vYXN0OiBBZGQgY3Vyc29yIHBsYW5lCiAgZHJtL2FzdDogRW5hYmxlIGF0b21pYyBt
b2Rlc2V0dGluZwoKIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jICB8ICAyNCArLQogZHJp
dmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmggIHwgICA5ICstCiBkcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9tYWluLmMgfCAgNTQgKy0tCiBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgfCA2
OTggKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDQ2
MiBpbnNlcnRpb25zKCspLCAzMjMgZGVsZXRpb25zKC0pCgotLQoyLjIzLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

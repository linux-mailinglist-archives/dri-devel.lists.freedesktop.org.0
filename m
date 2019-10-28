Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DA9E6E6B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 09:46:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12F6899C7;
	Mon, 28 Oct 2019 08:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A653E89973
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 08:45:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 13F89B21C;
 Mon, 28 Oct 2019 08:45:52 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch, noralf@tronnes.org,
 sam@ravnborg.org, emil.velikov@collabora.com
Subject: [PATCH 0/3] drm/udl: Convert to SHMEM
Date: Mon, 28 Oct 2019 09:45:46 +0100
Message-Id: <20191028084549.30243-1-tzimmermann@suse.de>
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

VWRsJ3MgR0VNIGltcGxlbWVudGF0aW9uIGlzIG1vc3RseSBTSE1FTSBhbmQgd2Ugc2hvdWxkIGF0
dGVtcHQgdG8KcmVwbGFjZSBpdCB3aXRoIHRoZSBsYXR0ZXIuCgpQYXRjaGVzICMxIGFuZCAjMiB1
cGRhdGUgdWRsIHRvIHNpbXBsaWZ5IHRoZSBjb252ZXJzaW9uLiBJbiBwYXRjaCAjMwp0aGUgdWRs
IGNvZGUgaXMgYmVpbmcgcmVwbGFjZWQgYnkgU0hNRU0uIFRoZSBHRU0gb2JqZWN0J3MgbW1hcCgp
IGFuZApmcmVlX29iamVjdCgpIGZ1bmN0aW9ucyBhcmUgd3JhcHBlcnMgYXJvdW5kIHRoZWlyIFNI
TUVNIGNvdW50ZXJwYXJ0cy4KRm9yIG1tYXAoKSB3ZSBmaXgtdXAgdGhlIHBhZ2UtY2FjaGluZyBm
bGFncyB0byBkaXN0aW5ndWlzaCBiZXR3ZWVuCndyaXRlLWNvbWJpbmVkIGFuZCBjYWNoZWQgYWNj
ZXNzLiBGb3IgZnJlZSgpLCB3ZSBoYXZlIHRvIHVubWFwIHRoZQpidWZmZXIncyBtYXBwaW5nIHRo
YXQgaGFzIGJlZW4gZXN0YWJsaXNoZWQgYnkgdWRsJ3MgZmJkZXYgY29kZS4KClRoZSBwYXRjaHNl
dCBoYXMgYmVlbiB0ZXN0ZWQgYnkgcnVubmluZyB0aGUgZmJkZXYgY29uc29sZSwgWDExIGFuZApX
ZXN0b24gb24gYSBEaXNwbGF5TGluayBhZGFwdGVyLgoKVGhvbWFzIFppbW1lcm1hbm4gKDMpOgog
IGRybS91ZGw6IFJlbW92ZSBmbGFncyBmaWVsZCBmcm9tIHN0cnVjdCB1ZGxfZ2VtX29iamVjdAog
IGRybS91ZGw6IEFsbG9jYXRlIEdFTSBvYmplY3QgdmlhIHN0cnVjdCBkcm1fZHJpdmVyLmdlbV9j
cmVhdGVfb2JqZWN0CiAgZHJtL3VkbDogU3dpdGNoIHRvIFNITUVNCgogZHJpdmVycy9ncHUvZHJt
L3VkbC9LY29uZmlnICAgICAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL3VkbC9NYWtlZmlsZSAg
ICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2RtYWJ1Zi5jIHwgMjU1IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5j
ICAgIHwgIDMwICstLS0KIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5oICAgIHwgIDM2ICst
LS0tCiBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9mYi5jICAgICB8ICA2NSArKysrLS0tLQogZHJp
dmVycy9ncHUvZHJtL3VkbC91ZGxfZ2VtLmMgICAgfCAyNDUgKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KIDcgZmlsZXMgY2hhbmdlZCwgOTMgaW5zZXJ0aW9ucygrKSwgNTQxIGRlbGV0aW9u
cygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2RtYWJ1Zi5j
CgotLQoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==

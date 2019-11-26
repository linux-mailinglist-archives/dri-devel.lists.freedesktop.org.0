Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B4210998D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 08:26:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27DB6E20D;
	Tue, 26 Nov 2019 07:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DE06E02D
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 07:25:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C734FAD72;
 Tue, 26 Nov 2019 07:25:48 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, john.p.donnelly@oracle.com,
 kraxel@redhat.com, sam@ravnborg.org
Subject: [PATCH 0/4] drm/mgag200: Workaround HW bug with non-0 offset
Date: Tue, 26 Nov 2019 08:25:41 +0100
Message-Id: <20191126072545.22663-1-tzimmermann@suse.de>
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

V2UgZm91bmQgYW4gTUdBIGNoaXAgdGhhdCBkb2VzIG5vdCBpbnRlcnByZXQgdGhlIHNjYW5vdXQg
b2Zmc2V0CmNvcnJlY3RseS4gVGhpcyBwYXRjaCB3b3JrcyBhcm91bmQgdGhlIHByb2JsZW0gYnkg
cGxhY2luZyBhbGwgYnVmZmVyCm9iamVjdHMgYXQgb2Zmc2V0IDAgb24gdGhpcyBzeXN0ZW0uCgpU
aGVyZSdzIGEgbmV3IG1vZHVsZSBwYXJhbWV0ZXIgJ2h3X2J1Z19ub19zdGFydGFkZCcgdGhhdCBl
bmFibGVzIGFuZApkaXNhYmxlcyB0aGUgb2Zmc2V0LTAgcGxhY2VtZW50LiBEZWZhdWx0IGlzIGF1
dG8tZGV0ZWN0aW9uLgoKVGhvbWFzIFppbW1lcm1hbm4gKDQpOgogIGRybS9tZ2FnMjAwOiBFeHRy
YWN0IGRldmljZSB0eXBlIGZyb20gZmxhZ3MKICBkcm0vbWdhZzIwMDogU3RvcmUgZmxhZ3MgZnJv
bSBQQ0kgZHJpdmVyIGRhdGEgaW4gZGV2aWNlIHN0cnVjdHVyZQogIGRybS9tZ2FnMjAwOiBBZGQg
d29ya2Fyb3VuZCBmb3IgSFcgdGhhdCBkb2VzIG5vdCBzdXBwb3J0ICdzdGFydGFkZCcKICBkcm0v
bWdhZzIwMDogQWRkIG1vZHVsZSBwYXJhbWV0ZXIgdG8gcGluIGFsbCBidWZmZXJzIGF0IG9mZnNl
dCAwCgogZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYyAgfCA0NCArKysrKysr
KysrKysrKysrKysrKysrKysrLQogZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYu
aCAgfCAxOCArKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tYWlu
LmMgfCAgMyArLQogMyBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKLS0KMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=

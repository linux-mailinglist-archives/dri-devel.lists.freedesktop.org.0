Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8DC109C1A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 11:15:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6016E2DA;
	Tue, 26 Nov 2019 10:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D66289D40
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 10:15:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CF6AFB158;
 Tue, 26 Nov 2019 10:15:30 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, john.p.donnelly@oracle.com,
 kraxel@redhat.com, sam@ravnborg.org
Subject: [PATCH v2 0/3] drm/mgag200: Workaround HW bug with non-0 offset
Date: Tue, 26 Nov 2019 11:15:26 +0100
Message-Id: <20191126101529.20356-1-tzimmermann@suse.de>
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
b2Zmc2V0CmNvcnJlY3RseS4gVGhpcyBwYXRjaHNldCB3b3JrcyBhcm91bmQgdGhlIHByb2JsZW0g
YnkgcGxhY2luZyBhbGwKYnVmZmVyIG9iamVjdHMgYXQgb2Zmc2V0IDAgb24gdGhpcyBzeXN0ZW0u
Cgp2MjoKCSogc2VyYXJhdGUgWzQvNF0gZnJvbSB0aGUgcmVzdCBvZiB0aGUgc2VyaWVzCgkqIGFk
ZCBtaXNzaW5nIHRhZ3MgdG8gcGF0Y2ggZmlsZXMKClRob21hcyBaaW1tZXJtYW5uICgzKToKICBk
cm0vbWdhZzIwMDogRXh0cmFjdCBkZXZpY2UgdHlwZSBmcm9tIGZsYWdzCiAgZHJtL21nYWcyMDA6
IFN0b3JlIGZsYWdzIGZyb20gUENJIGRyaXZlciBkYXRhIGluIGRldmljZSBzdHJ1Y3R1cmUKICBk
cm0vbWdhZzIwMDogQWRkIHdvcmthcm91bmQgZm9yIEhXIHRoYXQgZG9lcyBub3Qgc3VwcG9ydCAn
c3RhcnRhZGQnCgogZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYyAgfCAzNiAr
KysrKysrKysrKysrKysrKysrKysrKysrLQogZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIw
MF9kcnYuaCAgfCAxOCArKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2Fn
MjAwX21haW4uYyB8ICAzICsrLQogMyBmaWxlcyBjaGFuZ2VkLCA1NSBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKLS0KMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=

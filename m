Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDDAF1647
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 13:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68E56E20D;
	Wed,  6 Nov 2019 12:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D791F6E1E8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 12:47:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5BCFCB2CD;
 Wed,  6 Nov 2019 12:47:30 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	noralf@tronnes.org
Subject: [PATCH v2 0/2] Remove drm_fb_helper_fbdev_{setup,teardown}()
Date: Wed,  6 Nov 2019 13:47:25 +0100
Message-Id: <20191106124727.11641-1-tzimmermann@suse.de>
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

Qm90aCBmdW5jdGlvbnMgYXJlIHVudXNlZC4gVXBkYXRlIFRPRE8gaXRlbSBhbmQgcmVtb3ZlIHRo
ZW0uCgp2MjoKCSogcmV3b3JkIHRoZSB3aG9sZSBUT0RPIGl0ZW0KCSoga2VlcCBhIFRPRE8gaXRl
bSBvbiBkcm1fZmJfaGVscGVyX2luaXQoKQoKVGhvbWFzIFppbW1lcm1hbm4gKDIpOgogIGRybS90
b2RvOiBDb252ZXJ0IGRyaXZlcnMgdG8gZ2VuZXJpYyBmYmRldiBlbXVsYXRpb24KICBkcm0vZmIt
aGVscGVyOiBSZW1vdmUgZHJtX2ZiX2hlbHBlcl9mYmRldl97c2V0dXAsdGVhcmRvd259KCkKCiBE
b2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCAgICAgIHwgIDIzICsrLS0tLS0KIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZmJfaGVscGVyLmMgfCAxMDkgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KIGluY2x1ZGUvZHJtL2RybV9mYl9oZWxwZXIuaCAgICAgfCAgMjUgLS0tLS0tLS0KIDMgZmls
ZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxNDkgZGVsZXRpb25zKC0pCgotLQoyLjIzLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

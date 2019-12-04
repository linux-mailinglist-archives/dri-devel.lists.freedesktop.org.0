Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCC8112CAC
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 14:34:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD6C6F4B1;
	Wed,  4 Dec 2019 13:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A686F4B1
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 13:34:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2304AB37A;
 Wed,  4 Dec 2019 13:34:38 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, john.p.donnelly@oracle.com,
 kraxel@redhat.com, sam@ravnborg.org
Subject: [PATCH] drm/mgag200: Debug-print unique revisions id on G200 SE
Date: Wed,  4 Dec 2019 14:34:35 +0100
Message-Id: <20191204133435.17462-1-tzimmermann@suse.de>
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

VGhlIGJlaGF2aW9yIG9mIE1HQSBHMjAwIFNFIGRlcGVuZHMgb24gdGhlIHJldiBpZC4gUHJpbnQg
dGhlIGlkIHdoZW4KZGVidWdnaW5nIGlzIGVuYWJsZWQuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWdh
ZzIwMC9tZ2FnMjAwX21haW4uYyB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIw
MC9tZ2FnMjAwX21haW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbWFpbi5j
CmluZGV4IGUxYmM1YjBhYTc3NC4uYWViN2MxMGRlZDBkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21haW4uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIw
MC9tZ2FnMjAwX21haW4uYwpAQCAtMTE4LDggKzExOCwxMSBAQCBzdGF0aWMgaW50IG1nYWcyMDBf
ZGV2aWNlX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJcmV0dXJuIC1FTk9NRU07CiAK
IAkvKiBzdGFzaCBHMjAwIFNFIG1vZGVsIG51bWJlciBmb3IgbGF0ZXIgdXNlICovCi0JaWYgKElT
X0cyMDBfU0UobWRldikpCisJaWYgKElTX0cyMDBfU0UobWRldikpIHsKIAkJbWRldi0+dW5pcXVl
X3Jldl9pZCA9IFJSRUczMigweDFlMjQpOworCQlEUk1fREVCVUcoIkcyMDAgU0UgdW5pcXVlIHJl
dmlzaW9uIGlkIGlzIDB4JXhcbiIsCisJCQkgIG1kZXYtPnVuaXF1ZV9yZXZfaWQpOworCX0KIAog
CXJldCA9IG1nYV92cmFtX2luaXQobWRldik7CiAJaWYgKHJldCkKLS0gCjIuMjMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

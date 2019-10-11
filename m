Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A76D5D41C4
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 15:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01C96EC3E;
	Fri, 11 Oct 2019 13:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0370B6EC3F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 13:48:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3A127AF22;
 Fri, 11 Oct 2019 13:48:18 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: hdegoede@redhat.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 0/3] drm/vboxvideo: Use generic fbdev and framebuffer
Date: Fri, 11 Oct 2019 15:48:05 +0200
Message-Id: <20191011134808.3955-1-tzimmermann@suse.de>
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

VGhlIHZib3h2aWRlbyBkcml2ZXIgcHJvdmlkZXMgaXRzIG93biBpbXBsZW1lbnRhdGlvbiBmb3Ig
ZmJkZXYgZW11bGF0aW9uCmFuZCBmcmFtZWJ1ZmZlcnMuIEJvdGggY2FuIGJlIHJlcGxhY2VkIGJ5
IERSTSdzIGdlbmVyaWMgY29kZS4KCkFsbCBwYXRjaGVzIGhhdmUgYmVlbiB0ZXN0ZWQgb24gVmly
dHVhbEJveCA2LjAuMTIuCgpUaG9tYXMgWmltbWVybWFubiAoMyk6CiAgZHJtL3Zib3h2aWRlbzog
U3dpdGNoIHRvIGdlbmVyaWMgZmJkZXYgZW11bGF0aW9uCiAgZHJtL3Zib3h2aWRlbzogU3dpdGNo
IHRvIGRybV9hdG9taWNfaGVscGVyX2RpcnR5X2ZiKCkKICBkcm0vdmJveHZpZGVvOiBSZXBsYWNl
IHN0cnVjdCB2cmFtX2ZyYW1lYnVmZmVyIHdpdGggZ2VuZXJpYwogICAgaW1wbGVtZW5hdGlvbgoK
IGRyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vTWFrZWZpbGUgICAgfCAgIDIgKy0KIGRyaXZlcnMv
Z3B1L2RybS92Ym94dmlkZW8vdmJveF9kcnYuYyAgfCAgMTQgKy0tCiBkcml2ZXJzL2dwdS9kcm0v
dmJveHZpZGVvL3Zib3hfZHJ2LmggIHwgIDI1IC0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmJveHZp
ZGVvL3Zib3hfZmIuYyAgIHwgMTQ5IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJz
L2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfbWFpbi5jIHwgMTE5ICstLS0tLS0tLS0tLS0tLS0tLS0t
CiBkcml2ZXJzL2dwdS9kcm0vdmJveHZpZGVvL3Zib3hfbW9kZS5jIHwgIDg2ICsrKysrKystLS0t
LS0tLQogNiBmaWxlcyBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspLCAzNDYgZGVsZXRpb25zKC0p
CiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3Zib3h2aWRlby92Ym94X2ZiLmMK
Ci0tCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

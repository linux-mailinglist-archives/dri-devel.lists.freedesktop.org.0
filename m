Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 423E0DCD07
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 19:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666816EB7D;
	Fri, 18 Oct 2019 17:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BECA6E13F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 17:50:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A744C10DCC96;
 Fri, 18 Oct 2019 17:50:42 +0000 (UTC)
Received: from datura.bss.redhat.com (dhcp-10-20-1-78.bss.redhat.com
 [10.20.1.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 195125D9CA;
 Fri, 18 Oct 2019 17:50:42 +0000 (UTC)
From: Adam Jackson <ajax@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/fourcc: Fix undefined left shift in DRM_FORMAT_BIG_ENDIAN
 macros
Date: Fri, 18 Oct 2019 13:50:41 -0400
Message-Id: <20191018175041.613780-1-ajax@redhat.com>
In-Reply-To: <20191018170704.GE1208@intel.com>
References: <20191018170704.GE1208@intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Fri, 18 Oct 2019 17:50:42 +0000 (UTC)
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
Cc: Eric Engestrom <eric.engestrom@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTw8MzEgaXMgdW5kZWZpbmVkIGJlY2F1c2UgaXQncyBhIHNpZ25lZCBpbnQgYW5kIEMgaXMgdGVy
cmlibGUuCgpSZXZpZXdlZC1ieTogRXJpYyBFbmdlc3Ryb20gPGVyaWMuZW5nZXN0cm9tQGludGVs
LmNvbT4KU2lnbmVkLW9mZi1ieTogQWRhbSBKYWNrc29uIDxhamF4QHJlZGhhdC5jb20+Ci0tLQog
aW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNjLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJt
L2RybV9mb3VyY2MuaCBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCmluZGV4IDNmZWVh
YTNmOTg3YS4uYzA2ZDM0NTU5ZmFiIDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9m
b3VyY2MuaAorKysgYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaApAQCAtNjksNyArNjks
NyBAQCBleHRlcm4gIkMiIHsKICNkZWZpbmUgZm91cmNjX2NvZGUoYSwgYiwgYywgZCkgKChfX3Uz
MikoYSkgfCAoKF9fdTMyKShiKSA8PCA4KSB8IFwKIAkJCQkgKChfX3UzMikoYykgPDwgMTYpIHwg
KChfX3UzMikoZCkgPDwgMjQpKQogCi0jZGVmaW5lIERSTV9GT1JNQVRfQklHX0VORElBTiAoMTw8
MzEpIC8qIGZvcm1hdCBpcyBiaWcgZW5kaWFuIGluc3RlYWQgb2YgbGl0dGxlIGVuZGlhbiAqLwor
I2RlZmluZSBEUk1fRk9STUFUX0JJR19FTkRJQU4gKDFVPDwzMSkgLyogZm9ybWF0IGlzIGJpZyBl
bmRpYW4gaW5zdGVhZCBvZiBsaXR0bGUgZW5kaWFuICovCiAKIC8qIFJlc2VydmUgMCBmb3IgdGhl
IGludmFsaWQgZm9ybWF0IHNwZWNpZmllciAqLwogI2RlZmluZSBEUk1fRk9STUFUX0lOVkFMSUQJ
MAotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=

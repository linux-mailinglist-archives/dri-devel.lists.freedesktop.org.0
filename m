Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E069A42D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 02:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57BE6EB91;
	Fri, 23 Aug 2019 00:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835816EB8F;
 Fri, 23 Aug 2019 00:09:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EA4923082D9E;
 Fri, 23 Aug 2019 00:09:12 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-11.bss.redhat.com
 [10.20.1.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A175D600CD;
 Fri, 23 Aug 2019 00:09:11 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3] drm/i915: Enable CONFIG_DMA_API_DEBUG_SG for intel-ci
Date: Thu, 22 Aug 2019 20:09:03 -0400
Message-Id: <20190823000903.12675-1-lyude@redhat.com>
In-Reply-To: <20190822203127.24648-2-lyude@redhat.com>
References: <20190822203127.24648-2-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Fri, 23 Aug 2019 00:09:13 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93IHRoYXQgd2UndmUgZml4ZWQgaTkxNSBzbyB0aGF0IGl0IHNldHMgYSBtYXggU0cgc2VnbWVu
dCBsZW5ndGggYW5kCmdvdHRlbiByaWQgb2YgdGhlIHJlbGV2YW50IHdhcm5pbmdzLCBsZXQncyBl
bmFibGUKQ09ORklHX0RNQV9BUElfREVCVUdfU0cgZm9yIGludGVsLWNpIHNvIHRoYXQgd2UgY2Fu
IGNhdGNoIGlzc3VlcyBsaWtlCnRoaXMgaW4gdGhlIGZ1dHVyZSBhcyB3ZWxsLgoKQ2hhbmdlcyBz
aW5jZSB2MjoKKiBBbHNvIHNlbGVjdCBETUFfQVBJX0RFQlVHIC0gQ2hyaXMgV2lsc29uCgpTaWdu
ZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpDYzogQ2hyaXMgV2lsc29u
IDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvS2Nv
bmZpZy5kZWJ1ZyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9LY29uZmlnLmRlYnVnIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvS2NvbmZpZy5kZWJ1ZwppbmRleCAwMDc4NmExNDJmZjAuLmNiOTI5ZDAyMThlOCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvS2NvbmZpZy5kZWJ1ZworKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9LY29uZmlnLmRlYnVnCkBAIC0zMiw2ICszMiw4IEBAIGNvbmZpZyBE
Uk1fSTkxNV9ERUJVRwogCXNlbGVjdCBEUk1fREVCVUdfU0VMRlRFU1QKIAlzZWxlY3QgRE1BQlVG
X1NFTEZURVNUUwogCXNlbGVjdCBTV19TWU5DICMgc2lnbmFsaW5nIHZhbGlkYXRpb24gZnJhbWV3
b3JrIChpZ3Qvc3luY29iaiopCisgICAgICAgIHNlbGVjdCBETUFfQVBJX0RFQlVHCisgICAgICAg
IHNlbGVjdCBETUFfQVBJX0RFQlVHX1NHCiAJc2VsZWN0IERSTV9JOTE1X1NXX0ZFTkNFX0RFQlVH
X09CSkVDVFMKIAlzZWxlY3QgRFJNX0k5MTVfU0VMRlRFU1QKIAlzZWxlY3QgRFJNX0k5MTVfREVC
VUdfUlVOVElNRV9QTQotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=

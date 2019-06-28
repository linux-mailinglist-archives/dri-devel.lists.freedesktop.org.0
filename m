Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DA559AF4
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 14:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093D96E917;
	Fri, 28 Jun 2019 12:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA526E914
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 12:27:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D873FAFFA;
 Fri, 28 Jun 2019 12:27:03 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, maxime.ripard@bootlin.com,
 sean@poorly.run, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com
Subject: [PATCH 0/4] Convert VRAM helpers to GEM object functions
Date: Fri, 28 Jun 2019 14:26:55 +0200
Message-Id: <20190628122659.31887-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.21.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFBSSU1FIGNhbGxiYWNrIGZ1bmN0aW9ucyBpbiBzdHJ1Y3QgZHJtX2RyaXZlciBhcmUgZGVw
cmVjYXRlZCBpbgpmYXZvciBvZiB0aGVpciBjb3VudGVycGFydHMgaW4gc3RydWN0IGRybV9nZW1f
b2JqZWN0X2Z1bmNzLgoKVGhpcyBwYXRjaCBzZXQgaW50cm9kdWNlcyBHRU0gb2JqZWN0IGZ1bmN0
aW9ucyBmb3IgVlJBTSBoZWxwZXJzIGFuZApjb252ZXJ0cyBvdmVyIHRoZSBmcmVlIGFuZCBQUklN
RSBmdW5jdGlvbnMuIERyaXZlcnMgYWZmZWN0ZWQgYnkgdGhpcwpjaGFuZ2UsIG5hbWVseSBib2No
cyBhbmQgaGlibWMsIGFyZSBhZGFwdGVkIGFjY29yZGluZ2x5LgoKVGhvbWFzIFppbW1lcm1hbm4g
KDQpOgogIGRybS92cmFtOiBTZXQgR0VNIG9iamVjdCBmdW5jdGlvbnMgZm9yIFBSSU1FCiAgZHJt
L2JvY2hzOiBSZW1vdmUgUFJJTUUgaGVscGVycyBmcm9tIGRyaXZlciBzdHJ1Y3R1cmUKICBkcm0v
aGlibWM6IExlYXZlIHN0cnVjdCBkcm1fZHJpdmVyLmdlbV9mcmVlX29iamVjdF91bmxvY2tlZCB0
byBOVUxMCiAgZHJtL3ZyYW06IFJlbW92ZSBkcml2ZXIgY2FsbGJhY2sgZnVuY3Rpb25zIGZvciBQ
UklNRQoKIERvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0ICAgICAgICAgICAgICAgICAgICB8ICAg
NCArLQogZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2Rydi5jICAgICAgICAgICAgIHwgICAx
IC0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgICAgICAgICB8IDE4OCAr
KysrKysrLS0tLS0tLS0tLS0KIC4uLi9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1f
ZHJ2LmMgICB8ICAgMiAtCiBpbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmggICAgICAg
ICAgICAgfCAgMjUgKy0tCiA1IGZpbGVzIGNoYW5nZWQsIDczIGluc2VydGlvbnMoKyksIDE0NyBk
ZWxldGlvbnMoLSkKCi0tCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs

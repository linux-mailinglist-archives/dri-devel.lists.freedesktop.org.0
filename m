Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEB3E35C4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 16:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28EC6E42C;
	Thu, 24 Oct 2019 14:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3676E426
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 14:42:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BFB7EB92B;
 Thu, 24 Oct 2019 14:42:46 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch, sam@ravnborg.org,
 noralf@tronnes.org
Subject: [PATCH 0/5] drm/udl: Convert to generic fbdev emulation
Date: Thu, 24 Oct 2019 16:42:32 +0200
Message-Id: <20191024144237.8898-1-tzimmermann@suse.de>
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

VGhpcyBwYXRjaHNldCByZXBsYWNlcyB1ZGwncyBmYmRldiBjb2RlIHdpdGggdGhlIGdlbmVyaWMg
aW1wbGVtZW50YXRpb24uCgpUaGUgZmlyc3QgcGF0Y2ggZml4ZXMgYSBidWcgdGhhdCBkaWRuJ3Qg
dHJpZ2dlciB5ZXQgYmVjYXVzZSB0aGUgY3VycmVudApmYmRldiBuZXZlciB1bm1hcHMgdGhlIEJP
LiBQYXRjaGVzIDIgdG8gMyBhZGQgbWlzc2luZyBpbnRlcmZhY2VzIHRvIHRoZQp1ZGwgZHJpdmVy
LiBQYXRjaCA0IHNldHMgbWFwcGluZyBmbGFncy4gSW4gdGhlIGZpbmFsIHBhdGNoLCB3ZSByZW1v
dmUgYQpsb3Qgb2YgY29kZSBhbmQgc2V0IGEgZmV3IGhlbHBlcnMgaW5zdGVhZC4KClRoZSBwYXRj
aHNldCB3YXMgdGVzdGVkIGJ5IHJ1bm5pbmcgdGhlIGZiZGV2IGNvbnNvbGUsIFgxMSwgYW5kIFdl
c3RvbiBvbgphIERpc3BsYXlMaW5rIGFkYXB0ZXIuCgpUaG9tYXMgWmltbWVybWFubiAoNSk6CiAg
ZHJtL3VkbDogQ2xlYXIgQk8gdm1hcHBpbmcgcG9pbnRlciBhZnRlciB1bm1hcHBpbmcgQk8gbWVt
b3J5CiAgZHJtL3VkbDogU2V0IGRybV9kcml2ZXIuZ2VtX3ByaW1lX21tYXAKICBkcm0vdWRsOiBB
ZGQgR0VNIG9iamVjdCBmdW5jdGlvbnMgZm9yIGZyZWUoKSwgdm1hcCgpLCBhbmQgdnVubWFwKCkK
ICBkcm0vdWRsOiBNYXAgQk8gbWVtb3J5IHBhZ2VzIGluIHVuZW5jcnlwdGVkIG1vZGUKICBkcm0v
dWRsOiBSZXBsYWNlIGZiZGV2IGNvZGUgd2l0aCBnZW5lcmljIGVtdWxhdGlvbgoKIGRyaXZlcnMv
Z3B1L2RybS91ZGwvdWRsX2Rydi5jICAgICB8ICAgNCArCiBkcml2ZXJzL2dwdS9kcm0vdWRsL3Vk
bF9kcnYuaCAgICAgfCAgIDQgLQogZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZmIuYyAgICAgIHwg
MjYzICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3VkbC91
ZGxfZ2VtLmMgICAgIHwgIDQwICsrKystCiBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMg
ICAgfCAgIDIgLQogZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jIHwgICAzICstCiA2
IGZpbGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDI2OCBkZWxldGlvbnMoLSkKCi0tCjIu
MjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

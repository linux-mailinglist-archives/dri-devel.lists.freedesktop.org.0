Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F9ABB448
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514AD6E8BE;
	Mon, 23 Sep 2019 12:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtphy.263.net (syd-smtp02.263.net [13.237.61.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B238D6E8BA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 12:51:45 +0000 (UTC)
Received: from regular2.263xmail.com (unknown [211.157.147.163])
 by smtphy.263.net (Postfix) with ESMTPS id 3F0FF1200E3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 20:44:07 +0800 (CST)
Received: from regular1.263xmail.com (unknown [192.168.165.231])
 by regular2.263xmail.com (Postfix) with ESMTP id 0B979236
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 20:44:03 +0800 (CST)
Received: from hjc?rock-chips.com (unknown [192.168.167.16])
 by regular1.263xmail.com (Postfix) with ESMTP id 0DEC2B96;
 Mon, 23 Sep 2019 20:44:00 +0800 (CST)
X-263anti-spam: KSV:0;BIG:0;
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-KSVirus-check: 0
X-ADDR-CHECKED4: 1
X-ABS-CHECKED: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P3051T140289744058112S1569242621440080_; 
 Mon, 23 Sep 2019 20:44:00 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <6e704a054898d3f23dd3220778556226>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: dri-devel@lists.freedesktop.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
From: Sandy Huang <hjc@rock-chips.com>
To: dri-devel@lists.freedesktop.org,
 "James (Qian) Wang" <james.qian.wang@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Brian Starkey <brian.starkey@arm.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 10/36] drm/arm: use bpp instead of cpp for drm_format_info
Date: Mon, 23 Sep 2019 20:41:14 +0800
Message-Id: <1569242500-182337-11-git-send-email-hjc@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569242500-182337-7-git-send-email-hjc@rock-chips.com>
References: <1569242500-182337-7-git-send-email-hjc@rock-chips.com>
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
Cc: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y3BwW0J5dGVQZXJQbGFuZV0gY2FuJ3QgZGVzY3JpYmUgdGhlIDEwYml0IGRhdGEgZm9ybWF0IGNv
cnJlY3RseSwKU28gd2UgdXNlIGJwcFtCaXRQZXJQbGFuZV0gdG8gaW5zdGVhZCBjcHAuCgpTaWdu
ZWQtb2ZmLWJ5OiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmMgfCAyICstCiBk
cml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9ody5jICAgICAgICAgICAgICAgICAgICAgICAgIHwg
MiArLQogZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfcGxhbmVzLmMgICAgICAgICAgICAgICAg
ICAgICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2ZyYW1lYnVmZmVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9mcmFtZWJ1ZmZlci5jCmluZGV4IDNiMGE3MGUuLmQwMmRmYzYgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIu
YwpAQCAtODksNyArODksNyBAQCBrb21lZGFfZmJfYWZiY19zaXplX2NoZWNrKHN0cnVjdCBrb21l
ZGFfZmIgKmtmYiwgc3RydWN0IGRybV9maWxlICpmaWxlLAogCQkJCSAgICBhbGlnbm1lbnRfaGVh
ZGVyKTsKIAogCWtmYi0+YWZiY19zaXplID0ga2ZiLT5vZmZzZXRfcGF5bG9hZCArIG5fYmxvY2tz
ICoKLQkJCSBBTElHTihpbmZvLT5jcHBbMF0gKiBBRkJDX1NVUEVSQkxLX1BJWEVMUywKKwkJCSBB
TElHTihpbmZvLT5icHBbMF0gLyA4ICogQUZCQ19TVVBFUkJMS19QSVhFTFMsCiAJCQkgICAgICAg
QUZCQ19TVVBFUkJMS19BTElHTk1FTlQpOwogCW1pbl9zaXplID0ga2ZiLT5hZmJjX3NpemUgKyBm
Yi0+b2Zmc2V0c1swXTsKIAlpZiAobWluX3NpemUgPiBvYmotPnNpemUpIHsKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2h3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL21h
bGlkcF9ody5jCmluZGV4IGJkODI2NWYuLjU0YmU4ZDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hcm0vbWFsaWRwX2h3LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfaHcu
YwpAQCAtMzg0LDcgKzM4NCw3IEBAIHN0YXRpYyB2b2lkIG1hbGlkcDUwMF9tb2Rlc2V0KHN0cnVj
dCBtYWxpZHBfaHdfZGV2aWNlICpod2Rldiwgc3RydWN0IHZpZGVvbW9kZSAqCiBpbnQgbWFsaWRw
X2Zvcm1hdF9nZXRfYnBwKHUzMiBmbXQpCiB7CiAJY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5m
byAqaW5mbyA9IGRybV9mb3JtYXRfaW5mbyhmbXQpOwotCWludCBicHAgPSBpbmZvLT5jcHBbMF0g
KiA4OworCWludCBicHAgPSBpbmZvLT5icHBbMF07CiAKIAlpZiAoYnBwID09IDApIHsKIAkJc3dp
dGNoIChmbXQpIHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX3BsYW5l
cy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfcGxhbmVzLmMKaW5kZXggM2M3MGE1My4u
NjI4ZjMyNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfcGxhbmVzLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfcGxhbmVzLmMKQEAgLTIyNSw3ICsyMjUs
NyBAQCBib29sIG1hbGlkcF9mb3JtYXRfbW9kX3N1cHBvcnRlZChzdHJ1Y3QgZHJtX2RldmljZSAq
ZHJtLAogCiAJaWYgKG1vZGlmaWVyICYgQUZCQ19TUExJVCkgewogCQlpZiAoIWluZm8tPmlzX3l1
dikgewotCQkJaWYgKGluZm8tPmNwcFswXSA8PSAyKSB7CisJCQlpZiAoaW5mby0+YnBwWzBdIDw9
IDE2KSB7CiAJCQkJRFJNX0RFQlVHX0tNUygiUkdCIGZvcm1hdHMgPD0gMTZicHAgYXJlIG5vdCBz
dXBwb3J0ZWQgd2l0aCBTUExJVFxuIik7CiAJCQkJcmV0dXJuIGZhbHNlOwogCQkJfQotLSAKMi43
LjQKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

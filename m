Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEBB7DA96
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 13:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D516E532;
	Thu,  1 Aug 2019 11:51:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5FA66E542
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 11:51:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0F77EADF0;
 Thu,  1 Aug 2019 11:51:04 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, noralf@tronnes.org, airlied@linux.ie,
 rong.a.chen@intel.com, feng.tang@intel.com, ying.huang@intel.com,
 sean@poorly.run, maxime.ripard@bootlin.com,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 0/3] drm/vram-helper: Fix performance regression in fbdev
Date: Thu,  1 Aug 2019 13:50:35 +0200
Message-Id: <20190801115038.20476-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.22.0
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

R2VuZXJpYyBmYmRldiBlbXVsYXRpb24gbWFwcyBhbmQgdW5tYXBzIHRoZSBjb25zb2xlIEJPIGZv
ciB1cGRhdGluZyBpdCdzCmNvbnRlbnQgZnJvbSB0aGUgc2hhZG93IGJ1ZmZlci4gRHJpdmVycyB1
c2luZyBWUkFNIGhlbHBlcnMgbWF5IHNlZSByZWR1Y2VkCnBlcmZvcm1hbmNlIGFzIHRoZSBtYXBw
aW5nIG9wZXJhdGlvbnMgY2FuIGNyZWF0ZSBzaWduaWZpY2FudCBvdmVyaGVhZC4KQSByZXBvcnQg
b2YgdGhpcyBwcm9ibGVtIGlzIGF0IFsxXS4KClRoaXMgcGF0Y2ggc2V0IGZpeGVzIHRoZSBwcm9i
bGVtIGJ5IGFkZGluZyBhIHJlZiBjb3VudGVyIHRvIHRoZSBHRU0KVlJBTSBidWZmZXJzJyBrbWFw
IG9wZXJhdGlvbiwgYW5kIGtlZXBpbmcgdGhlIGZiZGV2J3MgY29uc29sZSBidWZmZXIKbWFwcGVk
IHdoaWxlIHRoZSBjb25zb2xlIGlzIGJlaW5nIGRpc3BsYXllZC4gVGhlc2UgY2hhbmdlcyBhdm9p
ZHMgdGhlCmZyZXF1ZW50IG1hcHBpbmdzIGluIHRoZSBmYmRldiBjb2RlLiBUaGUgZHJpdmVycywg
YXN0IGFuZCBtZ2FnMjAwLAptYXBzIHRoZSBjb25zb2xlJ3MgYnVmZmVyIHdoZW4gaXQgYmVjb21l
cyB2aXNpYmxlIGFuZCB0aGUgZmJkZXYgY29kZQpyZXVzZXMgdGhpcyBtYXBwaW5nLiBUaGUgb3Jp
Z2luYWwgZmJkZXYgY29kZSBpbiBhc3QgYW5kIG1nYWcyMDAgdXNlZAp0aGUgc2FtZSBvcHRpbWl6
YXRpb24uCgpbMV0gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRl
dmVsLzIwMTktSnVseS8yMjg2NjMuaHRtbAoKVGhvbWFzIFppbW1lcm1hbm4gKDMpOgogIGRybS92
cmFtLWhlbHBlcnM6IEFkZCBrbWFwIHJlZi1jb3VudGluZyB0byBHRU0gVlJBTSBvYmplY3RzCiAg
ZHJtL2FzdDogTWFwIGZiZGV2IGZyYW1lYnVmZmVyIHdoaWxlIGl0J3MgYmVpbmcgZGlzcGxheWVk
CiAgZHJtL21nYWcyMDA6IE1hcCBmYmRldiBmcmFtZWJ1ZmZlciB3aGlsZSBpdCdzIGJlaW5nIGRp
c3BsYXllZAoKIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21vZGUuYyAgICAgICAgIHwgMjAgKysr
KysrKwogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYyAgfCA3NCArKysrKysr
KysrKysrKysrKysrLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2Rl
LmMgfCAyMSArKysrKysrKwogaW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5oICAgICAg
fCAxMyArKysrKwogNCBmaWxlcyBjaGFuZ2VkLCAxMTAgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRp
b25zKC0pCgotLQoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==

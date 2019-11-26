Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C300109AEC
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 10:16:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA80689D81;
	Tue, 26 Nov 2019 09:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9201B89D7B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 09:16:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DA165B9BD;
 Tue, 26 Nov 2019 09:16:00 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@linux.ie, z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com, sam@ravnborg.org,
 kraxel@redhat.com, hslester96@gmail.com, yuehaibing@huawei.com
Subject: [PATCH v2 0/5] Replace hibmc code with generic implmentation
Date: Tue, 26 Nov 2019 10:15:52 +0100
Message-Id: <20191126091557.26783-1-tzimmermann@suse.de>
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

VGhlIHBhdGNoIHNldCByZXBsYWNlcyBjb2RlIGluIGhpYm1jIHdpdGggZ2VuZXJpYyBpbXBsZW1l
bnRhdGlvbi4KClBhdGNoZXMgMSB0byA0IHJlcGxhY2UgZmJkZXYgZW11YXRpb24sIGZyYW1lYnVm
ZmVyIGFuZCBjcmVhdGlvbiBvZgpkdW1iIGJ1ZmZlcnMgd2l0aCByZXNwZWN0aXZlIGNvZGUgZnJv
bSBEUk0gaGVscGVycy4gUGF0Y2ggNSBhZGRzIGFuCmFkZGl0aW9uYWwgaW50ZXJmYWNlIHRvIGRl
YnVnZnMgdGhhdCBkaXNwbGF5cyB0aGUgYWxsb2NhdGVkIGFuZCBmcmVlCmFyZWFzIGluIHZpZGVv
IG1lbW9yeS4KClRoZSBwYXRjaGVzIGhhdmUgb25seSBiZWVuIGNvbXBpbGUtdGVzdGVkLiBGdXJ0
aGVyIHRlc3RpbmcgaXMKYXBwcmVjaWF0ZWQuCgp2MjoKCSogc3BsaXQgWzMvNF0gaW50byB2cmFt
IGFuZCBoaWJtYyBjaGFuZ2VzCgkqIHZlcmlmeSB0aGF0IHBpdGNoX2FsaWduIGlzIHBvd2VyIG9m
IHR3bwoKVGhvbWFzIFppbW1lcm1hbm4gKDUpOgogIGRybS9oaXNpbGljb24vaGlibWM6IFN3aXRj
aCB0byBnZW5lcmljIGZiZGV2IGVtdWxhdGlvbgogIGRybS9oaXNpbGljb24vaGlibWM6IFJlcGxh
Y2Ugc3RydWN0IGhpYm1jX2ZyYW1lYnVmZmVyIHdpdGggZ2VuZXJpYwogICAgY29kZQogIGRybS92
cmFtOiBTdXBwb3J0IHNjYW5saW5lIGFsaWdubWVudCBmb3IgZHVtYiBidWZmZXJzCiAgZHJtL2hp
c2lsaWNvbi9oaWJtYzogSW1wbGVtZW50IGhpYm1jX2R1bWJfY3JlYXRlKCkgd2l0aCBnZW5lcmlj
CiAgICBoZWxwZXJzCiAgZHJtL2hpc2lsaWNvbi9oaWJtYzogRXhwb3J0IFZSQU0gTU0gaW5mb3Jt
YXRpb24gdG8gZGVidWdmcwoKIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMg
ICAgICAgICB8ICAxMyArLQogZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9NYWtlZmls
ZSAgICAgIHwgICAyICstCiAuLi4vZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rl
LmMgICAgfCAgIDQgKy0KIC4uLi9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2
LmMgICB8ICAgNiArLQogLi4uL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9kcnYu
aCAgIHwgIDI2IC0tCiAuLi4vZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2ZiZGV2
LmMgfCAyNDAgLS0tLS0tLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hp
Ym1jL2hpYm1jX3R0bS5jICAgfCAxMTcgKy0tLS0tLS0tCiBpbmNsdWRlL2RybS9kcm1fZ2VtX3Zy
YW1faGVscGVyLmggICAgICAgICAgICAgfCAgIDEgKwogOCBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNl
cnRpb25zKCspLCAzODkgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy9n
cHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZmJkZXYuYwoKLS0KMi4yMy4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

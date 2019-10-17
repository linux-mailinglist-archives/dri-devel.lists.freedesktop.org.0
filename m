Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E55DA6A5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 09:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B496E46B;
	Thu, 17 Oct 2019 07:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D286E45E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 07:47:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EE7A1B58D;
 Thu, 17 Oct 2019 07:47:08 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch
Subject: [PATCH v3 0/1] DRM fbconv helpers for converting fbdev drivers
Date: Thu, 17 Oct 2019 09:47:04 +0200
Message-Id: <20191017074705.9140-1-tzimmermann@suse.de>
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
Cc: linux-doc@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, corbet@lwn.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSByZWJhc2VkIHYyIG9mIHRoaXMgcGF0Y2hzZXQgb250byB2NS4zIGFuZCB1cGxvYWRlZCB0aGUg
cmVzdWx0CmludG8gdGhlIGdpdCByZXBvIGF0CgogIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZy90emltbWVybWFubi9saW51eC90cmVlL2ZiY29udgoKSSdsbCBrZWVwIHRoZSBoZWxwZXJz
IHVwZGF0ZWQgZm9yIG5ldyBMaW51eCByZWxlYXNlcyBmcm9tIHRpbWUgdG8KdGltZS4gVGhlIGF0
dGFjaGVkIHBhdGNoIGFkZHMgYSBuZXcgaXRlbSB0byB0aGUgVE9ETyBsaXN0IHRoYXQgcmVmZXJz
CnRvIHRoZSBleHRlcm5hbCB0cmVlIGFuZCBkb2N1bWVudGF0aW9uLgoKdjM6CgkqIHJlcGxhY2Ug
cGF0Y2hzZXQgaW4gZmF2b3Igb2YgVE9ETyBpdGVtIHRoYXQgcmVmZXJzIHRvCgkgIGV4dGVybmFs
IHRyZWUKdjI6CgkqIHJlbmFtZSB0byBmYmNvbnYgaGVscGVycwoJKiByZXdyaXRlIGFzIGhlbHBl
ciBsaWJyYXJ5CgkqIHN3aXRjaCBvdmVyIHRvIHNpbXBsZSBLTVMgaGVscGVycwoJKiBzd2l0Y2gg
b3ZlciB0byBTSE1FTQoJKiBhZGQgZG9jdW1lbnRhdGlvbgoKVGhvbWFzIFppbW1lcm1hbm4gKDEp
OgogIGRybTogQWRkIFRPRE8gaXRlbSBmb3IgZmJkZXYgZHJpdmVyIGNvbnZlcnNpb24KCiBEb2N1
bWVudGF0aW9uL2dwdS90b2RvLnJzdCB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKykKCi0tCjIuMjMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B7CAB371
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827FC6E185;
	Fri,  6 Sep 2019 07:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4C06E185
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 07:46:19 +0000 (UTC)
Received: from localhost (unknown [82.195.192.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D7D1620640;
 Fri,  6 Sep 2019 07:46:18 +0000 (UTC)
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] drm/modes: Make the whitelist more const
Date: Fri,  6 Sep 2019 10:46:14 +0300
Message-Id: <20190906074614.30608-1-mripard@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567755979;
 bh=lGvt1xwtKcfErR8AcZU9CR8eLZBIk/IHQLhXzNNKOXA=;
 h=From:To:Cc:Subject:Date:From;
 b=C8c3Qd+9XN0uhgdp90R3pVLTsxBefIsLWN3O+JnOnLu3XOU9oeCah3B3+pCPbEzYw
 ckFVcFUY9EYcitFBGVXICIFf90tIGzLFp6/J3dfcfaJsyuJPQOr7clxtAAxPD8qBaT
 c5Mi/gUO4lbIetz/Q228PrpHasjfdFkF8mvyIXog=
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNvbW1pdCAzNzY0MTM3OTA2YTUgKCJkcm0vbW9kZXM6IEludHJvZHVjZSBhIHdoaXRlbGlz
dCBmb3IgdGhlIG5hbWVkCm1vZGVzIikgaW50cm9kdWNlZCBhIHdoaXRlbGlzdCBpbiB0aGUgbmFt
ZWQgbW9kZXMgbG9va3VwIGNvZGUgaW4gb3JkZXIgdG8KYmUgYSBiaXQgbW9yZSByb2J1c3QuCgpI
b3dldmVyLCBldmVuIHRob3VnaCB0aGUgY2hhciBwb2ludGVycyB3ZXJlIG1hZGUgY29uc3QsIHRo
ZSBkYXRhIHRoZXkgd2VyZQpwb2ludGluZyB3ZXJlIG5vdC4gTGV0J3MgZml4IHRoYXQuCgpGaXhl
czogMzc2NDEzNzkwNmE1ICgiZHJtL21vZGVzOiBJbnRyb2R1Y2UgYSB3aGl0ZWxpc3QgZm9yIHRo
ZSBuYW1lZCBtb2RlcyIpClN1Z2dlc3RlZC1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxp
bnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJu
ZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fbW9kZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwppbmRl
eCA4NThjNjcyODE1MTguLjg4MjMyNjk4ZDdhMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2RybV9tb2Rlcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwpAQCAtMTY3Nyw3
ICsxNjc3LDcgQEAgc3RhdGljIGludCBkcm1fbW9kZV9wYXJzZV9jbWRsaW5lX29wdGlvbnMoY2hh
ciAqc3RyLCBzaXplX3QgbGVuLAogCXJldHVybiAwOwogfQogCi1zdGF0aWMgY29uc3QgY2hhciAq
ZHJtX25hbWVkX21vZGVzX3doaXRlbGlzdFtdID0geworc3RhdGljIGNvbnN0IGNoYXIgKiBjb25z
dCBkcm1fbmFtZWRfbW9kZXNfd2hpdGVsaXN0W10gPSB7CiAJIk5UU0MiLAogCSJQQUwiLAogfTsK
LS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 293D3E6FA3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 11:28:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E896E542;
	Mon, 28 Oct 2019 10:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD5F89CF6;
 Mon, 28 Oct 2019 10:28:12 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 03:28:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,239,1569308400"; d="scan'208";a="202473900"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 28 Oct 2019 03:28:10 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iP2Ft-000HOO-Gi; Mon, 28 Oct 2019 18:28:09 +0800
Date: Mon, 28 Oct 2019 18:27:24 +0800
From: kbuild test robot <lkp@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: [RFC PATCH drm-intel] drm/i915: r8712_construct_txaggr_cmd_desc()
 can be static
Message-ID: <20191028102723.wcqblpaboftl5yyy@4978f4969bb8>
References: <201910281549.EPB66ZeS%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201910281549.EPB66ZeS%lkp@intel.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: intel-gfx@lists.freedesktop.org, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkZpeGVzOiBkOWQ1NGE1MzBhNzAgKCJkcm0vaTkxNTogUHV0IGZ1dHVyZSBIVyBhbmQgdGhlaXIg
dUFQSXMgdW5kZXIgU1RBR0lORyAmIEJST0tFTiIpClNpZ25lZC1vZmYtYnk6IGtidWlsZCB0ZXN0
IHJvYm90IDxsa3BAaW50ZWwuY29tPgotLS0KIHJ0bDg3MTJfeG1pdC5jIHwgICAxMCArKysrKy0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ydGw4NzEyL3J0bDg3MTJfeG1pdC5jIGIvZHJpdmVy
cy9zdGFnaW5nL3J0bDg3MTIvcnRsODcxMl94bWl0LmMKaW5kZXggYzI0N2Y5MjIwN2Y1Yy4uZmVh
ZTUwYzE4Mzc4MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL3J0bDg3MTIvcnRsODcxMl94
bWl0LmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL3J0bDg3MTIvcnRsODcxMl94bWl0LmMKQEAgLTI0
Niw3ICsyNDYsNyBAQCB2b2lkIHI4NzEyX2RvX3F1ZXVlX3NlbGVjdChzdHJ1Y3QgX2FkYXB0ZXIg
KnBhZGFwdGVyLAogfQogCiAjaWZkZWYgQ09ORklHX1I4NzEyX1RYX0FHR1IKLXZvaWQgcjg3MTJf
Y29uc3RydWN0X3R4YWdncl9jbWRfZGVzYyhzdHJ1Y3QgeG1pdF9idWYgKnB4bWl0YnVmKQorc3Rh
dGljIHZvaWQgcjg3MTJfY29uc3RydWN0X3R4YWdncl9jbWRfZGVzYyhzdHJ1Y3QgeG1pdF9idWYg
KnB4bWl0YnVmKQogewogCXN0cnVjdCB0eF9kZXNjICpwdHhfZGVzYyA9IChzdHJ1Y3QgdHhfZGVz
YyAqKXB4bWl0YnVmLT5wYnVmOwogCkBAIC0yNjIsNyArMjYyLDcgQEAgdm9pZCByODcxMl9jb25z
dHJ1Y3RfdHhhZ2dyX2NtZF9kZXNjKHN0cnVjdCB4bWl0X2J1ZiAqcHhtaXRidWYpCiAJcHR4X2Rl
c2MtPnR4ZHcxIHw9IGNwdV90b19sZTMyKCgweDEzIDw8IFFTRUxfU0hUKSAmIDB4MDAwMDFmMDAp
OwogfQogCi12b2lkIHI4NzEyX2NvbnN0cnVjdF90eGFnZ3JfY21kX2hkcihzdHJ1Y3QgeG1pdF9i
dWYgKnB4bWl0YnVmKQorc3RhdGljIHZvaWQgcjg3MTJfY29uc3RydWN0X3R4YWdncl9jbWRfaGRy
KHN0cnVjdCB4bWl0X2J1ZiAqcHhtaXRidWYpCiB7CiAJc3RydWN0IHhtaXRfZnJhbWUgKnB4bWl0
ZnJhbWUgPSAoc3RydWN0IHhtaXRfZnJhbWUgKikKIAkJcHhtaXRidWYtPnByaXZfZGF0YTsKQEAg
LTI3OCw4ICsyNzgsOCBAQCB2b2lkIHI4NzEyX2NvbnN0cnVjdF90eGFnZ3JfY21kX2hkcihzdHJ1
Y3QgeG1pdF9idWYgKnB4bWl0YnVmKQogCXBjbWRwcml2LT5jbWRfc2VxKys7CiB9CiAKLXZvaWQg
cjg3MTJfYXBwZW5kX21wZHVfdW5pdChzdHJ1Y3QgeG1pdF9idWYgKnB4bWl0YnVmLAotCQkJICAg
IHN0cnVjdCB4bWl0X2ZyYW1lICpweG1pdGZyYW1lKQorc3RhdGljIHZvaWQgcjg3MTJfYXBwZW5k
X21wZHVfdW5pdChzdHJ1Y3QgeG1pdF9idWYgKnB4bWl0YnVmLAorCQkJCSAgIHN0cnVjdCB4bWl0
X2ZyYW1lICpweG1pdGZyYW1lKQogewogCXN0cnVjdCBfYWRhcHRlciAqcGFkYXB0ZXIgPSBweG1p
dGZyYW1lLT5wYWRhcHRlcjsKIAlzdHJ1Y3QgdHhfZGVzYyAqcHR4X2Rlc2MgPSAoc3RydWN0IHR4
X2Rlc2MgKilweG1pdGJ1Zi0+cGJ1ZjsKQEAgLTMzNCw3ICszMzQsNyBAQCB2b2lkIHI4NzEyX3ht
aXRmcmFtZV9hZ2dyXzFzdChzdHJ1Y3QgeG1pdF9idWYgKnB4bWl0YnVmLAogCXB4bWl0YnVmLT5h
Z2dyX25yID0gMTsKIH0KIAotdTE2IHI4NzEyX3htaXRmcmFtZV9hZ2dyX25leHQoc3RydWN0IHht
aXRfYnVmICpweG1pdGJ1ZiwKK3N0YXRpYyB1MTYgcjg3MTJfeG1pdGZyYW1lX2FnZ3JfbmV4dChz
dHJ1Y3QgeG1pdF9idWYgKnB4bWl0YnVmLAogCQkJc3RydWN0IHhtaXRfZnJhbWUgKnB4bWl0ZnJh
bWUpCiB7CiAJcHhtaXRmcmFtZS0+cHhtaXRidWYgPSBweG1pdGJ1ZjsKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5A410B366
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 17:33:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F4F6E359;
	Wed, 27 Nov 2019 16:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD766E359;
 Wed, 27 Nov 2019 16:33:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 08:33:23 -0800
X-IronPort-AV: E=Sophos;i="5.69,250,1571727600"; d="scan'208";a="206818597"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 08:33:20 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 08/13] video: fbdev: make fbops member of struct fb_info a
 const pointer
Date: Wed, 27 Nov 2019 18:32:04 +0200
Message-Id: <b0ff7235e8c941d6b9fcc28d5e49ceeb92d56828.1574871797.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1574871797.git.jani.nikula@intel.com>
References: <cover.1574871797.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93IHRoYXQgd2Ugbm8gbG9uZ2VyIG1vZGlmeSB0aGUgZmJvcHMsIG9yIGhvbGQgbm9uLWNvbnN0
IHBvaW50ZXJzIHRvCml0LCB3ZSBjYW4gbWFrZSBpdCBjb25zdC4gV2l0aCB0aGF0LCBhbHNvIGRl
ZmVycmVkX2lvX3ByaXZhdGUgbmVlZHMgdG8KYmUgY29uc3QuIEFmdGVyIHRoaXMsIHdlIGNhbiBz
dGFydCBtYWtpbmcgdGhlIGZib3BzIGNvbnN0IGFsbCBvdmVyIHRoZQpwbGFjZS4KCkNjOiBsaW51
eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmku
bmlrdWxhQGludGVsLmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4L2ZiLmggfCA0ICsrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9mYi5oIGIvaW5jbHVkZS9saW51eC9mYi5oCmluZGV4IDY1ZjJhYmQ0Nzc0
NS4uZWZjNTM3NmMyNDNhIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2ZiLmgKKysrIGIvaW5j
bHVkZS9saW51eC9mYi5oCkBAIC00NzAsMTAgKzQ3MCwxMCBAQCBzdHJ1Y3QgZmJfaW5mbyB7CiAj
aWZkZWYgQ09ORklHX0ZCX0RFRkVSUkVEX0lPCiAJc3RydWN0IGRlbGF5ZWRfd29yayBkZWZlcnJl
ZF93b3JrOwogCXN0cnVjdCBmYl9kZWZlcnJlZF9pbyAqZmJkZWZpbzsKLQl2b2lkICpkZWZlcnJl
ZF9pb19wcml2YXRlOworCWNvbnN0IHZvaWQgKmRlZmVycmVkX2lvX3ByaXZhdGU7CiAjZW5kaWYK
IAotCXN0cnVjdCBmYl9vcHMgKmZib3BzOworCWNvbnN0IHN0cnVjdCBmYl9vcHMgKmZib3BzOwog
CXN0cnVjdCBkZXZpY2UgKmRldmljZTsJCS8qIFRoaXMgaXMgdGhlIHBhcmVudCAqLwogCXN0cnVj
dCBkZXZpY2UgKmRldjsJCS8qIFRoaXMgaXMgdGhpcyBmYiBkZXZpY2UgKi8KIAlpbnQgY2xhc3Nf
ZmxhZzsgICAgICAgICAgICAgICAgICAgIC8qIHByaXZhdGUgc3lzZnMgZmxhZ3MgKi8KLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

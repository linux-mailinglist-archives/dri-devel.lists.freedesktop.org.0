Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 655B71102A6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 17:40:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC1A6EA09;
	Tue,  3 Dec 2019 16:40:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E476EA09;
 Tue,  3 Dec 2019 16:40:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 08:40:12 -0800
X-IronPort-AV: E=Sophos;i="5.69,273,1571727600"; d="scan'208";a="208533501"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 08:40:09 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v3 11/12] samples: vfio-mdev: constify fb ops
Date: Tue,  3 Dec 2019 18:38:53 +0200
Message-Id: <ddb10df1316ef585930cda7718643a580f4fe37b.1575390741.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1575390740.git.jani.nikula@intel.com>
References: <cover.1575390740.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, Kirti Wankhede <kwankhede@nvidia.com>,
 kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93IHRoYXQgdGhlIGZib3BzIG1lbWJlciBvZiBzdHJ1Y3QgZmJfaW5mbyBpcyBjb25zdCwgd2Ug
Y2FuIHN0YXJ0Cm1ha2luZyB0aGUgb3BzIGNvbnN0IGFzIHdlbGwuCgp2MjogZml4CXR5cG8gKENo
cmlzdG9waGUgZGUgRGluZWNoaW4pCgpDYzogS2lydGkgV2Fua2hlZGUgPGt3YW5raGVkZUBudmlk
aWEuY29tPgpDYzoga3ZtQHZnZXIua2VybmVsLm9yZwpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGph
bmkubmlrdWxhQGludGVsLmNvbT4KLS0tCiBzYW1wbGVzL3ZmaW8tbWRldi9tZHB5LWZiLmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9zYW1wbGVzL3ZmaW8tbWRldi9tZHB5LWZiLmMgYi9zYW1wbGVzL3ZmaW8tbWRldi9t
ZHB5LWZiLmMKaW5kZXggMjcxOWJiMjU5NjUzLi4yMWRiZjYzZDZlNDEgMTAwNjQ0Ci0tLSBhL3Nh
bXBsZXMvdmZpby1tZGV2L21kcHktZmIuYworKysgYi9zYW1wbGVzL3ZmaW8tbWRldi9tZHB5LWZi
LmMKQEAgLTg2LDcgKzg2LDcgQEAgc3RhdGljIHZvaWQgbWRweV9mYl9kZXN0cm95KHN0cnVjdCBm
Yl9pbmZvICppbmZvKQogCQlpb3VubWFwKGluZm8tPnNjcmVlbl9iYXNlKTsKIH0KIAotc3RhdGlj
IHN0cnVjdCBmYl9vcHMgbWRweV9mYl9vcHMgPSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IGZiX29w
cyBtZHB5X2ZiX29wcyA9IHsKIAkub3duZXIJCT0gVEhJU19NT0RVTEUsCiAJLmZiX2Rlc3Ryb3kJ
PSBtZHB5X2ZiX2Rlc3Ryb3ksCiAJLmZiX3NldGNvbHJlZwk9IG1kcHlfZmJfc2V0Y29scmVnLAot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

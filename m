Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE3E24B14D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 10:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD406E91E;
	Thu, 20 Aug 2020 08:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA69D6E91E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 08:50:50 +0000 (UTC)
IronPort-SDR: rXQN5wBOvPNcjXXvpLusUhItvgcwe4havmVTloA5GZc9bTchfNs1zkqn/NEnnJyMR0sN/SDnhv
 J/DTpGcDHUPA==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="154527054"
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; d="scan'208";a="154527054"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2020 01:50:49 -0700
IronPort-SDR: OyP0G+J/s8oJFsyXEmu6zYJr4SU+3QQUSP/0DYxya4UFlRrfdKIwWF7YZh/kGwEOd8xkgL8lNa
 lNjjfIAG1OOg==
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; d="scan'208";a="441898338"
Received: from amiszcza-desk-dev.igk.intel.com (HELO localhost)
 ([10.237.130.129])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2020 01:50:46 -0700
From: Adam Miszczak <adam.miszczak@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] intel: sync i915_pciids.h with kernel
Date: Thu, 20 Aug 2020 10:46:42 +0200
Message-Id: <20200820084642.26562-1-adam.miszczak@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIERHMSBhbmQgY2xlYW4tdXAgVkxWIFBDSSBJRHMuCgpBbGlnbiB3aXRoIGtlcm5lbCBjb21t
aXRzOgpmMmJkZTI1NDZiODEgKCJkcm0vaTkxNTogUmVtb3ZlIGR1YmlvdXMgVmFsbGV5dmlldyBQ
Q0kgSURzIikKZmQzOGNkYjgxMTA1ICgiZHJtL2k5MTUvZGcxOiBBZGQgREcxIFBDSSBJRHMiKQoK
U2lnbmVkLW9mZi1ieTogQWRhbSBNaXN6Y3phayA8YWRhbS5taXN6Y3pha0BsaW51eC5pbnRlbC5j
b20+CkNjOiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4KLS0t
CiBpbnRlbC9pOTE1X3BjaWlkcy5oIHwgOCArKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbnRlbC9pOTE1X3BjaWlk
cy5oIGIvaW50ZWwvaTkxNV9wY2lpZHMuaAppbmRleCBkNmNiMjg5OS4uOGU3YWUzMGUgMTAwNjQ0
Ci0tLSBhL2ludGVsL2k5MTVfcGNpaWRzLmgKKysrIGIvaW50ZWwvaTkxNV9wY2lpZHMuaApAQCAt
MjU4LDkgKzI1OCw3IEBACiAJSU5URUxfVkdBX0RFVklDRSgweDBmMzAsIGluZm8pLCBcCiAJSU5U
RUxfVkdBX0RFVklDRSgweDBmMzEsIGluZm8pLCBcCiAJSU5URUxfVkdBX0RFVklDRSgweDBmMzIs
IGluZm8pLCBcCi0JSU5URUxfVkdBX0RFVklDRSgweDBmMzMsIGluZm8pLCBcCi0JSU5URUxfVkdB
X0RFVklDRSgweDAxNTcsIGluZm8pLCBcCi0JSU5URUxfVkdBX0RFVklDRSgweDAxNTUsIGluZm8p
CisJSU5URUxfVkdBX0RFVklDRSgweDBmMzMsIGluZm8pCiAKICNkZWZpbmUgSU5URUxfQkRXX1VM
VF9HVDFfSURTKGluZm8pIFwKIAlJTlRFTF9WR0FfREVWSUNFKDB4MTYwNiwgaW5mbyksIC8qIEdU
MSBVTFQgKi8gXApAQCAtNjE4LDQgKzYxNiw4IEBACiAJSU5URUxfVkdBX0RFVklDRSgweDRDOTAs
IGluZm8pLCBcCiAJSU5URUxfVkdBX0RFVklDRSgweDRDOUEsIGluZm8pCiAKKy8qIERHMSAqLwor
I2RlZmluZSBJTlRFTF9ERzFfSURTKGluZm8pIFwKKwlJTlRFTF9WR0FfREVWSUNFKDB4NDkwNSwg
aW5mbykKKwogI2VuZGlmIC8qIF9JOTE1X1BDSUlEU19IICovCi0tIAoyLjI3LjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

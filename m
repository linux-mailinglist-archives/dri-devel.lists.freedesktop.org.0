Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C1C1C8C4B
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 15:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC0E6E9A0;
	Thu,  7 May 2020 13:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A276E98C;
 Thu,  7 May 2020 13:27:22 +0000 (UTC)
IronPort-SDR: PR+g4k1gmsQrfKmKVKWDzcYZNMd8TU0HWnrbcimKsdXIB8ZmSI5iMVlSvSN5BKnyiinaLvz3ot
 RLcujcAjCl+A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 06:27:22 -0700
IronPort-SDR: JOvgsRbJEqeP8wtJ8lTG1F3DVdrrlIADmY6/V/yOcy2MxC+hauAhNmr5WvnVbZOfdojjI6hgE1
 K338Jcr7FFjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,363,1583222400"; d="scan'208";a="260528025"
Received: from plaurent-mobl.ger.corp.intel.com (HELO
 helsinki.ger.corp.intel.com) ([10.251.84.89])
 by orsmga003.jf.intel.com with ESMTP; 07 May 2020 06:27:21 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v11 10/14] drm/i915: Fix enabled infoframe states of lspcon
Date: Thu,  7 May 2020 16:27:02 +0300
Message-Id: <20200507132706.2058969-11-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200507132706.2058969-1-gwan-gyeong.mun@intel.com>
References: <20200507132706.2058969-1-gwan-gyeong.mun@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29tcGFyZWQgdG8gaW1wbGVtZW50YXRpb24gb2YgRFAgYW5kIEhETUkncyBlbmNvZGVyLT5pbmZv
ZnJhbWVzX2VuYWJsZWQsCnRoZSBsc3Bjb24ncyBpbXBsZW1lbnRhdGlvbiByZXR1cm5zIGl0cyBh
Y3RpdmUgc3RhdGUuICh3ZSBleHBlY3QgZW5hYmxlZAppbmZvZnJhbWUgc3RhdGVzIG9mIEhXLikg
SXQgbGVhZHMgdG8gcGlwZSBzdGF0ZSBtaXNtYXRjaCBlcnJvcgp3aGVuIGRkaV9nZXRfY29uZmln
IGlzIGNhbGxlZC4KCkJlY2F1c2UgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgbHNwY29u
IGlzIG5vdCByZWFkeSB0byBzdXBwb3J0CnJlYWRvdXQgaW5mb2ZyYW1lcywgd2UgbmVlZCB0byBy
ZXR1cm4gMCBoZXJlLgoKSW4gb3JkZXIgdG8gc3VwcG9ydCByZWFkb3V0IHRvIGxzcGNvbiwgd2Ug
bmVlZCB0byBpbXBsZW1lbnQgcmVhZF9pbmZvZnJhbWUKYW5kIGluZm9mcmFtZXNfZW5hYmxlZC4g
QW5kIHNldF9pbmZvZnJhbWVzIGFsc28gaGF2ZSB0byBzZXQgYW4gYXBwcm9wcmlhdGUKYml0IG9u
IGNydGNfc3RhdGUtPmluZm9mcmFtZXMuZW5hYmxlCgpDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogR3dhbi1neWVvbmcgTXVu
IDxnd2FuLWd5ZW9uZy5tdW5AaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogVW1hIFNoYW5rYXIgPHVt
YS5zaGFua2FyQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2xzcGNvbi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9sc3Bjb24uYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHNwY29uLmMK
aW5kZXggZDgwN2M1NjQ4Yzg3Li42ZmY3YjIyNmYwYTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHNwY29uLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9sc3Bjb24uYwpAQCAtNTIyLDcgKzUyMiw3IEBAIHUzMiBsc3Bjb25f
aW5mb2ZyYW1lc19lbmFibGVkKHN0cnVjdCBpbnRlbF9lbmNvZGVyICplbmNvZGVyLAogCQkJICAg
ICAgY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKnBpcGVfY29uZmlnKQogewogCS8qIEZJ
WE1FIGFjdHVhbGx5IHJlYWQgdGhpcyBmcm9tIHRoZSBodyAqLwotCXJldHVybiBlbmNfdG9faW50
ZWxfbHNwY29uKGVuY29kZXIpLT5hY3RpdmU7CisJcmV0dXJuIDA7CiB9CiAKIHZvaWQgbHNwY29u
X3Jlc3VtZShzdHJ1Y3QgaW50ZWxfbHNwY29uICpsc3Bjb24pCi0tIAoyLjI1LjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

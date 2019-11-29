Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A59C10D42B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 11:31:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A433C6E8CB;
	Fri, 29 Nov 2019 10:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2726E8CB;
 Fri, 29 Nov 2019 10:31:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 02:31:29 -0800
X-IronPort-AV: E=Sophos;i="5.69,257,1571727600"; d="scan'208";a="241001454"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 02:31:26 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v2 14/14] auxdisplay: constify fb ops
Date: Fri, 29 Nov 2019 12:29:44 +0200
Message-Id: <94a33cf0a587e803bcadcf80e8152eac9b196f34.1575022735.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1575022735.git.jani.nikula@intel.com>
References: <cover.1575022735.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com,
 Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>,
 intel-gfx@lists.freedesktop.org, Robin van der Gracht <robin@protonic.nl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93IHRoYXQgdGhlIGZib3BzIG1lbWJlciBvZiBzdHJ1Y3QgZmJfaW5mbyBpcyBjb25zdCwgd2Ug
Y2FuIHN0YXJ0Cm1ha2luZyB0aGUgb3BzIGNvbnN0IGFzIHdlbGwuCgpDYzogTWlndWVsIE9qZWRh
IFNhbmRvbmlzIDxtaWd1ZWwub2plZGEuc2FuZG9uaXNAZ21haWwuY29tPgpDYzogUm9iaW4gdmFu
IGRlciBHcmFjaHQgPHJvYmluQHByb3RvbmljLm5sPgpTaWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3Vs
YSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvYXV4ZGlzcGxheS9jZmFnMTI4
NjRiZmIuYyB8IDIgKy0KIGRyaXZlcnMvYXV4ZGlzcGxheS9odDE2azMzLmMgICAgICB8IDIgKy0K
IDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvYXV4ZGlzcGxheS9jZmFnMTI4NjRiZmIuYyBiL2RyaXZlcnMvYXV4ZGlz
cGxheS9jZmFnMTI4NjRiZmIuYwppbmRleCA0MDc0ODg2YjdiYzguLjIwMDIyOTFhYjMzOCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9hdXhkaXNwbGF5L2NmYWcxMjg2NGJmYi5jCisrKyBiL2RyaXZlcnMv
YXV4ZGlzcGxheS9jZmFnMTI4NjRiZmIuYwpAQCAtNTcsNyArNTcsNyBAQCBzdGF0aWMgaW50IGNm
YWcxMjg2NGJmYl9tbWFwKHN0cnVjdCBmYl9pbmZvICppbmZvLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKnZtYSkKIAlyZXR1cm4gdm1fbWFwX3BhZ2VzX3plcm8odm1hLCAmcGFnZXMsIDEpOwogfQog
Ci1zdGF0aWMgc3RydWN0IGZiX29wcyBjZmFnMTI4NjRiZmJfb3BzID0geworc3RhdGljIGNvbnN0
IHN0cnVjdCBmYl9vcHMgY2ZhZzEyODY0YmZiX29wcyA9IHsKIAkub3duZXIgPSBUSElTX01PRFVM
RSwKIAkuZmJfcmVhZCA9IGZiX3N5c19yZWFkLAogCS5mYl93cml0ZSA9IGZiX3N5c193cml0ZSwK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvYXV4ZGlzcGxheS9odDE2azMzLmMgYi9kcml2ZXJzL2F1eGRp
c3BsYXkvaHQxNmszMy5jCmluZGV4IGEyZmNkZTU4MmUyYS4uZDk1MWQ1NGIyNmY1IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2F1eGRpc3BsYXkvaHQxNmszMy5jCisrKyBiL2RyaXZlcnMvYXV4ZGlzcGxh
eS9odDE2azMzLmMKQEAgLTIyOCw3ICsyMjgsNyBAQCBzdGF0aWMgaW50IGh0MTZrMzNfbW1hcChz
dHJ1Y3QgZmJfaW5mbyAqaW5mbywgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiAJcmV0dXJu
IHZtX21hcF9wYWdlc196ZXJvKHZtYSwgJnBhZ2VzLCAxKTsKIH0KIAotc3RhdGljIHN0cnVjdCBm
Yl9vcHMgaHQxNmszM19mYl9vcHMgPSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IGZiX29wcyBodDE2
azMzX2ZiX29wcyA9IHsKIAkub3duZXIgPSBUSElTX01PRFVMRSwKIAkuZmJfcmVhZCA9IGZiX3N5
c19yZWFkLAogCS5mYl93cml0ZSA9IGZiX3N5c193cml0ZSwKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

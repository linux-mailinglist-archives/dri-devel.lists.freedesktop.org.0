Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A3CB7A7A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 15:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522DF6F729;
	Thu, 19 Sep 2019 13:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE04E6F729;
 Thu, 19 Sep 2019 13:28:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Sep 2019 06:28:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,523,1559545200"; d="scan'208";a="199392042"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 19 Sep 2019 06:28:54 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 19 Sep 2019 16:28:53 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] video/hdmi: Fix AVI bar unpack
Date: Thu, 19 Sep 2019 16:28:53 +0300
Message-Id: <20190919132853.30954-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
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
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>,
 intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 Hans Verkuil <hans.verkuil@cisco.com>, Martin Bugge <marbugge@cisco.com>,
 Thierry Reding <treding@nvidia.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZSBiYXIgdmFsdWVzIGFyZSBsaXR0bGUgZW5kaWFuLCBub3QgYmlnIGVuZGlhbi4gVGhlIHBhY2sK
ZnVuY3Rpb24gZGlkIGl0IHJpZ2h0IGJ1dCB0aGUgdW5wYWNrIGdvdCBpdCB3cm9uZy4gRml4IGl0
LgoKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVs
Lm9yZwpDYzogTWFydGluIEJ1Z2dlIDxtYXJidWdnZUBjaXNjby5jb20+CkNjOiBIYW5zIFZlcmt1
aWwgPGhhbnMudmVya3VpbEBjaXNjby5jb20+CkNjOiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0Bu
dmlkaWEuY29tPgpDYzogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiQG9zZy5zYW1zdW5n
LmNvbT4KRml4ZXM6IDJjNjc2ZjM3OGVkYiAoIlttZWRpYV0gaGRtaTogYWRkZWQgdW5wYWNrIGFu
ZCBsb2dnaW5nIGZ1bmN0aW9ucyBmb3IgSW5mb0ZyYW1lcyIpClNpZ25lZC1vZmYtYnk6IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy92
aWRlby9oZG1pLmMgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vaGRtaS5jIGIvZHJp
dmVycy92aWRlby9oZG1pLmMKaW5kZXggYjkzOWJjMjhkODg2Li45YzgyZTJhMGE0MTEgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvdmlkZW8vaGRtaS5jCisrKyBiL2RyaXZlcnMvdmlkZW8vaGRtaS5jCkBA
IC0xNTc2LDEyICsxNTc2LDEyIEBAIHN0YXRpYyBpbnQgaGRtaV9hdmlfaW5mb2ZyYW1lX3VucGFj
ayhzdHJ1Y3QgaGRtaV9hdmlfaW5mb2ZyYW1lICpmcmFtZSwKIAlpZiAocHRyWzBdICYgMHgxMCkK
IAkJZnJhbWUtPmFjdGl2ZV9hc3BlY3QgPSBwdHJbMV0gJiAweGY7CiAJaWYgKHB0clswXSAmIDB4
OCkgewotCQlmcmFtZS0+dG9wX2JhciA9IChwdHJbNV0gPDwgOCkgKyBwdHJbNl07Ci0JCWZyYW1l
LT5ib3R0b21fYmFyID0gKHB0cls3XSA8PCA4KSArIHB0cls4XTsKKwkJZnJhbWUtPnRvcF9iYXIg
PSAocHRyWzZdIDw8IDgpIHwgcHRyWzVdOworCQlmcmFtZS0+Ym90dG9tX2JhciA9IChwdHJbOF0g
PDwgOCkgfCBwdHJbN107CiAJfQogCWlmIChwdHJbMF0gJiAweDQpIHsKLQkJZnJhbWUtPmxlZnRf
YmFyID0gKHB0cls5XSA8PCA4KSArIHB0clsxMF07Ci0JCWZyYW1lLT5yaWdodF9iYXIgPSAocHRy
WzExXSA8PCA4KSArIHB0clsxMl07CisJCWZyYW1lLT5sZWZ0X2JhciA9IChwdHJbMTBdIDw8IDgp
IHwgcHRyWzldOworCQlmcmFtZS0+cmlnaHRfYmFyID0gKHB0clsxMl0gPDwgOCkgfCBwdHJbMTFd
OwogCX0KIAlmcmFtZS0+c2Nhbl9tb2RlID0gcHRyWzBdICYgMHgzOwogCi0tIAoyLjIxLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

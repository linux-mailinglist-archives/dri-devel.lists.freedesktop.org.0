Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8158ED2A89
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 15:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32CD16EB2D;
	Thu, 10 Oct 2019 13:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9BF6EB2D
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 13:12:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Oct 2019 06:12:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,280,1566889200"; d="scan'208";a="206091456"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 10 Oct 2019 06:12:07 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Oct 2019 16:12:06 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/atmel-hlcdc: Use swap() where appropriate
Date: Thu, 10 Oct 2019 16:11:59 +0300
Message-Id: <20191010131159.17346-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191010131159.17346-1-ville.syrjala@linux.intel.com>
References: <20191010131159.17346-1-ville.syrjala@linux.intel.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkBz
d2FwQAppZGVudGlmaWVyIFRFTVA7CmV4cHJlc3Npb24gQSxCOwpAQAotIFRFTVAgPSBBOwotIEEg
PSBCOwotIEIgPSBURU1QOworIHN3YXAoQSwgQik7CgpAQAp0eXBlIFQ7CmlkZW50aWZpZXIgc3dh
cC5URU1QOwpAQAooCi0gVCBURU1QOwp8Ci0gVCBURU1QID0gey4uLn07CikKLi4uIHdoZW4gIT0g
VEVNUAoKQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IEJvcmlzIEJyZXpp
bGxvbiA8YmJyZXppbGxvbkBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rs
w6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
dG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFuZS5jIHwgNSArLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL2F0
bWVsLWhsY2RjL2F0bWVsX2hsY2RjX3BsYW5lLmMKaW5kZXggODlmNWE3NTZmYTM3Li4wMzRmMjAy
ZGZlOGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNk
Y19wbGFuZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19w
bGFuZS5jCkBAIC02MDEsNyArNjAxLDYgQEAgc3RhdGljIGludCBhdG1lbF9obGNkY19wbGFuZV9h
dG9taWNfY2hlY2soc3RydWN0IGRybV9wbGFuZSAqcCwKIAlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVy
ICpmYiA9IHN0YXRlLT5iYXNlLmZiOwogCWNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpt
b2RlOwogCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZTsKLQl1bnNpZ25lZCBpbnQg
dG1wOwogCWludCByZXQ7CiAJaW50IGk7CiAKQEAgLTY5NCw5ICs2OTMsNyBAQCBzdGF0aWMgaW50
IGF0bWVsX2hsY2RjX3BsYW5lX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX3BsYW5lICpwLAogCSAq
IFN3YXAgd2lkdGggYW5kIHNpemUgaW4gY2FzZSBvZiA5MCBvciAyNzAgZGVncmVlcyByb3RhdGlv
bgogCSAqLwogCWlmIChkcm1fcm90YXRpb25fOTBfb3JfMjcwKHN0YXRlLT5iYXNlLnJvdGF0aW9u
KSkgewotCQl0bXAgPSBzdGF0ZS0+c3JjX3c7Ci0JCXN0YXRlLT5zcmNfdyA9IHN0YXRlLT5zcmNf
aDsKLQkJc3RhdGUtPnNyY19oID0gdG1wOworCQlzd2FwKHN0YXRlLT5zcmNfdywgc3RhdGUtPnNy
Y19oKTsKIAl9CiAKIAlpZiAoIWRlc2MtPmxheW91dC5zaXplICYmCi0tIAoyLjIxLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7478D1737E
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 10:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4BD89686;
	Wed,  8 May 2019 08:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279CB8967B;
 Wed,  8 May 2019 08:18:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 May 2019 01:18:02 -0700
X-ExtLoop1: 1
Received: from helsinki.fi.intel.com ([10.237.66.174])
 by fmsmga001.fm.intel.com with ESMTP; 08 May 2019 01:18:01 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 2/6] drm: Add a VSC structure for handling Pixel
 Encoding/Colorimetry Formats
Date: Wed,  8 May 2019 11:17:53 +0300
Message-Id: <20190508081757.28042-3-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190508081757.28042-1-gwan-gyeong.mun@intel.com>
References: <20190508081757.28042-1-gwan-gyeong.mun@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U0RQIFZTQyBIZWFkZXIgYW5kIERhdGEgQmxvY2sgZm9sbG93IERQIDEuNGEgc3BlYywgc2VjdGlv
biAyLjIuNS43LjUsCmNoYXB0ZXIgIlZTQyBTRFAgUGF5bG9hZCBmb3IgUGl4ZWwgRW5jb2Rpbmcv
Q29sb3JpbWV0cnkgRm9ybWF0Ii4KClNpZ25lZC1vZmYtYnk6IEd3YW4tZ3llb25nIE11biA8Z3dh
bi1neWVvbmcubXVuQGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxt
YWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Ci0tLQogaW5jbHVkZS9kcm0vZHJtX2Rw
X2hlbHBlci5oIHwgMTcgKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIGIvaW5j
bHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCmluZGV4IDk3Y2U3OTBhNWI1YS4uMzc5M2JlYTdiN2Zl
IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKKysrIGIvaW5jbHVkZS9k
cm0vZHJtX2RwX2hlbHBlci5oCkBAIC0xMDk2LDYgKzEwOTYsMjMgQEAgc3RydWN0IGVkcF92c2Nf
cHNyIHsKIAl1OCBEQjhfMzFbMjRdOyAvKiBSZXNlcnZlZCAqLwogfSBfX3BhY2tlZDsKIAorc3Ry
dWN0IGRwX3ZzY19zZHAgeworCXN0cnVjdCBkcF9zZHBfaGVhZGVyIHNkcF9oZWFkZXI7CisJdTgg
REIwOyAvKiBTdGVyZW8gSW50ZXJmYWNlICovCisJdTggREIxOyAvKiAwIC0gUFNSIFN0YXRlOyAx
IC0gVXBkYXRlIFJGQjsgMiAtIENSQyBWYWxpZCAqLworCXU4IERCMjsgLyogQ1JDIHZhbHVlIGJp
dHMgNzowIG9mIHRoZSBSIG9yIENyIGNvbXBvbmVudCAqLworCXU4IERCMzsgLyogQ1JDIHZhbHVl
IGJpdHMgMTU6OCBvZiB0aGUgUiBvciBDciBjb21wb25lbnQgKi8KKwl1OCBEQjQ7IC8qIENSQyB2
YWx1ZSBiaXRzIDc6MCBvZiB0aGUgRyBvciBZIGNvbXBvbmVudCAqLworCXU4IERCNTsgLyogQ1JD
IHZhbHVlIGJpdHMgMTU6OCBvZiB0aGUgRyBvciBZIGNvbXBvbmVudCAqLworCXU4IERCNjsgLyog
Q1JDIHZhbHVlIGJpdHMgNzowIG9mIHRoZSBCIG9yIENiIGNvbXBvbmVudCAqLworCXU4IERCNzsg
LyogQ1JDIHZhbHVlIGJpdHMgMTU6OCBvZiB0aGUgQiBvciBDYiBjb21wb25lbnQgKi8KKwl1OCBE
QjhfMTVbOF07ICAvKiBSZXNlcnZlZCAqLworCXU4IERCMTY7IC8qIFBpeGVsIEVuY29kaW5nIGFu
ZCBDb2xvcmltZXRyeSBGb3JtYXRzICovCisJdTggREIxNzsgLyogRHluYW1pYyBSYW5nZSBhbmQg
Q29tcG9uZW50IEJpdCBEZXB0aCAqLworCXU4IERCMTg7IC8qIENvbnRlbnQgVHlwZSAqLworCXU4
IERCMTlfMzFbMTNdOyAvKiBSZXNlcnZlZCAqLworfSBfX3BhY2tlZDsKKwogI2RlZmluZSBFRFBf
VlNDX1BTUl9TVEFURV9BQ1RJVkUJKDE8PDApCiAjZGVmaW5lIEVEUF9WU0NfUFNSX1VQREFURV9S
RkIJCSgxPDwxKQogI2RlZmluZSBFRFBfVlNDX1BTUl9DUkNfVkFMVUVTX1ZBTElECSgxPDwyKQot
LSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F5E4D051
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 16:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE6F6E59B;
	Thu, 20 Jun 2019 14:26:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E5D6E58B;
 Thu, 20 Jun 2019 14:26:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jun 2019 07:26:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,397,1557212400"; d="scan'208";a="165335646"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 20 Jun 2019 07:26:40 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 20 Jun 2019 17:26:39 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] drm: Aspect ratio fixes
Date: Thu, 20 Jun 2019 17:26:34 +0300
Message-Id: <20190620142639.17518-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkls
aWEgcG9pbnRlZCBvdXQgc29tZSBvZGRiYWxsIGNyYXAgaW4gdGhlIGk5MTUgYXNwZWN0IHJhdGlv
IGhhbmRsaW5nLgpXaGlsZSBsb29raW5nIGF0IHRoYXQgSSBub3RpY2VkIGEgYnVuY2ggb2YgZmFp
bCBpbiB0aGUgY29yZSBhcyB3ZWxsLgpUaGlzIHNlcmllcyBhaW1zIHRvIGZpeCBpdCBhbGwuCgpD
YzogSWxpYSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQuZWR1PgoKVmlsbGUgU3lyasOkbMOkICg1
KToKICBkcm06IERvIG5vdCB1c2UgYml0d2lzZSBPUiB0byBzZXQgcGljdXJlX2FzcGVjdF9yYXRp
bwogIGRybTogRG8gbm90IGFjY2VwdCBnYXJiYWdlIG1vZGUgYXNwZWN0IHJhdGlvIGZsYWdzCiAg
ZHJtOiBXQVJOIG9uIGlsbGVnYWwgYXNwZWN0IHJhdGlvIHdoZW4gY29udmVydGluZyBhIG1vZGUg
dG8gdW1vZGUKICBkcm0vaTkxNTogRG8gbm90IG92ZXJyaWRlIG1vZGUncyBhc3BlY3QgcmF0aW8g
d2l0aCB0aGUgcHJvcCB2YWx1ZSBOT05FCiAgZHJtL2k5MTU6IERyb3AgcmVkdW5kYW50IGFzcGVj
IHJhdGlvIHByb3AgdmFsdWUgaW5pdGlhbGl6YXRpb24KCiBkcml2ZXJzL2dwdS9kcm0vZHJtX21v
ZGVzLmMgICAgICAgICAgICAgICB8IDE3ICsrKysrKysrKysrLS0tLS0tCiBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYyB8ICA1ICsrLS0tCiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX3Nkdm8uYyB8ICA0ICstLS0KIDMgZmlsZXMgY2hhbmdlZCwgMTQg
aW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgotLSAKMi4yMS4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EDDBDF7D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 15:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB8C6EBB5;
	Wed, 25 Sep 2019 13:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E586C6EBB5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 13:55:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 06:55:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,548,1559545200"; d="scan'208";a="272971373"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 25 Sep 2019 06:55:03 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 25 Sep 2019 16:55:02 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/4] drm/edid: Add new modes from CTA-861-G
Date: Wed, 25 Sep 2019 16:54:58 +0300
Message-Id: <20190925135502.24055-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfc@freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClJl
bWFpbmRlciBvZiB0aGUgbmV3IENUQS04NjEtRyBtb2Rlcy4gSSBhbHJlYWR5IHB1c2hlZCB0aGUg
Zmlyc3QgcGF0Y2gKYWRkaW5nIHRoZSBtb2RlcyB3aXRoIFZJQzwxMjguIEkgZGlkIGltcHJvdmUg
dGhlIEJVSUxEX0JVR19PTigpcyBpbiB0aGUKbGFzdCBwYXRjaCBhIGJpdCB0byBtYWtlIGl0IGVh
c2llciB0byB2aXN1YWxseSBkb3VibGUgY2hlY2sgdGhlIG51bWJlcnMKYWdhaW5zdCBWSUMgY29t
bWVudHMgaW4gdGhlIG1vZGUgYXJyYXlzLgoKVmlsbGUgU3lyasOkbMOkICg0KToKICBkcm0vZWRp
ZDogQWJzdHJhY3QgYXdheSBjZWFfZWRpZF9tb2Rlc1tdCiAgZHJtL2VkaWQ6IEFkZCBDVEEtODYx
LUcgbW9kZXMgd2l0aCBWSUMgPj0gMTkzCiAgZHJtL2VkaWQ6IFRocm93IGF3YXkgdGhlIGR1bW15
IFZJQyAwIGNlYSBtb2RlCiAgZHJtL2VkaWQ6IE1ha2Ugc3VyZSB0aGUgQ0VBIG1vZGUgYXJyYXlz
IGhhdmUgdGhlIGNvcnJlY3QgYW1vdW50IG9mCiAgICBtb2RlcwoKIGRyaXZlcnMvZ3B1L2RybS9k
cm1fZWRpZC5jIHwgMjMwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyMDYgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCgotLSAKMi4y
MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

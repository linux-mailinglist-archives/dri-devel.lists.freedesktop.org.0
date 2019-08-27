Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D03D49E61D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 12:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0467589A74;
	Tue, 27 Aug 2019 10:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A268C89A74;
 Tue, 27 Aug 2019 10:50:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 03:50:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,436,1559545200"; d="scan'208";a="182743927"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.154])
 by orsmga003.jf.intel.com with ESMTP; 27 Aug 2019 03:50:57 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v10 3/6] drm: Extend I915 mei interface for transcoder info
Date: Tue, 27 Aug 2019 16:20:11 +0530
Message-Id: <20190827105014.14181-4-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190827105014.14181-1-ramalingam.c@intel.com>
References: <20190827105014.14181-1-ramalingam.c@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, tomas.winkler@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

STkxNSBuZWVkcyB0byBzZW5kIHRoZSBpbmRleCBvZiB0aGUgdHJhbnNjb2RlciBhcyBwZXIgTUUg
RlcuCgpUbyBzdXBwb3J0IHRoaXMsIGRlZmluZSBlbnVtIG1laV9md190YyBhbmQgYWRkIGFzIGEg
bWVtYmVyIGludG8KdGhlIHN0cnVjdCBoZGNwX3BvcnRfZGF0YS4KCnYyOgogIFR5cG8gaW4gY29t
bWl0IG1zZyBpcyBmaXhlZCBbU2hhc2hhbmtdCgpTaWduZWQtb2ZmLWJ5OiBSYW1hbGluZ2FtIEMg
PHJhbWFsaW5nYW0uY0BpbnRlbC5jb20+CkFja2VkLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1
bGFAaW50ZWwuY29tPgotLS0KIGluY2x1ZGUvZHJtL2k5MTVfbWVpX2hkY3BfaW50ZXJmYWNlLmgg
fCAxMyArKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2k5MTVfbWVpX2hkY3BfaW50ZXJmYWNlLmggYi9pbmNsdWRl
L2RybS9pOTE1X21laV9oZGNwX2ludGVyZmFjZS5oCmluZGV4IGE5N2FjZjFjOTcxMC4uMGRlNjI5
YmYyZjYyIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9pOTE1X21laV9oZGNwX2ludGVyZmFjZS5o
CisrKyBiL2luY2x1ZGUvZHJtL2k5MTVfbWVpX2hkY3BfaW50ZXJmYWNlLmgKQEAgLTU0LDkgKzU0
LDIxIEBAIGVudW0gbWVpX2Z3X2RkaSB7CiAJTUVJX0RESV9SQU5HRV9FTkQgPSBNRUlfRERJX0Es
CiB9OwogCitlbnVtIG1laV9md190YyB7CisJTUVJX0lOVkFMSURfVFJBTlNDT0RFUiA9IDB4MDAs
CS8qIEludmFsaWQgdHJhbnNjb2RlciB0eXBlICovCisJTUVJX1RDX0VEUCwJCQkvKiBUcmFuc2Nv
ZGVyIGZvciBlRFAgKi8KKwlNRUlfVENfRFNJMCwJCQkvKiBUcmFuc2NvZGVyIGZvciBEU0kwICov
CisJTUVJX1RDX0RTSTEsCQkJLyogVHJhbnNjb2RlciBmb3IgRFNJMSAqLworCU1FSV9UQ19BID0g
MHgxMCwJCS8qIFRyYW5zY29kZXIgVENBICovCisJTUVJX1RDX0IsCQkJLyogVHJhbnNjb2RlciBU
Q0IgKi8KKwlNRUlfVENfQywJCQkvKiBUcmFuc2NvZGVyIFRDQyAqLworCU1FSV9UQ19ECQkJLyog
VHJhbnNjb2RlciBUQ0QgKi8KK307CisKIC8qKgogICogc3RydWN0IGhkY3BfcG9ydF9kYXRhIC0g
aW50ZWwgc3BlY2lmaWMgSERDUCBwb3J0IGRhdGEKICAqIEBmd19kZGk6IGRkaSBpbmRleCBhcyBw
ZXIgTUUgRlcKKyAqIEBmd190YzogdHJhbnNjb2RlciBpbmRleCBhcyBwZXIgTUUgRlcKICAqIEBw
b3J0X3R5cGU6IEhEQ1AgcG9ydCB0eXBlIGFzIHBlciBNRSBGVyBjbGFzc2lmaWNhdGlvbgogICog
QHByb3RvY29sOiBIRENQIGFkYXB0YXRpb24gYXMgcGVyIE1FIEZXCiAgKiBAazogTm8gb2Ygc3Ry
ZWFtcyB0cmFuc21pdHRlZCBvbiBhIHBvcnQuIE9ubHkgb24gRFAgTVNUIHRoaXMgaXMgIT0gMQpA
QCAtNjksNiArODEsNyBAQCBlbnVtIG1laV9md19kZGkgewogICovCiBzdHJ1Y3QgaGRjcF9wb3J0
X2RhdGEgewogCWVudW0gbWVpX2Z3X2RkaSBmd19kZGk7CisJZW51bSBtZWlfZndfdGMgZndfdGM7
CiAJdTggcG9ydF90eXBlOwogCXU4IHByb3RvY29sOwogCXUxNiBrOwotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

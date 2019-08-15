Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8A08E7D1
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 11:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AAD46E957;
	Thu, 15 Aug 2019 09:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF9A6E957;
 Thu, 15 Aug 2019 09:08:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Aug 2019 02:08:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,388,1559545200"; d="scan'208";a="194728760"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2019 02:08:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, =?utf-8?Q?Jos=C3=A9?= Roberto
 de Souza <jose.souza@intel.com>
Subject: Re: [PATCH] drm/i915/tgl: Fix TGL_TRANS_DDI_FUNC_CTL_VAL_TO_PORT()
 macro
In-Reply-To: <20190815083336.GE27238@mwanda>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190815083336.GE27238@mwanda>
Date: Thu, 15 Aug 2019 12:08:53 +0300
Message-ID: <87lfvug5i2.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxNSBBdWcgMjAxOSwgRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUu
Y29tPiB3cm90ZToKPiBUaGlzIG1hY3JvIGRvZXNuJ3Qgd29yayBiZWNhdXNlIHRoZSByaWdodCBz
aGlmdCBoYXMgaGlnaGVyIHByZWNlZGVuY2UKPiB0aGFuIGJpdHdpc2UgQU5ELgo+Cj4gRml4ZXM6
IDk3NDlhNWI2YzA5ZiAoImRybS9pOTE1L3RnbDogRml4IHRoZSByZWFkIG9mIHRoZSBEREkgdGhh
dCB0cmFuc2NvZGVyIGlzIGF0dGFjaGVkIHRvIikKPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVu
dGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+CgpUaGFua3MsIGFscmVhZHkgZml4ZWQgYnkg
MWNkZDg3MDVjN2FjICgiZHJtL2k5MTUvdGdsOiBGaXggbWlzc2luZwpwYXJlbnRoZXNlcyBvbiBU
R0xfVFJBTlNfRERJX0ZVTkNfQ1RMX1ZBTF9UT19QT1JUIikuCgpCUiwKSmFuaS4KCj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmggfCAyICstCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTVfcmVnLmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5o
Cj4gaW5kZXggNGE5NDdiZDBhMjk0Li5kZWY2ZGJkYzdlMmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5
MTVfcmVnLmgKPiBAQCAtOTQzMyw3ICs5NDMzLDcgQEAgZW51bSBza2xfcG93ZXJfZ2F0ZSB7Cj4g
ICNkZWZpbmUgIFRSQU5TX0RESV9TRUxFQ1RfUE9SVCh4KQkoKHgpIDw8IFRSQU5TX0RESV9QT1JU
X1NISUZUKQo+ICAjZGVmaW5lICBUR0xfVFJBTlNfRERJX1NFTEVDVF9QT1JUKHgpCSgoKHgpICsg
MSkgPDwgVEdMX1RSQU5TX0RESV9QT1JUX1NISUZUKQo+ICAjZGVmaW5lICBUUkFOU19ERElfRlVO
Q19DVExfVkFMX1RPX1BPUlQodmFsKQkgKCgodmFsKSAmIFRSQU5TX0RESV9QT1JUX01BU0spID4+
IFRSQU5TX0RESV9QT1JUX1NISUZUKQo+IC0jZGVmaW5lICBUR0xfVFJBTlNfRERJX0ZVTkNfQ1RM
X1ZBTF9UT19QT1JUKHZhbCkgKCgodmFsKSAmIFRHTF9UUkFOU19ERElfUE9SVF9NQVNLID4+IFRH
TF9UUkFOU19ERElfUE9SVF9TSElGVCkgLSAxKQo+ICsjZGVmaW5lICBUR0xfVFJBTlNfRERJX0ZV
TkNfQ1RMX1ZBTF9UT19QT1JUKHZhbCkgKCgoKHZhbCkgJiBUR0xfVFJBTlNfRERJX1BPUlRfTUFT
SykgPj4gVEdMX1RSQU5TX0RESV9QT1JUX1NISUZUKSAtIDEpCj4gICNkZWZpbmUgIFRSQU5TX0RE
SV9NT0RFX1NFTEVDVF9NQVNLCSg3IDw8IDI0KQo+ICAjZGVmaW5lICBUUkFOU19ERElfTU9ERV9T
RUxFQ1RfSERNSQkoMCA8PCAyNCkKPiAgI2RlZmluZSAgVFJBTlNfRERJX01PREVfU0VMRUNUX0RW
SQkoMSA8PCAyNCkKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3Mg
Q2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

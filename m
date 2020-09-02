Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D2F25AC0A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 15:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847BC6E4C9;
	Wed,  2 Sep 2020 13:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924536E4C9;
 Wed,  2 Sep 2020 13:28:52 +0000 (UTC)
IronPort-SDR: SLYqbbwyLs5xu8DzKOWXccTU66fr4IDpOm4JxxQQtPxmhluqu5skXcLEfauRVI46RFCrPt5nIm
 y65eM38WyWDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="242204312"
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="242204312"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 06:28:51 -0700
IronPort-SDR: U8YB8TVAI0STjSnJnEvgTYCzaJilVODd0XWR6ySmyqecMx1sVxnxsavnyXBDXzXS5zkGmz9wLs
 1gDcOw1pBL7A==
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="477639573"
Received: from kbs1-mobl1.gar.corp.intel.com (HELO [10.215.142.42])
 ([10.215.142.42])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 06:28:47 -0700
Subject: Re: [PATCH v6 2/7] drm/i915: Add support for async flips in I915
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20200807093551.10673-1-karthik.b.s@intel.com>
 <20200807093551.10673-3-karthik.b.s@intel.com>
 <20200901111524.GG6112@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <b4211a53-02cc-bf62-1e47-651323af55cc@intel.com>
Date: Wed, 2 Sep 2020 18:58:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200901111524.GG6112@intel.com>
Content-Language: en-US
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
Cc: paulo.r.zanoni@intel.com, michel@daenzer.net,
 dri-devel@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 vandita.kulkarni@intel.com, uma.shankar@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA5LzEvMjAyMCA0OjQ1IFBNLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gT24gRnJpLCBB
dWcgMDcsIDIwMjAgYXQgMDM6MDU6NDZQTSArMDUzMCwgS2FydGhpayBCIFMgd3JvdGU6Cj4+IFNl
dCB0aGUgQXN5bmMgQWRkcmVzcyBVcGRhdGUgRW5hYmxlIGJpdCBpbiBwbGFuZSBjdGwKPj4gd2hl
biBhc3luYyBmbGlwIGlzIHJlcXVlc3RlZC4KPj4KPj4gdjI6IC1Nb3ZlIHRoZSBBc3luYyBmbGlw
IGVuYWJsZW1lbnQgdG8gaW5kaXZpZHVhbCBwYXRjaCAoUGF1bG8pCj4+Cj4+IHYzOiAtUmViYXNl
ZC4KPj4KPj4gdjQ6IC1BZGQgc2VwYXJhdGUgcGxhbmUgaG9vayBmb3IgYXN5bmMgZmxpcCBjYXNl
IChWaWxsZSkKPj4KPj4gdjU6IC1SZWJhc2VkLgo+Pgo+PiB2NjogLU1vdmUgdGhlIHBsYW5lIGhv
b2sgdG8gc2VwYXJhdGUgcGF0Y2guIChQYXVsbykKPj4gICAgICAtUmVtb3ZlIHRoZSBlYXJseSBy
ZXR1cm4gaW4gc2tsX3BsYW5lX2N0bC4gKFBhdWxvKQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBLYXJ0
aGlrIEIgUyA8a2FydGhpay5iLnNAaW50ZWwuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBWYW5kaXRh
IEt1bGthcm5pIDx2YW5kaXRhLmt1bGthcm5pQGludGVsLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgfCAzICsrKwo+PiAgIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmggICAgICAgICAgICAgIHwgMSArCj4+ICAgMiBmaWxl
cyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMKPj4gaW5kZXggMWFjMmU2ZjI3NTk3Li5jZTJiMGMxNGEw
NzMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlz
cGxheS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxh
eS5jCj4+IEBAIC00NzY4LDYgKzQ3NjgsOSBAQCB1MzIgc2tsX3BsYW5lX2N0bChjb25zdCBzdHJ1
Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwKPj4gICAKPj4gICAJcGxhbmVfY3RsID0g
UExBTkVfQ1RMX0VOQUJMRTsKPj4gICAKPj4gKwlpZiAoY3J0Y19zdGF0ZS0+dWFwaS5hc3luY19m
bGlwKQo+PiArCQlwbGFuZV9jdGwgfD0gUExBTkVfQ1RMX0FTWU5DX0ZMSVA7Cj4gCj4gSG1tLiBX
ZSBtaWdodCB3YW50IHRvIHB1dCB0aGF0IGludG8gc2tsX3BsYW5lX2N0bF9jcnRjKCkgc2luY2Ug
aXQncwo+IGEgY3J0Yy13aWRlIHRoaW5nLAo+IAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LgpTdXJl
LCBJJ2xsIG1vdmUgdGhpcy4KClRoYW5rcywKS2FydGhpay5CLlMKPj4gKwo+PiAgIAlpZiAoSU5U
RUxfR0VOKGRldl9wcml2KSA8IDEwICYmICFJU19HRU1JTklMQUtFKGRldl9wcml2KSkgewo+PiAg
IAkJcGxhbmVfY3RsIHw9IHNrbF9wbGFuZV9jdGxfYWxwaGEocGxhbmVfc3RhdGUpOwo+PiAgIAkJ
cGxhbmVfY3RsIHw9IFBMQU5FX0NUTF9QTEFORV9HQU1NQV9ESVNBQkxFOwo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2k5MTVfcmVnLmgKPj4gaW5kZXggZTg1YzZmYzFmM2NiLi4zZjg4ZDlhYzkwYTggMTAwNjQ0Cj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmgKPj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvaTkxNV9yZWcuaAo+PiBAQCAtNjkyNCw2ICs2OTI0LDcgQEAgZW51bSB7Cj4+
ICAgI2RlZmluZSAgIFBMQU5FX0NUTF9USUxFRF9YCQkJKDEgPDwgMTApCj4+ICAgI2RlZmluZSAg
IFBMQU5FX0NUTF9USUxFRF9ZCQkJKDQgPDwgMTApCj4+ICAgI2RlZmluZSAgIFBMQU5FX0NUTF9U
SUxFRF9ZRgkJCSg1IDw8IDEwKQo+PiArI2RlZmluZSAgIFBMQU5FX0NUTF9BU1lOQ19GTElQCQkJ
KDEgPDwgOSkKPj4gICAjZGVmaW5lICAgUExBTkVfQ1RMX0ZMSVBfSE9SSVpPTlRBTAkJKDEgPDwg
OCkKPj4gICAjZGVmaW5lICAgUExBTkVfQ1RMX01FRElBX0RFQ09NUFJFU1NJT05fRU5BQkxFCSgx
IDw8IDQpIC8qIFRHTCsgKi8KPj4gICAjZGVmaW5lICAgUExBTkVfQ1RMX0FMUEhBX01BU0sJCQko
MHgzIDw8IDQpIC8qIFByZS1HTEsgKi8KPj4gLS0gCj4+IDIuMjIuMAo+IApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F2F2721A9
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 12:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E286E265;
	Mon, 21 Sep 2020 10:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5176E04E;
 Mon, 21 Sep 2020 10:59:29 +0000 (UTC)
IronPort-SDR: AzbqbLRkFI+hgK3dC7DRxOVygv1psV4amyhDJFRtpy4/hxm23c1GVc+InMFNgFG/rSgnpuBvev
 yozGwl5yxYKw==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="160407451"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="160407451"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 03:59:28 -0700
IronPort-SDR: NdniOecOTheClSMTuAfiIkvbnDnQlSdRyIk0dd/eQFO1Qzg0gokK9K9KyF4Yq378mv9C9RxZkj
 ZUts9GNSSIQg==
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="485394713"
Received: from kbs1-mobl1.gar.corp.intel.com (HELO [10.252.173.129])
 ([10.252.173.129])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 03:59:25 -0700
Subject: Re: [PATCH v9 8/8] drm/i915: Enable async flips in i915
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20200916150824.15749-1-karthik.b.s@intel.com>
 <20200916150824.15749-9-karthik.b.s@intel.com>
 <20200918120345.GM6112@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <db32837f-7ebc-b199-d0c5-eb846b59025a@intel.com>
Date: Mon, 21 Sep 2020 16:29:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200918120345.GM6112@intel.com>
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

CgpPbiA5LzE4LzIwMjAgNTozMyBQTSwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+IE9uIFdlZCwg
U2VwIDE2LCAyMDIwIGF0IDA4OjM4OjI0UE0gKzA1MzAsIEthcnRoaWsgQiBTIHdyb3RlOgo+PiBF
bmFibGUgYXN5bmNocm9ub3VzIGZsaXBzIGluIGk5MTUgZm9yIGdlbjkrIHBsYXRmb3Jtcy4KPj4K
Pj4gdjI6IC1Bc3luYyBmbGlwIGVuYWJsZW1lbnQgc2hvdWxkIGJlIGEgc3RhbmQgYWxvbmUgcGF0
Y2ggKFBhdWxvKQo+Pgo+PiB2MzogLU1vdmUgdGhlIHBhdGNoIHRvIHRoZSBlbmQgb2YgdGhlIHNl
cmllcyAoUGF1bG8pCj4+Cj4+IHY0OiAtUmViYXNlZC4KPj4KPj4gdjU6IC1SZWJhc2VkLgo+Pgo+
PiB2NjogLVJlYmFzZWQuCj4+Cj4+IHY3OiAtUmViYXNlZC4KPj4KPj4gdjg6IC1SZWJhc2VkLgo+
Pgo+PiB2OTogLVJlYmFzZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEthcnRoaWsgQiBTIDxrYXJ0
aGlrLmIuc0BpbnRlbC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFZhbmRpdGEgS3Vsa2FybmkgPHZh
bmRpdGEua3Vsa2FybmlAaW50ZWwuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyB8IDMgKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2Rpc3BsYXkuYwo+PiBpbmRleCA2ZjZlZGM1ODFlMTQuLmUzMWFiZjVmMWE5ZCAxMDA2NDQKPj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMKPj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMKPj4gQEAgLTE4
MDIxLDYgKzE4MDIxLDkgQEAgc3RhdGljIHZvaWQgaW50ZWxfbW9kZV9jb25maWdfaW5pdChzdHJ1
Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSkKPj4gICAKPj4gICAJbW9kZV9jb25maWctPmZ1bmNz
ID0gJmludGVsX21vZGVfZnVuY3M7Cj4+ICAgCj4+ICsJaWYgKElOVEVMX0dFTihpOTE1KSA+PSA5
KQo+PiArCQltb2RlX2NvbmZpZy0+YXN5bmNfcGFnZV9mbGlwID0gdHJ1ZTsKPj4gKwo+IAo+IFNo
b3VsZCBoYXZlIGFsbCB3ZSBuZWVkIGZvciB0aG9zZSBwbGF0Zm9ybXMgSSB0aGluay4KPiAKPiBS
ZXZpZXdlZC1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNv
bT4KPiAKClRoYW5rcyBmb3IgdGhlIFJCLgoKPiBUaGUgZm9sbG93dXAgdG8gZW5hYmxlIGl0IGZv
ciBpbGsrIHdvdWxkIHJlcXVpcmUgYSBzbGlnaHQgY2hhbmdlIHRvCj4gYnVtcCBYLXRpbGVkIHN1
cmZhY2UgYWxpZ25tZW50IHRvIDI1NktpQi4gQXBhcnQgZnJvbSB0aGUgYWN0dWFsIHJlZ2lzZXIK
PiBzbWFzaGluZyBwYXJ0IHRoYXQgc2hvdWxkIGJlIGFsbCB3ZSBuZWVkIHJlYWxseS4KPiAKPiBP
aCwgYW5kIHRoZSBkb3VibGUgYnVmZmVyIGJpdCB3L2Egd2lsbCBhbHNvIGJlIG5lZWRlZCBvbiBi
ZHcuCj4gSSd2ZSBub3cgdGVzdGVkIHNuYi9pdmIvaHN3L2JkdyBhbmQgb25seSBiZHcgbmVlZHMg
aXQuIEkgZ3Vlc3MKPiB0aGF0J3Mgbm90IGVudGlyZWx5IHVuc3VycGlzaW5nIHNpbmNlIGJkdyBk
aWQgaW50cm9kdWNlIG9uZSBvdGhlcgo+IGZhaWwgZm9yIHRoZSBmbGlwIGRvbmUgaW50ZXJydXB0
ICh0aGUgaW50ZXJ1cHQgZmlyZXMgaW1tZWRpYXRlbHkKPiB3aGVuIHRoZSBwbGFuZSB3YXMgZGlz
YWJsZWQsIHNvIGNhbid0IHVzZSBmbGlwIGRvbmUgdG8gZGV0ZXJtaW5lCj4gd2hlbiB0aGUgcGxh
bmUgaGFzIGFjdHVhbGx5IGJlY29tZSB2aXNpYmxlKS4gRm9ydHVuYXRlbHkgdGhhdAo+IG90aGVy
IGZhaWwgc2hvdWxkIGhhdmUgbm8gaW1wYWN0IG9uIHVzaW5nIGl0IGZvciBhc3luYyBmbGlwCj4g
Y29tcGxldGlvbi4KPiAKClN1cmUgSSdsbCBtYWtlIHRoZSBtZW50aW9uZWQgY2hhbmdlcyBpbiB0
aGUgZm9sbG93dXAgcGF0Y2hlcyB0byBlbmFibGUgCmFzeW5jIGZsaXAgZm9yIGlsaysgcGxhdGZv
cm1zLgoKVGhhbmtzLApLYXJ0aGlrLkIuUwo+PiAgIAkvKgo+PiAgIAkgKiBNYXhpbXVtIGZyYW1l
YnVmZmVyIGRpbWVuc2lvbnMsIGNob3NlbiB0byBtYXRjaAo+PiAgIAkgKiB0aGUgbWF4aW11bSBy
ZW5kZXIgZW5naW5lIHN1cmZhY2Ugc2l6ZSBvbiBnZW40Ky4KPj4gLS0gCj4+IDIuMjIuMAo+IApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

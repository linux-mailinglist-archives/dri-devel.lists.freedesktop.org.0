Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25569C9F2F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 15:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B431B6E9C6;
	Thu,  3 Oct 2019 13:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47786E9C4;
 Thu,  3 Oct 2019 13:16:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Oct 2019 06:16:05 -0700
X-IronPort-AV: E=Sophos;i="5.67,252,1566889200"; d="scan'208";a="191264962"
Received: from paaron-mobl.ger.corp.intel.com (HELO [10.251.93.134])
 ([10.251.93.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/AES256-SHA;
 03 Oct 2019 06:16:04 -0700
Subject: Re: [Intel-gfx] [PATCH 1/2] dma-fence: Serialise signal enabling
 (dma_fence_enable_sw_signaling)
To: Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org
References: <20190915184539.16724-1-chris@chris-wilson.co.uk>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <306bc53e-741e-1a23-c37d-b83400c38794@linux.intel.com>
Date: Thu, 3 Oct 2019 14:16:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190915184539.16724-1-chris@chris-wilson.co.uk>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDE1LzA5LzIwMTkgMTk6NDUsIENocmlzIFdpbHNvbiB3cm90ZToKPiBNYWtlIGRtYV9mZW5j
ZV9lbmFibGVfc3dfc2lnbmFsaW5nKCkgYmVoYXZlIGxpa2UgaXRzCj4gZG1hX2ZlbmNlX2FkZF9j
YWxsYmFjaygpIGFuZCBkbWFfZmVuY2VfZGVmYXVsdF93YWl0KCkgY291bnRlcnBhcnRzIGFuZAo+
IHBlcmZvcm0gdGhlIHRlc3QgdG8gZW5hYmxlIHNpZ25hbGluZyB1bmRlciB0aGUgZmVuY2UtPmxv
Y2ssIGFsb25nIHdpdGgKPiB0aGUgYWN0aW9uIHRvIGRvIHNvLiBUaGlzIGVuc3VyZSB0aGF0IHNo
b3VsZCBhbiBpbXBsZW1lbnRhdGlvbiBiZSB0cnlpbmcKPiB0byBmbHVzaCB0aGUgY2JfbGlzdCAo
Ynkgc2lnbmFsaW5nKSBvbiByZXRpcmVtZW50IGJlZm9yZSBmcmVlaW5nIHRoZQo+IGZlbmNlLCBp
dCBjYW4gZG8gc28gaW4gYSByYWNlLWZyZWUgbWFubmVyLgo+IAo+IFNlZSBhbHNvIDBmYzg5YjY4
MDJiYSAoImRtYS1mZW5jZTogU2ltcGx5IHdyYXAgZG1hX2ZlbmNlX3NpZ25hbF9sb2NrZWQKPiB3
aXRoIGRtYV9mZW5jZV9zaWduYWwiKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24g
PGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiAtLS0KPiAgIGRyaXZlcnMvZG1hLWJ1Zi9kbWEt
ZmVuY2UuYyB8IDExICsrKysrLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1h
LWZlbmNlLmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMKPiBpbmRleCAyYzEzNmFlZTNl
NzkuLjU4NzcyNzA4OTEzNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNl
LmMKPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMKPiBAQCAtMjg1LDE5ICsyODUs
MTggQEAgdm9pZCBkbWFfZmVuY2VfZW5hYmxlX3N3X3NpZ25hbGluZyhzdHJ1Y3QgZG1hX2ZlbmNl
ICpmZW5jZSkKPiAgIHsKPiAgIAl1bnNpZ25lZCBsb25nIGZsYWdzOwo+ICAgCj4gKwlpZiAodGVz
dF9iaXQoRE1BX0ZFTkNFX0ZMQUdfU0lHTkFMRURfQklULCAmZmVuY2UtPmZsYWdzKSkKPiArCQly
ZXR1cm47Cj4gKwo+ICsJc3Bpbl9sb2NrX2lycXNhdmUoZmVuY2UtPmxvY2ssIGZsYWdzKTsKPiAg
IAlpZiAoIXRlc3RfYW5kX3NldF9iaXQoRE1BX0ZFTkNFX0ZMQUdfRU5BQkxFX1NJR05BTF9CSVQs
CgpJIGRhcmUgbm90IHRvIGFzayBpZiB0aGlzIGNvdWxkbid0IGJlIHRoZSBub24tYXRvbWljIHZl
cnNpb24sIGJ1dCBJIGhhdmUgCmVtcGlyaWNhbGx5IHByb3ZlbiB0byBteXNlbGYgdGhpbmdzIGFy
ZSBub3QgdGhhdCBzdHJhaWdodGZvcndhcmQgYXJvdW5kIApoZXJlLgoKPiAgIAkJCSAgICAgICZm
ZW5jZS0+ZmxhZ3MpICYmCj4gLQkgICAgIXRlc3RfYml0KERNQV9GRU5DRV9GTEFHX1NJR05BTEVE
X0JJVCwgJmZlbmNlLT5mbGFncykgJiYKPiAgIAkgICAgZmVuY2UtPm9wcy0+ZW5hYmxlX3NpZ25h
bGluZykgewo+ICAgCQl0cmFjZV9kbWFfZmVuY2VfZW5hYmxlX3NpZ25hbChmZW5jZSk7Cj4gLQo+
IC0JCXNwaW5fbG9ja19pcnFzYXZlKGZlbmNlLT5sb2NrLCBmbGFncyk7Cj4gLQo+ICAgCQlpZiAo
IWZlbmNlLT5vcHMtPmVuYWJsZV9zaWduYWxpbmcoZmVuY2UpKQo+ICAgCQkJZG1hX2ZlbmNlX3Np
Z25hbF9sb2NrZWQoZmVuY2UpOwo+IC0KPiAtCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKGZlbmNl
LT5sb2NrLCBmbGFncyk7Cj4gICAJfQo+ICsJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZShmZW5jZS0+
bG9jaywgZmxhZ3MpOwo+ICAgfQo+ICAgRVhQT1JUX1NZTUJPTChkbWFfZmVuY2VfZW5hYmxlX3N3
X3NpZ25hbGluZyk7Cj4gICAKPiAKClJldmlld2VkLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtv
LnVyc3VsaW5AaW50ZWwuY29tPgoKUmVnYXJkcywKClR2cnRrbwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

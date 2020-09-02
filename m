Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FBB25AC5D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 15:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0616E8B7;
	Wed,  2 Sep 2020 13:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DF789850;
 Wed,  2 Sep 2020 13:52:59 +0000 (UTC)
IronPort-SDR: TXhMIz/K7/ZJLW6Ron0AGfsqgirIyUwhsfPpN/IScxi6sDyJXwe0ZhlfPAxRR9E/vQFoSivYJ1
 ccexohxR9Ilg==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="242207544"
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="242207544"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 06:52:58 -0700
IronPort-SDR: oZMLLXhSWu7lTAa1cLvYxBYp2KD1Wp0kxtPQzPLEYrV+tOEJFmmJFhfpRHBxkEY920yVXkAhzc
 P2JMKNEoDxmg==
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="477646256"
Received: from kbs1-mobl1.gar.corp.intel.com (HELO [10.215.142.42])
 ([10.215.142.42])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 06:52:55 -0700
Subject: Re: [PATCH v6 5/7] drm/i915: Add dedicated plane hook for async flip
 case
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20200807093551.10673-1-karthik.b.s@intel.com>
 <20200807093551.10673-6-karthik.b.s@intel.com>
 <20200901112717.GJ6112@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <24406ffa-1543-738c-bb1f-8d967b00155f@intel.com>
Date: Wed, 2 Sep 2020 19:22:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200901112717.GJ6112@intel.com>
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

CgpPbiA5LzEvMjAyMCA0OjU3IFBNLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gT24gRnJpLCBB
dWcgMDcsIDIwMjAgYXQgMDM6MDU6NDlQTSArMDUzMCwgS2FydGhpayBCIFMgd3JvdGU6Cj4+IFRo
aXMgaG9vayBpcyBhZGRlZCB0byBhdm9pZCB3cml0aW5nIG90aGVyIHBsYW5lIHJlZ2lzdGVycyBp
biBjYXNlIG9mCj4+IGFzeW5jIGZsaXBzLCBzbyB0aGF0IHdlIGRvIG5vdCB3cml0ZSB0aGUgZG91
YmxlIGJ1ZmZlcmVkIHJlZ2lzdGVycwo+PiBkdXJpbmcgYXN5bmMgc3VyZmFjZSBhZGRyZXNzIHVw
ZGF0ZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogS2FydGhpayBCIFMgPGthcnRoaWsuYi5zQGludGVs
LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogVmFuZGl0YSBLdWxrYXJuaSA8dmFuZGl0YS5rdWxrYXJu
aUBpbnRlbC5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfc3ByaXRlLmMgfCAyNSArKysrKysrKysrKysrKysrKysrKysKPj4gICAxIGZpbGUgY2hhbmdl
ZCwgMjUgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9zcHJpdGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfc3ByaXRlLmMKPj4gaW5kZXggMmIyZDk2YzU5ZDdmLi4xYzAzNTQ2YTRkMmEgMTAwNjQ0
Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfc3ByaXRlLmMKPj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9zcHJpdGUuYwo+PiBAQCAt
NjA5LDYgKzYwOSwyNCBAQCBpY2xfcHJvZ3JhbV9pbnB1dF9jc2Moc3RydWN0IGludGVsX3BsYW5l
ICpwbGFuZSwKPj4gICAJCQkgIFBMQU5FX0lOUFVUX0NTQ19QT1NUT0ZGKHBpcGUsIHBsYW5lX2lk
LCAyKSwgMHgwKTsKPj4gICB9Cj4+ICAgCj4+ICtzdGF0aWMgdm9pZAo+PiArc2tsX3Byb2dyYW1f
YXN5bmNfc3VyZmFjZV9hZGRyZXNzKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiwK
Pj4gKwkJCQkgIGNvbnN0IHN0cnVjdCBpbnRlbF9wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUsCj4+
ICsJCQkJICBlbnVtIHBpcGUgcGlwZSwgZW51bSBwbGFuZV9pZCBwbGFuZV9pZCwKPj4gKwkJCQkg
IHUzMiBzdXJmX2FkZHIpCj4+ICt7Cj4+ICsJdW5zaWduZWQgbG9uZyBpcnFmbGFnczsKPj4gKwl1
MzIgcGxhbmVfY3RsID0gcGxhbmVfc3RhdGUtPmN0bDsKPiAKPiBOZWVkIHRoZSBiaXRzIGZyb20g
c2tsX3BsYW5lX2N0bF9jcnRjKCkgdG9vLgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LgpTdXJlLCBJ
J2xsIHVwZGF0ZSB0aGlzLgo+IAo+PiArCj4+ICsJc3Bpbl9sb2NrX2lycXNhdmUoJmRldl9wcml2
LT51bmNvcmUubG9jaywgaXJxZmxhZ3MpOwo+PiArCj4+ICsJaW50ZWxfZGVfd3JpdGVfZncoZGV2
X3ByaXYsIFBMQU5FX0NUTChwaXBlLCBwbGFuZV9pZCksIHBsYW5lX2N0bCk7Cj4+ICsJaW50ZWxf
ZGVfd3JpdGVfZncoZGV2X3ByaXYsIFBMQU5FX1NVUkYocGlwZSwgcGxhbmVfaWQpLAo+PiArCQkJ
ICBpbnRlbF9wbGFuZV9nZ3R0X29mZnNldChwbGFuZV9zdGF0ZSkgKyBzdXJmX2FkZHIpOwo+PiAr
Cj4+ICsJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZGV2X3ByaXYtPnVuY29yZS5sb2NrLCBpcnFm
bGFncyk7Cj4+ICt9Cj4+ICsKPj4gICBzdGF0aWMgdm9pZAo+PiAgIHNrbF9wcm9ncmFtX3BsYW5l
KHN0cnVjdCBpbnRlbF9wbGFuZSAqcGxhbmUsCj4+ICAgCQkgIGNvbnN0IHN0cnVjdCBpbnRlbF9j
cnRjX3N0YXRlICpjcnRjX3N0YXRlLAo+PiBAQCAtNjM3LDYgKzY1NSwxMyBAQCBza2xfcHJvZ3Jh
bV9wbGFuZShzdHJ1Y3QgaW50ZWxfcGxhbmUgKnBsYW5lLAo+PiAgIAl1MzIga2V5bXNrLCBrZXlt
YXg7Cj4+ICAgCXUzMiBwbGFuZV9jdGwgPSBwbGFuZV9zdGF0ZS0+Y3RsOwo+PiAgIAo+PiArCS8q
IER1cmluZyBBc3luYyBmbGlwLCBubyBvdGhlciB1cGRhdGVzIGFyZSBhbGxvd2VkICovCj4+ICsJ
aWYgKGNydGNfc3RhdGUtPnVhcGkuYXN5bmNfZmxpcCkgewo+PiArCQlza2xfcHJvZ3JhbV9hc3lu
Y19zdXJmYWNlX2FkZHJlc3MoZGV2X3ByaXYsIHBsYW5lX3N0YXRlLAo+PiArCQkJCQkJICBwaXBl
LCBwbGFuZV9pZCwgc3VyZl9hZGRyKTsKPj4gKwkJcmV0dXJuOwo+PiArCX0KPiAKPiBJJ2Qgc3Vn
Z2VzdCBhZGRpbmcgYSB2ZnVuYyBmb3IgdGhpcy4gU2hvdWxkIGJlIGFibGUgdG8gY2FsbCBpdCBm
cm9tCj4gaW50ZWxfdXBkYXRlX3BsYW5lKCkuIFRoYXQgd2F5IHdlIGRvbid0IG5lZWQgdG8gcGF0
Y2ggaXQgaW50byBlYWNoCj4gYW5kIGV2ZXJ5IC51cGRhdGVfcGxhbmUoKSBpbXBsZW1lbnRhdGlv
bi4KPiAKClN1cmUuIEkgd2lsbCBhZGQgYSB2ZnVuYyBmb3IgdGhpcyBpbiBpbnRlbF9wbGFuZSBh
bmQgY2FsbCBpdCBkaXJlY3RseSAKZnJvbSBpbnRlbF91cGRhdGVfcGxhbmUoKQoKVGhhbmtzLApL
YXJ0aGlrLkIuUwo+IAo+PiArCj4+ICAgCXBsYW5lX2N0bCB8PSBza2xfcGxhbmVfY3RsX2NydGMo
Y3J0Y19zdGF0ZSk7Cj4+ICAgCj4+ICAgCWlmIChJTlRFTF9HRU4oZGV2X3ByaXYpID49IDEwIHx8
IElTX0dFTUlOSUxBS0UoZGV2X3ByaXYpKQo+PiAtLSAKPj4gMi4yMi4wCj4gCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

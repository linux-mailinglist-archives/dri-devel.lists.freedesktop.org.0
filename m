Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C1927C18D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 11:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401B289F35;
	Tue, 29 Sep 2020 09:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9945789C83;
 Tue, 29 Sep 2020 09:46:18 +0000 (UTC)
IronPort-SDR: P/j+z8kW8gAIoY6YtCaTQ6BZSQqIT3byN7ohX5fR+M299qnfIPMI1pvi0tNQ9RFdVO/GJfYtTZ
 xr0E4jGNio4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="159530124"
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="159530124"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 02:46:16 -0700
IronPort-SDR: tvaRKYKJrhHyTCQfvIu0Lparu8fgMnj+deBXpz6Q4plclVu0mowQeur0wLUZCLTVwc2yqWdc6K
 z8+DiP+b0CcQ==
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="489641408"
Received: from kbs1-mobl1.gar.corp.intel.com (HELO [10.215.192.242])
 ([10.215.192.242])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 02:46:13 -0700
Subject: Re: [PATCH v10 0/8] Asynchronous flip implementation for i915
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20200921110210.21182-1-karthik.b.s@intel.com>
 <20200928121828.GU6112@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <99980deb-158a-3dec-2218-16e15f85f5e3@intel.com>
Date: Tue, 29 Sep 2020 15:16:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200928121828.GU6112@intel.com>
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

CgpPbiA5LzI4LzIwMjAgNTo0OCBQTSwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+IE9uIE1vbiwg
U2VwIDIxLCAyMDIwIGF0IDA0OjMyOjAyUE0gKzA1MzAsIEthcnRoaWsgQiBTIHdyb3RlOgo+PiBX
aXRob3V0IGFzeW5jIGZsaXAgc3VwcG9ydCBpbiB0aGUga2VybmVsLCBmdWxsc2NyZWVuIGFwcHMg
d2hlcmUgZ2FtZQo+PiByZXNvbHV0aW9uIGlzIGVxdWFsIHRvIHRoZSBzY3JlZW4gcmVzb2x1dGlv
biwgbXVzdCBwZXJmb3JtIGFuIGV4dHJhIGJsaXQKPj4gcGVyIGZyYW1lIHByaW9yIHRvIGZsaXBw
aW5nLgo+Pgo+PiBBc3luY2hyb25vdXMgcGFnZSBmbGlwcyB3aWxsIGFsc28gYm9vc3QgdGhlIEZQ
UyBvZiBNZXNhIGJlbmNobWFya3MuCj4+Cj4+IHYyOiAtRmV3IHBhdGNoZXMgaGF2ZSBiZWVuIHNx
dWFzaGVkIGFuZCBwYXRjaGVzIGhhdmUgYmVlbiBzaHVmZmxlZCBhcwo+PiAgICAgICBwZXIgdGhl
IHJldmlld3Mgb24gdGhlIHByZXZpb3VzIHZlcnNpb24uCj4+Cj4+IHYzOiAtRmV3IHBhdGNoZXMg
aGF2ZSBiZWVuIHNxdWFzaGVkIGFuZCBwYXRjaGVzIGhhdmUgYmVlbiBzaHVmZmxlZCBhcwo+PiAg
ICAgICBwZXIgdGhlIHJldmlld3Mgb24gdGhlIHByZXZpb3VzIHZlcnNpb24uCj4+Cj4+IHY0OiAt
TWFkZSBjaGFuZ2VzIHRvIGZpeCB0aGUgc2VxdWVuY2UgYW5kIHRpbWUgc3RhbXAgaXNzdWUgYXMg
cGVyIHRoZQo+PiAgICAgICBjb21tZW50cyByZWNlaXZlZCBvbiB0aGUgcHJldmlvdXMgdmVyc2lv
bi4KPj4gICAgICAtVGltZXN0YW1wcyBhcmUgY2FsY3VsYXRlZCB1c2luZyB0aGUgZmxpcCBkb25l
IHRpbWUgc3RhbXAgYW5kIGN1cnJlbnQKPj4gICAgICAgdGltZXN0YW1wLiBIZXJlIEk5MTVfTU9E
RV9GTEFHX0dFVF9TQ0FOTElORV9GUk9NX1RJTUVTVEFNUCBmbGFnIGlzIHVzZWQKPj4gICAgICAg
Zm9yIHRpbWVzdGFtcCBjYWxjdWxhdGlvbnMuCj4+ICAgICAgLUV2ZW50IGlzIHNlbnQgZnJvbSB0
aGUgaW50ZXJydXB0IGhhbmRsZXIgaW1tZWRpYXRlbHkgdXNpbmcgdGhpcwo+PiAgICAgICB1cGRh
dGVkIHRpbWVzdGFtcHMgYW5kIHNlcXVlbmNlLgo+PiAgICAgIC1BZGRlZCBtb3JlIHN0YXRlIGNo
ZWNrcyBhcyBhc3luYyBmbGlwIHNob3VsZCBvbmx5IGFsbG93IGNoYW5nZSBpbiBwbGFuZQo+PiAg
ICAgICBzdXJmYWNlIGFkZHJlc3MgYW5kIG5vdGhpbmcgZWxzZSBzaG91bGQgYmUgYWxsb3dlZCB0
byBjaGFuZ2UuCj4+ICAgICAgLUFkZGVkIGEgc2VwYXJhdGUgcGxhbmUgaG9vayBmb3IgYXN5bmMg
ZmxpcC4KPj4gICAgICAtTmVlZCB0byBmaW5kIGEgd2F5IHRvIHJlamVjdCBmYmMgZW5hYmxpbmcg
aWYgaXQgY29tZXMgYXMgcGFydCBvZiB0aGlzCj4+ICAgICAgIGZsaXAgYXMgYnNwZWMgc3RhdGVz
IHRoYXQgY2hhbmdlcyB0byBGQkMgYXJlIG5vdCBhbGxvd2VkLgo+Pgo+PiB2NTogLUZpeGVkIHRo
ZSBDaGVja3BhdGNoIGFuZCBzcGFyc2Ugd2FybmluZ3MuCj4+Cj4+IHY2OiAtUmV2ZXJ0ZWQgYmFj
ayB0byB0aGUgb2xkIHRpbWVzdGFtcGluZyBjb2RlIGFzIHBlciB0aGUgZmVlZGJhY2sgcmVjZWl2
ZWQuCj4+ICAgICAgLUFkZGVkIGRvY3VtZW50YXRpb24uCj4+Cj4+IHY3OiAtQ2hhbmdlcyBpbiBp
bnRlbF9hdG9taWNfY2hlY2tfYXN5bmMoKQo+PiAgICAgIC1BZGQgdmZ1bmMgZm9yIHNrbF9wcm9n
cmFtX2FzeW5jX3N1cmZhY2VfYWRkcmVzcygpCj4+Cj4+IHY4OiAtQWRkIFdBIGZvciBvbGRlciBw
bGF0Zm9ybXMgd2l0aCBkb3VibGUgYnVmZmVyZWQKPj4gICAgICAgYXN5bmMgYWRkcmVzcyB1cGRh
dGUgZW5hYmxlIGJpdC4KPj4KPj4gdjk6IC1DaGFuZ2VzIGFzIHBlciBmZWVkYmFjayByZWNlaXZl
ZCBvbiBwcmV2aW91cyB2ZXJzaW9uLgo+Pgo+PiB2MTA6IC1DaGFuZ2VzIGFzIHBlciBmZWVkYmFj
ayByZWNlaXZlZCBvbiBwcmV2aW91cyB2ZXJzaW9uLgo+IAo+IEV2ZXJ5dGhpbmcgc2VlbXMgZ29v
ZCwgc28gcHVzaGVkIHRoZSBzZXJpZXMgdG8gZGlucS4gIFRoYW5rcy4KPiAKPiBHYXZlIHRoaXMg
YSBsaXR0bGUgdGVzdCBydW4gb24gbXkgY2ZsIGFzIHdlbGwuIEF0IGZpcnN0IGl0IGRpZG4ndAo+
IGtpY2sgaW4sIGJ1dCB0aGVuIEkgcmVtZWJlcmVkIHRoYXQgSSdtIHJ1bm5pbmcgWCB3aXRoIG1v
ZGlmaWVycwo+IGVuYWJsZWQgc28gSSB3YXMgZ2V0dGluZyBjb21wcmVzc2lvbiBpbnN0ZWFkLiBB
ZnRlciBkaXNhYmxpbmcKPiBtb2RpZmllcnMgSSBnb3QgcGxhaW4gb2xkIFgtdGlsZSBhZ2FpbiBh
bmQgZGlkIHNlZSBhc3luYyBmbGlwcwo+IGhhcHBlbmluZy4KPiAKClRoYW5rcyBmb3IgdGhlIG1l
cmdlLgoKVGhhbmtzLApLYXJ0aGlrLkIuUwo+Pgo+PiBLYXJ0aGlrIEIgUyAoOCk6Cj4+ICAgIGRy
bS9pOTE1OiBBZGQgZW5hYmxlL2Rpc2FibGUgZmxpcCBkb25lIGFuZCBmbGlwIGRvbmUgaGFuZGxl
cgo+PiAgICBkcm0vaTkxNTogQWRkIHN1cHBvcnQgZm9yIGFzeW5jIGZsaXBzIGluIEk5MTUKPj4g
ICAgZHJtL2k5MTU6IEFkZCBjaGVja3Mgc3BlY2lmaWMgdG8gYXN5bmMgZmxpcHMKPj4gICAgZHJt
L2k5MTU6IERvIG5vdCBjYWxsIGRybV9jcnRjX2FybV92YmxhbmtfZXZlbnQgaW4gYXN5bmMgZmxp
cHMKPj4gICAgZHJtL2k5MTU6IEFkZCBkZWRpY2F0ZWQgcGxhbmUgaG9vayBmb3IgYXN5bmMgZmxp
cCBjYXNlCj4+ICAgIGRybS9pOTE1OiBXQSBmb3IgcGxhdGZvcm1zIHdpdGggZG91YmxlIGJ1ZmZl
cmVkIGFkZHJlc3MgdXBkYXRlIGVuYWJsZQo+PiAgICAgIGJpdAo+PiAgICBEb2N1bWVudGF0aW9u
L2dwdTogQWRkIGFzeW5jaHJvbm91cyBmbGlwIGRvY3VtZW50YXRpb24gZm9yIGk5MTUKPj4gICAg
ZHJtL2k5MTU6IEVuYWJsZSBhc3luYyBmbGlwcyBpbiBpOTE1Cj4+Cj4+ICAgRG9jdW1lbnRhdGlv
bi9ncHUvaTkxNS5yc3QgICAgICAgICAgICAgICAgICAgIHwgICA2ICsKPj4gICAuLi4vZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWljX3BsYW5lLmMgfCAgIDYgKy0KPj4gICBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyAgfCAxOTkgKysrKysrKysrKysr
KysrKysrCj4+ICAgLi4uL2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5oICAg
IHwgICAzICsKPj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nwcml0ZS5j
ICAgfCAgMzAgKysrCj4+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9pcnEuYyAgICAgICAg
ICAgICAgIHwgIDUyICsrKysrCj4+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9pcnEuaCAg
ICAgICAgICAgICAgIHwgICAzICsKPj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5o
ICAgICAgICAgICAgICAgfCAgIDEgKwo+PiAgIDggZmlsZXMgY2hhbmdlZCwgMjk5IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gLS0gCj4+IDIuMjIuMAo+IApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

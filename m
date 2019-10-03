Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C083CA02F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 16:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849406E9F3;
	Thu,  3 Oct 2019 14:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47E16E9F3;
 Thu,  3 Oct 2019 14:18:47 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18709076-1500050 for multiple; Thu, 03 Oct 2019 15:18:44 +0100
MIME-Version: 1.0
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <14063C7AD467DE4B82DEDB5C278E8663D9C0292F@fmsmsx107.amr.corp.intel.com>
References: <20191003093639.10186-2-chris@chris-wilson.co.uk>
 <20191003132422.32730-1-chris@chris-wilson.co.uk>
 <14063C7AD467DE4B82DEDB5C278E8663D9C0292F@fmsmsx107.amr.corp.intel.com>
Message-ID: <157011232171.2173.4977692617014194927@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: RE: [Intel-gfx] [PATCH v3] dma-fence: Serialise signal enabling
 (dma_fence_enable_sw_signaling)
Date: Thu, 03 Oct 2019 15:18:41 +0100
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBSdWhsLCBNaWNoYWVsIEogKDIwMTktMTAtMDMgMTU6MTI6MzgpCj4gPi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4gPkZyb206IEludGVsLWdmeCBbbWFpbHRvOmludGVsLWdmeC1i
b3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZ10gT24gQmVoYWxmIE9mCj4gPkNocmlzIFdpbHNv
bgo+ID5TZW50OiBUaHVyc2RheSwgT2N0b2JlciAzLCAyMDE5IDk6MjQgQU0KPiA+VG86IGludGVs
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiA+U3ViamVjdDogW0ludGVsLWdmeF0gW1BBVENIIHYzXSBkbWEtZmVuY2U6IFNl
cmlhbGlzZSBzaWduYWwgZW5hYmxpbmcKPiA+KGRtYV9mZW5jZV9lbmFibGVfc3dfc2lnbmFsaW5n
KQo+ID4KPiA+TWFrZSBkbWFfZmVuY2VfZW5hYmxlX3N3X3NpZ25hbGluZygpIGJlaGF2ZSBsaWtl
IGl0cwo+ID5kbWFfZmVuY2VfYWRkX2NhbGxiYWNrKCkgYW5kIGRtYV9mZW5jZV9kZWZhdWx0X3dh
aXQoKSBjb3VudGVycGFydHMgYW5kCj4gPnBlcmZvcm0gdGhlIHRlc3QgdG8gZW5hYmxlIHNpZ25h
bGluZyB1bmRlciB0aGUgZmVuY2UtPmxvY2ssIGFsb25nIHdpdGgKPiA+dGhlIGFjdGlvbiB0byBk
byBzby4gVGhpcyBlbnN1cmUgdGhhdCBzaG91bGQgYW4gaW1wbGVtZW50YXRpb24gYmUgdHJ5aW5n
Cj4gPnRvIGZsdXNoIHRoZSBjYl9saXN0IChieSBzaWduYWxpbmcpIG9uIHJldGlyZW1lbnQgYmVm
b3JlIGZyZWVpbmcgdGhlCj4gPmZlbmNlLCBpdCBjYW4gZG8gc28gaW4gYSByYWNlLWZyZWUgbWFu
bmVyLgo+ID4KPiA+U2VlIGFsc28gMGZjODliNjgwMmJhICgiZG1hLWZlbmNlOiBTaW1wbHkgd3Jh
cCBkbWFfZmVuY2Vfc2lnbmFsX2xvY2tlZAo+ID53aXRoIGRtYV9mZW5jZV9zaWduYWwiKS4KPiA+
Cj4gPnYyOiBSZWZhY3RvciBhbGwgMyBlbmFibGVfc2lnbmFsaW5nIHBhdGhzIHRvIHVzZSBhIGNv
bW1vbiBmdW5jdGlvbi4KPiA+Cj4gPlNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNA
Y2hyaXMtd2lsc29uLmNvLnVrPgo+ID4tLS0KPiA+UmV0dXJuIGZhbHNlIGZvciAiY291bGQgbm90
IF9lbmFibGVfIHNpZ25hbGluZyBhcyBpdCB3YXMgYWxyZWFkeQo+ID5zaWduYWxlZCIKPiA+LS0t
Cj4gPiBkcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMgfCA3OCArKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwg
NDMgZGVsZXRpb25zKC0pCj4gPgo+ID5kaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1m
ZW5jZS5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jCj4gPmluZGV4IDJjMTM2YWVlM2U3
OS4uYjU4NTI4YzFjYzlkIDEwMDY0NAo+ID4tLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNl
LmMKPiA+KysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jCj4gPkBAIC0yNzMsNiArMjcz
LDMwIEBAIHZvaWQgZG1hX2ZlbmNlX2ZyZWUoc3RydWN0IGRtYV9mZW5jZSAqZmVuY2UpCj4gPiB9
Cj4gPiBFWFBPUlRfU1lNQk9MKGRtYV9mZW5jZV9mcmVlKTsKPiA+Cj4gPitzdGF0aWMgYm9vbCBf
X2RtYV9mZW5jZV9lbmFibGVfc2lnbmFsaW5nKHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlKQo+ID4r
ewo+ID4rICAgICAgYm9vbCB3YXNfc2V0Owo+ID4rCj4gPisgICAgICBsb2NrZGVwX2Fzc2VydF9o
ZWxkKGZlbmNlLT5sb2NrKTsKPiAKPiBXaXRoIHRoaXMgaGVsZC4uLgo+IAo+ID4rICAgICAgd2Fz
X3NldCA9Cj4gPnRlc3RfYW5kX3NldF9iaXQoRE1BX0ZFTkNFX0ZMQUdfRU5BQkxFX1NJR05BTF9C
SVQsCj4gPisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmZmVuY2UtPmZsYWdzKTsK
PiA+Kwo+ID4rICAgICAgaWYgKHRlc3RfYml0KERNQV9GRU5DRV9GTEFHX1NJR05BTEVEX0JJVCwg
JmZlbmNlLT5mbGFncykpCj4gPisgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiAKPiBXb3Vs
ZCBtYWtpbmcgdGhlc2UgdGhlIG5vbi1hdG9taWMgdmVyc2lvbnMgYmUgdXNlZnVsIChhbmQvb3Ig
cmVhc29uYWJsZSk/CgpUaGF0IGRlcGVuZHMgb24gYWxsIG1vZGlmaWNhdGlvbnMgdG8gdGhlIGR3
b3JkIChub3QganVzdCB0aGUgYml0KSBiZWluZwpzZXJpYWxpc2VkIGJ5IHRoZSBzYW1lIGxvY2sg
KG9yIG90aGVyd2lzZSBndWFyYW50ZWVkIHRvIGJlIHNlcmlhbCBhbmQKY29oZXJlbnQpLCB3aGlj
aCBhcyBUdnJ0a28gcmVkaXNjb3ZlcmVkIGlzIG5vdCB0aGUgY2FzZS4gZG1hX2ZlbmNlLmZsYWdz
CmlzIGFsc28gaG9tZSB0byBhIG51bWJlciBvZiB1c2VyIGZsYWdzLgotQ2hyaXMKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

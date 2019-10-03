Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D576CA08B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 16:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0964D6EA03;
	Thu,  3 Oct 2019 14:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B416EA03;
 Thu,  3 Oct 2019 14:43:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Oct 2019 07:43:55 -0700
X-IronPort-AV: E=Sophos;i="5.67,252,1566889200"; d="scan'208";a="191283988"
Received: from paaron-mobl.ger.corp.intel.com (HELO [10.251.93.134])
 ([10.251.93.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/AES256-SHA;
 03 Oct 2019 07:43:53 -0700
Subject: Re: [Intel-gfx] [PATCH v3] dma-fence: Serialise signal enabling
 (dma_fence_enable_sw_signaling)
To: Chris Wilson <chris@chris-wilson.co.uk>,
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20191003093639.10186-2-chris@chris-wilson.co.uk>
 <20191003132422.32730-1-chris@chris-wilson.co.uk>
 <14063C7AD467DE4B82DEDB5C278E8663D9C0292F@fmsmsx107.amr.corp.intel.com>
 <157011232171.2173.4977692617014194927@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <2dcd865d-f1d8-9978-8355-4494d0cbc885@linux.intel.com>
Date: Thu, 3 Oct 2019 15:43:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <157011232171.2173.4977692617014194927@skylake-alporthouse-com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDAzLzEwLzIwMTkgMTU6MTgsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFJ1aGws
IE1pY2hhZWwgSiAoMjAxOS0xMC0wMyAxNToxMjozOCkKPj4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tCj4+PiBGcm9tOiBJbnRlbC1nZnggW21haWx0bzppbnRlbC1nZngtYm91bmNlc0BsaXN0
cy5mcmVlZGVza3RvcC5vcmddIE9uIEJlaGFsZiBPZgo+Pj4gQ2hyaXMgV2lsc29uCj4+PiBTZW50
OiBUaHVyc2RheSwgT2N0b2JlciAzLCAyMDE5IDk6MjQgQU0KPj4+IFRvOiBpbnRlbC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4+PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+Pj4gU3ViamVjdDogW0ludGVsLWdmeF0gW1BBVENIIHYzXSBkbWEtZmVuY2U6IFNlcmlhbGlz
ZSBzaWduYWwgZW5hYmxpbmcKPj4+IChkbWFfZmVuY2VfZW5hYmxlX3N3X3NpZ25hbGluZykKPj4+
Cj4+PiBNYWtlIGRtYV9mZW5jZV9lbmFibGVfc3dfc2lnbmFsaW5nKCkgYmVoYXZlIGxpa2UgaXRz
Cj4+PiBkbWFfZmVuY2VfYWRkX2NhbGxiYWNrKCkgYW5kIGRtYV9mZW5jZV9kZWZhdWx0X3dhaXQo
KSBjb3VudGVycGFydHMgYW5kCj4+PiBwZXJmb3JtIHRoZSB0ZXN0IHRvIGVuYWJsZSBzaWduYWxp
bmcgdW5kZXIgdGhlIGZlbmNlLT5sb2NrLCBhbG9uZyB3aXRoCj4+PiB0aGUgYWN0aW9uIHRvIGRv
IHNvLiBUaGlzIGVuc3VyZSB0aGF0IHNob3VsZCBhbiBpbXBsZW1lbnRhdGlvbiBiZSB0cnlpbmcK
Pj4+IHRvIGZsdXNoIHRoZSBjYl9saXN0IChieSBzaWduYWxpbmcpIG9uIHJldGlyZW1lbnQgYmVm
b3JlIGZyZWVpbmcgdGhlCj4+PiBmZW5jZSwgaXQgY2FuIGRvIHNvIGluIGEgcmFjZS1mcmVlIG1h
bm5lci4KPj4+Cj4+PiBTZWUgYWxzbyAwZmM4OWI2ODAyYmEgKCJkbWEtZmVuY2U6IFNpbXBseSB3
cmFwIGRtYV9mZW5jZV9zaWduYWxfbG9ja2VkCj4+PiB3aXRoIGRtYV9mZW5jZV9zaWduYWwiKS4K
Pj4+Cj4+PiB2MjogUmVmYWN0b3IgYWxsIDMgZW5hYmxlX3NpZ25hbGluZyBwYXRocyB0byB1c2Ug
YSBjb21tb24gZnVuY3Rpb24uCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxj
aHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4+PiAtLS0KPj4+IFJldHVybiBmYWxzZSBmb3IgImNv
dWxkIG5vdCBfZW5hYmxlXyBzaWduYWxpbmcgYXMgaXQgd2FzIGFscmVhZHkKPj4+IHNpZ25hbGVk
Igo+Pj4gLS0tCj4+PiBkcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMgfCA3OCArKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+PiAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0
aW9ucygrKSwgNDMgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1h
LWJ1Zi9kbWEtZmVuY2UuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYwo+Pj4gaW5kZXgg
MmMxMzZhZWUzZTc5Li5iNTg1MjhjMWNjOWQgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2RtYS1i
dWYvZG1hLWZlbmNlLmMKPj4+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UuYwo+Pj4g
QEAgLTI3Myw2ICsyNzMsMzAgQEAgdm9pZCBkbWFfZmVuY2VfZnJlZShzdHJ1Y3QgZG1hX2ZlbmNl
ICpmZW5jZSkKPj4+IH0KPj4+IEVYUE9SVF9TWU1CT0woZG1hX2ZlbmNlX2ZyZWUpOwo+Pj4KPj4+
ICtzdGF0aWMgYm9vbCBfX2RtYV9mZW5jZV9lbmFibGVfc2lnbmFsaW5nKHN0cnVjdCBkbWFfZmVu
Y2UgKmZlbmNlKQo+Pj4gK3sKPj4+ICsgICAgICBib29sIHdhc19zZXQ7Cj4+PiArCj4+PiArICAg
ICAgbG9ja2RlcF9hc3NlcnRfaGVsZChmZW5jZS0+bG9jayk7Cj4+Cj4+IFdpdGggdGhpcyBoZWxk
Li4uCj4+Cj4+PiArICAgICAgd2FzX3NldCA9Cj4+PiB0ZXN0X2FuZF9zZXRfYml0KERNQV9GRU5D
RV9GTEFHX0VOQUJMRV9TSUdOQUxfQklULAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICZmZW5jZS0+ZmxhZ3MpOwo+Pj4gKwo+Pj4gKyAgICAgIGlmICh0ZXN0X2JpdChETUFf
RkVOQ0VfRkxBR19TSUdOQUxFRF9CSVQsICZmZW5jZS0+ZmxhZ3MpKQo+Pj4gKyAgICAgICAgICAg
ICAgcmV0dXJuIGZhbHNlOwo+Pgo+PiBXb3VsZCBtYWtpbmcgdGhlc2UgdGhlIG5vbi1hdG9taWMg
dmVyc2lvbnMgYmUgdXNlZnVsIChhbmQvb3IgcmVhc29uYWJsZSk/Cj4gCj4gVGhhdCBkZXBlbmRz
IG9uIGFsbCBtb2RpZmljYXRpb25zIHRvIHRoZSBkd29yZCAobm90IGp1c3QgdGhlIGJpdCkgYmVp
bmcKPiBzZXJpYWxpc2VkIGJ5IHRoZSBzYW1lIGxvY2sgKG9yIG90aGVyd2lzZSBndWFyYW50ZWVk
IHRvIGJlIHNlcmlhbCBhbmQKPiBjb2hlcmVudCksIHdoaWNoIGFzIFR2cnRrbyByZWRpc2NvdmVy
ZWQgaXMgbm90IHRoZSBjYXNlLiBkbWFfZmVuY2UuZmxhZ3MKPiBpcyBhbHNvIGhvbWUgdG8gYSBu
dW1iZXIgb2YgdXNlciBmbGFncy4KCk1pY2hhZWwsIGZvciBjb21wbGV0ZW5lc3Mgb2YgdGhlIHJl
ZmVyZW5jZSAtIEkgZmVsbCBpbnRvIHRoZSBzYW1lIHRyYXAgLSAKaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82NzUzMi8uIENoZWNrIHRoZSByZXN1bHRzLiA6KQoKUmVn
YXJkcywKClR2cnRrbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=

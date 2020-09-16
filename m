Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F0F26BE46
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 09:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153E66E9CA;
	Wed, 16 Sep 2020 07:39:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63FF96E9CA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 07:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 588B73F950;
 Wed, 16 Sep 2020 09:39:28 +0200 (CEST)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=V9Zifn+B; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.642
X-Spam-Level: 
X-Spam-Status: No, score=-3.642 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.543,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eQewZO-Acjr2; Wed, 16 Sep 2020 09:39:27 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id B2CF93F8A8;
 Wed, 16 Sep 2020 09:39:24 +0200 (CEST)
Received: from 9-2DT-694.SSPE.ch.intel.com (unknown [134.134.139.76])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 39170361CDB;
 Wed, 16 Sep 2020 09:39:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1600241968; bh=Pb3cFqAzP4goPx4+4E/yMXw1UrRMxTaTU3LeZA/UELY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=V9Zifn+BbYqbfAu4OIeXJf8XTXcL8at954IS/SxpPrjb3SoL/MWZxeI0fhgQfYHTv
 5MhZXb2VQZhejfC5tJ7i2+I4ZzwbmyGWlWlsiZwKB95E510wlGO/RxSRGTet40aLtD
 dvOPdP2VMjDLW6iJkpM1ElZY6Cac9tufCMJGsSWw=
Subject: Re: some half-baked ttm ideas
To: Daniel Vetter <daniel@ffwll.ch>
References: <CAPM=9txcrHC77Quj6ufUHn0FD1-7b4YKO2MWFZGwJy8Tmj1i7g@mail.gmail.com>
 <6b59373e-c4e0-76b5-ffa7-d4bb954a1ffb@gmail.com>
 <CAPM=9tzXsGqnbkUH30vUHd7zyenCNj=ikVjx6P1qWq9dx0jiEg@mail.gmail.com>
 <CAPM=9tySxEnV+1q=hyu4c5tSX35ZJr6TBKwfnUkQZbuw=XkrLA@mail.gmail.com>
 <85097575-b713-095d-7c09-9e4d02f5fbda@shipmail.org>
 <CAKMK7uGHdCo8y49j25FupBBamqwT7VbXGNjawHYAYL6buL0SpQ@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <8e3b8862-1ca4-7282-ba75-ba2419b82124@shipmail.org>
Date: Wed, 16 Sep 2020 09:39:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGHdCo8y49j25FupBBamqwT7VbXGNjawHYAYL6buL0SpQ@mail.gmail.com>
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
Cc: "Koenig, Christian" <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDkvMTYvMjAgOToyMiBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBXZWQsIFNlcCAx
NiwgMjAyMCBhdCA4OjUwIEFNIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkKPiA8dGhvbWFzX29z
QHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIDkvMTYvMjAgNjoyOCBBTSwgRGF2ZSBBaXJs
aWUgd3JvdGU6Cj4+PiBPbiBXZWQsIDE2IFNlcCAyMDIwIGF0IDE0OjE5LCBEYXZlIEFpcmxpZSA8
YWlybGllZEBnbWFpbC5jb20+IHdyb3RlOgo+Pj4+IE9uIFdlZCwgMTYgU2VwIDIwMjAgYXQgMDA6
MTIsIENocmlzdGlhbiBLw7ZuaWcKPj4+PiA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5j
b20+IHdyb3RlOgo+Pj4+PiBIaSBEYXZlLAo+Pj4+Pgo+Pj4+PiBJIHRoaW5rIHdlIHNob3VsZCBq
dXN0IGNvbXBsZXRlbHkgbnVrZSB0dG1fdHRfYmluZCgpIGFuZCB0dG1fdHRfdW5iaW5kKCkKPj4+
Pj4gYW5kIGFsbCBvZiB0aGF0Lgo+Pj4+Pgo+Pj4+PiBEcml2ZXJzIGNhbiB0byB0aGlzIGZyb20g
dGhlaXIgbW92ZV9ub3RpZnkoKSBjYWxsYmFjayBub3cgaW5zdGVhZC4KPj4+PiBHb29kIHBsYW4s
IEkndmUgcHV0IGEgYnVuY2ggb2YgcmV3b3JrIGludG8gdGhlIHNhbWUgYnJhbmNoLAo+Pj4+Cj4+
Pj4gaHR0cHM6Ly9naXRodWIuY29tL2FpcmxpZWQvbGludXgvY29tbWl0cy90dG0taGFsZi1iYWtl
ZC1pZGVhcwo+Pj4+Cj4+Pj4gYnV0IEkndmUgZnJpZWQgbXkgYnJhaW4gYSBiaXQsIEknbSBoYXZp
bmcgdHJvdWJsZSByZWNvbmNpbGluZyBtb3ZlCj4+Pj4gbm90aWZ5IGFuZCB1bmJpbmRpbmcgaW4g
dGhlIHJpZ2h0IHBsYWNlcywgSSBmZWVsIGxpa2UgSSdtIGNpcmNsaW5nCj4+Pj4gYXJvdW5kIHRo
ZSBhbnN3ZXIgYnV0IGhhdmVuJ3QgaGl0IGl0IHlldC4KPj4+IGRybS90dG06IGFkZCB1bmJpbmQg
dG8gbW92ZSBub3RpZnkgcGF0aHMuCj4+Pgo+Pj4gSW4gdGhhdCB0cmVlIGlzIGluY29ycmVjdCBh
bmQgSSB0aGluayB3aGVyZSB0aGluZ3MgZmFsbCBhcGFydCwgc2luY2UKPj4+IGlmIHdlIGFyZSBt
b3ZpbmcgVFRNIHRvIFZSQU0gdGhhdCB3aWxsIHVuYmluZCB0aGUgVFRNIG9iamVjdCBmcm9tIHRo
ZQo+Pj4gR1RUIGF0IG1vdmUgbm90aWZ5IHRpbWUgYmVmb3JlIHRoZSBtb3ZlIGhhcyBleGVjdXRl
ZC4KPj4+Cj4+PiBJJ20gZmVlbGluZyBhIG1vdmVfY29tcGxldGVfbm90aWZ5IG1pZ2h0IGJlIGFu
IGlkZWEsIGJ1dCBJJ20gd29uZGVyaW5nCj4+PiBpZiBpdCdzIGEgYmFkIGlkZWEuCj4+Pgo+Pj4g
RGF2ZS4KPj4gSSBkb24ndCBrbm93IGlmIHRoaXMgY29tcGxpY2F0ZXMgdGhpbmdzIG1vcmUsIGJ1
dCBtb3ZlX25vdGlmeSB3YXMKPj4gb3JpZ2luYWxseSBvbmx5IHRob3VnaHQgdG8gYmUgYW4gaW52
YWxpZGF0aW9uIGNhbGxiYWNrLCBhbmQgd2FzIG5ldmVyCj4+IGludGVuZGVkIHRvIGRyaXZlIGFu
eSBvdGhlciBhY3Rpb25zIGluIHRoZSBkcml2ZXIgdGhhbiB0byBpbnZhbGlkYXRlCj4+IHZhcmlv
dXMgR1BVIGJpbmRpbmdzLgo+Pgo+PiBUaGUgaWRlYSB3YXMgdGhhdCBUVE0gc2hvdWxkIHJlYWxs
eSBuZXZlciBzZXQgdXAgYW55IEdQVSBiaW5kaW5ncywgYnV0Cj4+IGp1c3QgcHJvdmlkZSBtZW1v
cnkgd2hlcmUgaXQgd2FzIGdwdS1iaW5kYWJsZSBhbmQgbWFrZSBzdXJlIGl0IHdhcwo+PiBDUFUt
bWFwcGFibGUgd2hlcmUgbmVlZGVkLiBUaGUgImV4Y2VwdGlvbiIgd2FzIG1hcHBhYmxlIEFHUC10
eXBlCj4+IGdwdS1iaW5kaW5ncywgZm9yIHRoZSBzaW1wbGUgcmVhc29uIHRoYXQgdGhleSB3ZXJl
IG5lZWRlZCB0byBwcm92aWRlCj4+IENQVS1tYXBwaW5ncyBvbiBzeXN0ZW1zIHdoZXJlIHlvdSBj
b3VsZG4ndCBtYXAgdGhlIHBhZ2VzIGRpcmVjdGx5LiBCdXQKPj4gc2luY2Ugd2Ugc2V0IHVwIGEg
R1BVIG1hcCBvbiB0aGVzZSBzeXN0ZW1zIGFueXdheSwgbWFueSAobW9zdCkgZHJpdmVycwo+PiBq
dXN0IG1hZGUgdXNlIG9mIHRoYXQsIGJ1dCBvdGhlcnMgdG9vayB0aGUgc3RlcCBmdXJ0aGVyIGlu
c2lzdGluZyBvbgo+PiB1c2luZyBtb3ZlX25vdGlmeSgpIHRvIHNldCB1cCBHUFUgYmluZGluZ3Ms
IHdoaWNoIHdhcyBuZXZlciBpbnRlbmRlZCBhbmQKPj4gYWRkcyBlcnJvciBwYXRocyBpbiB0aGUg
VFRNIG1vdmUgY29kZSB0aGF0IGFyZSBwcmV0dHkgaGFyZCB0byBmb2xsb3cuCj4+Cj4+IFNvIGlm
IHdlJ3JlIGNoYW5naW5nIHRoaW5ncyBoZXJlLCAgSSdkIHZvdGUgZm9yIHRoZSBmb2xsb3dpbmc6
Cj4+Cj4+ICogRHJpdmVyIGNhbGxzIHR0bV9ib192YWxpZGF0ZSB0byBwdXQgbWVtb3J5IHdoZXJl
IGl0IGlzIGNwdS1tYXBwYWJsZQo+PiBhbmQgZ3B1LWJpbmRhYmxlCj4+ICogT24gc3VjY2Vzc2Z1
bCB2YWxpZGF0ZSwgZHJpdmVyIHNldHMgdXAgR1BVIGJpbmRpbmdzIGl0c2VsZi4KPj4KPj4gKiBt
b3ZlX25vdGlmeSBvbmx5IGludmFsaWRhdGVzIEdQVSBiaW5kaW5ncyBhbmQgc2hvdWxkIHJlYWxs
eSByZXR1cm4gYSB2b2lkLgo+Pgo+PiBTbyB0aGF0IGJpbmQoKSBhbmQgdW5iaW5kKCkgc3R1ZmYg
aXMgcmVhbGx5IG9ubHkgbmVlZGVkIGZvciBjcHUtbWFwCj4+IHRocm91Z2ggYXBlcnR1cmUuIElm
IHdlIGRpdGNoIHRoYXQsIHRoZW4gd2UgbmVlZCB0byByZS1kZWZpbmUgdGhlIHRhc2sKPj4gb2Yg
VFRNIHRvIHByb3ZpZGUgbWVtb3J5IGluIGEgY3B1LW1hcHBhYmxlIGxvY2F0aW9uIGFuZCBmaWd1
cmUgaG93Cj4+IGRyaXZlcnMgdGhhdCByZXF1aXJlIGNwdS1tYXAtdGhyb3VnaC1hcGVydHVyZSBz
aG91bGQgaGFuZGxlIHRoaXMsIHNpbmNlCj4+IHRoZXkgY2FuJ3QgdXNlIHRoZSBUVE0gZmF1bHQg
aGFuZGxlciBmb3IgdGhhdCBtZW1vcnkgYW55bW9yZS4gVGhlIHNhbWUKPj4gaG9sZHMgZm9yIGRy
aXZlcnMgdGhhdCB3YW50IHRvIG1hbmFnZSB0aGVpciB0cmFuc2xhdGlvbiB0YWJsZQo+PiB0aGVt
c2VsdmVzLCBhbmQgbmVlZHMgc29tZSBjcHUtbWFwcGluZyBvcGVyYXRpb25zIHRvIGdvIHRocm91
Z2ggdGhlCj4+IGFwZXJ0dXJlIHJhdGhlciB0aGFuIHRvIHRoZSBwYWdlcyBkaXJlY3RseS4KPiBw
cmUtY29mZmVlIGFuZCBhbGwsIGJ1dCBmb3IgbW1hcCBJIHRoaW5rIHdlIGNhbiBmaXggdGhhdCBi
eSBleHRyYWN0aW5nCj4gYSBmZXcgbW9yZSBvZiB0aGUgYnVpbGRpbmcgYmxvY2tzIGZyb20gdHRt
X2JvX3ZtLCBzbyB0aGF0IHRoZSBkcml2ZXIncwo+IGZhdWx0IGhhbmRsZXIgYmVjb21lcyByb3Vn
aGx5Ogo+IDEuIGJvX3Jlc2VydmUKPiAyLiBib192YWxpZGF0ZSB0byBtYWtlIHN1cmUgaXQncyBp
biB0aGUgcmlnaHQgc3BvdCwgZHJpdmVyIHdvdWxkCj4gY29udHJvbCB0aGF0LiBFLmcuIG9uIGk5
MTUgcHdyaXRlIHdlIGZpcnN0IHRyeSB0aGUgZ3R0IHdpdGhvdXQKPiBldmljdGluZywgYW5kIHRo
ZW4gZmFsbCBiYWNrIHRvIG90aGVyIG1hcHBpbmdzLCBtYXliZSBzb21lIGRyaXZlcgo+IHdhbnRz
IHRvIGhhdmUgdGhhdCBraW5kIG9mIGZpbmUtZ3JhaW5lZCBjb250cm9sIHRvby4KPiAzLiB0b3Ag
aGFsZiBvZiB0dG0gZmF1bHQgaGFuZGxlciwgdXAgdG8gYnV0IGV4Y2x1ZGluZyB0dG1fdHRfcG9w
dWxhdGUKPiA0LiBhZ2FpbiBiYWNrIGluIGRyaXZlciBjb2RlLCBmaWxsaW5nIG91dCBhbGwgdGhl
IHR0IGl0c2VsZiAoc28KPiBrZWVwaW5nIHRoZSB0dCBzdHJ1Y3R1cmVzIHByb2JhYmx5IGdvb2Qg
aWRlYSkKPiA1LiBib3R0b20gaGFsZiBvZiB0dG0gZmF1bHQgaGFuZGxlciB3aXRoIGFsbCB0aGUg
cHRlIGluc2VydCBjb2RlIGFuZAo+IHByZWZhdWx0aW5nIGFuZCBhbGwgdGhhdAo+IDYuIGJvX3Vu
cmVzZXJ2ZQoKWWVzLCBzb21ldGhpbmcgbGlrZSB0aGF0IHNob3VsZCBwcm9iYWJseSB3b3JrIGp1
c3QgZmluZS4KCi9UaG9tYXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK

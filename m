Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D41357B22
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 06:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DEA89CD9;
	Thu,  8 Apr 2021 04:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B7589CD9
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 04:14:47 +0000 (UTC)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4FG7FY43sQz98;
 Thu,  8 Apr 2021 06:14:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1617855283; bh=KI2dzA2WKw0khhuL9Za7dPX4cPeFWERULVCKCp60G0Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NNw4Qsrb7zAERw9UhSK9+7KhT3HwsKP8C8b82jvVjR/MLZHQucIEh1HdoBF/rjmWh
 GUbv2Dp9mPuEl0tyc0TJOk09DFOakEkqCNbdwHw2i1KSNyhsvhMkonvckSjZ9pB9Of
 3amCULg2NXY/IZYWvrXdFlgBf8F3L0THbxyAbQET3+4gHj/pze+jVwtksz5aIcVstD
 3mT3pmj9Otjbsw6825EITftxi4WWEF9W0pBJIWNceHmuK5T+s/v/EAbtvsYN3MvKMo
 2yzrC9K0BLamJhiTOrygqAN3WaposQlg5ZzRB3vToyz67I0LfOeSQZ9O5DktGsLOb2
 M0KtUdhy69R3Q==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date: Thu, 8 Apr 2021 06:13:44 +0200
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v5 03/21] gpu: host1x: Show number of pending waiters in
 debugfs
Message-ID: <20210408041344.GB19244@qmqm.qmqm.pl>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-4-mperttunen@nvidia.com>
 <YFm/431gaaP6wY1A@orome.fritz.box>
 <1010683e-56c9-4b06-1540-d8c60a632c70@kapsi.fi>
 <20210401211949.GA25223@qmqm.qmqm.pl>
 <7636618d-72f7-ee0f-df23-1f2ec96973b4@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7636618d-72f7-ee0f-df23-1f2ec96973b4@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mikko Perttunen <cyndis@kapsi.fi>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com, talho@nvidia.com,
 bhuntsman@nvidia.com, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMDIsIDIwMjEgYXQgMDc6MDI6MzJQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IDAyLjA0LjIwMjEgMDA6MTksIE1pY2hhxYIgTWlyb3PFgmF3INC/0LjRiNC10YI6
Cj4gPiBPbiBGcmksIE1hciAyNiwgMjAyMSBhdCAwNDozNDoxM1BNICswMjAwLCBNaWtrbyBQZXJ0
dHVuZW4gd3JvdGU6Cj4gPj4gT24gMy8yMy8yMSAxMjoxNiBQTSwgVGhpZXJyeSBSZWRpbmcgd3Jv
dGU6Cj4gPj4+IE9uIE1vbiwgSmFuIDExLCAyMDIxIGF0IDAzOjAwOjAxUE0gKzAyMDAsIE1pa2tv
IFBlcnR0dW5lbiB3cm90ZToKPiA+Pj4+IFNob3cgdGhlIG51bWJlciBvZiBwZW5kaW5nIHdhaXRl
cnMgaW4gdGhlIGRlYnVnZnMgc3RhdHVzIGZpbGUuCj4gPj4+PiBUaGlzIGlzIHVzZWZ1bCBmb3Ig
dGVzdGluZyB0byB2ZXJpZnkgdGhhdCB3YWl0ZXJzIGRvIG5vdCBsZWFrCj4gPj4+PiBvciBhY2N1
bXVsYXRlIGluY29ycmVjdGx5Lgo+ID4+Pj4KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IE1pa2tvIFBl
cnR0dW5lbiA8bXBlcnR0dW5lbkBudmlkaWEuY29tPgo+ID4+Pj4gLS0tCj4gPj4+PiAgIGRyaXZl
cnMvZ3B1L2hvc3QxeC9kZWJ1Zy5jIHwgMTQgKysrKysrKysrKystLS0KPiA+Pj4+ICAgMSBmaWxl
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPj4+Pgo+ID4+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2hvc3QxeC9kZWJ1Zy5jIGIvZHJpdmVycy9ncHUvaG9z
dDF4L2RlYnVnLmMKPiA+Pj4+IGluZGV4IDFiNDk5N2JkYTFjNy4uOGExNDg4MGM2MWJiIDEwMDY0
NAo+ID4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvaG9zdDF4L2RlYnVnLmMKPiA+Pj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2hvc3QxeC9kZWJ1Zy5jCj4gPj4+PiBAQCAtNjksNiArNjksNyBAQCBzdGF0aWMg
aW50IHNob3dfY2hhbm5lbChzdHJ1Y3QgaG9zdDF4X2NoYW5uZWwgKmNoLCB2b2lkICpkYXRhLCBi
b29sIHNob3dfZmlmbykKPiA+Pj4+ICAgc3RhdGljIHZvaWQgc2hvd19zeW5jcHRzKHN0cnVjdCBo
b3N0MXggKm0sIHN0cnVjdCBvdXRwdXQgKm8pCj4gPj4+PiAgIHsKPiA+Pj4+ICsJc3RydWN0IGxp
c3RfaGVhZCAqcG9zOwo+ID4+Pj4gICAJdW5zaWduZWQgaW50IGk7Cj4gPj4+PiAgIAlob3N0MXhf
ZGVidWdfb3V0cHV0KG8sICItLS0tIHN5bmNwdHMgLS0tLVxuIik7Cj4gPj4+PiBAQCAtNzYsMTIg
Kzc3LDE5IEBAIHN0YXRpYyB2b2lkIHNob3dfc3luY3B0cyhzdHJ1Y3QgaG9zdDF4ICptLCBzdHJ1
Y3Qgb3V0cHV0ICpvKQo+ID4+Pj4gICAJZm9yIChpID0gMDsgaSA8IGhvc3QxeF9zeW5jcHRfbmJf
cHRzKG0pOyBpKyspIHsKPiA+Pj4+ICAgCQl1MzIgbWF4ID0gaG9zdDF4X3N5bmNwdF9yZWFkX21h
eChtLT5zeW5jcHQgKyBpKTsKPiA+Pj4+ICAgCQl1MzIgbWluID0gaG9zdDF4X3N5bmNwdF9sb2Fk
KG0tPnN5bmNwdCArIGkpOwo+ID4+Pj4gKwkJdW5zaWduZWQgaW50IHdhaXRlcnMgPSAwOwo+ID4+
Pj4gLQkJaWYgKCFtaW4gJiYgIW1heCkKPiA+Pj4+ICsJCXNwaW5fbG9jaygmbS0+c3luY3B0W2ld
LmludHIubG9jayk7Cj4gPj4+PiArCQlsaXN0X2Zvcl9lYWNoKHBvcywgJm0tPnN5bmNwdFtpXS5p
bnRyLndhaXRfaGVhZCkKPiA+Pj4+ICsJCQl3YWl0ZXJzKys7Cj4gPj4+PiArCQlzcGluX3VubG9j
aygmbS0+c3luY3B0W2ldLmludHIubG9jayk7Cj4gPj4+Cj4gPj4+IFdvdWxkIGl0IG1ha2Ugc2Vu
c2UgdG8ga2VlcCBhIHJ1bm5pbmcgY291bnQgc28gdGhhdCB3ZSBkb24ndCBoYXZlIHRvCj4gPj4+
IGNvbXB1dGUgaXQgaGVyZT8KPiA+Pgo+ID4+IENvbnNpZGVyaW5nIHRoaXMgaXMganVzdCBhIGRl
YnVnIGZhY2lsaXR5LCBJIHRoaW5rIEkgcHJlZmVyIG5vdCBhZGRpbmcgYSBuZXcKPiA+PiBmaWVs
ZCBqdXN0IGZvciBpdC4KPiA+IAo+ID4gVGhpcyBsb29rcyBsaWtlIElSUS1kaXNhYmxlZCByZWdp
b24sIHNvIHVubGVzcyBvbmx5IHJvb3QgY2FuIHRyaWdnZXIKPiA+IHRoaXMgY29kZSwgbWF5YmUg
dGhlIGFkZGl0aW9uYWwgZmllbGQgY291bGQgc2F2ZSBhIHBvdGVudGlhbCBoZWFkYWNoZT8KPiA+
IEhvdyBtYW55IHdhaXRlcnMgY2FuIHRoZXJlIGJlIGluIHRoZSB3b3JzdCBjYXNlPwo+IAo+IFRo
ZSBob3N0MXgncyBJUlEgaGFuZGxlciBydW5zIGluIGEgd29ya3F1ZXVlLCBzbyBpdCBzaG91bGQg
YmUgb2theS4KCldoeSwgdGhlbiwgdGhpcyB1c2VzIGEgc3BpbmxvY2sgKGFuZCBpdCBoYXMgJ2lu
dHInIGluIGl0cyBuYW1lKT8KCkJlc3QgUmVnYXJkcwpNaWNoYcWCIE1pcm9zxYJhdwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6DCD3949
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 08:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874856EB9A;
	Fri, 11 Oct 2019 06:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318E96EB9A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 06:21:44 +0000 (UTC)
Received: from localhost (unknown [192.168.167.13])
 by regular1.263xmail.com (Postfix) with ESMTP id AA6E6501;
 Fri, 11 Oct 2019 14:21:40 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.10.69] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P1498T139875987117824S1570774899902158_; 
 Fri, 11 Oct 2019 14:21:41 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <05d49b8d9eedd73368abb06786516ead>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: ben.davis@arm.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
Subject: Re: [PATCH v2 4/4] drm/komeda: Adds gamma and color-transform support
 for DOU-IPS
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 Brian Starkey <Brian.Starkey@arm.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "sean@poorly.run" <sean@poorly.run>,
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
References: <20191011054240.17782-1-james.qian.wang@arm.com>
 <20191011054240.17782-5-james.qian.wang@arm.com>
From: "sandy.huang" <hjc@rock-chips.com>
Message-ID: <08492df8-11d9-c580-94f6-7868602c12c3@rock-chips.com>
Date: Fri, 11 Oct 2019 14:21:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191011054240.17782-5-james.qian.wang@arm.com>
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
Cc: nd <nd@arm.com>,
 "Oscar Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 Ben Davis <Ben.Davis@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CuWcqCAyMDE5LzEwLzExIOS4i+WNiDE6NDMsIGphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xv
Z3kgQ2hpbmEpIOWGmemBkzoKPiBGcm9tOiAiTG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5h
KSIgPExvd3J5LkxpQGFybS5jb20+Cj4KPiBBZGRzIGdhbW1hIGFuZCBjb2xvci10cmFuc2Zvcm0g
c3VwcG9ydCBmb3IgRE9VLUlQUy4KPiBBZGRzIHR3byBjYXBzIG1lbWJlcnMgZmdhbW1hX2NvZWZm
cyBhbmQgY3RtX2NvZWZmcyB0byBrb21lZGFfaW1wcm9jX3N0YXRlLgo+IElmIGNvbG9yIG1hbmFn
ZW1lbnQgY2hhbmdlZCwgc2V0IGdhbW1hIGFuZCBjb2xvci10cmFuc2Zvcm0gYWNjb3JkaW5nbHku
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxsb3dy
eS5saUBhcm0uY29tPgo+IC0tLQo+ICAgLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Nv
bXBvbmVudC5jICAgIHwgMjQgKysrKysrKysrKysrKysrKysrKwo+ICAgLi4uL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgIHwgIDIgKysKPiAgIC4uLi9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oICB8ICAzICsrKwo+ICAgLi4uL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jICAgIHwgIDYgKysrKysKPiAgIDQgZmlsZXMg
Y2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYwo+IGluZGV4IGMzZDI5YzBi
MDUxYi4uZTdlNWE4ZTQ0MzBlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYwo+IEBAIC05NDIsMTUgKzk0Miwz
OSBAQCBzdGF0aWMgaW50IGQ3MV9tZXJnZXJfaW5pdChzdHJ1Y3QgZDcxX2RldiAqZDcxLAo+ICAg
c3RhdGljIHZvaWQgZDcxX2ltcHJvY191cGRhdGUoc3RydWN0IGtvbWVkYV9jb21wb25lbnQgKmMs
Cj4gICAJCQkgICAgICBzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudF9zdGF0ZSAqc3RhdGUpCj4gICB7
Cj4gKwlzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3QgPSBzdGF0ZS0+Y3J0Yy0+c3RhdGU7
Cj4gICAJc3RydWN0IGtvbWVkYV9pbXByb2Nfc3RhdGUgKnN0ID0gdG9faW1wcm9jX3N0KHN0YXRl
KTsKPiArCXN0cnVjdCBkNzFfcGlwZWxpbmUgKnBpcGUgPSB0b19kNzFfcGlwZWxpbmUoYy0+cGlw
ZWxpbmUpOwo+ICAgCXUzMiBfX2lvbWVtICpyZWcgPSBjLT5yZWc7Cj4gICAJdTMyIGluZGV4Owo+
ICsJdTMyIG1hc2sgPSAwLCBjdHJsID0gMDsKPiAgIAo+ICAgCWZvcl9lYWNoX2NoYW5nZWRfaW5w
dXQoc3RhdGUsIGluZGV4KQo+ICAgCQltYWxpZHBfd3JpdGUzMihyZWcsIEJMS19JTlBVVF9JRDAg
KyBpbmRleCAqIDQsCj4gICAJCQkgICAgICAgdG9fZDcxX2lucHV0X2lkKHN0YXRlLCBpbmRleCkp
Owo+ICAgCj4gICAJbWFsaWRwX3dyaXRlMzIocmVnLCBCTEtfU0laRSwgSFZfU0laRShzdC0+aHNp
emUsIHN0LT52c2l6ZSkpOwo+ICsKPiArCWlmIChjcnRjX3N0LT5jb2xvcl9tZ210X2NoYW5nZWQp
IHsKPiArCQltYXNrIHw9IElQU19DVFJMX0ZUIHwgSVBTX0NUUkxfUkdCOwo+ICsKPiArCQlpZiAo
Y3J0Y19zdC0+Z2FtbWFfbHV0KSB7Cj4gKwkJCW1hbGlkcF93cml0ZV9ncm91cChwaXBlLT5kb3Vf
ZnRfY29lZmZfYWRkciwgRlRfQ09FRkYwLAo+ICsJCQkJCSAgIEtPTUVEQV9OX0dBTU1BX0NPRUZG
UywKPiArCQkJCQkgICBzdC0+ZmdhbW1hX2NvZWZmcyk7Cj4gKwkJCWN0cmwgfD0gSVBTX0NUUkxf
RlQ7IC8qIGVuYWJsZSBnYW1tYSAqLwo+ICsJCX0KPiArCj4gKwkJaWYgKGNydGNfc3QtPmN0bSkg
ewo+ICsJCQltYWxpZHBfd3JpdGVfZ3JvdXAocmVnLCBJUFNfUkdCX1JHQl9DT0VGRjAsCj4gKwkJ
CQkJICAgS09NRURBX05fQ1RNX0NPRUZGUywKPiArCQkJCQkgICBzdC0+Y3RtX2NvZWZmcyk7Cj4g
KwkJCWN0cmwgfD0gSVBTX0NUUkxfUkdCOyAvKiBlbmFibGUgZ2FtdXQgKi8KPiArCQl9Cj4gKwl9
Cj4gKwo+ICsJaWYgKG1hc2spCj4gKwkJbWFsaWRwX3dyaXRlMzJfbWFzayhyZWcsIEJMS19DT05U
Uk9MLCBtYXNrLCBjdHJsKTsKPiAgIH0KVGhlcmUgaXMgbm8gbmVlZCBvciBubyBtZXRob2QgdG8g
ZGlzYWJsZS9ieXBhc3MgdGhlIGdhbW1hIGFuZCBnYW11dD8KPiAgIAo+ICAgc3RhdGljIHZvaWQg
ZDcxX2ltcHJvY19kdW1wKHN0cnVjdCBrb21lZGFfY29tcG9uZW50ICpjLCBzdHJ1Y3Qgc2VxX2Zp
bGUgKnNmKQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9jcnRjLmMKPiBpbmRleCA5YmVlZGEwNDgxOGIuLjQwNmI5ZDBjYTA1OCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMKPiBAQCAt
NTkwLDYgKzU5MCw4IEBAIHN0YXRpYyBpbnQga29tZWRhX2NydGNfYWRkKHN0cnVjdCBrb21lZGFf
a21zX2RldiAqa21zLAo+ICAgCj4gICAJY3J0Yy0+cG9ydCA9IGtjcnRjLT5tYXN0ZXItPm9mX291
dHB1dF9wb3J0Owo+ICAgCj4gKwlkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdChjcnRjLCAwLCB0
cnVlLCBLT01FREFfQ09MT1JfTFVUX1NJWkUpOwo+ICsKPiAgIAlyZXR1cm4gZXJyOwo+ICAgfQo+
ICAgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX3BpcGVsaW5lLmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9waXBlbGluZS5oCj4gaW5kZXggYjMyMmY1MmJhOGYyLi5jNWFiODA5NmM4NWQgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUu
aAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVs
aW5lLmgKPiBAQCAtMTEsNiArMTEsNyBAQAo+ICAgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljLmg+
Cj4gICAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+Cj4gICAjaW5jbHVkZSAibWFs
aWRwX3V0aWxzLmgiCj4gKyNpbmNsdWRlICJrb21lZGFfY29sb3JfbWdtdC5oIgo+ICAgCj4gICAj
ZGVmaW5lIEtPTUVEQV9NQVhfUElQRUxJTkVTCQkyCj4gICAjZGVmaW5lIEtPTUVEQV9QSVBFTElO
RV9NQVhfTEFZRVJTCTQKPiBAQCAtMzI0LDYgKzMyNSw4IEBAIHN0cnVjdCBrb21lZGFfaW1wcm9j
IHsKPiAgIHN0cnVjdCBrb21lZGFfaW1wcm9jX3N0YXRlIHsKPiAgIAlzdHJ1Y3Qga29tZWRhX2Nv
bXBvbmVudF9zdGF0ZSBiYXNlOwo+ICAgCXUxNiBoc2l6ZSwgdnNpemU7Cj4gKwl1MzIgZmdhbW1h
X2NvZWZmc1tLT01FREFfTl9HQU1NQV9DT0VGRlNdOwo+ICsJdTMyIGN0bV9jb2VmZnNbS09NRURB
X05fQ1RNX0NPRUZGU107Cj4gICB9Owo+ICAgCj4gICAvKiBkaXNwbGF5IHRpbWluZyBjb250cm9s
bGVyICovCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX3BpcGVsaW5lX3N0YXRlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jCj4gaW5kZXggMGJhOWM2YWEzNzA4Li40YTQwYjM3
ZWIxYTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfcGlwZWxpbmVfc3RhdGUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMKPiBAQCAtNzU2LDYgKzc1NiwxMiBAQCBr
b21lZGFfaW1wcm9jX3ZhbGlkYXRlKHN0cnVjdCBrb21lZGFfaW1wcm9jICppbXByb2MsCj4gICAJ
c3QtPmhzaXplID0gZGZsb3ctPmluX3c7Cj4gICAJc3QtPnZzaXplID0gZGZsb3ctPmluX2g7Cj4g
ICAKPiArCWlmIChrY3J0Y19zdC0+YmFzZS5jb2xvcl9tZ210X2NoYW5nZWQpIHsKPiArCQlkcm1f
bHV0X3RvX2ZnYW1tYV9jb2VmZnMoa2NydGNfc3QtPmJhc2UuZ2FtbWFfbHV0LAo+ICsJCQkJCSBz
dC0+ZmdhbW1hX2NvZWZmcyk7Cj4gKwkJZHJtX2N0bV90b19jb2VmZnMoa2NydGNfc3QtPmJhc2Uu
Y3RtLCBzdC0+Y3RtX2NvZWZmcyk7Cj4gKwl9Cj4gKwo+ICAgCWtvbWVkYV9jb21wb25lbnRfYWRk
X2lucHV0KCZzdC0+YmFzZSwgJmRmbG93LT5pbnB1dCwgMCk7Cj4gICAJa29tZWRhX2NvbXBvbmVu
dF9zZXRfb3V0cHV0KCZkZmxvdy0+aW5wdXQsICZpbXByb2MtPmJhc2UsIDApOwo+ICAgCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

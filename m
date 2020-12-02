Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E472CB6CB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:21:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7093B6EA31;
	Wed,  2 Dec 2020 08:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D63E6E9A7;
 Wed,  2 Dec 2020 00:42:39 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cm0Xr5Q2nzhl1X;
 Wed,  2 Dec 2020 08:42:04 +0800 (CST)
Received: from [127.0.0.1] (10.57.60.129) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Wed, 2 Dec 2020
 08:42:22 +0800
Subject: Re: [PATCH v2 08/20] drm/hibmc: Remove references to struct
 drm_device.pdev
To: Thomas Zimmermann <tzimmermann@suse.de>, "airlied@linux.ie"
 <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>
References: <20201201103542.2182-1-tzimmermann@suse.de>
 <20201201103542.2182-9-tzimmermann@suse.de>
From: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <3f57e8d5-3a2a-f677-e3d6-997d5d9f8389@huawei.com>
Date: Wed, 2 Dec 2020 08:42:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201201103542.2182-9-tzimmermann@suse.de>
X-Originating-IP: [10.57.60.129]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 02 Dec 2020 08:19:47 +0000
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Xinliang Liu <xinliang.liu@linaro.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "kongxinwei \(A\)" <kong.kongxinwei@hisilicon.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "tiantao \(H\)" <tiantao6@hisilicon.com>,
 "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Chenfeng \(puck\)" <puck.chen@hisilicon.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgrU2iAyMDIwLzEyLzEgMTg6MzUsIFRob21hcyBaaW1tZXJtYW5uINC0tcA6Cj4gVXNpbmcgc3Ry
dWN0IGRybV9kZXZpY2UucGRldiBpcyBkZXByZWNhdGVkLiBDb252ZXJ0IGhpYm1jIHRvIHN0cnVj
dAo+IGRybV9kZXZpY2UuZGV2LiBObyBmdW5jdGlvbmFsIGNoYW5nZXMuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gQWNrZWQtYnk6
IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzogWGlubGlhbmcgTGl1IDx4aW5s
aWFuZy5saXVAbGluYXJvLm9yZz4KPiBDYzogVGlhbiBUYW8gIDx0aWFudGFvNkBoaXNpbGljb24u
Y29tPgo+IENjOiBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4KPiBDYzogWGlu
d2VpIEtvbmcgPGtvbmcua29uZ3hpbndlaUBoaXNpbGljb24uY29tPgo+IENjOiBDaGVuIEZlbmcg
PHB1Y2suY2hlbkBoaXNpbGljb24uY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2hpc2ls
aWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMgfCAxMCArKysrKy0tLS0tCj4gICBkcml2ZXJzL2dw
dS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9pMmMuYyB8ICAyICstCj4gICBkcml2ZXJz
L2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX3R0bS5jICAgICB8ICA0ICsrLS0KPiAgIDMg
ZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9kcnYuYyBi
L2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jCj4gaW5kZXgg
ZDg0NTY1N2ZkOTljLi5hYzU4NjgzNDNkMGMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9kcnYuYwo+IEBAIC0yMDMsNyArMjAzLDcgQEAgc3Rh
dGljIHZvaWQgaGlibWNfaHdfY29uZmlnKHN0cnVjdCBoaWJtY19kcm1fcHJpdmF0ZSAqcHJpdikK
PiAgIHN0YXRpYyBpbnQgaGlibWNfaHdfbWFwKHN0cnVjdCBoaWJtY19kcm1fcHJpdmF0ZSAqcHJp
dikKPiAgIHsKPiAgIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gcHJpdi0+ZGV2Owo+IC0Jc3Ry
dWN0IHBjaV9kZXYgKnBkZXYgPSBkZXYtPnBkZXY7Cj4gKwlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9
IHRvX3BjaV9kZXYoZGV2LT5kZXYpOwo+ICAgCXJlc291cmNlX3NpemVfdCBhZGRyLCBzaXplLCBp
b2FkZHIsIGlvc2l6ZTsKPiAgIAo+ICAgCWlvYWRkciA9IHBjaV9yZXNvdXJjZV9zdGFydChwZGV2
LCAxKTsKPiBAQCAtMjQ5LDcgKzI0OSw3IEBAIHN0YXRpYyBpbnQgaGlibWNfdW5sb2FkKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYpCj4gICAJaWYgKGRldi0+aXJxX2VuYWJsZWQpCj4gICAJCWRybV9p
cnFfdW5pbnN0YWxsKGRldik7Cj4gICAKPiAtCXBjaV9kaXNhYmxlX21zaShkZXYtPnBkZXYpOwo+
ICsJcGNpX2Rpc2FibGVfbXNpKHRvX3BjaV9kZXYoZGV2LT5kZXYpKTsKPiAgIAloaWJtY19rbXNf
ZmluaShwcml2KTsKPiAgIAloaWJtY19tbV9maW5pKHByaXYpOwo+ICAgCWRldi0+ZGV2X3ByaXZh
dGUgPSBOVUxMOwo+IEBAIC0yNTgsNiArMjU4LDcgQEAgc3RhdGljIGludCBoaWJtY191bmxvYWQo
c3RydWN0IGRybV9kZXZpY2UgKmRldikKPiAgIAo+ICAgc3RhdGljIGludCBoaWJtY19sb2FkKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYpCj4gICB7Cj4gKwlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRv
X3BjaV9kZXYoZGV2LT5kZXYpOwo+ICAgCXN0cnVjdCBoaWJtY19kcm1fcHJpdmF0ZSAqcHJpdjsK
PiAgIAlpbnQgcmV0Owo+ICAgCj4gQEAgLTI4NywxMSArMjg4LDExIEBAIHN0YXRpYyBpbnQgaGli
bWNfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQo+ICAgCQlnb3RvIGVycjsKPiAgIAl9Cj4g
ICAKPiAtCXJldCA9IHBjaV9lbmFibGVfbXNpKGRldi0+cGRldik7Cj4gKwlyZXQgPSBwY2lfZW5h
YmxlX21zaShwZGV2KTsKPiAgIAlpZiAocmV0KSB7Cj4gICAJCWRybV93YXJuKGRldiwgImVuYWJs
aW5nIE1TSSBmYWlsZWQ6ICVkXG4iLCByZXQpOwo+ICAgCX0gZWxzZSB7Cj4gLQkJcmV0ID0gZHJt
X2lycV9pbnN0YWxsKGRldiwgZGV2LT5wZGV2LT5pcnEpOwo+ICsJCXJldCA9IGRybV9pcnFfaW5z
dGFsbChkZXYsIHBkZXYtPmlycSk7Cj4gICAJCWlmIChyZXQpCj4gICAJCQlkcm1fd2FybihkZXYs
ICJpbnN0YWxsIGlycSBmYWlsZWQ6ICVkXG4iLCByZXQpOwo+ICAgCX0KPiBAQCAtMzI0LDcgKzMy
NSw2IEBAIHN0YXRpYyBpbnQgaGlibWNfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LAo+
ICAgCQlyZXR1cm4gUFRSX0VSUihkZXYpOwo+ICAgCX0KPiAgIAo+IC0JZGV2LT5wZGV2ID0gcGRl
djsKPiAgIAlwY2lfc2V0X2RydmRhdGEocGRldiwgZGV2KTsKPiAgIAo+ICAgCXJldCA9IHBjaV9l
bmFibGVfZGV2aWNlKHBkZXYpOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxp
Y29uL2hpYm1jL2hpYm1jX2RybV9pMmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGli
bWMvaGlibWNfZHJtX2kyYy5jCj4gaW5kZXggODZkNzEyMDkwZDg3Li40MTBiZDAxOWJiMzUgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1faTJj
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9pMmMu
Ywo+IEBAIC04Myw3ICs4Myw3IEBAIGludCBoaWJtY19kZGNfY3JlYXRlKHN0cnVjdCBkcm1fZGV2
aWNlICpkcm1fZGV2LAo+ICAgCWNvbm5lY3Rvci0+YWRhcHRlci5vd25lciA9IFRISVNfTU9EVUxF
Owo+ICAgCWNvbm5lY3Rvci0+YWRhcHRlci5jbGFzcyA9IEkyQ19DTEFTU19EREM7Cj4gICAJc25w
cmludGYoY29ubmVjdG9yLT5hZGFwdGVyLm5hbWUsIEkyQ19OQU1FX1NJWkUsICJISVMgaTJjIGJp
dCBidXMiKTsKPiAtCWNvbm5lY3Rvci0+YWRhcHRlci5kZXYucGFyZW50ID0gJmRybV9kZXYtPnBk
ZXYtPmRldjsKPiArCWNvbm5lY3Rvci0+YWRhcHRlci5kZXYucGFyZW50ID0gZHJtX2Rldi0+ZGV2
Owo+ICAgCWkyY19zZXRfYWRhcGRhdGEoJmNvbm5lY3Rvci0+YWRhcHRlciwgY29ubmVjdG9yKTsK
PiAgIAljb25uZWN0b3ItPmFkYXB0ZXIuYWxnb19kYXRhID0gJmNvbm5lY3Rvci0+Yml0X2RhdGE7
Cj4gICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJt
Y190dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfdHRtLmMKPiBp
bmRleCA2MDJlY2UxMWJiNGEuLjc3ZjA3NTA3NWRiMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX3R0bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2hpc2lsaWNvbi9oaWJtYy9oaWJtY190dG0uYwo+IEBAIC0yNiw5ICsyNiw5IEBAIGludCBoaWJt
Y19tbV9pbml0KHN0cnVjdCBoaWJtY19kcm1fcHJpdmF0ZSAqaGlibWMpCj4gICAJc3RydWN0IGRy
bV92cmFtX21tICp2bW07Cj4gICAJaW50IHJldDsKPiAgIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
ID0gaGlibWMtPmRldjsKPiArCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYt
PmRldik7Cj4gICAKPiAtCXZtbSA9IGRybV92cmFtX2hlbHBlcl9hbGxvY19tbShkZXYsCj4gLQkJ
CQkgICAgICAgcGNpX3Jlc291cmNlX3N0YXJ0KGRldi0+cGRldiwgMCksCj4gKwl2bW0gPSBkcm1f
dnJhbV9oZWxwZXJfYWxsb2NfbW0oZGV2LCBwY2lfcmVzb3VyY2Vfc3RhcnQocGRldiwgMCksCj4g
ICAJCQkJICAgICAgIGhpYm1jLT5mYl9zaXplKTsKPiAgIAlpZiAoSVNfRVJSKHZtbSkpIHsKPiAg
IAkJcmV0ID0gUFRSX0VSUih2bW0pOwo+IApSZXZpZXdlZC1ieTogVGlhbiBUYW8gPHRpYW50YW82
QGhpc2lsaWNvbi5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK

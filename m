Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAD927A81B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFFD76E323;
	Mon, 28 Sep 2020 07:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FF16EC6E
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 09:16:32 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4D6F5F6C3A9ABBF6838A;
 Fri, 25 Sep 2020 17:16:30 +0800 (CST)
Received: from [127.0.0.1] (10.57.60.129) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Fri, 25 Sep 2020
 17:16:19 +0800
Subject: Re: [PATCH] drm/vc4: Deleted the drm_device declaration
To: Tian Tao <tiantao6@hisilicon.com>, <eric@anholt.net>, <airlied@linux.ie>, 
 <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
References: <1601023898-29886-1-git-send-email-tiantao6@hisilicon.com>
 <20200925091023.GE438822@phenom.ffwll.local>
From: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <ca931d2e-c445-a14a-cb40-a7d3f5c190e2@huawei.com>
Date: Fri, 25 Sep 2020 17:16:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200925091023.GE438822@phenom.ffwll.local>
X-Originating-IP: [10.57.60.129]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgOgpJIGFsd2F5Z3MgdXNlZCBzY3JpcHRzL2dldF9tYWludGFpbmVycy5wbCB0byBnZXQgdGhl
IHJlY2lwaWVudCBsaXN0LkkgCmRvbid0IGtub3cgd2h5IG1pc3MgbWFpbnRhaW5lcnMgZm9yIGEg
Z2l2ZW4gcGllY2Ugb2YgY29kZS4KCnRpYW50YW9AdWJ1bnR1On4kIGdpdCBzZW5kLWVtYWlsIC10
byBlcmljQGFuaG9sdC5uZXQgLXRvIAphaXJsaWVkQGxpbnV4LmllIC10byBkYW5pZWxAZmZ3bGwu
Y2ggLXRvIHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnIC10byAKY2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tIC10byBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIC10byAKbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZyAtdG8gbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnIC10byAKbGlu
YXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnIAptYWlsbGluZS9kcm0vZHJtLzAwMDEtZHJtLXZj
NC1EZWxldGVkLXRoZS1kcm1fZGV2aWNlLWRlY2xhcmF0aW9uLnBhdGNoIAotLXN1cHByZXNzLWNj
PWFsbAptYWlsbGluZS9kcm0vZHJtLzAwMDEtZHJtLXZjNC1EZWxldGVkLXRoZS1kcm1fZGV2aWNl
LWRlY2xhcmF0aW9uLnBhdGNoCgp0aWFudGFvQHVidW50dTp+L21haWxsaW5lL2RybS9kcm0kIHZp
bSBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9kcnYuaF5DCnRpYW50YW9AdWJ1bnR1On4vbWFpbGxp
bmUvZHJtL2RybSQgLi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsIApkcml2ZXJzL2dwdS9kcm0v
dmM0L3ZjNF9kcnYuaApFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0PiAoc3VwcG9ydGVyOkRS
TSBEUklWRVJTIEZPUiBWQzQpCkRhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4gKG1haW50
YWluZXI6RFJNIERSSVZFUlMpCkRhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4gKG1haW50
YWluZXI6RFJNIERSSVZFUlMpClN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+
IChtYWludGFpbmVyOkRNQSBCVUZGRVIgU0hBUklORyAKRlJBTUVXT1JLKQoiQ2hyaXN0aWFuIEvD
tm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gKG1haW50YWluZXI6RE1BIEJVRkZFUiAK
U0hBUklORyBGUkFNRVdPUkspCmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcgKG9wZW4g
bGlzdDpEUk0gRFJJVkVSUykKbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZyAob3BlbiBsaXN0
KQpsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcgKG9wZW4gbGlzdDpETUEgQlVGRkVSIFNIQVJJ
TkcgRlJBTUVXT1JLKQpsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcgKG1vZGVyYXRlZCBs
aXN0OkRNQSBCVUZGRVIgU0hBUklORyBGUkFNRVdPUkspCgoK5ZyoIDIwMjAvOS8yNSAxNzoxMCwg
RGFuaWVsIFZldHRlciDlhpnpgZM6Cj4gT24gRnJpLCBTZXAgMjUsIDIwMjAgYXQgMDQ6NTE6MzhQ
TSArMDgwMCwgVGlhbiBUYW8gd3JvdGU6Cj4+IGRybV9tb2Rlc2V0X2xvY2suaCBhbHJlYWR5IGRl
Y2xhcmVzIHN0cnVjdCBkcm1fZGV2aWNlLCBzbyB0aGVyZSdzIG5vCj4+IG5lZWQgdG8gZGVjbGFy
ZSBpdCBpbiB2YzRfZHJ2LmgKPj4KPj4gU2lnbmVkLW9mZi1ieTogVGlhbiBUYW8gPHRpYW50YW82
QGhpc2lsaWNvbi5jb20+Cj4gCj4gSnVzdCBhbiBhc2lkZSwgd2hlbiBzdWJtaXR0aW5nIHBhdGNo
ZXMgcGxlYXNlIHVzZQo+IHNjcmlwdHMvZ2V0X21haW50YWluZXJzLnBsIHRvIGdlbmVyYXRlIHRo
ZSByZWNpcGllbnQgbGlzdC4gTG9va2luZyB0aHJvdWdoCj4gcGFzdCBmZXcgcGF0Y2hlcyBmcm9t
IHlvdSBpdCBzZWVtcyBmYWlybHkgYXJiaXRyYXJ5IGFuZCBvZnRlbiBtaXNzZXMgdGhlCj4gYWN0
dWFsIG1haW50YWluZXJzIGZvciBhIGdpdmVuIHBpZWNlIG9mIGNvZGUsIHdoaWNoIGluY3JlYXNl
cyB0aGUgb2RkcyB0aGUKPiBwYXRjaCB3aWxsIGdldCBsb3N0IGEgbG90Lgo+IAo+IEUuZy4gZm9y
IHRoaXMgb25lIEknbSBvbmx5IGxpa2UgdGhlIDV0aCBvciBzbyBmYWxsYmFjayBwZXJzb24sIGFu
ZCB0aGUKPiBtYWluIG1haW50YWluZXIgaXNuJ3Qgb24gdGhlIHJlY2lwaWVudCBsaXN0Lgo+IAo+
IENoZWVlcnMsIERhbmllbAo+IAo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9k
cnYuaCB8IDEgLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS92
YzQvdmM0X2Rydi5oCj4+IGluZGV4IDhjOGQ5NmIuLjg3MTdhMWMgMTAwNjQ0Cj4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS92YzQvdmM0X2Rydi5oCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92YzQv
dmM0X2Rydi5oCj4+IEBAIC0xOSw3ICsxOSw2IEBACj4+ICAgCj4+ICAgI2luY2x1ZGUgInVhcGkv
ZHJtL3ZjNF9kcm0uaCIKPj4gICAKPj4gLXN0cnVjdCBkcm1fZGV2aWNlOwo+PiAgIHN0cnVjdCBk
cm1fZ2VtX29iamVjdDsKPj4gICAKPj4gICAvKiBEb24ndCBmb3JnZXQgdG8gdXBkYXRlIHZjNF9i
by5jOiBib190eXBlX25hbWVzW10gd2hlbiBhZGRpbmcgdG8KPj4gLS0gCj4+IDIuNy40Cj4+Cj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

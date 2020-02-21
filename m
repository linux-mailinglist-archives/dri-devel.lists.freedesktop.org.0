Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1488D167BA6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:14:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0196F38A;
	Fri, 21 Feb 2020 11:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A0C6EEC0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 08:56:16 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id A9C6B24B492927AD0DB8;
 Fri, 21 Feb 2020 16:56:13 +0800 (CST)
Received: from [127.0.0.1] (10.57.60.129) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Fri, 21 Feb 2020
 16:56:05 +0800
Subject: Re: [PATCH] drm/hisilicon: Fixed pcie resource conflict using the
 general API
To: Thomas Zimmermann <tzimmermann@suse.de>, Xinliang Liu
 <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>
References: <1582264523-61170-1-git-send-email-tiantao6@hisilicon.com>
 <CAKoKPbztX8--gWgLDYJFQX1=Wf1jiFKx+H2_RFN90fxOpr_RdQ@mail.gmail.com>
 <e65e3728-406e-ff9c-a8ef-6829666fa573@suse.de>
From: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <4a8ba960-34c5-d044-900d-5cd0e9ec310e@huawei.com>
Date: Fri, 21 Feb 2020 16:56:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e65e3728-406e-ff9c-a8ef-6829666fa573@suse.de>
X-Originating-IP: [10.57.60.129]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 21 Feb 2020 11:14:24 +0000
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
Cc: airlied@linux.ie, puck.chen@hisilicon.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linuxarm@huawei.com, kraxel@redhat.com,
 alexander.deucher@amd.com, tglx@linutronix.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29ycnksbXkgbWlzdGFrZS4gSSBzZW50IHRoZSB3cm9uZyBwYXRjaCwgcGxlYXNlIGlnbm9yZSB0
aGUgcGF0Y2ggYmVsb3cKCuWcqCAyMDIwLzIvMjEgMTY6NTIsIFRob21hcyBaaW1tZXJtYW5uIOWG
memBkzoKPiBIaQo+IAo+IEFtIDIxLjAyLjIwIHVtIDA4OjA2IHNjaHJpZWIgWGlubGlhbmcgTGl1
Ogo+PiBIaSB0YW8sCj4+IEFyZSB5b3Ugc2VuZGluZyBhIHdyb25nIHBhdGNoPwo+PiBGdW5jdGlv
biBoaWJtY19yZW1vdmVfZnJhbWVidWZmZXJzIGlzIGFkZGVkIGJ5IHlvdXIgcHJpb3IgcmV2aWV3
aW5nIHBhdGNoLgo+PiBQbGVhc2Ugc2VuZCBwYXRjaCBiYXNlZCBvbsKgZHJtLW1pc2MtbmV4dCBi
cmFuY2hbMV0gb3IgbGludXgtbmV4dC4KPiAKPiBUaGVyZSdzIGRybV9mYl9oZWxwZXJfcmVtb3Zl
X2NvbmZsaWN0aW5nX3BjaV9mcmFtZWJ1ZmZlcnMoKSB3aGljaAo+IGFscmVhZHkgaW1wbGVtZW50
cyB0aGUgZnVuY3Rpb25hbGl0eS4gSSBhc2tlZCB0byB0cnkgdXNpbmcgaXQgaW5zdGVhZCBvZgo+
IGNyZWF0aW5nIGFuIG93biBpbXBsZW1lbnRhdGlvbi4KPiAKPiBCZXN0IHJlZ2FyZHMKPiBUaG9t
YXMKPiAKPj4KPj4gVGhhbmtzLAo+PiAtWGlubGlhbmcKPj4KPj4gWzFdwqBodHRwczovL2Fub25n
aXQuZnJlZWRlc2t0b3Aub3JnL2dpdC9kcm0tbWlzYy5naXQKPj4KPj4gT24gRnJpLCAyMSBGZWIg
MjAyMCBhdCAxMzo1NiwgVGlhbiBUYW8gPHRpYW50YW82QGhpc2lsaWNvbi5jb20KPj4gPG1haWx0
bzp0aWFudGFvNkBoaXNpbGljb24uY29tPj4gd3JvdGU6Cj4+Cj4+ICAgICAgdGhlIGtlcm5lbCBw
cm92aWRlIHRoZSBkcm1fZmJfaGVscGVyX3JlbW92ZV9jb25mbGljdGluZ19wY2lfZnJhbWVidWZm
ZXIKPj4gICAgICB0byByZW12b2UgdGhlIHBjaWUgcmVzb3VyY2UgY29uZmxpY3QsdGhlcmUgaXMg
bm8gbmVlZCB0byBkcml2ZXIgaXQKPj4gICAgICBhZ2Fpbi4KPj4KPj4gICAgICBTaWduZWQtb2Zm
LWJ5OiBUaWFuIFRhbyA8dGlhbnRhbzZAaGlzaWxpY29uLmNvbQo+PiAgICAgIDxtYWlsdG86dGlh
bnRhbzZAaGlzaWxpY29uLmNvbT4+Cj4+ICAgICAgLS0tCj4+ICAgICAgwqBkcml2ZXJzL2dwdS9k
cm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9kcnYuYyB8IDIyCj4+ICAgICAgKysrKystLS0t
LS0tLS0tLS0tLS0tLQo+PiAgICAgIMKgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
MTcgZGVsZXRpb25zKC0pCj4+Cj4+ICAgICAgZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9o
aXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5jCj4+ICAgICAgYi9kcml2ZXJzL2dwdS9kcm0v
aGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9kcnYuYwo+PiAgICAgIGluZGV4IDdlYmU4MzEuLjBm
N2RiYTcgMTAwNjQ0Cj4+ICAgICAgLS0tIGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJt
Yy9oaWJtY19kcm1fZHJ2LmMKPj4gICAgICArKysgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29u
L2hpYm1jL2hpYm1jX2RybV9kcnYuYwo+PiAgICAgIEBAIC00NywyMiArNDcsNiBAQCBzdGF0aWMg
aXJxcmV0dXJuX3QgaGlibWNfZHJtX2ludGVycnVwdChpbnQgaXJxLAo+PiAgICAgIHZvaWQgKmFy
ZykKPj4gICAgICDCoCDCoCDCoCDCoCByZXR1cm4gSVJRX0hBTkRMRUQ7Cj4+ICAgICAgwqB9Cj4+
Cj4+ICAgICAgLXN0YXRpYyB2b2lkIGhpYm1jX3JlbW92ZV9mcmFtZWJ1ZmZlcnMoc3RydWN0IHBj
aV9kZXYgKnBkZXYpCj4+ICAgICAgLXsKPj4gICAgICAtwqAgwqAgwqAgwqBzdHJ1Y3QgYXBlcnR1
cmVzX3N0cnVjdCAqYXA7Cj4+ICAgICAgLQo+PiAgICAgIC3CoCDCoCDCoCDCoGFwID0gYWxsb2Nf
YXBlcnR1cmVzKDEpOwo+PiAgICAgIC3CoCDCoCDCoCDCoGlmICghYXApCj4+ICAgICAgLcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuOwo+PiAgICAgIC0KPj4gICAgICAtwqAgwqAgwqAgwqBh
cC0+cmFuZ2VzWzBdLmJhc2UgPSBwY2lfcmVzb3VyY2Vfc3RhcnQocGRldiwgMCk7Cj4+ICAgICAg
LcKgIMKgIMKgIMKgYXAtPnJhbmdlc1swXS5zaXplID0gcGNpX3Jlc291cmNlX2xlbihwZGV2LCAw
KTsKPj4gICAgICAtCj4+ICAgICAgLcKgIMKgIMKgIMKgZHJtX2ZiX2hlbHBlcl9yZW1vdmVfY29u
ZmxpY3RpbmdfZnJhbWVidWZmZXJzKGFwLAo+PiAgICAgICJoaWJtY2RybWZiIiwgZmFsc2UpOwo+
PiAgICAgIC0KPj4gICAgICAtwqAgwqAgwqAgwqBrZnJlZShhcCk7Cj4+ICAgICAgLX0KPj4gICAg
ICAtCj4+ICAgICAgwqBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgaGlibWNfZHJpdmVyID0gewo+
PiAgICAgIMKgIMKgIMKgIMKgIC5kcml2ZXJfZmVhdHVyZXPCoCDCoCDCoCDCoCA9IERSSVZFUl9H
RU0gfCBEUklWRVJfTU9ERVNFVCB8Cj4+ICAgICAgRFJJVkVSX0FUT01JQywKPj4gICAgICDCoCDC
oCDCoCDCoCAuZm9wc8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPSAmaGlibWNfZm9wcywK
Pj4gICAgICBAQCAtMzQzLDcgKzMyNywxMSBAQCBzdGF0aWMgaW50IGhpYm1jX3BjaV9wcm9iZShz
dHJ1Y3QgcGNpX2RldiAqcGRldiwKPj4gICAgICDCoCDCoCDCoCDCoCBzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2Owo+PiAgICAgIMKgIMKgIMKgIMKgIGludCByZXQ7Cj4+Cj4+ICAgICAgLcKgIMKgIMKg
IMKgaGlibWNfcmVtb3ZlX2ZyYW1lYnVmZmVycyhwZGV2KTsKPj4gICAgICArwqAgwqAgwqAgwqBy
ZXQgPSBkcm1fZmJfaGVscGVyX3JlbW92ZV9jb25mbGljdGluZ19wY2lfZnJhbWVidWZmZXJzKHBk
ZXYsCj4+ICAgICAgKwo+PiAgICAgIMKgImhpYm1jZHJtZmIiKTsKPj4gICAgICArwqAgwqAgwqAg
wqBpZiAocmV0KQo+PiAgICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiByZXQ7Cj4+
ICAgICAgKwo+Pgo+PiAgICAgIMKgIMKgIMKgIMKgIGRldiA9IGRybV9kZXZfYWxsb2MoJmhpYm1j
X2RyaXZlciwgJnBkZXYtPmRldik7Cj4+ICAgICAgwqAgwqAgwqAgwqAgaWYgKElTX0VSUihkZXYp
KSB7Cj4+ICAgICAgLS0KPj4gICAgICAyLjcuNAo+Pgo+IAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

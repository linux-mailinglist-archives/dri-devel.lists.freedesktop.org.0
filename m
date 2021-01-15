Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A07692F8CF5
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jan 2021 11:45:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D107E6E5A0;
	Sat, 16 Jan 2021 10:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B706289970
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 08:50:59 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DHFHM4llVzj7sY;
 Fri, 15 Jan 2021 16:49:51 +0800 (CST)
Received: from [127.0.0.1] (10.40.188.144) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.498.0; Fri, 15 Jan 2021
 16:50:46 +0800
Subject: Re: [PATCH] drm/hisilicon/hibmc: Remove hibmc_ttm.c
To: Thomas Zimmermann <tzimmermann@suse.de>, <tiantao6@hisilicon.com>
References: <20210113113107.12005-1-tzimmermann@suse.de>
 <7c5611ac-772e-6529-6072-e192d05c916d@suse.de>
From: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <9f3b2b83-5d8f-106b-1e5f-a799f0805c3e@huawei.com>
Date: Fri, 15 Jan 2021 16:50:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7c5611ac-772e-6529-6072-e192d05c916d@suse.de>
X-Originating-IP: [10.40.188.144]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 16 Jan 2021 10:44:40 +0000
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Chen Feng <puck.chen@hisilicon.com>,
 dri-devel@lists.freedesktop.org, Gong
 junjie <gongjunjie2@huawei.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CuWcqCAyMDIxLzEvMTUgMTY6NDIsIFRob21hcyBaaW1tZXJtYW5uIOWGmemBkzoKPiBwaW5nIGZv
ciByZXZpZXcKPgo+IEFtIDEzLjAxLjIxIHVtIDEyOjMxIHNjaHJpZWIgVGhvbWFzIFppbW1lcm1h
bm46Cj4+IFRoZSBmaWxlIGlzIG5vdCBpbiB1c2UuIEl0IGdvdCByZS1hZGRlZCBieSBhIHJlYmFz
ZWQgcGF0Y2guIFJlbW92aW5nCj4+IGl0Lgo+PgpSZXZpZXdlZC1ieSBUaWFuIFRhbyA8dGlhbnRh
bzZAaGlzaWxpY29uLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+Cj4+IEZpeGVzOiA0ZDRkYWQyMWNjN2IgKCJkcm0vaGlibWM6IFJl
bW92ZSByZWZlcmVuY2VzIHRvIHN0cnVjdCAKPj4gZHJtX2RldmljZS5wZGV2IikKPj4gUmVwb3J0
ZWQtYnk6IFRpYW4gVGFvIDx0aWFudGFvNkBoaXNpbGljb24uY29tPgo+PiBDYzogU2FtIFJhdm5i
b3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+PiBDYzogWGlubGlhbmcgTGl1IDx4aW5saWFuZy5saXVA
bGluYXJvLm9yZz4KPj4gQ2M6IFRpYW4gVGFvwqAgPHRpYW50YW82QGhpc2lsaWNvbi5jb20+Cj4+
IENjOiBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4KPj4gQ2M6IFhpbndlaSBL
b25nIDxrb25nLmtvbmd4aW53ZWlAaGlzaWxpY29uLmNvbT4KPj4gQ2M6IENoZW4gRmVuZyA8cHVj
ay5jaGVuQGhpc2lsaWNvbi5jb20+Cj4+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGZmd2xsLmNoPgo+PiBDYzogR29uZyBqdW5qaWUgPGdvbmdqdW5qaWUyQGh1YXdlaS5jb20+Cj4+
IC0tLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX3R0bS5jIHwg
NjEgLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA2MSBkZWxldGlv
bnMoLSkKPj4gwqAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24v
aGlibWMvaGlibWNfdHRtLmMKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oaXNp
bGljb24vaGlibWMvaGlibWNfdHRtLmMgCj4+IGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9o
aWJtYy9oaWJtY190dG0uYwo+PiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggNzdm
MDc1MDc1ZGIyLi4wMDAwMDAwMDAwMDAKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNv
bi9oaWJtYy9oaWJtY190dG0uYwo+PiArKysgL2Rldi9udWxsCj4+IEBAIC0xLDYxICswLDAgQEAK
Pj4gLS8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyCj4+IC0vKiBI
aXNpbGljb24gSGlibWMgU29DIGRybSBkcml2ZXIKPj4gLSAqCj4+IC0gKiBCYXNlZCBvbiB0aGUg
Ym9jaHMgZHJtIGRyaXZlci4KPj4gLSAqCj4+IC0gKiBDb3B5cmlnaHQgKGMpIDIwMTYgSHVhd2Vp
IExpbWl0ZWQuCj4+IC0gKgo+PiAtICogQXV0aG9yOgo+PiAtICrCoMKgwqAgUm9uZ3JvbmcgWm91
IDx6b3Vyb25ncm9uZ0BodWF3ZWkuY29tPgo+PiAtICrCoMKgwqAgUm9uZ3JvbmcgWm91IDx6b3Vy
b25ncm9uZ0BnbWFpbC5jb20+Cj4+IC0gKsKgwqDCoCBKaWFuaHVhIExpIDxsaWppYW5odWFAaHVh
d2VpLmNvbT4KPj4gLSAqLwo+PiAtCj4+IC0jaW5jbHVkZSA8bGludXgvcGNpLmg+Cj4+IC0KPj4g
LSNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4KPj4gLSNpbmNsdWRlIDxkcm0vZHJt
X2dlbS5oPgo+PiAtI2luY2x1ZGUgPGRybS9kcm1fZ2VtX2ZyYW1lYnVmZmVyX2hlbHBlci5oPgo+
PiAtI2luY2x1ZGUgPGRybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmg+Cj4+IC0jaW5jbHVkZSA8ZHJt
L2RybV9wcmludC5oPgo+PiAtCj4+IC0jaW5jbHVkZSAiaGlibWNfZHJtX2Rydi5oIgo+PiAtCj4+
IC1pbnQgaGlibWNfbW1faW5pdChzdHJ1Y3QgaGlibWNfZHJtX3ByaXZhdGUgKmhpYm1jKQo+PiAt
ewo+PiAtwqDCoMKgIHN0cnVjdCBkcm1fdnJhbV9tbSAqdm1tOwo+PiAtwqDCoMKgIGludCByZXQ7
Cj4+IC3CoMKgwqAgc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGhpYm1jLT5kZXY7Cj4+IC3CoMKg
wqAgc3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lfZGV2KGRldi0+ZGV2KTsKPj4gLQo+PiAt
wqDCoMKgIHZtbSA9IGRybV92cmFtX2hlbHBlcl9hbGxvY19tbShkZXYsIHBjaV9yZXNvdXJjZV9z
dGFydChwZGV2LCAwKSwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGhpYm1jLT5mYl9zaXplKTsKPj4gLcKgwqDCoCBpZiAoSVNfRVJSKHZtbSkpIHsKPj4g
LcKgwqDCoMKgwqDCoMKgIHJldCA9IFBUUl9FUlIodm1tKTsKPj4gLcKgwqDCoMKgwqDCoMKgIGRy
bV9lcnIoZGV2LCAiRXJyb3IgaW5pdGlhbGl6aW5nIFZSQU0gTU07ICVkXG4iLCByZXQpOwo+PiAt
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4gLcKgwqDCoCB9Cj4+IC0KPj4gLcKgwqDCoCBy
ZXR1cm4gMDsKPj4gLX0KPj4gLQo+PiAtdm9pZCBoaWJtY19tbV9maW5pKHN0cnVjdCBoaWJtY19k
cm1fcHJpdmF0ZSAqaGlibWMpCj4+IC17Cj4+IC3CoMKgwqAgaWYgKCFoaWJtYy0+ZGV2LT52cmFt
X21tKQo+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+PiAtCj4+IC3CoMKgwqAgZHJtX3ZyYW1f
aGVscGVyX3JlbGVhc2VfbW0oaGlibWMtPmRldik7Cj4+IC19Cj4+IC0KPj4gLWludCBoaWJtY19k
dW1iX2NyZWF0ZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUsIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX21vZGVfY3JlYXRlX2R1
bWIgKmFyZ3MpCj4+IC17Cj4+IC3CoMKgwqAgcmV0dXJuIGRybV9nZW1fdnJhbV9maWxsX2NyZWF0
ZV9kdW1iKGZpbGUsIGRldiwgMCwgMTI4LCBhcmdzKTsKPj4gLX0KPj4gLQo+PiAtY29uc3Qgc3Ry
dWN0IGRybV9tb2RlX2NvbmZpZ19mdW5jcyBoaWJtY19tb2RlX2Z1bmNzID0gewo+PiAtwqDCoMKg
IC5tb2RlX3ZhbGlkID0gZHJtX3ZyYW1faGVscGVyX21vZGVfdmFsaWQsCj4+IC3CoMKgwqAgLmF0
b21pY19jaGVjayA9IGRybV9hdG9taWNfaGVscGVyX2NoZWNrLAo+PiAtwqDCoMKgIC5hdG9taWNf
Y29tbWl0ID0gZHJtX2F0b21pY19oZWxwZXJfY29tbWl0LAo+PiAtwqDCoMKgIC5mYl9jcmVhdGUg
PSBkcm1fZ2VtX2ZiX2NyZWF0ZSwKPj4gLX07Cj4+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

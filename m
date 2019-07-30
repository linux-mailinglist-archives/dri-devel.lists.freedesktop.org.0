Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 514027AA80
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 16:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA0A6E52D;
	Tue, 30 Jul 2019 14:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C3A6E52D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 14:03:55 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:60991
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hsSjJ-0001FW-7g; Tue, 30 Jul 2019 16:03:53 +0200
Subject: Re: [PATCH 1/3] drm/tinydrm/Kconfig: Remove menuconfig DRM_TINYDRM
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20190725105132.22545-1-noralf@tronnes.org>
 <20190725105132.22545-2-noralf@tronnes.org>
 <20190730135302.GA12424@arch-x1c3>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <45d73a17-2197-6d31-923f-93af4bfd895a@tronnes.org>
Date: Tue, 30 Jul 2019 16:03:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730135302.GA12424@arch-x1c3>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=vI9y22HUeN3grDos/YE24jjqPpit2SQltXzPaU9Q7Xg=; 
 b=NZYxMzNsWqk50VKE68hezH1Oohc+UzwSckdcWeqhu2zadwCMkVcdkUWy5DxFPuAvPydUnI3igYrlv/kgCBJFti2mdL9qVb5023SG/Ewgs1cqMxtS754ABhRW4cJscZTp5TtVVzb9l7fadUqpAmXTa+66vjpHrpEM6V86Lx3oaKfI3OJSo2BuQbPTI0Ryg3blkkqpaXqw7wIuQJRC8pBO2do79AnBLVi2Loy6kK6pWSGnoNqtYMZUCwzfG87yOJO/7EuX4B3V0hhTuBQRgjODhjF8UCG0t/YHqwlWIOka7IsMi+GtvlsvI44fteFH8O2L0XJEotssvQM6bBkJ/mhq8Q==;
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 hdegoede@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMzAuMDcuMjAxOSAxNS41Mywgc2tyZXYgRW1pbCBWZWxpa292Ogo+IE9uIDIwMTkvMDcv
MjUsIE5vcmFsZiBUcsO4bm5lcyB3cm90ZToKPj4gVGhpcyBtYWtlcyB0aGUgdGlueSBkcml2ZXJz
IHZpc2libGUgYnkgZGVmYXVsdCB3aXRob3V0IGhhdmluZyB0byBlbmFibGUgYQo+PiBrbm9iLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4K
Pj4gLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUgICAgICAgIHwgIDIgKy0KPj4gIGRy
aXZlcnMvZ3B1L2RybS90aW55ZHJtL0tjb25maWcgfCAzNyArKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0KPj4gIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMTcgZGVs
ZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUgYi9k
cml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUKPj4gaW5kZXggOThjNzMyZjkyNWM3Li4wYjMwYWZhNzUy
NGQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZQo+PiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vTWFrZWZpbGUKPj4gQEAgLTExMiw3ICsxMTIsNyBAQCBvYmotJChDT05GSUdf
RFJNX0FSQ1BHVSkrPSBhcmMvCj4+ICBvYmoteQkJCSs9IGhpc2lsaWNvbi8KPj4gIG9iai0kKENP
TkZJR19EUk1fWlRFKQkrPSB6dGUvCj4+ICBvYmotJChDT05GSUdfRFJNX01YU0ZCKQkrPSBteHNm
Yi8KPj4gLW9iai0kKENPTkZJR19EUk1fVElOWURSTSkgKz0gdGlueWRybS8KPj4gK29iai15CQkJ
Kz0gdGlueWRybS8KPj4gIG9iai0kKENPTkZJR19EUk1fUEwxMTEpICs9IHBsMTExLwo+PiAgb2Jq
LSQoQ09ORklHX0RSTV9UVkUyMDApICs9IHR2ZTIwMC8KPj4gIG9iai0kKENPTkZJR19EUk1fWEVO
KSArPSB4ZW4vCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGlueWRybS9LY29uZmln
IGIvZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vS2NvbmZpZwo+PiBpbmRleCA0MmIwNmY0Zjg5ODku
LmY4YzlhMGU3MWRkZSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rpbnlkcm0vS2Nv
bmZpZwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueWRybS9LY29uZmlnCj4+IEBAIC0xLDE2
ICsxLDkgQEAKPj4gICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+PiAt
bWVudWNvbmZpZyBEUk1fVElOWURSTQo+PiAtCXRyaXN0YXRlICJTdXBwb3J0IGZvciBzaW1wbGUg
ZGlzcGxheXMiCj4+IC0JZGVwZW5kcyBvbiBEUk0KPj4gLQlzZWxlY3QgRFJNX0tNU19IRUxQRVIK
Pj4gLQlzZWxlY3QgRFJNX0tNU19DTUFfSEVMUEVSCj4+IC0JaGVscAo+PiAtCSAgQ2hvb3NlIHRo
aXMgb3B0aW9uIGlmIHlvdSBoYXZlIGEgdGlueWRybSBzdXBwb3J0ZWQgZGlzcGxheS4KPj4gLQkg
IElmIE0gaXMgc2VsZWN0ZWQgdGhlIG1vZHVsZSB3aWxsIGJlIGNhbGxlZCB0aW55ZHJtLgo+PiAt
Cj4gRndpdyBJIHdvdWxkIGhhdmUgZ29uZSB3aXRoIEhhbidzIGlkZWEgb2YgbWFraW5nIHRoaXMg
aGlkZGVuLiBUaGF0IGhhcyBhCj4gbnVtYmVyIG9mIGFkdmFudGFnZXMsIGV2ZW4gaWYgd2UgZG9u
J3QgaGF2ZSBhIHNlcGFyYXRlIHRpbnlkcm0ua286Cj4gIC0gdGhlIHRpbnlkcm0gY29kZSBpcyBu
b3QgYnVpbGQgd2hlbiB0aGVyZSBhcmUgbm8gdXNlcnMKClRoZSB0aGluZyBpcywgdGhlcmUgaXMg
bm8gdGlueWRybSBjb2RlIGFueW1vcmUsIGl0J3MgYWxsIGJlZW4gcHV0IGludG8KdmFyaW91cyBj
b3JlIGhlbHBlcnMuIFRoZSBmb2xkZXIgZG9lcyBvbmx5IGNvbnRhaW4gcmVndWxhciBEUk0gZHJp
dmVycy4KVGhlIG9ubHkgdGhpbmcgc3BlY2lhbCBhYm91dCB0aGVtIGlzIHRoYXQgdGhleSBmaXQg
aW50byBvbmUgc291cmNlIGZpbGUuCgpOb3JhbGYuCgo+ICAtIHRoZSB0aW55ZHJtIGRlcGVuZGVu
Y2llcyBhcmUgY29udGFpbmVkIHdpdGhpbiBpdHNlbGYsIGluc3RlYWQgb2YKPiB1cGRhdGluZyA1
LTEwIGluZGl2aWR1YWwgZHJpdmVycwo+IAo+IFRoYXQgc2FpZCwgSSB3b24ndCBnZXQgaW4gdGhl
IHdheSBpZiBwZW9wbGUgbGlrZSB0aGlzIGFwcHJvYWNoIDstKQo+IAo+IEhUSAo+IC1FbWlsCj4g
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

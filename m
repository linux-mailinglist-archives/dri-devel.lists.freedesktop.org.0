Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E634918CDEF
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 13:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012936EB20;
	Fri, 20 Mar 2020 12:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0B46EB20
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 12:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mSTU6EN3+K0gQMLplfKZzW+ZlwZ8seyomZ5Eu3+Mu9M=; b=VZcW26+raRIdnKmF8tzdRHeRDK
 js2lIlzZ55Stp0iP+3RXlX/JwWaZ4PpCXERafkcZLmmErzGIjTQjs33LNGNG3QsVwDiuaQtZft2AF
 LUH+VdYTSc7S+X2tSbTnVHPCXdwprjXmJ+OZhQ6PnhGtfnIWhRWlLv4C11mVSpVzfgrj6Gf+TaS/w
 qRsC+I0DyfKXj4r3nCRf4Y9nX0NOWORAEmHGcjN3ZPp+k23AjMaGtXpWC1d0uvliOhi6IVVgrRnP6
 xUxBKiGvgDFX9HkogV0TwbHEiLGhylW9y1g7Mr/nALuEbPw8V5S0uHHaNQ2lOKN+BVPM12IHFUzTd
 xQduW2Xw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:51146
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1jFGsA-0002Wv-HT; Fri, 20 Mar 2020 13:35:34 +0100
Subject: Re: [PATCH] drm/mipi-dbi: Make mipi_dbi_command_stackbuf() data
 parameter const
To: Sam Ravnborg <sam@ravnborg.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <20200316164249.6234-1-geert+renesas@glider.be>
 <20200320122831.GA20506@ravnborg.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <dae0f969-8cff-ce81-678f-6d1a0a2e7228@tronnes.org>
Date: Fri, 20 Mar 2020 13:35:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200320122831.GA20506@ravnborg.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjAuMDMuMjAyMCAxMy4yOCwgc2tyZXYgU2FtIFJhdm5ib3JnOgo+IEhpIE5vcmFsZi4K
PiAKPiBPbiBNb24sIE1hciAxNiwgMjAyMCBhdCAwNTo0Mjo0OVBNICswMTAwLCBHZWVydCBVeXR0
ZXJob2V2ZW4gd3JvdGU6Cj4+IG1pcGlfZGJpX2NvbW1hbmRfc3RhY2tidWYoKSBjb3BpZXMgdGhl
IHBhc3NlZCBidWZmZXIgZGF0YSwgc28gaXQgY2FuIGJlCj4+IGNvbnN0Lgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+IAo+
IE9LIHRvIG1lcmdlPwo+IExvb2tzIGdvb2QgdG8gbWUgYW5kIGJ1aWxkIGRpZCBub3QgYnJlYWsu
CgpTdXJlLCBJIHBsYW5uZWQgdG8gbG9vayBhdCBpdCB0aGlzIHdlZWtlbmQsIGJ1dCBpZiB5b3Ug
Y2FuIGFwcGx5IGl0LCBncmVhdC4KClJldmlld2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFs
ZkB0cm9ubmVzLm9yZz4KCk5vcmFsZi4KCj4gCj4gCVNhbQo+IAo+PiAtLS0KPj4gIGRyaXZlcnMv
Z3B1L2RybS9kcm1fbWlwaV9kYmkuYyB8IDMgKystCj4+ICBpbmNsdWRlL2RybS9kcm1fbWlwaV9k
YmkuaCAgICAgfCA1ICsrKy0tCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWlw
aV9kYmkuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kYmkuYwo+PiBpbmRleCA1NThiYWY5
ODlmNWE4NDMyLi44OWU5MTFjY2VhMDZjZjk5IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX21pcGlfZGJpLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RiaS5j
Cj4+IEBAIC0xNjksNyArMTY5LDggQEAgaW50IG1pcGlfZGJpX2NvbW1hbmRfYnVmKHN0cnVjdCBt
aXBpX2RiaSAqZGJpLCB1OCBjbWQsIHU4ICpkYXRhLCBzaXplX3QgbGVuKQo+PiAgRVhQT1JUX1NZ
TUJPTChtaXBpX2RiaV9jb21tYW5kX2J1Zik7Cj4+ICAKPj4gIC8qIFRoaXMgc2hvdWxkIG9ubHkg
YmUgdXNlZCBieSBtaXBpX2RiaV9jb21tYW5kKCkgKi8KPj4gLWludCBtaXBpX2RiaV9jb21tYW5k
X3N0YWNrYnVmKHN0cnVjdCBtaXBpX2RiaSAqZGJpLCB1OCBjbWQsIHU4ICpkYXRhLCBzaXplX3Qg
bGVuKQo+PiAraW50IG1pcGlfZGJpX2NvbW1hbmRfc3RhY2tidWYoc3RydWN0IG1pcGlfZGJpICpk
YmksIHU4IGNtZCwgY29uc3QgdTggKmRhdGEsCj4+ICsJCQkgICAgICBzaXplX3QgbGVuKQo+PiAg
ewo+PiAgCXU4ICpidWY7Cj4+ICAJaW50IHJldDsKPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJt
L2RybV9taXBpX2RiaS5oIGIvaW5jbHVkZS9kcm0vZHJtX21pcGlfZGJpLmgKPj4gaW5kZXggMzNm
MzI1ZjVhZjJiOTIxZi4uOTMzM2I5MDg2YzMwYmQzYyAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9k
cm0vZHJtX21pcGlfZGJpLmgKPj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX21pcGlfZGJpLmgKPj4g
QEAgLTE3MCw3ICsxNzAsOCBAQCBpbnQgbWlwaV9kYmlfc3BpX3RyYW5zZmVyKHN0cnVjdCBzcGlf
ZGV2aWNlICpzcGksIHUzMiBzcGVlZF9oeiwKPj4gIAo+PiAgaW50IG1pcGlfZGJpX2NvbW1hbmRf
cmVhZChzdHJ1Y3QgbWlwaV9kYmkgKmRiaSwgdTggY21kLCB1OCAqdmFsKTsKPj4gIGludCBtaXBp
X2RiaV9jb21tYW5kX2J1ZihzdHJ1Y3QgbWlwaV9kYmkgKmRiaSwgdTggY21kLCB1OCAqZGF0YSwg
c2l6ZV90IGxlbik7Cj4+IC1pbnQgbWlwaV9kYmlfY29tbWFuZF9zdGFja2J1ZihzdHJ1Y3QgbWlw
aV9kYmkgKmRiaSwgdTggY21kLCB1OCAqZGF0YSwgc2l6ZV90IGxlbik7Cj4+ICtpbnQgbWlwaV9k
YmlfY29tbWFuZF9zdGFja2J1ZihzdHJ1Y3QgbWlwaV9kYmkgKmRiaSwgdTggY21kLCBjb25zdCB1
OCAqZGF0YSwKPj4gKwkJCSAgICAgIHNpemVfdCBsZW4pOwo+PiAgaW50IG1pcGlfZGJpX2J1Zl9j
b3B5KHZvaWQgKmRzdCwgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsCj4+ICAJCSAgICAgIHN0
cnVjdCBkcm1fcmVjdCAqY2xpcCwgYm9vbCBzd2FwKTsKPj4gIC8qKgo+PiBAQCAtMTg3LDcgKzE4
OCw3IEBAIGludCBtaXBpX2RiaV9idWZfY29weSh2b2lkICpkc3QsIHN0cnVjdCBkcm1fZnJhbWVi
dWZmZXIgKmZiLAo+PiAgICovCj4+ICAjZGVmaW5lIG1pcGlfZGJpX2NvbW1hbmQoZGJpLCBjbWQs
IHNlcS4uLikgXAo+PiAgKHsgXAo+PiAtCXU4IGRbXSA9IHsgc2VxIH07IFwKPj4gKwljb25zdCB1
OCBkW10gPSB7IHNlcSB9OyBcCj4+ICAJbWlwaV9kYmlfY29tbWFuZF9zdGFja2J1ZihkYmksIGNt
ZCwgZCwgQVJSQVlfU0laRShkKSk7IFwKPj4gIH0pCj4+ICAKPj4gLS0gCj4+IDIuMTcuMQo+Pgo+
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

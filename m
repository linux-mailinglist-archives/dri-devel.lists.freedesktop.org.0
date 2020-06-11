Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B171F61C6
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 08:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F378B6E1D7;
	Thu, 11 Jun 2020 06:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2336E19B;
 Thu, 11 Jun 2020 06:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id A17B63F779;
 Thu, 11 Jun 2020 08:35:52 +0200 (CEST)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=AFeb6hmD; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KomFUyqB_aXg; Thu, 11 Jun 2020 08:35:51 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 1E08D3F740;
 Thu, 11 Jun 2020 08:35:49 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 7216F360305;
 Thu, 11 Jun 2020 08:35:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1591857349; bh=vBPwF5IELzgGpUCmIwuag0xGDxNp12dRu+wDOYbe0C4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=AFeb6hmD/b4StBi+W32PKDeBKohgNrQsJiebeZelLeV/9EDnvETrUNkA/HOHBtoSa
 +uBRz2YSs8UD9ukOREB5a9P52X4kBgK76dwuiOuT+EIjIJcOXyZ3MQlrHwltd8Lglr
 kMqGIvSZvxXHQ2KUj142qr8SBPaPgCSULPALmeQQ=
Subject: Re: [PATCH 1/6] drm/ttm: Add unampping of the entire device address
 space
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
References: <f36c1fa1-bbee-477a-9cb2-ed2726f27eef@email.android.com>
 <eb9e5896-1f16-2102-350a-1e64d9af7ea8@shipmail.org>
 <b415e3d1-eed9-9b11-b8c1-c85c7b57eb93@amd.com>
 <ce6f6109-67df-e3d0-d56e-3f5c27df40a0@amd.com>
 <20200610153020.GZ20149@phenom.ffwll.local>
 <715ad9d4-7763-382e-237e-8daab42eff46@shipmail.org>
 <52eec123-3fb1-843d-4ede-1fa0daeaa8ce@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <36ee0021-3044-4ae9-0d13-cbc1aba03022@shipmail.org>
Date: Thu, 11 Jun 2020 08:35:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <52eec123-3fb1-843d-4ede-1fa0daeaa8ce@amd.com>
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "michel@daenzer.net" <michel@daenzer.net>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMTAvMjAgMTE6MTkgUE0sIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+Cj4gT24gNi8x
MC8yMCA0OjMwIFBNLCBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpIHdyb3RlOgo+Pgo+PiBPbiA2
LzEwLzIwIDU6MzAgUE0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+PiBPbiBXZWQsIEp1biAxMCwg
MjAyMCBhdCAwNDowNTowNFBNICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+IEFt
IDEwLjA2LjIwIHVtIDE1OjU0IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+Cj4+Pj4+
IE9uIDYvMTAvMjAgNjoxNSBBTSwgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKSB3cm90ZToKPj4+
Pj4+Cj4+Pj4+PiBPbiA2LzkvMjAgNzoyMSBQTSwgS29lbmlnLCBDaHJpc3RpYW4gd3JvdGU6Cj4+
Pj4+Pj4KPj4+Pj4+PiBBbSAwOS4wNi4yMDIwIDE4OjM3IHNjaHJpZWIgIkdyb2R6b3Zza3ksIEFu
ZHJleSIKPj4+Pj4+PiA8QW5kcmV5Lkdyb2R6b3Zza3lAYW1kLmNvbT46Cj4+Pj4+Pj4KPj4+Pj4+
Pgo+Pj4+Pj4+IMKgwqDCoMKgIE9uIDYvNS8yMCAyOjQwIFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdy
b3RlOgo+Pj4+Pj4+IMKgwqDCoMKgID4gQW0gMDUuMDYuMjAgdW0gMTY6Mjkgc2NocmllYiBBbmRy
ZXkgR3JvZHpvdnNreToKPj4+Pj4+PiDCoMKgwqDCoCA+Pgo+Pj4+Pj4+IMKgwqDCoMKgID4+IE9u
IDUvMTEvMjAgMjo0NSBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4+PiDCoMKgwqDC
oCA+Pj4gQW0gMDkuMDUuMjAgdW0gMjA6NTEgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+
Pj4+PiDCoMKgwqDCoCA+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IAo+Pj4+
Pj4+IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+Pj4+Pj4+IMKgwqDCoMKgID4+Pj4gLS0t
Cj4+Pj4+Pj4gwqDCoMKgwqAgPj4+PiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIHwgMjIg
KysrKysrKysrKysrKysrKysrKysrLQo+Pj4+Pj4+IMKgwqDCoMKgID4+Pj4gaW5jbHVkZS9kcm0v
dHRtL3R0bV9ib19kcml2ZXIuaCB8IDIgKysKPj4+Pj4+PiDCoMKgwqDCoCA+Pj4+IMKgIDIgZmls
ZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4+Pj4+IMKgwqDC
oMKgID4+Pj4KPj4+Pj4+PiDCoMKgwqDCoCA+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9iby5jCj4+Pj4+Pj4gwqDCoMKgwqAgPj4+PiBiL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvLmMKPj4+Pj4+PiDCoMKgwqDCoCA+Pj4+IGluZGV4IGM1YjUxNmYuLmVhZTYxY2Mg
MTAwNjQ0Cj4+Pj4+Pj4gwqDCoMKgwqAgPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9iby5jCj4+Pj4+Pj4gwqDCoMKgwqAgPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9iby5jCj4+Pj4+Pj4gwqDCoMKgwqAgPj4+PiBAQCAtMTc1MCw5ICsxNzUwLDI5IEBAIHZvaWQg
dHRtX2JvX3VubWFwX3ZpcnR1YWwoc3RydWN0Cj4+Pj4+Pj4gwqDCoMKgwqAgPj4+PiB0dG1fYnVm
ZmVyX29iamVjdCAqYm8pCj4+Pj4+Pj4gwqDCoMKgwqAgPj4+PiB0dG1fYm9fdW5tYXBfdmlydHVh
bF9sb2NrZWQoYm8pOwo+Pj4+Pj4+IMKgwqDCoMKgID4+Pj4gdHRtX21lbV9pb191bmxvY2sobWFu
KTsKPj4+Pj4+PiDCoMKgwqDCoCA+Pj4+IMKgIH0KPj4+Pj4+PiDCoMKgwqDCoCA+Pj4+ICtFWFBP
UlRfU1lNQk9MKHR0bV9ib191bm1hcF92aXJ0dWFsKTsKPj4+Pj4+PiDCoMKgwqDCoCA+Pj4+IMKg
ICt2b2lkIHR0bV9ib191bm1hcF92aXJ0dWFsX2FkZHJlc3Nfc3BhY2Uoc3RydWN0Cj4+Pj4+Pj4g
wqDCoMKgwqAgdHRtX2JvX2RldmljZSAqYmRldikKPj4+Pj4+PiDCoMKgwqDCoCA+Pj4+ICt7Cj4+
Pj4+Pj4gwqDCoMKgwqAgPj4+PiArwqDCoMKgIHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAq
bWFuOwo+Pj4+Pj4+IMKgwqDCoMKgID4+Pj4gK8KgwqDCoCBpbnQgaTsKPj4+Pj4+PiDCoMKgwqDC
oCA+Pj4+IC1FWFBPUlRfU1lNQk9MKHR0bV9ib191bm1hcF92aXJ0dWFsKTsKPj4+Pj4+PiDCoMKg
wqDCoCA+Pj4KPj4+Pj4+PiDCoMKgwqDCoCA+Pj4+ICvCoMKgwqAgZm9yIChpID0gMDsgaSA8IFRU
TV9OVU1fTUVNX1RZUEVTOyBpKyspIHsKPj4+Pj4+PiDCoMKgwqDCoCA+Pj4+ICvCoMKgwqDCoMKg
wqDCoCBtYW4gPSAmYmRldi0+bWFuW2ldOwo+Pj4+Pj4+IMKgwqDCoMKgID4+Pj4gK8KgwqDCoMKg
wqDCoMKgIGlmIChtYW4tPmhhc190eXBlICYmIG1hbi0+dXNlX3R5cGUpCj4+Pj4+Pj4gwqDCoMKg
wqAgPj4+PiArIHR0bV9tZW1faW9fbG9jayhtYW4sIGZhbHNlKTsKPj4+Pj4+PiDCoMKgwqDCoCA+
Pj4+ICvCoMKgwqAgfQo+Pj4+Pj4+IMKgwqDCoMKgID4+Pgo+Pj4+Pj4+IMKgwqDCoMKgID4+PiBZ
b3Ugc2hvdWxkIGRyb3AgdGhhdCBpdCB3aWxsIGp1c3QgcmVzdWx0IGluIGEgZGVhZGxvY2sKPj4+
Pj4+PiDCoMKgwqDCoCB3YXJuaW5nIGZvcgo+Pj4+Pj4+IMKgwqDCoMKgID4+PiBOb3V2ZWF1IGFu
ZCBoYXMgbm8gZWZmZWN0IGF0IGFsbC4KPj4+Pj4+PiDCoMKgwqDCoCA+Pj4KPj4+Pj4+PiDCoMKg
wqDCoCA+Pj4gQXBhcnQgZnJvbSB0aGF0IGxvb2tzIGdvb2QgdG8gbWUsCj4+Pj4+Pj4gwqDCoMKg
wqAgPj4+IENocmlzdGlhbi4KPj4+Pj4+PiDCoMKgwqDCoCA+Pgo+Pj4+Pj4+IMKgwqDCoMKgID4+
Cj4+Pj4+Pj4gwqDCoMKgwqAgPj4gQXMgSSBhbSBjb25zaWRlcmluZyB0byByZS1pbmNsdWRlIHRo
aXMgaW4gVjIgb2YgdGhlCj4+Pj4+Pj4gwqDCoMKgwqAgcGF0Y2hzZXRzLCBjYW4KPj4+Pj4+PiDC
oMKgwqDCoCA+PiB5b3UgY2xhcmlmeSBwbGVhc2Ugd2h5IHRoaXMgd2lsbCBoYXZlIG5vIGVmZmVj
dCBhdCBhbGwgPwo+Pj4+Pj4+IMKgwqDCoMKgID4KPj4+Pj4+PiDCoMKgwqDCoCA+IFRoZSBsb2Nr
cyBhcmUgZXhjbHVzaXZlIGZvciBOb3V2ZWF1IHRvIGFsbG9jYXRlL2ZyZWUgdGhlIGlvCj4+Pj4+
Pj4gwqDCoMKgwqAgYWRkcmVzcwo+Pj4+Pj4+IMKgwqDCoMKgID4gc3BhY2UuCj4+Pj4+Pj4gwqDC
oMKgwqAgPgo+Pj4+Pj4+IMKgwqDCoMKgID4gU2luY2Ugd2UgZG9uJ3QgZG8gdGhpcyBoZXJlIHdl
IGRvbid0IG5lZWQgdGhlIGxvY2tzLgo+Pj4+Pj4+IMKgwqDCoMKgID4KPj4+Pj4+PiDCoMKgwqDC
oCA+IENocmlzdGlhbi4KPj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gwqDCoMKgwqAgU28gYmFzaWNh
bGx5IGNhbGxpbmcgdW5tYXBfbWFwcGluZ19yYW5nZSBkb2Vzbid0IHJlcXVpcmUgCj4+Pj4+Pj4g
YW55IGV4dHJhCj4+Pj4+Pj4gwqDCoMKgwqAgbG9ja2luZyBhcm91bmQgaXQgYW5kIHdoYXRldmVy
IGxvY2tzIGFyZSB0YWtlbiB3aXRoaW4gdGhlIAo+Pj4+Pj4+IGZ1bmN0aW9uCj4+Pj4+Pj4gwqDC
oMKgwqAgc2hvdWxkIGJlIGVub3VnaCA/Cj4+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4g
SSB0aGluayBzbywgeWVzLgo+Pj4+Pj4+Cj4+Pj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Pj4gWWVzLCB0
aGF0J3MgdHJ1ZS4gSG93ZXZlciwgd2l0aG91dCB0aGUgYm8gcmVzZXJ2YXRpb24sIG5vdGhpbmcg
c3RvcHMKPj4+Pj4+IGEgUFRFIGZyb20gYmVpbmcgaW1tZWRpYXRlbHkgcmUtZmF1bHRlZCBiYWNr
IGFnYWluLiBFdmVuIHdoaWxlCj4+Pj4+PiB1bm1hcF9tYXBwaW5nX3JhbmdlKCkgaXMgcnVubmlu
Zy4KPj4+Pj4+Cj4+Pj4+IENhbiB5b3UgZXhwbGFpbiBtb3JlIG9uIHRoaXMgLSBzcGVjaWZpY2Fs
bHksIHdoaWNoIGZ1bmN0aW9uIHRvIAo+Pj4+PiByZXNlcnZlCj4+Pj4+IHRoZSBCTywgd2h5IEJP
IHJlc2VydmF0aW9uIHdvdWxkIHByZXZlbnQgcmUtZmF1bHQgb2YgdGhlIFBURSA/Cj4+Pj4+Cj4+
Pj4gVGhvbWFzIGlzIHRhbGtpbmcgYWJvdXQgdHRtX2JvX3Jlc2VydmVyKCkvdHRtX2JvX3VucmVz
ZXJ2ZSgpLCBidXQgCj4+Pj4gd2UgZG9uJ3QKPj4+PiBuZWVkIHRoaXMgYmVjYXVzZSB3ZSB1bm1h
cCBldmVyeXRoaW5nIGJlY2F1c2UgdGhlIHdob2xlIGRldmljZSBpcyAKPj4+PiBnb25lIGFuZAo+
Pj4+IG5vdCBqdXN0IG1hbmlwdWxhdGUgYSBzaW5nbGUgQk8uCj4+Pj4KPj4+Pj4+IFNvIHRoZSBk
ZXZpY2UgcmVtb3ZlZCBmbGFnIG5lZWRzIHRvIGJlIGFkdmVydGl6ZWQgYmVmb3JlIHRoaXMKPj4+
Pj4+IGZ1bmN0aW9uIGlzIHJ1biwKPj4+Pj4+Cj4+Pj4+IEkgaW5kZWVkIGludGVuZCB0byBjYWxs
IHRoaXPCoCByaWdodCBhZnRlciBjYWxsaW5nIGRybV9kZXZfdW5wbHVnIGZyb20KPj4+Pj4gYW1k
Z3B1X3BjaV9yZW1vdmUgd2hpbGUgYWRkaW5nIGRybV9kZXZfZW50ZXIvZXhpdCBpbiAKPj4+Pj4g
dHRtX2JvX3ZtX2ZhdWx0IChvcgo+Pj4+PiBpbiBhbWRncHUgc3BlY2lmaWMgd3JhcHBlciBzaW5j
ZSBJIGRvbid0IHNlZSBob3cgY2FuIEkgYWNjZXNzIHN0cnVjdAo+Pj4+PiBkcm1fZGV2aWNlIGZy
b20gdHRtX2JvX3ZtX2ZhdWx0KSBhbmQgdGhpcyBpbiBteSB1bmRlcnN0YW5kaW5nIHNob3VsZAo+
Pj4+PiBzdG9wIGEgUFRFIGZyb20gYmVpbmcgcmUtZmF1bHRlZCBiYWNrIGFzIHlvdSBwb2ludGVk
IG91dCAtIHNvIGFnYWluIEkKPj4+Pj4gZG9uJ3Qgc2VlIGhvd8KgIGJvIHJlc2VydmF0aW9uIHdv
dWxkIHByZXZlbnQgaXQgc28gaXQgbG9va3MgbGlrZSBJIGFtCj4+Pj4+IG1pc3Npbmcgc29tZXRo
aW5nLi4uCj4+Pj4+Cj4+Pj4+Cj4+Pj4+PiAocGVyaGFwcyB3aXRoIGEgbWVtb3J5IGJhcnJpZXIg
cGFpcikuCj4+Pj4+Pgo+Pj4+PiBkcm1fZGV2X3VucGx1ZyBhbmQgZHJtX2Rldl9lbnRlci9leGl0
IGFyZSBSQ1Ugc3luY2hyb25pemVkIGFuZCBzbyBJCj4+Pj4+IGRvbid0IHRoaW5rIHJlcXVpcmUg
YW55IGV4dHJhIG1lbW9yeSBiYXJyaWVycyBmb3IgdmlzaWJpbGl0eSBvZiB0aGUKPj4+Pj4gcmVt
b3ZlZCBmbGFnIGJlaW5nIHNldAo+Pj4+Pgo+Pj4+IEFzIGZhciBhcyBJIGNhbiBzZWUgdGhhdCBz
aG91bGQgYmUgcGVyZmVjdGx5IHN1ZmZpY2llbnQuCj4+PiBPbmx5IGlmIHlvdSBoYXZlIGEgZHJt
X2Rldl9lbnRlci9leGl0IHBhaXIgaW4geW91ciBmYXVsdCBoYW5kbGVyLgo+Pj4gT3RoZXJ3aXNl
IHlvdSdyZSBzdGlsbCBvcGVuIHRvIHRoZSByYWNlcyBUaG9tYXMgZGVzY3JpYmVkLiBCdXQgYXNp
ZGUgCj4+PiBmcm9tCj4+PiB0aGF0IHRoZSBkcm1fZGV2X3VucGx1ZyBzdHVmZiBoYXMgYWxsIHRo
ZSBiYXJyaWVycyBhbmQgc3R1ZmYgdG8gbWFrZSAKPj4+IHN1cmUKPj4+IG5vdGhpbmcgZXNjYXBl
cy4KPj4+Cj4+PiBGYWlsdXJlIHRvIGRybV9kZXZfZW50ZXIgY291bGQgdGhlbiBhbHNvIHRyaWdn
ZXIgdGhlIHNwZWNpYWwgY2FzZSAKPj4+IHdoZXJlIHdlCj4+PiBwdXQgYSBkdW1teSBwYWdlIGlu
IHBsYWNlLgo+Pj4gLURhbmllbAo+Pgo+PiBIbW0sIFllcywgaW5kZWVkIGFkdmVydGl6aW5nIHRo
ZSBmbGFnIGJlZm9yZSB0aGUgY2FsbCB0byAKPj4gdW5tYXBfbWFwcGluZ19yYW5nZSBpc24ndCBl
bm91Z2gsIHNpbmNlIHRoZXJlIG1pZ2h0IGJlIGZhdWx0IGhhbmRsZXJzIAo+PiBydW5uaW5nIHRo
YXQgaGF2ZW4ndCBwaWNrZWQgdXAgdGhlIGZsYWcgd2hlbiB1bm1hcF9tYXBwaW5nX3JhbmdlIGlz
IAo+PiBsYXVuY2hlZC4KPgo+Cj4gSWYgeW91IG1lYW4gdGhvc2UgZmF1bHQgaGFuZGxlcnMgdGhh
dCB3ZXJlIGluIHByb2dyZXNzIHdoZW4gdGhlIGZsYWcgCj4gKGRybV9kZXZfdW5wbHVnKSB3YXMg
c2V0IGluIGFtZGdwdV9wY2lfcmVtb3ZlIHRoZW4gYXMgbG9uZyBhcyBpIHdyYXAgCj4gdGhlIGVu
dGlyZSBmYXVsdCBoYW5kbGVyIChwcm9iYWJseSB1c2luZyBhbWRncHUgc3BlY2lmaWMgLmZhdWx0
IGhvb2sgCj4gYXJvdW5kIHR0bV9ib192bV9mYXVsdCkgd2l0aCBkcm1fZGV2X2VudGVyL2V4aXQg
cGFpciB0aGVuIAo+IGRybV9kZXZfdW5wbHVnLT5zeW5jaHJvbml6ZV9zcmN1IHdpbGwgYmxvY2sg
dW50aWwgdGhvc2UgaW4gcHJvZ3Jlc3MgCj4gZmF1bHRzIGhhdmUgY29tcGxldGVkIGFuZCBvbmx5
IGFmdGVyIHRoaXMgaSB3aWxsIGNhbGwgCj4gdW5tYXBfbWFwcGluZ19yYW5nZS4gU2hvdWxkIHRo
aXMgYmUgZW5vdWdoID8KPgo+IEFuZHJleQo+Cj4KWWVzLCBJIGJlbGlldmUgc28uIEFsdGhvdWdo
IEkgc3VzcGVjdCB5b3UgbWlnaHQgdHJpcCBsb2NrZGVwIHdpdGggCnJldmVyc2UgbG9ja2luZyBv
cmRlciBhZ2FpbnN0IHRoZSBtbWFwX3NlbSB3aGljaCBpcyBhIGNvbnN0YW50IHBhaW4gaW4gCmZh
dWx0IGhhbmRsZXJzLiBJZiB0aGF0J3MgdGhlIGNhc2UsIHlvdSBtaWdodCBiZSBhYmxlIHRvIGlu
dHJvZHVjZSAKYW5vdGhlciBzcmN1IGxvY2sgZm9yIHRoaXMgc3BlY2lhbCBwdXJwb3NlIGFuZCBz
eW5jaHJvbml6ZSBqdXN0IGJlZm9yZSAKdGhlIGFkZHJlc3Mtc3BhY2Utd2lkZSB1bm1hcF9tYXBw
aW5nX3JhbmdlKCkuIElmIGl0IHR1cm5zIG91dCB0aGF0IGFuIAphZGRyZXNzIHNwYWNlIHNyY3Ug
bG9jayBsaWtlIHRoaXMgaXMgcmVhbGx5IG5lZWRlZCwgd2Ugc2hvdWxkIGZvbGxvdyAKRGFuaWVs
J3Mgc3VnZ2VzdGlvbiBhbmQgdHJ5IHRvIHVzZSBpdCBmcm9tIGRybS13aWRlIGhlbHBlcnMuCgov
VGhvbWFzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2826B203D3
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 12:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5938932A;
	Thu, 16 May 2019 10:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3BF238932A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 10:45:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E43D319BF;
 Thu, 16 May 2019 03:45:18 -0700 (PDT)
Received: from [10.1.196.75] (e110467-lin.cambridge.arm.com [10.1.196.75])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D8F1D3F703;
 Thu, 16 May 2019 03:45:17 -0700 (PDT)
Subject: Re: [EXT] Re: [v1] drm/arm/mali-dp: Disable checking for required
 pixel clock rate
To: Wen He <wen.he_1@nxp.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "liviu.dudau@arm.com" <liviu.dudau@arm.com>
References: <20190515024348.43642-1-wen.he_1@nxp.com>
 <3f87b2a7-c7e8-0597-2f62-d421aa6ccaa5@arm.com>
 <AM0PR04MB4865435E9FA2D61E2D9A238EE20A0@AM0PR04MB4865.eurprd04.prod.outlook.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <edd9dc6c-aba2-3881-3121-efee388b47cf@arm.com>
Date: Thu, 16 May 2019 11:45:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <AM0PR04MB4865435E9FA2D61E2D9A238EE20A0@AM0PR04MB4865.eurprd04.prod.outlook.com>
Content-Language: en-GB
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
Cc: Leo Li <leoyang.li@nxp.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTYvMDUvMjAxOSAxMDo0MiwgV2VuIEhlIHdyb3RlOgo+IAo+IAo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBSb2JpbiBNdXJwaHkgW21haWx0bzpyb2Jpbi5tdXJwaHlA
YXJtLmNvbV0KPj4gU2VudDogMjAxOeW5tDXmnIgxNuaXpSAxOjE0Cj4+IFRvOiBXZW4gSGUgPHdl
bi5oZV8xQG54cC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOwo+PiBsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaXZpdS5kdWRhdUBhcm0uY29tCj4+IENjOiBMZW8g
TGkgPGxlb3lhbmcubGlAbnhwLmNvbT4KPj4gU3ViamVjdDogW0VYVF0gUmU6IFt2MV0gZHJtL2Fy
bS9tYWxpLWRwOiBEaXNhYmxlIGNoZWNraW5nIGZvciByZXF1aXJlZCBwaXhlbAo+PiBjbG9jayBy
YXRlCj4+Cj4+IENhdXRpb246IEVYVCBFbWFpbAo+Pgo+PiBPbiAxNS8wNS8yMDE5IDAzOjQyLCBX
ZW4gSGUgd3JvdGU6Cj4+PiBEaXNhYmxlIGNoZWNraW5nIGZvciByZXF1aXJlZCBwaXhlbCBjbG9j
ayByYXRlIGlmIEFSQ0hfTEFZRVJTQ1BBRSBpcwo+Pj4gZW5hYmxlLgo+Pj4KPj4+IFNpZ25lZC1v
ZmYtYnk6IEFsaXNvbiBXYW5nIDxhbGlzb24ud2FuZ0BueHAuY29tPgo+Pj4gU2lnbmVkLW9mZi1i
eTogV2VuIEhlIDx3ZW4uaGVfMUBueHAuY29tPgo+Pj4gLS0tCj4+PiBjaGFuZ2UgaW4gZGVzY3Jp
cHRpb246Cj4+PiAgICAgICAgLSBUaGlzIGNoZWNrIHRoYXQgb25seSBzdXBwb3J0ZWQgb25lIHBp
eGVsIGNsb2NrIHJlcXVpcmVkIGNsb2NrIHJhdGUKPj4+ICAgICAgICBjb21wYXJlIHdpdGggZHRz
IG5vZGUgdmFsdWUuIGJ1dCB3ZSBoYXZlIHN1cHBvcnRzIDQgcGl4ZWwgY2xvY2sKPj4+ICAgICAg
ICBmb3IgbHMxMDI4YSBib2FyZC4KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Ny
dGMuYyB8IDIgKysKPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPj4+Cj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfY3J0Yy5jCj4+PiBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2NydGMuYwo+Pj4gaW5kZXggNTZhYWQyODg2NjZlLi5i
Yjc5MjIzZDk5ODEgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9j
cnRjLmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vbWFsaWRwX2NydGMuYwo+Pj4gQEAg
LTM2LDExICszNiwxMyBAQCBzdGF0aWMgZW51bSBkcm1fbW9kZV9zdGF0dXMKPj4+IG1hbGlkcF9j
cnRjX21vZGVfdmFsaWQoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+Pj4KPj4+ICAgICAgICBpZiAo
cmVxX3JhdGUpIHsKPj4+ICAgICAgICAgICAgICAgIHJhdGUgPSBjbGtfcm91bmRfcmF0ZShod2Rl
di0+cHhsY2xrLCByZXFfcmF0ZSk7Cj4+PiArI2lmbmRlZiBDT05GSUdfQVJDSF9MQVlFUlNDQVBF
Cj4+Cj4+IFdoYXQgYWJvdXQgbXVsdGlwbGF0Zm9ybSBidWlsZHM/IFRoZSBrZXJuZWwgY29uZmln
IGRvZXNuJ3QgdGVsbCB5b3Ugd2hhdAo+PiBoYXJkd2FyZSB5b3UncmUgYWN0dWFsbHkgcnVubmlu
ZyBvbi4KPj4KPiAKPiBIaSBSb2JpbiwKPiAKPiBUaGFua3MgZm9yIHlvdXIgcmVwbHkuCj4gCj4g
SW4gZmFjdCwgT25seSBvbmUgcGxhdGZvcm0gaW50ZWdyYXRlcyB0aGlzIElQIHdoZW4gQ09ORklH
X0FSQ0hfTEFZRVJTQ0FQRSBpcyBzZXQuCj4gQWx0aG91Z2ggdGhpcyBhcmUgbm90IGdvb2Qgd2F5
cywgYnV0IEkgdGhpbmsgaXQgd29uJ3QgYmUgYSBwcm9ibGVtIHVuZGVyIG11bHRpcGxhdGZvcm0g
YnVpbGRzLgoKTXkgcG9pbnQgaXMgdGhhdCBBUkNIX0xBWUVSU0NBUEUgaXMgZ29pbmcgdG8gYmUg
ZW5hYmxlZCBpbiBkaXN0cmlidXRpb24gCmtlcm5lbHMgYWxvbmcgd2l0aCBldmVyeXRoaW5nIGVs
c2UsIHNvIHlvdSdyZSBlZmZlY3RpdmVseSByZW1vdmluZyB0aGlzIApjaGVjayBmb3IgYWxsIG90
aGVyIHZlbmRvcnMnIE1hbGktRFAgaW1wbGVtZW50YXRpb25zIGFzIHdlbGwsIHdoaWNoIGlzIApw
cm9iYWJseSBub3QgT0suCgpGdXJ0aGVybW9yZSwgaWYgTFMxMDI4QSByZWFsbHkgb25seSBzdXBw
b3J0cyA0IHNwZWNpZmljIG1vZGVzIGFzIHRoZSBCU1AgCmRvY3VtZW50YXRpb24gSSBmb3VuZCBj
bGFpbXMsIHRoZW4gc3VyZWx5IHlvdSdkIHdhbnQgYSAqbW9yZSogc3BlY2lmaWMgCmNoZWNrIGhl
cmUsIHJhdGhlciB0aGFuIG5vIGNoZWNrIGF0IGFsbD8KClJvYmluLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

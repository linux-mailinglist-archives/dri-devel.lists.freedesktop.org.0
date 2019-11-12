Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F66F9C9F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 22:52:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4233A6E52A;
	Tue, 12 Nov 2019 21:52:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C19899AB;
 Tue, 12 Nov 2019 21:52:51 +0000 (UTC)
Received: from localhost (unknown [69.71.4.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1991620818;
 Tue, 12 Nov 2019 21:52:51 +0000 (UTC)
Date: Tue, 12 Nov 2019 15:52:49 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH V3 0/3] drm: replace magic numbers
Message-ID: <20191112215249.GA214212@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR12MB1813200B2297DB19D1921A83F7770@CY4PR12MB1813.namprd12.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573595571;
 bh=PkD7kozdq2k/ZSyLZ865j/R/PKysg7H3vyHzIHb35IM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=XfDpUs2+mCT6Tu1Su3Sfzl6nCJBIR/YUImx1TOoKhirMGvnLPd0r7RTcQc+BAj1gT
 ydYvDW6OObycoi4ztocywwoxYYIXrJD+NE6Ob+Lr7LpalawqZQMyENlHel9+x8dUnZ
 FlN/1pPXPv3WZuTl/hsFDswydjTpnpPT5XdMkaVk=
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
Cc: Frederick Lawler <fred@fredlawl.com>, David Airlie <airlied@linux.ie>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMDc6MzU6NTNQTSArMDAwMCwgRGV1Y2hlciwgQWxleGFu
ZGVyIHdyb3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IGFtZC1n
ZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZgo+
ID4gQmpvcm4gSGVsZ2Fhcwo+ID4gU2VudDogVHVlc2RheSwgTm92ZW1iZXIgMTIsIDIwMTkgMTI6
MzUgUE0KPiA+IFRvOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5j
b20+OyBLb2VuaWcsIENocmlzdGlhbgo+ID4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IFpo
b3UsIERhdmlkKENodW5NaW5nKQo+ID4gPERhdmlkMS5aaG91QGFtZC5jb20+OyBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAbGludXguaWU+OyBEYW5pZWwgVmV0dGVyCj4gPiA8ZGFuaWVsQGZmd2xsLmNo
Pgo+ID4gQ2M6IEZyZWRlcmljayBMYXdsZXIgPGZyZWRAZnJlZGxhd2wuY29tPjsgbGludXgtcGNp
QHZnZXIua2VybmVsLm9yZzsKPiA+IE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFlbnplci5uZXQ+
OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBkcmktCj4gPiBkZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBCam9ybiBIZWxnYWFz
Cj4gPiA8YmhlbGdhYXNAZ29vZ2xlLmNvbT47IElsaWEgTWlya2luIDxpbWlya2luQGFsdW0ubWl0
LmVkdT4KPiA+IFN1YmplY3Q6IFtQQVRDSCBWMyAwLzNdIGRybTogcmVwbGFjZSBtYWdpYyBudW1i
ZXJzCj4gPiAKPiA+IEZyb206IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+Cj4g
PiAKPiA+IGFtZGdwdSBhbmQgcmFkZW9uIGRvIGEgYml0IG9mIG11Y2tpbmcgd2l0aCB0aGUgUENJ
ZSBMaW5rIENvbnRyb2wgMiByZWdpc3RlciwKPiA+IHNvbWUgb2YgaXQgdXNpbmcgaGFyZC1jb2Rl
ZCBtYWdpYyBudW1iZXJzLiAgVGhlIGlkZWEgaGVyZSBpcyB0byByZXBsYWNlCj4gPiB0aG9zZSB3
aXRoICNkZWZpbmVzLgo+ID4gCj4gPiBTaW5jZSB2MjoKPiA+ICAgLSBGaXggYSBncHVfY2ZnMiBj
YXNlIGluIGFtZGdwdS9zaS5jIHRoYXQgSSBoYWQgbWlzc2VkCj4gPiAgIC0gU2VwYXJhdGUgb3V0
IHRoZSBmdW5jdGlvbmFsIGNoYW5nZXMgZm9yIGJldHRlciBiaXNlY3Rpb24gKHRoYW5rcywKPiA+
ICAgICBNaWNoZWwhKQo+ID4gICAtIEFkZCAjZGVmaW5lcyBpbiBhIHBhdGNoIGJ5IHRoZW1zZWx2
ZXMgKHNvIGEgR1BVIHJldmVydCB3b3VsZG4ndCBicmVhawo+ID4gICAgIG90aGVyIHBvdGVudGlh
bCB1c2VycykKPiA+ICAgLSBTcXVhc2ggYWxsIHRoZSBtYWdpYyBudW1iZXIgLT4gI2RlZmluZSBj
aGFuZ2VzIGludG8gb25lIHBhdGNoCj4gPiAKPiA+IFNpbmNlIHYxOgo+ID4gICAtIEFkZCBteSBz
aWduZWQtb2ZmLWJ5IGFuZCBBbGV4J3MgcmV2aWV3ZWQtYnkuCj4gPiAKPiAKPiBTZXJpZXMgaXM6
Cj4gUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
PiAKPiBJJ20gaGFwcHkgdG8gaGF2ZSBpdCBnbyB0aHJvdWdoIHdoYXRldmVyIHRyZWUgaXMgZWFz
aWVzdCBmb3IgeW91LgoKT0ssIHRoYW5rcyEgIEkgYXBwbGllZCB5b3VyIHJldmlld2VkLWJ5IGFu
ZCBwdXQgdGhlc2Ugb24gbXkgcGNpL21pc2MKYnJhbmNoIGZvciB2NS41LCBpbiBob3BlcyB0aGF0
IHdlIG1pZ2h0IGdldCBhIGZvbGxvd3VwIHBhdGNoIGZyb20gRnJlZAphbG9uZyB0aGUgbGluZXMg
b2YgNjEzM2I5MjA0YzBhICgiY3hnYjQ6IFByZWZlcgpwY2llX2NhcGFiaWxpdHlfcmVhZF93b3Jk
KCkiKQoKPiA+IEJqb3JuIEhlbGdhYXMgKDMpOgo+ID4gICBQQ0k6IEFkZCAjZGVmaW5lcyBmb3Ig
RW50ZXIgQ29tcGxpYW5jZSwgVHJhbnNtaXQgTWFyZ2luCj4gPiAgIGRybTogY29ycmVjdCBUcmFu
c21pdCBNYXJnaW4gbWFza3MKPiA+ICAgZHJtOiByZXBsYWNlIG51bWJlcnMgd2l0aCBQQ0lfRVhQ
X0xOS0NUTDIgZGVmaW5pdGlvbnMKPiA+IAo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2Npay5jIHwgMjIgKysrKysrKysrKysrKystLS0tLS0tLQo+ID4gZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvc2kuYyAgfCAyMiArKysrKysrKysrKysrKy0tLS0tLS0tCj4gPiAgZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9jaWsuYyAgICAgfCAyMiArKysrKysrKysrKysrKy0tLS0tLS0tCj4gPiAg
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaS5jICAgICAgfCAyMiArKysrKysrKysrKysrKy0tLS0t
LS0tCj4gPiAgaW5jbHVkZS91YXBpL2xpbnV4L3BjaV9yZWdzLmggICAgfCAgMiArKwo+ID4gIDUg
ZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pCj4gPiAKPiA+
IC0tCj4gPiAyLjI0LjAucmMxLjM2My5nYjFiY2NkM2UzZC1nb29nCj4gPiAKPiA+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBhbWQtZ2Z4IG1haWxp
bmcgbGlzdAo+ID4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

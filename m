Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DECC3455
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 14:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B6D89AAE;
	Tue,  1 Oct 2019 12:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFE089A92;
 Tue,  1 Oct 2019 12:34:50 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4639E3845;
 Tue,  1 Oct 2019 08:34:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 01 Oct 2019 08:34:49 -0400
X-ME-Sender: <xms:6EeTXaSmkTPeD39T2XSHPMTkp-WY5YDiPJ21ZP7vgHNsw9n7GZVnGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrgeeggdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjfgesthekredttderjeenucfhrhhomhepgfhrihgt
 ucfgnhhgvghsthhrohhmuceovghrihgtsegvnhhgvghsthhrohhmrdgthheqnecuffhomh
 grihhnpehmrghilhdqrghrtghhihhvvgdrtghomhenucfkphepudelvddrudelkedrudeh
 uddriedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpegvrhhitgesvghnghgvshhtrhhomh
 drtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:6EeTXRq02QouW8yYwmy576gHcxbzTACIpWRw9FmcOKU-dphW9L1tPA>
 <xmx:6EeTXcdHOdUg3DLb04l7Uhsu16HO86uiu8934PHotLo8U-m-CLnLAA>
 <xmx:6EeTXUiivZCN_PjMxsSFybsxeAROleH822OQOgl6Mn1QOHG761oRwg>
 <xmx:6UeTXTH9iBGYqKpoM4s6_nphjJRotkce6hOVza1LY-Dt49PiVZuoKQ>
Received: from engestrom.ch (unknown [192.198.151.62])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0DE7680063;
 Tue,  1 Oct 2019 08:34:45 -0400 (EDT)
Date: Tue, 1 Oct 2019 13:34:44 +0100
From: Eric Engestrom <eric@engestrom.ch>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 0/9] drm/print: add and use drm_debug_enabled()
Message-ID: <20191001123444.xtp7wpickwjus4m2@engestrom.ch>
References: <20190926074814.rdzxjmut6izqf4d5@engestrom.ch>
 <875zl8d8x0.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875zl8d8x0.fsf@intel.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=engestrom.ch; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm2; bh=Z
 CFe4FL8sKu9d7TI/87cwj1RdFKXW/Wz6HLGUaYeNnI=; b=m1Gp8kez+Mhsuoi4T
 59CzNqI2xz6J0ri2zucjgbPVBpCPvNnfW1I72iQXt6Ccox2FP7sJPMmq5zedAaAe
 u1VPItyQPpjyQRFyXLABtQZVCX0P0uH2FzLn2NmqOuLaYJOSN5VU47/lOSUjOe4l
 10L619Byl8rGD3Bll6LxYMBHAxSGFk/BmfxVcx4iWebAmS73+F/KI7qTkY1uHh/u
 C0WCeIIomn/3XwiQbITJhzqN1mrZD5QWT4nuM3wTpeVcbSZ/r9g4GRzGfwndPcn/
 wMgufUBTsqR1gaqBjh/OsDNHbxl/DETQWdRettbCLJMo/c3CU6qnDoAlsIiSYJcu
 dGINA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=ZCFe4FL8sKu9d7TI/87cwj1RdFKXW/Wz6HLGUaYeN
 nI=; b=dFkaVP4Bn7gJ7omMjlTiFoZ3cnoGb1zVvbfEcidS6uuin4hSKTI/FQkpM
 zrpw4kCydNUWW7HHlHwEnvhRD7bC8pH6CPFbq78ZkvF4NIT1YfBW+xrlFYJFuZOQ
 oPz3LA8UEE7ymCFnz42v4YbUbuOgW2PGFPpIwXDhwnycwEArIuViJveZv9+mc1A2
 +27Xa/s1R5THXnZEuGDNHmWyN/l73sFel1UlCWLVpA/KJUcbo1S4UxTA4lC2Rqit
 RGfhGguKP2Fa3PcNJbplp03LkW3LzoonmSTQXJeTngjexH5pZEZ3mTvq9vJlbKss
 tgX+5AvE3XsovZdSMK6O9JZjXKo4A==
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlc2RheSwgMjAxOS0xMC0wMSAxNDowMzo1NSArMDMwMCwgSmFuaSBOaWt1bGEgd3JvdGU6
Cj4gT24gVGh1LCAyNiBTZXAgMjAxOSwgRXJpYyBFbmdlc3Ryb20gPGVyaWNAZW5nZXN0cm9tLmNo
PiB3cm90ZToKPiA+IE9uIFR1ZXNkYXksIDIwMTktMDktMjQgMTU6NTg6NTYgKzAzMDAsIEphbmkg
TmlrdWxhIHdyb3RlOgo+ID4+IEhpIGFsbCwgdjIgb2YgWzFdLCBhIGxpdHRsZSByZWZhY3Rvcmlu
ZyBhcm91bmQgZHJtX2RlYnVnIGFjY2VzcyB0bwo+ID4+IGFic3RyYWN0IGl0IGJldHRlci4gVGhl
cmUgc2hvdWxkbid0IGJlIGFueSBmdW5jdGlvbmFsIGNoYW5nZXMuCj4gPj4gCj4gPj4gSSdkIGFw
cHJlY2lhdGUgYWNrcyBmb3IgbWVyZ2luZyB0aGUgbG90IHZpYSBkcm0tbWlzYy4gSWYgdGhlcmUg
YXJlIGFueQo+ID4+IG9iamVjdGlvbnMgdG8gdGhhdCwgd2UnbGwgbmVlZCB0byBwb3N0cG9uZSB0
aGUgbGFzdCBwYXRjaCB1bnRpbAo+ID4+IGV2ZXJ5dGhpbmcgaGFzIGJlZW4gbWVyZ2VkIGFuZCBj
b252ZXJ0ZWQgaW4gZHJtLW5leHQuCj4gPj4gCj4gPj4gQlIsCj4gPj4gSmFuaS4KPiA+PiAKPiA+
PiBDYzogRXJpYyBFbmdlc3Ryb20gPGVyaWMuZW5nZXN0cm9tQGludGVsLmNvbT4KPiA+PiBDYzog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+ID4+IENjOiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gPj4gQ2M6IERhdmlkIChDaHVu
TWluZykgWmhvdSA8RGF2aWQxLlpob3VAYW1kLmNvbT4KPiA+PiBDYzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiA+PiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgo+
ID4+IENjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4+IENjOiBSb2IgQ2xhcmsg
PHJvYmRjbGFya0BnbWFpbC5jb20+Cj4gPj4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVu
Pgo+ID4+IENjOiBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZwo+ID4+IENjOiBmcmVlZHJl
bm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPj4gQ2M6IEZyYW5jaXNjbyBKZXJleiA8Y3Vycm9q
ZXJlekByaXNldXAubmV0Pgo+ID4+IENjOiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25p
eC5kZT4KPiA+PiBDYzogUnVzc2VsbCBLaW5nIDxsaW51eCtldG5hdml2QGFybWxpbnV4Lm9yZy51
az4KPiA+PiBDYzogQ2hyaXN0aWFuIEdtZWluZXIgPGNocmlzdGlhbi5nbWVpbmVyQGdtYWlsLmNv
bT4KPiA+PiBDYzogZXRuYXZpdkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+PiAKPiA+PiAKPiA+
PiBbMV0gaHR0cDovL21pZC5tYWlsLWFyY2hpdmUuY29tL2NvdmVyLjE1NjgzNzUxODkuZ2l0Lmph
bmkubmlrdWxhQGludGVsLmNvbQo+ID4+IAo+ID4+IEphbmkgTmlrdWxhICg5KToKPiA+PiAgIGRy
bS9wcmludDogbW92ZSBkcm1fZGVidWcgdmFyaWFibGUgdG8gZHJtX3ByaW50LltjaF0KPiA+PiAg
IGRybS9wcmludDogYWRkIGRybV9kZWJ1Z19lbmFibGVkKCkKPiA+PiAgIGRybS9pOTE1OiB1c2Ug
ZHJtX2RlYnVnX2VuYWJsZWQoKSB0byBjaGVjayBmb3IgZGVidWcgY2F0ZWdvcmllcwo+ID4+ICAg
ZHJtL3ByaW50OiByZW5hbWUgZHJtX2RlYnVnIHRvIF9fZHJtX2RlYnVnIHRvIGRpc2NvdXJhZ2Ug
dXNlCj4gPgo+ID4gVGhlIGFib3ZlIGZvdXIgcGF0Y2hlcyBhcmU6Cj4gPiBSZXZpZXdlZC1ieTog
RXJpYyBFbmdlc3Ryb20gPGVyaWNAZW5nZXN0cm9tLmNoPgo+ID4KPiA+IERpZCB5b3UgY2hlY2sg
dG8gbWFrZSBzdXJlIHRoZSBgdW5saWtlbHkoKWAgaXMgcHJvcGFnYXRlZCBjb3JyZWN0bHkKPiA+
IG91dHNpZGUgdGhlIGBkcm1fZGVidWdfZW5hYmxlZCgpYCBjYWxsPwo+IAo+IEkgZGlkIG5vdy4K
PiAKPiBIYXZpbmcgZHJtX2RlYnVnX2VuYWJsZWQoKSBhcyBhIG1hY3JvIHZzLiBhcyBhbiBpbmxp
bmUgZnVuY3Rpb24gZG9lcyBub3QKPiBzZWVtIHRvIG1ha2UgYSBkaWZmZXJlbmNlLCBzbyBJIHRo
aW5rIHRoZSBpbmxpbmUgaXMgY2xlYXJseSBwcmVmZXJyYWJsZS4KCkFncmVlZCA6KQoKPiAKPiBI
b3dldmVyLCBmb3IgZXhhbXBsZQo+IAo+IAl1bmxpa2VseShmb28gJiYgZHJtX2RlYnVnICYgRFJN
X1VUX0RQKQo+IAo+IGRvZXMgcHJvZHVjZSBjb2RlIGRpZmZlcmVudCBmcm9tCj4gCj4gCShmb28g
JiYgZHJtX2RlYnVnX2VuYWJsZWQoRFJNX1VUX0RQKSkKPiAKPiBpbmRpY2F0aW5nIHRoYXQgdGhl
IHVubGlrZWx5KCkgd2l0aGluIGRybV9kZWJ1Z19lbmFibGVkKCkgZG9lcyBub3QKPiBwcm9wYWdh
dGUgdG8gdGhlIHdob2xlIGNvbmRpdGlvbi4gSXQncyBwb3NzaWJsZSB0byByZXRhaW4gdGhlIHNh
bWUKPiBhc3NlbWJseSBvdXRwdXQgd2l0aAo+IAo+IAkodW5saWtlbHkoZm9vKSAmJiBkcm1fZGVi
dWdfZW5hYmxlZChEUk1fVVRfRFApKQo+IAo+IGJ1dCBpdCdzIHVuY2xlYXIgdG8gbWUgd2hldGhl
ciB0aGlzIGlzIHJlYWxseSB3b3J0aCBpdCwgZWl0aGVyCj4gcmVhZGFiaWxpdHkgb3IgcGVyZm9y
bWFuY2Ugd2lzZS4KPiAKPiBUaG91Z2h0cz8KClRoYXQga2luZCBvZiBjb2RlIG9ubHkgaGFwcGVu
cyAyIHRpbWVzLCBib3RoIGluCmRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMg
KGluIHBhdGNoIDIvOSksIHJpZ2h0PwoKSSB0aGluayB5b3VyIHN1Z2dlc3Rpb24gaXMgdGhlIHJp
Z2h0IHRoaW5nIHRvIGRvIGhlcmU6CgotICAgaWYgKHVubGlrZWx5KHJldCAmJiBkcm1fZGVidWcg
JiBEUk1fVVRfRFApKSB7CisgICBpZiAodW5saWtlbHkocmV0KSAmJiBkcm1fZGVidWdfZW5hYmxl
ZChEUk1fVVRfRFApKSB7CgpJdCBkb2Vzbid0IHJlYWxseSBjb3N0IG11Y2ggaW4gcmVhZGFiaWxp
dHkgKGVzcGVjaWFsbHkgY29tcGFyZWQgdG8gd2hhdAppdCB3YXMgYmVmb3JlKSwgYW5kIHdoZXRo
ZXIgaXQncyBpbXBvcnRhbnQgcGVyZm9ybWFuY2Ugd2lzZSBJIGNvdWxkbid0CnRlbGwsIGJ1dCBJ
IHRoaW5rIGl0J3MgYmVzdCB0byBrZWVwIHRoZSBjb2RlIG9wdGltaXNlZCBhcyBpdCB3YXMgYmVm
b3JlCnVubGVzcyB0aGVyZSdzIGEgcmVhc29uIHRvIGRyb3AgaXQuCgpMeXVkZSBtaWdodCBrbm93
IG1vcmUgc2luY2Ugc2hlIHdyb3RlIDJmMDE1ZWM2ZWFiNjkzMDFmZGNmNSwgaWYgeW91IHdhbnQK
dG8gcGluZyBoZXI/Cgo+IAo+IEJSLAo+IEphbmkuCj4gCj4gCj4gLS0gCj4gSmFuaSBOaWt1bGEs
IEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

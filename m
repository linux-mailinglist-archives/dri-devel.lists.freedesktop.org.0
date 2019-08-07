Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 412098535C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 21:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CF48918F;
	Wed,  7 Aug 2019 19:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F558918F;
 Wed,  7 Aug 2019 19:01:12 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 93C9980486;
 Wed,  7 Aug 2019 21:01:10 +0200 (CEST)
Date: Wed, 7 Aug 2019 21:01:09 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Clark <robdclark@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH] drm/msm: Make DRM_MSM default to 'm'
Message-ID: <20190807190109.GA32503@ravnborg.org>
References: <1565198667-4300-1-git-send-email-jcrouse@codeaurora.org>
 <20190807173838.GB30025@ravnborg.org>
 <CAF6AEGv6EY5UBYF8D9tuSaMDvkdrBt+zvRxQA+V4PG6ZfKhUAg@mail.gmail.com>
 <20190807184648.GA30521@jcrouse1-lnx.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807184648.GA30521@jcrouse1-lnx.qualcomm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=LpQP-O61AAAA:8 a=-ipZeBXR2iWv2Qf4ONQA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=pioyyrs4ZptJ924tMmac:22
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9yZGFuL1JvYi4KCk9uIFdlZCwgQXVnIDA3LCAyMDE5IGF0IDEyOjQ2OjQ5UE0gLTA2MDAs
IEpvcmRhbiBDcm91c2Ugd3JvdGU6Cj4gT24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMTE6MDg6NTNB
TSAtMDcwMCwgUm9iIENsYXJrIHdyb3RlOgo+ID4gT24gV2VkLCBBdWcgNywgMjAxOSBhdCAxMDoz
OCBBTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBI
aSBKb3JkYW4uCj4gPiA+IE9uIFdlZCwgQXVnIDA3LCAyMDE5IGF0IDExOjI0OjI3QU0gLTA2MDAs
IEpvcmRhbiBDcm91c2Ugd3JvdGU6Cj4gPiA+ID4gTW9zdCB1c2UgY2FzZXMgZm9yIERSTV9NU00g
d2lsbCBwcmVmZXIgdG8gYnVpbGQgYm90aCBEUk0gYW5kIE1TTV9EUk0gYXMKPiA+ID4gPiBtb2R1
bGVzIGJ1dCB0aGVyZSBhcmUgc29tZSBjYXNlcyB3aGVyZSBEUk0gbWlnaHQgYmUgYnVpbHQgaW4g
Zm9yIHdoYXRldmVyCj4gPiA+ID4gcmVhc29uIGFuZCBpbiB0aG9zZSBzaXR1YXRpb25zIGl0IGlz
IHByZWZlcmFibGUgdG8gc3RpbGwga2VlcCBNU00gYXMgYQo+ID4gPiA+IG1vZHVsZSBieSBkZWZh
dWx0IGFuZCBsZXQgdGhlIHVzZXIgZGVjaWRlIGlmIHRoZXkgX3JlYWxseV8gd2FudCB0byBidWls
ZAo+ID4gPiA+IGl0IGluLgo+ID4gPiA+Cj4gPiA+ID4gQWRkaXRpb25hbGx5IHNlbGVjdCBRQ09N
X0NPTU1BTkRfREIgZm9yIEFSQ0hfUUNPTSB0YXJnZXRzIHRvIG1ha2Ugc3VyZQo+ID4gPiA+IGl0
IGRvZXNuJ3QgZ2V0IG1pc3NlZCB3aGVuIHdlIG5lZWQgaXQgZm9yIGE2eHggdGFyZXRzLgo+ID4g
PiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVy
b3JhLm9yZz4KPiA+ID4gPiAtLS0KPiA+ID4gPgo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbXNt
L0tjb25maWcgfCAzICsrLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21zbS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL21zbS9LY29uZmlnCj4gPiA+ID4gaW5k
ZXggOWMzN2U0ZC4uM2IyMzM0YiAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL0tjb25maWcKPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL0tjb25maWcKPiA+
ID4gPiBAQCAtMTQsMTEgKzE0LDEyIEBAIGNvbmZpZyBEUk1fTVNNCj4gPiA+ID4gICAgICAgc2Vs
ZWN0IFNITUVNCj4gPiA+ID4gICAgICAgc2VsZWN0IFRNUEZTCj4gPiA+ID4gICAgICAgc2VsZWN0
IFFDT01fU0NNIGlmIEFSQ0hfUUNPTQo+ID4gPiA+ICsgICAgIHNlbGVjdCBRQ09NX0NPTU1BTkRf
REIgaWYgQVJDSF9RQ09NCj4gPiA+ID4gICAgICAgc2VsZWN0IFdBTlRfREVWX0NPUkVEVU1QCj4g
PiA+ID4gICAgICAgc2VsZWN0IFNORF9TT0NfSERNSV9DT0RFQyBpZiBTTkRfU09DCj4gPiA+ID4g
ICAgICAgc2VsZWN0IFNZTkNfRklMRQo+ID4gPiA+ICAgICAgIHNlbGVjdCBQTV9PUFAKPiA+ID4g
PiAtICAgICBkZWZhdWx0IHkKPiA+ID4gPiArICAgICBkZWZhdWx0IG0KPiA+ID4KPiA+ID4gQXMg
YSBnZW5lcmFsIGNvbW1lbnQgdGhlIHJpZ2h0IHRoaW5nIHdvdWxkIGJlIHRvIGRyb3AgdGhpcyBk
ZWZhdWx0Lgo+ID4gPiBBcyBpdCBpcyBub3cgdGhlIEtjb25maWcgc2F5cyB0aGF0IHdoZW4gRFJN
IGlzIHNlbGVjdGVkIHRoZW4gYWxsIG9mIHRoZQo+ID4gPiB3b3JsZCB3b3VsZCB0aGVuIGFsc28g
Z2V0IERSTV9NU00sIHdoaWNoIG9ubHkgYSBzbWFsbCBwYXJ0IG9mIHRoaXMgd29ybGQKPiA+ID4g
eW91IHNlZSBhbnkgYmVuZWZpdCBpbi4KPiA+ID4gU28gdGhleSBub3cgaGF2ZSB0byBkZS1zZWxl
Y3QgTVNNLgo+ID4gCj4gPiBJZiB0aGUgZGVmYXVsdCBpcyBkcm9wcGVkLCBpdCBzaG91bGQgcHJv
YmFibHkgYmUgYWNjb21wYW5pZWQgYnkgYWRkaW5nCj4gPiBDT05GSUdfRFJNX01TTT1tIHRvIGRl
ZmNvbmZpZydzLCBJIHRoaW5rClRoYXQgd291bGQgYmUgYmVzdC4gU28gdGhlIGRlZmNvbmZpZ3Mg
ZW5kIHVwIHdpdGggdGhlIHNhbWUgY29uZmlnIGFzCmJlZm9yZS4KCj4gCj4gSW4gZ2VuZXJhbCBJ
IHByZWZlciB0byBub3QgdXNlIGEgZGVmYXVsdCBidXQgdGhpcyBpcyB0aGUgb25seSBHUFUgZHJp
dmVyIGZvcgo+IEFSQ0hfUUNPTSBhbmQgSSB0aGluayBpdHMgc2FmZSB0byBzdGF5IHRoYXQgOTkl
IG9mIEFSQ0hfUUNPTSB1c2VycyB3b3VsZCBzZWxlY3QKPiB0aGlzIG1vZHVsZSBhbmQgdGhvc2Ug
dGhhdCB3b3VsZG4ndCB3aWxsIG9taXQgRFJNIGVudGlyZWx5Lgo+IAo+IEkgZmVlbCBpdCBpcyBu
ZXQgbmVnYXRpdmUgaWYgd2UgZHJvcHBlZCB0aGUgZGVmYXVsdCBidXQgdGhlbiBoYWQgdG8gdHVy
biBhcm91bmQKPiBhbmQgZW5hYmxlIGl0IGluIGV2ZXJ5IGRlZmNvbmZpZy4KImluIGV2ZXJ5IiBl
cXVhbHMgdGhyZWUgZGVmY29uZmlnczoKJCBnaXQgZ3JlcCBBUkNIX1FDT00gfCBncmVwIGRlZmNv
bmZpZwphcmNoL2FybS9jb25maWdzL211bHRpX3Y3X2RlZmNvbmZpZzpDT05GSUdfQVJDSF9RQ09N
PXkKYXJjaC9hcm0vY29uZmlncy9xY29tX2RlZmNvbmZpZzpDT05GSUdfQVJDSF9RQ09NPXkKYXJj
aC9hcm02NC9jb25maWdzL2RlZmNvbmZpZzpDT05GSUdfQVJDSF9RQ09NPXkKCglTYW0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

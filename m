Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFACE23FEB
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 20:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DEE28920C;
	Mon, 20 May 2019 18:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548B58920C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 18:06:44 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 552E8804F2;
 Mon, 20 May 2019 20:06:42 +0200 (CEST)
Date: Mon, 20 May 2019 20:06:40 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: drop drmP.h usage
Message-ID: <20190520180640.GA32368@ravnborg.org>
References: <20190519183636.19588-1-sam@ravnborg.org>
 <20190519183636.19588-3-sam@ravnborg.org>
 <20190519212235.GF5213@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190519212235.GF5213@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=hD80L64hAAAA:8 a=P1BnusSwAAAA:8 a=pGLkceISAAAA:8 a=OScXe70xAAAA:8
 a=gvl4HP8tAAAA:8 a=PJVCYEo6b95U6rA2bN4A:9 a=Sr80sZitZWugb66k:21
 a=g4roUTyQlpcC3FI5:21 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=D0XLA9XvdZm18NrgonBM:22 a=X7_D5SgixhGjaE2bLVSS:22
 a=tRkgsvjveJ3YVe9fnr1q:22
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
Cc: David Airlie <airlied@linux.ie>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>, dri-devel@lists.freedesktop.org,
 Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMTI6MjI6MzVBTSArMDMwMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiBIaSBTYW0sCj4gCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCj4gCj4gT24g
U3VuLCBNYXkgMTksIDIwMTkgYXQgMDg6MzY6MzZQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdyb3Rl
Ogo+ID4gRHJvcCB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgZHJtUC5oIGhlYWRlciBmaWxlLgo+ID4g
Cj4gPiBXaGlsZSB0b3VjaGluZyB0aGUgbGlzdCBvZiBpbmNsdWRlIGZpbGVzOgo+ID4gLSBEaXZp
ZGUgaW5jbHVkZSBmaWxlcyBpbiBibG9ja3Mgb2YgbGludXgvKiBkcm0vKiBldGMuCj4gPiAtIFNv
cnQgaW5kaXZpZHVhbCBibG9ja3Mgb2YgaW5jbHVkZSBmaWxlcwo+ID4gLSBSZW1vdmUgZHVwbGlj
YXRlZCBoZWFkZXIgZmlsZQo+ID4gCj4gPiB2MjoKPiA+IC0gQmUgY29uc2lzdGVudCBpbiB0aGUg
b3JkZXIgb2YgdGhlIGluY2x1ZGUgYmxvY2tzIChMYXVyZW50KQo+ID4gCj4gPiBTaWduZWQtb2Zm
LWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gPiBDYzogQW5kcnplaiBIYWpk
YSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KPiA+IENjOiBMYXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVk
QGxpbnV4LmllPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+IENj
OiBQZXRlciBTZW5uYSBUc2NodWRpbiA8cGV0ZXIuc2VubmFAZ21haWwuY29tPgo+ID4gQ2M6IE1h
cnRpbiBEb25uZWxseSA8bWFydGluLmRvbm5lbGx5QGdlLmNvbT4KPiA+IENjOiBNYXJ0eW4gV2Vs
Y2ggPG1hcnR5bi53ZWxjaEBjb2xsYWJvcmEuY28udWs+Cj4gCj4gUmV2aWV3ZWQtYnk6IExhdXJl
bnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiAKPiBCeSB0
aGUgd2F5LCBvbiBhIHNpZGUgbm90ZSwgSSBjYW1lIGFjcm9zcyBhIG5lYXQgdHJpY2sgcmVjZW50
bHkgdG8gaGVscAo+IG1ha2luZyBoZWFkZXJzIHNlbGYtY29udGFpbmVkLiBCeSBpbmNsdWRpbmcg
dGhlIGhlYWRlciByZWxhdGVkIHRvIGEgQwo+IGZpbGUgYXMgdGhlIHZlcnkgZmlyc3QgaGVhZGVy
LCB0aGUgY29tcGlsZXIgd2lsbCB0aHJvdyBhbiBlcnJvciBpZiB0aGUKPiBoZWFkZXIgaXMgbm90
IHNlbGYtY29udGFpbmVkLiBJdCB3b3VsZCBiZSBhIGJpdCBvZiBhbiBpbnRydXNpdmUgY2hhbmdl
Cj4gaW4gRFJNLCBidXQgbWF5YmUgc29tZXRoaW5nIHRvIGtlZXAgaW4gbWluZC4KCkluIHNvbWUg
cHJvamVjdHMgSSBoYXZlIHdvcmtlZCB3aXRoIHRoZSBydWxlIHdhcyB0byBpbmNsdWRlIHRoZSBt
b3N0CnNwZWNpZmljIGhlYWRlcnMgZmlyc3QgLSBzbyB3ZSB3b3VsZCBjYXVndGggZWFybHkgaWYg
YSBoZWFkZXIgZmlsZSBtaXNzZWQKc29tZXRoaW5nLgoKQnV0IGFzIGxvbmcgYXMgaGF2aW5nIGFs
bCBoZWFkZXIgZmlsZXMgc2VsZi1jb250YWluZWQgYXJlIG5vdCBhIGhhcmQKcnVsZSB3ZSBzaG91
bGQgbm90IHRyeSB0byBkbyBzb21ldGhpbmcgbGlrZSB0aGlzLgoKSSBvbmNlIHdlbnQgdGhyb3Vn
aCBhbGwgdGhlIGRybSBoZWFkZXIgZmlsZXMgdG8gbWFrZSB0aGVtIG1pbmltYWwgYW5kCnNlbGYt
Y29udGFpbmVkLgpCdXQgdGhpcyB0cmlnZ2VyZWQgYSBtYXNzaXZlIHVwZGF0ZSBvZiBhbGwgZHJt
IGRyaXZlcnMgLyBjb3JlIGZpbGVzCnNvIEkgc2tpcHBlZCB0aGF0IGFnYWluLiBUaGUgcGFpbi9n
YWluIHJhdGlvIHdhcyBmYXIgdG8gaGlnaC4KSnVzdCBtYWtpbmcgdGhlbSBhbGwgc2VsZi1jb250
YWluZWQgaXMgaXMgc21hbGxlciB0YXNrIHRoYXQgZG9lcwpub3QgYnJlYWsgdGhlIGJ1aWxkIC0g
YnV0IHVudGlsIG5vdyBJIGhhdmUgbm90IHNlZW4gYW55IGdvb2QgcmVhc29ucyAvCmRlbWFuZHMg
Zm9yIHRoaXMgc28gSSBoYXZlIGxlZnQgaXQuCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

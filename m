Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0EC9081A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 21:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04566E98C;
	Fri, 16 Aug 2019 19:12:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FF16E98C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 19:12:12 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 551C380608;
 Fri, 16 Aug 2019 21:12:10 +0200 (CEST)
Date: Fri, 16 Aug 2019 21:12:08 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 0/2] Fix module name clash with omapdrm and DRM panel
 modules
Message-ID: <20190816191208.GB29151@ravnborg.org>
References: <20190816122228.9475-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816122228.9475-1-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=kGE34rx2qVAYh8psuwQA:9 a=CjuIK1q_8ugA:10
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsCgpPbiBGcmksIEF1ZyAxNiwgMjAxOSBhdCAwMzoyMjoyNlBNICswMzAwLCBMYXVyZW50
IFBpbmNoYXJ0IHdyb3RlOgo+IEhlbGxvLAo+IAo+IFRoZSBwYXRjaCBzZXJpZXMgIltQQVRDSCB2
NCAwLzldIERSTSBwYW5lbCBkcml2ZXJzIGZvciBvbWFwZHJtIiBhZGRlZAo+IG5ldyBEUk0gcGFu
ZWwgZHJpdmVycyBmb3IgYSBzZXQgb2YgcGFuZWxzIHVzZWQgb24gT01BUCBwbGF0Zm9ybXMsIHdp
dGgKPiB0aGUgb21hcGRybSBhbmQgb21hcGZiMiBkcml2ZXJzLiBCb3RoIHRob3NlIGRyaXZlcnMg
Y29udGFpbgo+IG9tYXAtc3BlY2lmaWMgcGFuZWwgZHJpdmVycywgd2hpY2ggdGhlIG5ldyBEUk0g
cGFuZWwgZHJpdmVycyBhaW1zIHRvCj4gcmVwbGFjZSBmb3Igb21hcGRybS4gVGhlIG5ldyBkcml2
ZXJzIHVzZSB0aGUgc2FtZSBtb2R1bGUgbmFtZSBhcyB0aGUgb2xkCj4gb25lcyAod2l0aCBvbmUg
ZXhjZXB0aW9uKSwgcmVzdWx0aW5nIGluIG1vZHVsZSBuYW1lIGNsYXNoZXMuCj4gCj4gVGhpcyBu
ZWVkcyB0byBiZSBmaXhlZCBzZXBhcmF0ZWx5IGZvciBvbWFwZmIyIGFuZCBvbWFwZHJtLgo+IAo+
IEZvciBvbWFwZmIyLCB3ZSBjYW4gZGlzYWJsZSB0aGUgb21hcGZiMi1zcGVjaWZpYyBwYW5lbCBk
cml2ZXJzIGluCj4gS2NvbmZpZyB3aGVuIHRoZSBzdGFuZGFyZCBkcml2ZXJzIGFyZSBlbmFibGVk
LiBBcyBvbWFwZmIyIGFuZCBvbWFwZHJtCj4gYXJlIG11dHVhbGx5IGV4Y2x1c2l2ZSwgdGhlIERS
TSBwYW5lbCBkcml2ZXJzIGFyZSBub3QgdXNlZnVsIHdpdGgKPiBvbWFwZmIyIGluIGFueSBjYXNl
LiBUaGlzIGlzIGRvbmUgaW4gcGF0Y2ggMS8yLgo+IAo+IEZvciBvbWFwZHJtLCB3ZSBjYW4gc2lt
cGx5IGRyb3AgdGhlIG9tYXBkcm0tc3BlY2lmaWMgcGFuZWwgZHJpdmVycywgYXMKPiB0aGUgbmV3
IGRyaXZlcnMgcmVwbGFjZSB0aGVtLiBUaGlzIGlzIGRvbmUgaW4gcGF0Y2ggMi8yLCB3aGljaCB3
YXMKPiBhbHJlYWR5IHBhcnQgb2YgdGhlIGxhcmdlciBvbWFwZHJtIHBhdGNoIHNlcmllcyAiW1BB
VENIIDAwLzYwXSBkcm0vb21hcDoKPiBSZXBsYWNlIGN1c3RvbSBkaXNwbGF5IGRyaXZlcnMgd2l0
aCBkcm1fYnJpZGdlIGFuZCBkcm1fcGFuZWwiLgo+IAo+IExhdXJlbnQgUGluY2hhcnQgKDIpOgo+
ICAgdmlkZW86IG9tYXBmYjI6IE1ha2Ugc3RhbmRhcmQgYW5kIGN1c3RvbSBwYW5lbCBkcml2ZXJz
IG11dHVhbGx5Cj4gICAgIGV4Y2x1c2l2ZQo+ICAgZHJtL29tYXA6IGRpc3BsYXlzOiBSZW1vdmUg
dW51c2VkIHBhbmVsIGRyaXZlcnMKCkFwcGxpZWQgYW5kIHB1c2hlZCB0byBkcm0tbWlzYy1uZXh0
LgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

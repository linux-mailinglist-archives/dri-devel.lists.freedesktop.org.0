Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAFC9282C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 17:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C42C6E1BA;
	Mon, 19 Aug 2019 15:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD6E6E1BA
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 15:17:11 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 19E262003B;
 Mon, 19 Aug 2019 17:17:08 +0200 (CEST)
Date: Mon, 19 Aug 2019 17:17:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/2] video: omapfb2: Make standard and custom panel
 drivers mutually exclusive
Message-ID: <20190819151706.GA21252@ravnborg.org>
References: <20190816122228.9475-1-laurent.pinchart@ideasonboard.com>
 <20190816122228.9475-2-laurent.pinchart@ideasonboard.com>
 <96dc63bc-92b4-6d55-bbf5-006aab111bec@ti.com>
 <CGME20190816133300epcas3p344aaa1347aeea65da7015a2598ff51df@epcas3p3.samsung.com>
 <20190816133250.GI5020@pendragon.ideasonboard.com>
 <2b79b0e9-14bd-5add-a602-49ef1f1f577c@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2b79b0e9-14bd-5add-a602-49ef1f1f577c@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8
 a=sozttTNsAAAA:8 a=hD80L64hAAAA:8 a=zkIpfMf1qnjGKYiayyoA:9
 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22 a=aeg5Gbbo78KNqacMgKqU:22
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
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQmFydGxvbWllagoKT24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMDQ6MTY6MjZQTSArMDIwMCwg
QmFydGxvbWllaiBab2xuaWVya2lld2ljeiB3cm90ZToKPiAKPiBPbiA4LzE2LzE5IDM6MzIgUE0s
IExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPiBPbiBGcmksIEF1ZyAxNiwgMjAxOSBhdCAwNDoy
MDo0NlBNICswMzAwLCBUb21pIFZhbGtlaW5lbiB3cm90ZToKPiA+PiBPbiAxNi8wOC8yMDE5IDE1
OjIyLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4+PiBTdGFuZGFyZCBEUk0gcGFuZWwgZHJp
dmVycyBmb3Igc2V2ZXJhbCBwYW5lbHMgdXNlZCBieSBvbWFwZmIyIGFyZSBub3cKPiA+Pj4gYXZh
aWxhYmxlLiBUaGVpciBtb2R1bGUgbmFtZSBjbGFzaGVzIHdpdGggdGhlIG1vZHVsZXMgZnJvbQo+
ID4+PiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kaXNwbGF5cy8sIHBhcnQgb2YgdGhlIGRlcHJl
Y2F0ZWQgb21hcGZiMiBmYmRldgo+ID4+Cj4gPj4gU2hvdWxkbid0IHRoYXQgcGF0aCBiZSBkcml2
ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kaXNwbGF5cz8KPiA+IAo+ID4gQWJzb2x1dGVs
eSA6LSkgQ291bGQgdGhpcyBiZSBmaXhlZCB3aGVuIGFwcGx5aW5nID8gT3RoZXJ3aXNlIEknbGwK
PiA+IHN1Ym1pdCBhIHYyLgo+ID4gCj4gPj4+IGRyaXZlci4gQXMgb21hcGZiMiBjYW4gb25seSBi
ZSBjb21waWxlZCB3aGVuIHRoZSBvbWFwZHJtIGRyaXZlciBpcwo+ID4+PiBkaXNhYmxlZCwgYW5k
IHRoZSBEUk0gcGFuZWwgZHJpdmVycyBhcmUgdXNlbGVzcyBpbiB0aGF0IGNhc2UsIG1ha2UgdGhl
Cj4gPj4+IG9tYXBmYjIgcGFuZWxzIGRlcGVuZCBvbiB0aGUgc3RhbmRhcmQgRFJNIHBhbmVscyBi
ZWluZyBkaXNhYmxlZCB0byBmaXgKPiA+Pj4gdGhlIG5hbWUgY2xhc2guCj4gPj4+Cj4gPj4+IFNp
Z25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJv
YXJkLmNvbT4KPiA+Pj4gLS0tCj4gPj4+ICAgZHJpdmVycy92aWRlby9mYmRldi9vbWFwMi9vbWFw
ZmIvZGlzcGxheXMvS2NvbmZpZyB8IDUgKysrKysKPiA+Pj4gICAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspCj4gPj4KPiA+PiBDYydkIEJhcnRsb21pZWouCj4gCj4gVGhhbmtzIFRvbWku
Cj4gCj4gPiBPb3BzLCBzb3JyeSwgZm9yZ290IHRvIGRvIHRoYXQgOi1TCj4gPiAKPiA+PiBSZXZp
ZXdlZC1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KPiAKPiBBY2tl
ZC1ieTogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29t
PgoKSSB0b29rIHRoZSBsaWJlcnR5IHRvIGFwcGx5IGl0IGFscmVhZHkgb25seSB3aXRoIFRvbWkn
cyByLWIuCkxldCBtZSBrbm93IGlmIHlvdSB3YW50IG1lIHRvIHdhaXQgZm9yIHlvdXIgYWNrIGlu
IHRoZSBmdXR1cmUuClRoaXMgd2FzIHRvdWNoaW5nIHR3byBzdWItc3lzdGVtcyBhbmQgaXQgY2Fu
CmluIHN1Y2ggY2FzZXMgc29tZXRpbWVzIGJlIGEgY2hhbGxlbmdlIHRvIGdldCBhbGwgYWNrcy4K
CglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

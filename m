Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2061C7563
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 17:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7CF6E8A1;
	Wed,  6 May 2020 15:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BC06E8A1
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 15:53:27 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A240542;
 Wed,  6 May 2020 17:53:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1588780405;
 bh=FZL3UzlgiZlC3gydGO3GxyRmPe5XV61eLRKHOqGkBEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cuN863caji1YMQLJSqCYgsli5Vq39qbegv7yEMniTBM8nE//uPtb86i5v8NyQST8k
 5QefX1UL/NFihwI26EOXlnHAqpx37Fy7i3z1TGvui3aAo8UZ7tlB6ZdgOH0B/d0zO3
 RQejHxuVqbF8Eur5wglykify6gUQQlUlY9JWQkbE=
Date: Wed, 6 May 2020 18:53:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [RFC PATCH] dt-bindings: display: ti,tfp410.txt: convert to yaml
Message-ID: <20200506155320.GC15206@pendragon.ideasonboard.com>
References: <20200428092048.14939-1-ricardo.canuelo@collabora.com>
 <3e377c73-25a3-a7b3-0604-41c54d70039e@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3e377c73-25a3-a7b3-0604-41c54d70039e@ti.com>
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
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, kernel@collabora.com,
 Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taSwKCk9uIFR1ZSwgQXByIDI4LCAyMDIwIGF0IDEyOjQ5OjI4UE0gKzAzMDAsIFRvbWkg
VmFsa2VpbmVuIHdyb3RlOgo+IE9uIDI4LzA0LzIwMjAgMTI6MjAsIFJpY2FyZG8gQ2HDsXVlbG8g
d3JvdGU6Cj4gCj4gPiAyKSBUaGUgZGVmaW5pdGlvbiBvZiB0aSxkZXNrZXcgaW4gdGhlIG9yaWdp
bmFsIGJpbmRpbmcgc2VlbXMgdG8gYmUKPiA+IHRhaWxvcmVkIHRvIHRoZSBjdXJyZW50IGRyaXZl
ciBhbmQgdGhlIHdheSBpdCdzIGRlZmluZWQgbWF5IG5vdCBiZSB2ZXJ5Cj4gPiBEVC1mcmllbmRs
eS4KPiA+IAo+ID4gICAgVGhpcyBwYXJhbWV0ZXIgbWFwcyB0byBhIDMtYml0IGZpZWxkIGluIGEg
aGFyZHdhcmUgcmVnaXN0ZXIgdGhhdCB0YWtlcwo+ID4gICAgYSB2YWx1ZSBmcm9tIDAgdG8gNywg
c28gdGhlIFstNCwgM10gcmFuZ2UgZGVzY3JpYmVkIGZvciB0aGlzIHdvdWxkIG1hcAo+ID4gICAg
dG8gWzAwMCwgMTExXTogLTQgLT4gMDAwLCAtMyAtPiAwMDEsIC0yIC0+IDAxMCwgLi4uIDMgLT4g
MTExLgo+ID4gCj4gPiAgICBUaGVuLCB0aGUgZHJpdmVyIHBhcnNlcyB0aGUgcGFyYW1ldGVyICh1
bnNpZ25lZCkgYW5kIGNhc3RzIGl0IHRvIGEKPiA+ICAgIHNpZ25lZCBpbnRlZ2VyIHRvIGdldCBh
IG51bWJlciBpbiB0aGUgWy00LCAzXSByYW5nZS4KPiAKPiBJbnRlcmVzdGluZ2x5IHRoZSBjdXJy
ZW50IGV4YW1wbGUgaGFzIHRpLGRlc2tldyA9IDw0Pi4uLgo+IAo+ID4gICAgQSB2ZW5kb3Itc3Bl
Y2lmaWMgcHJvcGVydHkgbXVzdCBoYXZlIGEgdHlwZSBkZWZpbml0aW9uIGluIGpzb24tc2NoZW1h
LAo+ID4gICAgc28gaWYgSSB0cmFuc2xhdGUgdGhlIG9yaWdpbmFsIGJpbmRpbmdzIHNlbWFudGlj
cyBkaXJlY3RseSwgSSBzaG91bGQKPiA+ICAgIGRlZmluZSB0aSxkZXNrZXcgYXMgYW4gaW50MzIs
IGJ1dCB0aGlzIG1ha2VzIGR0X2JpbmRpbmdfY2hlY2sgZmFpbCBpZgo+ID4gICAgdGhlIHByb3Bl
cnR5IGhhcyBhIG5lZ2F0aXZlIHZhbHVlIGluIHRoZSBleGFtcGxlIGJlY2F1c2Ugb2YgdGhlCj4g
PiAgICBpbnRlcm5hbCByZXByZXNlbnRhdGlvbiBvZiBjZWxscyBhcyB1bnNpZ25lZCBpbnRlZ2Vy
czoKPiA+IAo+ID4gICAgICAgdGksZGVza2V3OjA6MDogNDI5NDk2NzI5MyBpcyBncmVhdGVyIHRo
YW4gdGhlIG1heGltdW0gb2YgMjE0NzQ4MzY0Nwo+IAo+IEkgZG9uJ3QgcXVpdGUgdW5kZXJzdGFu
ZCB0aGlzLiBXZSBjYW5ub3QgaGF2ZSBuZWdhdGl2ZSBudW1iZXJzIGluIGR0cyBmaWxlcz8gT3Ig
d2UgY2FuLCBidXQgCj4gZHRfYmluZGluZ19jaGVjayBkb2Vzbid0IGhhbmRsZSB0aGVtIGNvcnJl
Y3RseT8gT3IgdGhhdCBpbnQzMiBpcyBub3Qgc3VwcG9ydGVkIGluIHlhbWwgYmluZGluZ3M/Cj4g
Cj4gPiAgICBTbyBJIGNhbiB0aGluayBvZiB0d28gc29sdXRpb25zIHRvIHRoaXM6Cj4gPiAKPiA+
ICAgIGEpIEtlZXAgdGhlIHRpLGRlc2tldyBwcm9wZXJ0eSBhcyBhbiB1aW50MzIgYW5kIGRvY3Vt
ZW50IHRoZSB2YWxpZAo+ID4gICAgcmFuZ2UgKFstNCwgM10pIGluIHRoZSBwcm9wZXJ0eSBkZXNj
cmlwdGlvbiAodGhpcyBpcyB3aGF0IHRoaXMgcGF0Y2gKPiA+ICAgIGRvZXMgY3VycmVudGx5KS4K
PiA+IAo+ID4gICAgYikgUmVkZWZpbmUgdGhpcyBwcm9wZXJ0eSB0byBiZSBjbG9zZXIgdG8gdGhl
IGRhdGFzaGVldCBkZXNjcmlwdGlvbgo+ID4gICAgKGllLiB1bnNpZ25lZCBpbnRlZ2VycyBmcm9t
IDAgdG8gNykgYW5kIGFkYXB0IHRoZSBkcml2ZXIgYWNjb3JkaW5nbHkuCj4gPiAgICBUaGlzIHdv
dWxkIGFsc28gbGV0IHVzIGRlZmluZSBpdHMgcmFuZ2UgcHJvcGVybHkgdXNpbmcgbWluaW11bSBh
bmQKPiA+ICAgIG1heGltdW0gcHJvcGVydGllcyBmb3IgaXQuCj4gPiAKPiA+ICAgIEkgdGhpbmsg
KGIpIGlzIHRoZSByaWdodCB0aGluZyB0byBkbyBidXQgSSB3YW50IHRvIGtub3cgeW91cgo+ID4g
ICAgb3Bpbmlvbi4gQmVzaWRlcywgSSBkb24ndCBoYXZlIHRoaXMgaGFyZHdhcmUgYXQgaGFuZCBh
bmQgaWYgSSB1cGRhdGVkCj4gPiAgICB0aGUgZHJpdmVyIEkgd291bGRuJ3QgYmUgYWJsZSB0byB0
ZXN0IGl0Lgo+IAo+IEkgZG9uJ3QgdGhpbmsgYW55b25lIGhhcyB1c2VkIGRlc2tldyBwcm9wZXJ0
eSwgc28gSSBndWVzcyBjaGFuZ2luZyBpdCBpcyBub3Qgb3V0IG9mIHRoZSBxdWVzdGlvbi4KPiAK
PiBMYXVyZW50LCBkaWQgeW91IGhhdmUgYSBib2FyZCB0aGF0IG5lZWRzIGRlc2tldyB3aGVuIHlv
dSBhZGRlZCBpdCB0byB0ZnA0MTA/CgpJIGRpZG4ndCBpZiBJIHJlbWVtYmVyIGNvcnJlY3RseSwg
SSBqdXN0IG1hcHBlZCBpdCB0byB0aGUgaGFyZHdhcmUKZmVhdHVyZXMuIFRoZSBoYXJkd2FyZSBy
ZWdpc3RlciBpbmRlZWQgdGFrZXMgYSB2YWx1ZSBiZXR3ZWVuIDAgYW5kIDcsCmFuZCB0aGF0IGlz
IG1hcHBlZCB0byBbLTQsM10geCB0KFNURVApLiBJIGRvbid0IG1pbmQgZWl0aGVyIG9wdGlvbi4K
Ci0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK

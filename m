Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D252290819
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 21:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6236E98B;
	Fri, 16 Aug 2019 19:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E846E98B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 19:11:37 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 0B33280608;
 Fri, 16 Aug 2019 21:11:32 +0200 (CEST)
Date: Fri, 16 Aug 2019 21:11:31 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] video: omapfb2: Make standard and custom panel
 drivers mutually exclusive
Message-ID: <20190816191131.GA29151@ravnborg.org>
References: <20190816122228.9475-1-laurent.pinchart@ideasonboard.com>
 <20190816122228.9475-2-laurent.pinchart@ideasonboard.com>
 <20190816173105.GA9934@ravnborg.org>
 <20190816183905.GA17858@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816183905.GA17858@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8
 a=5eU4rEYU2QWPhtBerwQA:9 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22
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

SGkgTGF1cmVudC4KCk9uIEZyaSwgQXVnIDE2LCAyMDE5IGF0IDA5OjM5OjA1UE0gKzAzMDAsIExh
dXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gSGkgU2FtLAo+IAo+IE9uIEZyaSwgQXVnIDE2LCAyMDE5
IGF0IDA3OjMxOjA1UE0gKzAyMDAsIFNhbSBSYXZuYm9yZyB3cm90ZToKPiA+IEhpIExhdXJlbnQK
PiA+IAo+ID4gVGhhbmtzIGZvciBiZWF0aW5nIG1lIG9uIHRoaXMhCj4gPiAKPiA+IE9uIEZyaSwg
QXVnIDE2LCAyMDE5IGF0IDAzOjIyOjI3UE0gKzAzMDAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6
Cj4gPiA+IFN0YW5kYXJkIERSTSBwYW5lbCBkcml2ZXJzIGZvciBzZXZlcmFsIHBhbmVscyB1c2Vk
IGJ5IG9tYXBmYjIgYXJlIG5vdwo+ID4gPiBhdmFpbGFibGUuIFRoZWlyIG1vZHVsZSBuYW1lIGNs
YXNoZXMgd2l0aCB0aGUgbW9kdWxlcyBmcm9tCj4gPiA+IGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJt
L2Rpc3BsYXlzLywgcGFydCBvZiB0aGUgZGVwcmVjYXRlZCBvbWFwZmIyIGZiZGV2Cj4gPiA+IGRy
aXZlci4gQXMgb21hcGZiMiBjYW4gb25seSBiZSBjb21waWxlZCB3aGVuIHRoZSBvbWFwZHJtIGRy
aXZlciBpcwo+ID4gPiBkaXNhYmxlZCwgYW5kIHRoZSBEUk0gcGFuZWwgZHJpdmVycyBhcmUgdXNl
bGVzcyBpbiB0aGF0IGNhc2UsIG1ha2UgdGhlCj4gPiA+IG9tYXBmYjIgcGFuZWxzIGRlcGVuZCBv
biB0aGUgc3RhbmRhcmQgRFJNIHBhbmVscyBiZWluZyBkaXNhYmxlZCB0byBmaXgKPiA+ID4gdGhl
IG5hbWUgY2xhc2guCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0
IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJp
dmVycy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZGlzcGxheXMvS2NvbmZpZyB8IDUgKysrKysK
PiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiA+ID4gCj4gPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kaXNwbGF5cy9LY29uZmln
IGIvZHJpdmVycy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZGlzcGxheXMvS2NvbmZpZwo+ID4g
PiBpbmRleCA4YzFjNWE0Y2ZlMTguLjc0NDQxNmRjNTMwZSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJp
dmVycy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZGlzcGxheXMvS2NvbmZpZwo+ID4gPiArKysg
Yi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kaXNwbGF5cy9LY29uZmlnCj4gPiA+
IEBAIC00OSw2ICs0OSw3IEBAIGNvbmZpZyBGQl9PTUFQMl9QQU5FTF9EU0lfQ00KPiA+ID4gIGNv
bmZpZyBGQl9PTUFQMl9QQU5FTF9TT05ZX0FDWDU2NUFLTQo+ID4gPiAgCXRyaXN0YXRlICJBQ1g1
NjVBS00gUGFuZWwiCj4gPiA+ICAJZGVwZW5kcyBvbiBTUEkgJiYgQkFDS0xJR0hUX0NMQVNTX0RF
VklDRQo+ID4gPiArCWRlcGVuZHMgb24gRFJNX1BBTkVMX1NPTllfQUNYNTY1QUtNID0gbgo+ID4g
Cj4gPiBXb3VsZDoKPiA+IAlkZXBlbmRzIG9uICFEUk1fUEFORUxfU09OWV9BQ1g1NjVBS00KPiA+
IAo+ID4gZG8gdGhlIHNhbWU/Cj4gPiAKPiA+IEV4YW1wbGU6Cj4gPiBjb25maWcgRkJfSU5URUwK
PiA+ICAgICAgICAgdHJpc3RhdGUgIkludGVsIDgzME0vODQ1Ry84NTJHTS84NTVHTS84NjVHLzkx
NUcvOTQ1Ry85NDVHTS85NjVHLzk2NUdNIHN1cHBvcnQiCj4gPiAgICAgICAgIGRlcGVuZHMgb24g
RkIgJiYgUENJICYmIFg4NiAmJiBBR1BfSU5URUwgJiYgRVhQRVJUCj4gPiAJLi4uCj4gPiAgICAg
ICAgIGRlcGVuZHMgb24gIURSTV9JOTE1Cj4gPiAKPiA+IAo+ID4gRFJNXzkxNSBpcyBhIHRyaXN0
YXRlIHN5bWJvbC4KPiA+IAo+ID4gSXQgaXMgbWF5YmUgYmlrZXNoZWRkaW5nLCBidXQgdGhlICE8
U1lNQk9MPiBzZWVtcyBtb3JlIGxvZ2ljYWwvcmVhZGFibGUgdG8gbWUuCj4gCj4gVGhlIHR3byBh
cmUgZXF1aXZhbGVudCBhcyBmYXIgYXMgSSBjYW4gdGVsbCwgc28gSSdtIGZpbmUgd2l0aCAhPFNZ
TUJPTD4uCj4gV291bGQgeW91IGNoYW5nZSB0aGF0IHdoZW4gYXBwbHlpbmcsIG9yIHNob3VsZCBJ
IHNlbmQgYSB2MiA/CgpJIGZhaWxlZCB0byBjb252aW5jZSBteXNlbGYgdGhleSBhcmUgZXF1aXZh
bGVudC4KCkZyb20ga2NvbmZpZy1sYW5ndWFlLnJzdDoKCiIKJyEnIDxleHByPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICg2KQooNikgUmV0dXJucyB0aGUgcmVzdWx0IG9mICgyLS9leHByLyku
CgpBbiBleHByZXNzaW9uIGNhbiBoYXZlIGEgdmFsdWUgb2YgJ24nLCAnbScgb3IgJ3knIChvciAw
LCAxLCAyCnJlc3BlY3RpdmVseSBmb3IgY2FsY3VsYXRpb25zKS4gQSBtZW51IGVudHJ5IGJlY29t
ZXMgdmlzaWJsZSB3aGVuIGl0cwpleHByZXNzaW9uIGV2YWx1YXRlcyB0byAnbScgb3IgJ3knLgoi
CgpTbyAhPFNZTUJPTD4gZXF1YWxzIDEgZm9yIG0gYW5kIDAgZm9yIHkuIElmIEkgZ2V0IGl0IHJp
Z2h0LgoKTXkgdGVzdGluZyB3YXMgbm90IGZ1bGx5IGNvbmNsdXNpdmUuCgpTbyBJIGxlZnQgaXQg
YXMgaXMuCkFkZGVkIGEgZmV3IEZpeGVzOiBldGMuIHRhZ3MuCkFwcGxpZWQgYW5kIHB1c2hlZCB0
byBkcm0tbWlzYy1uZXh0LgoKT2hoLCBhbmQgZGltIGNhbWUgdG8gbXkgcmVzY3VlLiBNeSBGaXhl
czogc3ludGF4IHdhcyB3cm9uZyBidXQgaXQgd2FzCmNhdWdodCBpbiBteSAiZGltIHB1c2giIC0g
bmljZS4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

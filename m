Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9984C64709
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 15:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A0A6E09F;
	Wed, 10 Jul 2019 13:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5066E09F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 13:32:49 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 1717420079;
 Wed, 10 Jul 2019 15:32:47 +0200 (CEST)
Date: Wed, 10 Jul 2019 15:32:46 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm/panel: simple: fix AUO g185han01 horizontal blanking
Message-ID: <20190710133246.GA11791@ravnborg.org>
References: <20181112174126.3787-1-l.stach@pengutronix.de>
 <1544793616.3137.44.camel@pengutronix.de>
 <1562764060.23869.12.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1562764060.23869.12.camel@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8
 a=GxIvO10V52-52CsMNnQA:9 a=wPNLvfGTeEIA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTAsIDIwMTkgYXQgMDM6MDc6NDBQTSArMDIwMCwgTHVjYXMgU3RhY2ggd3Jv
dGU6Cj4gSGkgU2FtLAo+IAo+IHNpbmNlIHlvdSd2ZSBiZWVuIHBpY2tpbmcgdXAgc29tZSBwYW5l
bCBwYXRjaGVzIGxhdGVseSwgbWlnaHQgSSBhc2sgeW91Cj4gdG8gdGFrZSBhIGxvb2sgYXQgdGhp
cyBwYXRjaD8KPiAKPiBSZWdhcmRzLAo+IEx1Y2FzCj4gCj4gQW0gRnJlaXRhZywgZGVuIDE0LjEy
LjIwMTgsIDE0OjIwICswMTAwIHNjaHJpZWIgTHVjYXMgU3RhY2g6Cj4gPiBIaSBUaGllcnJ5LAo+
ID4gCj4gPiBjYW4geW91IHBsZWFzZSBoYXZlIGEgbG9vayBhdCB0aGlzIG9uZT8KPiA+IAo+ID4g
UmVnYXJkcywKPiA+IEx1Y2FzCj4gPiAKPiA+IEFtIE1vbnRhZywgZGVuIDEyLjExLjIwMTgsIDE4
OjQxICswMTAwIHNjaHJpZWIgTHVjYXMgU3RhY2g6Cj4gPiA+IFRoZSBob3Jpem9udGFsIGJsYW5r
aW5nIHBlcmlvZHMgYXJlIHRvbyBzaG9ydCwgYXMgdGhlIHZhbHVlcyBhcmUKPiA+ID4gc3BlY2lm
aWVkIGZvciBhIHNpbmdsZSBMVkRTIGNoYW5uZWwuIFNpbmNlIHRoaXMgcGFuZWwgaXMgZHVhbCBM
VkRTCj4gPiA+IHRoZXkgbmVlZCB0byBiZSBkb3VibGVkLiBXaXRoIHRoaXMgY2hhbmdlIHRoZSBw
YW5lbCByZWFjaGVzIGl0cwo+ID4gPiBub21pbmFsIHZyZWZyZXNoIHJhdGUgb2YgNjBGcHMsIGlu
c3RlYWQgb2YgdGhlIDY0RnBzIHdpdGggdGhlCj4gPiA+IGN1cnJlbnQgd3JvbmcgYmxhbmtpbmcu
Cj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRy
b25peC5kZT4KPiA+ID4gLS0tCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNp
bXBsZS5jIHwgNiArKystLS0KPiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1zaW1wbGUuYwo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC1zaW1wbGUuYwo+ID4gPiBpbmRleCA5Nzk2NGY3ZjJhY2UuLjJjODk3OTJlOTFlMiAxMDA2NDQK
PiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwo+ID4gPiBAQCAtNjYzLDkg
KzY2Myw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBhdW9fZzEzM2hhbjAxID0K
PiA+ID4gewo+ID4gPiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGlzcGxheV90aW1pbmcgYXVvX2cx
ODVoYW4wMV90aW1pbmdzID0gewo+ID4gPiDCoAkucGl4ZWxjbG9jayA9IHsgMTIwMDAwMDAwLCAx
NDQwMDAwMDAsIDE3NTAwMDAwMCB9LAo+ID4gPiDCoAkuaGFjdGl2ZSA9IHsgMTkyMCwgMTkyMCwg
MTkyMCB9LAo+ID4gPiAtCS5oZnJvbnRfcG9yY2ggPSB7IDE4LCA2MCwgNzQgfSwKPiA+ID4gLQku
aGJhY2tfcG9yY2ggPSB7IDEyLCA0NCwgNTQgfSwKPiA+ID4gLQkuaHN5bmNfbGVuID0geyAxMCwg
MjQsIDMyIH0sCj4gPiA+ICsJLmhmcm9udF9wb3JjaCA9IHsgMzYsIDEyMCwgMTQ4IH0sCj4gPiA+
ICsJLmhiYWNrX3BvcmNoID0geyAyNCwgODgsIDEwOCB9LAo+ID4gPiArCS5oc3luY19sZW4gPSB7
IDIwLCA0OCwgNjQgfSwKPiA+ID4gwqAJLnZhY3RpdmUgPSB7IDEwODAsIDEwODAsIDEwODAgfSwK
PiA+ID4gwqAJLnZmcm9udF9wb3JjaCA9IHsgNiwgMTAsIDQwIH0sCj4gPiA+IMKgCS52YmFja19w
b3JjaCA9IHsgMiwgNSwgMjAgfSwKCkxvb2tzIGdvb2QgdG8gbWUuIEkgaGF2ZSBub3Qgd29ya2Vk
IHdpdGggZHVhbCBzY2FuIGJ1dCB5b3VyIGV4cGxhbmF0aW9ucwptYWtlcyBzZW5zZS4gYW5kIEkg
Y2hlY2tlZCB0aGF0IGFsbCB2ZXJ0aWNhbCB0aW1pbmdzIGFyZSBtdWx0aXBsaWVkIGJ5CjIuCgpT
bzoKUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

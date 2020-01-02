Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C72B813020C
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 12:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CCB76E41A;
	Sat,  4 Jan 2020 11:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs25.siol.net [185.57.226.216])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC10F89830
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 17:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 64B9C52123C;
 Thu,  2 Jan 2020 18:25:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id lQrdYFwcwuWQ; Thu,  2 Jan 2020 18:25:06 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 00D1D520913;
 Thu,  2 Jan 2020 18:25:05 +0100 (CET)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net
 [89.212.178.211]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id 4EBCD52123C;
 Thu,  2 Jan 2020 18:25:02 +0100 (CET)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Maxime Ripard <mripard@kernel.org>,
 Roman Stratiienko <roman.stratiienko@globallogic.com>
Subject: Re: [PATCH v3 2/2] drm/sun4i: Use CRTC size instead of PRIMARY plane
 size as mixer frame.
Date: Thu, 02 Jan 2020 18:25:02 +0100
Message-ID: <1837725.8hb0ThOEGa@jernej-laptop>
In-Reply-To: <CAODwZ7uqf4v8XjOLCn=SoUQchst_b96VCNdaunzn9Q21zPcQ7w@mail.gmail.com>
References: <20200101204750.50541-1-roman.stratiienko@globallogic.com>
 <20200102100832.c5fc4imjdmr7otam@gilmour.lan>
 <CAODwZ7uqf4v8XjOLCn=SoUQchst_b96VCNdaunzn9Q21zPcQ7w@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 04 Jan 2020 11:23:45 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhCgpEbmUgxI1ldHJ0ZWssIDAyLiBqYW51YXIgMjAyMCBvYiAxNzozMjowNyBDRVQgamUgUm9t
YW4gU3RyYXRpaWVua28gbmFwaXNhbChhKToKPiDRh9GCLCAyINGP0L3Qsi4gMjAyMCDQsy4sIDEy
OjA4IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz46Cj4gPiBIaSwKPiA+IAo+ID4g
T24gV2VkLCBKYW4gMDEsIDIwMjAgYXQgMTA6NDc6NTBQTSArMDIwMCwgCnJvbWFuLnN0cmF0aWll
bmtvQGdsb2JhbGxvZ2ljLmNvbSB3cm90ZToKPiA+ID4gRnJvbTogUm9tYW4gU3RyYXRpaWVua28g
PHJvbWFuLnN0cmF0aWllbmtvQGdsb2JhbGxvZ2ljLmNvbT4KPiA+ID4gCj4gPiA+IEFjY29yZGlu
ZyB0byBEUk0gZG9jdW1lbnRhdGlvbiB0aGUgb25seSBkaWZmZXJlbmNlIGJldHdlZW4gUFJJTUFS
WQo+ID4gPiBhbmQgT1ZFUkxBWSBwbGFuZSBpcyB0aGF0IGVhY2ggQ1JUQyBtdXN0IGhhdmUgUFJJ
TUFSWSBwbGFuZSBhbmQKPiA+ID4gT1ZFUkxBWSBhcmUgb3B0aW9uYWwuCj4gPiA+IAo+ID4gPiBB
bGxvdyBQUklNQVJZIHBsYW5lIHRvIGhhdmUgZGltZW5zaW9uIGRpZmZlcmVudCBmcm9tIGZ1bGwt
c2NyZWVuLgo+ID4gPiAKPiA+ID4gRml4ZXM6IDViYjVmNWRhZmExYSAoImRybS9zdW40aTogUmVv
cmdhbml6ZSBVSSBsYXllciBjb2RlIGluIERFMiIpCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFJvbWFu
IFN0cmF0aWllbmtvIDxyb21hbi5zdHJhdGlpZW5rb0BnbG9iYWxsb2dpYy5jb20+Cj4gPiAKPiA+
IFNvIGl0IGFwcGxpZXMgdG8gYWxsIHRoZSA0IHBhdGNoZXMgeW91J3ZlIHNlbnQsIGJ1dCB0aGlz
IGxhY2tzIHNvbWUKPiA+IGNvbnRleHQuCj4gPiAKPiA+IFRoZXJlJ3MgYSBmZXcgcXVlc3Rpb25z
IHRoYXQgc2hvdWxkIGJlIGFuc3dlcmVkIGhlcmU6Cj4gPiAgIC0gV2hpY2ggc2l0dWF0aW9uIGlz
IGl0IGZpeGluZz8KPiAKPiBTZXR0aW5nIHByaW1hcnkgcGxhbmUgc2l6ZSBsZXNzIHRoYW4gY3J0
YyBicmVha3MgY29tcG9zaXRpb24uIEFsc28KPiBzaGlmdGluZyB0b3AgbGVmdCBjb3JuZXIgYWxz
byBicmVha3MgaXQuCgpUcnVlLCBIVyBkb2Vzbid0IGhhdmUgbm90aW9uIG9mIHByaW1hcnkgcGxh
bmUuIEl0J3MganVzdCBvbmUgcGxhbmUgd2hpY2ggaXMgCm1hcmtlZCBhcyBwcmltYXJ5LCBidXQg
b3RoZXJ3aXNlIGl0IGhhcyBzYW1lIGNhcGFiaWxpdGllcyBhcyBvdGhlcnMsIGxpa2UgeCx5IApj
b29yZGluYXRlcywgc2l6ZSwgZXRjLgoKPiAKPiA+ICAgLSBXaGF0IHRvb2wgLyB1c2Vyc3BhY2Ug
c3RhY2sgaXMgaXQgZml4aW5nPwo+IAo+IEkgYW0gdXNpbmcgQW5kcm9pZCB1c2Vyc3BhY2UgYW5k
IGRybV9od2NvbXBvc2VyIEhBTC4KPiAKPiBASmVybmVqLCB5b3UndmUgc2FpZCB0aGF0IHlvdSBv
YnNlcnZlZCBzaW1pbGFyIGlzc3VlLiBDb3VsZCB5b3Ugc2hhcmUKPiB3aGF0IHVzZXJzcGFjZSBo
YXZlIHlvdSB1c2VkPwoKSSBvYnNlcnZlZCBpdCB3aXRoIERFMSwgYnV0IGl0IGhhcyBleGFjdGx5
IHRoZSBzYW1lIGlzc3VlLiBJIG5vdGljZWQgdGhpcyAKcHJvYmxlbSBvbiBLb2RpIChnYm0gdmVy
c2lvbikuIEtvZGkgZmlyc3Qgc2VhcmNoZXMgZm9yIHBsYW5lIGNhcGFibGUgb2YgCmRpc3BsYXlp
bmcgTlYxMiBmb3JtYXQgKGZvciB2aWRlbykgYW5kIGFmdGVyIHRoYXQgYSBwbGFuZSB3aGljaCBp
cyBjYXBhYmxlIG9mIApkaXNwbGF5aW5nIFJHQjg4OCBmb3JtYXQgKGZvciBHVUkpLiBJbiBERTEg
Y2FzZSwgZmlyc3QgcGxhbmUgaXMgcHJpbWFyeSBhbmQgCmFsc28gY2FwYWJsZSBvZiBkaXNwbGF5
aW5nIE5WMTIgZm9ybWF0LiBTbyB3aGVuIHZpZGVvIGlzIGRpc3BsYXllZCB3aGljaCAKZG9lc24n
dCBjb3ZlciB3aG9sZSBzY3JlZW4sIGRpc3BsYXkgb3V0cHV0IGlzIGNvcnJ1cHRlZC4gSG93ZXZl
ciwgd2l0aCBzdWNoIApmaXgsIHZpZGVvIHBsYXliYWNrIGlzIGNvcnJlY3QuIEx1YyBWZXJoYWVn
ZW4gbWFrZSBlcXVpdmFsZW50IGZpeCBmb3IgREUxLCB3aGVyZSAKaGUgYWxzbyBjbGFpbXMgcHJp
bWFyeSBwbGFuZSBkb2Vzbid0IGhhdmUgdG8gYmUgc2FtZSBzaXplIGFzIENSVEMgb3V0cHV0Ogpo
dHRwczovL2dpdGh1Yi5jb20vbGlidi9mb3NkZW0tdmlkZW8tbGludXgvY29tbWl0LwphZTMyMTVk
MzdjYTJhNTU2NDJiY2FlNmM4M2MzNjEyZTI2Mjc1NzExCgo+IAo+ID4gICAtIFdoYXQgaGFwcGVu
cyB3aXRoIHlvdXIgZml4PyBEbyB5b3Ugc2V0IHRoZSBwbGFuZSBhdCBjb29yZGluYXRlcwo+ID4g
ICAKPiA+ICAgICAwLDAgKG1lYW5pbmcgeW91J2xsIGNyb3AgdGhlIHRvcC1sZWYgY29ybmVyKSwg
ZG8geW91IGNlbnRlciBpdD8gSWYKPiA+ICAgICB0aGUgcGxhbmUgaXMgc21hbGxlciB0aGFuIHRo
ZSBDVFJDIHNpemUsIHdoYXQgaXMgc2V0IG9uIHRoZSBlZGdlcz8KPiAKPiBZb3UgY2FuIHB1dCBw
cmltYXJ5IHBsYW5lIHRvIGFueSBwYXJ0IG9mIHRoZSBzY3JlZW4gYW5kIG1ha2UgaXQgYXMKPiBz
bWFsbCBhcyA4eDggKGFjY29yZGluZyB0byB0aGUgZGF0YXNoZWV0KSAuIEJhY2tncm91bmQgd291
bGQgYmUgZmlsbGVkCj4gd2l0aCBibGFjayBjb2xvciwgdGhhdCBpcyBkZWZhdWx0LCBidXQgaXQg
YWxzbyBjb3VsZCBiZSBvdmVycmlkZGVuIGJ5Cj4gc2V0dGluZyBjb3JyZXNwb25kaW5nIHJlZ2lz
dGVycy4KCkNvcnJlY3QsIHNhbWUgbG9naWMgYXMgZm9yIG92ZXJsYXkgcGxhbmVzIGFwcGxpZXMu
CgpCZXN0IHJlZ2FyZHMsCkplcm5lagoKPiAKPiA+IFRoYW5rcyEKPiA+IE1heGltZQoKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

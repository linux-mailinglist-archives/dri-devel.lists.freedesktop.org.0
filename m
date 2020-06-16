Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E061FC11E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 23:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8BE8813A;
	Tue, 16 Jun 2020 21:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E00C6E0B9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 21:47:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 75ABEF9;
 Tue, 16 Jun 2020 23:47:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1592344075;
 bh=7zS+t+AfxuVeGBr5sbILnhIldXeY6ocnNF8IQEghTYo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Un6dIIgiw/jT8P/Kb1KkDWEaDh6FY7x6vUVLMflCxQJ+bzBR/DrVZKXFANKDmo7Jo
 sorX9pLMiQrNScw/1Md/zog+jIrsxSMmz6bXZ78Gg4cEHMMtUOgnRwYgMb8NIPTD/G
 trljgxNPrmeozMb3sYl/NSCdVBKLZH3dX8zmcCIA=
Date: Wed, 17 Jun 2020 00:47:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Venkateshwar Rao Gannavarapu <VGANNAVA@xilinx.com>
Subject: Re: [RFC PATCH 2/2] drm: xlnx: driver for Xilinx DSI TX Subsystem
Message-ID: <20200616214732.GH913@pendragon.ideasonboard.com>
References: <1587417656-48078-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
 <1587417656-48078-3-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
 <20200504184348.GA3095@smtp.xilinx.com>
 <20200524030813.GF6026@pendragon.ideasonboard.com>
 <CY4PR02MB2790B791578160F257049FEAB18D0@CY4PR02MB2790.namprd02.prod.outlook.com>
 <20200607022518.GA7339@pendragon.ideasonboard.com>
 <CY4PR02MB27908C70E9D66DA91868FF35B1820@CY4PR02MB2790.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR02MB27908C70E9D66DA91868FF35B1820@CY4PR02MB2790.namprd02.prod.outlook.com>
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
Cc: Sandip Kothari <sandipk@xilinx.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Vishal Sagar <vsagar@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR1ZSYW8sCgpTb3JyeSBmb3IgdGhlIGRlbGF5ZWQgcmVwbHkuCgpPbiBUdWUsIEp1biAwOSwg
MjAyMCBhdCAwMjo0ODoyNUFNICswMDAwLCBWZW5rYXRlc2h3YXIgUmFvIEdhbm5hdmFyYXB1IHdy
b3RlOgo+IEhpIExhdXJlbnQsCj4gCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3LiAKPiBQbGVhc2Ug
c2VlIG15IGNvbW1lbnRzIGFib3V0IEQtUEhZIGFuZCBicmlkZ2UgZHJpdmVyIGltcGxlbWVudGF0
aW9uLgo+IAo+IE9uIFN1bmRheSwgSnVuZSA3LCAyMDIwIDc6NTUgQU0sIExhdXJlbnQgUGluY2hh
cnQgd3JvdGU6Cj4gPiBPbiBTdW4sIE1heSAzMSwgMjAyMCBhdCAwNTo0MTo1MFBNICswMDAwLCBW
ZW5rYXRlc2h3YXIgUmFvIEdhbm5hdmFyYXB1IHdyb3RlOgo+ID4+IE9uIFN1bmRheSwgTWF5IDI0
LCAyMDIwIDg6MzggQU0sIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPj4+IE9uIE1vbiwgTWF5
IDA0LCAyMDIwIGF0IDExOjQzOjQ4QU0gLTA3MDAsIEh5dW4gS3dvbiB3cm90ZToKPiA+Pj4+IE9u
IE1vbiwgMjAyMC0wNC0yMCBhdCAxNDoyMDo1NiAtMDcwMCwgVmVua2F0ZXNod2FyIFJhbyBHYW5u
YXZhcmFwdSB3cm90ZToKPiA+Pj4+PiBUaGUgWGlsaW54IE1JUEkgRFNJIFR4IFN1YnN5c3RlbSBz
b2Z0IElQIGlzIHVzZWQgdG8gZGlzcGxheSB2aWRlbwo+ID4+Pj4+IGRhdGEgZnJvbSBBWEktNCBz
dHJlYW0gaW50ZXJmYWNlLgo+ID4+Pj4+Cj4gPj4+Pj4gSXQgc3VwcG9ydHMgdXB0byA0IGxhbmVz
LCBvcHRpb25hbCByZWdpc3RlciBpbnRlcmZhY2UgZm9yIHRoZQo+ID4+Pj4+IERQSFksCj4gPj4+
Pgo+ID4+Pj4gSSBkb24ndCBzZWUgdGhlIHJlZ2lzdGVyIGludGVyZmFjZSBmb3IgZHBoeSBzdXBw
b3J0Lgo+ID4+Pgo+ID4+PiBJIHRoaW5rIHRoZSBELVBIWSBzaG91bGQgYmUgc3VwcG9ydGVkIHRo
cm91Z2ggYSBQSFkgZHJpdmVyLCBhcyBpdAo+ID4+PiBzZWVtcyB0byBiZSBzaGFyZWQgYmV0d2Vl
biBkaWZmZXJlbnQgc3Vic3lzdGVtcy4KPiA+Pgo+ID4+IElQIGhhcyB0aGUgcHJvdmlzaW9uIHRv
IHJlYWQgRFBIWSByZWdpc3RlciBmb3IgZGVidWcgcHVycG9zZSBvbmx5Lgo+ID4+IE5vIHByb2dy
YW1taW5nIG9mIERQSFkgaXMgcmVxdWlyZWQgaW4gc3Vic3lzdGVtLgo+ID4KPiA+IERvIHlvdSBr
bm93IGlmIHRoaXMgaXMgdGhlIHNhbWUgRC1QSFkgYXMgdXNlZCBpbiB0aGUgQ1NJMi1SWCBzdWJz
eXN0ZW0gPwo+ICAKPiBTYW1lIEQtUEhZIGNvcmUgaGFzIGJlZW4gdXNlZCBpbiBNSVBJIENTSTIg
UlhTUywgYnV0IHdpdGggZGlmZmVyZW50IGNvbmZpZ3VyYXRpb24uCj4KPiA+Pj4+PiBtdWx0aXBs
ZSBSR0IgY29sb3IgZm9ybWF0cywgY29tbWFuZCBtb2RlIGFuZCB2aWRlbyBtb2RlLgo+ID4+Pj4+
IFRoaXMgaXMgYSBNSVBJLURTSSBob3N0IGRyaXZlciBhbmQgcHJvdmlkZXMgRFNJIGJ1cyBmb3Ig
cGFuZWxzLgo+ID4+Pj4+IFRoaXMgZHJpdmVyIGFsc28gaGVscHMgdG8gY29tbXVuaWNhdGUgd2l0
aCBpdHMgcGFuZWwgdXNpbmcgcGFuZWwKPiA+Pj4+PiBmcmFtZXdvcmsuCj4gPj4+Pj4KPiA+Pj4+
PiBTaWduZWQtb2ZmLWJ5OiBWZW5rYXRlc2h3YXIgUmFvIEdhbm5hdmFyYXB1Cj4gPj4+Pj4gPHZl
bmthdGVzaHdhci5yYW8uZ2FubmF2YXJhcHVAeGlsaW54LmNvbT4KPiA+Pj4+PiAtLS0KPiA+Pj4+
PiAgZHJpdmVycy9ncHUvZHJtL3hsbngvS2NvbmZpZyAgICB8ICAxMSArCj4gPj4+Pj4gIGRyaXZl
cnMvZ3B1L2RybS94bG54L01ha2VmaWxlICAgfCAgIDIgKwo+ID4+Pj4+ICBkcml2ZXJzL2dwdS9k
cm0veGxueC94bG54X2RzaS5jIHwgNzU1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPiA+Pj4KPiA+Pj4gRGFuaWVsIFZldHRlciBoYXMgcmVjZW50bHkgZXhwcmVzc2Vk
IGhpcyBvcGlpb24gdGhhdCBicmlkZ2UgZHJpdmVycwo+ID4+PiBzaG91bGQgZ28gdG8gZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS8uIEl0IHdvdWxkIHRoZW4gYmUKPiA+Pj4gZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS94bG54Ly4gSSBkb24ndCBoYXZlIGEgc3Ryb25nIG9waW5pb24gbXlzZWxmLgo+IAo+
IFRoZSBEU0ktVFggc3Vic3lzdGVtIElQIGJsb2NrIGlzIG5vdCBhIGJyaWRnZSBkcml2ZXIuCj4g
VGhlIERTSS1UWCBzdWJzeXN0ZW0gSVAgYmxvY2sgaXRzZWxmIGNvbnRhaW5zIGFsbCB0aGUgZHJt
IGVuY29kZXIvY29ubmVjdG9yCj4gZnVuY3Rpb25hbGl0eSBhbmQgaXTigJlzIHRoZSBsYXN0IG5v
ZGUgaW4gZGlzcGxheSBwaXBlIGxpbmUuCgpUaGUgRFNJLVRYIHN1YnN5c3RlbSBJUCBibG9jayBp
cyBpbmRlZWQgYW4gZW5jb2RlciBmcm9tIGEgaGFyZHdhcmUgcG9pbnQKb2YgdmlldywgYnV0IGl0
J3Mgbm90IG5lY2Vzc2FyaWx5IHRoZSBsYXN0IGJsb2NrIGluIHRoZSBkaXNwbGF5CnBpcGVsaW5l
LiBXaGlsZSB0aGUgb3V0cHV0IG9mIHRoZSBJUCBjb3JlIGdvZXMgb2YgdGhlIHRoZSBTb0MsIHR0
IHdvdWxkCmJlIGVudGlyZWx5IGZlYXNpYmxlIHRvIGNvbm5lY3QgaXQgdG8gYSBEUCB0byBIRE1J
IGJyaWRnZSBvbiB0aGUgYm9hcmQsCnN1Y2ggYXMgdGhlIEFOWDc3MzcgKFsxXSkgZm9yIGluc3Rh
bmNlLiBUaGlzIGlzIHdoeSB3ZSdyZSBwdXNoaW5nIGZvcgphbGwgZW5jb2RlciAoZnJvbSBhIGhh
cmR3YXJlIHBvaW50IG9mIHZpZXcpIGRyaXZlcnMgdG8gYmUgaW1wbGVtZW50ZWQgYXMKRFJNIGJy
aWRnZSwgaW4gb3JkZXIgdG8gbWFrZSB0aGVtIHVzYWJsZSBpbiBkaWZmZXJlbnQgZGlzcGxheSBw
aXBlbGluZXMsCndpdGhvdXQgaGFyZGNvZGluZyB0aGUgYXNzdW1wdGlvbiB0aGV5IHdpbGwgYmUg
dGhlIGxhc3QgZW5jb2RlciBpbiB0aGUKcGlwZWxpbmUuCgo+IEkgZGlkbid0IHNlZSBhbnkgaGFy
ZAo+IHJlcXVpcmVtZW50IHRvIGltcGxlbWVudCBpdCBpbnRvIGJyaWRnZSBkcml2ZXIgYW5kIEkg
c2VlIG1hbnkgRFNJIGRyaXZlcnMgYXJlCj4gaW1wbGVtZW50ZWQgYXMgZW5jb2RlciBkcml2ZXJz
Lgo+IFhpbGlueCBQTCBEUk0gZW5jb2RlciBkcml2ZXJzIGFyZSBpbXBsZW1lbnRlZCBpbiBtb2R1
bGFyIGFwcHJvYWNoIHNvIHRoYXQKPiB0aGV5IGNhbiB3b3JrIHdpdGggYW55IENSVEMgZHJpdmVy
IHdoaWNoIGhhbmRsZXMgdGhlIERNQSBjYWxscy4KPiBTbywgYXQgdGhpcyBzdGFnZSB3ZSB3YW50
IHRvIHVwc3RyZWFtIGFzIGVuY29kZXIgZHJpdmVyIG9ubHkuCj4KPiA+Pj4+PiAgMyBmaWxlcyBj
aGFuZ2VkLCA3NjggaW5zZXJ0aW9ucygrKSAgY3JlYXRlIG1vZGUgMTAwNjQ0Cj4gPj4+Pj4gZHJp
dmVycy9ncHUvZHJtL3hsbngveGxueF9kc2kuYwoKWzFdIGh0dHBzOi8vd3d3LmFuYWxvZ2l4LmNv
bS9lbi9wcm9kdWN0cy9jb252ZXJ0ZXJzYnJpZGdlcy9hbng3NzM3CgotLSAKUmVnYXJkcywKCkxh
dXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==

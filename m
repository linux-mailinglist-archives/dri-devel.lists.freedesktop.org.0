Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA10F132E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 11:02:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD1D6EC9D;
	Wed,  6 Nov 2019 10:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF976EC9D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 10:02:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92F232D1;
 Wed,  6 Nov 2019 11:02:13 +0100 (CET)
Date: Wed, 6 Nov 2019 12:02:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [GIT PULL FOR v5.5 - 2nd try] R-Car DU CMM support
Message-ID: <20191106100205.GB4878@pendragon.ideasonboard.com>
References: <20191022103135.GC4756@pendragon.ideasonboard.com>
 <20191105194902.GA8235@pendragon.ideasonboard.com>
 <CAPM=9tzhDyPU8GtJXCr+YRhNgx9F=Zo9PGiSbmpBWYkQ4qv9gg@mail.gmail.com>
 <CAPM=9tyh-cMCyKr-A7C0dHmCQaqrm+fypKM+m2zyJ22S5aXC7w@mail.gmail.com>
 <20191106100059.GA4878@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106100059.GA4878@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1573034533;
 bh=W83y4KamyOQpuQ09/PFxel1kQeGuxgtmx2jZxK67HAI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c+jffbHaFW5vqPNZZRGKGcMSctgt90Q+hCTQgqRIHgsStzY8DgT3/QmnJ2J1PeriI
 wQJLFR//HhgSIyjfFqC3YmU6kyyXhVjCdRI+pYSZemNNWBxRqCe4GCNYNlB1ubZNIz
 VWfPLkYhIWiUyzBMlozRC507oxqlLS/aytfFDLkQ=
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
Cc: Jacopo Mondi <jacopo@jmondi.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyB0aW1lIHdpdGggSmFjb3BvIGNvcnJlY3RseSBDQydlZC4KCk9uIFdlZCwgTm92IDA2LCAy
MDE5IGF0IDEyOjAwOjU5UE0gKzAyMDAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gSGkgRGF2
ZSwKPiAKPiAoQ0MnaW5nIEphY29wbykKPiAKPiBPbiBXZWQsIE5vdiAwNiwgMjAxOSBhdCAwMTo0
MDoxM1BNICsxMDAwLCBEYXZlIEFpcmxpZSB3cm90ZToKPiA+IE9uIFdlZCwgNiBOb3YgMjAxOSBh
dCAwNTo1NiwgRGF2ZSBBaXJsaWUgd3JvdGU6Cj4gPiA+IE9uIFdlZCwgNiBOb3YgMjAxOSBhdCAw
NTo0OSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IEhpIERhdmUsCj4g
PiA+ID4KPiA+ID4gPiBIYXMgdGhpcyBwdWxsIHJlcXVlc3QgZmFsbGVuIHRocm91Z2ggdGhlIGNy
YWNrcyA/Cj4gPiA+Cj4gPiA+IEl0IGZlbGwgZG93biBhIGRpZmZlcmVudCBjcmFjayB0aGFuIHVz
dWFsLCBpdCBtYWRlIGl0IGZyb20gcGF0Y2h3b3JrCj4gPiA+IG9udG8gbXkgaGFyZCBkcml2ZSwg
YnV0IHRoZW4gSSBkaWRuJ3QgZXhlY3V0ZSB0aGUgcHVsbC4KPiA+ID4KPiA+ID4gSSd2ZSBwdWxs
ZWQgaXQgZG93biwgdGhhbmtzIGZvciByZW1pbmRlci4KPiA+IAo+ID4gTm93IGl0IGZhaWxlZCBh
cyBJIG1lbnRpb25lZCBvbiBpcmMuCj4gPiAKPiA+IEkgdGhpbmsgdGhlIG5ldyBrY29uZmlnIG9w
dGlvbiBuZWVkcyB0byBiZSBhIHRyaXN0YXRlLCBvdGhlcndpc2UKPiA+IHNldHRpbmcgaXQgdG8g
WSBhbmQgaGF2aW5nIHJjYXItZHUgYXMgTSBmYWlscyB0byBsaW5rCj4gCj4gU29ycnkgYWJvdXQg
dGhhdCA6LVMgQm90aCBJIGFuZCB0aGUgMC1kYXkgYm90IGZhaWxlZCB0byBjYXRjaCBpdC4KPiBK
YWNvcG8sIGNvdWxkIHlvdSBwbGVhc2UgaGF2ZSBhIGxvb2sgPyBJJ20gYWZyYWlkIHRoaXMgbGlr
ZWx5IG1lYW4gYSBuZXcKPiB2ZXJzaW9uIG9mIHRoZSBzZXJpZXMsIGFuZCB0aHVzIG1pc3Npbmcg
dGhlIG1lcmdlIHdpbmRvdywgYXMgd2UncmUKPiBhbHJlYWR5IGF0IC1yYzYuCgotLSAKUmVnYXJk
cywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs

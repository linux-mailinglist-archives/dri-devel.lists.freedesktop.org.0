Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 114824223B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 12:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B50C5892C6;
	Wed, 12 Jun 2019 10:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E50892C6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 10:21:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7756C9B1;
 Wed, 12 Jun 2019 12:21:39 +0200 (CEST)
Date: Wed, 12 Jun 2019 13:21:24 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 08/10] arm64: dts: renesas: r8a7799[05]: Point LVDS0
 to its companion LVDS1
Message-ID: <20190612102124.GJ5035@pendragon.ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-9-laurent.pinchart+renesas@ideasonboard.com>
 <20190603114045.jusjfo3tswro4xbm@verge.net.au>
 <20190606075957.GF4931@pendragon.ideasonboard.com>
 <20190606085109.o2ihuj5yudsakmzv@verge.net.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606085109.o2ihuj5yudsakmzv@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1560334899;
 bh=oFhhjs4lGxLzFy7EyZiiCgO6TPA+BFzJoz7joFCL//s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UtVBrKZsKFTOYSoUDJIGt9ZOZL1lCYbQED2slpETXYrhYBqfkCsHk/n+5pc+M784k
 4nL5ekGo9pDzdQZnyM2e2r9J8bugAuwYQKV3DRnIlSgnNM4vO5SsDUPjgVl/FwZWMN
 A2GTFy8Uimb+0Im0GQSJBb4afsOKbW4+Xfg1tGyc=
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
Cc: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2ltb24sCgpPbiBUaHUsIEp1biAwNiwgMjAxOSBhdCAxMDo1MTowOUFNICswMjAwLCBTaW1v
biBIb3JtYW4gd3JvdGU6Cj4gT24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMTA6NTk6NTdBTSArMDMw
MCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiA+IE9uIE1vbiwgSnVuIDAzLCAyMDE5IGF0IDAx
OjQwOjQ1UE0gKzAyMDAsIFNpbW9uIEhvcm1hbiB3cm90ZToKPiA+PiBPbiBUdWUsIE1heSAyOCwg
MjAxOSBhdCAwNToxMjozMlBNICswMzAwLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4+PiBB
ZGQgdGhlIG5ldyByZW5lc2FzLGNvbXBhbmlvbiBwcm9wZXJ0eSB0byB0aGUgTFZEUzAgbm9kZSB0
byBwb2ludCB0byB0aGUKPiA+Pj4gY29tcGFuaW9uIExWRFMgZW5jb2RlciBMVkRTMS4KPiA+Pj4g
Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnQr
cmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgo+ID4+PiBSZXZpZXdlZC1ieTogSmFjb3BvIE1vbmRp
IDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgo+ID4+PiBUZXN0ZWQtYnk6IEphY29wbyBNb25k
aSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KPiA+PiAKPiA+PiBIaSBMYXVyZW50LAo+ID4+
IAo+ID4+IGlzIHRoaXMgcGF0Y2ggcmVhZHkgdG8gYmUgbWVyZ2VkPwo+ID4gCj4gPiBJIHdhcyBo
b3BpbmcgZm9yIGFuIGFjayBmcm9tIHRoZSBEVCBiaW5kaW5ncyBtYWludGFpbmVycyBmb3IgdGhl
Cj4gPiBjb3JyZXNwb25kaW5nIGJpbmRpbmdzIGNoYW5nZXMsIGJ1dCBJIHdhbnQgdG8gZ2V0IHRo
aXMgbWVyZ2VkIGZvciB0aGUKPiA+IG5leHQga2VybmVsIHJlbGVhc2UsIHNvIEkgbWF5IG5vdCBn
ZXQgaXQuIEknbGwgcGluZyB5b3Ugd2hlbiBJIHNlbmQgdGhlCj4gPiBwdWxsIHJlcXVlc3QgZm9y
IHRoZSBEVCBiaW5kaW5ncyBhbmQgZHJpdmVycyBjaGFuZ2VzLCBhdCB0aGF0IHBvaW50IHRoaXMK
PiA+IHBhdGNoIHNob3VsZCBiZSBwaWNrZWQgdXAuCj4gCj4gVGhhbmtzIExhdXJlbnQsIGdvdCBp
dC4KClRoZSBEVCBiaW5kaW5ncyBhbmQgZHJpdmVyIGNoYW5nZXMgaGF2ZSBiZWVuIG1lcmdlZCwg
c28gcGxlYXNlIGdvIGFoZWFkCmFuZCBwaWNrIHRoaXMgcGF0Y2ggZm9yIHY1LjMuCgotLSAKUmVn
YXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs

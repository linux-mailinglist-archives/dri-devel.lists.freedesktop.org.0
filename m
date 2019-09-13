Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0071AB359A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 09:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2266E856;
	Mon, 16 Sep 2019 07:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from kirsty.vergenet.net (kirsty.vergenet.net [202.4.237.240])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6280B6EEC9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 08:21:33 +0000 (UTC)
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
 by kirsty.vergenet.net (Postfix) with ESMTPA id 2568725AEB1;
 Fri, 13 Sep 2019 18:21:32 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
 id 167D9940513; Fri, 13 Sep 2019 10:21:30 +0200 (CEST)
Date: Fri, 13 Sep 2019 10:21:29 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] drm: rcar-du: Add r8a77980 support
Message-ID: <20190913082129.lvusbp6pbcayqh5r@verge.net.au>
References: <20190911192502.16609-1-kieran.bingham+renesas@ideasonboard.com>
 <70b94265-69f3-d18f-1b67-b5b814723b1b@cogentembedded.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <70b94265-69f3-d18f-1b67-b5b814723b1b@cogentembedded.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Mon, 16 Sep 2019 07:28:04 +0000
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgMDE6MDA6NDFQTSArMDMwMCwgU2VyZ2VpIFNodHlseW92
IHdyb3RlOgo+IEhlbGxvIQo+IAo+IE9uIDExLjA5LjIwMTkgMjI6MjUsIEtpZXJhbiBCaW5naGFt
IHdyb3RlOgo+IAo+ID4gQWRkIGRpcmVjdCBzdXBwb3J0IGZvciB0aGUgcjhhNzc5ODAgKFYzSCku
Cj4gPiAKPiA+IFRoZSBWM0ggc2hhcmVzIGEgY29tbW9uLCBjb21wYXRpYmxlIGNvbmZpZ3VyYXRp
b24gd2l0aCB0aGUgcjhhNzc5NzAKPiA+IChWM00pIHNvIHRoYXQgZGV2aWNlIGluZm8gc3RydWN0
dXJlIGlzIHJldXNlZC4KPiAKPiAgICBEbyB3ZSByZWFsbHkgbmVlZCB0byBhZGQgeWV0IGFub3Ro
ZXIgY29tcGF0aWJsZSBpbiB0aGlzIGNhc2U/Cj4gSSBqdXN0IGFkZGVkIHI4YTc3OTcwIHRvIHRo
ZSBjb21wYXRpYmxlIHByb3AgaW4gdGhlIHI4YTc3OTgwIERULiBUaGF0J3Mgd2h5Cj4gYSBwYXRj
aCBsaWtlIHRoaXMgb25lIGRpZG4ndCBnZXQgcG9zdGVkIGJ5IG1lLgoKVGhlIHJlYXNvbiBmb3Ig
aGF2aW5nIHBlci1Tb0MgY29tcGF0IHN0cmluZ3MgaXMgdGhhdCB0aGUgSVAgYmxvY2tzCmFyZSBu
b3QgdmVyc2lvbmVkIGFuZCB3aGlsZSB3ZSBjYW4gb2JzZXJ2ZSB0aGF0IHRoZXJlIGFyZSBzaW1p
bGFyaXRpZXMKYmV0d2VlbiwgZi5lLiB0aGUgRFUgb24gdGhlIHI4YTc3OTcwIGFuZCByOGE3Nzk4
MCwgd2UgY2FuJ3QgYmUgY2VydGFpbiB0aGF0CmRpZmZlcmVuY2VzIG1heSBub3QgZW1lcmdlIGF0
IHNvbWUgcG9pbnQuIEJ5IGhhdmluZyBwZXItU29DIGNvbXBhdCBzdHJpbmdzCndlIGhhdmUgdGhl
IGZsZXhpYmlsaXR5IGZvciB0aGUgZHJpdmVyIHRvIGFkZHJlc3MgYW55IHN1Y2ggZGlmZmVyZW5j
ZXMgYXMKdGhlIG5lZWQgYXJpc2VzLgoKTXkgcmVjb2xsZWN0aW9uIGlzIHRoYXQgdGhpcyBzY2hl
bWUgaGFzIGJlZW4gYWRvcHRlZCBmb3Igbm9uLXZlcnNpb25lZApSZW5lc2FzIElQIGJsb2NrcyBz
aW5jZSBKdW5lIDIwMTUgYW5kIHVzZXMgb2YgdGhpcyBzY2hlbWUgd2VsbCBiZWZvcmUgdGhhdC4K
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBLaWVyYW4gQmluZ2hhbSA8a2llcmFuLmJpbmdoYW0rcmVuZXNh
c0BpZGVhc29uYm9hcmQuY29tPgoKUmV2aWV3ZWQtYnk6IFNpbW9uIEhvcm1hbiA8aG9ybXMrcmVu
ZXNhc0B2ZXJnZS5uZXQuYXU+Cgo+IFsuLi5dCj4gCj4gTUJSLCBTZXJnZWkKPiAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

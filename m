Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C71D336DD9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086DA8972C;
	Thu,  6 Jun 2019 07:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6638D8972C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 07:54:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown
 [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7734B84;
 Thu,  6 Jun 2019 09:54:49 +0200 (CEST)
Date: Thu, 6 Jun 2019 10:54:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 04/10] dt-bindings: display: renesas: lvds: Add
 renesas, companion property
Message-ID: <20190606075435.GD4931@pendragon.ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-5-laurent.pinchart+renesas@ideasonboard.com>
 <20190528163730.GA9610@ravnborg.org>
 <20190528164916.GA17874@pendragon.ideasonboard.com>
 <20190528165900.GA10262@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528165900.GA10262@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559807689;
 bh=YlCMVFQKmnEdokPv5gB9wXZ+eMS08U1QKRrygba8Uuc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NO0PaY0GTCfZ+ORNuBNR/vRY4r05Qqn4ad797zi5uoVK8GX2Kq87CK/r8OuWbKQdj
 gD1DFvHmi3qsDww5CCKdh0Wducb+u+uFVgcXg7bG4xLpX5hETyDO4aSHUQf6C9B2v5
 ZaxIAZYcMHtgKwVpKQ2rKLaYigrfAkYOig7Q1DcU=
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
Cc: devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKT24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDY6NTk6MDBQTSArMDIwMCwgU2FtIFJh
dm5ib3JnIHdyb3RlOgo+IEhpIExhdXJlbnQuCj4gCj4gPiA+ID4gIAo+ID4gPiA+ICtPcHRpb25h
bCBwcm9wZXJ0aWVzOgo+ID4gPiA+ICsKPiA+ID4gPiArLSByZW5lc2FzLGNvbXBhbmlvbiA6IHBo
YW5kbGUgdG8gdGhlIGNvbXBhbmlvbiBMVkRTIGVuY29kZXIuIFRoaXMgcHJvcGVydHkgaXMKPiA+
ID4gPiArICBtYW5kYXRvcnkgZm9yIHRoZSBmaXJzdCBMVkRTIGVuY29kZXIgb24gRDMgYW5kIEUz
IFNvQ3MsIGFuZCBzaGFsbCBwb2ludCB0bwo+ID4gPiA+ICsgIHRoZSBzZWNvbmQgZW5jb2RlciB0
byBiZSB1c2VkIGFzIGEgY29tcGFuaW9uIGluIGR1YWwtbGluayBtb2RlLiBJdCBzaGFsbCBub3QK
PiA+ID4gPiArICBiZSBzZXQgZm9yIGFueSBvdGhlciBMVkRTIGVuY29kZXIuCj4gPiA+IAo+ID4g
PiBJZiB0aGUgRDMgYW5kIEUzIHNvY3MgZG8gbm90IG1hbmRhdGUgdGhlIHVzZSBvZiBkdWFsLWxp
bmssIHRoZW4gd2hhdCB0bwo+ID4gPiBkbyBpbiB0aGUgRFQ/IEJlY2F1c2UgYWNjb3JkaW5nIHRv
IHRoZSBhYm92ZSB0aGlzIHByb3BlcnR5IG11c3QgYmUKPiA+ID4gc3BlY2lmaWVkIGZvciBEMyBh
bmQgRTMgU09DJ3MuCj4gPiAKPiA+IFRoaXMgcHJvcGVydHkgZG9lc24ndCBlbmFibGUgZHVhbC1s
aW5rIG1vZGUsIGl0IG9ubHkgc3BlY2lmaWVzIHRoZQo+ID4gY29tcGFuaW9uIExWRFMgZW5jb2Rl
ciB1c2VkIGZvciBkdWFsLWxpbmsgbW9kZSwgd2hlbiBlbmFibGVkICh0aHJvdWdoCj4gPiBjb21t
dW5pY2F0aW9uIGJldHdlZW4gdGhlIExWRFMgZW5jb2RlciBhbmQgdGhlIExWRFMgcmVjZWl2ZXIg
YXQKPiA+IHJ1bnRpbWUpLgo+ID4gCj4gPiBKYWNvcG8gaGFkIGEgc2ltaWxhciBjb21tZW50IHNv
IEkgc3VwcG9zZSB0aGlzIGlzbid0IGNsZWFyLiBIb3cgd291bGQKPiA+IHlvdSB3b3JkIGl0IHRv
IG1ha2UgaXQgY2xlYXIgPwo+IAo+IExldCBtZSB0cnk6Cj4gCj4gLSByZW5lc2FzLGNvbXBhbmlv
biA6IHBoYW5kbGUgdG8gdGhlIGNvbXBhbmlvbiBMVkRTIGVuY29kZXIuIFRoaXMgcHJvcGVydHkg
aXMKPiAgIG1hbmRhdG9yeSBmb3IgdGhlIGZpcnN0IExWRFMgZW5jb2RlciBvbiBEMyBhbmQgRTMg
U29DcyB3aGVuIGR1YWwtbGluayBtb2RlCj4gICBpcyBzdXBwb3J0ZWQuCj4gICBUaGUgcHJvcGVy
dHkgc2hhbGwgcG9udCB0byB0aGUgcGhhbmRsZSBvZiB0aGUgc2Vjb25kIGVuY29kZXIgdG8gYmUg
dXNlZCBhcyBhCj4gICBjb21wYW5pb24gaW4gZHVhbC1saW5rIG1vZGUuIEl0IHNoYWxsIG5vdCBi
ZSBzZXQgZm9yIGFueSBvdGhlciBMVkRTIGVuY29kZXIuCj4gCj4gVGhlIG1haW4gZGlmZmVyZW5j
ZSBpcyAid2hlbiBkdWFsLWxpbmsgbW9kZSBpcyBzdXBwb3J0ZWQiLgo+IEFzIHBlciBteSB1bmRl
cnN0YW5kaW5nIHRoaXMgcHJvcGVydHkgaXMgb25seSByZWxldmFudCB3aGVuIHRoZSBhY3R1YWwK
PiBIVyBzdXBwb3J0cyAvIHVzZXMgZHVhbC1saW5rIG1vZGUuCj4gU28gZm9yIGEgYm9hcmQgdGhh
dCBkbyBub3QgZXZlbiB3aXJlIHVwIGR1YWwtbGluaywgdGhlbiBzZXR0aW5nIHRoZQo+IHByb3Bl
cnR5IHdvdWxkIGJlIGNvbmZ1c2luZy4KClRoYXQncyBub3QgcXVpdGUgY29ycmVjdC4gVGhlIHBy
b3BlcnR5IHNoYWxsIGJlIHNwZWNpZmllZCB3aGVuIHRoZSBTb0MKc3VwcG9ydHMgZHVhbC1saW5r
IG1vZGUgKHdoaWNoIGlzIHRoZSBjYXNlIGZvciB0aGUgRDMgYW5kIEUzIFNvQ3Mgb25seSksCnJl
Z2FyZGxlc3Mgb2Ygd2hldGhlciB0aGUgYm9hcmQgaXMgd2lyZWQgdXAgaW4gc2luZ2xlLWxpbmsg
b3IgZHVhbC1saW5rCm1vZGUuIFNlbGVjdGlvbiBvZiB0aGUgbW9kZSBpcyBwZXJmb3JtZWQgYXQg
cnVudGltZSBieSBsb29raW5nIGF0IHRoZQpyZXF1aXJlbWVudHMgb2YgdGhlIExWRFMgc2luaywg
bm90IGJhc2VkIG9uIHRoZSBjb21wYW5pb24gcHJvcGVydHkgaW4KRFQuIFRoZSByZW5lc2FzLGNv
bXBhbmlvbiBwcm9wZXJ0eSBpcyB0aHVzIFNvQy1zcGVjaWZpYywgYnV0IG5vdApib2FyZC1zcGVj
aWZpYy4KCj4gSSBob3BlIHRoaXMgYmV0dGVyIGRlc2NyaWJlcyBteSB1bmRlcnN0YW5kaW5nLgoK
LS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==

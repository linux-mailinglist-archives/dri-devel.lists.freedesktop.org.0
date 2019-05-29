Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6EC2DB98
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 13:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3516E2CC;
	Wed, 29 May 2019 11:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2838E6E063;
 Wed, 29 May 2019 02:46:50 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id AF6A73E93F;
 Wed, 29 May 2019 02:46:48 +0000 (UTC)
Date: Tue, 28 May 2019 22:46:48 -0400
From: Brian Masney <masneyb@onstation.org>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [Freedreno] [PATCH RFC v2 0/6] ARM: qcom: initial Nexus 5
 display support
Message-ID: <20190529024648.GA13436@basecamp>
References: <20190509020352.14282-1-masneyb@onstation.org>
 <CACRpkda-7+ggoeMD9=erPX09OWteX0bt+qP60_Yv6=4XLqNDZQ@mail.gmail.com>
 <20190529011705.GA12977@basecamp>
 <CAOCk7NrRo2=0fPN_Sy1Bhhy+UV7U6uO5aV9uXZc8kc3VpSt71g@mail.gmail.com>
 <20190529013713.GA13245@basecamp>
 <CAOCk7NqfdNkRJkbJY70XWN-XvdtFJ0UVn3_9rbgAsNCdR7q5PQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOCk7NqfdNkRJkbJY70XWN-XvdtFJ0UVn3_9rbgAsNCdR7q5PQ@mail.gmail.com>
X-Mailman-Approved-At: Wed, 29 May 2019 11:20:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1559098009;
 bh=aRBBhy0Kk6XSGsl/Ftb8O8lFKtAxihQWGmXQEY0I06w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C9rPPdfaKmSr7mTVb+0Lk2lfnDbgZbDzftRQhz3hjeRFgTNa0pRlOicd50dvk90EX
 taUjiI1yBvgyypyXxKqtcP+/7WALm3KK7iRwqrpZxCxjplv7JEC7NEX91fCSLCDA4F
 l27G7XLjh2AtIX3DNrY7JEldf2XaU3DKwU7EsExo=
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
Cc: Jonathan Marek <jonathan@marek.ca>, Dave Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDc6NDI6MTlQTSAtMDYwMCwgSmVmZnJleSBIdWdvIHdy
b3RlOgo+ID4gPiBEbyB5b3Uga25vdyBpZiB0aGUgbmV4dXMgNSBoYXMgYSB2aWRlbyBvciBjb21t
YW5kIG1vZGUgcGFuZWw/ICBUaGVyZQo+ID4gPiBpcyBzb21lIGdsaXRjaHluZXNzIHdpdGggdmJs
YW5rcyBhbmQgY29tbWFuZCBtb2RlIHBhbmVscy4KPiA+Cj4gPiBJdHMgaW4gY29tbWFuZCBtb2Rl
LiBJIGtub3cgdGhpcyBiZWNhdXNlIEkgc2VlIHR3byAncHAgZG9uZSB0aW1lIG91dCcKPiA+IG1l
c3NhZ2VzLCBldmVuIG9uIDQuMTcuIEJhc2VkIG9uIG15IHVuZGVyc3RhbmRpbmcsIHRoZSBwaW5n
IHBvbmcgY29kZSBpcwo+ID4gb25seSBhcHBsaWNhYmxlIGZvciBjb21tYW5kIG1vZGUgcGFuZWxz
Lgo+IAo+IEFjdHVhbGx5LCB0aGUgcGluZyBwb25nIGVsZW1lbnQgZXhpc3RzIGluIGJvdGggbW9k
ZXMsIGJ1dCAncHAgZG9uZQo+IHRpbWUgb3V0JyBpcyBhIGdvb2QgaW5kaWNhdG9yIHRoYXQgaXQg
aXMgY29tbWFuZCBtb2RlLgo+IAo+IEFyZSB5b3UgYWxzbyBzZWVpbmcgdmJsYW5rIHRpbWVvdXRz
PwoKWWVzLCBoZXJlJ3MgYSBzbmlwcGV0IG9mIHRoZSBmaXJzdCBvbmUuCgpbICAgIDIuNTU2MDE0
XSBXQVJOSU5HOiBDUFU6IDAgUElEOiA1IGF0IGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hl
bHBlci5jOjE0MjkgZHJtX2F0b21pY19oZWxwZXJfd2FpdF9mb3JfdmJsYW5rcy5wYXJ0LjErMHgy
ODgvMHgyOTAKWyAgICAyLjU1NjAyMF0gW0NSVEM6NDk6Y3J0Yy0wXSB2Ymxhbmsgd2FpdCB0aW1l
ZCBvdXQKWyAgICAyLjU1NjAyM10gTW9kdWxlcyBsaW5rZWQgaW46ClsgICAgMi41NTYwMzRdIENQ
VTogMCBQSUQ6IDUgQ29tbToga3dvcmtlci8wOjAgTm90IHRhaW50ZWQgNS4yLjAtcmMxLTAwMTc4
LWc3MmMzYzFmZDVmODYtZGlydHkgIzQyNgpbICAgIDIuNTU2MDM4XSBIYXJkd2FyZSBuYW1lOiBH
ZW5lcmljIERUIGJhc2VkIHN5c3RlbQpbICAgIDIuNTU2MDU2XSBXb3JrcXVldWU6IGV2ZW50cyBk
ZWZlcnJlZF9wcm9iZV93b3JrX2Z1bmMKLi4uCgo+IERvIHlvdSBoYXZlIGJ1c3lib3g/Cj4gCj4g
Q2FuIHlvdSBydW4gLQo+IHN1ZG8gYnVzeWJveCBkZXZtZW0gMHhGRDkwMDYxNAo+IHN1ZG8gYnVz
eWJveCBkZXZtZW0gMHhGRDkwMDcxNAo+IHN1ZG8gYnVzeWJveCBkZXZtZW0gMHhGRDkwMDgxNAo+
IHN1ZG8gYnVzeWJveCBkZXZtZW0gMHhGRDkwMDkxNAo+IHN1ZG8gYnVzeWJveCBkZXZtZW0gMHhG
RDkwMEExNAoKIyBidXN5Ym94IGRldm1lbSAweEZEOTAwNjE0CjB4MDAwMjAwMjAKIyBidXN5Ym94
IGRldm1lbSAweEZEOTAwNzE0CjB4MDAwMDAwMDAKIyBidXN5Ym94IGRldm1lbSAweEZEOTAwODE0
CjB4MDAwMDAwMDAKIyBidXN5Ym94IGRldm1lbSAweEZEOTAwOTE0CjB4MDAwMDAwMDAKIyBidXN5
Ym94IGRldm1lbSAweEZEOTAwQTE0CjB4MDAwMDAwMDAKCkkgZ2V0IHRoZSBzYW1lIHZhbHVlcyB3
aXRoIHRoZSBtYWlubGluZSBrZXJuZWwgYW5kIDQuMTcuCgpCcmlhbgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD54E4EE09
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 19:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9911D6E906;
	Fri, 21 Jun 2019 17:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB506E906
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 17:42:25 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 4044F20020;
 Fri, 21 Jun 2019 19:42:22 +0200 (CEST)
Date: Fri, 21 Jun 2019 19:42:15 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH 0/2] MSM8998 MTP Display
Message-ID: <20190621174215.GA16409@ravnborg.org>
References: <20190614185547.34518-1-jeffrey.l.hugo@gmail.com>
 <CAOCk7NoaP=DkNLgdiUw5M0JYRGEGGCFQkn1sCO9dqtexMPC9dQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOCk7NoaP=DkNLgdiUw5M0JYRGEGGCFQkn1sCO9dqtexMPC9dQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
 a=_aGGFSCzEicpxybLgu0A:9 a=CjuIK1q_8ugA:10
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Dave Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 thierry.reding@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmVmZnJleS4KCk9uIEZyaSwgSnVuIDIxLCAyMDE5IGF0IDExOjMxOjUwQU0gLTA2MDAsIEpl
ZmZyZXkgSHVnbyB3cm90ZToKPiBPbiBGcmksIEp1biAxNCwgMjAxOSBhdCAxMjo1NSBQTSBKZWZm
cmV5IEh1Z28gPGplZmZyZXkubC5odWdvQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gU2luY2Ug
d2UgYXJlIHRyeWluZyB0byBnZXQgdGhlIEdQVSBhbmQgZGlzcGxheSBoYXJkd2FyZSBpbiB0aGUg
U29DCj4gPiBzdXBwb3J0ZWQsIGl0IHdvdWxkIGJlIG5pY2UgdG8gYmUgYWJsZSB0byBwdXQgdGhl
IG91dHB1dCBvbiB0aGUKPiA+IGludGVncmF0ZWQgcGFuZWwgZm9yIHRoZSByZWZlcmVuY2UgcGxh
dGZvcm0uICBUbyBkbyBzbywgd2UgbmVlZCBzdXBwb3J0Cj4gPiBpbiB0aGUgVHJ1bHkgZHJpdmVy
IHRvIHN1cHBvcnQgdGhlIHNwZWNpZmljIHBhbmVsIHZhcmlhbnQgZm9yIHRoZQo+ID4gTVNNODk5
OCBNVFAuICBUaGlzIHNlcmllcyBhZGRzIHRhaHQgc3VwcG9ydC4KPiA+Cj4gPiBKZWZmcmV5IEh1
Z28gKDIpOgo+ID4gICBkdC1iaW5kaW5nczogZGlzcGxheTogdHJ1bHk6IEFkZCBNU004OTk4IE1U
UCBwYW5lbAo+ID4gICBkcm0vcGFuZWw6IHRydWx5OiBBZGQgTVNNODk5OCBNVFAgc3VwcG9ydAo+
IAo+IExldHMgYWN0dWFsbHkgaG9sZCBvZmYgb24gdGhpcyBzZXJpZXMuICBJIHRob3VnaHQgSSBj
b3VsZCBzb2x2ZSBhbgo+IGlzc3VlIGluIHRoZSBEU0kgZHJpdmVyLCBidXQgdGhhdHMgbm90IHdv
cmtpbmcgb3V0IGxpa2UgaG93IEknZCBob3BlZC4KPiBJIG1heSBuZWVkIHRvIHJld29yayB0aGlz
LgoKVGhhbmtzIGZvciB0aGUgaGVhZHMgdXAsIGFuZCBnb29kIGx1Y2sgd2l0aCBpdC4KRGVzcGl0
ZSB0aGUgbWlzc2luZyByZXNwb25zZSBvbiB0aGlzIHBhdGNoc2V0IHBsZWFzZSBkbyBub3QgaGVz
aXRhdGUKdG8gcG9zdCBhbiB1cGRhdGVkIHZlcnNpb24gb3IgYW5vdGhlciBwYXRjaHNldCBpbiB0
aGUgZnV0dXJlLgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=

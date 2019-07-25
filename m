Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 537DD75238
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 17:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21D36E76C;
	Thu, 25 Jul 2019 15:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5D06E76C
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 15:10:50 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id C4DE180503;
 Thu, 25 Jul 2019 17:10:48 +0200 (CEST)
Date: Thu, 25 Jul 2019 17:10:47 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 0/3] drm/tinydrm: Rename to drm/tiny
Message-ID: <20190725151047.GA12176@ravnborg.org>
References: <20190725105132.22545-1-noralf@tronnes.org>
 <20190725120632.GC15868@phenom.ffwll.local>
 <9783d219-d044-83a9-66d2-f7f36713f9eb@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9783d219-d044-83a9-66d2-f7f36713f9eb@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8
 a=M1W14baCe2PArQVVfVgA:9 a=wPNLvfGTeEIA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 hdegoede@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTm9yYWxmLgoKT24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMDI6NDY6MDhQTSArMDIwMCwgTm9y
YWxmIFRyw7hubmVzIHdyb3RlOgo+IAo+IAo+IERlbiAyNS4wNy4yMDE5IDE0LjA2LCBza3JldiBE
YW5pZWwgVmV0dGVyOgo+ID4gT24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMTI6NTE6MjlQTSArMDIw
MCwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+ID4+IFRoaXMgaXMgdGhlIGZpbmFsIHBvbGlzaCBv
biB0aW55ZHJtIHR1cm5pbmcgaXQgaW50byBfdGhlXyBwbGFjZSBmb3IgdGlueQo+ID4+IERSTSBk
cml2ZXJzLgo+ID4+Cj4gPj4gTm9yYWxmLgo+ID4+Cj4gPj4gTm9yYWxmIFRyw7hubmVzICgzKToK
PiA+PiAgIGRybS90aW55ZHJtL0tjb25maWc6IFJlbW92ZSBtZW51Y29uZmlnIERSTV9USU5ZRFJN
Cj4gPj4gICBkcm0vdGlueWRybTogUmVuYW1lIGZvbGRlciB0byB0aW55Cj4gPj4gICBkcm0vZ20x
MnUzMjA6IE1vdmUgZHJpdmVyIHRvIGRybS90aW55CkkgaGF2ZSB0aHJvd24gdGhlIHBhdGNoLXNl
dCBhZnRlciBteSB1c3VhbCBidWlsZCB0ZXN0aW5nLgpMb29rcyBnb29kIC0gc28geW91IGNhbiBj
b25zaWRlciB0aGUgZnVsbCBzZXJpZXM6CkFja2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZu
Ym9yZy5vcmc+Cgo+ID4gCj4gPiBJIHdvbmRlciB3aGV0aGVyIHdlIGNvdWxkIHBsYWNlIGEgZG9j
dW1lbnRhdGlvbiBoaW50IHNvbWV3aGVyZSB0byBwdXQKPiA+IHRpbnkgZHJtIGRyaXZlcnMgKGku
ZS4gb25lIGZpbGUgb25seSwgYW5kIHRoYXQgb25lIHByZXR0eSBzbWFsbCkgaW50bwo+ID4gZHJt
L3RpbnkuIEJ1dCBJIGNvdWxkbid0IGNvbWUgdXAgd2l0aCBhIGdvb2QgcGxhY2UuIE1heWJlIHJl
LWFkZCB0aW55LnJzdAo+ID4gd2l0aCBhIHNob3J0IG92ZXJ2aWV3IHBhcmFncmFwaCB0aGF0IHBv
aW50cyBhdCB0aGUgbW9zdCB1c2VmdWwgaGVscGVycyBmb3IKPiA+IHRpbnkgZHJpdmVycywgcGx1
cyBob3cgdG8gaW50ZWdyYXRlIHRoZW0/IEtpbmRhIGFzIGEgRkFRIHRvIHRoZSAiSSB3YW50IHRv
Cj4gPiBwb3J0IGFuIGZiZGV2IGRyaXZlciwgaGFscCBwbHM/IiBxdWVzdGlvbi4KPiA+IAo+IAo+
IFNhbSwgaXMgdGhpcyBzb21ldGhpbmcgeW91IGNvdWxkIGRvLCB5b3UgZ2l2aW5nIGEgdGFsayBh
Ym91dCB0aGlzIGFuZAo+IGV2ZXJ5dGhpbmcgOi0pCgpUYWxrIHByb3Bvc2FsIGlzIGFjY2VwdGVk
LCBidXQgSSBuZWVkIHRvIGdldCBhIGZldyBkZXRhaWxzIGluIG9yZGVyCmhlcmUuICh3b3JrLCBm
YW1pbHkgc3R1ZmYpLgoKQW5kIHRoZW4gSSBhbHNvIGhvcGUgdG8gYWN0YXVsbHkgY3JlYXRlIGEg
Zmlyc3QgdGlueSBkcml2ZXIgLSBhd2FpdGluZwpkaXNwbGF5IHRvIGFycml2ZSBieSBtYWlsLgoK
QnV0IGlmIHRoYXQgYWxsIHN1Y2NlZWRzIHRoZW4gSSB3aWxsIGJlIGhhcHB5IHRvIHRyeSB0byBj
b21lIHVwIHdpdGgKc29tZXRoaW5nIHRoYXQgd291bGQgaGF2ZSBoZWxwZWQgbWUuCgoJU2FtCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

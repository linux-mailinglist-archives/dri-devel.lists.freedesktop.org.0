Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE001AE70E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 22:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9B36EACB;
	Fri, 17 Apr 2020 20:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2D96EACB
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 20:58:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6343297D;
 Fri, 17 Apr 2020 22:58:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1587157120;
 bh=6SI4dmlhllztRR9pK3rgtHcrelb+v8IARh7iYR9e0QA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hQ+J9iiofVWi4bLBC97a+y595x/upPgPWZL8HE6e1Rv9RcAHDW4+UMkCCObFNWNrY
 g8ydWqQpSQVbwaRsYozd1PG1t/7+dvHLu5QMf6UdXKcVvxN89GpiBEV/HjAjE81zcN
 fpBXTHnwSqTO1M7a68C7J3vUVI8lCP24SZHN5V38=
Date: Fri, 17 Apr 2020 23:58:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 2/3] drm/tegra: output: Support DRM bridges
Message-ID: <20200417205828.GM5861@pendragon.ideasonboard.com>
References: <20200417175238.27154-1-digetx@gmail.com>
 <20200417175238.27154-3-digetx@gmail.com>
 <20200417193018.GI5861@pendragon.ideasonboard.com>
 <0acc35fd-a74b-e726-7a16-55db13265c39@gmail.com>
 <20200417203154.GK5861@pendragon.ideasonboard.com>
 <15002e6e-de36-899f-0d28-896c67a29a49@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <15002e6e-de36-899f-0d28-896c67a29a49@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG1pdHJ5LAoKT24gRnJpLCBBcHIgMTcsIDIwMjAgYXQgMTE6NTI6MTFQTSArMDMwMCwgRG1p
dHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDE3LjA0LjIwMjAgMjM6MzEsIExhdXJlbnQgUGluY2hhcnQg
0L/QuNGI0LXRgjoKPiA+IE9uIEZyaSwgQXByIDE3LCAyMDIwIGF0IDEwOjQxOjU5UE0gKzAzMDAs
IERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiA+PiAxNy4wNC4yMDIwIDIyOjMwLCBMYXVyZW50IFBp
bmNoYXJ0INC/0LjRiNC10YI6Cj4gPj4gLi4uCj4gPj4+PiAgI2luY2x1ZGUgPGRybS9kcm1fYXRv
bWljLmg+Cj4gPj4+PiArI2luY2x1ZGUgPGRybS9kcm1fYnJpZGdlLmg+Cj4gPj4+Cj4gPj4+IFlv
dSBjb3VsZCBhZGQgYSBmb3J3YXJkIGRlY2xhcmF0aW9uIG9mIHN0cnVjdCBkcm1fYnJpZGdlIGlu
c3RlYWQsIHRoYXQKPiA+Pj4gY2FuIGxvd2VyIHRoZSBjb21waWxhdGlvbiB0aW1lIGEgbGl0dGxl
IGJpdC4KPiA+Pgo+ID4+IFRoaXMgaW5jbHVkZSBpcyBub3Qgb25seSBmb3IgdGhlIHN0cnVjdCwg
YnV0IGFsc28gZm9yIHRoZQo+ID4+IGRybV9icmlkZ2VfYXR0YWNoKCkuIEl0IGxvb2tzIHRvIG1l
IHRoYXQgaXQgc2hvdWxkIGJlIG5pY2VyIHRvIGtlZXAgdGhlCj4gPj4gaW5jbHVkZSBoZXJlLgo+
ID4gCj4gPiBkcm1fYnJpZGdlX2F0dGFjaCgpIGlzIGNhbGxlZCBmcm9tIC5jIGZpbGVzLiBJbiB0
aGUgLmggZmlsZSB5b3UgY2FuIHVzZQo+ID4gYSBmb3J3YXJkIGRlY2xhcmF0aW9uLiBJdCdzIGVu
dGlyZWx5IHVwIHRvIHlvdSwgYnV0IGFzIGEgZ2VuZXJhbCBydWxlLCBJCj4gPiBwZXJzb25hbGx5
IHRyeSB0byB1c2UgZm9yd2FyZCBzdHJ1Y3R1cmUgZGVjbGFyYXRpb25zIGluIC5oIGZpbGVzIGFz
IG11Y2gKPiA+IGFzIHBvc3NpYmxlLgo+IAo+IFRoZSBjdXJyZW50IFRlZ3JhIERSTSBjb2RlIGlz
IGEgYml0IGluY29uc2lzdGVudCBpbiByZWdhcmRzIHRvIGhhdmluZwo+IGZvcndhcmQgZGVjbGFy
YXRpb25zLCBpdCBkb2Vzbid0IGhhdmUgdGhlbSBtb3JlIHRoYW4gaGF2ZS4KPiAKPiBJJ2xsIGFk
ZCBhIGZvcndhcmQgZGVjbGFyYXRpb24gaWYgdGhlcmUgd2lsbCBiZSBuZWVkIHRvIG1ha2UgYSB2
NSwgb2s/CgpJdCdzIHVwIHRvIHlvdSwgeW91IGRvbid0IGhhdmUgdG8gdXNlIGEgZm9yd2FyZCBk
ZWNsYXJhdGlvbiBpZiB5b3UgZG9uJ3QKd2FudCB0bywgSSB3YXMganVzdCBwb2ludGluZyBvdXQg
d2hhdCBJIHRoaW5rIGlzIGEgYmVzdCBwcmFjdGljZSBydWxlCjotKQoKPiA+PiAuLi4KPiA+Pj4+
ICsJcG9ydCA9IG9mX2dldF9jaGlsZF9ieV9uYW1lKG91dHB1dC0+b2Zfbm9kZSwgInBvcnQiKTsK
PiA+Pj4KPiA+Pj4gRG8geW91IG5lZWQgdG8gY2hlY2sgZm9yIHRoZSBwcmVzZW5jZSBvZiBhIHBv
cnQgbm9kZSBmaXJzdCA/IENhbiB5b3UKPiA+Pj4ganVzdCBjaGVjayB0aGUgcmV0dXJuIHZhbHVl
IG9mIGRybV9vZl9maW5kX3BhbmVsX29yX2JyaWRnZSgpLCBhbmQgZmFsbAo+ID4+PiBiYWNrIHRv
ICJudmlkaWEscGFuZWwiIGlmIGl0IHJldHVybnMgLUVOT0RFViA/Cj4gPj4KPiA+PiBXaXRob3V0
IHRoZSBjaGVjaywgdGhlIGRybV9vZl9maW5kX3BhbmVsX29yX2JyaWRnZSgpIHByaW50cyBhIHZl
cnkgbm9pc3kKPiA+PiBlcnJvciBtZXNzYWdlIGFib3V0IG1pc3NpbmcgcG9ydCBub2RlIGZvciBl
dmVyeSBvdXRwdXQgdGhhdCBkb2Vzbid0IGhhdmUKPiA+PiBhIGdyYXBoIHNwZWNpZmllZCBpbiBh
IGRldmljZS10cmVlIChIRE1JLCBEU0kgYW5kIGV0YykuCj4gPj4KPiA+PiBodHRwczovL2VsaXhp
ci5ib290bGluLmNvbS9saW51eC92NS43LXJjMS9zb3VyY2UvZHJpdmVycy9vZi9wcm9wZXJ0eS5j
I0w2MjEKPiA+IAo+ID4gQWggeWVzIGluZGVlZC4gVGhhdCdzIG5vdCB2ZXJ5IG5pY2UuCj4gCj4g
UGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSdsbCBoYXZlIGEgYmV0dGVyIGlkZWEgYWJvdXQgaG93
IHRoaXMgY291bGQgYmUKPiBoYW5kbGVkLgoKSXQgc2hvdWxkIGJlIGdvb2QgZW5vdWdoIGFzLWlz
IEkgdGhpbmsuIFlvdSBtYXkgaG93ZXZlciB3YW50IHRvIHN1cHBvcnQKYm90aCAicG9ydCIgYW5k
ICJwb3J0cyIsIGFzIGV2ZW4gd2hlbiB0aGVyZSdzIGEgc2luZ2xlIHBvcnQgbm9kZSwgaXQKY291
bGQgYmUgcHV0IGluc2lkZSBhIHBvcnRzIG5vZGUuCgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGlu
Y2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

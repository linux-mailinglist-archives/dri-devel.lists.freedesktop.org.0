Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9E0B63FC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 15:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE61899E8;
	Wed, 18 Sep 2019 13:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6494A899E8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 13:03:43 +0000 (UTC)
Received: from pendragon.ideasonboard.com (126.92.103.87.rev.vodafone.pt
 [87.103.92.126])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 35E4B325;
 Wed, 18 Sep 2019 15:03:41 +0200 (CEST)
Date: Wed, 18 Sep 2019 16:03:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Gareth Williams <gareth.williams.jx@renesas.com>
Subject: Re: DRM Driver implementation question
Message-ID: <20190918130331.GD6306@pendragon.ideasonboard.com>
References: <TY2PR01MB29242CA3B8CBE834A5B0CC48DF8C0@TY2PR01MB2924.jpnprd01.prod.outlook.com>
 <TYAPR01MB4544D0B345C809CD3555A9EFD88F0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <TY2PR01MB292423C617848A66F61B1027DF8F0@TY2PR01MB2924.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TY2PR01MB292423C617848A66F61B1027DF8F0@TY2PR01MB2924.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1568811821;
 bh=Bd/SwyG0H1MmBai0JFG0Y2O/9j+qimtkExgKIEyutN4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UQBGw2zF2DMetIvPGfASDFUK+z2+czuQ8xOWA2Tntr2PP1ZLHdwNIHGfiykKn+zE2
 ZJju+HHXrE+Xd7vU71iLimj0WXIyYxp51fsEyz3XwN/IVTF7MsWBYU5wH0gzbOTFbg
 bxqO/nc4GY6asCAmu2o7EybYuyH1p18Ct30KTuDM=
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2FyZXRoLAoKU29ycnkgZm9yIHRoZSBkZWxheWVkIHJlc3BvbnNlLCBJIHdhcyB0cmF2ZWxs
aW5nIGZvciB0aGUgTGludXggUGx1bWJlcnMKQ29uZmVyZW5jZSBmb2xsb3dlZCBieSBhIGNvZGUg
Y2FtcC4KCk9uIFR1ZSwgU2VwIDE3LCAyMDE5IGF0IDAzOjI3OjM0UE0gKzAwMDAsIEdhcmV0aCBX
aWxsaWFtcyB3cm90ZToKPiBIaSBZb3NoaWhpcm8sCj4gCj4gVGhpcyBsb29rcyBsaWtlIGFuIGVs
ZWdhbnQgc29sdXRpb24gdGhhdCBJIGNhbiBpbXBsZW1lbnQuCj4gTWFueSB0aGFua3MgZm9yIHBv
aW50aW5nIG1lIGluIGEgZ29vZCBkaXJlY3Rpb24uCj4gCj4gPiBGcm9tOiBZb3NoaWhpcm8gU2hp
bW9kYSwgU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDE3LCAyMDE5IDA1OjM5IFBNCj4gPiAKPiA+
IEhpIEdhcmV0aCwKPiA+IAo+ID4gPiBGcm9tOiBHYXJldGggV2lsbGlhbXMsIFNlbnQ6IE1vbmRh
eSwgU2VwdGVtYmVyIDE2LCAyMDE5IDEwOjU2IFBNCj4gPiA+Cj4gPiA+IEhpIExhdXJlbnQvS2ll
cmFuLAo+ID4gPgo+ID4gPiBJIG5lZWQgdG8gdXBzdHJlYW0gYSBkcml2ZXIgZm9yIGEgZGlzcGxh
eSBjb250cm9sbGVyIHRoYXQgd2l0aGluIGl0cwo+ID4gPiByZWdpc3RlcnMgbWVtb3J5IHJlZ2lv
biBjb250YWlucyByZWdpc3RlcnMgcmVsYXRlZCB0byBhIFBXTQo+ID4gPiBkZXZpY2UuIFRoZSBQ
V00gZGV2aWNlIGlzIGZvciBjb250cm9sbGluZyB0aGUgYmFja2xpZ2h0IG9mIHRoZQo+ID4gPiBk
aXNwbGF5Lgo+ID4gPgo+ID4gPiBJZGVhbGx5LCBJIHdvdWxkIGxpa2UgdG8gY3JlYXRlIGEgc2Vw
YXJhdGVkIGRyaXZlciBmb3IgdGhlIFBXTSwgc28KPiA+ID4gdGhhdCBJIGNhbiByZS11c2UgInB3
bS1iYWNrbGlnaHQiLCBidXQgc2luY2UgdGhlIHJlZ2lzdGVycyBmb3IgdGhlIFBXTQo+ID4gPiBh
cmUgcmlnaHQgaW4gdGhlIG1pZGRsZSBvZiB0aGUgcmVnaXN0ZXJzIGZvciB0aGUgZGlzcGxheQo+
ID4gPiBjb250cm9sbGVyIEkgd291bGQgbmVlZCB0byBpb3JlbWFwIHRoZSBtZW1vcnkgcmVnaW9u
IGZvciB0aGUgUFdNCj4gPiA+IHJlZ2lzdGVycyByZWdpb24gdHdpY2UsIG9uY2UgZnJvbSB0aGUg
ZGlzcGxheSBjb250cm9sbGVyIGRyaXZlciwKPiA+ID4gYW5kIG9uY2UgZnJvbSB0aGUgUFdNIGRy
aXZlci4KPiA+ID4KPiA+ID4gRG8geW91IHRoaW5rIHRoYXQgdGhlIGRvdWJsZSBpb3JlbWFwIHdv
dWxkIGJlIGFjY2VwdGFibGUgdXBzdHJlYW0/Cj4gPiAKPiA+IEkgdGhpbmsgdGhhdCBhbiBNRkQg
ZHJpdmVyIGNhbiBzdXBwb3J0IHN1Y2ggaGFyZHdhcmUuIEkgY2hlY2tlZAo+ID4gRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZCByb3VnaGx5LCBhbmQgdGhlbiBhdG1lbC1obGNk
Yy50eHQKPiA+IHNlZW1zIHRvIGhhdmUgYSBkaXNwbGF5IGNvbnRyb2xsZXIgYW5kIGEgUFdNIGRl
dmljZS4KCldoaWxlIE1GRCBzaG91bGQgdGVjaG5pY2FsbHkgd29yaywgSSB0aGluayBpdCdzIHF1
aXRlIG92ZXJraWxsLiBZb3UKY291bGQgaW5zdGVhZCBidW5kbGUgYm90aCB0aGUgZGlzcGxheSBj
b250cm9sbGVyIGFuZCB0aGUgUFdNIGNvbnRyb2xsZXIKaW4gdGhlIHNhbWUgZHJpdmVyLiBUaGUg
ZHJpdmVyIHdvdWxkIGNyZWF0ZSBib3RoIGEgRFJNL0tNUyBkZXZpY2UgYW5kIGEKUFdNIGRldmlj
ZS4gVGhlIERUIG5vZGUgZm9yIHlvdXIgZGV2aWNlIHdvdWxkIGNvbnRhaW4gYSAjcHdtLWNlbGxz
CnByb3BlcnR5IGFuZCBjb3VsZCB0aHVzIGJlIHJlZmVyZW5jZWQgYXMgYSBQV00gY29udHJvbGxl
ciBieSB0aGUKYmFja2xpZ2h0IHVzaW5nIHRoZSBwd21zIHByb3BlcnR5LgoKLS0gClJlZ2FyZHMs
CgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==

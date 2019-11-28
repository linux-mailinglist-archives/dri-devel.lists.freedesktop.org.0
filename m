Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E072810C4C0
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 09:10:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C806E5FC;
	Thu, 28 Nov 2019 08:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514CD6E60A
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 08:09:59 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [104.132.253.101])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 36215729;
 Thu, 28 Nov 2019 09:09:55 +0100 (CET)
Date: Thu, 28 Nov 2019 10:09:46 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v7 3/7] drm: rcar-du: Add support for CMM
Message-ID: <20191128080946.GF4711@pendragon.ideasonboard.com>
References: <20191113100556.15616-1-jacopo+renesas@jmondi.org>
 <20191113100556.15616-4-jacopo+renesas@jmondi.org>
 <CAMuHMdWS2bv=RhQ3y5gNzZFT6CeH-a+h7xc6KYvcv0Anht6zGw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdWS2bv=RhQ3y5gNzZFT6CeH-a+h7xc6KYvcv0Anht6zGw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1574928597;
 bh=4275TLqavidGFPsDBkZNj9mIhffOCitIlDAiAtt5RTA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jia25AtAMik5jIDCOTSO/dq60rdg6LyCZI64IGWVenk/0KEFt+8vxt//Cpd8yDmeD
 K1BEYSDAYIa4meJ77TzXpfkM4hRjVrsgmfHxhW21shJ8aI8mQPCeXq+dFxjJyzNIum
 5bXL5WVlhN2v+Buuzo0PlfFmA5oVvU4PPKvLS+GQ=
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
Cc: Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Ulrich Hecht <uli+renesas@fpond.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsCgpPbiBUaHUsIE5vdiAyOCwgMjAxOSBhdCAwODo1NjoxNEFNICswMTAwLCBHZWVy
dCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gT24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMTE6MDQgQU0g
SmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPiB3cm90ZToKPiA+IEFkZCBh
IGRyaXZlciBmb3IgdGhlIFItQ2FyIERpc3BsYXkgVW5pdCBDb2xvciBDb3JyZWN0aW9uIE1vZHVs
ZS4KPiA+IEluIG1vc3Qgb2YgR2VuMyBTb0NzLCBlYWNoIERVIG91dHB1dCBjaGFubmVsIGlzIHBy
b3ZpZGVkIHdpdGggYSBDTU0gdW5pdAo+ID4gdG8gcGVyZm9ybSBpbWFnZSBlbmhhbmNlbWVudCBh
bmQgY29sb3IgY29ycmVjdGlvbi4KPiA+Cj4gPiBBZGQgc3VwcG9ydCBmb3IgQ01NIHRocm91Z2gg
YSBkcml2ZXIgdGhhdCBzdXBwb3J0cyBjb25maWd1cmF0aW9uIG9mCj4gPiB0aGUgMS1kaW1lbnNp
b25hbCBMVVQgdGFibGUuIE1vcmUgYWR2YW5jZWQgQ01NIGZlYXR1cmVzIHdpbGwgYmUKPiA+IGlt
cGxlbWVudGVkIG9uIHRvcCBvZiB0aGlzIGluaXRpYWwgb25lLgo+ID4KPiA+IFJldmlld2VkLWJ5
OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4g
PiBSZXZpZXdlZC1ieTogS2llcmFuIEJpbmdoYW0gPGtpZXJhbi5iaW5naGFtK3JlbmVzYXNAaWRl
YXNvbmJvYXJkLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3Jl
bmVzYXNAam1vbmRpLm9yZz4KPiAKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L0tj
b25maWcKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L0tjb25maWcKPiA+IEBAIC01
LDYgKzUsNyBAQCBjb25maWcgRFJNX1JDQVJfRFUKPiA+ICAgICAgICAgZGVwZW5kcyBvbiBBUk0g
fHwgQVJNNjQKPiA+ICAgICAgICAgZGVwZW5kcyBvbiBBUkNIX1JFTkVTQVMgfHwgQ09NUElMRV9U
RVNUCj4gPiAgICAgICAgIGltcGx5IERSTV9SQ0FSX0xWRFMKPiA+ICsgICAgICAgaW1wbHkgRFJN
X1JDQVJfQ01NCj4gPiAgICAgICAgIHNlbGVjdCBEUk1fS01TX0hFTFBFUgo+ID4gICAgICAgICBz
ZWxlY3QgRFJNX0tNU19DTUFfSEVMUEVSCj4gPiAgICAgICAgIHNlbGVjdCBEUk1fR0VNX0NNQV9I
RUxQRVIKPiA+IEBAIC0xMyw2ICsxNCwxMyBAQCBjb25maWcgRFJNX1JDQVJfRFUKPiA+ICAgICAg
ICAgICBDaG9vc2UgdGhpcyBvcHRpb24gaWYgeW91IGhhdmUgYW4gUi1DYXIgY2hpcHNldC4KPiA+
ICAgICAgICAgICBJZiBNIGlzIHNlbGVjdGVkIHRoZSBtb2R1bGUgd2lsbCBiZSBjYWxsZWQgcmNh
ci1kdS1kcm0uCj4gPgo+ID4gK2NvbmZpZyBEUk1fUkNBUl9DTU0KPiA+ICsgICAgICAgdHJpc3Rh
dGUgIlItQ2FyIERVIENvbG9yIE1hbmFnZW1lbnQgTW9kdWxlIChDTU0pIFN1cHBvcnQiCj4gPiAr
ICAgICAgIGRlcGVuZHMgb24gRFJNICYmIE9GCj4gPiArICAgICAgIGRlcGVuZHMgb24gRFJNX1JD
QVJfRFUKPiAKPiBEUk1fUkNBUl9EVSBhbHJlYWR5IGRlcGVuZHMgb24gRFJNICYmIE9GLCBzbyB0
aGUgbGluZSBhYm92ZQo+IGNhbiBiZSByZW1vdmVkLgoKSSd2ZSBzZW50IGEgcHVsbCByZXF1ZXN0
IGFscmVhZHkuIENhbiB3ZSBhZGRyZXNzIHRoaXMgb24gdG9wID8gT3IgaXMgaXQKd29ydGggYSBz
ZXBhcmF0ZSBwYXRjaCwgc2hvdWxkIHdlIHdhaXQgdW50aWwgd2UgaGF2ZSB0byB0b3VjaCB0aGlz
IGFuZAp0aGVuIGZpeCBpdCBpbiBhICJ3aGlsZSBhdCBpdCIgZmFzaGlvbiA/CgotLSAKUmVnYXJk
cywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs

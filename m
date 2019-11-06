Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF61F132A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 11:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5F76EC99;
	Wed,  6 Nov 2019 10:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401C76EC99
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 10:01:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41A882D1;
 Wed,  6 Nov 2019 11:01:08 +0100 (CET)
Date: Wed, 6 Nov 2019 12:00:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [GIT PULL FOR v5.5 - 2nd try] R-Car DU CMM support
Message-ID: <20191106100059.GA4878@pendragon.ideasonboard.com>
References: <20191022103135.GC4756@pendragon.ideasonboard.com>
 <20191105194902.GA8235@pendragon.ideasonboard.com>
 <CAPM=9tzhDyPU8GtJXCr+YRhNgx9F=Zo9PGiSbmpBWYkQ4qv9gg@mail.gmail.com>
 <CAPM=9tyh-cMCyKr-A7C0dHmCQaqrm+fypKM+m2zyJ22S5aXC7w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPM=9tyh-cMCyKr-A7C0dHmCQaqrm+fypKM+m2zyJ22S5aXC7w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1573034468;
 bh=/PqiVGBCIQeNpEH3y1qHbC74cbo6UlMA93Ep1BFlMKc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cmN7rerMRLKZ/x55zKpB03C/8gTLaQhWsDgeO3moxJh362QAuYzjcwdT5ybleQBXV
 0b7l40OIl7Z+3T0hr4h6vhgqvdeelYTqAy4nsCbZ3nANvkmUJb/GjKCwmIC5xxZvvr
 Hrh3FaxxgRmBivG3z4zqtr4irljM3H9nfvyz96rk=
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
Cc: jmondi@pendragon.ideasonboard.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2ZSwKCihDQydpbmcgSmFjb3BvKQoKT24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDE6NDA6
MTNQTSArMTAwMCwgRGF2ZSBBaXJsaWUgd3JvdGU6Cj4gT24gV2VkLCA2IE5vdiAyMDE5IGF0IDA1
OjU2LCBEYXZlIEFpcmxpZSB3cm90ZToKPiA+IE9uIFdlZCwgNiBOb3YgMjAxOSBhdCAwNTo0OSwg
TGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiA+ID4KPiA+ID4gSGkgRGF2ZSwKPiA+ID4KPiA+ID4g
SGFzIHRoaXMgcHVsbCByZXF1ZXN0IGZhbGxlbiB0aHJvdWdoIHRoZSBjcmFja3MgPwo+ID4KPiA+
IEl0IGZlbGwgZG93biBhIGRpZmZlcmVudCBjcmFjayB0aGFuIHVzdWFsLCBpdCBtYWRlIGl0IGZy
b20gcGF0Y2h3b3JrCj4gPiBvbnRvIG15IGhhcmQgZHJpdmUsIGJ1dCB0aGVuIEkgZGlkbid0IGV4
ZWN1dGUgdGhlIHB1bGwuCj4gPgo+ID4gSSd2ZSBwdWxsZWQgaXQgZG93biwgdGhhbmtzIGZvciBy
ZW1pbmRlci4KPiAKPiBOb3cgaXQgZmFpbGVkIGFzIEkgbWVudGlvbmVkIG9uIGlyYy4KPiAKPiBJ
IHRoaW5rIHRoZSBuZXcga2NvbmZpZyBvcHRpb24gbmVlZHMgdG8gYmUgYSB0cmlzdGF0ZSwgb3Ro
ZXJ3aXNlCj4gc2V0dGluZyBpdCB0byBZIGFuZCBoYXZpbmcgcmNhci1kdSBhcyBNIGZhaWxzIHRv
IGxpbmsKClNvcnJ5IGFib3V0IHRoYXQgOi1TIEJvdGggSSBhbmQgdGhlIDAtZGF5IGJvdCBmYWls
ZWQgdG8gY2F0Y2ggaXQuCkphY29wbywgY291bGQgeW91IHBsZWFzZSBoYXZlIGEgbG9vayA/IEkn
bSBhZnJhaWQgdGhpcyBsaWtlbHkgbWVhbiBhIG5ldwp2ZXJzaW9uIG9mIHRoZSBzZXJpZXMsIGFu
ZCB0aHVzIG1pc3NpbmcgdGhlIG1lcmdlIHdpbmRvdywgYXMgd2UncmUKYWxyZWFkeSBhdCAtcmM2
LgoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

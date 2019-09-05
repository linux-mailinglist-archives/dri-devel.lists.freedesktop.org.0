Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E52C5AA2EB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 14:21:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B716E07F;
	Thu,  5 Sep 2019 12:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1F26E07F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 12:21:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 55ABB26D;
 Thu,  5 Sep 2019 14:21:13 +0200 (CEST)
Date: Thu, 5 Sep 2019 15:20:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 01/14] dt-bindings: display: renesas,cmm: Add R-Car
 CMM documentation
Message-ID: <20190905122059.GK5035@pendragon.ideasonboard.com>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-2-jacopo+renesas@jmondi.org>
 <CAMuHMdVvjrMXap5CQ-grNYpJfOG6QeN26EW4tR_YE=VFv5ozqw@mail.gmail.com>
 <20190826075943.h7ivwagape3glym5@uno.localdomain>
 <20190826101550.GB5031@pendragon.ideasonboard.com>
 <20190830180108.mlei4wbfn3mktj23@uno.localdomain>
 <20190905115017.GI5035@pendragon.ideasonboard.com>
 <CAMuHMdW-MEQvf7MgY7XQkKap-mm8=TO8V61BFtVv63oacFTfYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdW-MEQvf7MgY7XQkKap-mm8=TO8V61BFtVv63oacFTfYQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1567686073;
 bh=aaf3c4vVXRdYFGABiwBHWtpCoI8rCWYBI5QWUXCGKKw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DdQkpRqsiT5zkmaKzifv4duLBj4Nthqq6t5IzYUXt7NvYAgAdqvlDAY5yVWJ1HVFG
 XfDzPGVHUTCE7sZD3fQ8THQs0/bwMyFvsZcw2yc2AkK+lcAw4xGapS8BehJv4/M3fU
 TSDLxOll4Kdjp09bhAi9G4m6BlbbQ4QXQH9WtF3U=
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
Cc: muroya@ksk.co.jp, Ulrich Hecht <uli@fpond.eu>,
 Jacopo Mondi <jacopo@jmondi.org>, Simon Horman <horms@verge.net.au>,
 VenkataRajesh.Kalakodima@in.bosch.com, David Airlie <airlied@linux.ie>,
 Mark Rutland <mark.rutland@arm.com>,
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsCgpPbiBUaHUsIFNlcCAwNSwgMjAxOSBhdCAwMjowNTozNFBNICswMjAwLCBHZWVy
dCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gT24gVGh1LCBTZXAgNSwgMjAxOSBhdCAxOjUwIFBNIExh
dXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPiBPbiBGcmksIEF1ZyAzMCwgMjAxOSBhdCAwODowMTow
OVBNICswMjAwLCBKYWNvcG8gTW9uZGkgd3JvdGU6Cj4gPiA+IE9uIE1vbiwgQXVnIDI2LCAyMDE5
IGF0IDAxOjE1OjUwUE0gKzAzMDAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPiA+ID4gSG93
IGFib3V0IGNvbnZlcnRpbmcgdGhpcyBiaW5kaW5nIHRvIHlhbWwgYWxyZWF5ID8gSXQgc2hvdWxk
IGJlIGZhaXJseQo+ID4gPiA+IHNpbXBsZS4KPiA+ID4KPiA+ID4gSSdtIHRyeWluZyB0bywgYW5k
IEknbSBoYXZpbmcgbXkgcG9ydGlvbiBvZiBmdW4gdGltZSBhdCBpdC4KPiA+ID4KPiA+ID4gVGhl
IGRlZmluaXRpb24gb2YgdGhlIHNjaGVtYSBpdHNlbGYgc2VlbXMgZ29vZCwgYnV0IEkgd29uZGVy
LCBpcyB0aGlzCj4gPiA+IHRoZSBmaXJzdCByZW5lc2FzIHNjaGVtYSB3ZSBoYXZlPyBCZWNhdXNl
IGl0IHNlZW1zIHRvIG1lIHRoZSBzY2hlbWEKPiA+ID4gdmFsaWRhdG9yIGlzIGhhdmluZyBhbiBo
YXJkIHRpbWUgdG8gZGlnZXN0IHRoZSBleGFtcGxlYSAnY2xvY2tzJyBhbmQKPiA+ID4gJ3Bvd2Vy
LWRvbWFpbnMnIHByb3BlcnRpZXMsIHdoaWNoIGhhdmUgMSBwaGFuZGxlIGFuZCAyIHNwZWNpZmll
cnMgYW5kIDEKPiA+ID4gcGhhbmRsZSBhbmQgMSBzcGVjaWZpZXIgcmVzcGVjdGl2ZWx5IGZvciBS
ZW5zYXMgU29Dcy4KPiA+ID4KPiA+ID4gSW4gb3RoZXIgd29yZHMsIGlmIGluIHRoZSBleGFtcGxl
IEkgaGF2ZToKPiA+ID4KPiA+ID4gIGV4YW1wbGVzOgo+ID4gPiAgICAtIHwKPiA+ID4gICAgICBj
bW0wOiBjbW1AZmVhNDAwMDAgewo+ID4gPiAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2Fz
LHI4YTc3OTYtY21tIjsKPiA+ID4gICAgICAgICAgIHJlZyA9IDwwIDB4ZmVhNDAwMDAgMCAweDEw
MDA+Owo+ID4gPiAgICAgICAgICAgY2xvY2tzID0gPCZjcGcgNzExPiAgICAgICAgICAgICAgPC0t
LS0gMSBwaGFuZGxlICsgMSBzcGVjaWZpZXIKPiA+ID4gICAgICAgICAgIHJlc2V0cyA9IDwmY3Bn
IDcxMT47Cj4gPiA+ICAgICAgICAgICBwb3dlci1kb21haW5zID0gPCZzeXNjPjsgICAgICAgICA8
LS0tLSAxIHBoYW5kbGUKPiA+ID4gICAgICB9Owo+ID4gPgo+ID4gPiBUaGUgc2NoZW1hIHZhbGlk
YXRpb24gaXMgZ29vZC4KPiA+ID4KPiA+ID4gV2hpbGUgaWYgSSB1c2UgYW4gYWN0dWFsIGV4YW1w
bGUKPiA+ID4gICAgLSB8Cj4gPiA+ICAgICAgY21tMDogY21tQGZlYTQwMDAwIHsKPiA+ID4gICAg
ICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyxyOGE3Nzk2LWNtbSI7Cj4gPiA+ICAgICAgICAg
ICByZWcgPSA8MCAweGZlYTQwMDAwIDAgMHgxMDAwPjsKPiA+ID4gICAgICAgICAgIGNsb2NrcyA9
IDwmY3BnIENQR19NT0QgNzExPiAgICAgICAgIDwtLS0tIDEgcGhhbmRsZSArIDIgc3BlY2lmaWVy
Cj4gPiA+ICAgICAgICAgICByZXNldHMgPSA8JmNwZyA3MTE+Owo+ID4gPiAgICAgICAgICAgcG93
ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3Nzk2X1BEX0FMV0FZU19PTj47IDwtLS0tIDEgcGhhbmRs
ZQo+ID4gPiAgICAgIH07ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICsgMSBzcGVjZmllcgo+ID4gPgo+ID4gPiBUaGUgc2NoZW1hIHZhbGlkYXRp
b24gZmFpbHMuLi4KPiA+ID4gRXJyb3I6IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3JlbmVzYXMsY21tLmV4YW1wbGUuZHRzOjIwLjI5LTMwIHN5bnRheCBlcnJvcgo+
ID4gPiBGQVRBTCBFUlJPUjogVW5hYmxlIHRvIHBhcnNlIGlucHV0IHRyZWUKPiA+ID4KPiA+ID4g
QXJlIGNsb2NrcyBwcm9wZXJ0aWVzIHdpdGggPiAyIGVudHJpZXMgYW5kIHBvd2VyLWRvbWFpbnMg
cHJvcGVydGllcyB3aXRoCj4gPiA+ID4gMSBlbnRyaWVzIHN1cHBvcnRlZD8KPiA+ID4KPiA+ID4g
QmVjYXVzZSBmcm9tIHdoYXQgSSByZWFkIGhlcmU6Cj4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9y
b2JoZXJyaW5nL3lhbWwtYmluZGluZ3MvYmxvYi9tYXN0ZXIvc2NoZW1hcy9jbG9jay9jbG9jay55
YW1sCj4gPiA+ICJUaGUgbGVuZ3RoIG9mIGEgY2xvY2sgc3BlY2lmaWVyIGlzIGRlZmluZWQgYnkg
dGhlIHZhbHVlIG9mIGEgI2Nsb2NrLWNlbGxzCj4gPiA+IHByb3BlcnR5IGluIHRoZSBjbG9jayBw
cm92aWRlciBub2RlLiIKPiA+ID4KPiA+ID4gQW5kIHRoYXQncyBleHBlY3RlZCwgYnV0IGlzIHRo
ZSBleGFtcGxlcyBhY3R1YWxseSB2YWxpZGF0ZWQgYWdhaW5zdCB0aGUKPiA+ID4gY2xvY2sgcHJv
dmlkZXIgcG9pbnRlZCBieSB0aGUgcGhhbmRsZT8gQmVjYXVzZSBpbiB0aGF0IGNhc2UsIGlmIHdl
IGhhZCBhCj4gPiA+IHlhbWwgc2NoZW1hIGZvciB0aGUgY3BnLW1zc3IgcHJvdmlkZXIsIGl0IHdv
dWxkIGluZGVlZCBzcGVjaWZ5IGNsb2NrLWNlbGxzPTIuCj4gPiA+Cj4gPiA+IERvIHdlIG5lZWQg
YSBzY2hlbWEgZm9yIGNwZy1tc3NyIGZpcnN0LCBvciBhbSBJIGRvaW5nIHNvbWV0aGluZyBlbHNl
Cj4gPiA+IHdyb25nPwo+ID4KPiA+IEkgdGhpbmsgeW91IGp1c3QgbmVlZCB0byAjaW5jbHVkZSB0
aGUgaGVhZGVycyB0aGF0IGRlZmluZSBDUEdfTU9EIGFuZAo+ID4gUjhBNzc5Nl9QRF9BTFdBWVNf
T04uCj4gCj4gSWYgdGhhdCBoZWxwcywgeW91IG1pZ2h0IHdhbnQgdG8gcmVwbGFjZSB0aGUgc3lt
Ym9scyBpbiB0aGUgZXhhbXBsZXMgYnkgdGhlaXIKPiBhY3R1YWwgdmFsdWVzICgxIHJlc3AuIDMy
KS4KPiAKPiBBbmQgcGVyaGFwcyBrZWVwIHRoZSBzeW1ib2xzIGFzIGNvbW1lbnRzPwo+IAo+ICAg
ICAgICAgY2xvY2tzID0gPCZjcGcgMSAvKiBDUEdfTU9EICovIDcxMT47Cj4gICAgICAgICBwb3dl
ci1kb21haW5zID0gPCZzeXNjIDMyIC8qIFI4QTc3OTZfUERfQUxXQVlTX09OICovPjsKCkkgdGhp
bmsgYWRkaW5nIHRoZSByZXF1aXJlZCAjaW5jbHVkZSBhdCB0aGUgYmVnaW5uaW5nIG9mIHRoZSBl
eGFtcGxlIGlzCmEgYmV0dGVyIHNvbHV0aW9uLgoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNo
YXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

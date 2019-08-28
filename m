Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 794F69FD09
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED75389CF5;
	Wed, 28 Aug 2019 08:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF8A89CD4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 08:28:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62F74310;
 Wed, 28 Aug 2019 10:28:53 +0200 (CEST)
Date: Wed, 28 Aug 2019 11:28:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 02/14] dt-bindings: display, renesas, du: Document cmms
 property
Message-ID: <20190828082846.GA27842@pendragon.ideasonboard.com>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-3-jacopo+renesas@jmondi.org>
 <20190827202945.GA3488@bogus>
 <CAMuHMdUP1kZF4z=NkAb5LCV74dyCMw9pZACMYjOTFE=r2vvR3A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUP1kZF4z=NkAb5LCV74dyCMw9pZACMYjOTFE=r2vvR3A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566980933;
 bh=yHqVMSWrsJvlNfBnMTE1NjxeNpyXRWkgKkXyuwYbZDU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vmsSxbrA2kZqrww2uiRS3uDRX/7GAnSU0FPjyQmdGsgW0H8Wv6oM+JS6YMXe9mBMG
 Lp2TVbmaR343IJXXXDq6m6MwnqN0YNI7c9H1PvDT52FhYLEQakJxYj2Anti4pSMXYG
 yQqtESmSKJVDQrFps1jkMaToiaIYNz8bdtUtHvMk=
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
Cc: muroya@ksk.co.jp, Simon Horman <horms@verge.net.au>,
 Ulrich Hecht <uli@fpond.eu>, David Airlie <airlied@linux.ie>,
 Mark Rutland <mark.rutland@arm.com>,
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com, VenkataRajesh.Kalakodima@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMDk6MzI6MjNBTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IE9uIFR1ZSwgQXVnIDI3LCAyMDE5IGF0IDEwOjI5IFBNIFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gT24gU3VuLCBBdWcgMjUsIDIwMTkgYXQgMDM6
NTE6NDJQTSArMDIwMCwgSmFjb3BvIE1vbmRpIHdyb3RlOgo+ID4gPiBEb2N1bWVudCB0aGUgbmV3
bHkgYWRkZWQgJ2NtbXMnIHByb3BlcnR5IHdoaWNoIGFjY2VwdHMgYSBsaXN0IG9mIHBoYW5kbGUK
PiA+ID4gYW5kIGNoYW5uZWwgaW5kZXggcGFpcnMgdGhhdCBwb2ludCB0byB0aGUgQ01NIHVuaXRz
IGF2YWlsYWJsZSBmb3IgZWFjaAo+ID4gPiBEaXNwbGF5IFVuaXQgb3V0cHV0IHZpZGVvIGNoYW5u
ZWwuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVz
YXNAam1vbmRpLm9yZz4KPiA+ID4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGR1LnR4dCB8IDUgKysrKysK
PiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMs
ZHUudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcmVuZXNh
cyxkdS50eHQKPiA+ID4gaW5kZXggYzk3ZGZhY2FkMjgxLi5jMjI2NWUyYTFhZjIgMTAwNjQ0Cj4g
PiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVz
YXMsZHUudHh0Cj4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3JlbmVzYXMsZHUudHh0Cj4gPiA+IEBAIC00NSw2ICs0NSwxMCBAQCBSZXF1aXJlZCBQ
cm9wZXJ0aWVzOgo+ID4gPiAgICAgIGluc3RhbmNlIHRoYXQgc2VydmVzIHRoZSBEVSBjaGFubmVs
LCBhbmQgdGhlIGNoYW5uZWwgaW5kZXggaWRlbnRpZmllcyB0aGUKPiA+ID4gICAgICBMSUYgaW5z
dGFuY2UgaW4gdGhhdCBWU1AuCj4gPiA+Cj4gPiA+ICsgIC0gY21tczogQSBsaXN0IG9mIHBoYW5k
bGVzIHRvIHRoZSBDTU0gaW5zdGFuY2VzIHByZXNlbnQgaW4gdGhlIFNvQywgb25lCj4gPiA+ICsg
ICAgZm9yIGVhY2ggYXZhaWxhYmxlIERVIGNoYW5uZWwuIFRoZSBwcm9wZXJ0eSBzaGFsbCBub3Qg
YmUgc3BlY2lmaWVkIGZvcgo+ID4gPiArICAgIFNvQ3MgdGhhdCBkbyBub3QgcHJvdmlkZSBhbnkg
Q01NIChzdWNoIGFzIFYzTSBhbmQgVjNIKS4KPiA+Cj4gPiByZW5lc2FzLGNtbXMKPiAKPiBTbyBJ
IGd1ZXNzIHdlIHJlYWxseSB3YW50ZWQgdG8gaGF2ZSB0aGUgcHJlZml4IGZvciB0aGUgdnNwcyBw
cm9wZXJ0eSwgdG9vPwoKWWVzLCB3ZSBzaG91bGQgaGF2ZSA6LSggTXkgYmFkLgoKLS0gClJlZ2Fy
ZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==

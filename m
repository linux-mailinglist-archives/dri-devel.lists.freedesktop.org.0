Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAC02DB9B
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 13:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F986E2D7;
	Wed, 29 May 2019 11:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181206E063;
 Wed, 29 May 2019 01:37:15 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 99F293E93F;
 Wed, 29 May 2019 01:37:13 +0000 (UTC)
Date: Tue, 28 May 2019 21:37:13 -0400
From: Brian Masney <masneyb@onstation.org>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [Freedreno] [PATCH RFC v2 0/6] ARM: qcom: initial Nexus 5
 display support
Message-ID: <20190529013713.GA13245@basecamp>
References: <20190509020352.14282-1-masneyb@onstation.org>
 <CACRpkda-7+ggoeMD9=erPX09OWteX0bt+qP60_Yv6=4XLqNDZQ@mail.gmail.com>
 <20190529011705.GA12977@basecamp>
 <CAOCk7NrRo2=0fPN_Sy1Bhhy+UV7U6uO5aV9uXZc8kc3VpSt71g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOCk7NrRo2=0fPN_Sy1Bhhy+UV7U6uO5aV9uXZc8kc3VpSt71g@mail.gmail.com>
X-Mailman-Approved-At: Wed, 29 May 2019 11:20:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1559093834;
 bh=tyVLy2ENuden01IXz/hRN+5ZbuMQKZkszz/9C9/ss6U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LG/0YABPiyqLpHWPuJMPvOkQV/U7VNgOKLIFW04Hosc+5wdS0fcws/Am9pUUgJZs7
 h78vCOJhG4lEEGCFMiDcxY7jINAPhgKM6OnmqWmUIx3D0EDbh5q10fNu5P06I9oS3A
 C3X8vsq4QxvUZ1aIxVZE1fuAOSwTiCyLGHa0ObeA=
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

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDc6MzI6MTRQTSAtMDYwMCwgSmVmZnJleSBIdWdvIHdy
b3RlOgo+IE9uIFR1ZSwgTWF5IDI4LCAyMDE5IGF0IDc6MTcgUE0gQnJpYW4gTWFzbmV5IDxtYXNu
ZXliQG9uc3RhdGlvbi5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgTWF5IDI4LCAyMDE5IGF0
IDAzOjQ2OjE0UE0gKzAyMDAsIExpbnVzIFdhbGxlaWogd3JvdGU6Cj4gPiA+IE9uIFRodSwgTWF5
IDksIDIwMTkgYXQgNDowNCBBTSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9uLm9yZz4g
d3JvdGU6Cj4gPiA+Cj4gPiA+ID4gSGVyZSBpcyBhIHBhdGNoIHNlcmllcyB0aGF0IGFkZHMgaW5p
dGlhbCBkaXNwbGF5IHN1cHBvcnQgZm9yIHRoZSBMRwo+ID4gPiA+IE5leHVzIDUgKGhhbW1lcmhl
YWQpIHBob25lLiBJdCdzIG5vdCBmdWxseSB3b3JraW5nIHNvIHRoYXQncyB3aHkgc29tZQo+ID4g
PiA+IG9mIHRoZXNlIHBhdGNoZXMgYXJlIFJGQyB1bnRpbCB3ZSBjYW4gZ2V0IGl0IGZ1bGx5IHdv
cmtpbmcuCj4gPiA+ID4KPiA+ID4gPiBUaGUgcGhvbmVzIGJvb3RzIGludG8gdGVybWluYWwgbW9k
ZSwgaG93ZXZlciB0aGVyZSBpcyBhIHNldmVyYWwgc2Vjb25kCj4gPiA+ID4gKG9yIG1vcmUpIGRl
bGF5IHdoZW4gd3JpdGluZyB0byB0dHkxIGNvbXBhcmVkIHRvIHdoZW4gdGhlIGNoYW5nZXMgYXJl
Cj4gPiA+ID4gYWN0dWFsbHkgc2hvd24gb24gdGhlIHNjcmVlbi4gVGhlIGZvbGxvd2luZyBlcnJv
cnMgYXJlIGluIGRtZXNnOgo+ID4gPgo+ID4gPiBJIHRlc3RlZCB0byBhcHBseSBwYXRjaGVzIDIt
NiBhbmQgZ290IHRoZSBjb25zb2xlIHVwIG9uIHRoZSBwaG9uZSBhcyB3ZWxsLgo+ID4gPiBJIHNl
ZSB0aGUgc2FtZSB0aW1vdXRzLCBhbmQgSSBhbHNvIG5vdGljZSB0aGUgdXBkYXRlIGlzIHNsb3cg
aW4gdGhlCj4gPiA+IGRpc3BsYXksIGFzIGlmIHRoZSBEU0kgcGFuZWwgd2FzIHJ1bm5pbmcgaW4g
bG93IHBvd2VyIChMUCkgbW9kZS4KPiA+ID4KPiA+ID4gV2FzIGJvb3RpbmcgdGhpcyB0byBkbyBz
b21lIG90aGVyIHdvcmssIGJ1dCBoYXBweSB0byBzZWUgdGhlIHByb2dyZXNzIQo+ID4KPiA+IFRo
YW5rcyEKPiA+Cj4gPiBJJ3ZlIGhhZCB0aHJlZSBwZW9wbGUgZW1haWwgbWUgb2ZmIGxpc3QgcmVn
YXJkaW5nIHRoZSBkaXNwbGF5IHdvcmtpbmcgb24KPiA+IDQuMTcgYmVmb3JlIHRoZSBtc20ga21z
L2RybSBkcml2ZXIgd2FzIGNvbnZlcnRlZCB0byB0aGUgRFJNIGF0b21pYyBBUEkgc28KPiA+IHRo
aXMgZW1haWwgaXMgdG8gZ2V0IHNvbWUgbW9yZSBpbmZvcm1hdGlvbiBvdXQgcHVibGljbHkuCj4g
Pgo+ID4gSSBwdXNoZWQgdXAgYSBicmFuY2ggdG8gbXkgZ2l0aHViIHdpdGggMTUgcGF0Y2hlcyBh
cHBsaWVkIGFnYWluc3QgNC4xNwo+ID4gdGhhdCBoYXMgYSB3b3JraW5nIGRpc3BsYXk6Cj4gPgo+
ID4gaHR0cHM6Ly9naXRodWIuY29tL21hc25leWIvbGludXgvY29tbWl0cy9kaXNwbGF5LXdvcmtz
LTQuMTcKPiA+Cj4gPiBJdCdzIGluIGxvdyBzcGVlZCBtb2RlIGJ1dCBpdHMgdXNhYmxlLiBUaGUg
Zmlyc3QgMTAgcGF0Y2hlcyBhcmUgaW4KPiA+IG1haW5saW5lIG5vdyBhbmQgdGhlIGxhc3QgNSBh
cmUgaW4gZXNzZW5jZSB0aGlzIHBhdGNoIHNlcmllcyB3aXRoIHRoZQo+ID4gZXhjZXB0aW9uIG9m
ICdkcm0vYXRvbWljK21zbTogYWRkIGhlbHBlciB0byBpbXBsZW1lbnQgbGVnYWN5IGRpcnR5ZmIn
Lgo+ID4gVGhlcmUncyBhIHNsaWdodGx5IGRpZmZlcmVudCB2ZXJzaW9uIG9mIHRoYXQgcGF0Y2gg
aW4gbWFpbmxpbmUgbm93Lgo+ID4KPiA+IEknbSBwbGFubmluZyB0byB3b3JrIG9uIHRoZSBtc204
OTc0IGludGVyY29ubmVjdCBzdXBwb3J0IG9uY2Ugc29tZSBvZgo+ID4gdGhlIG91dHN0YW5kaW5n
IGludGVyY29ubmVjdCBwYXRjaGVzIGZvciB0aGUgbXNtIGttcy9kcm0gZHJpdmVyIGFycml2ZQo+
ID4gaW4gbWFpbmxpbmUuIEknZCByZWFsbHkgbGlrZSB0byB1bmRlcnN0YW5kIHdoeSB0aGUgZGlz
cGxheSB3b3JrcyBvbgo+ID4gNC4xNyB3aXRoIHRob3NlIHBhdGNoZXMgdGhvdWdoLiBJIGFzc3Vt
ZSB0aGF0IGl0J3MgcmVsYXRlZCB0byB0aGUKPiA+IHZibGFuayBldmVudHMgbm90IHdvcmtpbmcg
cHJvcGVybHk/IExldCBtZSBwcmVmYWNlIHRoaXMgd2l0aCBJJ20gYQo+ID4gdG90YWwgRFJNIG5l
d2JpZSwgYnV0IGl0IGxvb2tlZCBsaWtlIHRoZSBwcmUtRFJNLWF0b21pYyBkcml2ZXIgd2Fzbid0
Cj4gPiBsb29raW5nIGZvciB0aGVzZSBldmVudHMgaW4gdGhlIGF0b21pYyBjb21taXRzIGJlZm9y
ZSB0aGUgbWlncmF0aW9uPwo+ID4gU2VlIGNvbW1pdCA3MGRiMThkY2E0ZTAgKCJkcm0vbXNtOiBS
ZW1vdmUgbXNtX2NvbW1pdC93b3JrZXIsIHVzZSBhdG9taWMKPiA+IGhlbHBlciBjb21taXQiKSwg
c3BlY2lmaWNhbGx5IHRoZSBkcm1fYXRvbWljX2hlbHBlcl93YWl0X2Zvcl92YmxhbmtzKCkKPiA+
IGNhbGwgdGhhdCB3YXMgYWRkZWQuCj4gCj4gRG8geW91IGtub3cgaWYgdGhlIG5leHVzIDUgaGFz
IGEgdmlkZW8gb3IgY29tbWFuZCBtb2RlIHBhbmVsPyAgVGhlcmUKPiBpcyBzb21lIGdsaXRjaHlu
ZXNzIHdpdGggdmJsYW5rcyBhbmQgY29tbWFuZCBtb2RlIHBhbmVscy4KCkl0cyBpbiBjb21tYW5k
IG1vZGUuIEkga25vdyB0aGlzIGJlY2F1c2UgSSBzZWUgdHdvICdwcCBkb25lIHRpbWUgb3V0Jwpt
ZXNzYWdlcywgZXZlbiBvbiA0LjE3LiBCYXNlZCBvbiBteSB1bmRlcnN0YW5kaW5nLCB0aGUgcGlu
ZyBwb25nIGNvZGUgaXMKb25seSBhcHBsaWNhYmxlIGZvciBjb21tYW5kIG1vZGUgcGFuZWxzLgoK
QnJpYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

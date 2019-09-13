Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 515A7B2337
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 17:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E906E6F3ED;
	Fri, 13 Sep 2019 15:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7833D6F3ED;
 Fri, 13 Sep 2019 15:20:58 +0000 (UTC)
Received: from localhost (195-23-252-136.net.novis.pt [195.23.252.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2EFE20640;
 Fri, 13 Sep 2019 15:20:57 +0000 (UTC)
Date: Fri, 13 Sep 2019 11:20:54 -0400
From: Sasha Levin <sashal@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4.19 092/190] drm/nouveau: Dont WARN_ON VCPI allocation
 failures
Message-ID: <20190913152054.GJ1546@sasha-vm>
References: <20190913130559.669563815@linuxfoundation.org>
 <20190913130606.981926197@linuxfoundation.org>
 <CAKb7UviY0sjFUc6QqjU4eKxm2b-osKoJNO2CSP9HmQ5AdORgkw@mail.gmail.com>
 <20190913144627.GH1546@sasha-vm>
 <20190913145456.GA456842@kroah.com>
 <20190913150111.GI1546@sasha-vm>
 <20190913151051.GB458191@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190913151051.GB458191@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568388058;
 bh=q86oWfeuxhAlqPdIFDld2EkKC+0kFRxERRG8Te0t3rM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sJiKQwMlQfFioahXvYXlLgUY7+I3SYCR6dXjOBMBL+5fjEezw8ouWjJerqnIbqAxa
 PyEGipKy8fHQO3fl6L2SxhNZcR4p9aU+kUJpkB0WhQet48CpxA6PwLz1PdJZhy3Cxt
 AU5PpFAg2lp4GctjLgVo5/IzWfqUt4OyUm7dV2c4=
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "# 3.9+" <stable@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMDQ6MTA6NTFQTSArMDEwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMTE6MDE6MTFBTSAtMDQwMCwgU2Fz
aGEgTGV2aW4gd3JvdGU6Cj4+IE9uIEZyaSwgU2VwIDEzLCAyMDE5IGF0IDAzOjU0OjU2UE0gKzAx
MDAsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToKPj4gPiBPbiBGcmksIFNlcCAxMywgMjAxOSBh
dCAxMDo0NjoyN0FNIC0wNDAwLCBTYXNoYSBMZXZpbiB3cm90ZToKPj4gPiA+IE9uIEZyaSwgU2Vw
IDEzLCAyMDE5IGF0IDA5OjMzOjM2QU0gLTA0MDAsIElsaWEgTWlya2luIHdyb3RlOgo+PiA+ID4g
PiBIaSBHcmVnLAo+PiA+ID4gPgo+PiA+ID4gPiBUaGlzIGZlZWxzIGxpa2UgaXQncyBtaXNzaW5n
IGEgRnJvbTogbGluZS4KPj4gPiA+ID4KPj4gPiA+ID4gY29tbWl0IGI1MTNhMThjZjFkNzA1YmQw
NGVmZDkxYzQxN2U3OWU0OTM4YmUwOTMKPj4gPiA+ID4gQXV0aG9yOiBMeXVkZSBQYXVsIDxseXVk
ZUByZWRoYXQuY29tPgo+PiA+ID4gPiBEYXRlOiAgIE1vbiBKYW4gMjggMTY6MDM6NTAgMjAxOSAt
MDUwMAo+PiA+ID4gPgo+PiA+ID4gPiAgICBkcm0vbm91dmVhdTogRG9uJ3QgV0FSTl9PTiBWQ1BJ
IGFsbG9jYXRpb24gZmFpbHVyZXMKPj4gPiA+ID4KPj4gPiA+ID4gSXMgdGhpcyBhbiBhcnRpZmFj
dCBvZiB5b3VyIG5vdGlmaWNhdGlvbi1vZi1wYXRjaGVzIHByb2Nlc3MgYW5kIEkKPj4gPiA+ID4g
bmV2ZXIgbm90aWNlZCBiZWZvcmUsIG9yIHdhcyB0aGUgcGF0Y2ggaW5nZXN0ZWQgaW5jb3JyZWN0
bHk/Cj4+ID4gPgo+PiA+ID4gSXQgd2FzIGFsd2F5cyBsaWtlIHRoaXMgZm9yIHBhdGNoZXMgdGhh
dCBjYW1lIHRocm91Z2ggbWUuIEdyZWcncyBzY3JpcHQKPj4gPiA+IGdlbmVyYXRlcyBhbiBleHBs
aWNpdCAiRnJvbToiIGxpbmUgaW4gdGhlIHBhdGNoLCBidXQgSSBuZXZlciBzYXcgdGhlCj4+ID4g
PiB2YWx1ZSBpbiB0aGF0IHNpbmNlIGdpdCBkb2VzIHRoZSByaWdodCB0aGluZyBieSBsb29raW5n
IGF0IHRoZSAiRnJvbToiCj4+ID4gPiBsaW5lIGluIHRoZSBtYWlsIGhlYWRlci4KPj4gPiA+Cj4+
ID4gPiBUaGUgcmlnaHQgdGhpbmcgaXMgYmVpbmcgZG9uZSBpbiBzdGFibGUtcmMgYW5kIGZvciB0
aGUgcmVsZWFzZXMuIEZvcgo+PiA+ID4geW91ciBleGFtcGxlIGhlcmUsIHRoaXMgaXMgaG93IGl0
IGxvb2tzIGxpa2UgaW4gdGhlIHN0YWJsZS1yYyB0cmVlOgo+PiA+ID4KPj4gPiA+IGNvbW1pdCBi
ZGNjODg1YmU2ODI4OWEzN2QwZDA2M2NkOTQzOTBkYTgxZmQ4MTc4Cj4+ID4gPiBBdXRob3I6ICAg
ICBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+PiA+ID4gQXV0aG9yRGF0ZTogTW9uIEph
biAyOCAxNjowMzo1MCAyMDE5IC0wNTAwCj4+ID4gPiBDb21taXQ6ICAgICBHcmVnIEtyb2FoLUhh
cnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+PiA+ID4gQ29tbWl0RGF0ZTogRnJp
IFNlcCAxMyAxNDowNToyOSAyMDE5ICswMTAwCj4+ID4gPgo+PiA+ID4gICAgZHJtL25vdXZlYXU6
IERvbid0IFdBUk5fT04gVkNQSSBhbGxvY2F0aW9uIGZhaWx1cmVzCj4+ID4KPj4gPiBZZWFoLCB3
ZSBzaG91bGQgZml4IHlvdXIgc2NyaXB0cyB0byBwdXQgdGhlIGV4cGxpY2l0IEZyb206IGxpbmUg
aW4gaGVyZQo+PiA+IGFzIHdlIGFyZSBkZWFsaW5nIHdpdGggcGF0Y2hlcyBpbiB0aGlzIGZvcm1h
dCBhbmQgaXQgY2F1c2VzIGNvbmZ1c2lvbiBhdAo+PiA+IHRpbWVzIChsaWtlIG5vdy4pICBJdCdz
IG5vdCB0aGUgZmlyc3QgdGltZSBhbmQgdGhhdCdzIHdoeSBJIGFkZGVkIHRob3NlCj4+ID4gbGlu
ZXMgdG8gdGhlIHBhdGNoZXMuCj4+Cj4+IEhlaCwgZGlkbid0IHRoaW5rIGFueW9uZSBjYXJlZCBh
Ym91dCB0aGlzIHNjZW5hcmlvIGZvciB0aGUgc3RhYmxlLXJjCj4+IHBhdGNoZXMuCj4+Cj4+IEkn
bGwgZ28gYWRkIGl0Lgo+Pgo+PiBCdXQuLi4gd2h5IGRvIHlvdSBhY3R1YWxseSBjYXJlPwo+Cj5P
biB0aGUgZW1haWxzIHdlIHNlbmQgb3V0LCBpdCBoYXMgaW5wcm9wZXIgYXV0aG9yIGluZm9ybWF0
aW9uIHdoaWNoIGNhbgo+Y2F1c2UgY29uZnVzaW9uIHRoYXQgdGhlIHNlbmRlciBvZiB0aGUgZW1h
aWwgKGkuZS4gbWUpIGlzIHNvbWVob3cgc2F5aW5nCj50aGF0IHRoZXkgYXJlIHRoZSBhdXRob3Ig
b2YgdGhlIHBhdGNoLgoKUmlnaHQgcmlnaHQsIEkgYWdyZWUgdGhpcyBpcyB3cm9uZyBhbmQgSSds
bCBmaXggaXQuIEknbSBqdXN0IGNvbmNlcm5lZAphYm91dCB3aGF0IGV4YWN0bHkgeW91IGFyZSBk
b2luZyB3aXRoIHRoZSAtcmMgcGF0Y2hlcyB0byBhY3R1YWxseSBjYXJlCmFib3V0IHRoaXMgOikK
Ci0tClRoYW5rcywKU2FzaGEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs

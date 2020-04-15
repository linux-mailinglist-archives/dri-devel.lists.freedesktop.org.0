Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A99C21AB8F1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 08:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D5316EAE0;
	Thu, 16 Apr 2020 06:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs3.siol.net [185.57.226.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23DF6EA4D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 17:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 7DA5B523E2D;
 Wed, 15 Apr 2020 19:52:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id Mn71HVJwTzMB; Wed, 15 Apr 2020 19:52:38 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 1B19B52389F;
 Wed, 15 Apr 2020 19:52:38 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-194-152-20-232.static.triera.net
 [194.152.20.232]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id 832A5523E96;
 Wed, 15 Apr 2020 19:52:34 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm/sun4i: hdmi ddc clk: Fix size of m divider
Date: Wed, 15 Apr 2020 19:52:28 +0200
Message-ID: <1785843.taCxCBeP46@jernej-laptop>
In-Reply-To: <20200415104214.ndkkxfnufkxgu53r@gilmour.lan>
References: <20200413095457.1176754-1-jernej.skrabec@siol.net>
 <1742537.tdWV9SEqCh@jernej-laptop>
 <20200415104214.ndkkxfnufkxgu53r@gilmour.lan>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 16 Apr 2020 06:59:07 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG5lIHNyZWRhLCAxNS4gYXByaWwgMjAyMCBvYiAxMjo0MjoxNCBDRVNUIGplIE1heGltZSBSaXBh
cmQgbmFwaXNhbChhKToKPiBPbiBNb24sIEFwciAxMywgMjAyMCBhdCAwNjowOTowOFBNICswMjAw
LCBKZXJuZWogxaBrcmFiZWMgd3JvdGU6Cj4gPiBEbmUgcG9uZWRlbGplaywgMTMuIGFwcmlsIDIw
MjAgb2IgMTY6MTI6MzkgQ0VTVCBqZSBDaGVuLVl1IFRzYWkgCm5hcGlzYWwoYSk6Cj4gPiA+IE9u
IE1vbiwgQXByIDEzLCAyMDIwIGF0IDY6MTEgUE0gQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3Jn
PiB3cm90ZToKPiA+ID4gPiBPbiBNb24sIEFwciAxMywgMjAyMCBhdCA1OjU1IFBNIEplcm5laiBT
a3JhYmVjCj4gPiA+ID4gPGplcm5lai5za3JhYmVjQHNpb2wubmV0Pgo+ID4gCj4gPiB3cm90ZToK
PiA+ID4gPiA+IG0gZGl2aWRlciBpbiBEREMgY2xvY2sgcmVnaXN0ZXIgaXMgNCBiaXRzIHdpZGUu
IEZpeCB0aGF0Lgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBGaXhlczogOWM1NjgxMDExYTBjICgiZHJt
L3N1bjRpOiBBZGQgSERNSSBzdXBwb3J0IikKPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEplcm5l
aiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BzaW9sLm5ldD4KPiA+ID4gPiAKPiA+ID4gPiBSZXZp
ZXdlZC1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3JnPgo+ID4gPiAKPiA+ID4gQ2Mgc3Rh
YmxlPwo+ID4gCj4gPiBJIGRvbid0IHRoaW5rIGl0J3MgbmVjZXNzYXJ5Ogo+ID4gMS4gSXQgZG9l
c24ndCBjaGFuZ2UgbXVjaCAoYW55dGhpbmc/KSBmb3IgbWUgd2hlbiByZWFkaW5nIEVESUQuIEkg
ZG9uJ3QKPiA+IHRoaW5rIGl0J3Mgc3VwZXIgaW1wb3J0YW50IHRvIGhhdmUgcHJlY2lzZSBEREMg
Y2xvY2sgaW4gb3JkZXIgdG8gcHJvcGVybHkKPiA+IHJlYWQgRURJRC4gMi4gTm8gbWF0dGVyIGlm
IGl0IGhhcyAiQ2Mgc3RhYmxlIiB0YWcgb3Igbm90LCBpdCB3aWxsIGJlCj4gPiBldmVudHVhbGx5
IHBpY2tlZCBmb3Igc3RhYmxlIGR1ZSB0byBmaXhlcyB0YWcuCj4gPiAKPiA+IFRoaXMgd2FzIG9u
bHkgc21hbGwgb2JzZXJ2YXRpb24gd2hlbiBJIHdhcyByZXNlYXJjaGluZyBFRElEIHJlYWRvdXQg
aXNzdWUKPiA+IG9uIEEyMCBib2FyZCwgYnV0IHNhZGx5LCBJIHdhc24ndCBhYmxlIHRvIGZpZ3Vy
ZSBvdXQgd2h5IHJlYWRpbmcgaXQKPiA+IHNvbWV0aW1lcyBmYWlscy4gSSBub3RpY2VkIHNpbWls
YXIgaXNzdWUgb24gU29DcyB3aXRoIERFMiAobW9zdAo+ID4gcHJvbWluZW50bHkgb24gT3Jhbmdl
UGkgUEMyIC0gSDUpLCBidXQgdGhlcmUgd2FzIGVhc3kgd29ya2Fyb3VuZCAtIEkganVzdAo+ID4g
ZGlzYWJsZWQgdmlkZW8gZHJpdmVyIGluIFUtIEJvb3QuIEhvd2V2ZXIsIGlmIEEyMCBkaXNwbGF5
IGRyaXZlciBnZXRzCj4gPiBkaXNhYmxlZCBpbiBVLUJvb3QsIGl0IHRvdGFsbHkgYnJlYWtzIHZp
ZGVvIG91dHB1dCBvbiBteSBUViB3aGVuIExpbnV4Cj4gPiBib290cyAobm8gb3V0cHV0KS4gSSBn
dWVzcyB0aGVyZSBpcyBtb3JlIGZ1bmRhbWVudGFsIHByb2JsZW0gd2l0aCBjbG9ja3MKPiA+IHRo
YW4ganVzdCBmaWVsZCBzaXplLiBJIHRoaW5rIHdlIHNob3VsZCBhZGQgbW9yZSBjb25zdHJhaW50
cyBpbiBjbG9jawo+ID4gZHJpdmVyLCBsaWtlIHByZXNldCBzb21lIGNsb2NrIHBhcmVudHMgYW5k
IG5vdCBhbGxvdyB0byBjaGFuZ2UgcGFyZW50cwo+ID4gd2hlbiBzZXR0aW5nIHJhdGUsIGJ1dCBj
YXJlZnVsbHksIHNvIHNpbXBsZWZiIGRvZXNuJ3QgYnJlYWsuIFN1Y2gKPiA+IGNvbnN0cmFpbnRz
IHNob3VsZCBhbHNvIHNvbHZlIHByb2JsZW1zIHdpdGggZHVhbCBoZWFkIHNldHVwcy4KPiBJIGRp
c2FncmVlIGhlcmUuIERvaW5nIGFsbCBzb3J0cyBvZiBzcGVjaWFsIGNhc2UganVzdCBkb2Vzbid0
IHNjYWxlLAo+IGFuZCB3ZSdsbCBuZXZlciBoYXZlIHRoZSBzcGVjaWFsIGNhc2VzIHNvcnRlZCBv
dXQgb24gYWxsIHRoZSBib2FyZHMKPiAoYW5kIGl0J3MgYSBuaWdodG1hcmUgdG8gbWFpbnRhaW4p
Lgo+IAo+IEVzcGVjaWFsbHkgc2luY2UgaXQncyBiYXNpY2FsbHkgcHV0dGluZyBhIGJsYW5rZXQg
b3ZlciB0aGUgYWN0dWFsCj4gaXNzdWUgYW5kIGxvb2tpbmcgdGhlIG90aGVyIHdheS4gSWYgdGhl
cmUncyBzb21ldGhpbmcgd3Jvbmcgd2l0aCBob3cKPiB3ZSBkZWFsIHdpdGggKHJlKXBhcmVudGlu
Zywgd2Ugc2hvdWxkIGZpeCB0aGF0LiBJdCBpbXBhY3RzIG1vcmUgdGhhbgo+IGp1c3QgRFJNLCBh
bmQgYWxsIHRoZSBTb0NzLgoKSSBhZ3JlZSB3aXRoIHlvdSB0aGF0IGF1dG9tYXRpYyBzb2x1dGlv
biB3b3VsZCBiZSBiZXN0LCBidXQgSSBqdXN0IGRvbid0IHNlZSAKaXQgaG93IGl0IHdvdWxkIGJl
IGRvbmUuIER1YWwgaGVhZCBkaXNwbGF5IHBpcGVsaW5lIGlzIHByZXR0eSBjb21wbGV4IGZvciAK
Y2xvY2sgZHJpdmVyIHRvIGdldCBpdCByaWdodCBvbiBpdCdzIG93bi4gVGhlcmUgYXJlIGRpZmZl
cmVudCBwb3NzaWJsZSBzZXR1cHMgCmFuZCBzb21lIG9mIHRoZW0gYXJlIGhvdCBwbHVnZ2FibGUs
IGxpa2UgSERNSS4gQW5kIHRoZXJlIGFyZSBhbHNvIFNvQyBzcGVjaWZpYyAKcXVpcmtzLCBsaWtl
IEE2NCwgd2hlcmUgZm9yIHNvbWUgcmVhc29uLCBNSVBJIERQSFkgYW5kIEhETUkgUEhZIHNoYXJl
IHNhbWUgCmNsb2NrIHBhcmVudCAtIFBMTF9WSURFTzAuIFRlY2huaWNhbGx5LCBNSVBJIERQSFkg
Y2FuIGJlIGNsb2NrZWQgZnJvbSAKUExMX1BFUklQSDAgKGZpeGVkIHRvIDYwMCBNSHopLCBidXQg
dGhhdCdzIG5vdCByZWFsbHkgaGVscGZ1bC4gSSdtIG5vdCBldmVuIApzdXJlIGlmIHRoZXJlIGlz
IGFueSBnb29kIHNvbHV0aW9uIHRvIHRoaXMgLSBjZXJ0YWlubHkgSERNSSBhbmQgTUlQSSBjYW4n
dCAKY2xhaW0gZXhjbHVzaXZpdHkgYW5kIHNvbWVob3cgYmVzdCBjb21tb24gcmF0ZSBtdXN0IGJl
IGZvdW5kIGZvciBQTExfVklERU8wLCAKaWYgdGhhdCdzIGV2ZW4gcG9zc2libGUuIEkgd2FzIHN1
cmUgdGhhdCBIRE1JIFBIWSBvbiBBNjQgY2FuIGJlIGNsb2NrZWQgZnJvbSAKUExMX1ZJREVPMSwg
d2hpY2ggd291bGQgc29sdmUgbWFpbiBpc3N1ZSwgYnV0IHRvIGRhdGUsIEkgZGlkbid0IGZpbmQg
YW55IHdheSB0byAKZG8gdGhhdC4KClRoYXQncyBwcmV0dHkgb2ZmIHRvcGljLCBzbyBJIGhvcGUg
b3JpZ2luYWwgcGF0Y2ggY2FuIGJlIG1lcmdlZCBhcy1pcy4KCkJlc3QgcmVnYXJkcywKSmVybmVq
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

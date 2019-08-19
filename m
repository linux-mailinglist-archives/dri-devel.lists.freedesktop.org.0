Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE720920D1
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 11:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4E589193;
	Mon, 19 Aug 2019 09:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 397 seconds by postgrey-1.36 at gabe;
 Mon, 19 Aug 2019 09:58:51 UTC
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl
 [79.96.170.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9007689193;
 Mon, 19 Aug 2019 09:58:51 +0000 (UTC)
Received: from 79.184.254.79.ipv4.supernova.orange.pl (79.184.254.79) (HELO
 kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.275)
 id 11e656f87402486f; Mon, 19 Aug 2019 11:52:10 +0200
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
Date: Mon, 19 Aug 2019 11:52:09 +0200
Message-ID: <2215840.qs0dBhReda@kreacher>
In-Reply-To: <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
References: <20190814213118.28473-1-kherbst@redhat.com>
 <20190814213118.28473-2-kherbst@redhat.com>
 <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
MIME-Version: 1.0
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
Cc: Karol Herbst <kherbst@redhat.com>,
 Mario Limonciello <mario.limonciello@dell.com>,
 nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1cnNkYXksIEF1Z3VzdCAxNSwgMjAxOSAxMjo0NzozNSBBTSBDRVNUIERhdmUgQWlybGll
IHdyb3RlOgo+IE9uIFRodSwgMTUgQXVnIDIwMTkgYXQgMDc6MzEsIEthcm9sIEhlcmJzdCA8a2hl
cmJzdEByZWRoYXQuY29tPiB3cm90ZToKPiA+Cj4gPiBUaGlzIHJldmVydHMgY29tbWl0IDI4NTg2
YTUxZWVhNjY2ZDU1MzFiY2FlZjJmNjhlNGFiYmQ4NzI0MmMuCj4gPgo+ID4gVGhlIG9yaWdpbmFs
IGNvbW1pdCBtZXNzYWdlIGRpZG4ndCBldmVuIG1ha2Ugc2Vuc2UuIEFNRCBfZG9lc18gc3VwcG9y
dCBpdCBhbmQKPiA+IGl0IHdvcmtzIHdpdGggTm91dmVhdSBhcyB3ZWxsLgo+ID4KPiA+IEFsc28g
d2hhdCB3YXMgdGhlIGlzc3VlIGJlaW5nIHNvbHZlZCBoZXJlPyBObyByZWZlcmVuY2VzIHRvIGFu
eSBidWdzIGFuZCBub3QKPiA+IGV2ZW4gZXhwbGFpbmluZyBhbnkgaXNzdWUgYXQgYWxsIGlzbid0
IHRoZSB3YXkgd2UgZG8gdGhpbmdzLgo+ID4KPiA+IEFuZCBldmVuIGlmIGl0IG1lYW5zIGEgbXV4
ZWQgZGVzaWduLCB0aGVuIHRoZSBmaXggaXMgdG8gbWFrZSBpdCB3b3JrIGluc2lkZSB0aGUKPiA+
IGRyaXZlciwgbm90IGFkZGluZyBzb21lIGhhY2t5IHdvcmthcm91bmQgdGhyb3VnaCBBQ1BJIHRy
aWNrcy4KPiA+Cj4gPiBBbmQgd2hhdCBvdXQgb2YgdHJlZSBkcml2ZXJzIGRvIG9yIGRvIG5vdCBz
dXBwb3J0IHdlIGRvbid0IGNhcmUgb25lIGJpdCBhbnl3YXkuCj4gPgo+IAo+IEkgdGhpbmsgdGhl
IHJldmVydHMgc2hvdWxkIGJlIG1lcmdlZCB2aWEgUmFmYWVsJ3MgdHJlZSBhcyB0aGUgb3JpZ2lu
YWwKPiBwYXRjaGVzIHdlbnQgaW4gdmlhIHRoZXJlLCBhbmQgd2Ugc2hvdWxkIGdldCB0aGVtIGlu
IGFzYXAuCj4gCj4gQWNrZWQtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CgpU
aGUgX09TSSBzdHJpbmdzIGFyZSB0byBiZSBkcm9wcGVkIHdoZW4gYWxsIG9mIHRoZSBuZWVkZWQg
c3VwcG9ydCBpcyB0aGVyZSBpbgpkcml2ZXJzLCBzbyB0aGV5IHNob3VsZCBnbyBhd2F5IGFsb25n
IHdpdGggdGhlIHJlcXVpc2l0ZSBkcml2ZXIgY2hhbmdlcy4KCkknbSBhbGwgZm9yIGRyb3BwaW5n
IHRoZW4gd2hlbiB0aGF0J3MgdGhlIGNhc2UsIHNvIHBsZWFzZSBmZWVsIGZyZWUgdG8gYWRkIEFD
S3MKZnJvbSBtZSB0byB0aGUgcGF0Y2hlcyBpbiBxdWVzdGlvbiBhdCB0aGF0IHBvaW50LgoKQ2hl
ZXJzLApSYWZhZWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs

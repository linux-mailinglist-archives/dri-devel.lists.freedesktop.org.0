Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0625CAA8EF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 18:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A986E044;
	Thu,  5 Sep 2019 16:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl
 [79.96.170.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52CE489FF9;
 Thu,  5 Sep 2019 16:26:09 +0000 (UTC)
Received: from 79.184.255.97.ipv4.supernova.orange.pl (79.184.255.97) (HELO
 kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.292)
 id 8a7029f060d47632; Thu, 5 Sep 2019 18:26:06 +0200
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
Date: Thu, 05 Sep 2019 18:26:06 +0200
Message-ID: <5228680.jBuKzensJx@kreacher>
In-Reply-To: <CACO55ttC-o9bKU7nHNcfjm2YnffiupQ7UHUt7BYL3fu+yEyTbw@mail.gmail.com>
References: <20190814213118.28473-1-kherbst@redhat.com>
 <2215840.qs0dBhReda@kreacher>
 <CACO55ttC-o9bKU7nHNcfjm2YnffiupQ7UHUt7BYL3fu+yEyTbw@mail.gmail.com>
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
Cc: Mario Limonciello <mario.limonciello@dell.com>,
 nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1cnNkYXksIFNlcHRlbWJlciA1LCAyMDE5IDU6NTE6MjMgUE0gQ0VTVCBLYXJvbCBIZXJi
c3Qgd3JvdGU6Cj4gaXMgdGhlcmUgYW55IHVwZGF0ZSBvbiB0aGUgdGVzdGluZyB3aXRoIG15IHBh
dGNoZXM/IE9uIHRoZSBoYXJkd2FyZSBJCj4gaGFkIGFjY2VzcyB0byB0aG9zZSBwYXRjaGVzIGhl
bHBlZCwgYnV0IEkgY2FuJ3Qga25vdyBpZiBpdCBhbHNvIGhlbHBlZAo+IG9uIHRoZSBoYXJkd2Fy
ZSBmb3Igd2hpY2ggdGhvc2Ugd29ya2Fyb3VuZHMgd2hlcmUgYWN0dWFsbHkgYWRkZWQuCgpBbGV4
IEh1bmcgYW5kIE1hcmlvIG5lZWQgdG8gYW5zd2VyIHRoaXMgcXVlc3Rpb24gSSB0aGluay4KCj4g
T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMTE6NTIgQU0gUmFmYWVsIEouIFd5c29ja2kgPHJqd0By
and5c29ja2kubmV0PiB3cm90ZToKPiA+Cj4gPiBPbiBUaHVyc2RheSwgQXVndXN0IDE1LCAyMDE5
IDEyOjQ3OjM1IEFNIENFU1QgRGF2ZSBBaXJsaWUgd3JvdGU6Cj4gPiA+IE9uIFRodSwgMTUgQXVn
IDIwMTkgYXQgMDc6MzEsIEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPiB3cm90ZToK
PiA+ID4gPgo+ID4gPiA+IFRoaXMgcmV2ZXJ0cyBjb21taXQgMjg1ODZhNTFlZWE2NjZkNTUzMWJj
YWVmMmY2OGU0YWJiZDg3MjQyYy4KPiA+ID4gPgo+ID4gPiA+IFRoZSBvcmlnaW5hbCBjb21taXQg
bWVzc2FnZSBkaWRuJ3QgZXZlbiBtYWtlIHNlbnNlLiBBTUQgX2RvZXNfIHN1cHBvcnQgaXQgYW5k
Cj4gPiA+ID4gaXQgd29ya3Mgd2l0aCBOb3V2ZWF1IGFzIHdlbGwuCj4gPiA+ID4KPiA+ID4gPiBB
bHNvIHdoYXQgd2FzIHRoZSBpc3N1ZSBiZWluZyBzb2x2ZWQgaGVyZT8gTm8gcmVmZXJlbmNlcyB0
byBhbnkgYnVncyBhbmQgbm90Cj4gPiA+ID4gZXZlbiBleHBsYWluaW5nIGFueSBpc3N1ZSBhdCBh
bGwgaXNuJ3QgdGhlIHdheSB3ZSBkbyB0aGluZ3MuCj4gPiA+ID4KPiA+ID4gPiBBbmQgZXZlbiBp
ZiBpdCBtZWFucyBhIG11eGVkIGRlc2lnbiwgdGhlbiB0aGUgZml4IGlzIHRvIG1ha2UgaXQgd29y
ayBpbnNpZGUgdGhlCj4gPiA+ID4gZHJpdmVyLCBub3QgYWRkaW5nIHNvbWUgaGFja3kgd29ya2Fy
b3VuZCB0aHJvdWdoIEFDUEkgdHJpY2tzLgo+ID4gPiA+Cj4gPiA+ID4gQW5kIHdoYXQgb3V0IG9m
IHRyZWUgZHJpdmVycyBkbyBvciBkbyBub3Qgc3VwcG9ydCB3ZSBkb24ndCBjYXJlIG9uZSBiaXQg
YW55d2F5Lgo+ID4gPiA+Cj4gPiA+Cj4gPiA+IEkgdGhpbmsgdGhlIHJldmVydHMgc2hvdWxkIGJl
IG1lcmdlZCB2aWEgUmFmYWVsJ3MgdHJlZSBhcyB0aGUgb3JpZ2luYWwKPiA+ID4gcGF0Y2hlcyB3
ZW50IGluIHZpYSB0aGVyZSwgYW5kIHdlIHNob3VsZCBnZXQgdGhlbSBpbiBhc2FwLgo+ID4gPgo+
ID4gPiBBY2tlZC1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPiA+Cj4gPiBU
aGUgX09TSSBzdHJpbmdzIGFyZSB0byBiZSBkcm9wcGVkIHdoZW4gYWxsIG9mIHRoZSBuZWVkZWQg
c3VwcG9ydCBpcyB0aGVyZSBpbgo+ID4gZHJpdmVycywgc28gdGhleSBzaG91bGQgZ28gYXdheSBh
bG9uZyB3aXRoIHRoZSByZXF1aXNpdGUgZHJpdmVyIGNoYW5nZXMuCj4gPgo+IAo+IHRoYXQgZ29l
cyBiZXNpZGUgdGhlIHBvaW50LiBmaXJtd2FyZSBsZXZlbCB3b3JrYXJvdW5kcyBmb3IgR1BVIGRy
aXZlcgo+IGlzc3VlcyB3ZXJlIHB1c2hlZCB3aXRob3V0IGNvbnN1bHRpbmcgd2l0aCB1cHN0cmVh
bSBHUFUgZGV2ZWxvcGVycy4KPiBUaGF0J3Mgc29tZXRoaW5nIHdoaWNoIHNob3VsZG4ndCBoYXZl
IGhhcHBlbmVkIGluIHRoZSBmaXJzdCBwbGFjZS4gQW5kCj4geWVzLCBJIGFtIHBlcnNvbmFsbHkg
YW5ub3llZCBieSB0aGUgZmFjdCwgdGhhdCBwZW9wbGUga25vdyBhYm91dAo+IGlzc3VlcywgYnV0
IGluc3RlYWQgb2YgY29udGFjdGluZyB0aGUgcHJvcGVyIHBlcnNvbnMgYW5kIHdvcmtpbmcgb24g
YQo+IHByb3BlciBmaXgsIHdlIGVuZCB1cCB3aXRoIHN0dXBpZCBmaXJtd2FyZSBsZXZlbCB3b3Jr
YXJvdW5kcy4gSSBjYW4ndAo+IHNlZSB3aHkgd2UgZXZlciB3b3VsZCBoYXZlIHdhbnRlZCBzdWNo
IHdvcmthcm91bmRzIGluIHRoZSBmaXJzdCBwbGFjZS4KPiAKPiBBbmQgSSB3b3VsZCBiZSBtdWNo
IGhhcHBpZXIgaWYgdGhlIG5leHQgdGltZSBzb21ldGhpbmcgbGlrZSB0aGF0IGNvbWVzCj4gdXAs
IHRoYXQgdGhlIGRybSBtYWlsaW5nIGxpc3Qgd2lsbCBiZSBjb250YWN0ZWQgYXMgd2VsbCBvciBz
b21lYm9keQo+IGludm9sdmVkLgo+IAo+IFdlIGNvdWxkIGhhdmUgYWxzbyBqdXN0IGRpc2FibGUg
dGhlIGZlYXR1cmUgaW5zaWRlIHRoZSBkcml2ZXIgKGFuZAo+IHByb2JhYmx5IHdlIHNob3VsZCBo
YXZlIGRvbmUgdGhhdCBhIGxvbmcgdGltZSBhZ28sIHNvIHRoYXQgaXMKPiBlc3NlbnRpYWxseSBv
dXIgZmF1bHQsIGJ1dCBzdGlsbC4uLi4pCj4gCj4gPiBJJ20gYWxsIGZvciBkcm9wcGluZyB0aGVu
IHdoZW4gdGhhdCdzIHRoZSBjYXNlLCBzbyBwbGVhc2UgZmVlbCBmcmVlIHRvIGFkZCBBQ0tzCj4g
PiBmcm9tIG1lIHRvIHRoZSBwYXRjaGVzIGluIHF1ZXN0aW9uIGF0IHRoYXQgcG9pbnQuCj4gPgo+
ID4gQ2hlZXJzLAo+ID4gUmFmYWVsCj4gPgo+ID4KPiA+Cj4gCgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

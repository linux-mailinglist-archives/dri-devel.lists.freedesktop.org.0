Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3CE10519A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 12:46:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992496EE54;
	Thu, 21 Nov 2019 11:46:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3210D6EE13;
 Thu, 21 Nov 2019 11:46:15 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Nov 2019 03:46:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,224,1571727600"; d="scan'208";a="216119105"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 21 Nov 2019 03:46:10 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 21 Nov 2019 13:46:10 +0200
Date: Thu, 21 Nov 2019 13:46:10 +0200
From: Mika Westerberg <mika.westerberg@intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Message-ID: <20191121114610.GW11621@lahna.fi.intel.com>
References: <20191120120913.GE11621@lahna.fi.intel.com>
 <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
 <20191120151542.GH11621@lahna.fi.intel.com>
 <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
 <20191120155301.GL11621@lahna.fi.intel.com>
 <CAJZ5v0hkT-fHFOQKzp2qYPyR+NUa4c-G-uGLPZuQxqsG454PiQ@mail.gmail.com>
 <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
 <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
 <20191121112821.GU11621@lahna.fi.intel.com>
 <CAJZ5v0hQhj5Wf+piU11abC4pF26yM=XHGHAcDv8Jsgdx04aN-w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0hQhj5Wf+piU11abC4pF26yM=XHGHAcDv8Jsgdx04aN-w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Karol Herbst <kherbst@redhat.com>, Linux PM <linux-pm@vger.kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTI6MzQ6MjJQTSArMDEwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTI6MjggUE0gTWlrYSBXZXN0ZXJi
ZXJnCj4gPG1pa2Eud2VzdGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwg
Tm92IDIwLCAyMDE5IGF0IDExOjI5OjMzUE0gKzAxMDAsIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3Rl
Ogo+ID4gPiA+IGxhc3Qgd2VlayBvciBzbyBJIGZvdW5kIHN5c3RlbXMgd2hlcmUgdGhlIEdQVSB3
YXMgdW5kZXIgdGhlICJQQ0kKPiA+ID4gPiBFeHByZXNzIFJvb3QgUG9ydCIgKG5hbWUgZnJvbSBs
c3BjaSkgYW5kIG9uIHRob3NlIHN5c3RlbXMgYWxsIG9mIHRoYXQKPiA+ID4gPiBzZWVtcyB0byB3
b3JrLiBTbyBJIGFtIHdvbmRlcmluZyBpZiBpdCdzIGluZGVlZCBqdXN0IHRoZSAweDE5MDEgb25l
LAo+ID4gPiA+IHdoaWNoIGFsc28gZXhwbGFpbnMgTWlrYXMgY2FzZSB0aGF0IFRodW5kZXJib2x0
IHN0dWZmIHdvcmtzIGFzIGRldmljZXMKPiA+ID4gPiBuZXZlciBnZXQgcG9wdWxhdGVkIHVuZGVy
IHRoaXMgcGFydGljdWxhciBicmlkZ2UgY29udHJvbGxlciwgYnV0IHVuZGVyCj4gPiA+ID4gdGhv
c2UgIlJvb3QgUG9ydCJzCj4gPiA+Cj4gPiA+IEl0IGFsd2F5cyBpcyBhIFBDSWUgcG9ydCwgYnV0
IGl0cyBsb2NhdGlvbiB3aXRoaW4gdGhlIFNvQyBtYXkgbWF0dGVyLgo+ID4KPiA+IEV4YWN0bHku
IEludGVsIGhhcmR3YXJlIGhhcyBQQ0llIHBvcnRzIG9uIENQVSBzaWRlICh0aGVzZSBhcmUgY2Fs
bGVkCj4gPiBQRUcsIFBDSSBFeHByZXNzIEdyYXBoaWNzLCBwb3J0cyksIGFuZCB0aGUgUENIIHNp
ZGUuIEkgdGhpbmsgdGhlIElQIGlzCj4gPiBzdGlsbCB0aGUgc2FtZS4KPiA+Cj4gPiA+IEFsc28g
c29tZSBjdXN0b20gQU1MLWJhc2VkIHBvd2VyIG1hbmFnZW1lbnQgaXMgaW52b2x2ZWQgYW5kIHRo
YXQgbWF5Cj4gPiA+IGJlIG1ha2luZyBzcGVjaWZpYyBhc3N1bXB0aW9ucyBvbiB0aGUgY29uZmln
dXJhdGlvbiBvZiB0aGUgU29DIGFuZCB0aGUKPiA+ID4gR1BVIGF0IHRoZSB0aW1lIG9mIGl0cyBp
bnZvY2F0aW9uIHdoaWNoIHVuZm9ydHVuYXRlbHkgYXJlIG5vdCBrbm93biB0bwo+ID4gPiB1cy4K
PiA+ID4KPiA+ID4gSG93ZXZlciwgaXQgbG9va3MgbGlrZSB0aGUgQU1MIGludm9rZWQgdG8gcG93
ZXIgZG93biB0aGUgR1BVIGZyb20KPiA+ID4gYWNwaV9wY2lfc2V0X3Bvd2VyX3N0YXRlKCkgZ2V0
cyBjb25mdXNlZCBpZiBpdCBpcyBub3QgaW4gUENJIEQwIGF0Cj4gPiA+IHRoYXQgcG9pbnQsIHNv
IGl0IGxvb2tzIGxpa2UgdGhhdCBBTUwgdHJpZXMgdG8gYWNjZXNzIGRldmljZSBtZW1vcnkgb24K
PiA+ID4gdGhlIEdQVSAoYmV5b25kIHRoZSBQQ0kgY29uZmlnIHNwYWNlKSBvciBzaW1pbGFyIHdo
aWNoIGlzIG5vdAo+ID4gPiBhY2Nlc3NpYmxlIGluIFBDSSBwb3dlciBzdGF0ZXMgYmVsb3cgRDAu
Cj4gPgo+ID4gT3IgdGhlIFBDSSBjb25maWcgc3BhY2Ugb2YgdGhlIEdQVSB3aGVuIHRoZSBwYXJl
bnQgcm9vdCBwb3J0IGlzIGluIEQzaG90Cj4gPiAoYXMgaXQgaXMgdGhlIGNhc2UgaGVyZSkuIEFs
c28gdGhlbiB0aGUgR1BVIGNvbmZpZyBzcGFjZSBpcyBub3QKPiA+IGFjY2Vzc2libGUuCj4gCj4g
V2h5IHdvdWxkIHRoZSBwYXJlbnQgcG9ydCBiZSBpbiBEM2hvdCBhdCB0aGF0IHBvaW50PyAgV291
bGRuJ3QgdGhhdCBiZQo+IGEgc3VzcGVuZCBvcmRlcmluZyB2aW9sYXRpb24/CgpOby4gV2UgcHV0
IHRoZSBHUFUgaW50byBEM2hvdCBmaXJzdCwgdGhlbiB0aGUgcm9vdCBwb3J0IGFuZCB0aGVuIHR1
cm4Kb2ZmIHRoZSBwb3dlciByZXNvdXJjZSAod2hpY2ggaXMgYXR0YWNoZWQgdG8gdGhlIHJvb3Qg
cG9ydCkgcmVzdWx0aW5nCnRoZSB0b3BvbG9neSBlbnRlcmluZyBEM2NvbGQuCgo+ID4gSSB0b29r
IGEgbG9vayBhdCB0aGUgSFAgT21lbiBBQ1BJIHRhYmxlcyB3aGljaCBoYXMgc2ltaWxhciBwcm9i
bGVtIGFuZAo+ID4gdGhlcmUgaXMgYWxzbyBjaGVjayBmb3IgV2luZG93cyA3IChidXQgbm90IExp
bnV4KSBzbyBJIHRoaW5rIG9uZQo+ID4gYWx0ZXJuYXRpdmUgd29ya2Fyb3VuZCB3b3VsZCBiZSB0
byBhZGQgdGhlc2UgZGV2aWNlcyBpbnRvCj4gPiBhY3BpX29zaV9kbWlfdGFibGVbXSB3aGVyZSAu
Y2FsbGJhY2sgaXMgc2V0IHRvIGRtaV9kaXNhYmxlX29zaV93aW44IChvcgo+ID4gcGFzcyAnYWNw
aV9vc2k9IiFXaW5kb3dzIDIwMTIiJyBpbiB0aGUga2VybmVsIGNvbW1hbmQgbGluZSkuCj4gCj4g
SSdkIGxpa2UgdG8gdW5kZXJzdGFuZCB0aGUgZmFjdHMgdGhhdCBoYXZlIGJlZW4gZXN0YWJsaXNo
ZWQgc28gZmFyCj4gYmVmb3JlIGRlY2lkaW5nIHdoYXQgdG8gZG8gYWJvdXQgdGhlbS4gOi0pCgpZ
ZXMsIEkgYWdyZWUgOikKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs

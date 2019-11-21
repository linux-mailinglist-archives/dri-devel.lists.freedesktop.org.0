Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4616105164
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 12:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313566E082;
	Thu, 21 Nov 2019 11:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06186E082;
 Thu, 21 Nov 2019 11:28:26 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Nov 2019 03:28:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,224,1571727600"; d="scan'208";a="216116196"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 21 Nov 2019 03:28:22 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 21 Nov 2019 13:28:21 +0200
Date: Thu, 21 Nov 2019 13:28:21 +0200
From: Mika Westerberg <mika.westerberg@intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Message-ID: <20191121112821.GU11621@lahna.fi.intel.com>
References: <CACO55tsfNOdtu5SZ-4HzO4Ji6gQtafvZ7Rm19nkPcJAgwUBFMw@mail.gmail.com>
 <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
 <20191120120913.GE11621@lahna.fi.intel.com>
 <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
 <20191120151542.GH11621@lahna.fi.intel.com>
 <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
 <20191120155301.GL11621@lahna.fi.intel.com>
 <CAJZ5v0hkT-fHFOQKzp2qYPyR+NUa4c-G-uGLPZuQxqsG454PiQ@mail.gmail.com>
 <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
 <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
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

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTE6Mjk6MzNQTSArMDEwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gPiBsYXN0IHdlZWsgb3Igc28gSSBmb3VuZCBzeXN0ZW1zIHdoZXJlIHRoZSBH
UFUgd2FzIHVuZGVyIHRoZSAiUENJCj4gPiBFeHByZXNzIFJvb3QgUG9ydCIgKG5hbWUgZnJvbSBs
c3BjaSkgYW5kIG9uIHRob3NlIHN5c3RlbXMgYWxsIG9mIHRoYXQKPiA+IHNlZW1zIHRvIHdvcmsu
IFNvIEkgYW0gd29uZGVyaW5nIGlmIGl0J3MgaW5kZWVkIGp1c3QgdGhlIDB4MTkwMSBvbmUsCj4g
PiB3aGljaCBhbHNvIGV4cGxhaW5zIE1pa2FzIGNhc2UgdGhhdCBUaHVuZGVyYm9sdCBzdHVmZiB3
b3JrcyBhcyBkZXZpY2VzCj4gPiBuZXZlciBnZXQgcG9wdWxhdGVkIHVuZGVyIHRoaXMgcGFydGlj
dWxhciBicmlkZ2UgY29udHJvbGxlciwgYnV0IHVuZGVyCj4gPiB0aG9zZSAiUm9vdCBQb3J0InMK
PiAKPiBJdCBhbHdheXMgaXMgYSBQQ0llIHBvcnQsIGJ1dCBpdHMgbG9jYXRpb24gd2l0aGluIHRo
ZSBTb0MgbWF5IG1hdHRlci4KCkV4YWN0bHkuIEludGVsIGhhcmR3YXJlIGhhcyBQQ0llIHBvcnRz
IG9uIENQVSBzaWRlICh0aGVzZSBhcmUgY2FsbGVkClBFRywgUENJIEV4cHJlc3MgR3JhcGhpY3Ms
IHBvcnRzKSwgYW5kIHRoZSBQQ0ggc2lkZS4gSSB0aGluayB0aGUgSVAgaXMKc3RpbGwgdGhlIHNh
bWUuCgo+IEFsc28gc29tZSBjdXN0b20gQU1MLWJhc2VkIHBvd2VyIG1hbmFnZW1lbnQgaXMgaW52
b2x2ZWQgYW5kIHRoYXQgbWF5Cj4gYmUgbWFraW5nIHNwZWNpZmljIGFzc3VtcHRpb25zIG9uIHRo
ZSBjb25maWd1cmF0aW9uIG9mIHRoZSBTb0MgYW5kIHRoZQo+IEdQVSBhdCB0aGUgdGltZSBvZiBp
dHMgaW52b2NhdGlvbiB3aGljaCB1bmZvcnR1bmF0ZWx5IGFyZSBub3Qga25vd24gdG8KPiB1cy4K
PiAKPiBIb3dldmVyLCBpdCBsb29rcyBsaWtlIHRoZSBBTUwgaW52b2tlZCB0byBwb3dlciBkb3du
IHRoZSBHUFUgZnJvbQo+IGFjcGlfcGNpX3NldF9wb3dlcl9zdGF0ZSgpIGdldHMgY29uZnVzZWQg
aWYgaXQgaXMgbm90IGluIFBDSSBEMCBhdAo+IHRoYXQgcG9pbnQsIHNvIGl0IGxvb2tzIGxpa2Ug
dGhhdCBBTUwgdHJpZXMgdG8gYWNjZXNzIGRldmljZSBtZW1vcnkgb24KPiB0aGUgR1BVIChiZXlv
bmQgdGhlIFBDSSBjb25maWcgc3BhY2UpIG9yIHNpbWlsYXIgd2hpY2ggaXMgbm90Cj4gYWNjZXNz
aWJsZSBpbiBQQ0kgcG93ZXIgc3RhdGVzIGJlbG93IEQwLgoKT3IgdGhlIFBDSSBjb25maWcgc3Bh
Y2Ugb2YgdGhlIEdQVSB3aGVuIHRoZSBwYXJlbnQgcm9vdCBwb3J0IGlzIGluIEQzaG90CihhcyBp
dCBpcyB0aGUgY2FzZSBoZXJlKS4gQWxzbyB0aGVuIHRoZSBHUFUgY29uZmlnIHNwYWNlIGlzIG5v
dAphY2Nlc3NpYmxlLgoKSSB0b29rIGEgbG9vayBhdCB0aGUgSFAgT21lbiBBQ1BJIHRhYmxlcyB3
aGljaCBoYXMgc2ltaWxhciBwcm9ibGVtIGFuZAp0aGVyZSBpcyBhbHNvIGNoZWNrIGZvciBXaW5k
b3dzIDcgKGJ1dCBub3QgTGludXgpIHNvIEkgdGhpbmsgb25lCmFsdGVybmF0aXZlIHdvcmthcm91
bmQgd291bGQgYmUgdG8gYWRkIHRoZXNlIGRldmljZXMgaW50bwphY3BpX29zaV9kbWlfdGFibGVb
XSB3aGVyZSAuY2FsbGJhY2sgaXMgc2V0IHRvIGRtaV9kaXNhYmxlX29zaV93aW44IChvcgpwYXNz
ICdhY3BpX29zaT0iIVdpbmRvd3MgMjAxMiInIGluIHRoZSBrZXJuZWwgY29tbWFuZCBsaW5lKS4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

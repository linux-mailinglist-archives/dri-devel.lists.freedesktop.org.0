Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D5F105144
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 12:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66EFA6EDD1;
	Thu, 21 Nov 2019 11:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBD66EDD1;
 Thu, 21 Nov 2019 11:17:44 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Nov 2019 03:17:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,224,1571727600"; d="scan'208";a="216114487"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 21 Nov 2019 03:17:40 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 21 Nov 2019 13:17:39 +0200
Date: Thu, 21 Nov 2019 13:17:39 +0200
From: Mika Westerberg <mika.westerberg@intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Message-ID: <20191121111739.GT11621@lahna.fi.intel.com>
References: <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
 <20191120120913.GE11621@lahna.fi.intel.com>
 <CACO55tsHy6yZQZ8PkdW8iPA7+uc5rdcEwRJwYEQ3iqu85F8Sqg@mail.gmail.com>
 <20191120151542.GH11621@lahna.fi.intel.com>
 <CACO55tvo3rbPtYJcioEgXCEQqVXcVAm-iowr9Nim=bgTdMjgLw@mail.gmail.com>
 <20191120155301.GL11621@lahna.fi.intel.com>
 <20191120162306.GM11621@lahna.fi.intel.com>
 <CACO55tsvTG2E7_3nn1sTdPQXzxaZA96k+gmSBBXjPvei6v=kxg@mail.gmail.com>
 <20191121101423.GQ11621@lahna.fi.intel.com>
 <CAJZ5v0hAgz4Fu=83AJE2PYUsi+Jk=Lrr4MNp5ySA9yY=3wr5rg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0hAgz4Fu=83AJE2PYUsi+Jk=Lrr4MNp5ySA9yY=3wr5rg@mail.gmail.com>
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

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTI6MDM6NTJQTSArMDEwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTE6MTQgQU0gTWlrYSBXZXN0ZXJi
ZXJnCj4gPG1pa2Eud2VzdGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwg
Tm92IDIwLCAyMDE5IGF0IDEwOjM2OjMxUE0gKzAxMDAsIEthcm9sIEhlcmJzdCB3cm90ZToKPiA+
ID4gd2l0aCB0aGUgYnJhbmNoIGFuZCBwYXRjaCBhcHBsaWVkOgo+ID4gPiBodHRwczovL2dpc3Qu
Z2l0aHVidXNlcmNvbnRlbnQuY29tL2thcm9saGVyYnN0LzAzYzRjODE0MWIwZmEyOTJkNzgxYmFk
ZmExODY0NzllL3Jhdy81YzYyNjQwYWZiYzU3ZDZlNjllYTkyNGMzMzhiZDI4MzZlNzcwZDAyL2dp
c3RmaWxlMS50eHQKPiA+Cj4gPiBUaGFua3MgZm9yIHRlc3RpbmcuIFRvbyBiYWQgaXQgZGlkIG5v
dCBoZWxwIDooIEkgc3VwcG9zZSB0aGVyZSBpcyBubwo+ID4gY2hhbmdlIGlmIHlvdSBpbmNyZWFz
ZSB0aGUgZGVsYXkgdG8gc2F5IDFzPwo+IAo+IFdlbGwsIGxvb2sgYXQgdGhlIG9yaWdpbmFsIHBh
dGNoIGluIHRoaXMgdGhyZWFkLgo+IAo+IFdoYXQgaXQgZG9lcyBpcyB0byBwcmV2ZW50IHRoZSBk
ZXZpY2UgKEdQVSBpbiB0aGlzIHBhcnRpY3VsYXIgY2FzZSkKPiBmcm9tIGdvaW5nIGludG8gYSBQ
Q0kgbG93LXBvd2VyIHN0YXRlIGJlZm9yZSBpbnZva2luZyBBTUwgdG8gcG93ZXIgaXQKPiBkb3du
ICh0aGUgQU1MIGlzIHN0aWxsIGludm9rZWQgYWZ0ZXIgdGhpcyBwYXRjaCBBRkFJQ1MpLCBzbyB3
aHkgd291bGQKPiB0aGF0IGhhdmUgYW55dGhpbmcgdG8gZG8gd2l0aCB0aGUgZGVsYXlzPwoKWWVz
LCBJIGtub3cgd2hhdCBpdCBkb2VzIDopIEkgd2FzIGp1c3QgdGhpbmtpbmcgdGhhdCBtYXliZSBp
dCdzIHN0aWxsCnRoZSBsaW5rIHRoYXQgZG9lcyBub3QgY29tZSB1cCB3aGVuIHdlIGdvIGJhY2sg
dG8gRDAgSSBndWVzcyB0aGF0J3Mgbm90CnRoZSBjYXNlIGhlcmUuCgo+IFRoZSBvbmx5IHJlYXNv
biB3b3VsZCBiZSB0aGUgQU1MIHJ1bm5pbmcgdG9vIGVhcmx5LCBidXQgdGhhdCBkb2Vzbid0Cj4g
c2VlbSBsaWtlbHkuICBJTU8gbW9yZSBsaWtlbHkgaXMgdGhhdCB0aGUgQU1MIGRvZXMgc29tZXRo
aW5nIHdoaWNoCj4gY2Fubm90IGJlIGRvbmUgdG8gYSBkZXZpY2UgaW4gYSBQQ0kgbG93LXBvd2Vy
IHN0YXRlLgoKSXQgbWF5IHZlcnkgd2VsbCBiZSB0aGUgY2FzZS4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

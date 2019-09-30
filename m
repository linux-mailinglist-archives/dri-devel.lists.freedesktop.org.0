Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D737CC2DD4
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 09:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397866E4D4;
	Tue,  1 Oct 2019 07:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9DD89C97;
 Mon, 30 Sep 2019 16:30:06 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Sep 2019 09:30:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,567,1559545200"; d="scan'208";a="204868102"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by fmsmga001.fm.intel.com with SMTP; 30 Sep 2019 09:30:02 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 30 Sep 2019 19:30:01 +0300
Date: Mon, 30 Sep 2019 19:30:01 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [RFC PATCH] pci: prevent putting pcie devices into lower device
 states on certain intel bridges
Message-ID: <20190930163001.GX2714@lahna.fi.intel.com>
References: <20190927144421.22608-1-kherbst@redhat.com>
 <20190927214252.GA65801@google.com>
 <CACO55tuaY1jFXpJPeC9M4PoWEDyy547_tE8MpLaTDb+C+ffsbg@mail.gmail.com>
 <20190930080534.GS2714@lahna.fi.intel.com>
 <CACO55tuMo1aAA7meGtEey6J6sOS-ZA0ebZeL52i2zfkWtPqe_g@mail.gmail.com>
 <20190930092934.GT2714@lahna.fi.intel.com>
 <CACO55tu9M8_TWu2MxNe_NROit+d+rHJP5_Tb+t73q5vr19sd1w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACO55tu9M8_TWu2MxNe_NROit+d+rHJP5_Tb+t73q5vr19sd1w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Tue, 01 Oct 2019 07:13:05 +0000
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
Cc: Linux PM <linux-pm@vger.kernel.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Linux PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMDY6MDU6MTRQTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdy
b3RlOgo+IHN0aWxsIGhhcHBlbnMgd2l0aCB5b3VyIHBhdGNoIGFwcGxpZWQuIFRoZSBtYWNoaW5l
IHNpbXBseSBnZXRzIHNodXQgZG93bi4KPiAKPiBkbWVzZyBjYW4gYmUgZm91bmQgaGVyZToKPiBo
dHRwczovL2dpc3QuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2thcm9saGVyYnN0LzQwZWIwOTFjN2I3
YjMzZWY5OTM1MjVkZTY2MGYxYTNiL3Jhdy8yMzgwZTMxZjU2NmU5M2U1YmE3Yzg3ZWY1NDU0MjA5
NjVkNGM0OTJjL2dpc3RmaWxlMS50eHQKCkxvb2tpbmcgeW91ciBkbWVzZzoKClNlcCAzMCAxNzoy
NDoyNyBrZXJuZWw6IG5vdXZlYXUgMDAwMDowMTowMC4wOiBEUk06IERDQiB2ZXJzaW9uIDQuMQpT
ZXAgMzAgMTc6MjQ6Mjcga2VybmVsOiBub3V2ZWF1IDAwMDA6MDE6MDAuMDogRFJNOiBNTTogdXNp
bmcgQ09QWSBmb3IgYnVmZmVyIGNvcGllcwpTZXAgMzAgMTc6MjQ6Mjcga2VybmVsOiBbZHJtXSBJ
bml0aWFsaXplZCBub3V2ZWF1IDEuMy4xIDIwMTIwODAxIGZvciAwMDAwOjAxOjAwLjAgb24gbWlu
b3IgMQoKSSB3b3VsZCBhc3N1bWUgaXQgcnVudGltZSBzdXNwZW5kcyBoZXJlLiBUaGVuIGl0IHdh
a2VzIHVwIGJlY2F1c2Ugb2YgUENJCmFjY2VzcyBmcm9tIHVzZXJzcGFjZToKClNlcCAzMCAxNzoy
NDo0MiBrZXJuZWw6IHBjaV9yYXdfc2V0X3Bvd2VyX3N0YXRlOiA1NiBjYWxsYmFja3Mgc3VwcHJl
c3NlZAogCmFuZCBmb3Igc29tZSByZWFzb24gaXQgZG9lcyBub3QgZ2V0IHJlc3VtZWQgcHJvcGVy
bHkuIFRoZXJlIGFyZSBhbHNvIGZldwp3YXJuaW5ncyBmcm9tIEFDUEkgdGhhdCBtaWdodCBiZSBy
ZWxldmFudDoKClNlcCAzMCAxNzoyNDoyNyBrZXJuZWw6IEFDUEkgV2FybmluZzogXF9TQi5QQ0kw
LkdGWDAuX0RTTTogQXJndW1lbnQgIzQgdHlwZSBtaXNtYXRjaCAtIEZvdW5kIFtCdWZmZXJdLCBB
Q1BJIHJlcXVpcmVzIFtQYWNrYWdlXSAoMjAxOTA1MDkvbnNhcmd1bWVudHMtNTkpClNlcCAzMCAx
NzoyNDoyNyBrZXJuZWw6IEFDUEkgV2FybmluZzogXF9TQi5QQ0kwLlBFRzAuUEVHUC5fRFNNOiBB
cmd1bWVudCAjNCB0eXBlIG1pc21hdGNoIC0gRm91bmQgW0J1ZmZlcl0sIEFDUEkgcmVxdWlyZXMg
W1BhY2thZ2VdICgyMDE5MDUwOS9uc2FyZ3VtZW50cy01OSkKClRoaXMgc2VlbXMgdG8gYmUgRGVs
bCBYUFMgOTU2MCB3aGljaCBJIHRoaW5rIGhhcyBiZWVuIGFyb3VuZCBzb21lIHRpbWUKYWxyZWFk
eSBzbyBJIHdvbmRlciB3aHkgd2Ugb25seSBzZWUgaXNzdWVzIG5vdy4gSGFzIGl0IGV2ZXIgd29y
a2VkIGZvcgp5b3Ugb3IgbWF5YmUgdGhlcmUgaXMgYSByZWdyZXNzaW9uIHRoYXQgY2F1c2VzIGl0
IHRvIGhhcHBlbiBub3c/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 411E97EEE7
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E1B6ED13;
	Fri,  2 Aug 2019 08:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F0D89D86
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 13:38:48 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jul 2019 06:38:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,330,1559545200"; d="scan'208";a="163114354"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
 by orsmga007.jf.intel.com with ESMTP; 31 Jul 2019 06:38:42 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hsooS-0000IS-9T; Wed, 31 Jul 2019 16:38:40 +0300
Date: Wed, 31 Jul 2019 16:38:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2 00/10] drivers, provide a way to add sysfs groups easily
Message-ID: <20190731133840.GN23480@smile.fi.intel.com>
References: <20190731124349.4474-1-gregkh@linuxfoundation.org>
 <20190731131045.GB147138@dtor-ws>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190731131045.GB147138@dtor-ws>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
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
Cc: x86@kernel.org, linux-input@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Tony Prisk <linux@prisktech.co.nz>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Richard Gong <richard.gong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMDY6MTA6NDVBTSAtMDcwMCwgRG1pdHJ5IFRvcm9raG92
IHdyb3RlOgo+IE9uIFdlZCwgSnVsIDMxLCAyMDE5IGF0IDAyOjQzOjM5UE0gKzAyMDAsIEdyZWcg
S3JvYWgtSGFydG1hbiB3cm90ZToKPiA+IFRoaXMgcGF0Y2ggb3JpZ2luYWxseSBzdGFydGVkIG91
dCBqdXN0IGFzIGEgd2F5IGZvciBwbGF0Zm9ybSBkcml2ZXJzIHRvCj4gPiBlYXNpbHkgYWRkIGEg
c3lzZnMgZ3JvdXAgaW4gYSByYWNlLWZyZWUgd2F5LCBidXQgdGhhbmtzIHRvIERtaXRyeSdzCj4g
PiBwYXRjaCwgdGhpcyBzZXJpZXMgbm93IGlzIGZvciBhbGwgZHJpdmVycyBpbiB0aGUga2VybmVs
IChoZXksIGEgdW5pZmllZAo+ID4gZHJpdmVyIG1vZGVsIHdvcmtzISEhKQo+ID4gCj4gPiBJJ3Zl
IG9ubHkgY29udmVydGVkIGEgZmV3IHBsYXRmb3JtIGRyaXZlcnMgaGVyZSBpbiB0aGlzIHNlcmll
cyB0byBzaG93Cj4gPiBob3cgaXQgd29ya3MsIGJ1dCBvdGhlciBidXNzZXMgY2FuIGJlIGNvbnZl
cnRlZCBhZnRlciB0aGUgZmlyc3QgcGF0Y2gKPiA+IGdvZXMgaW50byB0aGUgdHJlZS4KPiA+IAo+
ID4gSGVyZSdzIHRoZSBvcmlnaW5hbCAwMCBtZXNzYWdlLCBmb3IgcGVvcGxlIHRvIGdldCBhbiBp
ZGVhIG9mIHdoYXQgaXMKPiA+IGdvaW5nIG9uIGhlcmU6Cj4gPiAKPiA+IElmIGEgcGxhdGZvcm0g
ZHJpdmVyIHdhbnRzIHRvIGFkZCBhIHN5c2ZzIGdyb3VwLCBpdCBoYXMgdG8gZG8gc28gaW4gYQo+
ID4gcmFjeSB3YXksIGFkZGluZyBpdCBhZnRlciB0aGUgZHJpdmVyIGlzIGJvdW5kLiAgVG8gcmVz
b2x2ZSB0aGlzIGlzc3VlLAo+ID4gaGF2ZSB0aGUgcGxhdGZvcm0gZHJpdmVyIGNvcmUgZG8gdGhp
cyBmb3IgdGhlIGRyaXZlciwgbWFraW5nIHRoZQo+ID4gaW5kaXZpZHVhbCBkcml2ZXJzIGxvZ2lj
IHNtYWxsZXIgYW5kIHNpbXBsZXIsIGFuZCBzb2x2aW5nIHRoZSByYWNlIGF0Cj4gPiB0aGUgc2Ft
ZSB0aW1lLgo+ID4gCj4gPiBBbGwgb2YgdGhlc2UgcGF0Y2hlcyBkZXBlbmQgb24gdGhlIGZpcnN0
IHBhdGNoLiAgSSdsbCB0YWtlIHRoZSBmaXJzdCBvbmUKPiA+IHRocm91Z2ggbXkgZHJpdmVyLWNv
cmUgdHJlZSwgYW5kIGFueSBzdWJzeXN0ZW0gbWFpbnRhaW5lciBjYW4gZWl0aGVyIGFjawo+ID4g
dGhlaXIgaW5kaXZpZHVsIHBhdGNoIGFuZCBJIHdpbGwgYmUgZ2xhZCB0byBhbHNvIG1lcmdlIGl0
LCBvciB0aGV5IGNhbgo+ID4gd2FpdCB1bnRpbCBhZnRlciA1LjQtcmMxIHdoZW4gdGhlIGNvcmUg
cGF0Y2ggaGl0cyBMaW51cydzIHRyZWUgYW5kIHRoZW4KPiA+IHRha2UgaXQsIGl0J3MgdXAgdG8g
dGhlbS4KPiAKPiBNYXliZSBtYWtlIGFuIGltbXV0YWJsZSBicmFuY2ggb2ZmIDUuMiB3aXRoIGp1
c3QgcGF0Y2ggMS8xMCBzbyB0aGF0Cj4gc3Vic3lzdGVtcyAoYW5kIHRoZSBkcml2ZXIgY29yZSB0
cmVlIGl0c2VsZikgY291bGQgcHVsbCBpdCBpbiBhdCB0aGVpcgo+IGxlaXN1cmUgaW50byB0aGVp
ciAiKi1uZXh0IiBicmFuY2hlcyBhbmQgZGlkIG5vdCBoYXZlIHRvIHdhaXQgdGlsbCA1LjQKPiBv
ciByaXNrIG1lcmdlIGNsYXNoZXM/CgpJc24ndCBjaGVycnktcGljayBlbm91Z2ggZm9yIG9uZSBw
YXRjaD8KCi0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

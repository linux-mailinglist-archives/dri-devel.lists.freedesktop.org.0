Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 435D3FC139
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:09:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9746E2EC;
	Thu, 14 Nov 2019 08:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218276ECAA
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 09:32:02 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 01:32:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,300,1569308400"; d="scan'208";a="257087926"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Nov 2019 01:31:56 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1iUp0E-0000Lp-H8; Wed, 13 Nov 2019 11:31:54 +0200
Date: Wed, 13 Nov 2019 11:31:54 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] video: fbdev: atyfb: only use ioremap_uc() on i386 and
 ia64
Message-ID: <20191113093154.GB32742@smile.fi.intel.com>
References: <20191111192258.2234502-1-arnd@arndb.de>
 <20191112105507.GA7122@lst.de>
 <CAKMK7uEEz1n+zuTs29rbPHU74Dspaib=prpMge63L_-rUk_o4A@mail.gmail.com>
 <20191112140631.GA10922@lst.de>
 <CAKMK7uFaA607rOS6x_FWjXQ2+Qdm8dQ1dQ+Oi-9if_Qh_wHWPg@mail.gmail.com>
 <20191112222423.GO11244@42.do-not-panic.com>
 <20191113072708.GA3213@lst.de>
 <CAK8P3a3OpiWAep86tOiN1Fj2W7ud5hQ1OLTkBR8ueAKsMHk-dA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3OpiWAep86tOiN1Fj2W7ud5hQ1OLTkBR8ueAKsMHk-dA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 14 Nov 2019 08:07:50 +0000
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-ia64@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Lee Jones <lee.jones@linaro.org>, Christoph Hellwig <hch@lst.de>,
 X86 ML <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Tuowen Zhao <ztuowen@gmail.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "Luis R. Rodriguez" <mcgrof@suse.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Juergen Gross <jgross@suse.com>, Tony Luck <tony.luck@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, AceLan Kao <acelan.kao@canonical.com>,
 Souptick Joarder <jrdr.linux@gmail.com>, Roman Gilg <subdiff@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMDg6Mzg6MTVBTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBPbiBXZWQsIE5vdiAxMywgMjAxOSBhdCA4OjI3IEFNIENocmlzdG9waCBIZWxsd2ln
IDxoY2hAbHN0LmRlPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIE5vdiAxMiwgMjAxOSBhdCAxMDoy
NDoyM1BNICswMDAwLCBMdWlzIENoYW1iZXJsYWluIHdyb3RlOgo+ID4gPiBJIHRoaW5rIHRoaXMg
d291bGQgYmUgcG9zc2libGUgaWYgd2UgY291bGQgZmxvcCBpb3JlbWFwX25vY2FjaGUoKSB0byBV
Qwo+ID4gPiBpbnN0ZWFkIG9mIFVDLSBvbiB4ODYuIE90aGVyd2lzZSwgSSBjYW4ndCBzZWUgaG93
IHdlIGNhbiByZW1vdmUgdGhpcyBieQo+ID4gPiBzdGlsbCBub3QgYWxsb3dpbmcgZGlyZWN0IE1U
UlIgY2FsbHMuCj4gPgo+ID4gSWYgZXZlcnl0aGluZyBnb2VzIHdlbGwgaW9yZW1hcF9ub2NhY2hl
IHdpbGwgYmUgZ29uZSBhcyBvZiA1LjUuCj4gCj4gQXMgaW9yZW1hcF9ub2NhY2hlKCkganVzdCBh
biBhbGlhcyBmb3IgaW9yZW1hcCgpLCBJIHN1cHBvc2UgdGhlIGlkZWEgd291bGQKPiB0aGVuIGJl
IHRvIG1ha2UgeDg2IGlvcmVtYXAgYmUgVUMgaW5zdGVhZCBvZiBVQy0sIGFnYWluIG1hdGNoaW5n
IHdoYXQgdGhlCj4gb3RoZXIgYXJjaGl0ZWN0dXJlcyBkbyBhbHJlYWR5LgoKSSB0aGluayBpdCdz
IHJpZ2h0IHRoaW5nIHRvIGRvLCBpLmUuIGFzc3VtZSB0aGF0IGlvcmVtYXAoKSBhbHdheXMgZG9l
cyBzdHJvbmcKVUMgaW5kZXBlbmRlbnRseSBvbiBNVFJSIHNldHRpbmdzLgoKLS0gCldpdGggQmVz
dCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=

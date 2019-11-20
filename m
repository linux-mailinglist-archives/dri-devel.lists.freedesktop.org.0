Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D001104CFC
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 08:59:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500FB6EB5C;
	Thu, 21 Nov 2019 07:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BB66E03B
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 15:28:53 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Nov 2019 07:28:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,222,1571727600"; d="scan'208";a="209568358"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga003.jf.intel.com with ESMTP; 20 Nov 2019 07:28:51 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1iXRuU-0006qT-KF; Wed, 20 Nov 2019 17:28:50 +0200
Date: Wed, 20 Nov 2019 17:28:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v1 3/5] fbtft: Drop useless #ifdef CONFIG_OF and dead code
Message-ID: <20191120152850.GQ32742@smile.fi.intel.com>
References: <20191120095716.26628-1-andriy.shevchenko@linux.intel.com>
 <20191120095716.26628-3-andriy.shevchenko@linux.intel.com>
 <37435de0-873d-d20c-ac66-420ba91356fd@tronnes.org>
 <676c3f0e-81b7-d9be-8b37-a38eb3d762fb@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <676c3f0e-81b7-d9be-8b37-a38eb3d762fb@tronnes.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 21 Nov 2019 07:59:20 +0000
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
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, Nishad Kamdar <nishadkamdar@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDQ6MDQ6MTdQTSArMDEwMCwgTm9yYWxmIFRyw7hubmVz
IHdyb3RlOgo+IERlbiAyMC4xMS4yMDE5IDE1LjQzLCBza3JldiBOb3JhbGYgVHLDuG5uZXM6Cj4g
PiBEZW4gMjAuMTEuMjAxOSAxMC41Nywgc2tyZXYgQW5keSBTaGV2Y2hlbmtvOgoKPiA+PiBGaXJz
dCBvZiBhbGwgdGhlcmUgaXMgbm8gbmVlZCB0byBndWFyZCBHUElPIHJlcXVlc3QgYnkgQ09ORklH
X09GLgo+ID4+IEl0IHdvcmtzIGZvciBldmVyeWJvZHkgaW5kZXBlbmRlbnRseSBvbiByZXNvdXJj
ZSBwcm92aWRlci4gV2hpbGUgaGVyZSwKPiA+PiByZW5hbWUgdGhlIGZ1bmN0aW9uIHRvIHJlZmxl
Y3QgdGhlIGFib3ZlLgo+ID4+Cj4gPj4gTW9yZW92ZXIsIHNpbmNlIHdlIGhhdmUgYSBnbG9iYWwg
ZGVwZW5kZW5jeSB0byBPRiwgdGhlIHJlc3Qgb2YKPiA+PiBjb25kaXRpb25hbCBjb21waWxhdGlv
biBpcyBuby1vcCwgaS5lLiBpdCdzIGFsd2F5cyBiZSB0cnVlLgo+ID4+Cj4gPj4gRHVlIHRvIGFi
b3ZlIGRyb3AgdXNlbGVzcyAjaWZkZWYgQ09ORklHX09GIGFuZCB0aGVyZWZvcmUgZGVhZCBjb2Rl
Lgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNo
ZW5rb0BsaW51eC5pbnRlbC5jb20+Cj4gPj4gLS0tCj4gPj4gIGRyaXZlcnMvc3RhZ2luZy9mYnRm
dC9mYnRmdC1jb3JlLmMgfCAxOSArKy0tLS0tLS0tLS0tLS0tLS0tCj4gPj4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYnRmdC1jb3JlLmMgYi9kcml2ZXJzL3N0YWdpbmcv
ZmJ0ZnQvZmJ0ZnQtY29yZS5jCj4gPiAKPiA+IDxzbmlwPgo+ID4gCj4gPj4gQEAgLTExODQsMTcg
KzExNzYsMTAgQEAgc3RhdGljIHN0cnVjdCBmYnRmdF9wbGF0Zm9ybV9kYXRhICpmYnRmdF9wcm9i
ZV9kdChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPj4gIAkJcGRhdGEtPmRpc3BsYXkuYmFja2xpZ2h0
ID0gMTsKPiA+PiAgCWlmIChvZl9maW5kX3Byb3BlcnR5KG5vZGUsICJpbml0IiwgTlVMTCkpCj4g
Pj4gIAkJcGRhdGEtPmRpc3BsYXkuZmJ0ZnRvcHMuaW5pdF9kaXNwbGF5ID0gZmJ0ZnRfaW5pdF9k
aXNwbGF5X2R0Owo+ID4+IC0JcGRhdGEtPmRpc3BsYXkuZmJ0ZnRvcHMucmVxdWVzdF9ncGlvcyA9
IGZidGZ0X3JlcXVlc3RfZ3Bpb3NfZHQ7Cj4gPj4gKwlwZGF0YS0+ZGlzcGxheS5mYnRmdG9wcy5y
ZXF1ZXN0X2dwaW9zID0gZmJ0ZnRfcmVxdWVzdF9ncGlvczsKPiA+IAo+ID4gWW91IGNhbiBkaXRj
aCB0aGUgLnJlcXVlc3RfZ3Bpb3MgY2FsbGJhY2sgYW5kIGNhbGwgZmJ0ZnRfcmVxdWVzdF9ncGlv
cygpCj4gPiBkaXJlY3RseSBpbiBmYnRmdF9yZWdpc3Rlcl9mcmFtZWJ1ZmZlcigpLiBUaGF0IHdp
bGwgbWFrZSBpdCBzYWZlIHRvIGRyb3AKPiA+IHRoZSBPRiBkZXBlbmRlbmN5LCBvdGhlcndpc2Ug
LnJlcXVlc3RfZ3Bpb3Mgd2lsbCBiZSBOVUxMIGluIHRoZSBub24tRFQKPiA+IGNhc2UuIFRoaXMg
aXMgb25lIG9mIHRoZSBidWdzIHRoYXQgZm9sbHdlZCB0aGUgZ3BpbyByZWZhY3RvcmluZy4KPiAK
PiBSZWFsbHkgZGlmZmljdWx0IHRvIHJlYWQgdGhpcyBmYnRmdCBjb2RlICh0aGF0IEkgd3JvdGUu
Li4pLgo+IFRoZSBOVUxMIGRlcmVmIGNhbiBvbmx5IGhhcHBlbiB3aGVuIGRldi0+cGxhdGZvcm1f
ZGF0YSBpcyBzZXQuIFRoYXQKPiBjYW4ndCBoYXBwZW4sIGluIG1haW5saW5lIGF0IGxlYXN0LCBu
b3cgdGhhdCBmYnRmdF9kZXZpY2UgaXMgZ29uZS4KCkhtbS4uLiBJZiBJIHJlYWQgY29kZSBjb3Jy
ZWN0bHkgdGhpcyBwYXRjaCBkb2Vzbid0IGNoYW5nZSB0aGlzIGxvZ2ljLiBXZSBoYXZlCm5vbi1O
VUxMIC0+cmVxdWVzdF9ncGlvcygpIGluIGNhc2Ugb2YgcGRhdGEgIT0gTlVMTCBpZiBhbmQgb25s
eSBpZiBzdXBwbGllcgpnaXZlcyBpdCB0byB1cy4KClRoZSBhYm92ZSBhc3NpZ25tZW50IGhhcHBl
bnMgb25seSBmb3IgRFQgY2FzZSAoZmJ0ZnRfcHJvcGVydGllc19yZWFkKCkgaXMKZ3VhcmRlZCBh
Z2FpbnN0IG5vbi1EVCwgb2theSBub24tZndub2RlLCBjYXNlcykuCgo+ID4gWW91IGNhbiBhbHNv
IGRpdGNoIHRoZSAucmVxdWVzdF9ncGlvc19tYXRjaCBjYWxsYmFjayBpZiB5b3Ugd2FudCwgaXQK
PiA+IGlzbid0IGNhbGxlZCBhbnltb3JlIChpdCBpcyBzZXQgaW4gZmJfYWdtMTI2NGstZmwpLgoK
SSBndWVzcyBib3RoIGltcHJvdmVtZW50cyBjYW4gYmUgZG9uZSBsYXRlciBzaW5jZSB0aGV5IGFy
ZSBub3QgYWZmZWN0aW5nIHRoZQpsb2dpYyBpbiB0aGlzIHNlcmllcy4KCi0tIApXaXRoIEJlc3Qg
UmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs

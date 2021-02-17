Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD71731DDFB
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 18:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D10E6E5C6;
	Wed, 17 Feb 2021 17:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE7D6E5BF;
 Wed, 17 Feb 2021 17:13:16 +0000 (UTC)
IronPort-SDR: bDks8wok3lKE/t6CxlNPiWR1C3FN1qHTVZGrGZ9h07enKyEWhUpkCm5Fay51wKI/DmUYSp8ADg
 uLPNVEDleCqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="163039262"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="163039262"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 09:13:15 -0800
IronPort-SDR: Ze8hAK6HItV4g6zHQhfupFSfrmcGUQEuGy1aaFVF31i+EmsF3J0xduCKFOkGcaCBGcbbCMTpVW
 M10pDqE4dSAQ==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="400034792"
Received: from mvalka-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.39.140])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 09:13:06 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Petr Mladek <pmladek@suse.com>, Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 1/3] string: Consolidate yesno() helpers under string.h
 hood
In-Reply-To: <YC0QBvv9HXr64ySf@alley>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210215142137.64476-1-andriy.shevchenko@linux.intel.com>
 <43456ba7-c372-84cc-4949-dcb817188e21@amd.com>
 <CAHp75VfVXnqdVRAPQ36vZeD-ZMCjWmjA_-6T=jnOEVMne4bv0g@mail.gmail.com>
 <YC0QBvv9HXr64ySf@alley>
Date: Wed, 17 Feb 2021 19:13:03 +0200
Message-ID: <8735xubotc.fsf@intel.com>
MIME-Version: 1.0
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
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, Jakub Kicinski <kuba@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Eryk Brol <eryk.brol@amd.com>, netdev <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Raju Rangoju <rajur@chelsio.com>, Alex Deucher <alexander.deucher@amd.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxNyBGZWIgMjAyMSwgUGV0ciBNbGFkZWsgPHBtbGFkZWtAc3VzZS5jb20+IHdyb3Rl
Ogo+IE9uIE1vbiAyMDIxLTAyLTE1IDE2OjM5OjI2LCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4+
ICtDYzogU2FrYXJpIGFuZCBwcmludGsgcGVvcGxlCj4+IAo+PiBPbiBNb24sIEZlYiAxNSwgMjAy
MSBhdCA0OjI4IFBNIENocmlzdGlhbiBLw7ZuaWcKPj4gPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4gd3JvdGU6Cj4+ID4gQW0gMTUuMDIuMjEgdW0gMTU6MjEgc2NocmllYiBBbmR5IFNoZXZjaGVu
a286Cj4+ID4gPiBXZSBoYXZlIGFscmVhZHkgZmV3IHNpbWlsYXIgaW1wbGVtZW50YXRpb24gYW5k
IGEgbG90IG9mIGNvZGUgdGhhdCBjYW4gYmVuZWZpdAo+PiA+ID4gb2YgdGhlIHllc25vKCkgaGVs
cGVyLiAgQ29uc29saWRhdGUgeWVzbm8oKSBoZWxwZXJzIHVuZGVyIHN0cmluZy5oIGhvb2QuCj4+
ID4gPgo+PiA+ID4gU2lnbmVkLW9mZi1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNo
ZW5rb0BsaW51eC5pbnRlbC5jb20+Cj4+ID4KPj4gPiBMb29rcyBsaWtlIGEgZ29vZCBpZGVhIHRv
IG1lLCBmZWVsIGZyZWUgdG8gYWRkIGFuIEFja2VkLWJ5OiBDaHJpc3RpYW4KPj4gPiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gdG8gdGhlIHNlcmllcy4KPj4gCj4+IFRoYW5rcy4K
Pj4gCj4+ID4gQnV0IGxvb2tpbmcgYXQgdGhlIHVzZSBjYXNlcyBmb3IgdGhpcywgd291bGRuJ3Qg
aXQgbWFrZSBtb3JlIHNlbnNlIHRvCj4+ID4gdGVhY2gga3ByaW50ZiBzb21lIG5ldyBmb3JtYXQg
bW9kaWZpZXIgZm9yIHRoaXM/Cj4+IAo+PiBBcyBhIG5leHQgc3RlcD8gSUlSQyBTYWthcmkgaGFz
IGF0IHNvbWUgcG9pbnQgdGhlIHNlcmllcyBjb252ZXJ0ZWQKPj4geWVzbm8gYW5kIENvLiB0byBz
b21ldGhpbmcgd2hpY2ggSSBkb24ndCByZW1lbWJlciB0aGUgZGV0YWlscyBvZi4KPj4gCj4+IEd1
eXMsIHdoYXQgZG8geW91IHRoaW5rPwo+Cj4gSG9uZXN0bHksIEkgdGhpbmsgdGhhdCB5ZXNubygp
IGlzIG11Y2ggZWFzaWVyIHRvIHVuZGVyc3RhbmQgdGhhbiAlcHkuCj4gQW5kICVweVtET1ldIGxv
b2tzIHJlYWxseSBzY2FyeS4gSXQgaGFzIGJlZW4gc3VnZ2VzdGVkIGF0Cj4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGttbC9ZQ3FhTm5yN3luUnlkY3pFQHNtaWxlLmZpLmludGVsLmNvbS8jdAo+
Cj4gWWVzLCBlbmFibGVkaXNhYmxlKCkgaXMgaGFyZCB0byBwYXJzZSBidXQgaXQgaXMgc3RpbGwg
c2VsZi1leHBsYWluaW5nCj4gYW5kIGNhbiBiZSBmb3VuZCBlYXNpbHkgYnkgY3Njb3BlLiBPbiB0
aGUgY29udHJhcnksICVweUQgd2lsbCBsaWtlbHkKPiBwcmludCBzb21lIHB5dGhvbiBjb2RlIGFu
ZCBpdCBpcyBub3QgY2xlYXIgaWYgaXQgd291bGQgYmUgY29tcGF0aWJsZQo+IHdpdGggdjMuIEkg
YW0ganVzdCBraWRkaW5nIGJ1dCB5b3UgZ2V0IHRoZSBwaWN0dXJlLgoKUGVyc29uYWxseSBJIHBy
ZWZlciAlcyBhbmQgdGhlIGZ1bmN0aW9ucy4KCkkgdGhpbmsgdGhlIGZvcm1hdCBzcGVjaWZpZXJz
IGhhdmUgYmVjb21lIHVud2llbGR5LiBJIGRvbid0IHJlbWVtYmVyIGFueQpvZiB0aGUga2VybmVs
IHNwZWNpZmljIG9uZXMgYnkgaGVhcnQsIEkgYWx3YXlzIGxvb2sgdGhlbSB1cCBvciBqdXN0CmNh
cmdvLWN1bHQuIEkgdGhpbmsgdGhlIGZvdXJjYyBmb3JtYXQgc3BlY2lmaWVycyBhcmUgYSBuaWNl
IGNsZWFudXAsIGJ1dApJIGRvbid0IHJlbWVtYmVyIHRoZW0gZWl0aGVyLiBJJ2QgbGlrZSBzb21l
dGhpbmcgbGlrZSAlZm9ve3llc25vfSB3aGVyZSwKaWYgeW91IHJlbWVtYmVyIHRoZSAlZm9vIHBh
cnQsIHlvdSBjb3VsZCBhY3R1YWxseSBhbHNvIHJlbWVtYmVyIHRoZQpyZXN0LgoKQnV0IHJlYWxs
eSBpZiB5b3UgZ2V0ICphbnkqIHZlcnNpb24gYWNjZXB0ZWQsIEknbSBub3QgZ29pbmcgdG8gYXJn
dWUKYWdhaW5zdCBpdCwgYW5kIHlvdSBjYW4gZGlzcmVnYXJkIHRoaXMgYXMgbWVhbmluZ2xlc3Mg
YmlrZXNoZWRkaW5nLgoKQlIsCkphbmkuCgoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNv
dXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1D38F06A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 18:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D7A6E436;
	Thu, 15 Aug 2019 16:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3416E9F7
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 16:25:28 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id u15so2681089oiv.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 09:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wAN07Aej6p7Hd2hVE0xjo/DUiYqDdqV1ia2cD28NFxQ=;
 b=q/uV9Ch9AeajTXK8b7hmcIKbGo7jW827lKRtsU1+ZRGV1wTfiD09856Vnu4jeIKWEk
 uiSCTongh0wFEGIFz7DMyr+KQgwf8lJpVU6dlfUY9lWsWe7Jsg9s3Hs6TbfGxJug7g8K
 j2Hmy29WnEPiTd+0M3QcigJ7/Loqs5vfmbRurX8fDAk1kh/2I9cyINxHMfHtMNyWZcak
 QS9wUyNIZvgpbYhBREUjNQ62aCf2ZFFXWg4fCD6ENMKlcqdfbI04tVTxUCuT1ppr7k93
 V8XvhtTFdZKQgp4VTio1KYRSiT4HHWEW6X5YWkoHWa+T5vZRlHkV2/5HFexI962882rg
 myFA==
X-Gm-Message-State: APjAAAXNnZRYiVMMtHcaPDx3oHzLZo0gL58ajQc7PIDH8rHs71jJ5Qvf
 6is6XguVM9JjcRgmX6yhSat6YnZlTqLsXsfN5Qq2EQ==
X-Google-Smtp-Source: APXvYqx5YhSWqsE1qNwb3e6Mk3OQ7+I0+E8yd7D6yMtzpx5rSV3pk3wPcLHj+cK8qGuWQRqpgPomSdRixh5Xeblp1Ps=
X-Received: by 2002:a54:4f89:: with SMTP id g9mr2267959oiy.110.1565886327298; 
 Thu, 15 Aug 2019 09:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-3-daniel.vetter@ffwll.ch>
 <20190814134558.fe659b1a9a169c0150c3e57c@linux-foundation.org>
 <20190815084429.GE9477@dhcp22.suse.cz> <20190815130415.GD21596@ziepe.ca>
 <CAKMK7uE9zdmBuvxa788ONYky=46GN=5Up34mKDmsJMkir4x7MQ@mail.gmail.com>
 <20190815143759.GG21596@ziepe.ca>
 <CAKMK7uEJQ6mPQaOWbT_6M+55T-dCVbsOxFnMC6KzLAMQNa-RGg@mail.gmail.com>
 <20190815151028.GJ21596@ziepe.ca>
In-Reply-To: <20190815151028.GJ21596@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 15 Aug 2019 18:25:16 +0200
Message-ID: <CAKMK7uG33FFCGJrDV4-FHT2FWi+Z5SnQ7hoyBQd4hignzm1C-A@mail.gmail.com>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=wAN07Aej6p7Hd2hVE0xjo/DUiYqDdqV1ia2cD28NFxQ=;
 b=DOotlbxSe+oEc7h+VfeydF2jzAD8OEvRpE+Mg/T7l9NuSqDLgxqy80Rm7yaUhdlUsq
 XgZgOuBZPynYHO4pUyg0M+oxFE8PtShe6V/b9aN3W9gEmBvrEDd3jLri92IEvOnBd8yU
 d6tqu6UAtAcEGMC2AAWjeIO4ADYzS2PbO0fdY=
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
Cc: Feng Tang <feng.tang@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jann Horn <jannh@google.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 David Rientjes <rientjes@google.com>, Wei Wang <wvw@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgNToxMCBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVw
ZS5jYT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAwNDo0MzozOFBNICswMjAw
LCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+Cj4gPiBZb3UgaGF2ZSB0byB3YWl0IGZvciB0aGUgZ3B1
IHRvIGZpbm5pc2ggY3VycmVudCBwcm9jZXNzaW5nIGluCj4gPiBpbnZhbGlkYXRlX3JhbmdlX3N0
YXJ0LiBPdGhlcndpc2UgdGhlcmUncyBubyBwb2ludCB0byBhbnkgb2YgdGhpcwo+ID4gcmVhbGx5
LiBTbyB0aGUgd2FpdF9ldmVudC9kbWFfZmVuY2Vfd2FpdCBhcmUgdW5hdm9pZGFibGUgcmVhbGx5
Lgo+Cj4gSSBkb24ndCBlbnZ5IHlvdXIgdGFzayA6fAo+Cj4gQnV0LCB3aGF0IHlvdSBkZXNjcmli
ZSBzdXJlIHNvdW5kcyBsaWtlIGEgJ3JlZ2lzdHJhdGlvbiBjYWNoZScgbW9kZWwsCj4gbm90IHRo
ZSAnc2hhZG93IHB0ZScgbW9kZWwgb2YgY29oZXJlbmN5Lgo+Cj4gVGhlIGtleSBkaWZmZXJlbmNl
IGlzIHRoYXQgYSByZWdpcnN0YXRpb25jYWNoZSBpcyBhbGxvd2VkIHRvIGJlY29tZQo+IGluY29o
ZXJlbnQgd2l0aCB0aGUgVk1BJ3MgYmVjYXVzZSBpdCBob2xkcyBwYWdlIHBpbnMuIEl0IGlzIGEK
PiBwcm9ncmFtbWluZyBidWcgaW4gdXNlcnNwYWNlIHRvIGNoYW5nZSBWQSBtYXBwaW5ncyB2aWEg
bW1hcC9tdW5tYXAvZXRjCj4gd2hpbGUgdGhlIGRldmljZSBpcyB3b3JraW5nIG9uIHRoYXQgVkEs
IGJ1dCBpdCBkb2VzIG5vdCBoYXJtIHN5c3RlbQo+IGludGVncml0eSBiZWNhdXNlIG9mIHRoZSBw
YWdlIHBpbi4KPgo+IFRoZSBjYWNoZSBlbnN1cmVzIHRoYXQgZWFjaCBpbml0aWF0ZWQgb3BlcmF0
aW9uIHNlZXMgYSBETUEgc2V0dXAgdGhhdAo+IG1hdGNoZXMgdGhlIGN1cnJlbnQgVkEgbWFwIHdo
ZW4gdGhlIG9wZXJhdGlvbiBpcyBpbml0aWF0ZWQgYW5kIGFsbG93cwo+IGV4cGVuc2l2ZSBkZXZp
Y2UgRE1BIHNldHVwcyB0byBiZSByZS11c2VkLgo+Cj4gQSAnc2hhZG93IHB0ZScgbW9kZWwgKGll
IGhtbSkgKnJlYWxseSogbmVlZHMgZGV2aWNlIHN1cHBvcnQgdG8KPiBkaXJlY3RseSBibG9jayBE
TUEgYWNjZXNzIC0gaWUgdHJpZ2dlciAnZGV2aWNlIHBhZ2UgZmF1bHQnLiBpZSB0aGUKPiBpbnZh
bGlkYXRlX3N0YXJ0IHNob3VsZCBpbmZvcm0gdGhlIGRldmljZSB0byBlbnRlciBhIGZhdWx0IG1v
ZGUgYW5kCj4gdGhhdCBpcyBpdC4gIElmIHRoZSBkZXZpY2UgY2FuJ3QgZG8gdGhhdCwgdGhlbiB0
aGUgZHJpdmVyIHByb2JhYmx5Cj4gc2hvdWxkbid0IHBlcnN1ZSB0aGlzIGxldmVsIG9mIGNvaGVy
ZW5jeS4gVGhlIGRyaXZlciB3b3VsZCBxdWlja2x5IGdldAo+IGludG8gdGhlIG1lc3N5IGxvY2tp
bmcgcHJvYmxlbXMgbGlrZSBkbWFfZmVuY2Vfd2FpdCBmcm9tIGEgbm90aWZpZXIuCj4KPiBJdCBp
cyBpbXBvcnRhbnQgdG8gaWRlbnRpZnkgd2hhdCBtb2RlbCB5b3UgYXJlIGdvaW5nIGZvciBhcyBk
ZWZpbmluZyBhCj4gJ3JlZ2lzdHJhdGlvbiBjYWNoZScgY29oZXJlbmNlIGV4cGVjdGF0aW9uIGFs
bG93cyB0aGUgZHJpdmVyIHRvIHNraXAKPiBibG9ja2luZyBpbiBpbnZhbGlkYXRlX3JhbmdlX3N0
YXJ0LiBBbGwgaXQgZG9lcyBpcyBpbnZhbGlkYXRlIHRoZQo+IGNhY2hlIHNvIHRoYXQgZnV0dXJl
IG9wZXJhdGlvbnMgcGljayB1cCB0aGUgbmV3IFZBIG1hcHBpbmcuCj4KPiBJbnRlbCdzIEhGSSBS
RE1BIGRyaXZlciB1c2VzIHRoaXMgbW9kZWwgZXh0ZW5zaXZlbHksIGFuZCBJIHRoaW5rIGl0IGlz
Cj4gd2VsbCBwcm92ZW4sIHdpdGhpbiBzb21lIGxpbWl0YXRpb25zIG9mIGNvdXJzZS4KPgo+IEF0
IGxlYXN0LCAncmVnaXN0cmF0aW9uIGNhY2hlJyBpcyB0aGUgb25seSB1c2UgbW9kZWwgSSBrbm93
IG9mIHdoZXJlCj4gaXQgaXMgYWNjZXB0YWJsZSB0byBza2lwIGludmFsaWRhdGVfcmFuZ2VfZW5k
LgoKSSdtIG5vdCByZWFsbHkgd2VsbCB2ZXJzZWQgaW4gdGhlIGRldGFpbHMgb2Ygb3VyIHVzZXJw
dHIsIGJ1dCBib3RoCmFtZGdwdSBhbmQgaTkxNSB3YWl0IGZvciB0aGUgZ3B1IHRvIGNvbXBsZXRl
IGZyb20KaW52YWxpZGF0ZV9yYW5nZV9zdGFydC4gSmVyb21lIGhhcyBhdCBsZWFzdCBsb29rZWQg
YSBsb3QgYXQgdGhlIGFtZGdwdQpvbmUsIHNvIG1heWJlIGhlIGNhbiBleHBsYWluIHdoYXQgZXhh
Y3RseSBpdCBpcyB3ZSdyZSBkb2luZyAuLi4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0
d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBo
dHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=

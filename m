Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D608EE8A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 16:43:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF4C6E428;
	Thu, 15 Aug 2019 14:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4404D6E9CF
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 14:43:50 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id t24so2224786oij.13
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 07:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EcYg2sxDc/ZPh1T6muHTeyf6D7+2ZcuVsE1FpQg6dIU=;
 b=r2a8uUKAOQ+9ENEjHclGNTo/DheXo8v1TFWDXbHF26NhnZTsGmUVyu3O54sCqnGqii
 o+tM1CHsrDsK6e9G6zae33vmCNZvricDv7hieIHo8AbR4cgv/56GkhSsqOZ2ZAMIh8II
 Swy5VPrQNoWvf+gxnHnVpi98DrkykiH1CWMIyZri5jF/w+qyVNGlCCkjPX3k0tE3NkIK
 bGJBpJdxO7UxKlS1Zsq75ymbig7QlHJchbT1WA3vKfoFRL+Bn9guldCyopSj71zlQoBL
 cqPLPw/VbZTeY2950OS3KwIvKnJpZRPrwTqNKKUmjRrtUFW0JZqxnaw1WpWPM/EZAr7W
 omiw==
X-Gm-Message-State: APjAAAUJUqEtBt4BbjxhU69MXZZJEXW+0L2EJjyKK37EsYc+neFjQuGH
 Aso7Vs+Bk+tUqHWVCJDotQb/jBuvIb/mTwJuBMilpw==
X-Google-Smtp-Source: APXvYqySm/Ahp86UOdMXb+iRgyDRu4sKHNQjbABa4M9MuTxMEzBGIBaeNRuX3C9mf0zipUFJG00ZJ30GOlZewnICp5Q=
X-Received: by 2002:a54:4f89:: with SMTP id g9mr1910952oiy.110.1565880229376; 
 Thu, 15 Aug 2019 07:43:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-3-daniel.vetter@ffwll.ch>
 <20190814134558.fe659b1a9a169c0150c3e57c@linux-foundation.org>
 <20190815084429.GE9477@dhcp22.suse.cz> <20190815130415.GD21596@ziepe.ca>
 <CAKMK7uE9zdmBuvxa788ONYky=46GN=5Up34mKDmsJMkir4x7MQ@mail.gmail.com>
 <20190815143759.GG21596@ziepe.ca>
In-Reply-To: <20190815143759.GG21596@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 15 Aug 2019 16:43:38 +0200
Message-ID: <CAKMK7uEJQ6mPQaOWbT_6M+55T-dCVbsOxFnMC6KzLAMQNa-RGg@mail.gmail.com>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
To: Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=EcYg2sxDc/ZPh1T6muHTeyf6D7+2ZcuVsE1FpQg6dIU=;
 b=JYRuFfn7Urv5lm2qIS15ol2FS8DwFIVG8OmWWYMrXmD0Y8R7ysGKlNMvt3KB9qcDzN
 a6Kx7zNWcIphDglLEOAwkTDGtkZEST11XQuWmWBPoVjWS+zZWiun6XIXVgDPHSeyw+S6
 Mixv9rxX3YTPc7/9YynJMiIFHb7t7+ZPgoLpg=
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

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgNDozOCBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVw
ZS5jYT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEF1ZyAxNSwgMjAxOSBhdCAwMzoxMjoxMVBNICswMjAw
LCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gT24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMzowNCBQ
TSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFRo
dSwgQXVnIDE1LCAyMDE5IGF0IDEwOjQ0OjI5QU0gKzAyMDAsIE1pY2hhbCBIb2NrbyB3cm90ZToK
PiA+ID4KPiA+ID4gPiBBcyB0aGUgb29tIHJlYXBlciBpcyB0aGUgcHJpbWFyeSBndWFyYW50ZWUg
b2YgdGhlIG9vbSBoYW5kbGluZyBmb3J3YXJkCj4gPiA+ID4gcHJvZ3Jlc3MgaXQgY2Fubm90IGJl
IGJsb2NrZWQgb24gYW55dGhpbmcgdGhhdCBtaWdodCBkZXBlbmQgb24gYmxvY2thYmxlCj4gPiA+
ID4gbWVtb3J5IGFsbG9jYXRpb25zLiBUaGVzZSBhcmUgbm90IHJlYWxseSBlYXN5IHRvIHRyYWNr
IGJlY2F1c2UgdGhleQo+ID4gPiA+IG1pZ2h0IGJlIGluZGlyZWN0IC0gZS5nLiBub3RpZmllciBi
bG9ja3Mgb24gYSBsb2NrIHdoaWNoIG90aGVyIGNvbnRleHQKPiA+ID4gPiBob2xkcyB3aGlsZSBh
bGxvY2F0aW5nIG1lbW9yeSBvciB3YWl0aW5nIGZvciBhIGZsdXNoZXIgdGhhdCBuZWVkcyBtZW1v
cnkKPiA+ID4gPiB0byBwZXJmb3JtIGl0cyB3b3JrLgo+ID4gPgo+ID4gPiBCdXQgbG9ja2RlcCAq
ZG9lcyogdHJhY2sgYWxsIHRoaXMgYW5kIGZzX3JlY2xhaW1fYWNxdWlyZSgpIHdhcyBjcmVhdGVk
Cj4gPiA+IHRvIHNvbHZlIGV4YWN0bHkgdGhpcyBwcm9ibGVtLgo+ID4gPgo+ID4gPiBmc19yZWNs
YWltIGlzIGEgbG9jayBhbmQgaXQgZmxvd3MgdGhyb3VnaCBhbGwgdGhlIHVzdWFsIGxvY2tkZXAK
PiA+ID4gc2NoZW1lcyBsaWtlIGFueSBvdGhlciBsb2NrLiBBbnkgdGltZSB0aGUgcGFnZSBhbGxv
Y2F0b3Igd2FudHMgdG8gZG8KPiA+ID4gc29tZXRoaW5nIHRoZSB3b3VsZCBkZWFkbG9jayB3aXRo
IHJlY2xhaW0gaXQgdGFrZXMgdGhlIGxvY2suCj4gPiA+Cj4gPiA+IEZhaWx1cmUgaXMgZXhwcmVz
c2VkIGJ5IGEgZGVhZGxvY2sgY3ljbGUgaW4gdGhlIGxvY2tkZXAgbWFwLCBhbmQKPiA+ID4gbG9j
a2RlcCBjYW4gaGFuZGxlIGFyYml0YXJ5IGNvbXBsZXhpdHkgdGhyb3VnaCBsYXllcnMgb2YgbG9j
a3MsIHdvcmsKPiA+ID4gcXVldWVzLCB0aHJlYWRzLCBldGMuCj4gPiA+Cj4gPiA+IFdoYXQgaXMg
bWlzc2luZz8KPiA+Cj4gPiBMb2NrZGVwIGRvZW5zJ3Qgc2VlbiBldmVyeXRoaW5nIGJ5IGZhci4g
RS5nLiBhIHdhaXRfZXZlbnQgd2lsbCBiZQo+ID4gY2F1Z2h0IGJ5IHRoZSBhbm5vdGF0aW9ucyBo
ZXJlLCBidXQgbm90IGJ5IGxvY2tkZXAuCj4KPiBTdXJlLCBidXQgdGhlIHdhaXRfZXZlbnQgbWln
aHQgYmUgT0sgaWYgaXRzIHByb2dyZXNzIGlzbid0IGNvbnRpbmdlbnQKPiBvbiBmc19yZWNsYWlt
LCBpZSB0cmlnZ2VyZWQgZnJvbSBpbnRlcnJ1cHQsIHNvIHdoeSBiYW4gaXQ/CgpGb3Igbm9ybWFs
IG5vdGlmaWVycyBzdXJlIChidXQgbG9ja2RlcCB3b24ndCBoZWxwIHlvdSBwcm9vZiB0aGF0IGF0
CmFsbCkuIEZvciBvb21fcmVhcGVyIGFwcGFyZW50bHkgbm90LCBidXQgdGhhdCdzIHJlYWxseSBN
aWNoYWwncyB0aGluZywKSSBoYXZlIG5vdCBtdWNoIGlkZWEgYWJvdXQgdGhhdC4KCj4gPiBBbmQg
c2luY2Ugd2UncmUgdGFsa2luZyBhYm91dCBtbXUgbm90aWZpZXJzIGhlcmUgYW5kIGdwdXMvZG1h
IGVuZ2luZXMuCj4gPiBXZSBoYXZlIGRtYV9mZW5jZV93YWl0LCB3aGljaCBjYW4gd2FpdCBmb3Ig
YW55IGh3L2RyaXZlciBpbiB0aGUgc3lzdGVtCj4gPiB0aGF0IHRha2VzIHBhcnQgaW4gc2hhcmVk
L3plcm8tY29weSBidWZmZXIgcHJvY2Vzc2luZy4gV2hpY2ggYXQgbGVhc3QKPiA+IG9uIHRoZSBn
cmFwaGljcyBzaWRlIGlzIGV2ZXJ5dGhpbmcuIFRoaXMgcHVsbHMgaW4gZW5vcm1vdXMgYW1vdW50
cyBvZgo+ID4gZGVhZGxvY2sgcG90ZW50aWFsIHRoYXQgbG9ja2RlcCBzaW1wbHkgaXMgYmxpbmQg
YWJvdXQgYW5kIHdpbGwgbmV2ZXIKPiA+IHNlZS4KPgo+IEl0IHNlZW1zIHZlcnkgcmlza3kgdG8g
ZW50YWdsZSBhIG5vdGlmaWVyIHdpZGVseSBsaWtlIHRoYXQuCgpUaGF0J3Mgd2h5IEkndmUgbG9v
a2VkIGludG8gYWxsIHBvc3NpYmxlIHdheXMgdG8gYW5ub3RhdGUgdGhlbSB3aXRoCmRlYnVnIGlu
ZnJhc3RydWN0dXJlLgoKPiBJdCBsb29rcyBwcmV0dHkgc3VyZSB0aGF0IG5vdGlmaWVycyBhcmUg
ZnNfcmVjbGFpbSwgc28gYXQgYSBtaW5pbXVtCj4gdGhhdCB3YWl0X2V2ZW50IGNhbid0IGJlIGNv
bnRpbmdlbnQgb24gYW55dGhpbmcgdGhhdCBpcyBkb2luZwo+IEdGUF9LRVJORUwgb3IgaXQgd2ls
bCBkZWFkbG9jayAtIGFuZCBibG9ja2FibGUgZG9lc24ndCBtYWtlIHRoYXQgc2xlZXAKPiBzYWZl
Lgo+Cj4gQXZvaWRpbmcgYW4gdW5jZXJ0YWluIHdhaXRfZXZlbnQgdW5kZXIgbm90aWZpZXJzIHdv
dWxkIHNlZW0gdG8gYmUgdGhlCj4gb25seSByZWFzb25hYmxlIGRlc2lnbiBoZXJlLi4KCllvdSBo
YXZlIHRvIHdhaXQgZm9yIHRoZSBncHUgdG8gZmlubmlzaCBjdXJyZW50IHByb2Nlc3NpbmcgaW4K
aW52YWxpZGF0ZV9yYW5nZV9zdGFydC4gT3RoZXJ3aXNlIHRoZXJlJ3Mgbm8gcG9pbnQgdG8gYW55
IG9mIHRoaXMKcmVhbGx5LiBTbyB0aGUgd2FpdF9ldmVudC9kbWFfZmVuY2Vfd2FpdCBhcmUgdW5h
dm9pZGFibGUgcmVhbGx5LgoKVGhhdCdzIGFsc28gd2h5IEknbSB0aHJvd2luZyBpbiB0aGUgbG9j
a2RlcCBhbm5vdGF0aW9uIG9uIHRvcCwgYW5kIHdoeQppdCB3b3VsZCBiZSByZWFsbHkgbmljZSBp
ZiB3ZSBzb21laG93IGNhbiBnZXQgdGhlIGNyb3NzLXJlbGVhc2Ugd29yawpsYW5kZWQuIEJ1dCBp
dCBsb29rcyBsaWtlIGFsbCB0aGUgcGVvcGxlIHdobyBjb3VsZCBtYWtlIGl0IGhhcHBlbiBhcmUK
YnVzeSB3aXRoIHNtZWx0ZG93biA6LS8KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2Fy
ZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRw
Oi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=

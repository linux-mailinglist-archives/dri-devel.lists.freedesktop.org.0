Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C918E6AD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A856E8EA;
	Thu, 15 Aug 2019 08:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E5B6E877
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 23:58:07 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id i4so603439qtj.8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 16:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FuSmTDQh/a+OrOwuynD6gKCzqpRnsaVG3w7wfpm3wqA=;
 b=MSVIXwkPUo9LbKAQlBABv/z3CEIBCRiGKR7PVNjDZAW61QSwmMEBjroipLmiaoQPaV
 BC0mhAN8CB2oQNydpSi8+fOZYExkvCRJnpwn5fbR0uulMfP2aVMf4mOuuTsRmAvumfDO
 9NW5JStvlU2UkXKF/XpXitrL03DMp8AbM5LY222B9TYGoj5szAT7cTgwaEaJ8YLVKLPf
 2zUHPjCIy9X4yWNPGu+xiIXQRrcYUJbizTy2fOre9pEJy2gAOfHrJhC7PoJNb36vzlF1
 eMloGpuQvYa6e8rAMch5e/JaSG4WWQ6k/TXSiBNVEFlMAJ2KhQjSV0aWHw8s9MeiZ3VB
 PIJw==
X-Gm-Message-State: APjAAAU2hh+NRLfhpWzoV2VRiuZYVdVu/jvYFSWOi42UbmKMDQdcjFQb
 w76cpzkltMmh56FlZLBvfeuJkw==
X-Google-Smtp-Source: APXvYqxbOcBJLerQ1ntgU+4v2Av22ce7b8GmE+kj/TlbSxhhrGXkYlwnkE0HmVlmbhH1xrGkT1mvng==
X-Received: by 2002:ac8:1605:: with SMTP id p5mr1674140qtj.79.1565827086773;
 Wed, 14 Aug 2019 16:58:06 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id r19sm542639qtm.44.2019.08.14.16.58.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 14 Aug 2019 16:58:06 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hy39Z-0003Tg-WA; Wed, 14 Aug 2019 20:58:06 -0300
Date: Wed, 14 Aug 2019 20:58:05 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/5] kernel.h: Add non_block_start/end()
Message-ID: <20190814235805.GB11200@ziepe.ca>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
 <20190814202027.18735-3-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814202027.18735-3-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FuSmTDQh/a+OrOwuynD6gKCzqpRnsaVG3w7wfpm3wqA=;
 b=bIdfPpifc5Df9ZyMbaAk6YR1Vm3aqYYmMsJc0qwv0DToMlRhj/7B84jNM0/7ULt0L/
 iPW3be0SBOV+BK2Qq+r3HGbp7n+Ruf2KfYxPY7vCJp7IP2MVW6KkmPRqvpHfiaudOeEA
 8XRBeYf9Jvlsy4GSSmyOXgDr+1GrEBlEw5Rb2ZSzcOZLkwbEmk8gQhI8Fk1vnvmp9UPM
 aWm+btPas4OlWBb79U1jxtWQ9X1VBjwE7Lwmpo54l5E5bq4gRjI0aEzdE+q8KotxnPb0
 FG86Zjs2dElwOvmLJRDFrE3H0a/YBujkY9Fwqq3EXsGzEM0lRNI9ELgfB11P/lPn/yLd
 ypYA==
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
Cc: Feng Tang <feng.tang@intel.com>, Michal Hocko <mhocko@suse.com>,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jann Horn <jannh@google.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Randy Dunlap <rdunlap@infradead.org>, David Rientjes <rientjes@google.com>,
 Wei Wang <wvw@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMTA6MjA6MjRQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBJbiBzb21lIHNwZWNpYWwgY2FzZXMgd2UgbXVzdCBub3QgYmxvY2ssIGJ1dCB0aGVy
ZSdzIG5vdCBhCj4gc3BpbmxvY2ssIHByZWVtcHQtb2ZmLCBpcnFzLW9mZiBvciBzaW1pbGFyIGNy
aXRpY2FsIHNlY3Rpb24gYWxyZWFkeQo+IHRoYXQgYXJtcyB0aGUgbWlnaHRfc2xlZXAoKSBkZWJ1
ZyBjaGVja3MuIEFkZCBhIG5vbl9ibG9ja19zdGFydC9lbmQoKQo+IHBhaXIgdG8gYW5ub3RhdGUg
dGhlc2UuCj4gCj4gVGhpcyB3aWxsIGJlIHVzZWQgaW4gdGhlIG9vbSBwYXRocyBvZiBtbXUtbm90
aWZpZXJzLCB3aGVyZSBibG9ja2luZyBpcwo+IG5vdCBhbGxvd2VkIHRvIG1ha2Ugc3VyZSB0aGVy
ZSdzIGZvcndhcmQgcHJvZ3Jlc3MuIFF1b3RpbmcgTWljaGFsOgo+IAo+ICJUaGUgbm90aWZpZXIg
aXMgY2FsbGVkIGZyb20gcXVpdGUgYSByZXN0cmljdGVkIGNvbnRleHQgLSBvb21fcmVhcGVyIC0K
PiB3aGljaCBzaG91bGRuJ3QgZGVwZW5kIG9uIGFueSBsb2NrcyBvciBzbGVlcGFibGUgY29uZGl0
aW9uYWxzLiBUaGUgY29kZQo+IHNob3VsZCBiZSBzd2lmdCBhcyB3ZWxsIGJ1dCB3ZSBtb3N0bHkg
ZG8gY2FyZSBhYm91dCBpdCB0byBtYWtlIGEgZm9yd2FyZAo+IHByb2dyZXNzLiBDaGVja2luZyBm
b3Igc2xlZXBhYmxlIGNvbnRleHQgaXMgdGhlIGJlc3QgdGhpbmcgd2UgY291bGQgY29tZQo+IHVw
IHdpdGggdGhhdCB3b3VsZCBkZXNjcmliZSB0aGVzZSBkZW1hbmRzIGF0IGxlYXN0IHBhcnRpYWxs
eS4iCgpCdXQgdGhpcyBkZXNjcmliZXMgZnNfcmVjbGFpbV9hY3F1aXJlKCkgLSBpcyB0aGVyZSBz
b21lIHJlYXNvbiB3ZSBhcmUKY29uZmxhdGluZyBmc19yZWNsYWltIHdpdGggbm9uLXNsZWVwaW5n
PwoKaWUgaXMgdGhlcmUgc29tZSBmdW5kYW1lbnRhbCBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIGJs
b2NrIHN0YWNrCnNsZWVwaW5nIGR1cmluZyByZWNsYWltIHdoaWxlIGl0IHdhaXRzIGZvciBhIGRy
aXZlciB0byB3cml0ZSBvdXQgYQpwYWdlIGFuZCBhIEdQVSBkcml2ZXIgc2xlZXBpbmcgZHVyaW5n
IE9PTSB3aGlsZSBpdCB3YWl0cyBmb3IgaXQncyBIVwp0byBmZW5jZSBETUEgb24gYSBwYWdlPwoK
RnVuZGFtZW50YWxseSB3ZSBoYXZlIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQoKSB2cyBpbnZhbGlk
YXRlX3JhbmdlKCkKYXMgdGhlIHN0YXJ0KCkgdmVyc2lvbiBpcyBhYmxlIHRvIHNsZWVwLiBJZiBk
cml2ZXJzIGNhbiBkbyB0aGVpciB3b3JrCndpdGhvdXQgc2xlZXBpbmcgdGhlbiB0aGV5IHNob3Vs
ZCBiZSB1c2luZyBpbnZhbGlkYXJlX3JhbmdlKCkgaW5zdGVhZC4KClRodXMsIGl0IGRvZXNuJ3Qg
c2VlbSB0byBtYWtlIGFueSBzZW5zZSB0byBhc2sgYSBkcml2ZXIgdGhhdCByZXF1aXJlcyBhCnNs
ZWVwaW5nIEFQSSBub3QgdG8gc2xlZXAuCgpBRkFJQ1Qgd2hhdCBpcyByZWFsbHkgZ29pbmcgb24g
aGVyZSBpcyB0aGF0IGRyaXZlcnMgY2FyZSBhYm91dCBvbmx5IGEKc3Vic2V0IG9mIHRoZSBWQSBz
cGFjZSwgYW5kIHdlIHdhbnQgdG8gcXVlcnkgdGhlIGRyaXZlciBpZiBpdCBjYXJlcwphYm91dCB0
aGUgcmFuZ2UgcHJvcG9zZWQgdG8gYmUgT09NJ2QsIHNvIHdlIGNhbiBPT00gcmFuZ2VzIHRoYXQg
YXJlCmRvIG5vdCBoYXZlIFNQVEVzLgoKaWUgaWYgeW91IGxvb2sgcHJldHR5IG11Y2ggYWxsIGRy
aXZlcnMgZG8gZXhhY3RseSBhcwp1c2VycHRyX21uX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnQoKSBk
b2VzLCBhbmQgYmFpbCBvbmNlIHRoZXkgZGV0ZWN0CnRoZSBWQSByYW5nZSBpcyBvZiBpbnRlcmVz
dC4KClNvLCBJJ20gd29ya2luZyBvbiBhIHBhdGNoIHRvIGxpZnQgdGhlIGludGVydmFsIHRyZWUg
aW50byB0aGUgbm90aWZpZXIKY29yZSBhbmQgdGhlbiBkbyB0aGUgVkEgdGVzdCBPT00gbmVlZHMg
d2l0aG91dCBib3RoZXJpbmcgdGhlCmRyaXZlci4gRHJpdmVycyBjYW4gcmV0YWluIHRoZSBibG9j
a2luZyBBUEkgdGhleSByZXF1aXJlIGFuZCBPT00gY2FuCndvcmsgb24gVkEncyB0aGF0IGRvbid0
IGhhdmUgU1BURXMuCgpUaGlzIGFwcHJvYWNoIGFsc28gc29sdmVzIHRoZSBjcml0aWNhbCBidWcg
aW4gdGhpcyBwYXRoOgogIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1tLzIwMTkwODA3
MTkxNjI3LkdBMzAwOEB6aWVwZS5jYS8KCkFuZCBzb2x2ZXMgYSBidW5jaCBvZiBvdGhlciBidWdz
IGluIHRoZSBkcml2ZXJzLgoKPiBQZXRlciBhbHNvIGFza2VkIHdoZXRoZXIgd2Ugd2FudCB0byBj
YXRjaCBzcGlubG9ja3Mgb24gdG9wLCBidXQgTWljaGFsCj4gc2FpZCB0aG9zZSBhcmUgbGVzcyBv
ZiBhIHByb2JsZW0gYmVjYXVzZSBzcGlubG9ja3MgY2FuJ3QgaGF2ZSBhbgo+IGluZGlyZWN0IGRl
cGVuZGVuY3kgdXBvbiB0aGUgcGFnZSBhbGxvY2F0b3IgYW5kIGhlbmNlIGNsb3NlIHRoZSBsb29w
Cj4gd2l0aCB0aGUgb29tIHJlYXBlci4KCkFnYWluLCB0aGlzIGVudGlyZWx5IHNvdW5kcyBsaWtl
IGZzX3JlY2xhaW0gLSBpc24ndCB0aGF0IGV4YWN0bHkgd2hhdAppdCBpcyBmb3I/CgpJIGhhdmUg
aGFkIG9uIG15IGxpc3QgYSBzZWNvbmQgYW5kIHZlcnkgcmVsYXRlZCBwb3NzaWJsZSBidWcuIEkg
cmFuCmludG8gY29tbWl0IDM1Y2ZhMmIwYjQ5MSAoIm1tL21tdV9ub3RpZmllcjogYWxsb2NhdGUg
bW11X25vdGlmaWVyIGluCmFkdmFuY2UiKSB3aGljaCBzYXlzIHRoYXQgbWFwcGluZy0+aV9tbWFw
X211dGV4IGlzIHVuZGVyIGZzX3JlY2xhaW0oKS4KCldlIGRvIGhvbGQgaV9tbWFwX3J3c2VtIHdo
aWxlIGNhbGxpbmcgaW52YWxpZGF0ZV9yYW5nZV9zdGFydCgpOgoKIHVubWFwX21hcHBpbmdfcGFn
ZXMKICBpX21tYXBfbG9ja193cml0ZShtYXBwaW5nKTsgLy8gaWUgaV9tbWFwX3J3c2VtCiAgdW5t
YXBfbWFwcGluZ19yYW5nZV90cmVlCiAgIHVubWFwX21hcHBpbmdfcmFuZ2Vfdm1hCiAgICB6YXBf
cGFnZV9yYW5nZV9zaW5nbGUKICAgICBtbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFy
dAoKU28sIGlmIGl0IGlzIHN0aWxsIHRydWUgdGhhdCBpX21tYXBfcndzZW0gaXMgdW5kZXIgZnNf
cmVjbGFpbSB0aGVuCmludmFsaWRhdGVfcmFuZ2Vfc3RhcnQgaXMgKmFsd2F5cyogdW5kZXIgZnNf
cmVjbGFpbSBhbnlob3chICh0aGlzIEkgZG8Kbm90IGtub3cpCgpUaHVzIHdlIHNob3VsZCB1c2Ug
bG9ja2RlcCB0byBmb3JjZSB0aGlzIGFuZCBmaXggYWxsIHRoZSBkcml2ZXJzLgoKLi4gYW5kIGlm
IHdlIGZvcmNlIGZzX3JlY2xhaW0gYWx3YXlzLCBkbyB3ZSBjYXJlIGFib3V0IGJsb2NrYWJsZQph
bnltb3JlPz8KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD82124BD
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 00:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1B18936C;
	Thu,  2 May 2019 22:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1DE8925A;
 Thu,  2 May 2019 22:48:13 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id j9so2311443oie.10;
 Thu, 02 May 2019 15:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/WKHdnz38BeGL2pjuVKVInpoD4DDdnvc5veO1RpWfD0=;
 b=W/FWoFR/P5Lxj6YaGaa196B3Np5jrVx14Zqb9drta6hWv3JGJMYBgg0pJdzxLJkXhT
 00n0gwTl9FMNFKjDiBxkQhRniAfZIUcY2ttEKfGtoiPeVc/33dUH6og/0R2byAvwZjMu
 qEOEr78/INHMvNk6qr/bPJDGIlYRuADF0hgcSg/8oD/g7zTvArheCjv5fLG++AdLcg9T
 C0LVOVlnQSGDJvohVqLvKt77/JVJLCy+xLh/vJT1evjknYd/2MI5nb8/NGbYO4lWANPV
 5Gu7GdHvN5xnWxckJGnZTiYlIhHc/Y2hL9U0HMCxrCqSdddh890AZqo6Hn5lZwa7LcI7
 RzQg==
X-Gm-Message-State: APjAAAWbnNfOmgW/m3aLuuO5nVwrrJTC5Y7TXaQrjH9aaN2Ni2pE3XT8
 RSAaLz8mxjsHATx4y6ApCz5sTRUuT2sEq276EYw=
X-Google-Smtp-Source: APXvYqx956/X+reg4oVrDOUcjV7/RLFZT10w3z+8wYApEAreW5PVj2U3DhgtoypbznWBNzSrhUtmkdshwuUO1i5ipOo=
X-Received: by 2002:aca:d90a:: with SMTP id q10mr4133282oig.65.1556837292174; 
 Thu, 02 May 2019 15:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190501140438.9506-1-brian.welty@intel.com>
 <20190502083433.GP7676@mtr-leonro.mtl.com>
In-Reply-To: <20190502083433.GP7676@mtr-leonro.mtl.com>
From: Kenny Ho <y2kenny@gmail.com>
Date: Thu, 2 May 2019 18:48:00 -0400
Message-ID: <CAOWid-cYknxeTQvP9vQf3-i3Cpux+bs7uBs7_o-YMFjVCo19bg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] cgroup support for GPU devices
To: Leon Romanovsky <leon@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/WKHdnz38BeGL2pjuVKVInpoD4DDdnvc5veO1RpWfD0=;
 b=lKkyAyPK+yQFL7c/rX2h7OTRgVgCfGIA3jxuxf0M3WS5KnZpTp8Mykm0JON9M6qmOF
 30RUqUAUZnZXXZ56qm2hLdvg6D1Psc4W/Y3OoXcZI7QxDQ0zn9C+HqN544+NErubH6Rw
 XJm9/tXR6XQawJT3hvz8sYAAZfKW8NOb+Z1DGTxnr8snyHMop8e80SKJpOuMMnzGi215
 nkeBQ0z5As131KYmogi2xGm1lFCfd+O7ajJgqaIybuACpod0//VhJ13cWDX1xSHC2ZnA
 Rh+r2wlqbLEKsWw9wSjkO4K4Ch3fAorDgZGsOwHCpg084Xzfptn6ptbHxrxct0Pvphjq
 9DRg==
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
Cc: Parav Pandit <parav@mellanox.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Brian Welty <brian.welty@intel.com>,
 cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michal Hocko <mhocko@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-mm@kvack.org, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Li Zefan <lizefan@huawei.com>, Vladimir Davydov <vdavydov.dev@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tejun Heo <tj@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 RDMA mailing list <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBDb3VudCB1cyAoTWVsbGFub3gpIHRvbywgb3VyIFJETUEgZGV2aWNlcyBhcmUgZXhwb3Npbmcg
c3BlY2lhbCBhbmQKPiBsaW1pdGVkIGluIHNpemUgZGV2aWNlIG1lbW9yeSB0byB0aGUgdXNlcnMg
YW5kIHdlIHdvdWxkIGxpa2UgdG8gcHJvdmlkZQo+IGFuIG9wdGlvbiB0byB1c2UgY2dyb3VwIHRv
IGNvbnRyb2wgaXRzIGV4cG9zdXJlLgpEb2Vzbid0IFJETUEgYWxyZWFkeSBoYXMgYSBzZXBhcmF0
ZSBjZ3JvdXA/ICBXaHkgbm90IGltcGxlbWVudCBpdCB0aGVyZT8KCgo+ID4gYW5kIHdpdGggZnV0
dXJlIHdvcmssIHdlIGNvdWxkIGV4dGVuZCB0bzoKPiA+ICogIHRyYWNrIGFuZCBjb250cm9sIHNo
YXJlIG9mIEdQVSB0aW1lIChyZXVzZSBvZiBjcHUvY3B1YWNjdCkKPiA+ICogIGFwcGx5IG1hc2sg
b2YgYWxsb3dlZCBleGVjdXRpb24gZW5naW5lcyAocmV1c2Ugb2YgY3B1c2V0cykKPiA+Cj4gPiBJ
bnN0ZWFkIG9mIGludHJvZHVjaW5nIGEgbmV3IGNncm91cCBzdWJzeXN0ZW0gZm9yIEdQVSBkZXZp
Y2VzLCBhIG5ldwo+ID4gZnJhbWV3b3JrIGlzIHByb3Bvc2VkIHRvIGFsbG93IGRldmljZXMgdG8g
cmVnaXN0ZXIgd2l0aCBleGlzdGluZyBjZ3JvdXAKPiA+IGNvbnRyb2xsZXJzLCB3aGljaCBjcmVh
dGVzIHBlci1kZXZpY2UgY2dyb3VwX3N1YnN5c19zdGF0ZSB3aXRoaW4gdGhlCj4gPiBjZ3JvdXAu
ICBUaGlzIGdpdmVzIGRldmljZSBkcml2ZXJzIHRoZWlyIG93biBwcml2YXRlIGNncm91cCBjb250
cm9scwo+ID4gKHN1Y2ggYXMgbWVtb3J5IGxpbWl0cyBvciBvdGhlciBwYXJhbWV0ZXJzKSB0byBi
ZSBhcHBsaWVkIHRvIGRldmljZQo+ID4gcmVzb3VyY2VzIGluc3RlYWQgb2YgaG9zdCBzeXN0ZW0g
cmVzb3VyY2VzLgo+ID4gRGV2aWNlIGRyaXZlcnMgKEdQVSBvciBvdGhlcikgYXJlIHRoZW4gYWJs
ZSB0byByZXVzZSB0aGUgZXhpc3RpbmcgY2dyb3VwCj4gPiBjb250cm9scywgaW5zdGVhZCBvZiBp
bnZlbnRpbmcgc2ltaWxhciBvbmVzLgo+ID4KPiA+IFBlci1kZXZpY2UgY29udHJvbHMgd291bGQg
YmUgZXhwb3NlZCBpbiBjZ3JvdXAgZmlsZXN5c3RlbSBhczoKPiA+ICAgICBtb3VudC88Y2dyb3Vw
X25hbWU+LzxzdWJzeXNfbmFtZT4uZGV2aWNlcy88ZGV2X25hbWU+LzxzdWJzeXNfZmlsZXM+Cj4g
PiBzdWNoIGFzIChmb3IgZXhhbXBsZSk6Cj4gPiAgICAgbW91bnQvPGNncm91cF9uYW1lPi9tZW1v
cnkuZGV2aWNlcy88ZGV2X25hbWU+L21lbW9yeS5tYXgKPiA+ICAgICBtb3VudC88Y2dyb3VwX25h
bWU+L21lbW9yeS5kZXZpY2VzLzxkZXZfbmFtZT4vbWVtb3J5LmN1cnJlbnQKPiA+ICAgICBtb3Vu
dC88Y2dyb3VwX25hbWU+L2NwdS5kZXZpY2VzLzxkZXZfbmFtZT4vY3B1LnN0YXQKPiA+ICAgICBt
b3VudC88Y2dyb3VwX25hbWU+L2NwdS5kZXZpY2VzLzxkZXZfbmFtZT4vY3B1LndlaWdodAo+ID4K
PiA+IFRoZSBkcm0vaTkxNSBwYXRjaCBpbiB0aGlzIHNlcmllcyBpcyBiYXNlZCBvbiB0b3Agb2Yg
b3RoZXIgUkZDIHdvcmsgWzFdCj4gPiBmb3IgaTkxNSBkZXZpY2UgbWVtb3J5IHN1cHBvcnQuCj4g
Pgo+ID4gQU1EIFsyXSBhbmQgSW50ZWwgWzNdIGhhdmUgcHJvcG9zZWQgcmVsYXRlZCB3b3JrIGlu
IHRoaXMgYXJlYSB3aXRoaW4gdGhlCj4gPiBsYXN0IGZldyB5ZWFycywgbGlzdGVkIGJlbG93IGFz
IHJlZmVyZW5jZS4gIFRoaXMgbmV3IFJGQyByZXVzZXMgZXhpc3RpbmcKPiA+IGNncm91cCBjb250
cm9sbGVycyBhbmQgdGFrZXMgYSBkaWZmZXJlbnQgYXBwcm9hY2ggdGhhbiBwcmlvciB3b3JrLgo+
ID4KPiA+IEZpbmFsbHksIHNvbWUgcG90ZW50aWFsIGRpc2N1c3Npb24gcG9pbnRzIGZvciB0aGlz
IHNlcmllczoKPiA+ICogbWVyZ2UgcHJvcG9zZWQgPHN1YnN5c19uYW1lPi5kZXZpY2VzIGludG8g
YSBzaW5nbGUgZGV2aWNlcyBkaXJlY3Rvcnk/Cj4gPiAqIGFsbG93IGRldmljZXMgdG8gaGF2ZSBt
dWx0aXBsZSByZWdpc3RyYXRpb25zIGZvciBzdWJzZXRzIG9mIHJlc291cmNlcz8KPiA+ICogZG9j
dW1lbnQgYSAnY29tbW9uIGNoYXJnaW5nIHBvbGljeScgZm9yIGRldmljZSBkcml2ZXJzIHRvIGZv
bGxvdz8KPiA+Cj4gPiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmll
cy81NjY4My8KPiA+IFsyXSBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9k
cmktZGV2ZWwvMjAxOC1Ob3ZlbWJlci8xOTcxMDYuaHRtbAo+ID4gWzNdIGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2ludGVsLWdmeC8yMDE4LUphbnVhcnkvMTUzMTU2Lmh0
bWwKPiA+Cj4gPgo+ID4gQnJpYW4gV2VsdHkgKDUpOgo+ID4gICBjZ3JvdXA6IEFkZCBjZ3JvdXBf
c3Vic3lzIHBlci1kZXZpY2UgcmVnaXN0cmF0aW9uIGZyYW1ld29yawo+ID4gICBjZ3JvdXA6IENo
YW5nZSBrZXJuZnNfbm9kZSBmb3IgZGlyZWN0b3JpZXMgdG8gc3RvcmUKPiA+ICAgICBjZ3JvdXBf
c3Vic3lzX3N0YXRlCj4gPiAgIG1lbWNnOiBBZGQgcGVyLWRldmljZSBzdXBwb3J0IHRvIG1lbW9y
eSBjZ3JvdXAgc3Vic3lzdGVtCj4gPiAgIGRybTogQWRkIG1lbW9yeSBjZ3JvdXAgcmVnaXN0cmF0
aW9uIGFuZCBEUklWRVJfQ0dST1VQUyBmZWF0dXJlIGJpdAo+ID4gICBkcm0vaTkxNTogVXNlIG1l
bW9yeSBjZ3JvdXAgZm9yIGVuZm9yY2luZyBkZXZpY2UgbWVtb3J5IGxpbWl0Cj4gPgo+ID4gIGRy
aXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMgICAgICAgICAgICAgICAgICB8ICAxMiArCj4gPiAgZHJp
dmVycy9ncHUvZHJtL2RybV9nZW0uYyAgICAgICAgICAgICAgICAgIHwgICA3ICsKPiA+ICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5jICAgICAgICAgICAgfCAgIDIgKy0KPiA+ICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9tZW1vcnlfcmVnaW9uLmMgfCAgMjQgKy0KPiA+ICBpbmNs
dWRlL2RybS9kcm1fZGV2aWNlLmggICAgICAgICAgICAgICAgICAgfCAgIDMgKwo+ID4gIGluY2x1
ZGUvZHJtL2RybV9kcnYuaCAgICAgICAgICAgICAgICAgICAgICB8ICAgOCArCj4gPiAgaW5jbHVk
ZS9kcm0vZHJtX2dlbS5oICAgICAgICAgICAgICAgICAgICAgIHwgIDExICsKPiA+ICBpbmNsdWRl
L2xpbnV4L2Nncm91cC1kZWZzLmggICAgICAgICAgICAgICAgfCAgMjggKysKPiA+ICBpbmNsdWRl
L2xpbnV4L2Nncm91cC5oICAgICAgICAgICAgICAgICAgICAgfCAgIDMgKwo+ID4gIGluY2x1ZGUv
bGludXgvbWVtY29udHJvbC5oICAgICAgICAgICAgICAgICB8ICAxMCArCj4gPiAga2VybmVsL2Nn
cm91cC9jZ3JvdXAtdjEuYyAgICAgICAgICAgICAgICAgIHwgIDEwICstCj4gPiAga2VybmVsL2Nn
cm91cC9jZ3JvdXAuYyAgICAgICAgICAgICAgICAgICAgIHwgMzEwICsrKysrKysrKysrKysrKysr
Ky0tLQo+ID4gIG1tL21lbWNvbnRyb2wuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDE4
MyArKysrKysrKysrKy0KPiA+ICAxMyBmaWxlcyBjaGFuZ2VkLCA1NTIgaW5zZXJ0aW9ucygrKSwg
NTkgZGVsZXRpb25zKC0pCj4gPgo+ID4gLS0KPiA+IDIuMjEuMAo+ID4KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

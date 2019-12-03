Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC1411241B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 09:01:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE17F6F448;
	Wed,  4 Dec 2019 08:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8A56E0D3
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 18:45:34 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id w23so784557pjd.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 10:45:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bG8Nt6cVodf34zynBURXT0B9txwe3S1q7fxCr2Als+4=;
 b=evp7axMyVCYmEuSZmazQ5A09pg31l4yOHIzwzG6qL0LeaNPh3kmn6/R2SI/OoOz1am
 PjdPDkN4UfQHz/6GLXvaRhah7xoj2oQnMeSf9LzGixv2iTa3HQHWwDno9GVRfmxz12gT
 fJLH3mUAgxljkNcinmoyNKnyi2L+98D2qQ+HYjQvFDO/F5A7Bvkid/VeRzSMDjRd3FzZ
 fsEeR86OW7rFlH2zZbWOg+a10ghc1FmGFJfNAHlmCHkJxfclYLfNy5K5dmy8NZfarHue
 s8TOhHQMvsT16+JKovWpLpltr69qqrBk2dI7B19NiIPufuR7GHv84bhdlZeDxn1EGlt0
 05fA==
X-Gm-Message-State: APjAAAVIvFUCpdJy89zcVtgemOkZk+3l5LUGY5i7y02NoObI38hhp0yd
 zvFhRjVtJ8XdZJeKSqZ53Z3cMkAoDjfo2/eld+JEDg==
X-Google-Smtp-Source: APXvYqyJSYetniu+3O10Y+swpRRlYVv6h/vvB7BpZkKQn3U4GNGfYC5OL6WuMn+ci7f92JAk5XdjkjrWgC9nKuqHGD0=
X-Received: by 2002:a17:902:8ec8:: with SMTP id
 x8mr6052422plo.119.1575398733219; 
 Tue, 03 Dec 2019 10:45:33 -0800 (PST)
MIME-Version: 1.0
References: <20191123195321.41305-1-natechancellor@gmail.com>
 <157453950786.2524.16955749910067219709@skylake-alporthouse-com>
 <CAKwvOdniXqn3xt3-W0Pqi-X1nWjJ2vUVofjCm1O-UPXZ7_4rXw@mail.gmail.com>
 <157538056769.7230.15356495786856166580@skylake-alporthouse-com>
In-Reply-To: <157538056769.7230.15356495786856166580@skylake-alporthouse-com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 3 Dec 2019 10:45:22 -0800
Message-ID: <CAKwvOd=ov789Lixdq8QE+MVXeYyh=W_sODSuj++4T8uF-hpVMw@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Remove tautological compare in eb_relocate_vma
To: Chris Wilson <chris@chris-wilson.co.uk>
X-Mailman-Approved-At: Wed, 04 Dec 2019 08:01:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=bG8Nt6cVodf34zynBURXT0B9txwe3S1q7fxCr2Als+4=;
 b=XNFVfbfC7D0GHt+6f17UiXwk5O1VQiJ9OqACo8IuzMrbOpSouHNZB4OUQfjJ34Xjc7
 ijHp49f03VSRiLfBb6wCJS6WGBk0M+hgYqwBskCc0JbS8dxIy+TnmyPfKu+aTUSflR9G
 mHmeGQzJZZPgeOgdEIMR72fk0f199IwgQ9rlHrtEkKOVdnoiPC82tvtLNzTc7POPrOQ/
 DA5TI2WvOiHU7ExYS7VixDjB/pZ2HnpjLFGnydGmakwQ/RbVUIEEcx10+D9Oq6DgUO6o
 ySTQVf9t6dyl83TCX+3hhU4djYIBm58Pabp+js0rioH8HgwUy5ehHAskL7fHOT/wGHnJ
 SeVg==
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
Cc: Kees Cook <keescook@chromium.org>, intel-gfx@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBEZWMgMywgMjAxOSBhdCA1OjQyIEFNIENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMt
d2lsc29uLmNvLnVrPiB3cm90ZToKPgo+IFF1b3RpbmcgTmljayBEZXNhdWxuaWVycyAoMjAxOS0x
Mi0wMiAxOToxODoyMCkKPiA+IE9uIFNhdCwgTm92IDIzLCAyMDE5IGF0IDEyOjA1IFBNIENocmlz
IFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPiB3cm90ZToKPiA+ID4KPiA+ID4gUXVv
dGluZyBOYXRoYW4gQ2hhbmNlbGxvciAoMjAxOS0xMS0yMyAxOTo1MzoyMikKPiA+ID4gPiAtV3Rh
dXRvbG9naWNhbC1jb21wYXJlIHdhcyByZWNlbnRseSBhZGRlZCB0byAtV2FsbCBpbiBMTFZNLCB3
aGljaAo+ID4gPiA+IGV4cG9zZWQgYW4gaWYgc3RhdGVtZW50IGluIGk5MTUgdGhhdCBpcyBhbHdh
eXMgZmFsc2U6Cj4gPiA+ID4KPiA+ID4gPiAuLi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkx
NV9nZW1fZXhlY2J1ZmZlci5jOjE0ODU6MjI6IHdhcm5pbmc6Cj4gPiA+ID4gcmVzdWx0IG9mIGNv
bXBhcmlzb24gb2YgY29uc3RhbnQgNTc2NDYwNzUyMzAzNDIzNDg3IHdpdGggZXhwcmVzc2lvbiBv
Zgo+ID4gPiA+IHR5cGUgJ3Vuc2lnbmVkIGludCcgaXMgYWx3YXlzIGZhbHNlCj4gPiA+ID4gWy1X
dGF1dG9sb2dpY2FsLWNvbnN0YW50LW91dC1vZi1yYW5nZS1jb21wYXJlXQo+ID4gPiA+ICAgICAg
ICAgaWYgKHVubGlrZWx5KHJlbWFpbiA+IE5fUkVMT0MoVUxPTkdfTUFYKSkpCj4gPiA+ID4gICAg
ICAgICAgICAgfn5+fn5+fn5+fn5+fn5+fl5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ID4gPiA+Cj4g
PiA+ID4gU2luY2UgcmVtYWluIGlzIGFuIHVuc2lnbmVkIGludCwgaXQgY2FuIG5ldmVyIGJlIGxh
cmdlciB0aGFuIFVJTlRfTUFYLAo+ID4gPiA+IHdoaWNoIGlzIGxlc3MgdGhhbiBVTE9OR19NQVgg
LyBzaXplb2Yoc3RydWN0IGRybV9pOTE1X2dlbV9yZWxvY2F0aW9uX2VudHJ5KS4KPiA+ID4gPiBS
ZW1vdmUgdGhpcyBzdGF0ZW1lbnQgdG8gZml4IHRoZSB3YXJuaW5nLgo+ID4gPgo+ID4gPiBUaGUg
Y2hlY2sgc2hvdWxkIHJlbWFpbiBhcyB3ZSBkbyB3YW50IHRvIGRvY3VtZW50IHRoZSBvdmVyZmxv
dwo+ID4gPiBjYWxjdWxhdGlvbiwgYW5kIGl0IHNob3VsZCByZXByZXNlbnQgdGhlIHR5cGVzIHVz
ZWQgLS0gaXQncyBtdWNoIGVhc2llcgo+ID4KPiA+IFdoYXQgZG8geW91IG1lYW4gInJlcHJlc2Vu
dCB0aGUgdHlwZXMgdXNlZD8iICBBcmUgeW91IGNvbmNlcm5lZCB0aGF0Cj4gPiB0aGUgdHlwZSBv
ZiBkcm1faTkxNV9nZW1fZXhlY19vYmplY3QyLT5yZWxvY2F0aW9uX2NvdW50IG1pZ2h0IGNoYW5n
ZQo+ID4gaW4gdGhlIGZ1dHVyZT8KPgo+IFdlIG1heSB3YW50IHRvIGNoYW5nZSB0aGUgcmVzdHJp
Y3Rpb24sIHllcy4KPgo+ID4gPiB0byByZXZpZXcgYSBzdHViIHRoYW4gdHJ5aW5nIHRvIGZpbmQg
YSBtaXNzaW5nIG92ZXJmbG93IGNoZWNrLiBJZiB0aGUKPiA+ID4gb3ZlcmZsb3cgY2Fubm90IGhh
cHBlbiBhcyB0aGUgdHlwZXMgYXJlIHdpZGUgZW5vdWdoLCBubyBwcm9ibGVtLCB0aGUKPiA+ID4g
Y29tcGlsZXIgY2FuIHJlbW92ZSB0aGUga25vd24gZmFsc2UgYnJhbmNoLgo+ID4KPiA+IFdoYXQg
b3ZlcmZsb3cgYXJlIHlvdSB0cnlpbmcgdG8gcHJvdGVjdCBhZ2FpbnN0IGhlcmU/Cj4KPiBUaGVz
ZSB2YWx1ZXMgYXJlIHVuZGVyIHVzZXIgY29udHJvbCwgb3VyIHZhbGlkYXRpb24gc3RlcHMgc2hv
dWxkIGJlCj4gY2xlYXIgYW5kIGVhc3kgdG8gY2hlY2suIElmIHdlIGhhdmUgdGhlIHR5cGVzIHdy
b25nLCBpZiB0aGUgY2hlY2tzIGFyZQo+IHdyb25nLCB3ZSBuZWVkIHRvIGZpeCB0aGVtLiBJZiB0
aGUgY29kZSBpcyByZW1vdmVkIGJlY2F1c2UgaXQgY2FuIGJlCj4gZXZhbHVhdGVkIGJ5IHRoZSBj
b21waWxlciB0byBiZSByZWR1bmRhbnQsIGl0IGlzIG11Y2ggaGFyZGVyIGZvciB1cyB0bwo+IHZl
cmlmeSB0aGF0IHdlIGhhdmUgdHJpZWQgdG8gdmFsaWRhdGUgdXNlciBpbnB1dC4KPgo+ID4gPiBU
YXV0b2xvZ3kgaGVyZSBoYXMgYSBwdXJwb3NlIGZvciBjb252ZXlpbmcgaW5mb3JtYXRpb24gdG8g
dGhlIHJlYWRlci4KPiA+Cj4gPiBXZWxsIGxlYXZpbmcgYSB3YXJuaW5nIHVuYWRkcmVzc2VkIGlz
IGFsc28gbm90IGEgc29sdXRpb24uICBFaXRoZXIKPiA+IHJlcGxhY2UgaXQgd2l0aCBhIGNvbW1l
bnQgb3IgdHVybiBvZmYgdGhlIHdhcm5pbmcgZm9yIHlvdXIgc3ViZGlyLgo+Cj4gTXkgcGVyc29u
YWwgcHJlZmVyZW5jZSB3b3VsZCBiZSB0byB1c2UgYSBidW5jaCBvZiBjZW50cmFsIG1hY3JvcyBm
b3IgdGhlCj4gdmFyaW91cyB0eXBlL2ttYWxsb2Mgb3ZlcmZsb3dzLCBhbmQgaGF2ZSB0aGUgd2Fy
bmluZ3Mgc3VwcHJlc3NlZCB0aGVyZQo+IHNpbmNlIHRoZXkgYXJlIHZlcnkgbXVjaCBhYm91dCBk
b2N1bWVudGluZyB1c2VyIGlucHV0IHZhbGlkYXRpb24uCj4gLUNocmlzCgpJcyBrbWFsbG9jX2Fy
cmF5IHdoYXQgeW91J3JlIGxvb2tpbmcgZm9yPyAgTG9va3MgbGlrZSBpdCBoYXMgdGhlCmBjaGVj
a19tdWxfb3ZlcmZsb3dgIGNhbGwgaW4gaXQuCgotLSAKVGhhbmtzLAp+TmljayBEZXNhdWxuaWVy
cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

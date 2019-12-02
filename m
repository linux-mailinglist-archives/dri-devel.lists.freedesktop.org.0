Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 957B610F972
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 09:05:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EC46E408;
	Tue,  3 Dec 2019 08:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FCD6E250
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 19:18:32 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id b137so139264pga.6
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 11:18:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AG/LZstzo//ptLVf07PatyOsdS+AHHPAwpIXLlE6z3Q=;
 b=shhfn8r4apzFkxssZYtx6VS9/B3zI0M4vkD94lsEbUlheVhpZZNQtmiZp2xcGswoJq
 TA/PHNXsvSaxcEt3UhUBoLQxsr7ntgX7zVNZPlq+gOfmVE1oMZXdDhRgwBH/gTnzk81z
 bd2BrxjygJhG/h8mQjn9VlM5bh5xYS1Fy12ebTx7SSR0BdwmUI4lGKDXtC9X83eaCrXl
 vOeZwHgLMJ3SCsDe09fzXMPv3JkQmBn06kfITp8cH409jgC0JfEh1/Vu6e9E0Sz+3yvQ
 TdMnOlHIpFK06FnjlJQHLZE/iQJVw+XijNFqvBJs7jFkd/QW+FfaprRF4F09ht4Tvk6m
 Wxdw==
X-Gm-Message-State: APjAAAWVjdfMfhaQbw0HQgrpg6BRDTtv3zdFK3KM8E8YnZ0mpC9fYg/n
 N85/X0qI33Uc10hgypcolkigIuj8nQHaMFrrgcwDBg==
X-Google-Smtp-Source: APXvYqx4981BLNDeOn62kzvLoj/j1kEDcJo+0UePcbQi+8VI03sKun8IkhkPLZsWMAv1Pcyofy6UuuetlJSBs1CKAcU=
X-Received: by 2002:a65:64c1:: with SMTP id t1mr677588pgv.263.1575314311159;
 Mon, 02 Dec 2019 11:18:31 -0800 (PST)
MIME-Version: 1.0
References: <20191123195321.41305-1-natechancellor@gmail.com>
 <157453950786.2524.16955749910067219709@skylake-alporthouse-com>
In-Reply-To: <157453950786.2524.16955749910067219709@skylake-alporthouse-com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 2 Dec 2019 11:18:20 -0800
Message-ID: <CAKwvOdniXqn3xt3-W0Pqi-X1nWjJ2vUVofjCm1O-UPXZ7_4rXw@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Remove tautological compare in eb_relocate_vma
To: Chris Wilson <chris@chris-wilson.co.uk>
X-Mailman-Approved-At: Tue, 03 Dec 2019 08:05:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=AG/LZstzo//ptLVf07PatyOsdS+AHHPAwpIXLlE6z3Q=;
 b=ofPd/sJG1S0B0dPuZvEuwVEnta6pLrb2ze2cDFyASH+9cicpvVoSXin1a28KC1uw+8
 A1zEeq6ZSTIb+mv4SqffAInNcaih6mMYQdKn3P1tWDJYo81FPRS1fLZrzho/xgiDm8SC
 YOhQaxeWaQnX+pq28UmTQjVjcOGSrcQztu3QcM0dLbmS4HkmH+6+uaSnhPZ6QyM+Kpuf
 O25gQvWrczJ6AQNj+mOf5ExZdJtaFVULHquVeMHHBeZDHdeLWb9dMIctEZvYFV8oR3cs
 kRT1gazLrRcIoDGasBeKRreFz2tyPPID3Ya/K80xcDHhS1E1QjS4D+HGae5pA+TeVSCn
 E3cA==
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
Cc: intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBOb3YgMjMsIDIwMTkgYXQgMTI6MDUgUE0gQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+IHdyb3RlOgo+Cj4gUXVvdGluZyBOYXRoYW4gQ2hhbmNlbGxvciAoMjAx
OS0xMS0yMyAxOTo1MzoyMikKPiA+IC1XdGF1dG9sb2dpY2FsLWNvbXBhcmUgd2FzIHJlY2VudGx5
IGFkZGVkIHRvIC1XYWxsIGluIExMVk0sIHdoaWNoCj4gPiBleHBvc2VkIGFuIGlmIHN0YXRlbWVu
dCBpbiBpOTE1IHRoYXQgaXMgYWx3YXlzIGZhbHNlOgo+ID4KPiA+IC4uL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyLmM6MTQ4NToyMjogd2FybmluZzoKPiA+IHJl
c3VsdCBvZiBjb21wYXJpc29uIG9mIGNvbnN0YW50IDU3NjQ2MDc1MjMwMzQyMzQ4NyB3aXRoIGV4
cHJlc3Npb24gb2YKPiA+IHR5cGUgJ3Vuc2lnbmVkIGludCcgaXMgYWx3YXlzIGZhbHNlCj4gPiBb
LVd0YXV0b2xvZ2ljYWwtY29uc3RhbnQtb3V0LW9mLXJhbmdlLWNvbXBhcmVdCj4gPiAgICAgICAg
IGlmICh1bmxpa2VseShyZW1haW4gPiBOX1JFTE9DKFVMT05HX01BWCkpKQo+ID4gICAgICAgICAg
ICAgfn5+fn5+fn5+fn5+fn5+fl5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+ID4KPiA+IFNpbmNlIHJl
bWFpbiBpcyBhbiB1bnNpZ25lZCBpbnQsIGl0IGNhbiBuZXZlciBiZSBsYXJnZXIgdGhhbiBVSU5U
X01BWCwKPiA+IHdoaWNoIGlzIGxlc3MgdGhhbiBVTE9OR19NQVggLyBzaXplb2Yoc3RydWN0IGRy
bV9pOTE1X2dlbV9yZWxvY2F0aW9uX2VudHJ5KS4KPiA+IFJlbW92ZSB0aGlzIHN0YXRlbWVudCB0
byBmaXggdGhlIHdhcm5pbmcuCj4KPiBUaGUgY2hlY2sgc2hvdWxkIHJlbWFpbiBhcyB3ZSBkbyB3
YW50IHRvIGRvY3VtZW50IHRoZSBvdmVyZmxvdwo+IGNhbGN1bGF0aW9uLCBhbmQgaXQgc2hvdWxk
IHJlcHJlc2VudCB0aGUgdHlwZXMgdXNlZCAtLSBpdCdzIG11Y2ggZWFzaWVyCgpXaGF0IGRvIHlv
dSBtZWFuICJyZXByZXNlbnQgdGhlIHR5cGVzIHVzZWQ/IiAgQXJlIHlvdSBjb25jZXJuZWQgdGhh
dAp0aGUgdHlwZSBvZiBkcm1faTkxNV9nZW1fZXhlY19vYmplY3QyLT5yZWxvY2F0aW9uX2NvdW50
IG1pZ2h0IGNoYW5nZQppbiB0aGUgZnV0dXJlPwoKPiB0byByZXZpZXcgYSBzdHViIHRoYW4gdHJ5
aW5nIHRvIGZpbmQgYSBtaXNzaW5nIG92ZXJmbG93IGNoZWNrLiBJZiB0aGUKPiBvdmVyZmxvdyBj
YW5ub3QgaGFwcGVuIGFzIHRoZSB0eXBlcyBhcmUgd2lkZSBlbm91Z2gsIG5vIHByb2JsZW0sIHRo
ZQo+IGNvbXBpbGVyIGNhbiByZW1vdmUgdGhlIGtub3duIGZhbHNlIGJyYW5jaC4KCldoYXQgb3Zl
cmZsb3cgYXJlIHlvdSB0cnlpbmcgdG8gcHJvdGVjdCBhZ2FpbnN0IGhlcmU/Cgo+Cj4gVGF1dG9s
b2d5IGhlcmUgaGFzIGEgcHVycG9zZSBmb3IgY29udmV5aW5nIGluZm9ybWF0aW9uIHRvIHRoZSBy
ZWFkZXIuCgpXZWxsIGxlYXZpbmcgYSB3YXJuaW5nIHVuYWRkcmVzc2VkIGlzIGFsc28gbm90IGEg
c29sdXRpb24uICBFaXRoZXIKcmVwbGFjZSBpdCB3aXRoIGEgY29tbWVudCBvciB0dXJuIG9mZiB0
aGUgd2FybmluZyBmb3IgeW91ciBzdWJkaXIuCgpUaGUgd2FybmluZyBoZXJlIGxvb2tzIHZhbGlk
IHRvIG1lOyB5b3UgaGF2ZSBhIGd1YXJkIGZvciBzb21ldGhpbmcKdGhhdCdzIGltcG9zc2libGUu
Ci0tIApUaGFua3MsCn5OaWNrIERlc2F1bG5pZXJzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==

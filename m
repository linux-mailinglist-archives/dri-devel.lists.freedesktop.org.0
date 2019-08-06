Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CCF845CB
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30AE6E64C;
	Wed,  7 Aug 2019 07:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF87B6E41D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 16:32:06 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id g11so7069685uak.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 09:32:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qJV0VVyb7OBSwrj4NQkfWBYcw+e0SGu2TpYvncrxquQ=;
 b=Y/YQytcQvutoDpfDqjb9w1bASXr4QD3X+A8GOPukdJDEkyx+u7BUxaeGOJFnUEEkLO
 9O/za6VIJHeZRMtgYN8tlrK+JvmHefDQJOnbPtX6lP8rPWmDPjnlCOX7gSogUN1WQCy2
 A1a0YVJ3tXDvje+ubCh+xsQ6g737HY3ysKYJMAaIsARALO9lERN1743ym1cG8tCpKTaX
 IBei+y1EqZ5NeiclaE7UnntOEQpACPtvFufs4kPZTS/uWxZ5b9Pe6BMliDeEME+w6acx
 oFB9Jv35rdx31JHasAitRi//aKy8fAPt57KAoVcainEbdZpZb63lYXAIMWgvSHZzU6LL
 4Ekg==
X-Gm-Message-State: APjAAAXrWYjRRCDGzU9zZn/UNRz1Ki/8qRtoOwtaVtqkXycy33vA+gut
 ipm0m72MLR+OMdhNnpfERkay6JlE6w6KZL0RrU5vdQ==
X-Google-Smtp-Source: APXvYqxN7Za8djlBzCs0iQ70yJGGaDd0xjSmac554wXuA65p9UMe7pqTUjduNocumSHig7Qa6Mhlgd8Iif02bjhVezI=
X-Received: by 2002:ab0:66d2:: with SMTP id d18mr1393892uaq.101.1565109125884; 
 Tue, 06 Aug 2019 09:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190805211451.20176-1-robdclark@gmail.com>
 <20190806084821.GA17129@lst.de>
 <CAJs_Fx6eh1w7c=crMoD5XyEOMzP6orLhqUewErE51cPGYmObBQ@mail.gmail.com>
 <20190806143457.GF475@lakrids.cambridge.arm.com>
In-Reply-To: <20190806143457.GF475@lakrids.cambridge.arm.com>
From: Rob Clark <robdclark@chromium.org>
Date: Tue, 6 Aug 2019 09:31:55 -0700
Message-ID: <CAJs_Fx4h6SWGmDTLBnV4nmWUFAs_Ge1inxd-dW9aDKgKqmc1eQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: add cache support for arm64
To: Mark Rutland <mark.rutland@arm.com>
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=qJV0VVyb7OBSwrj4NQkfWBYcw+e0SGu2TpYvncrxquQ=;
 b=PaNovIOOce5SiqO4ZfKl84Pa4yv0mSqVy5C30RPobTjNSM7clsyNQbQ/vhelfWggU9
 NgsFUrCfnnyuoAdH13iul7qyQW+rfYTpPfBbokbf4T3tjfWMbJTP7PDBLdM2atX1U17L
 kqJ0ZreL5023LO6c/T/0E/lD7i0AsyjbuCbI0=
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
Cc: Sean Paul <sean@poorly.run>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgNiwgMjAxOSBhdCA3OjM1IEFNIE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5k
QGFybS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDc6MTE6NDFBTSAt
MDcwMCwgUm9iIENsYXJrIHdyb3RlOgo+ID4gT24gVHVlLCBBdWcgNiwgMjAxOSBhdCAxOjQ4IEFN
IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPiB3cm90ZToKPiA+ID4KPiA+ID4gVGhpcyBn
b2VzIGluIHRoZSB3cm9uZyBkaXJlY3Rpb24uICBkcm1fY2ZsdXNoXyogYXJlIGEgYmFkIEFQSSB3
ZSBuZWVkIHRvCj4gPiA+IGdldCByaWQgb2YsIG5vdCBhZGQgdXNlIG9mIGl0LiAgVGhlIHJlYXNv
biBmb3IgdGhhdCBpcyB0d28tZm9sZDoKPiA+ID4KPiA+ID4gIGEpIGl0IGRvZXNuJ3QgYWRkcmVz
cyBob3cgY2FjaGUgbWFpbnRhaW5jZSBhY3R1YWxseSB3b3JrcyBpbiBtb3N0Cj4gPiA+ICAgICBw
bGF0Zm9ybXMuICBXaGVuIHRhbGtpbmcgYWJvdXQgYSBjYWNoZSB3ZSB0aHJlZSBmdW5kYW1lbnRh
bCBvcGVyYXRpb25zOgo+ID4gPgo+ID4gPiAgICAgICAgIDEpIHdyaXRlIGJhY2sgLSB0aGlzIHdy
aXRlcyB0aGUgY29udGVudCBvZiB0aGUgY2FjaGUgYmFjayB0byB0aGUKPiA+ID4gICAgICAgICAg
ICBiYWNraW5nIG1lbW9yeQo+ID4gPiAgICAgICAgIDIpIGludmFsaWRhdGUgLSB0aGlzIHJlbW92
ZSB0aGUgY29udGVudCBvZiB0aGUgY2FjaGUKPiA+ID4gICAgICAgICAzKSB3cml0ZSBiYWNrICsg
aW52YWxpZGF0ZSAtIGRvIGJvdGggb2YgdGhlIGFib3ZlCj4gPgo+ID4gQWdyZWVkIHRoYXQgZHJt
X2NmbHVzaF8qIGlzbid0IGEgZ3JlYXQgQVBJLiAgSW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UKPiA+
IChJSVVDKSwgSSBuZWVkIHdiK2ludiBzbyB0aGF0IHRoZXJlIGFyZW4ndCBkaXJ0eSBjYWNoZSBs
aW5lcyB0aGF0IGRyb3AKPiA+IG91dCB0byBtZW1vcnkgbGF0ZXIsIGFuZCBzbyB0aGF0IEkgZG9u
J3QgZ2V0IGEgY2FjaGUgaGl0IG9uCj4gPiB1bmNhY2hlZC93YyBtbWFwJ2luZy4KPgo+IElzIHRo
ZXJlIGEgY2FjaGVhYmxlIGFsaWFzIGx5aW5nIGFyb3VuZCAoZS5nLiB0aGUgbGluZWFyIG1hcCks
IG9yIGFyZQo+IHRoZXNlIGFkZHJlc3NlcyBvbmx5IG1hcHBlZCB1bmNhY2hlZC93Yz8KPgo+IElm
IHRoZXJlJ3MgYSBjYWNoZWFibGUgYWxpYXMsIHBlcmZvcm1pbmcgYW4gaW52YWxpZGF0ZSBpc24n
dCBzdWZmaWNpZW50LAo+IHNpbmNlIGEgQ1BVIGNhbiBhbGxvY2F0ZSBhIG5ldyAoY2xlYW4pIGVu
dHJ5IGF0IGFueSBwb2ludCBpbiB0aW1lIChlLmcuCj4gYXMgYSByZXN1bHQgb2YgcHJlZmV0Y2hp
bmcgb3IgYXJiaXRyYXJ5IHNwZWN1bGF0aW9uKS4KCkkgKmJlbGlldmUqIHRoYXQgdGhlcmUgYXJl
IG5vdCBhbGlhcyBtYXBwaW5ncyAodGhhdCBJIGRvbid0IGNvbnRyb2wKbXlzZWxmKSBmb3IgcGFn
ZXMgY29taW5nIGZyb20Kc2htZW1fZmlsZV9zZXR1cCgpL3NobWVtX3JlYWRfbWFwcGluZ19wYWdl
KCkuLiAgZGlnZ2luZyBhcm91bmQgYXQgd2hhdApkbWFfc3luY19zZ18qIGRvZXMgdW5kZXIgdGhl
IGhvb2QsIGl0IGxvb2tzIGxpa2UgaXQgaXMganVzdAphcmNoX3N5bmNfZG1hX2Zvcl9jcHUvZGV2
aWNlKCksIHNvIEkgZ3Vlc3MgdGhhdCBzaG91bGQgYmUgc3VmZmljaWVudApmb3Igd2hhdCBJIG5l
ZWQuCgpUaGVyZSBhcmUgYSBmZXcgYnVmZmVycyB0aGF0IEkgdm1hcCBmb3IgdXNlIG9uIGtlcm5l
bCBzaWRlLCBidXQgbGlrZQp0aGUgdXNlcnNwYWNlIG1tYXAncywgdGhlIHZtYXBzIGFyZSBhbHNv
IHdyaXRlY29tYmluZS4KCkJSLAotUgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A231F31A050
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 15:09:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438516E5CA;
	Fri, 12 Feb 2021 14:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F866E5C1;
 Fri, 12 Feb 2021 14:09:23 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id z3so4855367vsn.9;
 Fri, 12 Feb 2021 06:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mGUEM8BkIgjUi3SKnHZuM7SaerLEeBlJ+h2BpANQXuQ=;
 b=tT++vyICTpA35K1XTNsUAg+swzDOMB9wHNUBqMN0s40RY7O6i+dGqR757jXFkttcG8
 Nh3EsNsBSyRUMLlsbSECySlXLkNgYWSlvl0P0i3hCBGnO8OP5H6ICL8QNHYB0Y08liJX
 stuXqWRcrGM5zfJ0jig3Aw3fyKY0MFmNs7Rg8V05ezn0VpRVpdm0scb9ZH0vwi7TkZ0e
 4eXJKfHz/a86PfrgJKI2GcpIGd0NhKzw2GuyGcsvJIOVY1iH7tO7srgw7mlXCstFyoJi
 1KDntNsVs3l2Ven6KMZSBbLmzR0e2YAwYszVUZE4qZT5g/qBrB9KhfCnX1OOxQQFC0ac
 4T3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mGUEM8BkIgjUi3SKnHZuM7SaerLEeBlJ+h2BpANQXuQ=;
 b=X0Hi1o+Be2g29PPzYhUV5kvEsEQVJM62fDbTUShSZ2VKvUm4m+lXBq20gL/lDK0Tcz
 uwcinlsVieF4ixeTL7wQ6fjCEsRYUHahnE3tvdjx9d3UWeP/IC4+nl2mTjbO9XjGzPMr
 uwKxSGrJn4W+pX5Vl3+GVbjExpfMFBgEqFQvYhbz2PVKDHeH2AmHn3/u3JlcklE2LhIX
 PBObrndp3otg+jMm0BU1bpo9BCzcIT4d2N22KQyH5kGbPtlEEVz3YYyO1KhGlNbNvkpT
 kBHvi8WS97XJoY2GB2fJI6UNBego5kGO7yRQ4rMYlFoeGDC4RZOkk9NQD6tYELS7hIkS
 9wuw==
X-Gm-Message-State: AOAM531JynuZ9dQhukA4EokhwUvWv33ioh7e/MFXl1/DHZ0QxOIAxDO5
 xRG82qWgbZwriDKGBliAmCldjc4WrOPXV0ZlbwY=
X-Google-Smtp-Source: ABdhPJzYPikYFqTmSgbjd45vsc7zqYpXlE1kFNbWMlv5LAZLJ1P/Ly0qtWligVBnGVuhCT90UJ5RIFuiYQc8pU0aOv0=
X-Received: by 2002:a67:cd18:: with SMTP id u24mr1342241vsl.19.1613138962980; 
 Fri, 12 Feb 2021 06:09:22 -0800 (PST)
MIME-Version: 1.0
References: <20210205163752.11932-1-chris@chris-wilson.co.uk>
 <20210205220012.1983-1-chris@chris-wilson.co.uk>
 <CACvgo52u1ASWXOuWuDwoXvbZhoq+RHn_GTxD5y9k+kO_dzmT7w@mail.gmail.com>
 <3a2316b6-27a9-d56a-b488-ac15a402a0d2@daenzer.net>
In-Reply-To: <3a2316b6-27a9-d56a-b488-ac15a402a0d2@daenzer.net>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 12 Feb 2021 14:09:11 +0000
Message-ID: <CACvgo53tAe56fqpwmEpEvToWCqd=7bWs1DUv6aZM9JuPz7dQXg@mail.gmail.com>
Subject: Re: [PATCH v3] kcmp: Support selection of SYS_kcmp without
 CHECKPOINT_RESTORE
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
Cc: Will Drewry <wad@chromium.org>, Kees Cook <keescook@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Cyrill Gorcunov <gorcunov@gmail.com>,
 "# 3.13+" <stable@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Andy Lutomirski <luto@amacapital.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxMiBGZWIgMjAyMSBhdCAxNDowMSwgTWljaGVsIETDpG56ZXIgPG1pY2hlbEBkYWVu
emVyLm5ldD4gd3JvdGU6Cj4KPiBPbiAyMDIxLTAyLTEyIDE6NTcgcC5tLiwgRW1pbCBWZWxpa292
IHdyb3RlOgo+ID4gT24gRnJpLCA1IEZlYiAyMDIxIGF0IDIyOjAxLCBDaHJpcyBXaWxzb24gPGNo
cmlzQGNocmlzLXdpbHNvbi5jby51az4gd3JvdGU6Cj4gPj4KPiA+PiBVc2Vyc3BhY2UgaGFzIGRp
c2NvdmVyZWQgdGhlIGZ1bmN0aW9uYWxpdHkgb2ZmZXJlZCBieSBTWVNfa2NtcCBhbmQgaGFzCj4g
Pj4gc3RhcnRlZCB0byBkZXBlbmQgdXBvbiBpdC4gSW4gcGFydGljdWxhciwgTWVzYSB1c2VzIFNZ
U19rY21wIGZvcgo+ID4+IG9zX3NhbWVfZmlsZV9kZXNjcmlwdGlvbigpIGluIG9yZGVyIHRvIGlk
ZW50aWZ5IHdoZW4gdHdvIGZkIChlLmcuIGRldmljZQo+ID4+IG9yIGRtYWJ1ZikKPiA+Cj4gPiBB
cyB5b3UgcmlnaHRmdWxseSBwb2ludCBvdXQsIFNZU19rY21wIGlzIGEgYml0IG9mIGEgdHdvIGVk
Z2VkIHN3b3JkLgo+ID4gV2hpbGUgeW91IG1lbnRpb24gdGhlIENPTkZJRyBpc3N1ZSwgdGhlcmUg
aXMgYWxzbyBhIHBvcnRhYmlsaXR5IGFzcGVjdAo+ID4gKG1lc2EgcnVucyBvbiBtb3JlIHRoYW4g
anVzdCBsaW51eCkgYW5kIGFzIHdlbGwgYXMgc2FuZGJveCBmaWx0ZXJpbmcKPiA+IG9mIHRoZSBl
eHRyYSBzeXNjYWxsLgo+ID4KPiA+IExhc3QgdGltZSBJIGxvb2tlZCwgdGhlIGxhdHRlciB3YXMg
c3RpbGwgYW4gaXNzdWUgYW5kIG1lc2Egd2FzIHVzaW5nCj4gPiBTWVNfa2NtcCB0byBjb21wYXJl
IGRldmljZSBub2RlIGZkcy4KPiA+IEEgZmFyIHNob3J0ZXIgYW5kIG1vcmUgcG9ydGFibGUgc29s
dXRpb24gaXMgcG9zc2libGUsIHNvIGxldCBtZQo+ID4gcHJlcGFyZSBhIE1lc2EgcGF0Y2guCj4K
PiBNYWtlIHN1cmUgdG8gcmVhZCBteSBjb21tZW50cyBvbgo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVk
ZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9tZXJnZV9yZXF1ZXN0cy82ODgxIGZpcnN0LiA6KQo+Ck11
Y2ggYXBwcmVjaWF0ZWQuIEkgbWlnaHQgaGF2ZSBiZWVuICJzbGlnaHRseSIgb2ZmIC0gcGFyZG9u
IGZvciB0aGUgbm9pc2Ugby8KCi1FbWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=

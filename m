Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7C92CC443
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 18:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0026EA5E;
	Wed,  2 Dec 2020 17:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA8D6EA5E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 17:52:16 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id b62so2445431otc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Dec 2020 09:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ub8cvY3qgnScNwJepLWbSZHUuE+KWCIwpEaiHVULiDk=;
 b=YYhhOq5rM11r/DYVxE+GM0kf8PnGMhv17Z/znUSeHBB4osEZriQSZV45RzcvS6eqEn
 of/mWynxxW2a7mtavqCqQ5XqTuS8ZWsuNSOM78rCIC3k9lzfLiIHnl1x0nmSG5ZbUsy0
 KAVTIYxALPO2r8K6Mw35t1yDupbKAHt5sdhO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ub8cvY3qgnScNwJepLWbSZHUuE+KWCIwpEaiHVULiDk=;
 b=dHf4ZgIh0S9CehyO7bdaLKUMF171GscXjMQcQ3N5tIro3w/o2GCFvV5TmMTsSh4QeO
 Jp1qlaYbcnEsBlUBV9TE5AU0pCYAmaarfv4iuJeHzDKk5fb1fg2wd1Ay6w1lh0DOFX/I
 nrblHN3+ElEceuOwqIk+qt4+ZZ3cWrebaqdsrKJPaPUBGlIlOukQG3uwpVO+NCzP9rls
 DJMi4mixIF5DSD00YZqT8HfRwkLpdcYGBAz/u0pURhF9Fa0cgVYy7uTkorIBDsA1hS80
 6Q9dQ6yHCfB9kPjzau8kjtmMb+1lpaZ78RfvsIe6hvX5/R3/mLlvcItjumMlcUm7Pd1j
 JJYA==
X-Gm-Message-State: AOAM5314L6Ph2Kyk288GddWq42rRMLUFBouxZ6ufFc8KA+I+bgC/JY7w
 xQ4HMMsQA4Xxa5mDeMq8J6DuUqH2jqOnsRzAUQfw8A==
X-Google-Smtp-Source: ABdhPJxurEjYCrkjAS5zpbushlqwhl+1dnUfia/FFKtk2OK04p/DGX12blqcAxKbH8XK0kE8WFAQdoiEcp2DBTPmG+w=
X-Received: by 2002:a05:6830:12d5:: with SMTP id
 a21mr2757816otq.281.1606931535626; 
 Wed, 02 Dec 2020 09:52:15 -0800 (PST)
MIME-Version: 1.0
References: <20201130125200.10416-1-tzimmermann@suse.de>
 <alpine.LRH.2.02.2011300843270.29199@file01.intranet.prod.int.rdu2.redhat.com>
 <20201130154147.GT401619@phenom.ffwll.local>
 <alpine.LRH.2.02.2011301241470.21432@file01.intranet.prod.int.rdu2.redhat.com>
 <ac639546-d97e-b197-8998-180b0535fae2@suse.de>
 <alpine.LRH.2.02.2012010615080.1371@file01.intranet.prod.int.rdu2.redhat.com>
 <9e7cad29-a9c0-2e02-04a9-3149d7e15838@suse.de>
In-Reply-To: <9e7cad29-a9c0-2e02-04a9-3149d7e15838@suse.de>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 2 Dec 2020 18:52:04 +0100
Message-ID: <CAKMK7uF+uu3taQL-FPXymvnVhKyWWtNy9Z2xes=+j-B+BHaTgA@mail.gmail.com>
Subject: Re: [PATCH] fbdev: Remove udlfb driver
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Bernie Thompson <bernie@plugable.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mikulas Patocka <mpatocka@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBEZWMgMiwgMjAyMCBhdCA4OjU1IEFNIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPiB3cm90ZToKPgo+IEhpCj4KPiBBbSAwMS4xMi4yMCB1bSAxMjoyMCBzY2hy
aWViIE1pa3VsYXMgUGF0b2NrYToKPiA+Cj4gPgo+ID4gT24gVHVlLCAxIERlYyAyMDIwLCBUaG9t
YXMgWmltbWVybWFubiB3cm90ZToKPiA+Cj4gPj4gSGkKPiA+Pgo+ID4+IEFtIDMwLjExLjIwIHVt
IDE5OjM5IHNjaHJpZWIgTWlrdWxhcyBQYXRvY2thOgo+ID4+Pgo+ID4+Pgo+ID4+PiBPbiBNb24s
IDMwIE5vdiAyMDIwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4+Pgo+ID4+Pj4gT24gTW9uLCBO
b3YgMzAsIDIwMjAgYXQgMDk6MzE6MTVBTSAtMDUwMCwgTWlrdWxhcyBQYXRvY2thIHdyb3RlOgo+
ID4+Pj4+Cj4gPj4+Pj4gVGhlIGZyYW1lYnVmZmVyIGRyaXZlciBzdXBwb3J0cyBwcm9ncmFtcyBy
dW5uaW5nIGZ1bGwtc2NyZWVuIGRpcmVjdGx5IG9uCj4gPj4+Pj4gdGhlIGZyYW1lYnVmZmVyIGNv
bnNvbGUsIHN1Y2ggYXMgd2ViIGJyb3dzZXIgImxpbmtzIC1nIiwgaW1hZ2Ugdmlld2VyCj4gPj4+
Pj4gImZiaSIsIHBvc3RzY3JpcHQrcGRmIHZpZXdlciAiZmJncyIsIFpYIFNwZWN0cnVtIGVtdWxh
dG9yICJmdXNlLXNkbCIsCj4gPj4+Pj4gbW92aWUgcGxheWVyICJtcGxheWVyIC12byBmYmRldiIu
IFRoZSBEUk0gZHJpdmVyIGRvZXNuJ3QgcnVuIHRoZW0uCj4gPj4+Pgo+ID4+Pj4gSG0gdGhpcyBz
aG91bGQgaW4gZ2VuZXJhbCB3b3JrIG9uIGRybSBkcml2ZXJzLiBXaXRob3V0IHRoYXQgaXQncyBj
bGVhciB0aGUKPiA+Pj4+IHN3aXRjaC1vdmVyIGlzbid0IHJlYWxseSByZWFkeSB5ZXQuCj4gPj4+
Cj4gPj4+IEkgZml4ZWQgaXQgd2l0aCB0aGlzIHBhdGNoIHR3byB5ZWFycyBhZ286Cj4gPj4+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE4LUp1bmUv
MTc5MDIzLmh0bWwKPiA+Pj4KPiA+Pj4gQnV0IHRoZSBwYXRjaCBuZXZlciB3ZW50IHRocm91Z2gg
YW5kIHRoZSBmYl9kZWZpbyBmZWF0dXJlIHdhcyByZW1vdmVkIGluCj4gPj4+IHRoZSBrZXJuZWwg
NS42IChjb21taXQgZDBjNGZjNWE0ODE0ZTQzMWMxNTI3MjkzNWM4ZGM5NzNjMTgwNzNhYSkuCj4g
Pj4+Cj4gPj4+Cj4gPj4+IFdpdGhvdXQgZmJfZGVmaW8sIHRoZSBvbmx5IG90aGVyIHBvc3NpYmls
aXR5IGhvdyB0byB1cGRhdGUgdGhlIHNjcmVlbiBpcwo+ID4+PiB0aGUgaW9jdGwgRFJNX0lPQ1RM
X01PREVfRElSVFlGQi4gQnV0IHRoaXMgaW9jdGwgcmVxdWlyZXMgbWFzdGVyIG1vZGUsIHNvCj4g
Pj4+IHVzZXIgcHJvZ3JhbXMgbGlrZSAibGlua3MgLWciIGNhbid0IGlzc3VlIGl0Lgo+ID4+Cj4g
Pj4gVGhhdCdzIGNvbmZ1c2luZy4gRElSVFlGQiBpcyBvbmx5IGZvciBEUk0uCj4gPgo+ID4gWWVz
LCB5b3UncmUgcmlnaHQuCj4gPgo+ID4+IEFuZCB3aHkgY2FuIGxpbmtzIG5vdCBydW4gYXMgRFJN
IG1hc3RlciBtb2RlPyBJZiBpdCByZW5kZXJzIHRvIHRoZSB0ZXJtaW5hbCwKPiA+PiBpdCBzaG91
bGQgYWN0IGxpa2UgYSBjb21wb3Nlci4gSW4gdGhhdCBjYXNlIGl0IGFsbW9zdCBjZXJ0YWlubHkg
d2FudHMgbWFzdGVyCj4gPj4gc3RhdHVzLgo+ID4+Cj4gPj4gQmVzdCByZWdhcmRzCj4gPj4gVGhv
bWFzCj4gPgo+ID4gSG93IGNhbiBhIHVzZXJzcGFjZSBwcm9ncmFtIGFjcXVpcmUgbWFzdGVyIG1v
ZGUgd2l0aG91dCBiZWluZyBzdWlkPwo+Cj4gRm9yIG15IHVuZGVyc3RhbmRpbmcsIHRoZXJlJ3Mg
bm8gZWFzeSBzb2x1dGlvbiB0byB0aGF0LiA6LwoKSWYgeW91J3JlIGFic29sdXRlbHkgdGhlIG9u
bHkgdGhpbmcgcnVubmluZywgdGhlIGZpcnN0IG9uZSB0byBvcGVuIHRoZQpjYXJkKiBub2RlIHdp
bnMuIEJ1dCB1c3VhbGx5IHlvdSBoYXZlIHNvbWV0aGluZyBsaWtlIGxvZ2luZCBtYW5hZ2luZwp0
aGlzIGZvciB5b3UgKGZvciB2dCBzd2l0Y2hpbmcpLCBzaW5jZSBhZC1ob2MgdGhpcyBpcyBhIHZl
cnkgZnJhZ2lsZQpzY2hlbWUuCgpJJ20gbm90IGV4YWN0bHkgc3VyZSBob3cgbG9naW5kIGdpdmVz
IHlvdSBhbiBhbHJlYWR5IG9wZW5lZCBkcm0gZGV2aWNlCmluIG1hc3RlciBtb2RlLCB0aGF0J3Mg
YSBiaXQgdHJpY2t5LiBXaXRob3V0IGVpdGhlciBiZWluZyBzdWlkIHJvb3Qgb3IKcGFydGljaXBh
dGluZyBpbiB0aGUgbG9naW5kIHNjaGVtZSB5b3Ugd29uJ3QgYmUgYWJsZSB0byB2dCBzd2l0Y2gK
dGhvdWdoLgoKQnV0IGJhcmUgbWV0YWwga21zIHVzYWdlIHNob3VsZCB3b3JrIEkgYXMtaXMuCi1E
YW5pZWwKCj4KPiBJIGd1ZXNzIHdlIChEUk0gZGV2cykgaGF2ZSB0byB0cmVhdCBmYmRldiBhcyB0
aGUgc29sdXRpb24gZm9yIHVzZSBjYXNlcwo+IHN1Y2ggYXMgb3Vycy4KPgo+IEZvciB0aGUgdW5w
bHVnIGlzc3VlLCBJJ2xsIHRyeSB0byByZXByb2R1Y2UgYW5kIGZpeCBpdC4KPgo+IEZvciB0aGUg
cGVyZm9ybWFuY2UgcHJvYmxlbXMsIHdlIG1pZ2h0IGJlIGFibGUgdG8gc3F1ZWV6ZSBhIGZldyBt
b3JlCj4gY3ljbGVzIG91dCBvZiBpdC4KPgo+IEJlc3QgcmVnYXJkcwo+IFRob21hcwo+Cj4gPgo+
ID4gSXMgdGhlcmUgc29tZSAiSGVsbG8gV29ybGQhIiBwcm9ncmFtIHRoYXQgc2hvd3MgaG93IHRv
IHVzZSBEUk0/IEknbSBub3QgYW4KPiA+IGV4cGVydCBpbiBEUk0sIGJ1dCBpZiB0aGVyZSB3ZXJl
IHNvbWUgdHV0b3JpYWwrZG9jdW1lbnRhdGlvbiwgSSBjb3VsZAo+ID4gY29uc2lkZXIgcG9ydGlu
ZyAibGlua3MiIHRvIGl0Lgo+ID4KPiA+IE1pa3VsYXMKPiA+Cj4KPiAtLQo+IFRob21hcyBaaW1t
ZXJtYW5uCj4gR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcgo+IFNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSAo+IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFu
eQo+IChIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykKPiBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXgg
SW1lbmTDtnJmZmVyCj4KCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50
ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

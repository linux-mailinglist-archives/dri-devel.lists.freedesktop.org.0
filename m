Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A48FB218A20
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 16:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41EA6E266;
	Wed,  8 Jul 2020 14:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19F76E266
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 14:26:54 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id x2so1706470oog.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jul 2020 07:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2RJakDIxr1NcxCIZPrNPmdC+2e0+8SUuhQEqWHrFr9g=;
 b=g1GlkuCq9BzVc87SNITjeOeGD95PZm96sueV+S9abWa1KYxcncdW1NCYjvtJ0VJNf1
 vUI6wWhAPHjg+s6DA0bX6/ipLxFy2n3x6+SxFmZnLnZzgipo7ZKsEmKKOuUsrP/3Kj/n
 liyoLrltrNkHY3s43xMO8D/WG2Gfr5E6LnTp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2RJakDIxr1NcxCIZPrNPmdC+2e0+8SUuhQEqWHrFr9g=;
 b=LzltJ5wMs6r013iYZv531gdGDfE/EIQZ4RxOes6LYDbvX40vo2+z9unRTP/4faqOMr
 VOKrGg70qfxpqrXNAP6KYG7s72G7OJIFP2eIJ2fZGHvBGZKG4z05ZQDMiY13vbeouwI8
 n2jsEcTz1HaTClO0A5k7R5+vdmfJhoB8HMneMu3We62jBVegJOYW24feUaF5jaRG5zW9
 bpemo/UAqhcfy7LE1D4N63jo2mwGwGmGB9vuif7MLvLQVKqU6iBzvMNyavolF/55rjt5
 Y55qD0a+c4imRXz7oVH0qspmvquu2tqWaTSxGNtrZhWMeBfbhik4IYDMmPPp1HuP0rNi
 C+iw==
X-Gm-Message-State: AOAM531m3+4KokHcxRlJkHzlhjpE0liIqIBVcyRUdn6UjXth/68e38Ns
 AAcaYZwDNgfcYjA17we3bgomSGVArqxDrf7TlRuiqg==
X-Google-Smtp-Source: ABdhPJy4SNsMJS0zk8bsbw8QWeEq3IP3fuNE6PWr0LcoV5Konzoiy0evbb6ScOlj4kNVfPsUP3c+ELKd5/rfiSqOxSU=
X-Received: by 2002:a4a:b6c5:: with SMTP id w5mr16697473ooo.89.1594218414016; 
 Wed, 08 Jul 2020 07:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.20.2007081246050.12041@whs-18.cs.helsinki.fi>
 <f2b36a2e-baf7-ea23-fdb5-bfb7c54c0f4f@suse.de>
 <alpine.DEB.2.20.2007081638020.12041@whs-18.cs.helsinki.fi>
 <930a059f-ce19-f479-3345-0bc8c3d27518@suse.de>
In-Reply-To: <930a059f-ce19-f479-3345-0bc8c3d27518@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 8 Jul 2020 16:26:42 +0200
Message-ID: <CAKMK7uEuEaJmzooodx-wZgOK3rPT_r74dZic+UWGwT-GrE-Uww@mail.gmail.com>
Subject: Re: drm/ast something ate high-res modes (5.3->5.6 regression)
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
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@cs.helsinki.fi>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgOCwgMjAyMCBhdCA0OjIyIFBNIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPiB3cm90ZToKPgo+IEhpCj4KPiBBbSAwOC4wNy4yMCB1bSAxNTo0NiBzY2hy
aWViIElscG8gSsOkcnZpbmVuOgo+ID4gT24gV2VkLCA4IEp1bCAyMDIwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToKPiA+Cj4gPj4gSGkKPiA+Pgo+ID4+IEFtIDA4LjA3LjIwIHVtIDEyOjA1IHNj
aHJpZWIgSWxwbyBKw6RydmluZW46Cj4gPj4+IEhpLAo+ID4+Pgo+ID4+PiBBZnRlciB1cGdyYWRp
bmcga2VybmVsIGZyb20gNS4zIHNlcmllcyB0byA1LjYuMTYgc29tZXRoaW5nIHNlZW1zIHRvCj4g
Pj4+IHByZXZlbnQgbWUgZnJvbSBhY2hpZXZpbmcgaGlnaCByZXNvbHV0aW9ucyB3aXRoIHRoZSBh
c3QgZHJpdmVyLgo+ID4+Cj4gPj4gVGhhbmtzIGZvciByZXBvcnRpbmcuIEl0J3Mgbm90IGEgYnVn
LCBidXQgYSBzaWRlIGVmZmVjdCBvZiBhdG9taWMKPiA+PiBtb2Rlc2V0dGluZy4KPiA+Pgo+ID4+
IER1cmluZyBwYWdlZmxpcHMsIHRoZSBvbGQgY29kZSB1c2VkIHRvIGtpY2sgb3V0IHRoZSBjdXJy
ZW50bHkgZGlzcGxheWVkCj4gPj4gZnJhbWVidWZmZXIgYW5kIHRoZW4gbG9hZCBpbiB0aGUgbmV3
IG9uZS4gSWYgdGhhdCBmYWlsZWQsIHRoZSBkaXNwbGF5Cj4gPj4gd2VudCBnYXJiYWdlLgo+ID4+
Cj4gPj4gSW4gdjUuNi1yYzEsIHdlIG1lcmdlZCBhdG9taWMgbW9kZXNldHRpbmcgZm9yIGFzdC4g
VGhpcyBtZWFucyB0aGF0Cj4gPj4gc2NyZWVuIHVwZGF0ZXMgYXJlIG1vcmUgcmVsaWFibGUsIGJ1
dCB3ZSBoYXZlIHRvIG92ZXItY29tbWl0IHJlc291cmNlcy4KPiA+PiBTcGVjaWZpY2FsbHksIHdl
IGhhdmUgdG8gcmVzZXJ2ZSBzcGFjZSBmb3IgdHdvIGJ1ZmZlcnMgaW4gdmlkZW8gbWVtb3J5Cj4g
Pj4gd2hpbGUgYSBwYWdlZmxpcCBoYXBwZW5zLiAxOTIweDEyMDBAMzIgYXJlIH45TWlCIG9mIGZy
YW1lYnVmZmVyIG1lbW9yeS4KPiA+PiBJZiB5b3VyIGRldmljZSBoYXMgMTYgTWlCIG9mIFZSQU0s
IHRoZXJlJ3Mgbm8gc3BhY2UgbGVmdCBmb3IgdGhlIHNlY29uZAo+ID4+IGZyYW1lYnVmZmVyLiBI
ZW5jZSwgdGhlIHJlc29sdXRpb24gaXMgbm8gbG9uZ2VyIHN1cHBvcnRlZC4KPiA+Pgo+ID4+IE9u
IHRoZSBwb3NpdGl2ZSBzaWRlLCB5b3UgY2FuIG5vdyB1c2UgV2F5bGFuZCBjb21wb3NpdG9ycyB3
aXRoIGFzdC4KPiA+PiBBdG9taWMgbW9kZXNldHRpbmcgYWRkcyB0aGUgbmVjZXNzYXJ5IGludGVy
ZmFjZXMuCj4gPgo+ID4gT2ssIHRoYW5rcyBmb3IgdGhlIGluZm8gYWx0aG91Z2ggaXQncyBxdWl0
ZSBkaXNhcHBvaW50aW5nIChub3QgdGhlIGZpcnN0Cj4gPiB0aW1lIHRvIGxvc2UgZmVhdHVyZXMg
d2l0aCBrbXMsIG1pZ3JhdGluZyB0byBpdCBtYWRlIG1lIHRvIGxvc2UgZHBtcykgOy0pLgoKa21z
IHN0aWxsIGhhcyBkcG1zLCBub3Qgc3VyZSB3aGF0IHlvdSBtZWFuIGhlcmU/IE1heWJlIHNvbWUg
ZHJpdmVyCmRvZXNuJ3QgaW1wbGVtZW50IGl0LgoKPiA+IEFzIGl0J3MgcXVpdGUgYW5ub3lpbmcg
dG8gbG9zZSBhIGhpZ2ggcmVzb2x1dGlvbiBtb2RlIChvciBiZSBzdHVjayBpbgo+ID4gc29tZSBv
bGQga2VybmVsKSwgd291bGQgaXQgYmUgdGVjaG5pY2FsbHkgZmVhc2libGUgdG8gbWFrZSB0aGUg
ZnJhbWVidWZmZXIKPiA+IGFsbG9jYXRpb24gYXN5bW1ldHJpY2FsPyBUaGF0IGlzLCB0aGUgc3dp
dGNoIHRvIGhpZ2gtcmVzIG1vZGUgd291bGQgZ2V0Cj4gPiByZWplY3RlZCB3aGVuIGl0IHdvdWxk
IGJlIGludG8gdGhlIHNtYWxsZXIgb2YgdGhlIHR3byBidWZmZXJzIGJ1dCBub3Qgd2hlbgo+ID4g
dGhlIGFycmFuZ2VtZW50IGlzIHRoZSBvdGhlciB3YXkgYXJvdW5kPwo+Cj4gSSdtIG5vdCBzdXJl
IHdoYXQgeW91IG1lYW4gaGVyZSwgYnV0IGdlbmVyYWxseSwgdGhlcmUncyBubyB3YXkgb2YgZml4
aW5nCj4gdGhpcyB3aXRob3V0IHBlcmZvcm1hbmNlIHBlbmFsdHkuCj4KPiBUaGUgc2NyZWVuIHJl
c29sdXRpb24gaXMgb25seSBwcm9ncmFtbWVkIG9uY2UuIExhdGVyIHVwZGF0ZXMgb25seQo+IHJl
cXVpcmUgcGFnZWZsaXBzLiBGb3IgZWFjaCBwYWdlZmxpcCwgYXRvbWljIG1vZGVzZXR0aW5nIHJl
cXVpcmVzIHRoZQo+IG5ldyBhbmQgdGhlIG9sZCBmcmFtZWJ1ZmZlciBpbiB2aWRlbyBtZW1vcnkg
YXQgdGhlIHNhbWUgdGltZS4gVGhlc2UgdHdvCj4gZnJhbWVidWZmZXJzIGFyZSB0eXBpY2FsbHkg
YWxsb2NhdGVkIG9uY2UgYnkgR25vbWUvS0RFL2V0YyBjb21wb3NpdG9ycywKPiBhbmQgY29tcG9z
aXRvcnMgZ28gYmFjayBhbmQgZm9ydGggYmV0d2VlbiB0aGVtLiBJdCdzIGJhc2ljYWxseSBkb3Vi
bGUKPiBidWZmZXJpbmcuCgpZb3UgY2FuIGRvIGhpZ2gtcmVzIG1vZGUgSSB0aGluaywgbWF5YmUg
bmVlZHMgYSBkcml2ZXIgb3B0aW9uIHRvIGFsbG93Cml0IHRvIGF2b2lkIHVwc2V0dGluZyBleGlz
dGluZyBjb21wb3NpdG9ycy4gUm91Z2hseToKMS4gZHBtcyBvZmYKMi4gYWxsb2NhdGUgYmlnIGJ1
ZmZlcgozLiBkcG1zIG9uIGluIGhpZ2ggcmVzIG1vZGUgd2l0aCB0aGF0IHNpbmdsZSBidWZmZXIK
ClBhZ2VmbGlwIHdpbGwgZmFpbCBvZmMgd2l0aCBFTk9TUEMsIGJ1dCBrbXMgaXRzZWxmIGRvZXNu
J3QgZGlzYWxsb3cKdGhpcy4gV2UgY291bGQgZXZlbiBpbXBsZW1lbnQgdGhpcyBmYWlybHkgZ2Vu
ZXJpYywgd2l0aCBhIHNldGNhcCBmbGFnLAp3aGljaCBtYWtlcyB0aGUgcHJvYmUgaGVscGVycyBf
bm90XyBmaWx0ZXIgb3V0IG1vZGVzIHdoaWNoIHdvdWxkbid0CmZpdCBhdCBsZWFzdCAyIGZyYW1l
YnVmZmVycyBhdCB0aGUgc2FtZSB0aW1lLgotRGFuaWVsCgo+IEJlc3QgcmVnYXJkcwo+IFRob21h
cwo+Cj4gPgo+ID4KPgo+IC0tCj4gVGhvbWFzIFppbW1lcm1hbm4KPiBHcmFwaGljcyBEcml2ZXIg
RGV2ZWxvcGVyCj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICj4gTWF4ZmVs
ZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55Cj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5i
ZXJnKQo+IEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxp
bmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKCgotLSAKRGFuaWVs
IFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cu
ZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

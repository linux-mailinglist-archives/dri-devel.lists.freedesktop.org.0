Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EAE1E8E0
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 09:22:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98DDB8954A;
	Wed, 15 May 2019 07:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4D2892F1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 15:17:36 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id 186so14277332ywo.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 08:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XlpJYHLmPG7Uggd9+oaIZ1OeCPKgknlGwcKeYgcPgps=;
 b=ozYC0M7QI6fPqawOpxXAsZ1Bjo7VKGYWjyKn9HPrn4Vy9NwJtGvhGbMCA5cSh9UIhw
 kYpst9+qw+Tx9gXgICwq9M5Hvk1tHxxDE6JNXWoRbQC6Fn3SD9Kgye4y4nzOixVeairw
 2838aFWqYDjnEGQGfEcwQERRqhPLqvVMgSN5W9LVoseoZQd2nmN4K0nxBuKjFSZZTnYt
 h3dnpx3SjipVntvZ2vhQl5FzSoHQKfzf+qhXK/ignIfA1hr5oidXv3nQvPF1euOk+l05
 EdJnCCjly95sw26GhgAXNEJODa26WRKepSdzUFc5FkMyzUfk7GjKJ6njgHoAGNK5J76X
 fbvA==
X-Gm-Message-State: APjAAAUyPXF1+T6ZSh6NvQ2s7HiWguptIzlyTuRady40XaAK4qEowsGF
 VRgf1lekY+cSuQBgUKPFEMsl1kLceIGgjEWJFKo=
X-Google-Smtp-Source: APXvYqxEriT2XkWrsa7sMupzbhPrCGn4wsQkd2YWnSKAQ8Mjc/v1DzNBx9GbGA3XQKwGm9ujepe0XUdZIaO+zUVSBaE=
X-Received: by 2002:a25:9b88:: with SMTP id v8mr17000341ybo.153.1557847055669; 
 Tue, 14 May 2019 08:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190512174608.10083-1-peron.clem@gmail.com>
 <20190513151405.GW17751@phenom.ffwll.local>
 <de50a9da-669f-ab25-2ef2-5ffb90f8ee03@baylibre.com>
In-Reply-To: <de50a9da-669f-ab25-2ef2-5ffb90f8ee03@baylibre.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 14 May 2019 17:17:24 +0200
Message-ID: <CAJiuCccuEw0BK6MwROR+XUDvu8AJTmZ5tu=pYwZbGAuvO31pgg@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] Allwinner H6 Mali GPU support
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailman-Approved-At: Wed, 15 May 2019 07:21:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XlpJYHLmPG7Uggd9+oaIZ1OeCPKgknlGwcKeYgcPgps=;
 b=dmpRF7RZxloSc1IpirAVs4uHNLPmixu1h5DGL0kn80zjR4NMuvwbzk04I71iyTq+I6
 FFq4icPffkFrDE80DZkTbIEQCePFMc6rrKjiDUKR2yLzjDDytq3bmNcVsvDM4YW+CNgz
 uh+dqa4DzyxtUGio4Fzqq7gmif5BzLB2GD3La6kHR6PqSV8Jh38XdxUXeygbQJkkyz8V
 pMx1cxToi+sqCT0rMD5tgdgdT7YAYp9JAD8Ama+b8XJW5XO4LWLh0vYiEtHW60/m4NRb
 FlkhmS5dSRhK2bO96CC0vcQwG/KLBjyZbG4F2bclAP8r1VMdbOAfq01Px1CG3FiVoVTU
 jTlw==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUdWUsIDE0IE1heSAyMDE5IGF0IDEyOjI5LCBOZWlsIEFybXN0cm9uZyA8bmFybXN0
cm9uZ0BiYXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiAxMy8wNS8yMDE5IDE3OjE0
LCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+ID4gT24gU3VuLCBNYXkgMTIsIDIwMTkgYXQgMDc6NDY6
MDBQTSArMDIwMCwgcGVyb24uY2xlbUBnbWFpbC5jb20gd3JvdGU6Cj4gPj4gRnJvbTogQ2zDqW1l
bnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KPiA+Pgo+ID4+IEhpLAo+ID4+Cj4gPj4g
VGhlIEFsbHdpbm5lciBINiBoYXMgYSBNYWxpLVQ3MjAgTVAyLiBUaGUgZHJpdmVycyBhcmUKPiA+
PiBvdXQtb2YtdHJlZSBzbyB0aGlzIHNlcmllcyBvbmx5IGludHJvZHVjZSB0aGUgZHQtYmluZGlu
Z3MuCj4gPgo+ID4gV2UgZG8gaGF2ZSBhbiBpbi10cmVlIG1pZGdhcmQgZHJpdmVyIG5vdyAoc2lu
Y2UgNS4yKS4gRG9lcyB0aGlzIHN0dWZmIHdvcmsKPiA+IHRvZ2V0aGVyIHdpdGggeW91ciBkdCBj
aGFuZ2VzIGhlcmU/Cj4KPiBObywgYnV0IGl0IHNob3VsZCBiZSBlYXN5IHRvIGFkZC4KSSB3aWxs
IGdpdmUgaXQgYSB0cnkgYW5kIGxldCB5b3Uga25vdy4KCj4KPiBDbMOpbWVudCwgbm8gbmVlZCB0
byByZXNlbmQgdGhlIGZpcnN0IHBhdGNoLCBpdCdzIG5vdyBvbgo+IGxpbnVzIG1hc3Rlci4KT2sK
ClRoYW5rcywKQ2xlbWVudAoKPgo+IENvdWxkIHlvdSBhbHNvIGFkZCBzdXBwb3J0IGZvciB0aGUg
YnVzIGNsb2NrIGluIHBhbmZyb3N0Cj4gaW4gdGhlIHNhbWUgcGF0Y2hzZXQgc2luY2UgaXQncyBh
bHNvIG9uIG1hc3RlciBub3cgPwo+Cj4gTmVpbAo+Cj4gPiAtRGFuaWVsCj4gPgo+ID4+IFRoZSBm
aXJzdCBwYXRjaCBpcyBmcm9tIE5laWwgQW1zdHJvbmcgYW5kIGhhcyBiZWVuIGFscmVhZHkKPiA+
PiBtZXJnZWQgaW4gbGludXgtYW1sb2dpYy4gSXQgaXMgcmVxdWlyZWQgZm9yIHRoaXMgc2VyaWVz
Lgo+ID4+Cj4gPj4gVGhlIHNlY29uZCBwYXRjaCBpcyBmcm9tIEljZW5vd3kgWmhlbmcgd2hlcmUg
SSBjaGFuZ2VkIHRoZQo+ID4+IG9yZGVyIGhhcyByZXF1aXJlZCBieSBSb2IgSGVycmluZy4KPiA+
PiBTZWU6IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA2OTk4MjkvCj4gPj4K
PiA+PiBUaGFua3MsCj4gPj4gQ2zDqW1lbnQKPiA+Pgo+ID4+IENoYW5nZXMgaW4gdjQ6Cj4gPj4g
IC0gQWRkIFJvYiBIZXJyaW5nIHJldmlld2VkLWJ5IHRhZwo+ID4+ICAtIFJlc2VudCB3aXRoIGNv
cnJlY3QgTWFpbnRhaW5lcnMKPiA+Pgo+ID4+IENoYW5nZXMgaW4gdjMgKFRoYW5rcyB0byBNYXhp
bWUgUmlwYXJkKToKPiA+PiAgLSBSZWF1dGhvciBJY2Vub3d5IGZvciBoZXIgcGF0Y2gKPiA+Pgo+
ID4+IENoYW5nZXMgaW4gdjIgKFRoYW5rcyB0byBNYXhpbWUgUmlwYXJkKToKPiA+PiAgLSBEcm9w
IEdQVSBPUFAgVGFibGUKPiA+PiAgLSBBZGQgY2xvY2tzIGFuZCBjbG9jay1uYW1lcyBpbiByZXF1
aXJlZAo+ID4+Cj4gPj4gQ2zDqW1lbnQgUMOpcm9uICg2KToKPiA+PiAgIGR0LWJpbmRpbmdzOiBn
cHU6IG1hbGktbWlkZ2FyZDogQWRkIEg2IG1hbGkgZ3B1IGNvbXBhdGlibGUKPiA+PiAgIGFybTY0
OiBkdHM6IGFsbHdpbm5lcjogQWRkIEFSTSBNYWxpIEdQVSBub2RlIGZvciBINgo+ID4+ICAgYXJt
NjQ6IGR0czogYWxsd2lubmVyOiBBZGQgbWFsaSBHUFUgc3VwcGx5IGZvciBQaW5lIEg2NAo+ID4+
ICAgYXJtNjQ6IGR0czogYWxsd2lubmVyOiBBZGQgbWFsaSBHUFUgc3VwcGx5IGZvciBCZWVsaW5r
IEdTMQo+ID4+ICAgYXJtNjQ6IGR0czogYWxsd2lubmVyOiBBZGQgbWFsaSBHUFUgc3VwcGx5IGZv
ciBPcmFuZ2VQaSBCb2FyZHMKPiA+PiAgIGFybTY0OiBkdHM6IGFsbHdpbm5lcjogQWRkIG1hbGkg
R1BVIHN1cHBseSBmb3IgT3JhbmdlUGkgMwo+ID4+Cj4gPj4gSWNlbm93eSBaaGVuZyAoMSk6Cj4g
Pj4gICBkdC1iaW5kaW5nczogZ3B1OiBhZGQgYnVzIGNsb2NrIGZvciBNYWxpIE1pZGdhcmQgR1BV
cwo+ID4+Cj4gPj4gTmVpbCBBcm1zdHJvbmcgKDEpOgo+ID4+ICAgZHQtYmluZGluZ3M6IGdwdTog
bWFsaS1taWRnYXJkOiBBZGQgcmVzZXRzIHByb3BlcnR5Cj4gPj4KPiA+PiAgLi4uL2JpbmRpbmdz
L2dwdS9hcm0sbWFsaS1taWRnYXJkLnR4dCAgICAgICAgIHwgMjcgKysrKysrKysrKysrKysrKysr
Kwo+ID4+ICAuLi4vZHRzL2FsbHdpbm5lci9zdW41MGktaDYtYmVlbGluay1nczEuZHRzICAgfCAg
NSArKysrCj4gPj4gIC4uLi9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi1vcmFuZ2VwaS0zLmR0cyAg
ICB8ICA1ICsrKysKPiA+PiAgLi4uL2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LW9yYW5nZXBpLmR0
c2kgICAgIHwgIDUgKysrKwo+ID4+ICAuLi4vYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi1w
aW5lLWg2NC5kdHMgfCAgNSArKysrCj4gPj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVy
L3N1bjUwaS1oNi5kdHNpICB8IDE0ICsrKysrKysrKysKPiA+PiAgNiBmaWxlcyBjaGFuZ2VkLCA2
MSBpbnNlcnRpb25zKCspCj4gPj4KPiA+PiAtLQo+ID4+IDIuMTcuMQo+ID4+Cj4gPgo+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

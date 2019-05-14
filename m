Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 805351E8E1
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 09:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B13F89561;
	Wed, 15 May 2019 07:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98BC89301
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 21:22:12 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id q11so407615ywb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 14:22:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KZdgPzJMm2Uc8AnrgWwgN1MqujNNgYXR6NcAgSjGT5o=;
 b=ZtFbbmfazSrSg1PjrHVNgXuOAiH1SmCb7gX7+NecxuaZz0GJqVLHisl2nvzzdRDbI8
 MnRxSvfQqwSNB5C7Il5xVY7ioh2qg6hOJsJpgUBO7WaLZ6hP25U0wkEgdvAwzPTF7Hjs
 HO5XyO8EbuNYop7E9bnWUMmSLvZYM/MiqC19Lx4KuIAJ77qfoW3wYlWztrFUTMwOLDOd
 r3ittbwNwuYqKfO+wvKa7ybZvTzR8zzfVpMYaywaqegLUI/mTgA1GIka+T+YnIvRdEuk
 XvOMU6kzPk89RKnt8bVqqe+JSQKCqrGDXTfHaDHXJuAVeEvFfp79Nutx3amf2Szg322Q
 N4fA==
X-Gm-Message-State: APjAAAWe/X65kwLHC2GDvX+KTTyuXK+gqIUzSJahjgF8faMHIUhOecFc
 h1Qy2zJ09ctxPbzG2NNtDQwUoyGI0QNNorV5l6I=
X-Google-Smtp-Source: APXvYqyWOSbU8dyN+32a7dkVQJ+qYqNHyfYP8x5BUxI4N2/LF4O6Ua0czFAl5rn5BSO1jIhtA3NFbTSFU94W9Bm33bQ=
X-Received: by 2002:a81:6f44:: with SMTP id k65mr18528638ywc.36.1557868931626; 
 Tue, 14 May 2019 14:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190512174608.10083-1-peron.clem@gmail.com>
 <20190513151405.GW17751@phenom.ffwll.local>
 <de50a9da-669f-ab25-2ef2-5ffb90f8ee03@baylibre.com>
 <CAJiuCccuEw0BK6MwROR+XUDvu8AJTmZ5tu=pYwZbGAuvO31pgg@mail.gmail.com>
In-Reply-To: <CAJiuCccuEw0BK6MwROR+XUDvu8AJTmZ5tu=pYwZbGAuvO31pgg@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 14 May 2019 23:22:00 +0200
Message-ID: <CAJiuCccWa5UTML68JDQq6q8SyNZzVWwQWTOL=+84Bh4EMHGC3A@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] Allwinner H6 Mali GPU support
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailman-Approved-At: Wed, 15 May 2019 07:21:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KZdgPzJMm2Uc8AnrgWwgN1MqujNNgYXR6NcAgSjGT5o=;
 b=jgD6Qxr2AaXHKwZJIVQclWoIaXtmXUdu+G2944cyw0Z0iq3nk/dRopNS9C8YpPwqOO
 kG1IYdzeieuBVOI9b4ByB6lB77SaAu3CgrMsqzoC/ErV7vQmkMHyHfuY00X+nD7k1ILO
 NmA6RDOTSusGjjn+SMXp650jQqdQ+A7mzOuqk+p9X4O8iqnFOKJX3W+xskAoderh2TkU
 /PUOF8dk2qIRYAxb3KpsYLka3JcE6YpSdzXw0YGicwlXuxvxLAjhV6drP3x8YLau0WGl
 SqJQn4iJCblBVXiQrmOUPX3rS12CUzaT24KK3kr2w08AJ8HFuD0qtF5+KhyLHcBZKwZ4
 9SOA==
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
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUdWUsIDE0IE1heSAyMDE5IGF0IDE3OjE3LCBDbMOpbWVudCBQw6lyb24gPHBlcm9u
LmNsZW1AZ21haWwuY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gVHVlLCAxNCBNYXkgMjAxOSBh
dCAxMjoyOSwgTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cm90ZToK
PiA+Cj4gPiBIaSwKPiA+Cj4gPiBPbiAxMy8wNS8yMDE5IDE3OjE0LCBEYW5pZWwgVmV0dGVyIHdy
b3RlOgo+ID4gPiBPbiBTdW4sIE1heSAxMiwgMjAxOSBhdCAwNzo0NjowMFBNICswMjAwLCBwZXJv
bi5jbGVtQGdtYWlsLmNvbSB3cm90ZToKPiA+ID4+IEZyb206IENsw6ltZW50IFDDqXJvbiA8cGVy
b24uY2xlbUBnbWFpbC5jb20+Cj4gPiA+Pgo+ID4gPj4gSGksCj4gPiA+Pgo+ID4gPj4gVGhlIEFs
bHdpbm5lciBINiBoYXMgYSBNYWxpLVQ3MjAgTVAyLiBUaGUgZHJpdmVycyBhcmUKPiA+ID4+IG91
dC1vZi10cmVlIHNvIHRoaXMgc2VyaWVzIG9ubHkgaW50cm9kdWNlIHRoZSBkdC1iaW5kaW5ncy4K
PiA+ID4KPiA+ID4gV2UgZG8gaGF2ZSBhbiBpbi10cmVlIG1pZGdhcmQgZHJpdmVyIG5vdyAoc2lu
Y2UgNS4yKS4gRG9lcyB0aGlzIHN0dWZmIHdvcmsKPiA+ID4gdG9nZXRoZXIgd2l0aCB5b3VyIGR0
IGNoYW5nZXMgaGVyZT8KPiA+Cj4gPiBObywgYnV0IGl0IHNob3VsZCBiZSBlYXN5IHRvIGFkZC4K
PiBJIHdpbGwgZ2l2ZSBpdCBhIHRyeSBhbmQgbGV0IHlvdSBrbm93LgpBZGRlZCB0aGUgYnVzX2Ns
b2NrIGFuZCBhIHJhbXAgZGVsYXkgdG8gdGhlIGdwdV92ZGQgYnV0IHRoZSBkcml2ZXIKZmFpbCBh
dCBwcm9iZS4KClsgICAgMy4wNTI5MTldIHBhbmZyb3N0IDE4MDAwMDAuZ3B1OiBjbG9jayByYXRl
ID0gNDMyMDAwMDAwClsgICAgMy4wNTgyNzhdIHBhbmZyb3N0IDE4MDAwMDAuZ3B1OiBidXNfY2xv
Y2sgcmF0ZSA9IDEwMDAwMDAwMApbICAgIDMuMTc5NzcyXSBwYW5mcm9zdCAxODAwMDAwLmdwdTog
bWFsaS10NzIwIGlkIDB4NzIwIG1ham9yIDB4MQptaW5vciAweDEgc3RhdHVzIDB4MApbICAgIDMu
MTg3NDMyXSBwYW5mcm9zdCAxODAwMDAwLmdwdTogZmVhdHVyZXM6IDAwMDAwMDAwLDEwMzA5ZTQw
LAppc3N1ZXM6IDAwMDAwMDAwLDIxMDU0NDAwClsgICAgMy4xOTU1MzFdIHBhbmZyb3N0IDE4MDAw
MDAuZ3B1OiBGZWF0dXJlczogTDI6MHgwNzExMDIwNgpTaGFkZXI6MHgwMDAwMDAwMCBUaWxlcjow
eDAwMDAwODA5IE1lbToweDEgTU1VOjB4MDAwMDI4MjEgQVM6MHhmCkpTOjB4NwpbICAgIDMuMjA3
MTc4XSBwYW5mcm9zdCAxODAwMDAwLmdwdTogc2hhZGVyX3ByZXNlbnQ9MHgzIGwyX3ByZXNlbnQ9
MHgxClsgICAgMy4yMzgyNTddIHBhbmZyb3N0IDE4MDAwMDAuZ3B1OiBGYXRhbCBlcnJvciBkdXJp
bmcgR1BVIGluaXQKWyAgICAzLjI0NDE2NV0gcGFuZnJvc3Q6IHByb2JlIG9mIDE4MDAwMDAuZ3B1
IGZhaWxlZCB3aXRoIGVycm9yIC0xMgoKVGhlIEVOT01FTSBpcyBjb21pbmcgZnJvbSAicGFuZnJv
c3RfbW11X2luaXQiCmFsbG9jX2lvX3BndGFibGVfb3BzKEFSTV9NQUxJX0xQQUUsICZwZmRldi0+
bW11LT5wZ3RibF9jZmcsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cGZkZXYpOwoKV2hpY2ggaXMgZHVlIHRvIGEgY2hlY2sgaW4gdGhlIHBndGFibGUgYWxsb2MgImNm
Zy0+aWFzICE9IDQ4Igphcm0tbHBhZSBpby1wZ3RhYmxlOiBhcm1fbWFsaV9scGFlX2FsbG9jX3Bn
dGFibGUgY2ZnLT5pYXMgMzMgY2ZnLT5vYXMgNDAKCkRSSSBzdGFjayBpcyB0b3RhbGx5IG5ldyBm
b3IgbWUsIGNvdWxkIHlvdSBnaXZlIG1lIGEgbGl0dGxlIGNsdWUgYWJvdXQKdGhpcyBpc3N1ZSA/
CgpUaGFua3MsCkNsw6ltZW50Cgo+Cj4gPgo+ID4gQ2zDqW1lbnQsIG5vIG5lZWQgdG8gcmVzZW5k
IHRoZSBmaXJzdCBwYXRjaCwgaXQncyBub3cgb24KPiA+IGxpbnVzIG1hc3Rlci4KPiBPawo+Cj4g
VGhhbmtzLAo+IENsZW1lbnQKPgo+ID4KPiA+IENvdWxkIHlvdSBhbHNvIGFkZCBzdXBwb3J0IGZv
ciB0aGUgYnVzIGNsb2NrIGluIHBhbmZyb3N0Cj4gPiBpbiB0aGUgc2FtZSBwYXRjaHNldCBzaW5j
ZSBpdCdzIGFsc28gb24gbWFzdGVyIG5vdyA/Cj4gPgo+ID4gTmVpbAo+ID4KPiA+ID4gLURhbmll
bAo+ID4gPgo+ID4gPj4gVGhlIGZpcnN0IHBhdGNoIGlzIGZyb20gTmVpbCBBbXN0cm9uZyBhbmQg
aGFzIGJlZW4gYWxyZWFkeQo+ID4gPj4gbWVyZ2VkIGluIGxpbnV4LWFtbG9naWMuIEl0IGlzIHJl
cXVpcmVkIGZvciB0aGlzIHNlcmllcy4KPiA+ID4+Cj4gPiA+PiBUaGUgc2Vjb25kIHBhdGNoIGlz
IGZyb20gSWNlbm93eSBaaGVuZyB3aGVyZSBJIGNoYW5nZWQgdGhlCj4gPiA+PiBvcmRlciBoYXMg
cmVxdWlyZWQgYnkgUm9iIEhlcnJpbmcuCj4gPiA+PiBTZWU6IGh0dHBzOi8vcGF0Y2h3b3JrLmtl
cm5lbC5vcmcvcGF0Y2gvMTA2OTk4MjkvCj4gPiA+Pgo+ID4gPj4gVGhhbmtzLAo+ID4gPj4gQ2zD
qW1lbnQKPiA+ID4+Cj4gPiA+PiBDaGFuZ2VzIGluIHY0Ogo+ID4gPj4gIC0gQWRkIFJvYiBIZXJy
aW5nIHJldmlld2VkLWJ5IHRhZwo+ID4gPj4gIC0gUmVzZW50IHdpdGggY29ycmVjdCBNYWludGFp
bmVycwo+ID4gPj4KPiA+ID4+IENoYW5nZXMgaW4gdjMgKFRoYW5rcyB0byBNYXhpbWUgUmlwYXJk
KToKPiA+ID4+ICAtIFJlYXV0aG9yIEljZW5vd3kgZm9yIGhlciBwYXRjaAo+ID4gPj4KPiA+ID4+
IENoYW5nZXMgaW4gdjIgKFRoYW5rcyB0byBNYXhpbWUgUmlwYXJkKToKPiA+ID4+ICAtIERyb3Ag
R1BVIE9QUCBUYWJsZQo+ID4gPj4gIC0gQWRkIGNsb2NrcyBhbmQgY2xvY2stbmFtZXMgaW4gcmVx
dWlyZWQKPiA+ID4+Cj4gPiA+PiBDbMOpbWVudCBQw6lyb24gKDYpOgo+ID4gPj4gICBkdC1iaW5k
aW5nczogZ3B1OiBtYWxpLW1pZGdhcmQ6IEFkZCBINiBtYWxpIGdwdSBjb21wYXRpYmxlCj4gPiA+
PiAgIGFybTY0OiBkdHM6IGFsbHdpbm5lcjogQWRkIEFSTSBNYWxpIEdQVSBub2RlIGZvciBINgo+
ID4gPj4gICBhcm02NDogZHRzOiBhbGx3aW5uZXI6IEFkZCBtYWxpIEdQVSBzdXBwbHkgZm9yIFBp
bmUgSDY0Cj4gPiA+PiAgIGFybTY0OiBkdHM6IGFsbHdpbm5lcjogQWRkIG1hbGkgR1BVIHN1cHBs
eSBmb3IgQmVlbGluayBHUzEKPiA+ID4+ICAgYXJtNjQ6IGR0czogYWxsd2lubmVyOiBBZGQgbWFs
aSBHUFUgc3VwcGx5IGZvciBPcmFuZ2VQaSBCb2FyZHMKPiA+ID4+ICAgYXJtNjQ6IGR0czogYWxs
d2lubmVyOiBBZGQgbWFsaSBHUFUgc3VwcGx5IGZvciBPcmFuZ2VQaSAzCj4gPiA+Pgo+ID4gPj4g
SWNlbm93eSBaaGVuZyAoMSk6Cj4gPiA+PiAgIGR0LWJpbmRpbmdzOiBncHU6IGFkZCBidXMgY2xv
Y2sgZm9yIE1hbGkgTWlkZ2FyZCBHUFVzCj4gPiA+Pgo+ID4gPj4gTmVpbCBBcm1zdHJvbmcgKDEp
Ogo+ID4gPj4gICBkdC1iaW5kaW5nczogZ3B1OiBtYWxpLW1pZGdhcmQ6IEFkZCByZXNldHMgcHJv
cGVydHkKPiA+ID4+Cj4gPiA+PiAgLi4uL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRnYXJkLnR4
dCAgICAgICAgIHwgMjcgKysrKysrKysrKysrKysrKysrKwo+ID4gPj4gIC4uLi9kdHMvYWxsd2lu
bmVyL3N1bjUwaS1oNi1iZWVsaW5rLWdzMS5kdHMgICB8ICA1ICsrKysKPiA+ID4+ICAuLi4vZHRz
L2FsbHdpbm5lci9zdW41MGktaDYtb3JhbmdlcGktMy5kdHMgICAgfCAgNSArKysrCj4gPiA+PiAg
Li4uL2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LW9yYW5nZXBpLmR0c2kgICAgIHwgIDUgKysrKwo+
ID4gPj4gIC4uLi9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LXBpbmUtaDY0LmR0cyB8ICA1
ICsrKysKPiA+ID4+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYuZHRz
aSAgfCAxNCArKysrKysrKysrCj4gPiA+PiAgNiBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25z
KCspCj4gPiA+Pgo+ID4gPj4gLS0KPiA+ID4+IDIuMTcuMQo+ID4gPj4KPiA+ID4KPiA+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88927D8BB3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 10:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625ED6E8FC;
	Wed, 16 Oct 2019 08:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B336E8FC
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 08:49:56 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id b136so52759637iof.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 01:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nkFKCgNZd30QrMCh3RiyW6uUTpINk4yhCuU9i7apvF8=;
 b=iwpr03fy3JEZLHQJy31hyHtbvbSWYQw/9MIR2ug2JVd/lulo5v33kSTNidio/Hck5Y
 5ND02u6ZZb/5vF/UlC2sxZnJaT0SmdnnqZ+Nt8htdh4xAM01bUJXK9mv9oULVIi4gfb8
 Qh7oHAI/MvRbyOouIr/v1oS3cFL8B2MQuWdOm0dASPR5AZzNWLmbDfptoxfl0Jk/0XpS
 d/XpMWdhvxiioqJ56KiXuFtECB/A7rYr/GXfXxuER9gWmtkq/XCNnC+kIC3RG2TIuOJ7
 TeVEbil3w2o1yj1W9MpnQMuYfg8QswzHjx1LHG6+P/ec2SeR+JEeDiE4hneb7udIl8mg
 iMVw==
X-Gm-Message-State: APjAAAUXAhCgdkfHFS7YmqRpLbDuRgPZucw1Jlz9dFERcNdJ8DrdEjB1
 LzK8WX2KBuUvwB2jBZwJdW6qfe3qRufYOeW0bq38xQ==
X-Google-Smtp-Source: APXvYqwM/YfYZ+riS2Cum5gGH058KHcCEur2jM3FQN+H7YrTWDuxynyVSyvoqlYwq/gm6khtHfKG1I7SfwJJ3PPT7kg=
X-Received: by 2002:a6b:5c0f:: with SMTP id z15mr8252242ioh.173.1571215796031; 
 Wed, 16 Oct 2019 01:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191005141913.22020-1-jagan@amarulasolutions.com>
 <20191005141913.22020-6-jagan@amarulasolutions.com>
 <20191007105708.raxavxk4n7bvxh7x@gilmour>
 <CAMty3ZCiwOGgwbsjTHvEZhwHGhsgb6_FeBs9hHgLai9=rV2_HQ@mail.gmail.com>
 <20191016080306.44pmo3rfmtnkgosq@gilmour>
In-Reply-To: <20191016080306.44pmo3rfmtnkgosq@gilmour>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 16 Oct 2019 14:19:44 +0530
Message-ID: <CAMty3ZCTE=W+TNRvdowec-eYB625j97uG8F3fzVMtRFsKsqFFQ@mail.gmail.com>
Subject: Re: [PATCH v10 5/6] arm64: dts: allwinner: a64: Add MIPI DSI pipeline
To: Maxime Ripard <mripard@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=nkFKCgNZd30QrMCh3RiyW6uUTpINk4yhCuU9i7apvF8=;
 b=oDLHRvC6Da2CfSONZTkFu1bX2HUbVJbI71A8Kmnp8x1j9NKcOadDyR4zX0/SUlCeDW
 6EP3b8kcsQfyUBkTYAd4jBTbJotQJjQ39oVD+mG36pdochYrgL1N9fvZ+4W/6s0/hKDV
 BglF9H8nLhQu+PPWgzunU49/vZjl42IXUCUpU=
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMTozMyBQTSBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMDU6Mzc6NTBQTSAr
MDUzMCwgSmFnYW4gVGVraSB3cm90ZToKPiA+IE9uIE1vbiwgT2N0IDcsIDIwMTkgYXQgNDoyNyBQ
TSBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBP
biBTYXQsIE9jdCAwNSwgMjAxOSBhdCAwNzo0OToxMlBNICswNTMwLCBKYWdhbiBUZWtpIHdyb3Rl
Ogo+ID4gPiA+IEFkZCBNSVBJIERTSSBwaXBlbGluZSBmb3IgQWxsd2lubmVyIEE2NC4KPiA+ID4g
Pgo+ID4gPiA+IC0gZHNpIG5vZGUsIHdpdGggQTY0IGNvbXBhdGlibGUgc2luY2UgaXQgZG9lc24n
dCBzdXBwb3J0Cj4gPiA+ID4gICBEU0lfU0NMSyBnYXRpbmcgdW5saWtlIEEzMwo+ID4gPiA+IC0g
ZHBoeSBub2RlLCB3aXRoIEE2NCBjb21wYXRpYmxlIHdpdGggQTMzIGZhbGxiYWNrIHNpbmNlCj4g
PiA+ID4gICBEUEhZIG9uIEE2NCBhbmQgQTMzIGlzIHNpbWlsYXIKPiA+ID4gPiAtIGZpbmFsbHks
IGF0dGFjaCB0aGUgZHNpX2luIHRvIHRjb24wIGZvciBjb21wbGV0ZSBNSVBJIERTSQo+ID4gPiA+
Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9u
cy5jb20+Cj4gPiA+ID4gVGVzdGVkLWJ5OiBNZXJsaWpuIFdhamVyIDxtZXJsaWpuQHdpenp1cC5v
cmc+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1
bjUwaS1hNjQuZHRzaSB8IDM4ICsrKysrKysrKysrKysrKysrKysKPiA+ID4gPiAgMSBmaWxlIGNo
YW5nZWQsIDM4IGluc2VydGlvbnMoKykKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LmR0c2kgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LmR0c2kKPiA+ID4gPiBpbmRleCA2OTEyOGE2ZGZj
NDYuLmFkNDE3MGI4YWVlMCAxMDA2NDQKPiA+ID4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRz
L2FsbHdpbm5lci9zdW41MGktYTY0LmR0c2kKPiA+ID4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LmR0c2kKPiA+ID4gPiBAQCAtMzgyLDYgKzM4MiwxMiBA
QAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAjc2l6ZS1jZWxscyA9IDwwPjsKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJlZyA9IDwxPjsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB0Y29uMF9vdXRfZHNpOiBlbmRwb2ludEAxIHsKPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDE+Owo+
ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZW1v
dGUtZW5kcG9pbnQgPSA8JmRzaV9pbl90Y29uMD47Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFsbHdpbm5lcix0Y29uLWNoYW5uZWwgPSA8MT47
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Owo+ID4gPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH07Cj4gPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgIH07Cj4gPiA+ID4gICAgICAgICAgICAgICB9Owo+ID4gPiA+IEBAIC0xMDAzLDYgKzEw
MDksMzggQEAKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVk
IjsKPiA+ID4gPiAgICAgICAgICAgICAgIH07Cj4gPiA+ID4KPiA+ID4gPiArICAgICAgICAgICAg
IGRzaTogZHNpQDFjYTAwMDAgewo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb21wYXRp
YmxlID0gImFsbHdpbm5lcixzdW41MGktYTY0LW1pcGktZHNpIjsKPiA+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgcmVnID0gPDB4MDFjYTAwMDAgMHgxMDAwPjsKPiA+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDg5IElSUV9UWVBFX0xFVkVMX0hJR0g+
Owo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JmNjdSBDTEtfQlVTX01J
UElfRFNJPjsKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAiYnVz
IjsKPiA+ID4KPiA+ID4gVGhpcyB3b24ndCB2YWxpZGF0ZSB3aXRoIHRoZSBiaW5kaW5ncyB5b3Ug
aGF2ZSBlaXRoZXIgaGVyZSwgc2luY2UgaXQKPiA+ID4gc3RpbGwgZXhwZWN0cyBidXMgYW5kIG1v
ZC4KPiA+ID4KPiA+ID4gSSBndWVzcyBpbiB0aGF0IGNhcywgd2UgY2FuIGp1c3QgZHJvcCBjbG9j
ay1uYW1lcywgd2hpY2ggd2lsbCByZXF1aXJlCj4gPiA+IGEgYml0IG9mIHdvcmsgb24gdGhlIGRy
aXZlciBzaWRlIGFzIHdlbGwuCj4gPgo+ID4gT2theS4KPiA+IG1vZCBjbG9jayBpcyBub3QgcmVx
dWlyZWQgZm9yIGE2NCwgaWUgcmVhc29uIHdlIGhhdmUgaGFzX21vZF9jbGsgcXVpcmsKPiA+IHBh
dGNoLiBBZGp1c3QgdGhlIGNsb2NrLW5hbWVzOiBvbiBkdC1iaW5kaW5ncyB3b3VsZCBtYWtlIHNl
bnNlIGhlcmUsCj4gPiB3aGF0IGRvIHlvdSB0aGluaz8KPgo+IEknbSBjb25mdXNlZCwgd2hhdCBh
cmUgeW91IHN1Z2dlc3Rpbmc/CgpTb3JyeSBmb3IgdGhlIGNvbmZ1c2lvbi4KClRoZSBtb2QgY2xv
Y2sgaXMgbm90IHJlcXVpcmVkIGZvciBBNjQgYW5kIHdlIGhhdmUgYSBwYXRjaCBmb3IgaGFuZGxp
bmcKbW9kIGNsb2NrIHVzaW5nIGhhc19tb2RfY2xrIHF1aXJrKG9uIHRoZSBzZXJpZXMpLCBpbmRl
ZWQgdGhlIG1vZCBjbG9jawppcyBhdmFpbGFibGUgaW4gQTMxIGFuZCBub3QgbmVlZGVkIGZvciBB
NjQuIFNvLCB0byBzYXRpc2Z5IHRoaXMKcmVxdWlyZW1lbnQgdGhlIGNsb2NrLW5hbWVzIG9uIGR0
LWJpbmRpbmdzIGNhbiB1cGRhdGUgdG8gbWFrZSBtb2QKY2xvY2stbmFtZSBpcyBvcHRpb25hbCBh
bmQgYnVzIGNsb2NrIGlzIHJlcXVpcmVkLgoKSSdtIG5vdCBleGFjdGx5IHN1cmUsIHRoaXMgaXMg
Y29ycmVjdCBidXQgdHJ5aW5nIHRvIHVuZGVyc3RhbmQgaWYgaXQKaXMgcG9zc2libGUgb3Igbm90
PyBzb21ldGhpbmcgbGlrZQoKICAgY2xvY2tzOgogICAgICBtaW5JdGVtczogMQogICAgICBtYXhJ
dGVtczogMgogICAgIGl0ZW1zOgogICAgICAgLSBkZXNjcmlwdGlvbjogQnVzIENsb2NrCiAgICAg
ICAtIGRlc2NyaXB0aW9uOiBNb2R1bGUgQ2xvY2sKCiAgIGNsb2NrLW5hbWVzOgogICAgICBtaW5J
dGVtczogMQogICAgICBtYXhJdGVtczogMgogICAgIGl0ZW1zOgogICAgICAgLSBjb25zdDogYnVz
CiAgICAgICAtIGNvbnN0OiBtb2QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs

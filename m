Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1690D6207
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 14:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF3789F73;
	Mon, 14 Oct 2019 12:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E698389F73
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 12:08:03 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id c25so37258456iot.12
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 05:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6crmpTwGnz+uFcnLN62tbtxngSexhL6XeYQRkm/JhoY=;
 b=tiWucxAb0CTXRU5SzJB6DcX87DS1o7EVSjb5ZM5fn3pf/o9529FN0f54l4U9uJahsD
 MGJKf0vDF3c+aNHzhfszQ2HSUVq/yaEf7owVTFBWuXngOW75axrdNOd5zE3tv6xlFiWl
 faqXgA6H02QTxZGqSrwGKmGhT8XHGTNCUmtaYZ5h43FqPPjenzbYJmjUXjFiiKJIPsgh
 x79P1P8Ihcdfc0LeT5DO0N4VN1tpzeE0rD3ITOrCsNkxC7Uhft5pXHn5WT6DN50ApeME
 OxIJr3rDoljwc5iqh/849X5O9gLwMZwjeJ7I6Fey84CLeCLv2W0ugx5THYSCPQvHUq3D
 aKrA==
X-Gm-Message-State: APjAAAUtyIN8wNDhf+Q3sqtweA0FaAF3q214kcyvXFXPN658SMBxWM2c
 ZOKybyjOZI34xDDrld4nDMzduh5GJlLow7NmIWLTYA==
X-Google-Smtp-Source: APXvYqxpgGP82G+0e/506RQFRNOo+V1cYmj86xwy/H75qzek0TZSuNPkcdhhBjRp/kGb802FWG6ooo62z42OJaaLFpU=
X-Received: by 2002:a6b:37c6:: with SMTP id e189mr18175247ioa.61.1571054882584; 
 Mon, 14 Oct 2019 05:08:02 -0700 (PDT)
MIME-Version: 1.0
References: <20191005141913.22020-1-jagan@amarulasolutions.com>
 <20191005141913.22020-6-jagan@amarulasolutions.com>
 <20191007105708.raxavxk4n7bvxh7x@gilmour>
In-Reply-To: <20191007105708.raxavxk4n7bvxh7x@gilmour>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 14 Oct 2019 17:37:50 +0530
Message-ID: <CAMty3ZCiwOGgwbsjTHvEZhwHGhsgb6_FeBs9hHgLai9=rV2_HQ@mail.gmail.com>
Subject: Re: [PATCH v10 5/6] arm64: dts: allwinner: a64: Add MIPI DSI pipeline
To: Maxime Ripard <mripard@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=6crmpTwGnz+uFcnLN62tbtxngSexhL6XeYQRkm/JhoY=;
 b=gQEUAXsMwogpgVvZgUXndfP8Yx1YL+c7KNJMu+nO1RwHxW4SfBzwf+tTSjUdob83Lt
 8bjCllxos6er4GVPWpid4x2QZH+CKRzOyTW+27zQjnfWvMatBzD0PFfILP+3UmKhPM8Z
 CoPSGPu5lzhnetQrfUKDbabRzqD5JKJCzT9Pw=
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

T24gTW9uLCBPY3QgNywgMjAxOSBhdCA0OjI3IFBNIE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTYXQsIE9jdCAwNSwgMjAxOSBhdCAwNzo0OToxMlBNICsw
NTMwLCBKYWdhbiBUZWtpIHdyb3RlOgo+ID4gQWRkIE1JUEkgRFNJIHBpcGVsaW5lIGZvciBBbGx3
aW5uZXIgQTY0Lgo+ID4KPiA+IC0gZHNpIG5vZGUsIHdpdGggQTY0IGNvbXBhdGlibGUgc2luY2Ug
aXQgZG9lc24ndCBzdXBwb3J0Cj4gPiAgIERTSV9TQ0xLIGdhdGluZyB1bmxpa2UgQTMzCj4gPiAt
IGRwaHkgbm9kZSwgd2l0aCBBNjQgY29tcGF0aWJsZSB3aXRoIEEzMyBmYWxsYmFjayBzaW5jZQo+
ID4gICBEUEhZIG9uIEE2NCBhbmQgQTMzIGlzIHNpbWlsYXIKPiA+IC0gZmluYWxseSwgYXR0YWNo
IHRoZSBkc2lfaW4gdG8gdGNvbjAgZm9yIGNvbXBsZXRlIE1JUEkgRFNJCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPiBUZXN0
ZWQtYnk6IE1lcmxpam4gV2FqZXIgPG1lcmxpam5Ad2l6enVwLm9yZz4KPiA+IC0tLQo+ID4gIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQuZHRzaSB8IDM4ICsrKysrKysr
KysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LmR0
c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LmR0c2kKPiA+IGlu
ZGV4IDY5MTI4YTZkZmM0Ni4uYWQ0MTcwYjhhZWUwIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9hcm02
NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC5kdHNpCj4gPiArKysgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LmR0c2kKPiA+IEBAIC0zODIsNiArMzgyLDEy
IEBACj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICNhZGRyZXNzLWNl
bGxzID0gPDE+Owo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjc2l6
ZS1jZWxscyA9IDwwPjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmVnID0gPDE+Owo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB0Y29uMF9vdXRfZHNpOiBlbmRwb2ludEAxIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MT47Cj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZkc2lfaW5fdGNv
bjA+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFs
bHdpbm5lcix0Y29uLWNoYW5uZWwgPSA8MT47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIH07Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Owo+ID4g
ICAgICAgICAgICAgICAgICAgICAgIH07Cj4gPiAgICAgICAgICAgICAgIH07Cj4gPiBAQCAtMTAw
Myw2ICsxMDA5LDM4IEBACj4gPiAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2Fi
bGVkIjsKPiA+ICAgICAgICAgICAgICAgfTsKPiA+Cj4gPiArICAgICAgICAgICAgIGRzaTogZHNp
QDFjYTAwMDAgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYWxsd2lu
bmVyLHN1bjUwaS1hNjQtbWlwaS1kc2kiOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJlZyA9
IDwweDAxY2EwMDAwIDB4MTAwMD47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0
cyA9IDxHSUNfU1BJIDg5IElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIGNsb2NrcyA9IDwmY2N1IENMS19CVVNfTUlQSV9EU0k+Owo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIGNsb2NrLW5hbWVzID0gImJ1cyI7Cj4KPiBUaGlzIHdvbid0IHZhbGlkYXRlIHdp
dGggdGhlIGJpbmRpbmdzIHlvdSBoYXZlIGVpdGhlciBoZXJlLCBzaW5jZSBpdAo+IHN0aWxsIGV4
cGVjdHMgYnVzIGFuZCBtb2QuCj4KPiBJIGd1ZXNzIGluIHRoYXQgY2FzLCB3ZSBjYW4ganVzdCBk
cm9wIGNsb2NrLW5hbWVzLCB3aGljaCB3aWxsIHJlcXVpcmUKPiBhIGJpdCBvZiB3b3JrIG9uIHRo
ZSBkcml2ZXIgc2lkZSBhcyB3ZWxsLgoKT2theS4KbW9kIGNsb2NrIGlzIG5vdCByZXF1aXJlZCBm
b3IgYTY0LCBpZSByZWFzb24gd2UgaGF2ZSBoYXNfbW9kX2NsayBxdWlyawpwYXRjaC4gQWRqdXN0
IHRoZSBjbG9jay1uYW1lczogb24gZHQtYmluZGluZ3Mgd291bGQgbWFrZSBzZW5zZSBoZXJlLAp3
aGF0IGRvIHlvdSB0aGluaz8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFBD73425
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 18:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DBD6E5F5;
	Wed, 24 Jul 2019 16:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89FE46E5F5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 16:45:23 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5020A21926
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 16:45:23 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id d23so46177881qto.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 09:45:23 -0700 (PDT)
X-Gm-Message-State: APjAAAWLoyfnOZioS8JUbFdba+sxf7ZCQkMJPDbRMr/2rouWk79lpyMP
 gGtJe32AVPxNfvKhLLaTC2clPlmg2vWdUaVpoA==
X-Google-Smtp-Source: APXvYqyCNZd8sLbz/UaQBpNaOntVldKJOFDIAKknv8f9hE6ETbDZiRfRG83c+wEdJMfXUbzA73OQCzHtkVc5LaOtHE0=
X-Received: by 2002:aed:3f10:: with SMTP id p16mr58310435qtf.110.1563986722543; 
 Wed, 24 Jul 2019 09:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190724105626.53552-1-steven.price@arm.com>
 <CAL_JsqLkxKe=feVQDb3VXqOnA7fvDBEKWgLf2suOHhNLnR704Q@mail.gmail.com>
 <20190724164004.GA8255@kevin>
In-Reply-To: <20190724164004.GA8255@kevin>
From: Rob Herring <robh@kernel.org>
Date: Wed, 24 Jul 2019 10:45:11 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+cLg5R=SJ0zjfVqYB_So-gHT3qb16wcOCbrHuufSZgLw@mail.gmail.com>
Message-ID: <CAL_Jsq+cLg5R=SJ0zjfVqYB_So-gHT3qb16wcOCbrHuufSZgLw@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Export all GPU feature registers
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563986723;
 bh=oK5t/PL8WcOVCFcv86Gw02DGqzqgmltoUOuxGNqt6Zc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=m8VMnvraXywFQynfV8V3aXOYEnGYm741q6++csDVAfQDWzNSrzMOXX2FPtus/HCMT
 p9cc03h+ORrk6+h+ooxu/GmU+b3duUc01qQmVvKeGQ036aE7jcP5Cr3mwARAzIH7p6
 HRwqCbKuxSe4MmnlUD3GoFva2hyc/Xanj97WWIW8=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMTA6NDAgQU0gQWx5c3NhIFJvc2VuendlaWcKPGFseXNz
YS5yb3Nlbnp3ZWlnQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+Cj4gVGhpcyBpcyBkZWZpbml0ZWx5
IGhlbHBmdWwhCj4KPiBNeSBvbmUgY29uY2VybiBpcywgc3VwcG9zaW5nIHVzZXJzcGFjZSByZWFs
bHkgZG9lcyBuZWVkIGFsbCBvZiB0aGlzCj4gaW5mb3JtYXRpb24sIGlzIGl0IHdhc3RlZnVsIHRv
IGhhdmUgdG8gZG8gMzArIGlvY3RscyBqdXN0IHRvIGdldCB0aGlzPwo+IGtiYXNlIGhhZCBhIHNp
bmdsZSBpb2N0bCB0byBncmFiIGFsbCBvZiB0aGUgcHJvcGVydGllcywgd2hldGhlcgo+IHVzZXJz
cGFjZSB3YW50ZWQgdGhlbSBvciBub3QuIEknbSBub3Qgc3VyZSBpZiB0aGF0J3MgYmV0dGVyIC0t
IHRoZSB0d28KPiBhcHByb2FjaGVzIGFyZSByYXRoZXIgcG9sYXIgb3Bwb3NpdGVzLgoKSSB0aGlu
ayB0aGlzIHNoaXAgYWxyZWFkeSBzYWlsZWQgd2hlbiB3ZSBhZGRlZCB0aGUgZmlyc3Qgb25lIHdp
dGgKR1BVX0lELiBBbHNvLCBhdCBsZWFzdCBldG5hdml2IHdvcmtzIHRoZSBzYW1lIHdheS4KCj4K
PiBHcmFudGVkIHRoaXMgd291bGQgYmUgb24gZHJpdmVyIGluaXQgc28gbm90IGEgY3JpdGljYWwg
cGF0aC4KCkV4YWN0bHkuCgo+Cj4gT24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMTA6Mjc6MDNBTSAt
MDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiBBZGRpbmcgQWx5c3NhJ3MgQ29sbGFib3JhIGVt
YWlsLgo+ID4KPiA+IE9uIFdlZCwgSnVsIDI0LCAyMDE5IGF0IDQ6NTYgQU0gU3RldmVuIFByaWNl
IDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE1pZGdhcmQvQmlmcm9z
dCBHUFVzIGhhdmUgYSBidW5jaCBvZiBmZWF0dXJlIHJlZ2lzdGVycyBwcm92aWRpbmcgZGV0YWls
cwo+ID4gPiBvZiB3aGF0IHRoZSBoYXJkd2FyZSBzdXBwb3J0cy4gUGFuZnJvc3QgYWxyZWFkeSBy
ZWFkcyB0aGVzZSwgdGhpcyBwYXRjaAo+ID4gPiBleHBvcnRzIHRoZW0gYWxsIHRvIHVzZXIgc3Bh
Y2Ugc28gdGhhdCB0aGUgam9icyBjcmVhdGVkIGJ5IHRoZSB1c2VyIHNwYWNlCj4gPiA+IGRyaXZl
ciBjYW4gYmUgdHVuZWQgZm9yIHRoZSBwYXJ0aWN1bGFyIGhhcmR3YXJlIGltcGxlbWVudGF0aW9u
Lgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBh
cm0uY29tPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9kZXZpY2UuaCB8ICAxICsKPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9kcnYuYyAgICB8IDM4ICsrKysrKysrKysrKysrKysrKystLQo+ID4gPiAgZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dwdS5jICAgIHwgIDIgKysKPiA+ID4gIGluY2x1ZGUvdWFw
aS9kcm0vcGFuZnJvc3RfZHJtLmggICAgICAgICAgICB8IDM5ICsrKysrKysrKysrKysrKysrKysr
KysKPiA+ID4gIDQgZmlsZXMgY2hhbmdlZCwgNzcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKPiA+Cj4gPiBMR1RNLiBJJ2xsIGdpdmUgaXQgYSBiaXQgbW9yZSB0aW1lIHRvIHNlZSBpZiB0
aGVyZSBhcmUgYW55IGNvbW1lbnRzCj4gPiBiZWZvcmUgSSBhcHBseSBpdC4KPiA+Cj4gPiBSb2IK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

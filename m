Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 958E66F9FA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 09:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E948C89B7B;
	Mon, 22 Jul 2019 07:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs53.siol.net [185.57.226.244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC50C6E8BE
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2019 16:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 6EE635207E5;
 Sat, 20 Jul 2019 18:03:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id N2-Axw94Gu4C; Sat, 20 Jul 2019 18:03:32 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 22AFF52066B;
 Sat, 20 Jul 2019 18:03:32 +0200 (CEST)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net
 [89.212.178.211]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id ED72F520CD1;
 Sat, 20 Jul 2019 18:03:29 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 0/3] drm/sun4i: Add support for color encoding and range
Date: Sat, 20 Jul 2019 18:03:29 +0200
Message-ID: <10088719.p65GSun1Qg@jernej-laptop>
In-Reply-To: <20190720054255.vyma2lyiu2tohl74@flea>
References: <20190713120346.30349-1-jernej.skrabec@siol.net>
 <20190720054255.vyma2lyiu2tohl74@flea>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 Jul 2019 07:08:15 +0000
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
Cc: airlied@linux.ie, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG5lIHNvYm90YSwgMjAuIGp1bGlqIDIwMTkgb2IgMDc6NDI6NTUgQ0VTVCBqZSBNYXhpbWUgUmlw
YXJkIG5hcGlzYWwoYSk6Cj4gT24gU2F0LCBKdWwgMTMsIDIwMTkgYXQgMDI6MDM6NDNQTSArMDIw
MCwgSmVybmVqIFNrcmFiZWMgd3JvdGU6Cj4gPiBJbiBvcmRlciB0byBjb3JyZWN0bHkgY29udmVy
dCBpbWFnZSBiZXR3ZWVuIFlVViBhbmQgUkdCLCB5b3UgaGF2ZSB0bwo+ID4ga25vdyBjb2xvciBl
bmNvZGluZyBhbmQgY29sb3IgcmFuZ2UuIFRoaXMgcGF0Y2ggc2V0IGFkZHMgYXBwcm9wcmlhdGUK
PiA+IHByb3BlcnRpZXMgYW5kIGNvbnNpZGVycyB0aGVtIHdoZW4gY2hvb3NpbmcgQ1NDIGNvbnZl
cnNpb24gbWF0cml4IGZvcgo+ID4gREUyIGFuZCBERTMuCj4gPiAKPiA+IE5vdGUgdGhhdCB0aGlz
IGlzIG9ubHkgdGhlIGhhbGYgb2YgbmVlZGVkIGNoYW5nZXMgd2hlbiB1c2luZyBIRE1JIG91dHB1
dC4KPiA+IERXIEhETUkgYnJpZGdlIGRyaXZlciBoYXMgdG8gYmUgZXh0ZW5kZWQgdG8gaGF2ZSBh
IHByb3BlcnR5IHRvIHNlbGVjdAo+ID4gbGltaXRlZCAoVFZzKSBvciBmdWxsIChQQyBtb25pdG9y
cykgcmFuZ2UuIEJ1dCB0aGF0IHdpbGwgYmUgZG9uZSBhdCBhCj4gPiBsYXRlciB0aW1lLgo+ID4g
Cj4gPiBQbGVhc2UgdGFrZSBhIGxvb2suCj4gCj4gU29ycnkgZm9yIHRoZSBkZWxheSwgSSBhcHBs
aWVkIGFsbCB0aHJlZS4KCk5vIHByb2JsZW0uIFRoYW5rcyEKCkJlc3QgcmVnYXJkcywKSmVybmVq
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

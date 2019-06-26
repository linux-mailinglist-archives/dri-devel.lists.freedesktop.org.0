Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBEC56E4F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 18:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D126E48B;
	Wed, 26 Jun 2019 16:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D076E48B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 16:04:38 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 52BAF20054;
 Wed, 26 Jun 2019 18:04:36 +0200 (CEST)
Date: Wed, 26 Jun 2019 18:04:34 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Josef =?utf-8?B?THXFoXRpY2vDvQ==?= <josef@lusticky.cz>
Subject: Re: [PATCH 0/2] Add DRM panel driver for Ilitek ILI9341 based panels
 in parallel RGB mode
Message-ID: <20190626160434.GA16552@ravnborg.org>
References: <20190219132101.27196-1-josef@lusticky.cz>
 <20190626125754.GD23428@ravnborg.org>
 <CAMqqaJH=Zv2zvLYKGPteA-yMoWL40+WM7huGVgkoNxdsveb3yQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMqqaJH=Zv2zvLYKGPteA-yMoWL40+WM7huGVgkoNxdsveb3yQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10
 a=M9wXl1Cokpm5LZFD1kEA:9 a=QEXdDO2ut3YA:10
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9zZWYuCgpPbiBXZWQsIEp1biAyNiwgMjAxOSBhdCAwNToyMTowOVBNICswMjAwLCBKb3Nl
ZiBMdcWhdGlja8O9IHdyb3RlOgo+IEhlbGxvIFNhbSwgUm9iLAo+IHRoYW5rIHlvdSBib3RoIGZv
ciBjb21tZW50cy4KPiAKPiBJJ3ZlIGFscmVhZHkgcHJlcGFyZWQgbW9zdCBvZiB0aGUgY29kZSBm
b3IgdjIgb2YgdGhpcyBwYXRjaHNldC4KPiAKPiBBdCB0aGUgbW9tZW50IEkgYW0gaW52ZXN0aWdh
dGluZywgaWYgaXQncyBwb3NzaWJsZSB0byB1c2UgbWlwaV9kYmlfKgo+IGZ1bmN0aW9ucyBmb3Ig
dGhlIGRpc3BsYXkgaW5pdGlhbGl6YXRpb24sCj4gYXMgUm9iIHN1Z2dlc3RlZCAoIkNhbid0IHlv
dSB1c2UgZXhpc3RpbmcgbWlwaV9kYmlfKiBmdW5jdGlvbnMgaW5zdGVhZAo+IG9mIHJvbGxpbmcg
eW91ciBvd24/IikuCj4gCj4gSSdsbCBwb3N0IHYyIHBhdGNoc2V0IHNvb24uClRoYW5rcyBmb3Ig
dGhlIHVwZGF0ZS4gTG9va3MgZm9yd2FyZCBmb3IgbmV4dCByb3VuZCBvZiBwYXRjaGVzLgoKUGxl
YXNlIGNoZWNrIGFsc28gd2hhdCB3ZSBoYXZlIGluIGRybS90aW55ZHJtL2NvcmUvdGlueWRybS1o
ZWxwZXJzLmMuCklmIHNvbWUgb2YgdGhlIGZ1bmN0aW9ucyBhcmUgdXNlYWJsZSBvdXRzaWRlIHRp
bnlkcm0gLSB0aGVuIHdlIHNob3VsZAptb3ZlIHRoZW0gdG8gYSBoZWxwZXIgaW4gZHJtLy4KU28g
d2UgZG8gbm90IGR1cGxpY2F0ZSBmdW5jdGlvbmFsaXR5LgoKQW5kIG1heWJlIHRoaXMgaXMgd2hh
dCB5b3UgYWxyZWFkeSBkbyBhbmQgc28gZXZlcnl0aGluZyBpcyBmaW5lLgoKRG8gbm90IGhlc2l0
YXRlIHRvIGdldCBiYWNrIGlmIHlvdSBoYXZlIGFueSBxdWVzdGlvbnMuCgoJU2FtCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

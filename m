Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2DB100D72
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 22:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB766892A4;
	Mon, 18 Nov 2019 21:12:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E1A89DAB
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 21:12:25 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id q140so6453020ywg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 13:12:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6upXDhNFo0nrsQ2L0RqECuxOTI7O5ERKPLneAxPvz7c=;
 b=ZDCFjkGB+gMH6h/F54Vfzj9ctO6X8Ux3XvqN+FkjxiGEZaWrIaTZeIXUncxWFLaBor
 CrbaAiN5MxFT8S0kKicAXD5+YeXg74/g8DjbpxZYJE0zM84nx155EcxPawjSneFG1DUH
 +qRUu1zhohlhkUAy3vOEACMvVs0DemK2CBzVhC7j8B+0Pt315JzsHp1VXZ69/kiHXuvm
 CNG1NoPKL91PFA2ktiygjiHdFP4o2n88Bnp6n4pdQgVgOlGMi58YpnnpIc5F1SeA1VCC
 OPh9T9hMs62ydIBJc3/pkrWV45WkyTGbicISOpEexowFkUTGSZa43tUTnxHVEJYdgcmI
 WvVQ==
X-Gm-Message-State: APjAAAV/zFQ7wsqLacU3xjKutb2l0xvx06DHSfYl1Bfsdzn7IbjUnhDy
 o9vW4aM1jUiAkWhYoc8DbjGyRA==
X-Google-Smtp-Source: APXvYqzAinz5ZQxnMdmq3uJvhm1X1FgntGJvMLmBXoROvfsqoAMA3ftORkYq9KGMR2pOobqbP/cByQ==
X-Received: by 2002:a81:4e04:: with SMTP id c4mr9481605ywb.298.1574111544976; 
 Mon, 18 Nov 2019 13:12:24 -0800 (PST)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id n191sm8487846ywd.56.2019.11.18.13.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 13:12:24 -0800 (PST)
Date: Mon, 18 Nov 2019 16:12:23 -0500
From: Sean Paul <sean@poorly.run>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/2] add new DRM_DEV_WARN macro
Message-ID: <20191118211223.GB135013@art_vandelay>
References: <20191114132436.7232-1-wambui.karugax@gmail.com>
 <8736ep1hm2.fsf@intel.com> <20191118192450.GA135013@art_vandelay>
 <CAKMK7uG7Tb6oocrRgRFvq5oB2Rxjy+JmyOSXQtjo6Gt_WH91+A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uG7Tb6oocrRgRFvq5oB2Rxjy+JmyOSXQtjo6Gt_WH91+A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6upXDhNFo0nrsQ2L0RqECuxOTI7O5ERKPLneAxPvz7c=;
 b=APsvoPZqd3/4J1mskST0MM0sGTrFWZWLOEAYmOBonP6JvkuEWs9/P/zm2cGhbbAdwR
 RkAdbYictFRA3Lu3MV/9wWkWd1qXzUczVbmHVDRUz+00GgtdZE7BiOlTfhG84lRwIefh
 Bh11q6gC0MXkEVYaXXLbnjc0VOj2d1M3CZ4CETazCX5Pkfx61+yLw9lBNVZbrKCkVoLo
 3NeFEg3x0ez3aQDopQg9loBZHPmttmgYJwKZWeAEx7JGFnDxjUDo+BY2+ywBXULp5Eg7
 FeLIm35E200T3dXB4+wltq1sUd9Fi7m8gcFM/H5GR9jFvoQFVPEyIMQIM8hXoJmDYF+9
 BIHg==
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
Cc: Dave Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Sean Paul <sean@poorly.run>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMDk6MDM6MjBQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBNb24sIE5vdiAxOCwgMjAxOSBhdCA4OjI0IFBNIFNlYW4gUGF1bCA8c2VhbkBw
b29ybHkucnVuPiB3cm90ZToKPiA+IE9uIEZyaSwgTm92IDE1LCAyMDE5IGF0IDAxOjUyOjUzUE0g
KzAyMDAsIEphbmkgTmlrdWxhIHdyb3RlOgo+ID4gPiBPbiBUaHUsIDE0IE5vdiAyMDE5LCBXYW1i
dWkgS2FydWdhIDx3YW1idWkua2FydWdheEBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+IFRoaXMg
YWRkcyBhIG5ldyBEUk1fREVWX1dBUk4gaGVscGVyIG1hY3JvIGZvciB3YXJuaW5ncyBsb2cgb3V0
cHV0IHRoYXQgaW5jbHVkZQo+ID4gPiA+IGRldmljZSBwb2ludGVycy4gSXQgYWxzbyBpbmNsdWRl
cyB0aGUgdXNlIG9mIHRoZSBEUk1fREVWX1dBUk4gbWFjcm8gaW4KPiA+ID4gPiBkcm0vcm9ja2No
aXAgdG8gcmVwbGFjZSBkZXZfd2Fybi4KPiA+ID4KPiA+ID4gSSdtIHRyeWluZyB0byBzb2xpY2l0
IG5ldyBzdHJ1Y3QgZHJtX2RldmljZSBiYXNlZCBsb2dnaW5nIG1hY3JvcywgYW5kCj4gPiA+IHN0
YXJ0aW5nIHRvIGNvbnZlcnQgdG8gdGhvc2UuIFsxXQo+ID4gPgo+ID4KPiA+IFRoaXMgc291bmRz
IGdvb2QgdG8gbWUsIEknZCBtdWNoIHByZWZlciB0aGUgbm9uLWNhcHMgdmVyc2lvbnMgb2YgdGhl
c2UKPiA+IGZ1bmN0aW9ucy4gU28gbGV0J3Mgd2FpdCBmb3IgdGhvc2UgdG8gYnViYmxlIHVwIGFu
ZCB0aGVuIGNvbnZlcnQgcm9ja2NoaXAgdG8KPiA+IGRybV9kZXZfKgo+IAo+IENhcmUgdG8gYWNr
IEphbmkncyBwYXRjaCBkaXJlY3RseSwgc28gdGhpcyBpcyBhbGwgZm9ybWFsPwoKSSBqdXN0IHRp
bWUgdHJhdmVsZWQgdG8gbGFzdCB3ZWVrIGFuZCBhY2tlZCB0aGUgd2hvbGUgc2VyaWVzIDopCgpT
ZWFuCgo+IAo+IEphbmksIGNhbiB5b3UgcGxzIGFsc28gYWRkIGEgdG9kby5yc3QgcGF0Y2ggb24g
dG9wIHRvIGFkanVzdCB0aGUKPiByZWxldmFudCBpdGVtIHRvIHRoZSBuZXcgY29sb3IgY2hvaWNl
Pwo+IAo+IFdhbWJ1aSwgSSBndWVzcyBzbGlnaHQgY2hhbmdlIG9mIHBsYW5zLCBpdCBoYXBwZW5z
IC4uLgo+IAo+IENoZWVycywgRGFuaWVsCj4gCj4gPgo+ID4gU2Vhbgo+ID4KPiA+ID4gQlIsCj4g
PiA+IEphbmkuCj4gPiA+Cj4gPiA+Cj4gPiA+IFsxXSBodHRwOi8vcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZy9wYXRjaC9tc2dpZC82M2QxZTcyYjk5ZTljMTNlZTViMWIzNjJhNjUzZmY5YzIxZTE5
MTI0LjE1NzIyNTg5MzYuZ2l0LmphbmkubmlrdWxhQGludGVsLmNvbQo+ID4gPgo+ID4gPgo+ID4g
Pgo+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gV2FtYnVpIEthcnVnYSAoMik6Cj4gPiA+ID4gICBkcm0v
cHJpbnQ6IGFkZCBEUk1fREVWX1dBUk4gbWFjcm8KPiA+ID4gPiAgIGRybS9yb2NrY2hpcDogdXNl
IERSTV9ERVZfV0FSTiBtYWNybyBpbiBkZWJ1ZyBvdXRwdXQKPiA+ID4gPgo+ID4gPiA+ICBkcml2
ZXJzL2dwdS9kcm0vcm9ja2NoaXAvaW5ub19oZG1pLmMgfCAzICsrLQo+ID4gPiA+ICBpbmNsdWRl
L2RybS9kcm1fcHJpbnQuaCAgICAgICAgICAgICAgfCA5ICsrKysrKysrKwo+ID4gPiA+ICAyIGZp
bGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4KPiA+ID4g
LS0KPiA+ID4gSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgo+
ID4KPiA+IC0tCj4gPiBTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJv
bWl1bSBPUwo+IAo+IAo+IAo+IC0tIAo+IERhbmllbCBWZXR0ZXIKPiBTb2Z0d2FyZSBFbmdpbmVl
ciwgSW50ZWwgQ29ycG9yYXRpb24KPiArNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9n
LmZmd2xsLmNoCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hy
b21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

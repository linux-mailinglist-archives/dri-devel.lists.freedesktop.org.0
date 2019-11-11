Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE0FF6F32
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 08:44:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7796E182;
	Mon, 11 Nov 2019 07:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58326E182
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 07:44:19 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id e6so13510678wrw.1
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2019 23:44:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=hBbBXxtB4JGrAZVYwMzrM6N5+DTJrDtT85S5KcS/BSo=;
 b=ESRoENNbepYXaCcvH05efElMCjdKXAlOllgtGeDpXCcVDzewlQJ7FWOdGXb3M57FXv
 KDkKI9X0Fx813VtU5CeTa6BngO3Mju0Qr/gbQTTEkOLbEUuI7P7tXEAb1Ixll/fxX70c
 OOUFXS4eAwxBkQ9uxTU39+y1X7vMyL5vNFgDQMWEhSFl2rE0r71wMJhg8zwTmrpvl8NO
 RrnUIf8cEoGqtb7TB7H75x5R9qnUb/NxvCSMgWp6qKTLZOdjEFBgEffN+lcnzNzTKjcf
 oLMzMQ6mCOxKyDr0smWajKC+Fo8IkhKzDIUUtsp/OOQ3xuAvtfI5VLT2r9ajHD/aKRBo
 hBcw==
X-Gm-Message-State: APjAAAUpBqmVZII6r7T1dCO4HxXn/K2Q1iVkyzRbo9inFn9z6o9Pto6n
 9hIOMVkB5hV05eDJUvohcL9fdA==
X-Google-Smtp-Source: APXvYqxSsd7eDpxdDNpxnC/L7qzZ+aHe+8v5YGClauimnF6TLrUu+Mb9R+pXcwC92caBEU1o4oxL7A==
X-Received: by 2002:adf:b686:: with SMTP id j6mr19230608wre.186.1573458258403; 
 Sun, 10 Nov 2019 23:44:18 -0800 (PST)
Received: from dell ([95.147.198.88])
 by smtp.gmail.com with ESMTPSA id 189sm3187351wme.28.2019.11.10.23.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Nov 2019 23:44:17 -0800 (PST)
Date: Mon, 11 Nov 2019 07:44:10 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v7 0/9] backlight: gpio: simplify the driver
Message-ID: <20191111074410.GD18902@dell>
References: <20191022083630.28175-1-brgl@bgdev.pl>
 <CAMRc=MeyrDZgmHJ+2SMipP7y9NggxiVfkAh4kCLePFWvUku9aQ@mail.gmail.com>
 <20191023155941.q563d3cfizre4zvt@holly.lan>
 <20191024064726.GB15843@dell>
 <20191024071703.6keoebzlfnn2qmyd@uno.localdomain>
 <20191101085803.GD5700@dell>
 <20191101154133.qqjj3uriwrl2j5r5@uno.localdomain>
 <CAMRc=MejNQAPUXQkJsVFBxcQUJ83xRF0ntKM2ssnAxc1C+7Jjg@mail.gmail.com>
 <CAMRc=Meh1jdc562bTHEfodyud7B0dBM+Lti3ZaCBUaqOjDhaCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRc=Meh1jdc562bTHEfodyud7B0dBM+Lti3ZaCBUaqOjDhaCQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=hBbBXxtB4JGrAZVYwMzrM6N5+DTJrDtT85S5KcS/BSo=;
 b=bLNmAwmlYqMOXoRD7nIagqUBAznwl4rTE7PVm7hKKWihFmJN69jpPWmeMnxrRIpKJ7
 WriR09Zo4VYj5FBB0WhZzZvDP5IzS2hi0oCUphMP4CAY9fawe6Q/0A0XtBPdUVXdmDC2
 +v4p+fD+YLPYL6jkkNERCvIGgqVu26f+gEdQEn2bUS3S4uTPpOIGwlU2mf79ZaLg/Clj
 CYPBm+ThN/pHZ2PmrMtOyuDW7RqgEexOftCPM9I9o61SafRgyKUBHylqeBqzAmtTS87P
 eXNKZHSFcyRn+PmyGts7VRsCL+TSlFbZQK0XPWUlRVA1oLkP7J/hJ+B4AJ/bE0PEPDOr
 BueA==
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux-sh list <linux-sh@vger.kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jacopo Mondi <jacopo@jmondi.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAwOCBOb3YgMjAxOSwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKCj4gcG9uLiwg
NCBsaXMgMjAxOSBvIDEwOjIyIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAYmdkZXYucGw+IG5h
cGlzYcWCKGEpOgo+ID4KPiA+IHB0LiwgMSBsaXMgMjAxOSBvIDE2OjM5IEphY29wbyBNb25kaSA8
amFjb3BvQGptb25kaS5vcmc+IG5hcGlzYcWCKGEpOgo+ID4gPgo+ID4gPiBIZWxsbywKPiA+ID4g
ICBhcyBwcm9taXNlZC4uLgo+ID4gPgo+ID4gPiBPbiBGcmksIE5vdiAwMSwgMjAxOSBhdCAwODo1
ODowM0FNICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiA+ID4gT24gVGh1LCAyNCBPY3QgMjAx
OSwgSmFjb3BvIE1vbmRpIHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gPiBIZWxsbywKPiA+ID4gPiA+
Cj4gPiA+ID4gPiBPbiBUaHUsIE9jdCAyNCwgMjAxOSBhdCAwNzo0NzoyNkFNICswMTAwLCBMZWUg
Sm9uZXMgd3JvdGU6Cj4gPiA+ID4gPiA+IE9uIFdlZCwgMjMgT2N0IDIwMTksIERhbmllbCBUaG9t
cHNvbiB3cm90ZToKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBPbiBUdWUsIE9jdCAyMiwgMjAx
OSBhdCAxMToyOTo1NEFNICswMjAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gPiA+
ID4gPiA+ID4gd3QuLCAyMiBwYcW6IDIwMTkgbyAxMDozNiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxi
cmdsQGJnZGV2LnBsPiBuYXBpc2HFgihhKToKPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
PiA+ID4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNv
bT4KPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gV2hpbGUgd29ya2luZyBvbiBt
eSBvdGhlciBzZXJpZXMgcmVsYXRlZCB0byBncGlvLWJhY2tsaWdodFsxXSBJIG5vdGljZWQKPiA+
ID4gPiA+ID4gPiA+ID4gdGhhdCB3ZSBjb3VsZCBzaW1wbGlmeSB0aGUgZHJpdmVyIGlmIHdlIG1h
ZGUgdGhlIG9ubHkgdXNlciBvZiBwbGF0Zm9ybQo+ID4gPiA+ID4gPiA+ID4gPiBkYXRhIHVzZSBH
UElPIGxvb2t1cHMgYW5kIGRldmljZSBwcm9wZXJ0aWVzLiBUaGlzIHNlcmllcyB0cmllcyB0byBk
bwo+ID4gPiA+ID4gPiA+ID4gPiB0aGF0Lgo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
ID4gPiBGaXJzdCB0d28gcGF0Y2hlcyBjb250YWluIG1pbm9yIGZpeGVzLiBUaGlyZCBwYXRjaCBt
YWtlcyB0aGUgZHJpdmVyCj4gPiA+ID4gPiA+ID4gPiA+IGV4cGxpY2l0bHkgZHJpdmUgdGhlIEdQ
SU8gbGluZS4gRm91cnRoIHBhdGNoIGFkZHMgYWxsIG5lY2Vzc2FyeSBkYXRhCj4gPiA+ID4gPiA+
ID4gPiA+IHN0cnVjdHVyZXMgdG8gZWNvdmVjMjQuIFBhdGNoIDUvOSB1bmlmaWVzIG11Y2ggb2Yg
dGhlIGNvZGUgZm9yIGJvdGgKPiA+ID4gPiA+ID4gPiA+ID4gcGRhdGEgYW5kIG5vbi1wZGF0YSBj
YXNlcy4gUGF0Y2hlcyA2LTcvOSByZW1vdmUgdW51c2VkIHBsYXRmb3JtIGRhdGEKPiA+ID4gPiA+
ID4gPiA+ID4gZmllbGRzLiBMYXN0IHR3byBwYXRjaGVzIGNvbnRhaW4gYWRkaXRpb25hbCBpbXBy
b3ZlbWVudHMgZm9yIHRoZSBHUElPCj4gPiA+ID4gPiA+ID4gPiA+IGJhY2tsaWdodCBkcml2ZXIg
d2hpbGUgd2UncmUgYWxyZWFkeSBtb2RpZnlpbmcgaXQuCj4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+ID4gPiA+IEkgZG9uJ3QgaGF2ZSBhY2Nlc3MgdG8gdGhpcyBIVyBidXQgaG9wZWZ1bGx5
IHRoaXMgd29ya3MuIE9ubHkgY29tcGlsZQo+ID4gPiA+ID4gPiA+ID4gPiB0ZXN0ZWQuCj4gPiA+
ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+IFsxXSBodHRwczovL2xrbWwub3JnL2xrbWwv
MjAxOS82LzI1LzkwMAo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiB2MSAtPiB2
MjoKPiA+ID4gPiA+ID4gPiA+ID4gLSByZWJhc2VkIG9uIHRvcCBvZiB2NS4zLXJjMSBhbmQgYWRq
dXN0ZWQgdG8gdGhlIHJlY2VudCBjaGFuZ2VzIGZyb20gQW5keQo+ID4gPiA+ID4gPiA+ID4gPiAt
IGFkZGVkIGFkZGl0aW9uYWwgdHdvIHBhdGNoZXMgd2l0aCBtaW5vciBpbXByb3ZlbWVudHMKPiA+
ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gdjIgLT4gdjM6Cj4gPiA+ID4gPiA+ID4g
PiA+IC0gaW4gcGF0Y2ggNy83OiB1c2VkIGluaXRpYWxpemVycyB0byBzZXQgdmFsdWVzIGZvciBw
ZGF0YSBhbmQgZGV2IGxvY2FsIHZhcnMKPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+
ID4gdjMgLT4gdjQ6Cj4gPiA+ID4gPiA+ID4gPiA+IC0gcmViYXNlZCBvbiB0b3Agb2YgdjUuNC1y
YzEKPiA+ID4gPiA+ID4gPiA+ID4gLSByZW1vdmVkIGNoYW5nZXMgdGhhdCBhcmUgbm8gbG9uZ2Vy
IHJlbGV2YW50IGFmdGVyIGNvbW1pdCBlYzY2NWI3NTZlNmYKPiA+ID4gPiA+ID4gPiA+ID4gICAo
ImJhY2tsaWdodDogZ3Bpby1iYWNrbGlnaHQ6IENvcnJlY3QgaW5pdGlhbCBwb3dlciBzdGF0ZSBo
YW5kbGluZyIpCj4gPiA+ID4gPiA+ID4gPiA+IC0gYWRkZWQgcGF0Y2ggNy83Cj4gPiA+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+IHY0IC0+IHY1Ogo+ID4gPiA+ID4gPiA+ID4gPiAtIGlu
IHBhdGNoIDcvNzogYWRkZWQgYSBjb21tZW50IHJlcGxhY2luZyB0aGUgbmFtZSBvZiB0aGUgZnVu
Y3Rpb24gYmVpbmcKPiA+ID4gPiA+ID4gPiA+ID4gICBwdWxsZWQgaW50byBwcm9iZSgpCj4gPiA+
ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+IHY1IC0+IHY2Ogo+ID4gPiA+ID4gPiA+ID4g
PiAtIGFkZGVkIGEgcGF0Y2ggbWFraW5nIHRoZSBkcml2ZXIgZXhwbGljaXRseSBzZXQgdGhlIGRp
cmVjdGlvbiBvZiB0aGUgR1BJTwo+ID4gPiA+ID4gPiA+ID4gPiAgIHRvIG91dHB1dAo+ID4gPiA+
ID4gPiA+ID4gPiAtIGFkZGVkIGEgcGF0Y2ggcmVtb3ZpbmcgYSByZWR1bmRhbnQgbmV3bGluZQo+
ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiB2NiAtPiB2NzoKPiA+ID4gPiA+ID4g
PiA+ID4gLSByZW5hbWVkIHRoZSBmdW5jdGlvbiBjYWxjdWxhdGluZyB0aGUgbmV3IEdQSU8gdmFs
dWUgZm9yIHN0YXR1cyB1cGRhdGUKPiA+ID4gPiA+ID4gPiA+ID4gLSBjb2xsZWN0ZWQgbW9yZSB0
YWdzCj4gPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiA+IEJhcnRvc3ogR29sYXN6ZXdz
a2kgKDkpOgo+ID4gPiA+ID4gPiA+ID4gPiAgIGJhY2tsaWdodDogZ3BpbzogcmVtb3ZlIHVubmVl
ZGVkIGluY2x1ZGUKPiA+ID4gPiA+ID4gPiA+ID4gICBiYWNrbGlnaHQ6IGdwaW86IHJlbW92ZSBz
dHJheSBuZXdsaW5lCj4gPiA+ID4gPiA+ID4gPiA+ICAgYmFja2xpZ2h0OiBncGlvOiBleHBsaWNp
dGx5IHNldCB0aGUgZGlyZWN0aW9uIG9mIHRoZSBHUElPCj4gPiA+ID4gPiA+ID4gPiA+ICAgc2g6
IGVjb3ZlYzI0OiBhZGQgYWRkaXRpb25hbCBwcm9wZXJ0aWVzIHRvIHRoZSBiYWNrbGlnaHQgZGV2
aWNlCj4gPiA+ID4gPiA+ID4gPiA+ICAgYmFja2xpZ2h0OiBncGlvOiBzaW1wbGlmeSB0aGUgcGxh
dGZvcm0gZGF0YSBoYW5kbGluZwo+ID4gPiA+ID4gPiA+ID4gPiAgIHNoOiBlY292ZWMyNDogZG9u
J3Qgc2V0IHVudXNlZCBmaWVsZHMgaW4gcGxhdGZvcm0gZGF0YQo+ID4gPiA+ID4gPiA+ID4gPiAg
IGJhY2tsaWdodDogZ3BpbzogcmVtb3ZlIHVudXNlZCBmaWVsZHMgZnJvbSBwbGF0Zm9ybSBkYXRh
Cj4gPiA+ID4gPiA+ID4gPiA+ICAgYmFja2xpZ2h0OiBncGlvOiB1c2UgYSBoZWxwZXIgdmFyaWFi
bGUgZm9yICZwZGV2LT5kZXYKPiA+ID4gPiA+ID4gPiA+ID4gICBiYWNrbGlnaHQ6IGdwaW86IHB1
bGwgZ3Bpb19iYWNrbGlnaHRfaW5pdGlhbF9wb3dlcl9zdGF0ZSgpIGludG8gcHJvYmUKPiA+ID4g
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gIGFyY2gvc2gvYm9hcmRzL21hY2gtZWNvdmVj
MjQvc2V0dXAuYyAgICAgICAgIHwgIDMzICsrKy0tCj4gPiA+ID4gPiA+ID4gPiA+ICBkcml2ZXJz
L3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jICAgICB8IDEyOCArKysrKysrLS0tLS0t
LS0tLS0tCj4gPiA+ID4gPiA+ID4gPiA+ICBpbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvZ3Bp
b19iYWNrbGlnaHQuaCB8ICAgMyAtCj4gPiA+ID4gPiA+ID4gPiA+ICAzIGZpbGVzIGNoYW5nZWQs
IDY5IGluc2VydGlvbnMoKyksIDk1IGRlbGV0aW9ucygtKQo+ID4gPiA+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IExlZSwgRGFuaWVs
LCBKaW5nb28sCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gSmFjb3BvIGlzIHRyYXZl
bGxpbmcgdW50aWwgTm92ZW1iZXIgMXN0IGFuZCB3b24ndCBiZSBhYmxlIHRvIHRlc3QgdGhpcwo+
ID4gPiA+ID4gPiA+ID4gYWdhaW4gYmVmb3JlIHRoaXMgZGF0ZS4gRG8geW91IHRoaW5rIHlvdSBj
YW4gcGljayBpdCB1cCBhbmQgaW4gY2FzZQo+ID4gPiA+ID4gPiA+ID4gYW55dGhpbmcncyBicm9r
ZW4gb24gU0gsIHdlIGNhbiBmaXggaXQgYWZ0ZXIgdjUuNS1yYzEsIHNvIHRoYXQgaXQKPiA+ID4g
PiA+ID4gPiA+IGRvZXNuJ3QgbWlzcyBhbm90aGVyIG1lcmdlIHdpbmRvdz8KPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gTm92ZW1iZXIgMXN0ICgtcmM2KSB3aWxsIGJlIGZpbmUuCj4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+IEknZCByYXRoZXIgYXBwbHkgaXQgbGF0ZS10ZXN0ZWQgdGhhbiBlYXJseS1u
b24tdGVzdGVkLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBIb3BlZnVsbHkgSmFjb3BvIGNhbiBw
cmlvcml0aXNlIHRlc3RpbmcgdGhpcyBvbiBUaHVyc2RheSBvciBGcmlkYXksCj4gPiA+ID4gPiA+
IHNpbmNlIE1vbmRheSB3aWxsIGJlIC1yYzcgd2hpY2ggaXMgcmVhbGx5IGN1dHRpbmcgaXQgZmlu
ZS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJJ2xsIGRvIG15IGJlc3QsIEknbGwgZ2V0IGhvbWUgRnJp
ZGF5IGxhdGUgYWZ0ZXJub29uIDopCj4gPiA+ID4KPiA+ID4gPiBXZWxjb21lIGhvbWUhCj4gPiA+
ID4KPiA+ID4gPiBKdXN0IGEgbGl0dGxlIHJlbWluZGVyIGluIHlvdXIgaW5ib3guIFRJQS4gOikK
PiA+ID4KPiA+ID4gRm9yIHRoZSBlY292ZWMgcGFydDoKPiA+ID4gVGVzdGVkLWJ5OiBKYWNvcG8g
TW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Cj4gPiA+Cj4gPgo+ID4gVGhhbmtzIEph
Y29wbyEKPiA+Cj4gPiBMZWU6IEkgaG9wZSBpdCdzIG5vdCB0b28gbGF0ZSB0byBnZXQgaXQgcGlj
a2VkIHVwIGZvciB2NS41Pwo+ID4KPiAKPiBIaSwganVzdCBhIGdlbnRsZSBwaW5nIGZvciB0aGlz
IHNlcmllcywgYmVjYXVzZSBJJ20gYWZyYWlkIGl0IHdpbGwKPiBtaXNzIHlldCBhbm90aGVyIG1l
cmdlIHdpbmRvdy4KCkkgaGF2ZSBpdCBtYXJrZWQgdG8gaGFuZGxlIGl0LCBhbG9uZyB3aXRoIDEw
J3Mgb2Ygb3RoZXJzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMg
VGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFS
TSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

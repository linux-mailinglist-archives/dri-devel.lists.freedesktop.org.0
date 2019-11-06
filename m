Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D75F0C39
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 03:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDABD6EBCC;
	Wed,  6 Nov 2019 02:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7DD6EBCC;
 Wed,  6 Nov 2019 02:50:34 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id j5so16759179lfh.10;
 Tue, 05 Nov 2019 18:50:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YHCkeAV6i45vQRhsU0OYl7l+Zq6VU3sxE4NCBPFgs4c=;
 b=gcpfbsmTNjHmI398i2s6fHKQ+LfyIwfPICzTqYBWpBWGPVWcHT2XBCJV+UYSHN6vcz
 kRqUVpNH4i928TkOz/r5lu5DkWxVbfeFAv2hOwVNpE/HM1eAP8GvGsXzixR3BFu0akEe
 6cmIPNk0D/gNpmMChgpRbasLvFp199iNwhDJPuwlTwgxj1vRK/gJP9QUbqSKv35paV46
 Cf+6fS725L8EiuHpTyv98gxJJfVaOzphDg4WxUrig6o/FzH69SFUC/NlggvbiEfr5Yzf
 aVCaB08/kH76zqyI6lnhKwymvkZ+MPKbhcgdgrY57hS0HM0UBoJmarj5Qo2uIvBrD3vK
 mxJA==
X-Gm-Message-State: APjAAAUMS0EaNB+9cn+lcj+55behUwOSORKPCcM9FvD58qnaDD7xAKQB
 F+NoJEgRBoeatd/oqp/Xl5brGvUgwaQfqaOFuKdu1w==
X-Google-Smtp-Source: APXvYqz/bemD3vCHmsTIg9kSOpSkoE7oGZdyEilvNxbACmw1xhSv0X1bPDo3I443fbE97MOCu3a4whFEJRNUso+Lf54=
X-Received: by 2002:ac2:5bca:: with SMTP id u10mr22943551lfn.134.1573008632332; 
 Tue, 05 Nov 2019 18:50:32 -0800 (PST)
MIME-Version: 1.0
References: <20191031214839.27039-1-manasi.d.navare@intel.com>
 <20191104091808.GA10326@phenom.ffwll.local>
 <CAMwc25oYjL3K7dcikX-oM_Y4ZP1ZRwUDKvsKO69vg81ZU6Xg8A@mail.gmail.com>
 <20191104210335.GB32264@intel.com>
In-Reply-To: <20191104210335.GB32264@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 6 Nov 2019 12:50:21 +1000
Message-ID: <CAPM=9tyEy5aPis7AApd5rsOuE=MWUqjpd4UPf=FA7=KA-Ec8ag@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/fbdev: Fallback to non tiled mode if all
 tiles not present
To: Manasi Navare <manasi.d.navare@intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YHCkeAV6i45vQRhsU0OYl7l+Zq6VU3sxE4NCBPFgs4c=;
 b=YRoPlDEv6mOD1JLFtYVraC0juC4q5QwAdyJQ/36XQ7Dn3gvsSt3cHRj9lG9T/SQeaK
 cv9B5KPy2zlnweUKHlto4kR+ethLX72D6y0qcLy1yZzlTcNxah9CvqP6nTTd1MPJFXJB
 pEo5gOcAVzhlt/NAUku59PLT0GNGv1YdZt1fX9aPlr+CXkQX6N+qpUUXshknjbBgz80h
 7FZE+wC6XYI/rtQ8OuykW/yuEhQ4wdEtw7UG1lgm9iXZFwLK2kMyuYDyv7UR56Tq10q5
 NIOCvTg3xutBda4HBCAq1AiK/oinhpFa0s8Cw8Wu3EbMsI8uW1M8hK/VUTwCxTAC/pg8
 v1eg==
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
Cc: David Airlie <airlied@redhat.com>, "Development,
 Intel" <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCA1IE5vdiAyMDE5IGF0IDA3OjAwLCBNYW5hc2kgTmF2YXJlIDxtYW5hc2kuZC5uYXZh
cmVAaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgTm92IDA0LCAyMDE5IGF0IDA3OjQ4OjI2
UE0gKzEwMDAsIERhdmlkIEFpcmxpZSB3cm90ZToKPiA+IE9uIE1vbiwgTm92IDQsIDIwMTkgYXQg
NzoxOCBQTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyb3RlOgo+ID4gPgo+ID4g
PiBPbiBUaHUsIE9jdCAzMSwgMjAxOSBhdCAwMjo0ODozOVBNIC0wNzAwLCBNYW5hc2kgTmF2YXJl
IHdyb3RlOgo+ID4gPiA+IEluIGNhc2Ugb2YgdGlsZWQgZGlzcGxheXMsIGlmIHdlIGhvdHBsdWcg
anVzdCBvbmUgY29ubmVjdG9yLAo+ID4gPiA+IGZiY29uIGN1cnJlbnRseSBqdXN0IHNlbGVjdHMg
dGhlIHByZWZlcnJlZCBtb2RlIGFuZCBpZiBpdCBpcwo+ID4gPiA+IHRpbGVkIG1vZGUgdGhlbiB0
aGF0IGJlY29tZXMgYSBwcm9ibGVtIGlmIHJlc3Qgb2YgdGhlIHRpbGVzIGFyZQo+ID4gPiA+IG5v
dCBwcmVzZW50Lgo+ID4gPiA+IFNvIGluIHRoZSBmYmRldiBkcml2ZXIgb24gaG90cGx1ZyB3aGVu
IHdlIHByb2JlIHRoZSBjbGllbnQgbW9kZXNldCwKPiA+ID4gPiB3ZSB3ZSBkb250IGZpbmQgYWxs
IHRoZSBjb25uZWN0b3JzIGZvciBhbGwgdGlsZXMsIHRoZW4gb24gYSBjb25uZWN0b3IKPiA+ID4g
PiB3aXRoIG9uZSB0aWxlLCBqdXN0IGZhbGxiYWNrIHRvIHRoZSBmaXJzdCBhdmFpbGFibGUgbm9u
IHRpbGVkIG1vZGUKPiA+ID4gPiB0byBkaXNwbGF5IG92ZXIgYSBzaW5nbGUgY29ubmVjdG9yLgo+
ID4gPiA+Cj4gPiA+ID4gU3VnZ2VzdGVkLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tPgo+ID4gPiA+IFN1Z2dlc3RlZC1ieTogRGF2ZSBBaXJsaWUgPGFp
cmxpZWRAcmVkaGF0LmNvbT4KPiA+ID4gPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4KPiA+ID4gPiBDYzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVk
aGF0LmNvbT4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYW5hc2kgTmF2YXJlIDxtYW5hc2kuZC5u
YXZhcmVAaW50ZWwuY29tPgo+ID4gPgo+ID4gPiBIbSwgc2hvdWxkIHdlIG1heWIgaGF2ZSBhIHNs
aWdodCB0aW1lb3V0IGZpcnN0IHRvIHdhaXQgZm9yIHRoZSAybmQKPiA+ID4gY29ubmVjdG9yPyBP
dGhlcndpc2UgbG90cyBvZiBmbGlja2VyaW5nIGdvaW5nIG9uIHdoZW4gcGx1Z2dpbmcgaW4gb25l
IG9mCj4gPiA+IHRoZXNlIHNjcmVlbnMgLi4uCj4gPgo+ID4gTm90IHJlYWxseSwKPiA+Cj4gPiBU
aGVyZSBhcmUgMyBzY2VuYXJpb3Mgd2l0aCB0aGUgbXVsdGktY2FibGUgdGlsZWQgbW9uaXRvcnMu
IGFuZAo+ID4gbm9uLXJlc2l6ZWFibGUgZmJkZXYuCj4gPgo+ID4gYSkgaXQncyBwbHVnZ2VkIGlu
IGF0IGJvb3QuIGJvdGggY2FibGVzIGFyZSBkZXRlY3RlZCwgZmJkZXYgZ2V0cyBhCj4gPiBmdWxs
IHRpbGVkIG1vZGUuCj4KPiBZZXMgdGhpcyB3b3JrcyBhcyBleHBlY3RlZAo+Cj4gPiBiKSBpdCdz
IG5vdCBwbHVnZ2VkIGluIGF0IGJvb3QsIHRoZSB1c2VyIHN0YXJ0cyBwbHVnZ2luZyBpdCBpbiwg
ZmJkZXYKPiA+IHdhcyBpbml0ZWQgdmlhIHRoZSBwYW5lbCBvciBhbm90aGVyIG1vbml0b3IuIGZi
ZGV2IHdvbid0IHJlc2l6ZS4KPiA+IGMpIGl0J3MgaGFsZiBwbHVnZ2VkIGluIGF0IGJvb3QsIHRo
ZW4geW91IGdldCBhIG5vbi10aWxlZCBtb2RlLCBhbmQKPiA+IGZiZGV2IGNhbid0IHJlc2l6ZSB0
byB0aWxlZCBhbnl3YXlzLgo+Cj4gSW4gYiBhbmQgYywgd2hlbiBpdHMgYm9vdGVkIHdpdGggb25s
eSAxIGNhYmxlIGNvbm5lY3RlZCBhbmQvb3IgaG90cGx1Z2dlZCBvbmx5Cj4gb25lIGNhYmxlIGFm
dGVyIGJvb3QsIEkgZmFsbGJhY2sgdG8gZmlzcnQgYXZhaWxhYmxlIG5vbiB0aWxlZCBtb2RlLCBk
b2VzIHRoYXQgc291bmQgZ29vZD8KPgo+ID4KPiA+IEFsc28gcGx1Z2dpbmcgaW4gb25lIG9mIHRo
ZXNlIG11bHRpLWNhYmxlIG1vbml0b3JzIHBpZWNlbWVhbCBpcyBnb2luZwo+ID4gdG8gdGFrZSBt
dWx0aXBsZSBzZWNvbmRzIGZvciB0aGUgdXNlciB0byBkbyBwaHlzaWNhbCBjYWJsZSBwbHVnZ2lu
Zy4KPgo+IFNvIHN0aWxsIGdvb2Qgd2l0aCBpZ25vcmluZyB0aGUgc2Vjb25kIGhvdHBsdWcgY29t
cGxldGVseT8KPiBIb3dldmVyIGkgZG9ubm8gd2hlcmUgaW4gdGhlIGZiIGhlbHBlciB0byBzdG9w
IHBhc3NpbmcgdGhlIG1vZGVzZXQgZG93bgo+IGFmdGVyIHRoZSBkcm1fZmJfaGVscGVyX2hvdHBs
dWdfZXZlbnQoKQoKSSBkb24ndCB0aGluayB5b3UgY2FuIGlnbm9yZSBpdCBjb21wbGV0ZWx5LiBJ
IHRoaW5rIHlvdSBqdXN0IGhhdmUgdG8KbWFrZSB0aGUgbW9kZSBwaWNraW5nIGxvZ2ljIHBpY2sg
dGhlIHJpZ2h0IGFuc3dlciBzb21laG93LgoKU28geW91IGNhbiB0ZWxsIGlmIHdpZHRoL2hlaWdo
dCBhcmUgZ29pbmcgdG8gYmUgbG93ZXIgdGhhbiB0aGUgdGlsZWQKbW9kZSBzaXplLCBhbmQgaW4g
dGhhdCBjYXNlIGp1c3QgZG9uJ3QgZW5hYmxlIHRoZSBzZWNvbmRhcnkgdGlsZS4KCkRhdmUuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DD3AEB5B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 15:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51C76E0A8;
	Tue, 10 Sep 2019 13:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
 [209.85.222.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02396E0A8;
 Tue, 10 Sep 2019 13:22:00 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id f9so5543392uaj.4;
 Tue, 10 Sep 2019 06:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KYVkHQgXHSjuSluWOjOjLNUKGxCka03j/MeZVer5aw0=;
 b=tXgAfZ0tjdfUZNelkdBySllSz8ULrs7y0Xa7zxh0GM8qaeSDhZttTVsXQ4p49f7+82
 XGz9Qe02oCIheLaAsuZqFM7EFXTz1zlLgLBfzpCxIF4D0hPpfO25JIkZHZozhsNvrQ7s
 hoBqRwK7gcb4zngl5SS9GPmFW4cAozDw1qlkW8F9Ppxhd+CDCjOxyjZkctaYe1742Lxm
 QKOj0EtwO/VO3Jb8RCaUEPsps+sLEGVTiPM8yZIeNEsgN9w5rtKgaE2lR5KPrKjH1Avl
 Yqa0SO+lT7QXAVi65w39wXlj8XS34D9iWO9fsUb2HWo9lF53S04op2gknSVsepbmvsYo
 3FJQ==
X-Gm-Message-State: APjAAAUs60YkhjWEy+Nro3+hYVjK3ZMLAKf61EZiFTlBPq9D/n5LBPxy
 pD02JTEAB5YcQzz/1JVGHpvPX/Pm86Mm+vV9khLhmoIS
X-Google-Smtp-Source: APXvYqyRCdPSH/yDkDPE3/mQHnifNJ1edpONJaUOjvkl31pxq/g+nJsFTGpUE0FnJlpXCQ/bhyX/IAnuUdNWrt2oeQk=
X-Received: by 2002:ab0:13c9:: with SMTP id n9mr6178275uae.58.1568121719725;
 Tue, 10 Sep 2019 06:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190903091235.32304-1-gwan-gyeong.mun@intel.com>
 <20190903091235.32304-4-gwan-gyeong.mun@intel.com>
 <CAKb7Uvi4aO-im=cBi_xy8QoDhUXsJmuxcL8ewOrMvFbky9Je0g@mail.gmail.com>
 <E7C9878FBA1C6D42A1CA3F62AEB6945F821DC31F@BGSMSX104.gar.corp.intel.com>
 <20190906114255.GS7482@intel.com>
 <CAKb7UvjdjrVtueEDM+eij0LvCrdAbwzUyNpbPde=AZ-7Dega2A@mail.gmail.com>
 <23376377793be0aecd14e08f6cbda7f699a5c761.camel@intel.com>
 <CAKb7UviqX5G2s-YJeXULe1Cg0oO1+auQZpONUbbm0JsQccfwHQ@mail.gmail.com>
 <7f4e42bdaaf50390314ee8e9c4f94183df1bd0a1.camel@intel.com>
In-Reply-To: <7f4e42bdaaf50390314ee8e9c4f94183df1bd0a1.camel@intel.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 10 Sep 2019 09:21:48 -0400
Message-ID: <CAKb7UviVKHcRMeXzpg6Nh9f4iQFiFpHfoaSkP6PghL3irCoSvA@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] drm: Add DisplayPort colorspace property
To: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMzozNCBBTSBNdW4sIEd3YW4tZ3llb25nCjxnd2FuLWd5
ZW9uZy5tdW5AaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFNhdCwgMjAxOS0wOS0wNyBhdCAyMTo0
MyAtMDQwMCwgSWxpYSBNaXJraW4gd3JvdGU6Cj4gPiBPbiBTYXQsIFNlcCA3LCAyMDE5IGF0IDc6
MjAgUE0gTXVuLCBHd2FuLWd5ZW9uZwo+ID4gPGd3YW4tZ3llb25nLm11bkBpbnRlbC5jb20+IHdy
b3RlOgo+ID4gPiBPbiBGcmksIDIwMTktMDktMDYgYXQgMDk6MjQgLTA0MDAsIElsaWEgTWlya2lu
IHdyb3RlOgo+ID4gPiA+IE9uIEZyaSwgU2VwIDYsIDIwMTkgYXQgNzo0MyBBTSBWaWxsZSBTeXJq
w6Rsw6QKPiA+ID4gPiA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4g
PiA+ID4gT24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMTE6MzE6NTVBTSArMDAwMCwgU2hhbmthciwg
VW1hIHdyb3RlOgo+ID4gPiA+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiA+
ID4gPiA+ID4gRnJvbTogSWxpYSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQuZWR1Pgo+ID4gPiA+
ID4gPiA+IFNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAzLCAyMDE5IDY6MTIgUE0KPiA+ID4gPiA+
ID4gPiBUbzogTXVuLCBHd2FuLWd5ZW9uZyA8Z3dhbi1neWVvbmcubXVuQGludGVsLmNvbT4KPiA+
ID4gPiA+ID4gPiBDYzogSW50ZWwgR3JhcGhpY3MgRGV2ZWxvcG1lbnQgPAo+ID4gPiA+ID4gPiA+
IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4gPiA+ID4gPiA+IDsgU2hhbmth
ciwgVW1hCj4gPiA+ID4gPiA+ID4gPHVtYS5zaGFua2FyQGludGVsLmNvbT47IGRyaS1kZXZlbCA8
Cj4gPiA+ID4gPiA+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4KPiA+ID4gPiA+
ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDMvN10gZHJtOiBBZGQgRGlzcGxheVBvcnQgY29s
b3JzcGFjZQo+ID4gPiA+ID4gPiA+IHByb3BlcnR5Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
PiBTbyBob3cgd291bGQgdGhpcyB3b3JrIHdpdGggYSBEUCsrIGNvbm5lY3Rvcj8gU2hvdWxkIGl0
Cj4gPiA+ID4gPiA+ID4gbGlzdAo+ID4gPiA+ID4gPiA+IHRoZSBIRE1JIG9yIERQCj4gPiA+ID4g
PiA+ID4gcHJvcGVydGllcz8gT3IgZG8gd2UgbmVlZCBhIGN1c3RvbSBwcm9wZXJ0eSBjaGVja2Vy
IHdoaWNoCj4gPiA+ID4gPiA+ID4gaXMKPiA+ID4gPiA+ID4gPiBhd2FyZSBvZiB3aGF0IGlzCj4g
PiA+ID4gPiA+ID4gY3VycmVudGx5IHBsdWdnZWQgaW4gdG8gdmFsaWRhdGUgdGhlIHZhbHVlcz8K
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gQUZBSVUgRm9yIERQKysgY2FzZXMsIHdlIGRldGVjdCB3
aGF0IGtpbmQgb2Ygc2luayBpdHMgZHJpdmluZwo+ID4gPiA+ID4gPiBEUAo+ID4gPiA+ID4gPiBv
ciBIRE1JICh3aXRoIGEgcGFzc2l2ZSBkb25nbGUpLgo+ID4gPiA+ID4gPiBCYXNlZCBvbiB0aGUg
dHlwZSBvZiBzaW5rIGRldGVjdGVkLCB3ZSBzaG91bGQgZXhwb3NlIERQIG9yCj4gPiA+ID4gPiA+
IEhETUkKPiA+ID4gPiA+ID4gY29sb3JzcGFjZXMgdG8gdXNlcnNwYWNlLgo+ID4gPiA+ID4KPiA+
ID4gPiA+IEZvciBpOTE1IERQIGNvbm5lY3RvciBhbHdheXMgZHJpdmVzIERQIG1vZGUsIEhETUkg
Y29ubmVjdG9yCj4gPiA+ID4gPiBhbHdheXMKPiA+ID4gPiA+IGRyaXZlcwo+ID4gPiA+ID4gSERN
SSBtb2RlLCBldmVuIHdoZW4gdGhlIHBoeXNpY2FsIGNvbm5lY3RvciBpcyBEUCsrLgo+ID4gPiA+
Cj4gPiA+ID4gUmlnaHQsIGk5MTUgY3JlYXRlcyAyIGNvbm5lY3RvcnMsIHdoaWxlIG5vdXZlYXUs
IHJhZGVvbiwgYW5kCj4gPiA+ID4gYW1kZ3B1Cj4gPiA+ID4gY3JlYXRlIDEgY29ubmVjdG9yIChu
b3Qgc3VyZSBhYm91dCBvdGhlciBkcml2ZXJzKSBmb3IgYSBzaW5nbGUKPiA+ID4gPiBwaHlzaWNh
bCBEUCsrIHNvY2tldC4gU2luY2Ugd2Ugc3VwcGx5IHRoZSBsaXN0IG9mIHZhbGlkIHZhbHVlcyBh
dAo+ID4gPiA+IHRoZQo+ID4gPiA+IHRpbWUgb2YgY3JlYXRpbmcgdGhlIGNvbm5lY3Rvciwgd2Ug
Y2FuJ3Qga25vdyBhdCB0aGF0IHBvaW50Cj4gPiA+ID4gd2hldGhlcgo+ID4gPiA+IGluCj4gPiA+
ID4gdGhlIGZ1dHVyZSBhIEhETUkgb3IgRFAgd2lsbCBiZSBwbHVnZ2VkIGludG8gaXQuCj4gPiA+
ID4KPiA+ID4gPiAgIC1pbGlhCj4gPiA+IElsaWEsIGRvZXMgaXQgbWVhbiB0aGF0IHRoZSBkcm1f
Y29ubmVjdG9yIHR5cGUgaXMKPiA+ID4gRFJNX01PREVfQ09OTkVDVE9SX0Rpc3BsYXlQb3J0IGFu
ZCBwcm90b2NvbCBpcyBEUCsrIG1vZGU/Cj4gPgo+ID4gVGhhdCBpcyBjb3JyZWN0LiBUaGUgY29u
bmVjdG9yIHR5cGUgaXMgIkRpc3BsYXlQb3J0IiBpbiBzdWNoIGEgY2FzZS4KPiA+Cj4gPiBDaGVl
cnMsCj4gPgo+ID4gICAtaWxpYQo+Cj4gRm9yIG5vdyBkcm1fbW9kZV9jcmVhdGVfY29sb3JzcGFj
ZV9wcm9wZXJ0eSgpIGlzIG9ubHkgdXNlZCBmb3IgaTkxNS4KPiBJTUhPLCB3aGVuIG90aGVyIGRy
aXZlcnMgKCBub3V2ZWF1LCByYWRlb24sIGFuZCBhbWRncHUgKSBhcmUgcmVhZHkgZm9yCj4gdXNp
bmcgb2YgZHJtX21vZGVfY3JlYXRlX2NvbG9yc3BhY2VfcHJvcGVydHkoKSwKPiB3aGF0IGFib3V0
IGRvIHdlIGFkZCBhIHZhcmlhYmxlIHdoaWNoIGNhbiBpZGVudGlmeSBEUCsrIGFuZCBEUCB0bwo+
IGRybV9jb25uZWN0b3I/Cj4gQW5kIHdoZW4gdGhlIGRyaXZlcnMgKG5vdXZlYXUsIHJhZGVvbiwg
YW5kIGFtZGdwdSkgZGV0ZWN0IHRoZSBjdXJyZW50Cj4gcHJvdG9jb2wsIHRoZSBkcml2ZXJzIHdp
bGwgc2V0IHRoZSB2YXJpYWJsZS4KCkkndmUgYmVlbiB3b3JraW5nIG9uIGFkZGluZyB0aGlzIHRv
IG5vdXZlYXUuCgpDYW4vc2hvdWxkIHN1Y2ggcHJvcGVydGllcyBiZSBhZGRlZC9yZW1vdmVkIGF0
ICJydW50aW1lIiwgcmF0aGVyIHRoYW4KYXQgY29ubmVjdG9yIGNyZWF0aW9uIHRpbWU/IEVpdGhl
ciB3YXksIHRoZSBmdW5jdGlvbgpkcm1fbW9kZV9jcmVhdGVfY29sb3JzcGFjZV9wcm9wZXJ0eSBh
cyBwcm9wb3NlZCB3b3VsZCBub3QgYmUgcmV1c2FibGUsCnNpbmNlIGl0IGxvb2tzIGF0IHRoZSBj
b25uZWN0b3IgdHlwZSwgd2hpY2ggd2lsbCBhbHdheXMgYmUKIkRpc3BsYXlQb3J0IiBpbiBzdWNo
IGNhc2VzLgoKICAtaWxpYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=

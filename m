Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFAACF3BF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 09:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7326E1F3;
	Tue,  8 Oct 2019 07:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464636E1F8
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 16:19:54 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id t1so2980813ybo.11
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 09:19:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fuxnneegK0n5AQkn3Efg7QQxvRdE8FlI4AZRcfswJc0=;
 b=YS2ykN4HxN1nFTN8pAG+WaNes5xZPsID4B8qN97UnXYqTQJoD7RvTcwkS5nown0QnM
 +Anb/4tb0V2/VyZqMJzCCFWzsuTDEwZiZBysjE5gAwzLQu4NpEBbEUiVu4OR/o5HZTat
 s5q/zPXg1zWFtxACKmSwZ2c9V/1tLmbxfwedCTWNME5/MLYDdvVLS+HCwZQphoThuAZc
 enp+8ht9UfmcEVJiWj3hYlXRdXvXlWqCh1W23aRQ016M48KI9Upv+na0Q25zpBSGg8Kd
 51QVoWNG4E3wY9XTdEOPkPkRahhALTphP6j1F3eQ5MPXiIO/Z5zVSJit5WrOrm4nq0p7
 8P+A==
X-Gm-Message-State: APjAAAW0GhwvSe4YoJuRAOOEsgGad/DHQ0vWYXQ2BoxvLKdFJaYwZAqw
 Dp7zyrGHYX4biSGSBXkliL0cukbKNiIy876At0iWIQ==
X-Google-Smtp-Source: APXvYqwsVP7yARKuOjpTCziICZb3EqEs18JlF2GJwWix24wKGGcr2npXgkv47FEXsEOdQO6ilnSn55kjSDH227sF/7Q=
X-Received: by 2002:a25:df8d:: with SMTP id
 w135mr10874114ybg.453.1570465192707; 
 Mon, 07 Oct 2019 09:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAL_quvRknSSVvXN3q_Se0hrziw2oTNS3ENNoeHYhvciCRq9Yww@mail.gmail.com>
 <87h84rbile.fsf@intel.com> <20191002102428.zaid63hp6wpd7w34@holly.lan>
 <8736gbbf2b.fsf@intel.com>
 <CAL_quvQkFjkBjJC5wH2t5XmyEq9OKWYSbAv39BJWT1hrKO7j8g@mail.gmail.com>
 <87h84q9pcj.fsf@intel.com>
 <CAL_quvQoWnWqS5OQAqbLcBO-bR9_obr1FBc6f6mA1T00n1DJNQ@mail.gmail.com>
 <CAOw6vbJ7XX8=nrJDENfn2pacf4MqQOkP+x8JV0wbqzoMfLvZWQ@mail.gmail.com>
In-Reply-To: <CAOw6vbJ7XX8=nrJDENfn2pacf4MqQOkP+x8JV0wbqzoMfLvZWQ@mail.gmail.com>
From: Mat King <mathewk@google.com>
Date: Mon, 7 Oct 2019 10:19:40 -0600
Message-ID: <CAL_quvTe_v9Vsbd0u4URitojmD-_VFeaOQ1BBYZ_UGwYWynjVA@mail.gmail.com>
Subject: Re: New sysfs interface for privacy screens
To: Sean Paul <seanpaul@chromium.org>
X-Mailman-Approved-At: Tue, 08 Oct 2019 07:28:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=fuxnneegK0n5AQkn3Efg7QQxvRdE8FlI4AZRcfswJc0=;
 b=gggESg/a8iQOk/eiOTYXQcYqkbR3kHUOK4ySOsws+CmrSgKU4qCuh6MRVhVwZrOSqH
 EAVlps2UTDr67pjAIsQp6XjADyOhQByETJApt/rPvGhO4mx+JUJc8a6WCAEw2o94ZVpp
 puHtiiLQI3X9djyBadmRMxRWZJ6Otqn7YHM4X2WzEML79wT25lncdGXCFPMnx3jfFxzI
 WozJkgi2KYnGBwwTGFvSlydzybZrzld2q7kJshd4T/uUKvvgx93IrP8zbRk0jpTeo6+c
 +klcRS1tsciAetBVSSO4cns8cCH1Ox95p+8JHTky6IFRRQ0zFbUEBN3hvRvzwDteUtTk
 sONQ==
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, rafael@kernel.org,
 Greg KH <gregkh@linuxfoundation.org>, Ross Zwisler <zwisler@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jingoo Han <jingoohan1@gmail.com>,
 David Airlie <airlied@redhat.com>, Rajat Jain <rajatja@google.com>,
 Lee Jones <lee.jones@linaro.org>, Alexander Schremmer <alex@alexanderweb.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgNywgMjAxOSBhdCA3OjA5IEFNIFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21p
dW0ub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgT2N0IDMsIDIwMTkgYXQgMzo1NyBQTSBNYXQgS2lu
ZyA8bWF0aGV3a0Bnb29nbGUuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIE9jdCAzLCAyMDE5
IGF0IDI6NTkgQU0gSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IE9uIFdlZCwgMDIgT2N0IDIwMTksIE1hdCBLaW5nIDxtYXRoZXdrQGdv
b2dsZS5jb20+IHdyb3RlOgo+ID4gPiA+IE9uIFdlZCwgT2N0IDIsIDIwMTkgYXQgNDo0NiBBTSBK
YW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKPiA+ID4gPj4K
PiA+ID4gPj4gT24gV2VkLCAwMiBPY3QgMjAxOSwgRGFuaWVsIFRob21wc29uIDxkYW5pZWwudGhv
bXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiA+ID4+ID4gT24gV2VkLCBPY3QgMDIsIDIwMTkg
YXQgMTI6MzA6MDVQTSArMDMwMCwgSmFuaSBOaWt1bGEgd3JvdGU6Cj4gPiA+ID4+ID4+IE9uIFR1
ZSwgMDEgT2N0IDIwMTksIE1hdCBLaW5nIDxtYXRoZXdrQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4g
PiA+PiA+PiA+IFJlc2VuZGluZyBpbiBwbGFpbiB0ZXh0IG1vZGUKPgo+IC9zbmlwCj4KPiA+Cj4g
PiBTbyBteSBwcm9wb3NhbCB3b3VsZCBub3cgYmUgdG8gYWRkIGEgbmV3IHN0YW5kYXJkIHByb3Bl
cnR5IHRvCj4gPiBkcm1fY29ubmVjdG9yIGNhbGxlZCAicHJpdmFjeV9zY3JlZW4iIHRoaXMgcHJv
cGVydHkgd291bGQgYmUgYW4gZW51bQo+ID4gd2hpY2ggY2FuIHRha2Ugb25lIG9mIHRocmVlIHZh
bHVlcy4KPiA+Cj4gPiBQUklWQUNZX1VOU1VQUE9SVEVEIC0gUHJpdmFjeSBpcyBub3QgYXZhaWxh
YmxlIGZvciB0aGlzIGNvbm5lY3Rvcgo+ID4gUFJJVkFDWV9ESVNBQkxFRCAtIFByaXZhY3kgaXMg
YXZhaWxhYmxlIGJ1dCB0dXJuZWQgb2ZmCj4gPiBQUklWQUNZX0VOQUJMRUQgLSBQcml2YWN5IGlz
IGF2YWlsYWJsZSBhbmQgdHVybmVkIG9uCj4KPiBBZ3JlZSB3aXRoIEphbmksIHVzZSB0aGUgcHJv
cGVydHkgcHJlc2VuY2UgdG8gZGV0ZXJtaW5lIGlmIGl0J3Mgc3VwcG9ydGVkCgpUaGF0IG1ha2Vz
IHNlbnNlOyBqdXN0IHRvIGNvbmZpcm0gY2FuIGEgcHJvcGVydHkgYmUgYWRkZWQgb3IgcmVtb3Zl
ZAphZnRlciB0aGUgY29ubmVjdG9yIGlzIHJlZ2lzdGVyZWQ/Cgo+Cj4gPgo+ID4gV2hlbiB0aGUg
Y29ubmVjdG9yIGlzIGluaXRpemVkIHRoZSBwcml2YWN5IHNjcmVlbiBwcm9wZXJ0eSBpcyBzZXQg
dG8KPiA+IFBSSVZBQ1lfVU5TVVBQT1JURUQgYW5kIGNhbm5vdCBiZSBjaGFuZ2VkIHVubGVzcyBh
IGRybV9wcml2YWN5X3NjcmVlbgo+ID4gaXMgcmVnaXN0ZXJlZCB0byB0aGUgY29ubmVjdG9yLiBk
cm1fcHJpdmFjeV9zY3JlZW4gd2lsbCBsb29rIHNvbWV0aGluZwo+ID4gbGlrZQo+ID4KPiA+IHN0
cnVjdCBkcm1fcHJpdmFjeV9zY3JlZW5fb3BzIHsKPiA+ICAgICBpbnQgKCpnZXRfcHJpdmFjeV9z
dGF0ZSkoc3RydWN0IGRybV9wcml2YWN5X3NjcmVlbiAqKTsKPiA+ICAgICBpbnQgKCpzZXRfcHJp
dmFjeV9zdGF0ZSkoc3RydWN0IGRybV9wcml2YWN5X3NjcmVlbiAqLCBpbnQpOwo+ID4gfQo+ID4K
PiA+IHN0cnVjdCBkcm1fcHJpdmFjeV9zY3JlZW4gewo+ID4gICAgIC8qIFRoZSBwcml2YWN5IHNj
cmVlbiBkZXZpY2UgKi8KPiA+ICAgICBzdHJ1Y3QgZGV2aWNlICpkZXY7Cj4gPgo+ID4gICAgIC8q
IFRoZSBjb25uZWN0b3IgdGhhdCB0aGUgcHJpdmFjeSBzY3JlZW4gaXMgYXR0YWNoZWQgKi8KPiA+
ICAgICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yOwo+ID4KPiA+ICAgICAvKiBPcHMg
dG8gZ2V0IGFuZCBzZXQgdGhlIHByaXZhY3kgc2NyZWVuIHN0YXRlICovCj4gPiAgICAgc3RydWN0
IGRybV9wcml2YWN5X3NjcmVlbl9vcHMgKm9wczsKPiA+Cj4gPiAgICAgLyogVGhlIGN1cnJlbnQg
c3RhdGUgb2YgdGhlIHByaXZhY3kgc2NyZWVuICovCj4gPiAgICAgaW50IHN0YXRlOwo+ID4gfQo+
ID4KPiA+IFByaXZhY3kgc2NyZWVuIGRldmljZSBkcml2ZXJzIHdpbGwgY2FsbCBhIGZ1bmN0aW9u
IHRvIHJlZ2lzdGVyIHRoZQo+ID4gcHJpdmFjeSBzY3JlZW4gd2l0aCB0aGUgY29ubmVjdG9yLgo+
Cj4gRG8gd2UgYWN0dWFsbHkgbmVlZCBkZWRpY2F0ZWQgZHJpdmVycyBmb3IgcHJpdmFjeSBzY3Jl
ZW4/IEl0IHNlZW1zCj4gbGlrZSBzb21ldGhpbmcgdGhhdCBpcyBwYW5lbC1zcGVjaWZpYyBoYXJk
d2FyZSwgc28gSSdkIHN1Z2dlc3QganVzdAo+IHVzaW5nIHRoZSBwYW5lbCBkcml2ZXIuCgpUaGUg
cHJpdmFjeSBzY3JlZW4gaXMgcGh5c2ljYWxseSBwYXJ0IG9mIHRoZSBkaXNwbGF5IGJ1dCB0aGUg
Y29udHJvbAppbnRlcmZhY2UsIGF0IGxlYXN0IGluIGFsbCBjdXJyZW50IHVzZSBjYXNlcywgaXMg
QUNQSS4gSXMgdGhlcmUgYSB3YXkKdG8gY29udHJvbCBhbiBBQ1BJIGRldmljZSB3aXRoIHRoZSBw
YW5lbCBkcml2ZXI/Cgo+Cj4gU2Vhbgo+Cj4gPgo+ID4gaW50IGRybV9wcml2YWN5X3NjcmVlbl9y
ZWdpc3RlcihzdHJ1Y3QgZHJtX3ByaXZhY3lfc2NyZWVuX29wcyAqb3BzLAo+ID4gc3RydWN0IGRl
dmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqKTsKPiA+Cj4gPiBDYWxsaW5nIHRoaXMg
d2lsbCBzZXQgYSBuZXcgZmllbGQgb24gdGhlIGNvbm5lY3RvciAic3RydWN0Cj4gPiBkcm1fcHJp
dmFjeV9zY3JlZW4gKnByaXZhY3lfc2NyZWVuIiBhbmQgY2hhbmdlIHRoZSB2YWx1ZSBvZiB0aGUK
PiA+IHByb3BlcnR5IHRvIG9wcy0+Z2V0X3ByaXZhY3lfc3RhdGUoKS4gV2hlbgo+ID4gZHJtX21v
ZGVfY29ubmVjdG9yX3NldF9vYmpfcHJvcCgpIGlzIGNhbGxlZCB3aXRoIHRoZQo+ID4gcHJpdmFj
eV9zY3JlZW5fcHJvcHRlcnkgaWYgYSBwcml2YWN5X3NjcmVlbiBpcyByZWdpc3RlcmVkIHRvIHRo
ZQo+ID4gY29ubmVjdG9yIHRoZSBvcHMtPnNldF9wcml2YWN5X3N0YXRlKCkgd2lsbCBiZSBjYWxs
ZWQgd2l0aCB0aGUgbmV3Cj4gPiB2YWx1ZS4KPiA+Cj4gPiBTZXR0aW5nIG9mIHRoaXMgcHJvcGVy
dHkgKGFuZCBhbGwgZHJtIHByb3BlcnRpZXMpIGlzIGRvbmUgaW4gdXNlcgo+ID4gc3BhY2UgdXNp
bmcgaW9jdHJsLgo+ID4KPiA+IFJlZ2lzdGVyaW5nIHRoZSBwcml2YWN5IHNjcmVlbiB3aXRoIGEg
Y29ubmVjdG9yIG1heSBiZSB0cmlja3kgYmVjYXVzZQo+ID4gdGhlIGRyaXZlciBmb3IgdGhlIHBy
aXZhY3kgc2NyZWVuIHdpbGwgbmVlZCB0byBiZSBhYmxlIHRvIGlkZW50aWZ5Cj4gPiB3aGljaCBj
b25uZWN0b3IgaXQgYmVsb25ncyB0byBhbmQgd2Ugd2lsbCBoYXZlIHRvIGRlYWwgd2l0aCBjb25u
ZWN0b3JzCj4gPiBiZWluZyBhZGRlZCBib3RoIGJlZm9yZSBhbmQgYWZ0ZXIgdGhlIHByaXZhY3kg
c2NyZWVuIGRldmljZSBpcyBhZGRlZAo+ID4gYnkgaXQncyBkcml2ZXIuCj4gPgo+ID4gSG93IGRv
ZXMgdGhhdCBzb3VuZD8gSSB3aWxsIHdvcmsgb24gYSBwYXRjaCBpZiB0aGF0IGFsbCBzb3VuZHMg
YWJvdXQgcmlnaHQuCj4gPgo+ID4gT25lIHF1ZXN0aW9uIEkgc3RpbGwgaGF2ZSBpcyB0aGVyZSBh
IHdheSB0byBub3QgYWNjZXB0IGEgdmFsdWUgdGhhdCBpcwo+ID4gcGFzc2VkIHRvIGRybV9tb2Rl
X2Nvbm5lY3Rvcl9zZXRfb2JqX3Byb3AoKT8gSW4gdGhpcyBjYXNlIGlmIGEgcHJpdmFjeQo+ID4g
c2NyZWVuIGlzIG5vdCByZWdpc3RlcmVkIHRoZSBwcm9wZXJ0eSBtdXN0IHN0YXkgUFJJVkFDWV9V
TlNVUFBPUlRFRAo+ID4gYW5kIGlmIGEgcHJpdmFjeSBzY3JlZW4gaXMgcmVnaXN0ZXJlZCB0aGVu
IFBSSVZBQ1lfVU5TVVBQT1JURUQgbXVzdAo+ID4gbmV2ZXIgYmUgc2V0LgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

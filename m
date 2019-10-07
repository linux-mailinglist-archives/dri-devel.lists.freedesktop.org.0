Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9BACE2BE
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 15:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C1F6E5D5;
	Mon,  7 Oct 2019 13:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc36.google.com (mail-yw1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A122C6E5D1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 13:09:02 +0000 (UTC)
Received: by mail-yw1-xc36.google.com with SMTP id q7so5068538ywe.10
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 06:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QGGpibKSgPN52F+AToEQA5qscMTvvOJsG/MluQQQWb8=;
 b=OJlVTuePa6S2PtNEcSuCEjXEDIJeoJaTMFR0XjfFEgYbEe+3jx+6GS5QhjmWi/LUVi
 uT0N0D7Qsm9ZBtBRrhCv9hVwadK4GASr+l5PhBNx37fs81t7DbiRBIy/roln+7STSRMT
 u6ErffZccuh/v7RRmfx8+wvn/fTqaoPgq3LbFKKDeaJLrxI/oXahDs1vG9Qe1oM1OF5N
 zAT/rFA7sxp18yAzeub7hRrt1VnI0bKhyoDnkGq+aVh4d9UsETfBe3OV3cfeN9XM1Bwo
 Ny0bo/vVAc4kTnu1yIowjZRD5C6AneGonLKduANgJXISwMuw87poCoWJiqesf4bKIO0W
 bJKg==
X-Gm-Message-State: APjAAAVyGpgBcSMAWRAdZLq7LaNtAR27Qxwt7t4K6yvrx4zSSDTaXDO6
 KM1caQnM23LV66NIAMY5r2/F+IgAE4A=
X-Google-Smtp-Source: APXvYqxSX1VntjFlEkQvDkA76VBarctTSu81+abDaiXdMI2A7KTOpA5lFQknFDjldeGY+uUKZV/rYw==
X-Received: by 2002:a81:6555:: with SMTP id z82mr19755452ywb.414.1570453741662; 
 Mon, 07 Oct 2019 06:09:01 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176])
 by smtp.gmail.com with ESMTPSA id e17sm4160432ywa.52.2019.10.07.06.08.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2019 06:09:00 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id f4so4637641ybm.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 06:08:59 -0700 (PDT)
X-Received: by 2002:a25:6e41:: with SMTP id j62mr11442914ybc.41.1570453738921; 
 Mon, 07 Oct 2019 06:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAL_quvRknSSVvXN3q_Se0hrziw2oTNS3ENNoeHYhvciCRq9Yww@mail.gmail.com>
 <87h84rbile.fsf@intel.com> <20191002102428.zaid63hp6wpd7w34@holly.lan>
 <8736gbbf2b.fsf@intel.com>
 <CAL_quvQkFjkBjJC5wH2t5XmyEq9OKWYSbAv39BJWT1hrKO7j8g@mail.gmail.com>
 <87h84q9pcj.fsf@intel.com>
 <CAL_quvQoWnWqS5OQAqbLcBO-bR9_obr1FBc6f6mA1T00n1DJNQ@mail.gmail.com>
In-Reply-To: <CAL_quvQoWnWqS5OQAqbLcBO-bR9_obr1FBc6f6mA1T00n1DJNQ@mail.gmail.com>
From: Sean Paul <seanpaul@chromium.org>
Date: Mon, 7 Oct 2019 09:08:18 -0400
X-Gmail-Original-Message-ID: <CAOw6vbJ7XX8=nrJDENfn2pacf4MqQOkP+x8JV0wbqzoMfLvZWQ@mail.gmail.com>
Message-ID: <CAOw6vbJ7XX8=nrJDENfn2pacf4MqQOkP+x8JV0wbqzoMfLvZWQ@mail.gmail.com>
Subject: Re: New sysfs interface for privacy screens
To: Mat King <mathewk@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=QGGpibKSgPN52F+AToEQA5qscMTvvOJsG/MluQQQWb8=;
 b=UKLLFbk7MozKtKXnphdmdst1Gzjdzn/kP9WFcji1s6Ob0Ncn1WVsfCDCMDa0kelx2H
 UgWEmBVm0gVF1Ibj+h+q30kw7QRZOXHs+5UmEBaVM0iuR+HuyETd4jhXWRCglTr+ODNO
 YPUu2jQnH1pWJeZuZdRTFn7uKmM+ApWINK8M4=
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

T24gVGh1LCBPY3QgMywgMjAxOSBhdCAzOjU3IFBNIE1hdCBLaW5nIDxtYXRoZXdrQGdvb2dsZS5j
b20+IHdyb3RlOgo+Cj4gT24gVGh1LCBPY3QgMywgMjAxOSBhdCAyOjU5IEFNIEphbmkgTmlrdWxh
IDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgMDIg
T2N0IDIwMTksIE1hdCBLaW5nIDxtYXRoZXdrQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4gPiBPbiBX
ZWQsIE9jdCAyLCAyMDE5IGF0IDQ6NDYgQU0gSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4
LmludGVsLmNvbT4gd3JvdGU6Cj4gPiA+Pgo+ID4gPj4gT24gV2VkLCAwMiBPY3QgMjAxOSwgRGFu
aWVsIFRob21wc29uIDxkYW5pZWwudGhvbXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiA+PiA+
IE9uIFdlZCwgT2N0IDAyLCAyMDE5IGF0IDEyOjMwOjA1UE0gKzAzMDAsIEphbmkgTmlrdWxhIHdy
b3RlOgo+ID4gPj4gPj4gT24gVHVlLCAwMSBPY3QgMjAxOSwgTWF0IEtpbmcgPG1hdGhld2tAZ29v
Z2xlLmNvbT4gd3JvdGU6Cj4gPiA+PiA+PiA+IFJlc2VuZGluZyBpbiBwbGFpbiB0ZXh0IG1vZGUK
Ci9zbmlwCgo+Cj4gU28gbXkgcHJvcG9zYWwgd291bGQgbm93IGJlIHRvIGFkZCBhIG5ldyBzdGFu
ZGFyZCBwcm9wZXJ0eSB0bwo+IGRybV9jb25uZWN0b3IgY2FsbGVkICJwcml2YWN5X3NjcmVlbiIg
dGhpcyBwcm9wZXJ0eSB3b3VsZCBiZSBhbiBlbnVtCj4gd2hpY2ggY2FuIHRha2Ugb25lIG9mIHRo
cmVlIHZhbHVlcy4KPgo+IFBSSVZBQ1lfVU5TVVBQT1JURUQgLSBQcml2YWN5IGlzIG5vdCBhdmFp
bGFibGUgZm9yIHRoaXMgY29ubmVjdG9yCj4gUFJJVkFDWV9ESVNBQkxFRCAtIFByaXZhY3kgaXMg
YXZhaWxhYmxlIGJ1dCB0dXJuZWQgb2ZmCj4gUFJJVkFDWV9FTkFCTEVEIC0gUHJpdmFjeSBpcyBh
dmFpbGFibGUgYW5kIHR1cm5lZCBvbgoKQWdyZWUgd2l0aCBKYW5pLCB1c2UgdGhlIHByb3BlcnR5
IHByZXNlbmNlIHRvIGRldGVybWluZSBpZiBpdCdzIHN1cHBvcnRlZAoKPgo+IFdoZW4gdGhlIGNv
bm5lY3RvciBpcyBpbml0aXplZCB0aGUgcHJpdmFjeSBzY3JlZW4gcHJvcGVydHkgaXMgc2V0IHRv
Cj4gUFJJVkFDWV9VTlNVUFBPUlRFRCBhbmQgY2Fubm90IGJlIGNoYW5nZWQgdW5sZXNzIGEgZHJt
X3ByaXZhY3lfc2NyZWVuCj4gaXMgcmVnaXN0ZXJlZCB0byB0aGUgY29ubmVjdG9yLiBkcm1fcHJp
dmFjeV9zY3JlZW4gd2lsbCBsb29rIHNvbWV0aGluZwo+IGxpa2UKPgo+IHN0cnVjdCBkcm1fcHJp
dmFjeV9zY3JlZW5fb3BzIHsKPiAgICAgaW50ICgqZ2V0X3ByaXZhY3lfc3RhdGUpKHN0cnVjdCBk
cm1fcHJpdmFjeV9zY3JlZW4gKik7Cj4gICAgIGludCAoKnNldF9wcml2YWN5X3N0YXRlKShzdHJ1
Y3QgZHJtX3ByaXZhY3lfc2NyZWVuICosIGludCk7Cj4gfQo+Cj4gc3RydWN0IGRybV9wcml2YWN5
X3NjcmVlbiB7Cj4gICAgIC8qIFRoZSBwcml2YWN5IHNjcmVlbiBkZXZpY2UgKi8KPiAgICAgc3Ry
dWN0IGRldmljZSAqZGV2Owo+Cj4gICAgIC8qIFRoZSBjb25uZWN0b3IgdGhhdCB0aGUgcHJpdmFj
eSBzY3JlZW4gaXMgYXR0YWNoZWQgKi8KPiAgICAgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5l
Y3RvcjsKPgo+ICAgICAvKiBPcHMgdG8gZ2V0IGFuZCBzZXQgdGhlIHByaXZhY3kgc2NyZWVuIHN0
YXRlICovCj4gICAgIHN0cnVjdCBkcm1fcHJpdmFjeV9zY3JlZW5fb3BzICpvcHM7Cj4KPiAgICAg
LyogVGhlIGN1cnJlbnQgc3RhdGUgb2YgdGhlIHByaXZhY3kgc2NyZWVuICovCj4gICAgIGludCBz
dGF0ZTsKPiB9Cj4KPiBQcml2YWN5IHNjcmVlbiBkZXZpY2UgZHJpdmVycyB3aWxsIGNhbGwgYSBm
dW5jdGlvbiB0byByZWdpc3RlciB0aGUKPiBwcml2YWN5IHNjcmVlbiB3aXRoIHRoZSBjb25uZWN0
b3IuCgpEbyB3ZSBhY3R1YWxseSBuZWVkIGRlZGljYXRlZCBkcml2ZXJzIGZvciBwcml2YWN5IHNj
cmVlbj8gSXQgc2VlbXMKbGlrZSBzb21ldGhpbmcgdGhhdCBpcyBwYW5lbC1zcGVjaWZpYyBoYXJk
d2FyZSwgc28gSSdkIHN1Z2dlc3QganVzdAp1c2luZyB0aGUgcGFuZWwgZHJpdmVyLgoKU2VhbgoK
Pgo+IGludCBkcm1fcHJpdmFjeV9zY3JlZW5fcmVnaXN0ZXIoc3RydWN0IGRybV9wcml2YWN5X3Nj
cmVlbl9vcHMgKm9wcywKPiBzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fY29ubmVjdG9y
ICopOwo+Cj4gQ2FsbGluZyB0aGlzIHdpbGwgc2V0IGEgbmV3IGZpZWxkIG9uIHRoZSBjb25uZWN0
b3IgInN0cnVjdAo+IGRybV9wcml2YWN5X3NjcmVlbiAqcHJpdmFjeV9zY3JlZW4iIGFuZCBjaGFu
Z2UgdGhlIHZhbHVlIG9mIHRoZQo+IHByb3BlcnR5IHRvIG9wcy0+Z2V0X3ByaXZhY3lfc3RhdGUo
KS4gV2hlbgo+IGRybV9tb2RlX2Nvbm5lY3Rvcl9zZXRfb2JqX3Byb3AoKSBpcyBjYWxsZWQgd2l0
aCB0aGUKPiBwcml2YWN5X3NjcmVlbl9wcm9wdGVyeSBpZiBhIHByaXZhY3lfc2NyZWVuIGlzIHJl
Z2lzdGVyZWQgdG8gdGhlCj4gY29ubmVjdG9yIHRoZSBvcHMtPnNldF9wcml2YWN5X3N0YXRlKCkg
d2lsbCBiZSBjYWxsZWQgd2l0aCB0aGUgbmV3Cj4gdmFsdWUuCj4KPiBTZXR0aW5nIG9mIHRoaXMg
cHJvcGVydHkgKGFuZCBhbGwgZHJtIHByb3BlcnRpZXMpIGlzIGRvbmUgaW4gdXNlcgo+IHNwYWNl
IHVzaW5nIGlvY3RybC4KPgo+IFJlZ2lzdGVyaW5nIHRoZSBwcml2YWN5IHNjcmVlbiB3aXRoIGEg
Y29ubmVjdG9yIG1heSBiZSB0cmlja3kgYmVjYXVzZQo+IHRoZSBkcml2ZXIgZm9yIHRoZSBwcml2
YWN5IHNjcmVlbiB3aWxsIG5lZWQgdG8gYmUgYWJsZSB0byBpZGVudGlmeQo+IHdoaWNoIGNvbm5l
Y3RvciBpdCBiZWxvbmdzIHRvIGFuZCB3ZSB3aWxsIGhhdmUgdG8gZGVhbCB3aXRoIGNvbm5lY3Rv
cnMKPiBiZWluZyBhZGRlZCBib3RoIGJlZm9yZSBhbmQgYWZ0ZXIgdGhlIHByaXZhY3kgc2NyZWVu
IGRldmljZSBpcyBhZGRlZAo+IGJ5IGl0J3MgZHJpdmVyLgo+Cj4gSG93IGRvZXMgdGhhdCBzb3Vu
ZD8gSSB3aWxsIHdvcmsgb24gYSBwYXRjaCBpZiB0aGF0IGFsbCBzb3VuZHMgYWJvdXQgcmlnaHQu
Cj4KPiBPbmUgcXVlc3Rpb24gSSBzdGlsbCBoYXZlIGlzIHRoZXJlIGEgd2F5IHRvIG5vdCBhY2Nl
cHQgYSB2YWx1ZSB0aGF0IGlzCj4gcGFzc2VkIHRvIGRybV9tb2RlX2Nvbm5lY3Rvcl9zZXRfb2Jq
X3Byb3AoKT8gSW4gdGhpcyBjYXNlIGlmIGEgcHJpdmFjeQo+IHNjcmVlbiBpcyBub3QgcmVnaXN0
ZXJlZCB0aGUgcHJvcGVydHkgbXVzdCBzdGF5IFBSSVZBQ1lfVU5TVVBQT1JURUQKPiBhbmQgaWYg
YSBwcml2YWN5IHNjcmVlbiBpcyByZWdpc3RlcmVkIHRoZW4gUFJJVkFDWV9VTlNVUFBPUlRFRCBt
dXN0Cj4gbmV2ZXIgYmUgc2V0LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=

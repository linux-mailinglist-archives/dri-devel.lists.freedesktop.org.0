Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9285BE1E2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 18:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384216EBF2;
	Wed, 25 Sep 2019 16:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7BB6EBF2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 16:04:33 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id v38so3586592edm.7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 09:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VmKnWUq2nQzokJ4oQWUzIkl5eR5GeAhKyq47CsAeVUk=;
 b=bPQjAHmRxnFxiIYRxIaoqGidnjluf0/KV/lGdrYi0g3QG/qoEGWsjHQBAzAUCzZHNB
 5RqVZi7StFCCPfrcjYWn/wCnQKhwFQ2jO9mlznQrhlGyITNlZ6oH6CwZopdM3PTrLaO8
 3KQ1Fqc1LXeT9vLdvGZmM9p1tAuPFxQSVdJlZH1mAMV6TKn6Tt0EdLGRGpeiogYCL2e/
 CcKBFcEgP/V2LZqdu8ifXzv6Kn9u2Mjg5KZ+Em8y/c+rukiyoq9o7qMHDia98Ov99jwj
 gM2hY26GB4tquO3P6zJhpMrd81fJ7p4IifwW6L+lKM04lZOz9KhGuCrFvrw6Svw/u1OW
 6xrA==
X-Gm-Message-State: APjAAAUdwNFkmDi7Rg5D1YK1haeCC0NFtTqWZMjWpcjobYRgshMm1LVv
 MfDQ8C+6eFNlJJXKsc9lxMdHn7ttzbaRaoc0CSQ=
X-Google-Smtp-Source: APXvYqxcdFEB6jG59uNrC5J6pYFsKN9gCb0UmYFNH1DxxYFMX/CRpFBPl8EcD+Gxyi4vQTs12b5Ki8OcAZly/nGLXUk=
X-Received: by 2002:a17:907:2126:: with SMTP id
 qo6mr4964953ejb.256.1569427471834; 
 Wed, 25 Sep 2019 09:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190924212920.76103-1-john.stultz@linaro.org>
 <CAL_JsqLR212Et5Z82Gr=DJfB5WY-4o8bN_s5peu07EnaEVEOYQ@mail.gmail.com>
 <CALAqxLUR5ML3gmBs3SM2GvfXB+JxiO7gTUrtpVJqVzuh+hugxg@mail.gmail.com>
 <CALAqxLWHrCKogRqe2ZQZT3dK57+8AmxKfZjKXxztvw6CFobdkg@mail.gmail.com>
In-Reply-To: <CALAqxLWHrCKogRqe2ZQZT3dK57+8AmxKfZjKXxztvw6CFobdkg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 25 Sep 2019 09:04:20 -0700
Message-ID: <CAF6AEGtLpq-TKC-Cf=G-fauYTOA2diFAjfEKz+EgFwJMsC7kZg@mail.gmail.com>
Subject: Re: [PATCH] libdrm: Convert to Android.mk to Android.bp
To: John Stultz <john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=VmKnWUq2nQzokJ4oQWUzIkl5eR5GeAhKyq47CsAeVUk=;
 b=goCuTtYj5/Qf863tKye0pBkB8ZTjXwTtKoKwpYq9p/xCxO91NVJGmZ5LlRXD3ip8wo
 4kUr8YO/gTDgesZ3UuZKgvXDqNjXu6UzD1gg17AK42GqYPMjkmNvexaXujejaXjXcZFE
 Irs5yWMXC8ZpOc/6aOpCHZoEI9XSxTCEJKwtY7edLqpqi3xCg1LyX0HxgvY8brdA+UFX
 sjRwGk82VqoKelADblgAj/X+ncRMO9sfOD/Wk+zEoeCKAbF/Bm8hoYNMTNc0jVeP0Tb8
 dz7yR7Iq8x0fNGwqKzPpKzV57XR1prJMkpWuunZsS1nihBXfM6ShSg3riJsUsHmGvIqF
 a8Ug==
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
Cc: Rob Clark <robdclark@chromium.org>, Jiyong Park <jiyong@google.com>,
 Robert Foss <robert.foss@collabora.com>, Mauro Rossi <issor.oruam@gmail.com>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Eric Anholt <anholt@google.com>,
 Sean Paul <seanpaul@chromium.org>, Dan Willemsen <dwillemsen@google.com>,
 Vishal Bhoj <vishal.bhoj@linaro.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgMTE6MDkgUE0gSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6
QGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgNDozMCBQTSBK
b2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiBPbiBUdWUsIFNl
cCAyNCwgMjAxOSBhdCAzOjI0IFBNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+ID4gPiBUcnlpbmcgdG8gbWFpbnRhaW4gc29tZXRoaW5nIHRoYXQgd29ya3MgYWNyb3NzIG1v
cmUgdGhhbiAzIHJlbGVhc2VzIG9yCj4gPiA+IHNvIGlzIHBhaW5mdWwuIEkgZG9uJ3QgdGhpbmsg
YW5kcm9pZC14ODYgZm9sa3MgaGF2ZSB0aGUgYmFuZHdpZHRoIHRvCj4gPiA+IG1haW50YWluIHRo
aW5ncyBvbGRlciB0aGFuIHRoYXQgKmFuZCogdXBkYXRlIHRvIG5ld2VyIHZlcnNpb25zLiBTbyBJ
Cj4gPiA+IHRoaW5rIG9ubHkgc3VwcG9ydGluZyB0aGUgbiBsYXRlc3QgcmVsZWFzZXMgaXMgZ29v
ZC4KPiA+ID4KPiA+ID4gQXJlIC5icCBmaWxlcyBmb3IgbWFzdGVyL1EgY29tcGF0aWJsZSBiYWNr
IHRvIE4gKG9yIE8pPyBJSVJDLCBhdCBsZWFzdAo+ID4gPiBmb3IgdGhlIGZpcnN0IGNvdXBsZSBv
ZiByZWxlYXNlcyB3aXRoIC5icCBmaWxlcywgdGhleSBzZWVtZWQgdG8gaGF2ZQo+ID4gPiBpbmNv
bXBhdGlibGUgY2hhbmdlcy4KPiA+Cj4gPiBJIHRoaW5rIHRoZXJlIGhhdmUgcG9zc2libHkgYmVl
biBzb21lIGluY29tcGF0aWJsZSBjaGFuZ2VzLCBhcyBJIGtub3cKPiA+IGVhcmx5IHcvIGJwIGZp
bGVzIHRoaW5ncyB3ZXJlIG1vcmUgaW4gZmx1eC4gVGhhdCBzYWlkLCB0aGVyZSBoYXZlbid0Cj4g
PiBiZWVuIG1hbnkgY2hhbmdlcyB0byB0aGUgbGliZHJtIGJwIGZpbGVzIHNpbmNlIHRoZSBjb252
ZXJzaW9uIHdhcwo+ID4gZmlyc3QgZG9uZSBpbiAyMDE3IChzbyBBbmRyb2lkIE8pLiBJJ2xsIGNo
ZWNrb3V0IE4gYW5kIHZhbGlkYXRlIHNvIEkKPiA+IGNhbiBwcm92aWRlIGEgbW9yZSBjb25jcmV0
ZSBhc3N1cmFuY2UuCj4KPiBBaC4gQ3J1ZC4gWW91J3JlIHJpZ2h0LiBUaGUgYnAgc3ludGF4IGhh
cyBzaGlmdGVkIGVub3VnaCBvdmVyIHRpbWUgdG8KPiBjYXVzZSBwcm9ibGVtcyB3LyB0aGUgY3Vy
cmVudCBmaWxlIHdoZW4gYnVpbGRpbmcgYWdhaW5zdCBvbGRlciBBbmRyb2lkCj4gcmVsZWFzZXMu
ICAgTiBmYWxscyBvdmVyIHByZXR0eSBoYXJkLCBhbmQgTyBhbmQgZXZlbiBQIGhhdmUgaXNzdWVz
IHcvCj4gInJlY292ZXJ5X2F2YWlsYWJsZTogIiwgYW5kICJwcmVidWlsdF9ldGMiIHN5bnRheC4g
IFNvIG15IHByb3Bvc2VkCj4gY29tbWl0IG1lc3NhZ2UgbWlzY2hhcmFjdGVyaXplcyB0aGUgc3Rh
dGUgb2Ygb2xkZXIgYnVpbGRzLiBBcG9sb2dpZXMhCgpUaGUgQ3JPUy9hcmMrKyBhcHByb2FjaCB0
byBidWlsZCBtZXNhIHVzaW5nIG1lc29uIGFzIGFuIGFuZHJvaWQgdmVuZG9yCmJsb2IsIG1vcmUg
ZGVjb3VwbGVkIGZyb20gYW5kcm9pZCBidWlsZCBzeXN0ZW0sIHNlZW1zIG5pY2VyIGV2ZXJ5IGRh
eQo7LSkKClNpZGUgbm90ZSwgdW5sZXNzIHlvdSBhcmUgYWxzbyBjYXJpbmcgYWJvdXQgbmV3IGxp
YmRybSArIG9sZCBtZXNhLCB5b3UKY2FuIGRyb3AgbGliZHJtX2ZyZWVkcmVubyBmcm9tIEFuZHJv
aWQubWsvQW5kcm9pZC5icC4uIHdlJ3ZlIHB1bGxlZCBpdAppbiB0byAkbWVzYS9zcmMvZnJlZWRy
ZW5vL2RybSwgYW4gb2xkIHZlcnNpb24gb25seSByZW1haW5zIGluIGxpYmRybQpmb3Igb2xkZXIg
bWVzYSBhbmQgZm9yIGEgY291cGxlIGRldi90ZXN0IHRvb2xzIHRoYXQgSSB1c2UuCgpCUiwKLVIK
Cj4gSSdsbCB0cnkgdG8gcmVhY2ggb3V0IHRvIHRoZSBhbmRyb2lkIGRldnMgdG8gc2VlIGlmIHRo
ZXJlJ3MgYW55IHNvcnQKPiBvZiBjb21wYXQgbWFnaWMgdGhhdCBjYW4gYmUgZG9uZSB0byBrZWVw
IHRoaW5ncyB3b3JraW5nIG9uIG9sZGVyCj4gdmVyc2lvbnMuIFRoYXQgc2FpZCwgSSdtIHN0aWxs
IHRvcm4sIGFzIHdpdGhvdXQgdGhpcyB0aGUgY3VycmVudAo+IGxpYmRybS9tYXN0ZXIgY29kZSBp
cyBicm9rZW4gd2l0aCBBT1NQL21hc3RlciBhbmQgUS4gIEl0cyBmcnVzdHJhdGluZwo+IHdlIGhh
dmUgdG8gaGF2ZSB0aGlzIHNlZW1pbmdseSBleGNsdXNpdmUgdHJhZGUgb2ZmLgo+Cj4gSSdtIGN1
cmlvdXMgaWYgZm9sa3MgbWlnaHQgYmUgd2lsbGluZyB0byBjb25zaWRlciBzb21ldGhpbmcgbGlr
ZSBhbgo+IHVwc3RyZWFtIGJyYW5jaCB0byBwcmVzZXJ2ZSB0aGUgYnVpbGQgYml0cyB0aGF0IHdv
cmsgd2l0aCBwcmlvcgo+IEFuZHJvaWQgcmVsZWFzZXM/IE9yIGFueSBvdGhlciBpZGVhcz8KPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

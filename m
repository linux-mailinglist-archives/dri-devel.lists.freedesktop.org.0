Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 805F7F5159
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 17:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86486FA08;
	Fri,  8 Nov 2019 16:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032886FA08
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 16:42:47 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id u99so1923929uau.5
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2019 08:42:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VFJH0BvyxdDPKHoqjtjGZH5yVkUA3MkABu+kse+9mpE=;
 b=Fm+UqwT+TE/V4IR8m5MrVTHrY3neFsSaMp+eTkMBNXixuK1UQnpWWj3OPpeYlJd4ib
 pXSp1PTldG1E1lIsnUn6EHYnFPEnOoA/XW39ijE213H4ePhojHCeZB/SsAdVRsIaRpbE
 kX/Nvmb9LU/vVsSlAzUiGC3hVhMlMmI28nzA3J0bU3FCO75iQQ/gDajHoop5+FdDsCoh
 Kjo8m7PSBs4RHoCGjLyNCC1koWE/W0I4g2biTn7+zDpgSBkUPDQoMGRmvyMRaetKvbVV
 Vi0h8HvxOV88B22fK7MIO4xFlAQYH5RP1tU9CuAo+pt2Qo35u1/B8raGBFUYeDDTkWek
 G++g==
X-Gm-Message-State: APjAAAUY+l38SXuokG8Q/IBipY8r/svav9Het/ksUIpI2WIXj3ihIJq9
 CFFeoFi6AfFUdUeeMyZat38bhSmFrkSWXm6+B78=
X-Google-Smtp-Source: APXvYqwkbzK5uFct3FR/BTetB8ZpjEts5xDMwlcQXUZ6O17dRyPtX0/JKdK7w3KTyBdwJXK4VyMdvzO1/Sl4uddzw3g=
X-Received: by 2002:ab0:300c:: with SMTP id f12mr7652904ual.19.1573231365952; 
 Fri, 08 Nov 2019 08:42:45 -0800 (PST)
MIME-Version: 1.0
References: <20191101130313.8862-1-emil.l.velikov@gmail.com>
 <20191101130313.8862-4-emil.l.velikov@gmail.com>
 <d652ceaa-2c64-31f0-1793-14a5de51dc57@arm.com>
 <CACvgo52zMar0q1CPNd0UnBFU3AZt-m1v7ZKaP0y3p6bSJ6LxFQ@mail.gmail.com>
 <8a392fc2-20e2-11cf-e06e-b66723a10b86@arm.com>
In-Reply-To: <8a392fc2-20e2-11cf-e06e-b66723a10b86@arm.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 8 Nov 2019 16:42:27 +0000
Message-ID: <CACvgo50_GEaWZmy9BbkVuE-Jgn7fBzu+CErwKqy7bviF7omOsg@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/panfrost: remove DRM_AUTH and respective comment
To: Steven Price <steven.price@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=VFJH0BvyxdDPKHoqjtjGZH5yVkUA3MkABu+kse+9mpE=;
 b=p0yQGtjzUZDV08qQjQihqtZr+eu6sUTg2506R8V/NRepuMa9gzUvgwCwHUY2/GMC87
 6lKl6YAb5i3+Vaq87H35Y4acSgOcusWkiYKEeQRJzi7xJT3BNp7O7JD3wyaqGT5kKcyK
 8dqZgcZlxtlX9cwYQMFMLFT65GDbhxFnoLMVfOLTMJH7gnI5lOd7+IHFdJh6arguA5mK
 EbFd02L7gCT4ozif3IB9NvzEnwsAJ1i1a4MPhiPzpKYJSR1pl4Yo9NU7xxgW1yiParef
 oBtTVnD3w9XAzKn0muysijtFw+NGLLPECZUBavH6yi5xxdLleH3GFh5814rFX5uiNk/p
 rHRg==
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
Cc: David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCA4IE5vdiAyMDE5IGF0IDE1OjU1LCBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBh
cm0uY29tPiB3cm90ZToKPgo+IE9uIDA4LzExLzIwMTkgMTM6MTAsIEVtaWwgVmVsaWtvdiB3cm90
ZToKPiA+IE9uIEZyaSwgMSBOb3YgMjAxOSBhdCAxMzozNCwgU3RldmVuIFByaWNlIDxzdGV2ZW4u
cHJpY2VAYXJtLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBPbiAwMS8xMS8yMDE5IDEzOjAzLCBFbWls
IFZlbGlrb3Ygd3JvdGU6Cj4gPj4+IEZyb206IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNv
bGxhYm9yYS5jb20+Cj4gPj4+Cj4gPj4+IEFzIG9mIGVhcmxpZXIgY29tbWl0IHdlIGhhdmUgYWRk
cmVzcyBzcGFjZSBzZXBhcmF0aW9uLiBZZXQgd2UgZm9yZ290IHRvCj4gPj4+IHJlbW92ZSB0aGUg
cmVzcGVjdGl2ZSBjb21tZW50IGFuZCBEUk1fQVVUSCBpbiB0aGUgaW9jdGwgZGVjbGFyYXRpb24u
Cj4gPj4+Cj4gPj4+IENjOiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29t
Pgo+ID4+PiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+ID4+PiBDYzogRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4+PiBDYzogUm9iaW4gTXVycGh5IDxyb2Jp
bi5tdXJwaHlAYXJtLmNvbT4KPiA+Pj4gQ2M6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFy
bS5jb20+Cj4gPj4+IEZpeGVzOiA3MjgyZjc2NDVkMDYgKCJkcm0vcGFuZnJvc3Q6IEltcGxlbWVu
dCBwZXIgRkQgYWRkcmVzcyBzcGFjZXMiKQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFZlbGlr
b3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+ID4+Cj4gPj4gUmV2aWV3ZWQtYnk6IFN0
ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Cj4gPj4KPiA+PiBJJ20gbm90IHN1cmUg
RFJNX0FVVEggcHJvdmlkZWQgdXMgd2l0aCBtdWNoIGluIHRoZSBmaXJzdCBwbGFjZSAoYmVjYXVz
ZQo+ID4+IHJlbmRlciBub2RlcyBjb3VsZCBzbm9vcC9hZmZlY3QgdGhlIHByaW1hcnkgbm9kZSks
IGJ1dCBzaW5jZSB3ZSBoYXZlCj4gPj4gYWRkcmVzcyBzcGFjZSBzZXBhcmF0aW9uIGl0J3MgY2xl
YXJseSBub3QgcmVxdWlyZWQgbm93Lgo+ID4+Cj4gPiBUaGFua3MgU3RldmUuIFRoaXMgaXMgZXhh
Y3RseSB0aGUgcmVhc29uIHdoeSBJIHJlbW92ZWQgaXQgZnJvbSBtb3N0Cj4gPiBvdGhlciBkcml2
ZXJzLgo+ID4gVGhlcmUgYXJlIGVxdWl2YWxlbnQgdm13Z2Z4IGNoYW5nZXMgYW5kIGEgRFJNIGNv
cmUgcGF0Y2ggaW4gdGhpcyBzZXJpZXMuCj4gPgo+ID4gRG8geW91IHRoaW5rIHlvdSdsbCBoYXZl
IHNvbWUgdGltZSB0byBjaGVjayB0aG9zZSBvdmVyPyBXb3VsZCBiZQo+ID4gYW1hemluZyBpZiBJ
IGNhbiBhcHBseSB0aGUgbG90IGluIG9uZSBnbyB0byBkcm0tbWlzYy4KPgo+IEknbSBhZnJhaWQg
SSBkb24ndCBrbm93IGVub3VnaCBhYm91dCB0aGUgc2VjdXJpdHkgbW9kZWwgb2Ygdm13Z2Z4IHRv
Cj4gbWVhbmluZ2Z1bGx5IGNvbW1lbnQgb24gdGhvc2UgY2hhbmdlcy4gT24gdGhlIHN1cmZhY2Ug
dGhleSBsb29rIGZpbmUsCj4gYnV0IGl0IHJlYWxseSBuZWVkcyBzb21lb25lIHdobyB1bmRlcnN0
YW5kcyB3aGV0aGVyIHRoaXMgZXhwb3NlcyBhbgo+IGF0dGFjayBzdXJmYWNlLgo+CkkgdW5kZXJz
dGFuZCwgdGhhbmtzIGZvciBoYXZpbmcgYSBsb29rLgoKPiBUaGUgRFJNIGNvcmUgcGF0Y2ggY29u
Y2VybnMgbWUgc2xpZ2h0bHkgKGFsdGhvdWdoIGFnYWluIEknbSBub3QKPiBjb21wbGV0ZWx5IHVw
IHRvIHNwZWVkIG9uIHRoZSBzZWN1cml0eSBtb2RlIGhlcmUpLiBGb3IgYSBkZXZpY2Ugd2hpY2gK
PiBkb2Vzbid0IGhhdmUgYWRkcmVzcyBzcGFjZSBzZXBhcmF0aW9uIChhbmQgZG9lc24ndCBzdXBw
b3J0IHJlbmRlcgo+IG5vZGVzKSwgaXMgdGhlcmUgYW55dGhpbmcgc3RvcHBpbmcgYSBwcm9jZXNz
IHdoaWNoIGhhc24ndCBhdXRoZW50aWNhdGVkCj4gY29udmVydGluZyBhbm90aGVyIHByb2Nlc3Mn
cyBoYW5kbGUgdG8gYSBwcmltZSBmZD8gKG9yIGluamVjdGluZyBkbWFidWZzCj4gaW50byB0aGUg
YWRkcmVzcyBzcGFjZSB1c2VkIGJ5IHRoZSBhdXRoZW50aWNhdGVkIHByb2Nlc3MgLSB3aGljaCBt
aWdodAo+IGNhdXNlIGFkZHJlc3Mgc3BhY2UgZXhoYXVzdGlvbikuIElmIHRoYXQncyBub3QgYSBj
b25jZXJuIHRoZW4gSSdtIG5vdAo+IHN1cmUgd2h5IHRoZSBpb2N0bHMgd2VyZSBvcmlnaW5hbGx5
IGFkZGVkIHdpdGggRFJNX0FVVEguLi4KPgpUaGFua3MgZm9yIHJhaXNpbmcgdGhpcyB1cC4KCkxl
dCdzIHN0YXJ0IHdpdGggdGhlIHNob3J0IHF1ZXN0aW9uOiBXaHkgd2FzIERSTV9BVVRIIGFkZGVk
PwpJIHdvdWxkIGV4cGVjdCBlaXRoZXIgY2FyZ28tY3VsdCAtIHdlIGhhdmUgRFJNX0FVVEggZXZl
biBmb3IgZ2V0X3BhcmFtIGlvY3RsLgoKSW4gb3JkZXIgZm9yIGEgaGFuZGxlIHRvIGJlIGV4cG9y
dGVkIGFzIGZkLCB0aGUgZHJpdmVyIG11c3Qgc3VwcG9ydApyZW5kZXIgbm9kZXMuIFdoaWNoIGlt
cGxpY2l0bHkgbWFuZGF0ZXMgYWRkcmVzcyBzcGFjZSBzZXBhcmF0aW9uLgpJZiB0aGF0IGFzc3Vt
cHRpb24gaXMgYnJva2VuLCB0aGVuIHdlIGhhdmUgZGVlcGVyIHByb2JsZW1zLgpPbiB0aGUgb3Ro
ZXIgaGFuZCwgVjNEIGRvZXMgZXhwb3NlIHJlbmRlciBub2RlcyBhbmQgdXNlcyB0aGUgc2FtZQpx
dWlyayBhcyBwYW5mcm9zdCBiZWZvcmUgdGhlIGFkZHJlc3Mgc3BhY2Ugc2VwYXJhdGlvbiBwYXRj
aC4KClNvIG92ZXJhbGwsIGl0IGRvZXNuJ3Qgc2VlbSBsaWtlIGl0IHdvdWxkIGNhdXNlIGFueSBw
cm9ibGVtcywgd2hpY2gKZG9uJ3QgZXhpc3QgYWxyZWFkeS4KClRoYW5rcwpFbWlsCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

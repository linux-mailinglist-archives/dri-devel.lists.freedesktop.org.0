Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AEF25200
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 16:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18DF68825E;
	Tue, 21 May 2019 14:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8CF8825E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 14:29:45 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id t187so12909470oie.10
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 07:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZKnWNcIY/6UHiCwTfp5ZOf6rvagFVKmR//SGYmsxCzQ=;
 b=nC+cm+MFhzroEVA5+swBZXJEoX5A1dmEMwDXDyn0BwO4MUI12UKa4aB4oO4f4QpcbV
 oHyCNsn4oTHsDeekxHgmxxlFebKkIRxUmVgqRlwe4GLA5APBngTZIrr1Nr/LMjqeYEaP
 tk+NNf+f0lbgbdnntpag6S18fkZeapr/DJwxmITT1iGvxdb3v75YsSAKldurk8IPvkLG
 SekEhILNv3A22QJQxqwC2GyO25apEXyWT3PlAZ5HAo1XpUjYyTxrei/+MugQeWeOGBL8
 qQVL3BzVQMVYy05qpOpbqbraQkGXrUHh4UZFfeMjYDxBXjggQwqzqkFv/EbkY435WqQv
 OFLQ==
X-Gm-Message-State: APjAAAUolv2JnAfAQy+snm/rqiyymr0XZNjwPLgDuocnntyMqOvyMABT
 vuR0OthrNQZqMu0/jP2SnEJfmjhJmwxgcPdXj09Kmg==
X-Google-Smtp-Source: APXvYqwVooD+rAj2W9EavxIUqk1ty6plv8cxDcH84+MayetmXeKAf5ID+WJCO5nfp5YX0raDtyWGfw4s6oiLFUuwCog=
X-Received: by 2002:aca:31cf:: with SMTP id x198mr3421203oix.132.1558448984441; 
 Tue, 21 May 2019 07:29:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190521110831.20200-1-tzimmermann@suse.de>
 <20190521124022.GL21222@phenom.ffwll.local>
 <a67d158b-e9bd-6b0e-71f6-6762527735fc@suse.de>
In-Reply-To: <a67d158b-e9bd-6b0e-71f6-6762527735fc@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 21 May 2019 16:29:33 +0200
Message-ID: <CAKMK7uG4FGSrg+ooYYSCSXzRRqgXdS_uzK7706af6+bb5zi+ug@mail.gmail.com>
Subject: Re: [PATCH 0/3] Various clean-up patches for GEM VRAM
To: Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZKnWNcIY/6UHiCwTfp5ZOf6rvagFVKmR//SGYmsxCzQ=;
 b=HyntRSSHWx4sO9Jco2kFVxhHGs1c5ypVjBIW6m5xL8M/xKbQ4vGB5Q+cG8Ec/qk9c6
 yaA6I3iXJMgTChfR2dLl3PIBApkqFD4DxqI7AUNcXZpmwWvr+GRn+iONLuR36PUdPkYA
 UZxe17rJ685tQoLBV06qRSCCqrRtAzmteb+mo=
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
 Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgNDoyNiBQTSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4gd3JvdGU6Cj4KPiBIaQo+Cj4gQW0gMjEuMDUuMTkgdW0gMTQ6NDAgc2No
cmllYiBEYW5pZWwgVmV0dGVyOgo+ID4gT24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMDE6MDg6MjhQ
TSArMDIwMCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gPj4gUmVwbGFjaW5nIGRybV9nZW1f
dnJhbV9wdXNoX3RvX3N5c3RlbSgpIG1vdmVzIHBvbGljeSBmcm9tIGRyaXZlcnMgYmFjawo+ID4+
IHRvIHRoZSBtZW1vcnkgbWFuYWdlci4gTm93LCB1bnVzZWQgQk9zIGFyZSBvbmx5IGV2aWN0ZWQg
d2hlbiB0aGUgc3BhY2UKPiA+PiBpcyByZXF1aXJlZC4KPiA+Pgo+ID4+IFRoZSBsb2NrL3VubG9j
ay1yZW5hbWluZyBwYXRjaCBhbGlnbnMgdGhlIGludGVyZmFjZSB3aXRoIG90aGVyIG5hbWVzCj4g
Pj4gaW4gRFJNLiBObyBmdW5jdGlvbmFsIGNoYW5nZXMgYXJlIGRvbmUuCj4gPj4KPiA+PiBGaW5h
bGx5LCB0aGVyZSdzIG5vdyBhIGxvY2tkZXAgYXNzZXJ0IHRoYXQgZW5zdXJlcyB3ZSBkb24ndCBj
YWxsIHRoZQo+ID4+IEdFTSBWUkFNIF9sb2NrZWQoKSBmdW5jdGlvbnMgd2l0aCBhbiB1bmxvY2tl
ZCBCTy4KPiA+Pgo+ID4+IFBhdGNoZXMgYXJlIGFnYWluc3QgYSByZWNlbnQgZHJtLXRpcCBhbmQg
dGVzdGVkIG9uIG1nYWcyMDAgYW5kIGFzdCBIVy4KPiA+Pgo+ID4+IFRob21hcyBaaW1tZXJtYW5u
ICgzKToKPiA+PiAgIGRybTogUmVwbGFjZSBkcm1fZ2VtX3ZyYW1fcHVzaF90b19zeXN0ZW0oKSB3
aXRoIGt1bm1hcCArIHVucGluCj4gPj4gICBkcm06IFJlbmFtZSByZXNlcnZlL3VucmVzZXJ2ZSB0
byBsb2NrL3VubG9jayBpbiBHRU0gVlJBTSBoZWxwZXJzCj4gPj4gICBkcm06IEFzc2VydCB0aGF0
IEJPIGlzIGxvY2tlZCBpbiBkcm1fZ2VtX3ZyYW1fe3Bpbix1bnBpbn1fbG9ja2VkKCkKPiA+Cj4g
PiBBd2Vzb21lLCB0aGFua3MgYSBsb3QgZm9yIHF1aWNrbHkgd29ya2luZyBvbiB0aGlzLiBPbiB0
aGUgc2VyaWVzOgo+ID4KPiA+IEFja2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGZmd2xsLmNoPgo+ID4KPiA+IEJ1dCBkZWZpbml0ZWx5IGdldCBzb21lb25lIHdpdGggbW9yZSBr
bm93bGVkZ2Ugb2YgdGhlIGRldGFpbHMgdG8gY2hlY2sKPiA+IHRoaXMgYWxsIGFnYWluLgo+ID4K
PiA+IEFzaWRlOiBEbyB5b3UgcGxhbiB0byBjb250aW51ZSB3b3JraW5nIG9uIGRybSBkcml2ZXJz
LAo+Cj4gWWVzLCB0aGF0J3MgbXkgam9iIGF0IFNVU0UuCj4KPiA+IGkuZS4gYW55IG5lZWQgZm9y
Cj4gPiBkcm0tbWlzYyBjb21taXQgcmlnaHRzPwo+Cj4gU3VyZS4gVGhhbmsgeW91IGZvciB5b3Vy
IHRydXN0LiBGcm9tIHdoYXQgSSBjb3VsZCBmb3VuZCBvbmxpbmUsIEkgZ3Vlc3MKPiBbMV0gYW5k
IFsyXSBhcHBsaWVzPwo+Cj4gQmVzdCByZWdhcmRzCj4gVGhvbWFzCj4KPiBbMV0KPiBodHRwczov
L2RybS5wYWdlcy5mcmVlZGVza3RvcC5vcmcvbWFpbnRhaW5lci10b29scy9jb21taXR0ZXItZHJt
LW1pc2MuaHRtbAo+IFsyXSBodHRwczovL2RybS5wYWdlcy5mcmVlZGVza3RvcC5vcmcvbWFpbnRh
aW5lci10b29scy9jb21taXQtYWNjZXNzLmh0bWwKClRoZSBnZXR0aW5nIHN0YXJ0ZWQgcGFnZSBp
cyBwcmV0dHkgdXNlZnVsIHRvbzoKCmh0dHBzOi8vZHJtLnBhZ2VzLmZyZWVkZXNrdG9wLm9yZy9t
YWludGFpbmVyLXRvb2xzL2dldHRpbmctc3RhcnRlZC5odG1sCgpXcnQgYWNjb3VudCB5b3UgbmVl
ZCBhIGxlZ2FjeSBzc2ggYWNjb3VudCBmcm9tIGhlcmU6CgpodHRwczovL3d3dy5mcmVlZGVza3Rv
cC5vcmcvd2lraS9BY2NvdW50UmVxdWVzdHMvCgpKdXN0IGhpZ2hsaWdodGluZyB0aGF0LCBpdCdz
IGFsbCBpbiB0aGUgZG9jcyB0b28sIGJ1dCBhdCBsZWFzdCBteXNlbGYKSSBnbG9zc2VkIG92ZXIg
dGhlIHJpZ2h0IGxpbmsgYSBmZXcgdGltZXMgOi0pCgpDaGVlcnMsIERhbmllbAoKPgo+ID4gQ2hl
ZXJzLCBEYW5pZWwKPiA+Cj4gPj4KPiA+PiAgZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZmIuYyAg
ICAgICAgICAgICB8IDExICsrLQo+ID4+ICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMg
ICAgICAgICAgIHwgMjYgKysrKy0tLQo+ID4+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFt
X2hlbHBlci5jICAgIHwgODYgKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCj4gPj4gIGRyaXZlcnMv
Z3B1L2RybS9kcm1fdnJhbV9oZWxwZXJfY29tbW9uLmMgfCAgMiAtCj4gPj4gIGRyaXZlcnMvZ3B1
L2RybS9tZ2FnMjAwL21nYWcyMDBfY3Vyc29yLmMgfCA0MCArKysrKy0tLS0tLQo+ID4+ICBkcml2
ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2ZiLmMgICAgIHwgMTEgKystCj4gPj4gIGRyaXZl
cnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jICAgfCAxNSArKystLQo+ID4+ICBpbmNs
dWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmggICAgICAgIHwgIDkgKystCj4gPj4gIDggZmls
ZXMgY2hhbmdlZCwgODAgaW5zZXJ0aW9ucygrKSwgMTIwIGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4g
LS0KPiA+PiAyLjIxLjAKPiA+Pgo+ID4KPgo+IC0tCj4gVGhvbWFzIFppbW1lcm1hbm4KPiBHcmFw
aGljcyBEcml2ZXIgRGV2ZWxvcGVyCj4gU1VTRSBMaW51eCBHbWJILCBNYXhmZWxkc3RyYXNzZSA1
LCA5MDQwOSBOdWVybmJlcmcsIEdlcm1hbnkKPiBHRjogRmVsaXggSW1lbmTDtnJmZmVyLCBNYXJ5
IEhpZ2dpbnMsIFNyaSBSYXNpYWgKPiBIUkIgMjEyODQgKEFHIE7DvHJuYmVyZykKPgoKCi0tIApE
YW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDAp
IDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

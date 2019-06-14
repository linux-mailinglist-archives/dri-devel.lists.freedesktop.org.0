Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 635A04633A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 17:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F038989AB9;
	Fri, 14 Jun 2019 15:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB00D89AB9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 15:46:52 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id z23so3022578ote.13
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 08:46:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KnxqNardghjLi6d9uN/CwaSGRI0AGW1i/9W5wy0vm04=;
 b=QovzXwJnGktTSpwT1BrpOqNkVaa7fiH1peU0zfI358blX0+Y86RWuqzvZfNbkHZ5lb
 euIAraozoWyzECAl/IQrz0GceToVKgR6rSzbOAK9OxtIopHMlqWJxGUewD8yggAdtRlE
 ziFhETULf1+BNVikUiNUjFNJa+E3y1VIHFIYs70XNJVU/elwZXZac7yvXcC2iD2OZrVH
 oRggEMQ+AE/8ENQAxAq/iAnw+/EyW3iQtonq0ghhJ4DgrpIhWNgfh+9AE3sOFID/5mAg
 +5TJSR5bT64/M4eR7ZAroP7DfDjY+E5jRwrOTvELufGt9V0e3ny6AEeMPVEnM/Rg/BPb
 gxTQ==
X-Gm-Message-State: APjAAAW4PZi9KSIUI3tuiCzdaJ2mewinNEk6/zWwY/X7tK+JCBh9TGdk
 WEuIz6KFRvsO0rqQoWjsdkYz8Vx5TTlGlCFb+pIRRA==
X-Google-Smtp-Source: APXvYqz3OimoHSjltX7NZvya7fcMDW8n1257KaV16gqrtlHp+uSeJ19e61tYvEzNBxbGss9n7vvUmZfKkYLONbGs6WQ=
X-Received: by 2002:a9d:7451:: with SMTP id p17mr2736625otk.204.1560526690216; 
 Fri, 14 Jun 2019 08:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190614095110.3716-1-gregkh@linuxfoundation.org>
 <20190614145908.GZ23020@phenom.ffwll.local> <20190614151958.GA18049@kroah.com>
In-Reply-To: <20190614151958.GA18049@kroah.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 14 Jun 2019 17:37:58 +0200
Message-ID: <CAKMK7uFuMHe6G2fEAuk_XY3khbA0irtzbikY7-K6+myaDU1srw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: debugfs: make drm_debugfs_remove_files() a void
 function
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=KnxqNardghjLi6d9uN/CwaSGRI0AGW1i/9W5wy0vm04=;
 b=D5YwUtbftuOex7bMe9vR8KrRQt6A/NOww3CGtXplA5wAS39sQDkGQHaxUPW1FBR7IB
 UVuEMlKNcLUtkg7xalFrLOGdjATiZBvtg3qPr+ZT6PwMmFAXU3H2oUbhAPXVu3aRjeSz
 1xa7hf232rbHVhrI9+hM/kNjQSxPHdz9YY/uI=
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
Cc: David Airlie <airlied@linux.ie>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgNToyMCBQTSBHcmVnIEtyb2FoLUhhcnRtYW4KPGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgSnVuIDE0LCAyMDE5IGF0
IDA0OjU5OjA4UE0gKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiBPbiBGcmksIEp1biAx
NCwgMjAxOSBhdCAxMTo1MTowOUFNICswMjAwLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6Cj4g
PiA+IFRoZSBmdW5jdGlvbiBjYW4gbm90IGZhaWwsIGFuZCBubyBvbmUgY2hlY2tzIHRoZSBjdXJy
ZW50IHJldHVybiB2YWx1ZSwKPiA+ID4gc28ganVzdCBtYXJrIGl0IGFzIGEgdm9pZCBmdW5jdGlv
biBzbyBubyBvbmUgZ2V0cyBjb25mdXNlZC4KPiA+ID4KPiA+ID4gQ2M6IE1hYXJ0ZW4gTGFua2hv
cnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gPiA+IENjOiBNYXhpbWUg
UmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgo+ID4gPiBDYzogU2VhbiBQYXVsIDxz
ZWFuQHBvb3JseS5ydW4+Cj4gPiA+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+
Cj4gPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gPiA+IENjOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEdyZWcgS3Jv
YWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAg
ZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzLmMgfCA1ICsrLS0tCj4gPiA+ICBpbmNsdWRlL2Ry
bS9kcm1fZGVidWdmcy5oICAgICB8IDkgKysrKy0tLS0tCj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmcy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1
Z2ZzLmMKPiA+ID4gaW5kZXggNmYyODAyZTliZmI1Li41MTU1NjkwMDJjODYgMTAwNjQ0Cj4gPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmcy5jCj4gPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZGVidWdmcy5jCj4gPiA+IEBAIC0yNzAsOCArMjcwLDggQEAgaW50IGRybV9k
ZWJ1Z2ZzX2luaXQoc3RydWN0IGRybV9taW5vciAqbWlub3IsIGludCBtaW5vcl9pZCwKPiA+ID4g
IH0KPiA+ID4KPiA+ID4KPiA+ID4gLWludCBkcm1fZGVidWdmc19yZW1vdmVfZmlsZXMoY29uc3Qg
c3RydWN0IGRybV9pbmZvX2xpc3QgKmZpbGVzLCBpbnQgY291bnQsCj4gPiA+IC0gICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX21pbm9yICptaW5vcikKPiA+ID4gK3ZvaWQgZHJtX2Rl
YnVnZnNfcmVtb3ZlX2ZpbGVzKGNvbnN0IHN0cnVjdCBkcm1faW5mb19saXN0ICpmaWxlcywgaW50
IGNvdW50LAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fbWlub3Ig
Km1pbm9yKQo+ID4KPiA+IFdlJ3JlIHRyeWluZyB0byBlbnRpcmVseSBudWtlIHRoaXMgZnVuY3Rp
b24gaGVyZSwgc2VlIHRoZSBrZXJuZWxkb2MgZm9yCj4gPiBkcm1fZGVidWdmc19jcmVhdGVfZmls
ZXMoKS4gT25seSB1c2VyIGxlZnQgaXMgdGVncmEsIGFuZCB3ZSBjYWxsIHRoZQo+ID4gInJlbW92
ZSBhbGwgZGVidWdmcyBmaWxlcyIgYW5kIHRoZSAtPmVhcmx5X3VucmVnaXN0ZXIgaG9va3MgYWxs
IGZyb20gdGhlCj4gPiBzYW1lIHBsYWNlLiBTbyB0aGlzIGNhbiBhbGwgYmUgZ2FyYmFnZSBjb2xs
ZWN0ZWQuIEl0J3MgbWlsZGx5IGFubm95aW5nCj4gPiBiZWNhdXNlIHdlJ2QgbmVlZCB0byBtb3Zl
IHRoZSBrZnJlZSBmcm9tIC0+ZWFybHlfdW5yZWdpc3RlciBpbnRvIC0+ZGVzdHJveQo+ID4gY2Fs
bGJhY2tzLCBiZWNhdXNlIGNvbm5lY3RvcnMgYXJlIHVucmVnaXN0ZXIgYmVmb3JlIHdlIHRocm93
IGF3YXkgYWxsIHRoZQo+ID4gZGVidWdmcyBmaWxlcyBpbiBkcm1fZGV2X3VucmVnaXN0ZXIoKS4g
QnV0IGltbyB0aGF0J3MgY2xlYW5lciBhbndheS4KPgo+IEkgd291bGQgbG92ZSB0byBzZWUgdGhp
cyBmdW5jdGlvbiBnb25lLCBpdCBjYW4gYWxzbyBtYWtlIHRoaW5ncyBhIGxvdAo+IHNpbXBsZXIg
ZnJvbSB0aGUgcG9pbnQgb2YgdmlldyBvZiBjcmVhdGluZyB0aGUgZGVidWdmcyBmaWxlcyBhcyB3
ZWxsLCBhcwo+IG5vIGRlbnRyaWVzIHdpbGwgbmVlZCB0byBiZSBzYXZlZC4KPgo+ID4gVXAgZm9y
IHRoYXQ/Cj4KPiBTdXJlLCBJIGNhbiBkbyB0aGF0LiAgSSBoYXZlIGEgbXVjaCBsYXJnZXIgcGF0
Y2ggbWVzc2luZyB3aXRoCj4gZHJtX2RlYnVnZnNfY3JlYXRlX2ZpbGVzKCkgdGhhdCBJIHdhbnQg
eW91IGFsbCB0byBiZSBpbiBhIGdvb2QgbW9vZCBmb3IKPiB3aGVuIEkgc3VibWl0IGl0IChpdCB0
b3VjaGVzIGFsbCBkcml2ZXJzIGF0IG9uY2UpLCBzbyBJIG1pZ2h0IGFzIHdlbGwKPiBjbGVhbiB0
aGlzIHVwIGZpcnN0IDopCgpPaCBkb24ndCB3b3JyeSwgd2UndmUgaGFkIGEgcGlsZSBvZiBjbGVh
bnVwIHRvZG8gdGFza3MgaW4gdGhpcyBhcmVhCnNpbmNlIGEgbG9uZyB0aW1lLiBZb3UgZG9pbmcg
dGhlbSBhbGwgaXMgZ29pbmcgdG8gbWFrZSBtZSBhIGhhcHB5CmNhbXBlciA6LSkKCk9ubHkgdGhp
bmcgdG8gYmUgYXdhcmUgb2YgaXMgdGhhdCB3ZSBoYXZlIGEgYml0IGEgaGFiaXQgb2YgZHJhZ2dp
bmcKZ29vZCBjb250cmlidXRvcnMgb2YgcmVmYWN0b3JpbmcvY2xlYW51cC9mdW5kYW1lbnRhbCB3
b3JrIGxpa2UgdGhpcwppbnRvIHRoZSBkcm0gZm9sZCBmb3IgZ29vZC4gWW91IG1pZ2h0IGdldCBz
dHVjayAuLi4KCj4gR2l2ZSBtZSBhIHdlZWssIEknbSBzdXBwb3NlZCB0byBiZSB3cml0aW5nIG15
IHNsaWRlcyBmb3IgYSBjb25mZXJlbmNlCj4gbm93LCBpbnN0ZWFkIEknbSBwcm9jcmFzdGluYXRp
bmcgYnkgd3JpdGluZyBkZWJ1Z2ZzIGNsZWFudXAgcGF0Y2hlcywgSQo+IG5lZWQgdG8gc3RvcC4u
LgoKOi0pCgpDaGVlcnMsIERhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVl
ciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5m
ZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

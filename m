Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F1FE1CAD
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 15:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18EBA6EAC9;
	Wed, 23 Oct 2019 13:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BEB56EACC
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 13:34:41 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id o205so17345349oib.12
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 06:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rlgAUb4WY4bYebtDST8C0ocqKTOSomIXSLYZGI3cJAU=;
 b=Ap42eDdOxIU8IeY07ub+rHNgRMCi2oqxOStVV8hs+0kSUutUQzZ+NHsLndsIM+dIhP
 NAa2gxNPySQQgZR+xnAYkEsW2IicLozfL0ollA/BumaoDb/RvvHIGc/vVbaTbTeuYRXb
 MGNIrqnMykgZxUE/B+HF9AEieDfIqYM6RdW/HzwextLqfrhJBAplvnVsVDFDHmqbs+OW
 HZqsNmvlBnbwmoIgZtVu1+KdagQ/1JzqU7fjuWYNYgjJEicZNjuAEflS+wc+jFSsZ86f
 8O8Y8sTVyvb1uZjeVTxMeyOxBnIiezppsKypWr8daTQ4IetrZoE8ufnF7ysC8BlTNqtA
 tndw==
X-Gm-Message-State: APjAAAU16i35lGHspJWnWWQOVTEXB6PsfpgDxIbcZP44Ddevd0yzXCzA
 BIe54UHS9N0O/ZrSJnOUO2B+ZyKnNxaVsXtlX6ypxw==
X-Google-Smtp-Source: APXvYqy6RDvKXlzgV6NahYfYxTpMsFQqfwHGTFFoshW8+fYVQTSO5pSR4bQUi60/9B5kzbnKoIVIfHs8KxTFUlcyEc4=
X-Received: by 2002:aca:1b10:: with SMTP id b16mr7955262oib.110.1571837680242; 
 Wed, 23 Oct 2019 06:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191018113832.5460-1-kraxel@redhat.com>
 <20191022090533.GB11828@phenom.ffwll.local>
 <87mudreh2p.fsf@intel.com>
In-Reply-To: <87mudreh2p.fsf@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 23 Oct 2019 15:34:27 +0200
Message-ID: <CAKMK7uGm7gYQoEyoZDYYzGO6OBw6AdEwHRDOPDtvNOm-ijWJMQ@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: print a single line with device features
To: Jani Nikula <jani.nikula@linux.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rlgAUb4WY4bYebtDST8C0ocqKTOSomIXSLYZGI3cJAU=;
 b=i0jlpYaBX/vOYcjTU0UXPJ7iDxNoV+6RP+NKrDfSO8B7MpNwF0xXYjeLKlOhInFTTq
 CeWj1wBO4K3Z8iR2m9Itkbz1pbmSzuKwcj8h21fX5f8O1g4QkS2Vxfshh4JIPC9TVj25
 7nhx916QgsQRibCng0aNrDPEFl3hVJtEoztmU=
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMzoxOCBQTSBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFA
bGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgMjIgT2N0IDIwMTksIERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4gd3JvdGU6Cj4gPiBPbiBGcmksIE9jdCAxOCwgMjAxOSBh
dCAwMTozODozMlBNICswMjAwLCBHZXJkIEhvZmZtYW5uIHdyb3RlOgo+ID4+IFNpZ25lZC1vZmYt
Ynk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+ID4+IC0tLQo+ID4+ICBkcml2
ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfa21zLmMgfCA5ICsrKystLS0tLQo+ID4+ICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9rbXMuYyBiL2RyaXZlcnMv
Z3B1L2RybS92aXJ0aW8vdmlydGdwdV9rbXMuYwo+ID4+IGluZGV4IDBiM2NkYjBkODNiMC4uMmY1
NzczZTQzNTU3IDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdw
dV9rbXMuYwo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9rbXMuYwo+
ID4+IEBAIC0xNTUsMTYgKzE1NSwxNSBAQCBpbnQgdmlydGlvX2dwdV9pbml0KHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYpCj4gPj4gICNpZmRlZiBfX0xJVFRMRV9FTkRJQU4KPiA+PiAgICAgIGlmICh2
aXJ0aW9faGFzX2ZlYXR1cmUodmdkZXYtPnZkZXYsIFZJUlRJT19HUFVfRl9WSVJHTCkpCj4gPj4g
ICAgICAgICAgICAgIHZnZGV2LT5oYXNfdmlyZ2xfM2QgPSB0cnVlOwo+ID4+IC0gICAgRFJNX0lO
Rk8oInZpcmdsIDNkIGFjY2VsZXJhdGlvbiAlc1xuIiwKPiA+PiAtICAgICAgICAgICAgIHZnZGV2
LT5oYXNfdmlyZ2xfM2QgPyAiZW5hYmxlZCIgOiAibm90IHN1cHBvcnRlZCBieSBob3N0Iik7Cj4g
Pj4gLSNlbHNlCj4gPj4gLSAgICBEUk1fSU5GTygidmlyZ2wgM2QgYWNjZWxlcmF0aW9uIG5vdCBz
dXBwb3J0ZWQgYnkgZ3Vlc3RcbiIpOwo+ID4+ICAjZW5kaWYKPiA+PiAgICAgIGlmICh2aXJ0aW9f
aGFzX2ZlYXR1cmUodmdkZXYtPnZkZXYsIFZJUlRJT19HUFVfRl9FRElEKSkgewo+ID4+ICAgICAg
ICAgICAgICB2Z2Rldi0+aGFzX2VkaWQgPSB0cnVlOwo+ID4+IC0gICAgICAgICAgICBEUk1fSU5G
TygiRURJRCBzdXBwb3J0IGF2YWlsYWJsZS5cbiIpOwo+ID4+ICAgICAgfQo+ID4+Cj4gPj4gKyAg
ICBEUk1fSU5GTygiZmVhdHVyZXM6ICVjdmlyZ2wgJWNlZGlkXG4iLAo+ID4+ICsgICAgICAgICAg
ICAgdmdkZXYtPmhhc192aXJnbF8zZCA/ICcrJyA6ICctJywKPiA+PiArICAgICAgICAgICAgIHZn
ZGV2LT5oYXNfZWRpZCAgICAgPyAnKycgOiAnLScpOwo+ID4KPiA+IE1heWJlIHdlIHNob3VsZCBt
b3ZlIHRoZSB2YXJpb3VzIHllc25vL29ub2ZmL2VuYWJsZWRkaXNhYmxlZCBoZWxwZXJzIGZyb20K
PiA+IGk5MTVfdXRpbHMuaCB0byBkcm1fdXRpbHMuaCBhbmQgdXNlIHRoZW0gbW9yZSB3aWRlbHk/
Cj4KPiBJJ20gdHJ5aW5nIHRvIHRha2UgaXQgb25lIHN0ZXAgZnVydGhlciBieSBhZGRpbmcgdGhl
bSB0bwo+IGluY2x1ZGUvbGludXgvc3RyaW5nLWNob2ljZS5oIFsxXS4gTWF5YmUsIHVoLCBmb3Vy
dGggdGltZSdzIHRoZSBjaGFybT8KPgo+IEJSLAo+IEphbmkuCj4KPiBbMV0gaHR0cDovL2xvcmUu
a2VybmVsLm9yZy9yLzIwMTkxMDIzMTMxMzA4Ljk0MjAtMS1qYW5pLm5pa3VsYUBpbnRlbC5jb20K
Ck9oIG5pY2UsIHItYjogbWUgb24gdGhhdC4KCkkgdGhpbmsgdGhlIHJ1bGUgZm9yIG5ldyBoZWFk
ZXJzIGxpa2UgdGhpcyBpcyAianVzdCBkbyBpdCIgb25jZSB5b3UKaGF2ZSBlbm91Z2ggc2VuaW9y
IGtlcm5lbCBtYWludGFpbmVycycgYXBwcm92YWwuIE1heWJlIGFzayBEYXZlIEFpcmxpZQpmb3Ig
YWNrIGFuZCB3aXRoIEdyZWcncyByLWIgdGhlbiBqdXN0IHN0dWZmIGl0IGludG8gZHJtLW1pc2Mt
bmV4dCBvcgpzbz8KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwg
SW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZnds
bC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

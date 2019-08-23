Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 581C39AA5A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 10:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2716EC24;
	Fri, 23 Aug 2019 08:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4FDA6EC24
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 08:30:47 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id y8so6425321oih.10
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 01:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Haa4j58fLaSBjJqXMnag8rbrgCPwng0ffC18BztaxU=;
 b=RW/71aCx8AG0b8KmhXZ+4txTagOoXad8l4rFbVgaygpayk5Zq2zfndw8tEIt3qzidL
 hSMR8q9LlTsFSSVxVJKQkCdI4Htg/OTOGd3zEn/wmvYEvU8XEyXP7U2v0RdOrlHfVSTu
 pnAiKwL80HrqnabPIhY0wFzMZTdMtCwZ4AlHecXFaTDNdypVJK63fGH+ipQZSZAtap0f
 gf3pGOvxy1AQP62DwWAg1qbrOz1zD24fD74MPcgidd2svTAVTDbUmluLWmHD4/A/oMMe
 g1n/pQbuPZOeSCIHIB+0VGgabZPH43aQWfrUs/9pR38rRBdGIiKfqqbwkcSIgx82IGZI
 fKXA==
X-Gm-Message-State: APjAAAXSjkcfEKlzWEvHQ9zDSPd15526o2CyrihrpVc2e+MtRuF3J9OZ
 ryqwmOzWvRJFPhFv7LTAoNfTf4BUqV9fclpdCENZKQ==
X-Google-Smtp-Source: APXvYqyel4N9lji0LZnwqySHP3VoxVN3B4KZuIVPDiWoFwZLFjvJeky/WLyPnAbI0CraZwJJPYljhnCQ96xgt62zvPI=
X-Received: by 2002:aca:b104:: with SMTP id a4mr2332940oif.14.1566549046746;
 Fri, 23 Aug 2019 01:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190822090645.25410-1-kraxel@redhat.com>
 <20190822090645.25410-4-kraxel@redhat.com>
 <20190822131314.GX11147@phenom.ffwll.local>
 <20190823081427.hukub5ozdyqodfia@sirius.home.kraxel.org>
In-Reply-To: <20190823081427.hukub5ozdyqodfia@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 23 Aug 2019 10:30:35 +0200
Message-ID: <CAKMK7uET5HhoVmiTyUma1rdK67-w9GrnGwiy5W9XQKP+OLx3jg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/i915: switch to
 drm_fb_helper_remove_conflicting_pci_framebuffers
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=4Haa4j58fLaSBjJqXMnag8rbrgCPwng0ffC18BztaxU=;
 b=WSM0z75w99p7fMPlYwB6hA3S7AEkAm7NjjsPUR0aEp/+afxztMW9RM4uyZVhlzsdSY
 fXMUn1T07I+0ZKzssi3i9A8Mh1NL47vDCPQvgwYufcNBT8Z8JmJCr32vILqqO8t1BZXx
 uWGwlgKRmoQrJf9B5QT5ve43+z1+bTGmoGUbo=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMTA6MTQgQU0gR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJl
ZGhhdC5jb20+IHdyb3RlOgo+IE9uIFRodSwgQXVnIDIyLCAyMDE5IGF0IDAzOjEzOjE0UE0gKzAy
MDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiBPbiBUaHUsIEF1ZyAyMiwgMjAxOSBhdCAxMTow
Njo0NUFNICswMjAwLCBHZXJkIEhvZmZtYW5uIHdyb3RlOgo+ID4gPiBObyBuZWVkIGZvciBhIGhv
bWUtZ3Jvd24gdmVyc2lvbiwgdGhlIGdlbmVyaWMgaGVscGVyIHNob3VsZCB3b3JrIGp1c3QKPiA+
ID4gZmluZS4gIEl0IGFsc28gaGFuZGxlcyB2Z2Fjb24gcmVtb3ZhbCB0aGVzZSBkYXlzLCBzZWUg
Y29tbWl0Cj4gPiA+IDFjNzRjYTdhMWE5YSAoImRybS9mYi1oZWxwZXI6IGNhbGwgdmdhX3JlbW92
ZV92Z2Fjb24gYXV0b21hdGljYWxseS4iKSwKPiA+ID4gc28gdGhhdCBjYW4gYmUgcmVtb3ZlZCB0
b28uCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRo
YXQuY29tPgo+ID4KPiA+IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGZmd2xsLmNoPgo+ID4KPiA+IEkgdGhpbmsgSSdkIHN0aWxsIHdhaXQgdW50aWwgNS40LXJjMSB3
aXRoIG1lcmdpbmcgdGhpcyBvbmUsIGp1c3QgdG8gZ2l2ZQo+ID4gYW5vdGhlciBmdWxsIHJlbGVh
c2UgYW5kIHBlb3BsZSB0byB0ZXN0IGl0IGJlZm9yZSB3ZSBwdWxsIHRoZSB0cmlnZ2VyLgo+ID4g
T3ZlcmFidW5kYW5jZSBvZiBjYXV0aW9uIGFuZCBhbGwgdGhhdC4KPgo+IFdob2xlIHNlcmllcyBv
ciBqdXN0IHRoZSBpOTE1IHBhdGNoPwoKT2sgSSBqdXN0IGNoZWNrZWQgYW5kIHRoaXMgYWxsIGxh
bmRlZCBpbiA1LjEgYWxyZWFkeSwgSSB0aG91Z2h0IGl0IHdhcwptb3JlIHJlY2VudC4gSSB0aGlu
ayB0aGF0J3MgZ29vZCBlbm91Z2gsIHB1c2ggaXQgYWxsIHdpdGhvdXQgbW9yZQp3YWl0aW5nLgot
RGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

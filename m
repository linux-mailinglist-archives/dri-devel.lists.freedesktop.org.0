Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 760AC295048
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 17:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2676C6EB87;
	Wed, 21 Oct 2020 15:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3776EB87
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 15:58:44 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id w141so2623224oia.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 08:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uefbdduw/5ZoeGg3bhrmAFGANnlclvWaDehsItYgOEE=;
 b=QLidTysJbFkjfJf7+5cRDAjVXsJPOS3KDbkWhcnLiaAzLd418JdMRiiLeC5QzUkrq4
 X15AwRLvcMHDuxZ0rJ/5qtkuIP8Q+1e2mOPDwjma7f83jUWCKoW4S0abbJX+/BviRgnG
 fmwC5FLuGlpMeIgY+CxNcd9p5FWfiOOktoYFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uefbdduw/5ZoeGg3bhrmAFGANnlclvWaDehsItYgOEE=;
 b=PM9XNnAp0oKtJRkcTWHgRXBJlTUTnJ8TLhDp366Lv84uDMPUWHWDXNg8OXgSXJAEvz
 Csh8JI1pxj3lJeDtcfLpPwP5TT5bR32wRKJ6ZCRJHF66WWlrifrOicc4h08ipX40v62Z
 T9Z8EUJssNYMzFqkhTGZNynyrEEzovorG+2qMzIPiPJk9MJofTssNn7qaLGiJf10vknL
 Bj6+UnMqg+/N5+ED82JM7f5mdIIMuSFW4xrQ8vbsvSsT9nSeBoK/5MDuF3EfPiDZyo+r
 lWEvyMdinK/WFYUCtomtBBzTriM7qhrQzqAsGAxGareG7u9GYushMZFAs4VpYOF0qzrk
 m1qA==
X-Gm-Message-State: AOAM5335Ve8n0v/lhu/N5qYRROinlLbUSgXRT8TrM+FD5NZEnR+3dPVG
 zqUs9K6vT5ZvJUSSLSF/3HGkNEUOUdg5a9dBd7gRcQ==
X-Google-Smtp-Source: ABdhPJzT0Y1fGVrB/B9F4mlTQ2CvlQB8GfsynOqfyPt+PuW2CPV+cF+Mw9HY08I1s+Mq/I3LsBGhv1ISFfNmFFLZfZQ=
X-Received: by 2002:aca:cc01:: with SMTP id c1mr2795067oig.128.1603295923809; 
 Wed, 21 Oct 2020 08:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20201021065404.1336797-1-kenbshuang@google.com>
 <xyxxV-NdH-NcnbRURBYThCKj5j6VFLMi0twD2wptimtzrod1EyQ_Rp5BYQoQlVKUXsmZGxhrltrYBW4dgD4UDvgKSgW2CAzt_Q1e5bCNWlk=@emersion.fr>
 <20201021083415.GN401619@phenom.ffwll.local>
 <CAJxBc99xxc1S6CrE0KswPpY2Rf3KS0AQewNZQOfmOTbMWrtnTA@mail.gmail.com>
In-Reply-To: <CAJxBc99xxc1S6CrE0KswPpY2Rf3KS0AQewNZQOfmOTbMWrtnTA@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 21 Oct 2020 17:58:32 +0200
Message-ID: <CAKMK7uECj12NaOeh3PzLM8C_oT=_bce515z-5rDGnjkKf92Htw@mail.gmail.com>
Subject: Re: [PATCH] drm: add client cap to expose low power modes
To: Ken Huang <kenbshuang@google.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Adrian Salido <salidoa@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMjEsIDIwMjAgYXQgNDo1OSBQTSBLZW4gSHVhbmcgPGtlbmJzaHVhbmdAZ29v
Z2xlLmNvbT4gd3JvdGU6Cj4KPiBIaSBBbGwsCj4KPiBJdCdzIHVzZWZ1bCBpbiBBbmRyb2lkIGFu
ZCBvdGhlciBlbWJlZGRlZCBkZXZpY2VzIHRvIGltcGxlbWVudCBBbHdheXMgT24gRGlzcGxheSAo
ZXguIHNob3dpbmcgY2xvY2sgZmFjZXMgd2l0aCBsZXNzIHRoYW4gMTUlIE9QUiBvbiBzY3JlZW4p
Lgo+Cj4gT1BSIChPbiBQaXhlbCBSYXRpbykgaXMgdGhlIHBlcmNlbnRhZ2Ugb2YgbHVtaW5hbmNl
IGFtb3VudCBvdmVyIHRoZSBkaXNwbGF5IGFyZWEuCj4gSXQncyBkZXJpdmVkIGJ5IGdyYXkgbGV2
ZWxzIG9mIGRpc3BsYXkgaW1hZ2UgcGF0dGVybiBhbmQgdGhlIGJhY2tsaWdodCAob3IgT0xFRCkg
ZHJpdmluZyBmb3JjZSAob3IgY3VycmVudCkuCj4gZXg6IE9QUj0xMDAlIG1lYW5zIGEgZnVsbCB3
aGl0ZSBwYXR0ZXJuIHdpdGggbWF4aW11bSBiYWNrbGlnaHQgKG9yIE9MRUQpIGJyaWdodG5lc3Ms
IHdoaWxlIGZ1bGwgYmxhY2sgd291bGQgYmUgT1BSPTAlLgo+Cj4gSW4gdXNlcnNwYWNlLCB3aGVu
IHRoZSBjbGllbnQgaW5pdGlhbGl6ZXMsIHdlIGNhbiBzZXQgY2FwYWJpbGl0eSB2aWEgZHJtU2V0
Q2xpZW50Q2FwKCkgdG8gYXNrIHRoZSBkaXNwbGF5IGRyaXZlciB0byBleHBvc2UgdGhlIGRybSBt
b2RlcyB3aXRoIERSTV9NT0RFX0ZMQUdfTE9XX1BPV0VSIGZsYWcuCj4gVXNlcnNwYWNlIGNhbiBj
aGVjayBEUk1fTU9ERV9GTEFHX0xPV19QT1dFUiBmbGFnIHRvIGtub3cgd2hpY2ggbW9kZXMgY2Fu
IGJlIHVzZWQgdG8gY29uc3VtZSB0aGUgbGVhc3QgYW1vdW50IG9mIHBvd2VyIGR1cmluZyBBbHdh
eXMgT24gRGlzcGxheS4KPiBJZ25vcmluZyBtb2RlcyB3aXRoIHRoaXMgZmxhZyBzZXQgZHVyaW5n
IG5vcm1hbCBvcGVyYXRpbmcgbW9kZS4KCkhtIEknbSBub3QgcmVhbGx5IHN1cmUgd2hhdCB0aGlz
IGNoYW5nZXMgLi4uIEkgdGhpbmsgd2UgbmVlZCB0aGUKZW50aXJlIHBpbGUgb2YgcGF0Y2hlczog
VXNlcnNwYWNlLCBkcml2ZXIsIGRybSBjb3JlLCBhbnl0aGluZyBlbHNlLgpKdXN0IGFkZGluZyB0
aGlzIGZsYWcgZG9lc24ndCBtYWtlIG11Y2ggc2Vuc2UgcmVhbGx5LCBzaW5jZSBJIGhhdmUgbm8K
aWRlYSB3aGF0IHRoZSBzZW1hbnRpY3MgYXJlLiBFdmVuIGFmdGVyIHlvdSd2ZSBleHBsYWluZWQg
dGhlIHVzZS1jYXNlLgoKQWxzbyBmb3IgbmV3IGttcyB1YXBpIHdlIG5lZWQgYW4gaWd0IHRlc3Rj
YXNlIHRvIGV4ZXJjaXNlIHRoaXMgYW5kCm1ha2Ugc3VyZSBpdCB3b3Jrcy4KLURhbmllbAoKPgo+
IFRoYW5rcywKPiBLZW4KPgo+IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4g5pa8IDIw
MjDlubQxMOaciDIx5pelIOmAseS4iSDkuIvljYg0OjM05a+r6YGT77yaCj4+Cj4+IE9uIFdlZCwg
T2N0IDIxLCAyMDIwIGF0IDA3OjQwOjQ4QU0gKzAwMDAsIFNpbW9uIFNlciB3cm90ZToKPj4gPiBP
biBXZWRuZXNkYXksIE9jdG9iZXIgMjEsIDIwMjAgODo1NCBBTSwgS2VuIEh1YW5nIDxrZW5ic2h1
YW5nQGdvb2dsZS5jb20+IHdyb3RlOgo+PiA+Cj4+ID4gPiBGcm9tOiBBZHJpYW4gU2FsaWRvIHNh
bGlkb2FAZ29vZ2xlLmNvbQo+PiA+ID4KPj4gPiA+IFNvbWUgZGlzcGxheXMgbWF5IHN1cHBvcnQg
TG93IFBvd2VyIG1vZGVzLCBob3dldmVyLCB0aGVzZSBtb2RlcyBtYXkKPj4gPiA+IHJlcXVpcmUg
c3BlY2lhbCBoYW5kbGluZyBhcyB0aGV5IHdvdWxkIHVzdWFsbHkgcmVxdWlyZSBsb3dlciBPUFIK
Pj4gPiA+IGNvbnRlbnQgb24gZnJhbWVidWZmZXJzLgo+PiA+Cj4+ID4gSSdtIG5vdCBmYW1pbGlh
ciB3aXRoIE9QUi4gQ2FuIHlvdSBleHBsYWluIHdoYXQgaXQgaXMgYW5kIHdoYXQgaXQgbWVhbnMK
Pj4gPiBmb3IgdXNlci1zcGFjZT8KPj4KPj4gQWxzbyBzaW5jZSB0aGlzIGlzIG5ldyB1YXBpLCBJ
IGd1ZXNzIGJlc3QgZXhwbGFuYXRpb24gd291bGQgaW5jbHVkZSB0aGUKPj4gdXNlcnNwYWNlIGNv
ZGUgdGhhdCBtYWtlcyBzZW5zaWJsZSB1c2Ugb2YgdGhpcy4KPj4gLURhbmllbAo+PiAtLQo+PiBE
YW5pZWwgVmV0dGVyCj4+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+PiBo
dHRwOi8vYmxvZy5mZndsbC5jaAoKCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVl
ciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

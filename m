Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C78B129AD5
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 17:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29BF6E093;
	Fri, 24 May 2019 15:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89636E110
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 15:18:38 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id m3so10427290wrv.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 08:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=N0XKiAmNmVeuZluN9Cs8L0X1YNvwbmqa2mUAp19Q6ik=;
 b=MS2lYs1ndDhoi2EM7I5a8zpf4bqYBN2A36FxWED3eTFaE82np3IYtZNjx1JjpiKbiz
 BkupKLy53R/zpYVUbVTN23V+6tFnP8qCtj+PuysnJm5XV/MKWH22crSOhQuWfViECxr4
 Cd/yG5SbH9vrKDADauAMpWTmwHEM5rhdk9rqNLgjrYqvll+3zCeHHHIbwGvAgjxD2o60
 ronZOX7YpS5IU+Y8Tru1V+/SnJZEFzqlIryMAaWHFObjmwHkBiOOQoO7VP9hseYmQx1R
 cWMqqDt+114M4mOdM2n8OXUFceZEhfgiNu3YL+a6KoPfBngoeorRl5jHHyreoyegkRPY
 EPfA==
X-Gm-Message-State: APjAAAUYAqnpVP7Z/JuP4f4IDCNBOkeCXKS5LHOM/9ocPpXLqUx/uRBW
 2rNESmZgJwnWXy/tjkdaRGo=
X-Google-Smtp-Source: APXvYqxN1jfueZfW4O5LuBO6EuVruHUQVIKdciT0ojqIaRh3s8IH/hak1UHodH9t6tvi4kGeCJAMLw==
X-Received: by 2002:a5d:638a:: with SMTP id p10mr8104074wru.273.1558711117435; 
 Fri, 24 May 2019 08:18:37 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id d3sm1708240wrs.8.2019.05.24.08.18.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 24 May 2019 08:18:36 -0700 (PDT)
Date: Fri, 24 May 2019 16:17:16 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 4/4] drm/TODO: add a task to kill DRM_UNLOCKED
Message-ID: <20190524151716.GB8938@arch-x1c3>
References: <20190522154702.16269-1-emil.l.velikov@gmail.com>
 <20190522154702.16269-4-emil.l.velikov@gmail.com>
 <20190522161259.GV21222@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190522161259.GV21222@phenom.ffwll.local>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=N0XKiAmNmVeuZluN9Cs8L0X1YNvwbmqa2mUAp19Q6ik=;
 b=NE6+Vm/YaRnovZ1Zm2bXvW2UnKV4hFouh3b+dyzuUNfiL0FOKBWHXNHQISuzLSZ+a7
 EOWVA4f8aJhUIL1Vo5ilUTyED5OkPXO7rPPJbv6Ex5lXmos5tl1sbJg/drI2uCuZZW6y
 8R2dRnHIlK/MsEoEl4ONQlheKgwTQ9wFPAkZHiKuaSM6Vnbo5IwrIKWqOOu19m/HvVsS
 d42MVDTbFw1iz9RFZhPrksq+FVLUdWZvqHv1M5G7OLxyl11iDQvmxRgUheJZPsgjLFol
 ZLwwy6uzmIexcChEcBkeVOdbzfIsbnHgcUTGxfjqqzDhZlUdAwDzSfC6WoMH7Q7kM//O
 6NJg==
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
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNS8yMiwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBXZWQsIE1heSAyMiwgMjAx
OSBhdCAwNDo0NzowMlBNICswMTAwLCBFbWlsIFZlbGlrb3Ygd3JvdGU6Cj4gPiBGcm9tOiBFbWls
IFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+ID4gCj4gPiBTaG91bGQgbWlu
aW1pc2UgdGhlIGNvcHkvcGFzdGUgbWlzdGFrZXMsIGZpeGVkIHdpdGggcHJldmlvdXMgcGF0Y2hl
cy4KPiA+IAo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+IFNpZ25l
ZC1vZmYtYnk6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gPiAt
LS0KPiA+IERhbmllbCwgbm90IDEwMCUgc29sZCBvbiB0aGUgaWRlYS4gVGhhdCBwbHVzIGxpc3Rp
bmcgeW91IGFzIGEgY29udGFjdAo+ID4gcG9pbnQgOy0pCj4gPiAKPiA+IFdoYXQgZG8geW91IHRo
aW5nPwo+ID4gRW1pbAo+ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgfCAx
OSArKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMo
KykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IGIvRG9j
dW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKPiA+IGluZGV4IDY2ZjA1ZjRlNDY5Zi4uOWU2N2QxMjVm
MmZkIDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKPiA+ICsrKyBi
L0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0Cj4gPiBAQCAtMzk3LDYgKzM5NywyNSBAQCBTb21l
IG9mIHRoZXNlIGRhdGUgZnJvbSB0aGUgdmVyeSBpbnRyb2R1Y3Rpb24gb2YgS01TIGluIDIwMDgg
Li4uCj4gPiAgICBlbmQsIGZvciB3aGljaCB3ZSBjb3VsZCBhZGQgZHJtXypfY2xlYW51cF9rZnJl
ZSgpLiBBbmQgdGhlbiB0aGVyZSdzIHRoZSAoZm9yCj4gPiAgICBoaXN0b3JpY2FsIHJlYXNvbnMp
IG1pc25hbWVkIGRybV9wcmltYXJ5X2hlbHBlcl9kZXN0cm95KCkgZnVuY3Rpb24uCj4gPiAgCj4g
PiArVXNlIERSTV9MT0NLRUQgaW5zdGVhZCBvZiBEUk1fVU5MT0NLRUQKPiA+ICstLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gKwo+ID4gK0RSTV9VTkxPQ0tFRCBpcyBh
IHJlbWFpbmRlciBmcm9tIHRoZSBsZWdhY3kgRFJNIGRyaXZlcnMuIFNlZW1pbmdseSBkcml2ZXJz
IGdldAo+ID4gK3RyaWNrZWQgYnkgaXQgYW5kIGl0IGVuZHMgdXAgaW4gdGhlIGRyaXZlciBwcml2
YXRlIGlvY3Rscy4KPiA+ICsKPiA+ICtUb2RheSBubyBtb3JlIGxlZ2FjeSBkcml2ZXJzIGFyZSBh
bGxvd2VkIGFuZCBtb3N0IGNvcmUgRFJNIGlvY3RscyBhcmUgdW5sb2NrZWQuCj4gPiArCj4gPiAr
SW50cm9kdWNlIERSTV9MT0NLRUQsIHVzZSBpdCB0byBhbm5vdGF0ZSBvbmx5IHRoZSByZWxldmFu
dCBpb2N0bHMgYW5kIGtpbGwgdGhlCj4gPiArb2xkIERSTV9VTkxPQ0tFRC4KPiA+ICsKPiA+ICtQ
YXRjaCBzZXJpZXMgc2hvdWxkIGJlIHNwbGl0IGFzIGZvbGxvd3M6Cj4gPiArIC0gUGF0Y2ggMTog
ZHJtOiBhZGQgdGhlIG5ldyBEUk1fTE9DS0VEIGZsYWcgYW5kIGhvbm91ciBpdAo+ID4gKyAtIFBh
dGNoIDI6IGRybTogY29udmVydCBjb3JlIGlvY3RscyBmcm9tIERSTV9VTkxPQ0tFRCB0byBEUk1f
TE9DS0VECj4gPiArIC0gUGF0Y2ggMy0uLi46IGRybS9kcml2ZXJYOiBjb252ZXJ0IGRyaXZlciBp
b2N0bHMgZnJvbSAuLi4KPiA+ICsgLSBQYXRjaCBYOiBkcm06IHJlbW92ZSBubyBsb25nZXIgdXNl
ZCBEUk1fVU5MT0NLRUQsIGRyb3AgdG9kbyBpdGVtCj4gCj4gU2VlbXMgbGlrZSB0b28gbXVjaCBi
b3RoZXIgZm9yIGxlZ2FjeSBkcml2ZXJzIC4uLiBXaGF0IEknZCBkbyBpcyBzb21ldGhpbmcKPiBh
IGxvdCBjaGVhcGVyLCBzaW5jZSBhbGwgd2UncmUgdG91Y2hpbmcgaGVyZSBhcmUgbGVnYWN5IGRy
aXZlcnM6Cj4gCj4gUmVtb3ZlIERSTV9VTkxPQ0tFRCBmcm9tIGV2ZXJ5dGhpbmcgZXhjZXB0IHRo
ZSBvbGQgdmJsYW5rIGlvY3RsLiBUaGF0IG9uZQo+IHdlIG5lZWQgdG8ga2VlcCwgYmVjYXVzZSBp
dCBmcmVlemVzIFg6Cj4gCj4gY29tbWl0IDhmNGZmMmIwNmFmY2Q2ZjE1MTg2ODQ3NGE0MzJjNjAz
MDU3ZWFmNTYKPiBBdXRob3I6IElsaWphIEhhZHppYyA8aWhhZHppY0ByZXNlYXJjaC5iZWxsLWxh
YnMuY29tPgo+IERhdGU6ICAgTW9uIE9jdCAzMSAxNzo0NjoxOCAyMDExIC0wNDAwCj4gCj4gICAg
IGRybTogZG8gbm90IHNsZWVwIG9uIHZibGFuayB3aGlsZSBob2xkaW5nIGEgbXV0ZXgKPiAKPiBB
bnl0aGluZyBlbHNlIEkgdGhpbmsgaXMgZWl0aGVyIG5ldmVyIHVzZWQgYnkgbGVnYWN5IHVzZXJz
cGFjZSwgb3IganVzdAo+IGRvZXNuJ3QgbWF0dGVyLiBUaGF0J3Mgc2ltcGxlIGVub3VnaCB0aGF0
IEkgZG9uJ3QgdGhpbmsgd2UgcmVhbGx5IG5lZWQgYQo+IHRvZG8gZm9yIGl0IDotKSBJIGd1ZXNz
IGlmIHlvdSB3YW50IHRvIGtpbGwgRFJNX1VOTE9DS0VEIHlvdSBjb3VsZCByZXBsYWNlCj4gdGhl
IGNoZWNrIHdpdGggaW9jdGwtPmZ1bmMgPT0gZHJtX3ZibGFua19pb2N0bCwgb2ZjIG9ubHkgaW4g
dGhlCj4gRFJJVkVSX0xFR0FDWSBwYXRoLgo+IApTb3VuZHMgbGlrZSBhIG11Y2ggc2ltcGxlciBz
b2x1dGlvbiBpbmRlZWQuIFNhZGx5IEkgZG9uJ3QgaGF2ZSBtdWNoIHRpbWUgdG8KZG91YmxlLWNo
ZWNrIHRoYXQgdGhpcyB3b24ndCBjYXVzZSBwcm9ibGVtcyBlbHNld2hlcmUsIHNvIEknbGwgbGVh
dmUgaXQgdGhhdAp0byBzb21lb25lIGVsc2UuCgo+IE9uIHBhdGNoZXMgMS0zIGluIHlvdXIgc2Vy
aWVzOgo+IAo+IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xs
LmNoPgo+IApUaGFuayB5b3UgdmVyeSBtdWNoLgoKLUVtaWwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

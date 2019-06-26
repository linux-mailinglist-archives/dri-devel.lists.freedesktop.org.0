Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D4C56C63
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 16:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4976E427;
	Wed, 26 Jun 2019 14:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3AAF6E427
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 14:41:41 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id k20so5528414ios.10
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 07:41:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DgyZrV/0GXyIl5zMpVdez37+pt0NN6PZa+e8Yh9Hijw=;
 b=eSnmymlMlVqbrSP2CVdHbdl9kEn3Wq46QqcT8/Rz2FE6F4gGo7kfsjfXRFAgpqKvJi
 nauY2JWHkjnT9fI2ItKNo1QZ/CMKdYcx34ovuxfIozP/5czeuHHzhKPAPV9+rpQsV1Fb
 Fn298Wa52vT9NJRiLDj1/q61dCkjdkjJd5fknXIGR+ltICc4aRzmajdBV0Kwe6W54rTH
 jXryeqTPHdRzVOPMjAs0gNQZ9chHgf8FmLCCB2hX8cFL3ajL+NHNXWwi11EROUp3H+F4
 z8hYkBQyEnadhLhlla7y49K6mVJIQNA3KwJsI+1lgGd4V/EPvN/bYPYAzTFR51mFhGQv
 VQsQ==
X-Gm-Message-State: APjAAAVLTUtkmZp6ZZxqTNcmBPaWHZHAWIU8R/7vwn36Xu9pEHX7+hyz
 DcdzyB7zlmFjM4ZU1BDeTxHzBKOhm88=
X-Google-Smtp-Source: APXvYqxB5OeLTMwmG4J6PY2qJw6NjG2kL9Mha7yXC//PHKZ0pl/FXw6P5eSY3QmYNePFAuy51PNWGg==
X-Received: by 2002:a5d:96d8:: with SMTP id r24mr5509426iol.269.1561560101117; 
 Wed, 26 Jun 2019 07:41:41 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com.
 [209.85.166.48])
 by smtp.gmail.com with ESMTPSA id a8sm15783898ioh.29.2019.06.26.07.41.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Jun 2019 07:41:38 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id u19so2801835ior.9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 07:41:37 -0700 (PDT)
X-Received: by 2002:a02:aa1d:: with SMTP id r29mr5324399jam.127.1561560097502; 
 Wed, 26 Jun 2019 07:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190626130007.GE23428@ravnborg.org>
In-Reply-To: <20190626130007.GE23428@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 26 Jun 2019 07:41:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U4UU8q+CS76uuuGUP=EVnE6+BTUf8U=j7uwfczNgkrZw@mail.gmail.com>
Message-ID: <CAD=FV=U4UU8q+CS76uuuGUP=EVnE6+BTUf8U=j7uwfczNgkrZw@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] drm/panel: simple: Add mode support to devicetree
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=DgyZrV/0GXyIl5zMpVdez37+pt0NN6PZa+e8Yh9Hijw=;
 b=dOdIhYXTF+no3YlbD2CeiKg6dat5l5CZOYD1xXFNvcNIBlAs26LBlatTYEcR2hhgI7
 H9zsMLsH3VQ22LOEebISJz7Gu5FaNqEkZLSey44RurxttEJ7oggMzJFFrJxCMhUlqrk1
 Z9EaitNaYGsRLgbaGEakPUC+tbKPTUuNIqIRc=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?Q?Enric_Balletb=C3=B2?= <enric.balletbo@collabora.com>,
 Klaus Goger <klaus.goger@theobroma-systems.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, Matthias Kaehlcke <mka@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBXZWQsIEp1biAyNiwgMjAxOSBhdCA2OjAwIEFNIFNhbSBSYXZuYm9yZyA8c2FtQHJh
dm5ib3JnLm9yZz4gd3JvdGU6Cj4KPiBIaSBEb3VnbGFzLgo+Cj4gT24gTW9uLCBBcHIgMDEsIDIw
MTkgYXQgMTA6MTc6MTdBTSAtMDcwMCwgRG91Z2xhcyBBbmRlcnNvbiB3cm90ZToKPiA+IEknbSBy
ZXZpdmluZyBTZWFuIFBhdWwncyBvbGQgcGF0Y2hzZXQgdG8gZ2V0IG1vZGUgc3VwcG9ydCBpbiBk
ZXZpY2UKPiA+IHRyZWUuICBUaGUgY292ZXIgbGV0dGVyIGZvciBoaXMgdjMgaXMgYXQ6Cj4gPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOC1GZWJy
dWFyeS8xNjUxNjIuaHRtbAo+ID4KPiA+IE5vIGNvZGUgaXMgZGlmZmVyZW50IGJldHdlZW4gdjQg
YW5kIHY1LCBqdXN0IGNvbW1pdCBtZXNzYWdlcyBhbmQgdGV4dAo+ID4gaW4gdGhlIGJpbmRpbmdz
Lgo+ID4KPiA+IEkndmUgcHVsbGVkIHRvZ2V0aGVyIHRoZSBwYXRjaGVzIHRoYXQgZGlkbid0IGxh
bmQgaW4gdjMsIGFkZHJlc3NlZAo+ID4gb3V0c3RhbmRpbmcgZmVlZGJhY2ssIGFuZCByZXBvc3Rl
ZC4gIEF0b3AgdGhlbSBJJ3ZlIGFkZGVkIHBhdGNoZXMgZm9yCj4gPiByazMyODgtdmV5cm9uLWNo
cm9tZWJvb2sgKHVzZWQgZm9yIGphcSwgamVycnksIG1pZ2h0eSwgc3BlZWR5KSBhbmQKPiA+IHJr
MzI4OC12ZXJ5b24tbWlubmllLgo+ID4KPiA+IFBsZWFzZSBsZXQgbWUga25vdyBob3cgdGhleSBs
b29rLgo+ID4KPiA+IEluIGdlbmVyYWwgSSBoYXZlIGFkZGVkIHBlb3BsZSB0byB0aGUgd2hvbGUg
c2VyaWVzIHdobyBJIHRoaW5rIHdvdWxkCj4gPiBsaWtlIHRoZSB3aG9sZSBzZXJpZXMgYW5kIHRo
ZW4gbGV0IGdldF9tYWludGFpbmVyIHBpY2sgZXh0cmEgcGVvcGxlIGl0Cj4gPiB0aGlua3MgYXJl
IHJlbGV2YW50IHRvIGVhY2ggaW5kaXZpZHVhbCBwYXRjaC4gIElmIEkgc2VlIHlvdSByZXNwb25k
IHRvCj4gPiBhbnkgb2YgdGhlIHBhdGNoZXMgaW4gdGhlIHNlcmllcywgdGhvdWdoLCBJJ2xsIGFk
ZCB5b3UgdG8gdGhlIHdob2xlCj4gPiBzZXJpZXMgQ2MgbGlzdCBuZXh0IHRpbWUuCj4gPgo+ID4g
Q2hhbmdlcyBpbiB2NToKPiA+IC0gUmVtb3ZlZCBiaXQgYWJvdXQgT1MgbWF5IGlnbm9yZSAoUm9i
L0V6ZXF1aWVsKQo+ID4gLSBBZGRlZCBIZWlrbydzIFRlc3RlZC1ieQo+ID4gLSBJdCdzIG5vdCBq
dXN0IGplcnJ5LCBpdCdzIG1vc3QgcmszMjg4IENocm9tZWJvb2tzIChIZWlrbykKPgo+IFdoYXQg
YXJlIHRoZSBwbGFucyB0byBtb3ZlIGZvcndhcmQgd2l0aCB0aGlzPwo+IE9yIGRpZCB5b3UgZHJv
cCB0aGUgd2hvbGUgaWRlYSBhZ2Fpbj8KCkF0IHRoZSBtb21lbnQgSSdtIGJsb2NrZWQgb24gVGhp
ZXJyeSByZXNwb25kaW5nLCBlaXRoZXIgdGFraW5nIHRoZQpwYXRjaCBvciB0ZWxsaW5nIG1lIHdo
YXQgSSBuZWVkIHRvIGRvIHRvIGZpeCBpdC4gIEkgc2F3IFNlYW4gUGF1bCBwaW5nClRoaWVycnkg
b24gSVJDIG9uIEp1bmUgM3JkIGFuZCBhcyBmYXIgYXMgSSBjb3VsZCB0ZWxsIHRoZXJlIHdhcyBu
bwpyZXNwb25zZS4KCmh0dHBzOi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+Y2JyaWxsL2RyaS1s
b2cvP2NoYW5uZWw9ZHJpLWRldmVsJmhpZ2hsaWdodF9uYW1lcz0mZGF0ZT0yMDE5LTA2LTAzJnNo
b3dfaHRtbD10cnVlCgouLi5hbmQgYXMgeW91IGNhbiBzZWUgSGVpa28gcGluZ2VkIHRoaXMgdGhy
ZWFkIG9uIEp1bmUgMTR0aC4KClRoaWVycnk6IGNhbiB5b3UgaGVscCBnaXZlIHVzIHNvbWUgZGly
ZWN0aW9uPyAgQXJlIHlvdSB1bmludGVyZXN0ZWQgaW4KcmV2aWV3aW5nIHRoZW0gYW5kIHdvdWxk
IHByZWZlciB0aGF0IEkgZmluZCBzb21lb25lIHRvIGxhbmQgdGhlbSBpbgpkcm0tbWlzYyBkaXJl
Y3RseT8KCgotRG91ZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=

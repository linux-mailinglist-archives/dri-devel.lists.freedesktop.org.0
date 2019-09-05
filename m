Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4ACAADCF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 23:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609A16E04E;
	Thu,  5 Sep 2019 21:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F886E04E;
 Thu,  5 Sep 2019 21:26:22 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id k2so4321639wmj.4;
 Thu, 05 Sep 2019 14:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TiQP/HRy1KyEEovXtGeKVJxMUd2ZLygvJYJZXQnSwBk=;
 b=B1v209bYASaYtcJ8ndeRNwDWff5ld1NfaI1ShIXe6L8klwZPnH+KgxjryYhjBWsBnO
 iSa5h7/Aj4Yu+hVJi1AnBWWpGhWsOMCQegbvBDVUI9QQUbbQjaJ/NjN6Kj8mGevmKOnp
 OCeL8n0ClbbjkxPH+FBe1sAznCUSZAjmM37fdtq4OlEWea4zmPJHPlvlNKf3uN23hWJG
 YqEXp+EEKCroFEgMJkCd5zuwBoXgwDtDraEm+hbranXn4XMPRu935aaxg24Jk7THn6te
 bJ3j3xZLbCLQjglAp1cPSWj2NhY4gWNg9TzPcHnXcs9AwqlmvtU3RTcT8fhc2AkzgiGj
 /blg==
X-Gm-Message-State: APjAAAVF7LSrmRxmO9jYekzPtr58mnQOz78H2x1fi+Ru/zrSQtaHf7nl
 MYMnF8u9UvrZq87SGSr1mGIOX61pgeNCONOoea0=
X-Google-Smtp-Source: APXvYqzlWem0DVjP+wkVUC4FU7g6ztTFxtTEHbFfN6we+q4MFZvbglSn2JlZ1xeJwjkWLqwJQQK80ahghWzIAOCSU4s=
X-Received: by 2002:a7b:ce94:: with SMTP id q20mr2424145wmj.97.1567718780551; 
 Thu, 05 Sep 2019 14:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190829060533.32315-2-Kenny.Ho@amd.com>
 <20190903075719.GK2112@phenom.ffwll.local>
 <CAOWid-dxxDhyxP2+0R0oKAk29rR-1TbMyhshR1+gbcpGJCAW6g@mail.gmail.com>
 <CAKMK7uEofjdVURu+meonh_YdV5eX8vfNALkW3A_+kLapCV8j+w@mail.gmail.com>
 <CAOWid-eUVztW4hNVpznnJRcwHcjCirGL2aS75p4OY8XoGuJqUg@mail.gmail.com>
 <20190904085434.GF2112@phenom.ffwll.local>
 <CAOWid-fiEOmPw1z=aF6E4VE03xikREKt-X8VVKGGUGBQd3i=Kw@mail.gmail.com>
 <CAKMK7uGSrscs-WAv0pYfcxaUGXvx7M6JYbiPHTY=1hxRbFK1sg@mail.gmail.com>
 <CAOWid-eRZGxWzHw4qFqtSOCixQXvY4bEP91QnVH0Nmm13J9F-g@mail.gmail.com>
 <CAKMK7uHy+GRAcpLDuz6STCBW+GNfNWr-i=ZERF3uqkO7jfynnQ@mail.gmail.com>
In-Reply-To: <CAKMK7uHy+GRAcpLDuz6STCBW+GNfNWr-i=ZERF3uqkO7jfynnQ@mail.gmail.com>
From: Kenny Ho <y2kenny@gmail.com>
Date: Thu, 5 Sep 2019 17:26:08 -0400
Message-ID: <CAOWid-cRP1T2gr2U_ZN+QhS7jFM0kFTWiYy8JPPXXmGW7xBPzA@mail.gmail.com>
Subject: Re: [PATCH RFC v4 01/16] drm: Add drm_minor_for_each
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=TiQP/HRy1KyEEovXtGeKVJxMUd2ZLygvJYJZXQnSwBk=;
 b=ft6Q6+jSW1cfNGf+VwxxVSnR70P6Jv8Imf6TVo4WKM5GEVO7BvdTqflCRtFgf3iHj2
 ljvaDbdv4QEv/0cCrWAV9cxPPFvVm1dmo6FDlFmo2ZqS5KJgEUspz3sKtpouSEabI6oz
 b+0GGC8nQmNujXBtfVEtTjBjR0HudMuK962gt05YoW6ISE2ErGWDhfgVhwmpYRt07AK5
 r5sLKuaTP6qpAbg0pi/7y0TmmkiZNjfUCBQsiHElY+pJ/yjSLb33iMv+t03YA48lJ3bL
 DLGSOmHlqPP3n7CkO7O5H0m7x7P2VfmwWzzCKd88IR4UoOfmUVNpA1/BrK2uQs1TscHj
 D1uA==
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, "Kuehling, Felix" <felix.kuehling@amd.com>,
 jsparks@cray.com, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 lkaplan@cray.com, Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Greathouse,
 Joseph" <joseph.greathouse@amd.com>, Tejun Heo <tj@kernel.org>,
 cgroups@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgNSwgMjAxOSBhdCA0OjMyIFBNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4gd3JvdGU6Cj4KKnNuaXAqCj4gZHJtX2Rldl91bnJlZ2lzdGVyIGdldHMgY2FsbGVkIG9u
IGhvdHVucGx1Zywgc28geW91ciBjZ3JvdXAtaW50ZXJuYWwKPiB0cmFja2luZyB3b24ndCBnZXQg
b3V0IG9mIHN5bmMgYW55IG1vcmUgdGhhbiB0aGUgZHJtX21pbm9yIGxpc3QgZ2V0cwo+IG91dCBv
ZiBzeW5jIHdpdGggZHJtX2RldmljZXMuIFRoZSB0cm91YmxlIHdpdGggZHJtX21pbm9yIGlzIGp1
c3QgdGhhdAo+IGNncm91cCBkb2Vzbid0IHRyYWNrIGFsbG9jYXRpb25zIG9uIGRybV9taW5vciAo
dGhhdCdzIGp1c3QgdGhlIHVhcGkKPiBmbGF2b3VyKSwgYnV0IG9uIHRoZSB1bmRlcmx5aW5nIGRy
bV9kZXZpY2UuIFNvIHJlYWxseSBkb2Vzbid0IG1ha2UKPiBtdWNoIHNlbnNlIHRvIGF0dGFjaCBj
Z3JvdXAgdHJhY2tpbmcgdG8gdGhlIGRybV9taW5vci4KClVtLi4uIEkgdGhpbmsgSSBnZXQgd2hh
dCB5b3UgYXJlIHNheWluZywgYnV0IGlzbid0IHRoaXMgYSBtYXR0ZXIgb2YKdGhlIGNncm91cCBj
b250cm9sbGVyIGRvaW5nIGEgZHJtX2Rldl9nZXQgd2hlbiB1c2luZyB0aGUgZHJtX21pbm9yPwpP
ciB0aGF0IHdvbid0IHdvcmsgYmVjYXVzZSBpdCdzIHBvc3NpYmxlIHRvIGhhdmUgYSB2YWxpZCBk
cm1fbWlub3IgYnV0CmludmFsaWQgZHJtX2RldmljZSBpbiBpdD8gSSB1bmRlcnN0YW5kIGl0J3Mg
YW4gZXh0cmEgbGV2ZWwgb2YKaW5kaXJlY3Rpb24gYnV0IHNpbmNlIHRoZSBjb252ZW50aW9uIGZv
ciBhZGRyZXNzaW5nIGRldmljZSBpbiBjZ3JvdXAKaXMgdXNpbmcgJG1ham9yOiRtaW5vciBJIGRv
bid0IHNlZSBhIHdheSB0byBlc2NhcGUgdGhpcy4gIChUZWp1bgphY3R1YWxseSBhbHJlYWR5IG1h
ZGUgYSBjb21tZW50IG9uIG15IGVhcmxpZXIgUkZDIHdoZXJlIEkgZGlkbid0CmZvbGxvdyB0aGUg
bWFqb3I6bWlub3IgY29udmVudGlvbiBzdHJpY3RseS4pCgpLZW5ueQoKPiA+ID4gSnVzdCBkb2lu
ZyBhIGRybV9jZ19yZWdpc3Rlci91bnJlZ2lzdGVyIHBhaXIgdGhhdCdzIGNhbGxlZCBmcm9tCj4g
PiA+IGRybV9kZXZfcmVnaXN0ZXIvdW5yZWdpc3RlciwgYW5kIHRoZW4gaWYgeW91IHdhbnQsIGxv
b2tpbmcgdXAgdGhlCj4gPiA+IHJpZ2h0IG1pbm9yIChJIHRoaW5rIGFsd2F5cyBwaWNraW5nIHRo
ZSByZW5kZXIgbm9kZSBtYWtlcyBzZW5zZSBmb3IKPiA+ID4gdGhpcywgYW5kIHNraXBwaW5nIGlm
IHRoZXJlJ3Mgbm8gcmVuZGVyIG5vZGUpIHdvdWxkIG1ha2UgbW9zdCBzZW5zZS4KPiA+ID4gQXQg
bGVhc3QgZm9yIHRoZSBiYXNpYyBjZ3JvdXAgY29udHJvbGxlcnMgd2hpY2ggYXJlIGdlbmVyaWMg
YWNyb3NzCj4gPiA+IGRyaXZlcnMuCj4gPgo+ID4gV2h5IGRvIHdlIHdhbnQgdG8gc2tpcCBkcm0g
ZGV2aWNlcyB0aGF0IGRvZXMgbm90IGhhdmUgYSByZW5kZXIgbm9kZQo+ID4gYW5kIG5vdCBqdXN0
IHVzZSB0aGUgcHJpbWFyeSBpbnN0ZWFkPwo+Cj4gSSBndWVzcyB3ZSBjb3VsZCBhbHNvIHRha2Ug
dGhlIHByaW1hcnkgbm9kZSwgYnV0IGRyaXZlcnMgd2l0aCBvbmx5Cj4gcHJpbWFyeSBub2RlIGFy
ZSBnZW5lcmFseSBkaXNwbGF5LW9ubHkgZHJtIGRyaXZlcnMuIE5vdCBzdXJlIHdlIHdhbnQKPiBj
Z3JvdXBzIG9uIHRob3NlIChidXQgSSBndWVzcyBjYW4ndCBodXJ0LCBhbmQgbW9yZSBjb25zaXN0
ZW50KS4gQnV0Cj4gdGhlbiB3ZSdkIGFsd2F5cyBuZWVkIHRvIHBpY2sgdGhlIHByaW1hcnkgbm9k
ZSBmb3IgY2dyb3VwCj4gaWRlbnRpZmljYXRpb24gcHVycG9zZXMuCj4gLURhbmllbAo+Cj4gPgo+
ID4gS2VubnkKPiA+Cj4gPgo+ID4KPiA+ID4gLURhbmllbApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

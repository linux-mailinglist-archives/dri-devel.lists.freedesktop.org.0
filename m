Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AFA24242C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 05:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AEAF6E89C;
	Wed, 12 Aug 2020 03:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB796E89C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 03:02:30 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id d6so634064ejr.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 20:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sRMqOgoZiT6nESRmKHxUG4JCYYZwqTllsQ2tz0LWB0E=;
 b=rIhA94vWyUm6dODcPMewAbVUWbwn5X/y2FkU8V6W1X9DmWqejywboA0QcGdd1XOXN5
 rjQR4ync3zRwCp1nTs2Yi2k4h7Q2UiM2rXZh+jLK6Z1rSYXVCiCxkd0UdPNeeT/5kEsQ
 wiZNV+dY1jH+n8/EmLiOO8B2KpWwcuXwX4aReiCaJYX3NxY0J1QJrvbv6omrPpNxcI1V
 ZHb0m4bAJ+ccRhxG25EwomkzcaIjOqihV/haVgviLSUxFL8LVLh2WgLTxcaz7r7c+Puj
 OOvBsuwvkDoINma9YOKSHGLtrpUtJa81DO9kwhpAsUxLUHUN9RR6ejv/U2HGAe2zfdeN
 1UeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sRMqOgoZiT6nESRmKHxUG4JCYYZwqTllsQ2tz0LWB0E=;
 b=DC4fvT94qITWl/9UFXB1lYBy4Voc6vDcPH78qEfqslPEn+bmOMPOxef68d6X6KrjjT
 KJFY/rCTl3XmSOtByVicCKKlbdDJYGlIR+7ZafDsOtslEuuu99ZQUjJg+GPGEG52QvMt
 bgXIS+/5FM8UZi43/yZ5aNReiwP7MyEKpj441jOHaTQCa7j88n38Ycq1vz3EsQoMGa0J
 Ue7B49B3TEer7+D+dImXOjkc5qg51bCwTNnHkqB3vQpxsNicvPeQ6ZY17CtirQN9rmRQ
 VrKntUnFAo7j9xaH7S5X/wXNHKU3qsNGccF45fJCLnSpo8FXi4bA8VtjG52pvFcQlBgD
 UdMQ==
X-Gm-Message-State: AOAM5327vwE283kEusYwWOg6DdZf4ZY8bjF7IZROdZp55EM96RORZSr1
 OxE+SCdE1pBreL+82dD5VeXcjaqHAtXymSO8IdU=
X-Google-Smtp-Source: ABdhPJzS5lL4bXNrs3z5aOoLklvlQIG8mBGuC6n0gCdz9dyIfIUQnOOl3QY8YBfLpiIpESgPOkl0wjm/OXwSN1XurFY=
X-Received: by 2002:a17:906:fa19:: with SMTP id
 lo25mr22333032ejb.456.1597201349572; 
 Tue, 11 Aug 2020 20:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200811092400.188124-1-christian.koenig@amd.com>
 <bbeaca4b-189d-c4dd-6d3a-e1489d6b0e4f@gmail.com>
 <052cbf93-00d1-6913-a278-eb3dafa86281@gmail.com>
 <12304df3-e891-9e8e-8a51-8be3c2bddc61@daenzer.net>
 <e42482e1-6dc0-d4c5-4fd0-c6b15737e67c@gmail.com>
 <CAPM=9tyUBMXMWbPbXLsNV7j10svYWRHnsYrNOeksQm_EPp-0VA@mail.gmail.com>
In-Reply-To: <CAPM=9tyUBMXMWbPbXLsNV7j10svYWRHnsYrNOeksQm_EPp-0VA@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 12 Aug 2020 13:02:18 +1000
Message-ID: <CAPM=9tzM8CRt7myYbcBnX49geOFuFMUAHiKrWMa4+jebF9trgg@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: revert "make TT creation purely optional v3"
To: "Koenig, Christian" <christian.koenig@amd.com>
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxMiBBdWcgMjAyMCBhdCAwNTozNCwgRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21haWwu
Y29tPiB3cm90ZToKPgo+IE9uIFdlZCwgMTIgQXVnIDIwMjAgYXQgMDM6MTEsIENocmlzdGlhbiBL
w7ZuaWcKPiA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+
IEFtIDExLjA4LjIwIHVtIDE4OjQyIHNjaHJpZWIgTWljaGVsIETDpG56ZXI6Cj4gPiA+IE9uIDIw
MjAtMDgtMTEgMjo1MyBwLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+ID4gPj4gQW0gMTEu
MDguMjAgdW0gMTQ6NTIgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+ID4gPj4+IEFtIDExLjA4
LjIwIHVtIDExOjI0IHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoKPiA+ID4+Pj4gVGhpcyByZXZl
cnRzIGNvbW1pdCAyZGRlZjE3Njc4YmMyZWExZDIwNTE3ZGQyYjRlZDRhYTk2N2ZmYThiLgo+ID4g
Pj4+Pgo+ID4gPj4+PiBBcyBpdCB0dXJuZWQgb3V0IFZNV0dGWCBuZWVkcyBhIG11Y2ggd2lkZXIg
YXVkaXQgdG8gZml4IHRoaXMuCj4gPiA+Pj4+Cj4gPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiA+ID4+PiBEYXJlIHRvIGdp
dmUgbWUgYW4gcmIgZm9yIHRoaXM/IEkgYWxyZWFkeSB0ZXN0ZWQgb24gYW1kZ3B1IGFuZCBpdAo+
ID4gPj4+IHNob3VsZCBiZSBmaXhpbmcgdGhlIFZNV0dGWCBwcm9ibGVtcyB3ZSBjdXJyZW50bHkg
aGF2ZS4KPiA+ID4+IFVwcywgdGhhdCB3YXMgeW91ciBvbGQgQU1EIGFkZHJlc3MgOikKPiA+ID4+
Cj4gPiA+PiBTbyBvbmNlIG1vcmUgd2l0aCBmZWVsaW5nLAo+ID4gPiA6KQo+ID4gPgo+ID4gPiBI
b3dldmVyLCBJJ20gYWZyYWlkIEknbSBub3QgZGVlcCBlbm91Z2ggaW50byBUVE0gY29kZSBhbnlt
b3JlIHRvIGdpdmUKPiA+ID4geW91IGFuIFItYiwgZ2l2ZW4gaXQncyBub3QgYSBzdHJhaWdodCBy
ZXZlcnQgKHByZXN1bWFibHkgZHVlIHRvIG90aGVyCj4gPiA+IGNoYW5nZXMgaW4gdGhlIG1lYW50
aW1lKS4KPiA+Cj4gPiBZZWFoLCBpbmRlZWQgaGFkIHRvIGtlZXAgRGF2ZXMgY2hhbmdlcyBpbnRh
Y3QuCj4gPgo+ID4gRGF2ZSBjYW4geW91IHRha2UgYSBsb29rIHRoZW4/Cj4KPiBZdXAganVzdCBj
YW1lIGluIGFmdGVyIG15ICJzdG9wIHdvcmtpbmcgRGF2ZSIgdGltZS4KPgo+IERpZCB5b3UgaGF2
ZSBhbiBhbWRncHUgcGF0Y2ggdGhhdCB3b3JrZWQgb24gdG9wIG9mIHRoaXM/IGRvZXMgdGhhdAo+
IG5lZWQgcmV2ZXJ0aW5nIG9yIGRpZCBpdCBub3QgbGFuZCB5ZXQ/CgpPaCBJIGNvbmZ1c2VkIHRo
aXMgd2l0aCB0aGUgdHRtX21lbV9yZWcgaGFuZGxpbmcgZml4IHRoYXQgaGFkIGFuIGFtZGdwdSBw
YXRjaC4KCkknbGwgcHVsbCB0aGlzIGludG8gbXkgZml4ZXMgdHJlZSBmb3IgTGludXMgbm93LgoK
RGF2ZS4KCj4KPiBPdGhlcndpc2UsCj4KPiBSZXZpZXdlZC1ieTogRGF2ZSBBaXJsaWUgPGFpcmxp
ZWRAcmVkaGF0LmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==

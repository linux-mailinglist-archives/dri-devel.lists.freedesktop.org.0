Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E6726609
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DB089BCD;
	Wed, 22 May 2019 14:36:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528E889211
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 07:21:22 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id a17so13102006iot.8
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 00:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iiOOofy15/DSPnrfSHu8P24nzDQeV7YqHGhsciuB634=;
 b=SvP02ARcpohmX5zhka2w20S52Pl3JJbcGoXPg/P6kVDleiqzjUmvr96YWFvEidA0iT
 BvDmCKm+/2YHre8EJaxeN4vqXEZY4ujDlu95F8ySKmD4/HVSvag0+nCy1Z49/eMoPcND
 AI6YutdBKfUejHJB/mSsNLgJG0/ZJLBJEJ9jHU/u+O4EiPwKg8SJ2CNICDp3EbiOk73S
 lS/CMVQi6l3J9BrNTuj1nkXpL7uNgvNaFgm1mALbWLQ2aJdKMUuaQAfxSBj3VbU4Xj93
 xlU11cxygyJDfKEi6u8PVFN/eJeKFojYvblIR5S+sgXhdaiRkjXdaXVs5nBfq8K7YTJ+
 wJ/w==
X-Gm-Message-State: APjAAAWfmMcSvadoiL1Re1gyrHJ7UC4fhb5oYYY+/gqyNuWjjRhztFaK
 3SY3eoVARB2KXo6GHxQxmvRzV20mZRJu33+wrLU=
X-Google-Smtp-Source: APXvYqwxRrnEu2JOcB7oacP2OSM1r1kd7WZfsLNoLRuqEqsDZAR4bPQfX9gmz6UTkjVMO4c3lGETIXqJAWPrXqOaH7A=
X-Received: by 2002:a6b:5117:: with SMTP id f23mr6989397iob.263.1558423281464; 
 Tue, 21 May 2019 00:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190326103146.24795-1-tomi.valkeinen@ti.com>
 <20190326103146.24795-4-tomi.valkeinen@ti.com>
 <20190420211353.GF4964@pendragon.ideasonboard.com>
 <CAFmnZc3hHt62TPa5_Fq7rbuynFAEhy3QcFHzqxzP_ac9eatygg@mail.gmail.com>
 <20190423145632.GC16111@pendragon.ideasonboard.com>
 <85c349f3-c96d-7db3-5446-5c0d9539580e@ti.com>
 <20190503124825.GF4912@pendragon.ideasonboard.com>
 <c9de8795-fce6-bf0b-08c6-120537272573@ti.com>
 <20190503171123.GC4903@pendragon.ideasonboard.com>
 <3888b097-9357-71e0-d8da-183cc52519ab@ti.com>
In-Reply-To: <3888b097-9357-71e0-d8da-183cc52519ab@ti.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 21 May 2019 00:21:08 -0700
Message-ID: <CAHQ1cqEk6yeMjcJNrhL6-dEE0oTuuhUWBKO62-tEBmGTPiajng@mail.gmail.com>
Subject: Re: [PATCHv2 03/22] drm/bridge: tc358767: fix ansi 8b10b use
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=iiOOofy15/DSPnrfSHu8P24nzDQeV7YqHGhsciuB634=;
 b=eSdokrVXlXr+pPbd8Ep3iANUGomZB1b3Arxyerrk0B8j0nL/1NVkqmkjsEVbUT+1Ml
 ym30IaBN5kr5aKum4Ayq0sQET0+2GKkfp/soPW8ep5Ue4JL9KuxILQA/XzgPvgC/oy7I
 vdSSxm8LjG2dU5T2mOdbY1g8HdJ/Y6Zev51FcG7FkR41Dr8DiOTwVOAnOOmu6etHH7pP
 2acL1Y0gr8nTYQJIEQhHpLRObbMmGpV+x6msEaJIKGCOqF3TsO08ye/DkmcFirA2QL83
 +IflLrFkTmYiS6KqBysLakf+ZHZe7a1hpeW6KQqYzUyUSlCMwrOTd3icOiDPqEZDYYL1
 it7g==
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
Cc: Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgNiwgMjAxOSBhdCAyOjU5IEFNIFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtl
aW5lbkB0aS5jb20+IHdyb3RlOgo+Cj4gSGkgTGF1cmVudCwgQW5kcmV5LAo+Cj4gT24gMDMvMDUv
MjAxOSAyMDoxMSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiA+PiBJIGFncmVlIHRoYXQgaWYg
dGhlIHBhbmVsIEFuZHJleSBtZW50aW9uZWQgaXMgc3RpbGwgdXNlZCwgd2UgbmVlZCB0bwo+ID4+
IGhhbmRsZSBpdCBzb21laG93LiBCdXQgSSB0aGluayBleHBsaWNpdGx5IGhhbmRsaW5nIHN1Y2gg
YSBjYXNlIGlzIGJldHRlcgo+ID4+IHRoYW4gZ3Vlc3NpbmcuCj4gPgo+ID4gVGhlIHJpc2sgbWF5
IG5vdCBiZSB3b3J0aCBpdCwgSSBhZ3JlZS4gSSB3b3VsZCBleHBsYWluIHRoaXMgaW4gZGV0YWls
cwo+ID4gaW4gdGhlIGNvbW1pdCBtZXNzYWdlIHRob3VnaCwgYW5kIGFkZCBhIGNvbW1lbnQgdG8g
dGhlIGNvZGUgYXMgd2VsbCwgdG8KPiA+IGVhc2UgZnV0dXJlIGRlYnVnZ2luZy4KPgo+IEFuZHJl
eSwgZG8geW91IHN0aWxsIGhhdmUgdGhlIHBhbmVsIHRoYXQgZG9lc24ndCB3b3JrIHdpdGggOGIx
MGI/IElzIGl0Cj4gdXNlZCBpbiByZWFsIGxpZmUgKGkuZS4gaXQgd2FzIG5vdCBqdXN0IGEgdGVt
cG9yYXJ5IGRldmVsb3BtZW50IHBoYXNlCj4gcGFuZWwpPyBXaGF0J3MgdGhlIG1vZGVsLCBhbmQg
aXMgdGhlcmUgYSBwdWJsaWMgZGF0YXNoZWV0PwoKTm90ZSB0aGF0IEkgYW0gYSBkaWZmZXJlbnQg
QW5kcmV5LCBhbmQgSSBjYW4ndCBzcGVhayBhYm91dCB0aGUKb3JpZ2luYWwgcGFuZWwgdGhhdCBj
YXVzZWQgdGhlIGlzc3VlLiBIb3dldmVyLCBwcm9kdWN0aW9uIHVuaXRzIGFyZQpzaGlwcGVkIHdp
dGggdGhpcyBwYW5lbDoKCmh0dHBzOi8vd3d3LmRhdGEtbW9kdWwuY29tL3Byb2R1Y3RmaW5kZXIv
c2l0ZXMvZGVmYXVsdC9maWxlcy9wcm9kdWN0cy9OTDE5MjEwOEFDMTMtMDJEX3NwZWNpZmljYXRp
b25fMTIwMjM3MjcucGRmCgp3aGljaCBzZWVtcyB0byBkbyBwcmV0dHkgc3RhbmRhcmQgRFAgc3R1
ZmYuIEluIGFsbCBvZiBteSB0ZXN0aW5nIG9mClRvbWkncyBwYXRjaGVzLCBJIGhhdmVuJ3Qgc2Vl
biBhbnkgcHJvYmxlbXMgc28gZmFyIChJIHN0aWxsIGhhdmUgdG8KdGVzdCB2MyB0aG91Z2gpLCBz
byBJIHRoaW5rIHdlIGNhbiBjYXJlZnVsbHkgcHJvY2VlZCBhc3N1bWluZyB0aGF0CnRoYXQgd2Vp
cmQgcGFuZWwgd2FzIGp1c3QgYSBmbHVrZS4KClRoYW5rcywKQW5kcmV5IFNtaXJub3YKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

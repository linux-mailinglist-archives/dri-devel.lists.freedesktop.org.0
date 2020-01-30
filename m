Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 620E114E0D8
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 19:35:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957D86E8D3;
	Thu, 30 Jan 2020 18:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E088F6E8D3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 18:34:56 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y17so5393924wrh.5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 10:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9MK4CV+zg2SdhOyv4TONQ5ynHYEfxBVR4vovIZeHGXk=;
 b=Kx7Y6eSumd+uUDgKTuEiwsEW6K3njrGHgTJahF7LsveBpXlEASfcAAt1dzFdt+rWiU
 hm5Zv507c44SCXSMbzC6IDQbWl6XshwLGeyfESRGS5SPtkaOJ0r0RGNFeqVag6oW3Sim
 s23I+A3whuAy2oCuErk0CplmjM1dNFu+0/fXPz+qmJ1TTMqvi0bT6zTyitU/Uke6CQcU
 WAyy3Rl08AZwaIE8O//9drcNhx2x1P5pbXlGD3Y/Jx2BXRChdDJRXpaul/yZc9z8z+nj
 YMd1sYKLWutY6+aZPjSBqvJXeKIA3sR8pXqPhayf8vHHn0I48qfDJRJHsZiKLSVftTNU
 dJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9MK4CV+zg2SdhOyv4TONQ5ynHYEfxBVR4vovIZeHGXk=;
 b=S1KqpTmxLeT9ii3wGK/ixw0TJECdYqUmceCKYoxU+YU9iAgWP0mn2GKV9qF37O7U1m
 542iGDq1Ih4QUCoJy3xM4xnPwxj5ZDtVTTRYhdrQyVgOMgdM700+ebhwmoYga1t6OVYW
 h84jnm6KwNNiDPvbhIZIhT8fPEX+YADB5BOibILMKuD4aYZC/SdQLZiYtROk45QjmLtu
 LvKf93nj1qhGzEUkjIw6YXcJLPLNkMPcei7zG8ohp+4hngHnu7tU7o/74VPufR/QiVqx
 od2CHjB8YGW7nLzCtz5SYmsMPm1QUbj2su5YTdxPKIZa/Ye5oSKE0xJ1F0cSiOPOLGIG
 ledA==
X-Gm-Message-State: APjAAAWzZdjFamnDxxcT6139w2Y/pBb1JwYSm6+crTGN7+BnPnRAJrI9
 fqp6UGC5rPs4eBS3DrsLDzX7qOOLy52G1zx3Y7o=
X-Google-Smtp-Source: APXvYqwPV1YouCbn1ug7u2VCMOVLoPqjoQ7XWZhEf44z3Ot6tC/Zn0x4xNoy/1/pDLXlMzzB8gRNXhLFnipdHf297c4=
X-Received: by 2002:a5d:40c9:: with SMTP id b9mr7295061wrq.419.1580409295277; 
 Thu, 30 Jan 2020 10:34:55 -0800 (PST)
MIME-Version: 1.0
References: <20200129080904.1637634-1-daniel.vetter@ffwll.ch>
 <cd92a954-2c2b-3621-333f-fd6136c8cec7@daenzer.net>
In-Reply-To: <cd92a954-2c2b-3621-333f-fd6136c8cec7@daenzer.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 30 Jan 2020 13:34:44 -0500
Message-ID: <CADnq5_MA2BaqZMttOf05=MXSrotrXuOhsMmmQBGsk=1uHrvv4w@mail.gmail.com>
Subject: Re: [PATCH] radeon: completely remove lut leftovers
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Peter Rosin <peda@axentia.se>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKYW4gMjksIDIwMjAgYXQgNDoyOCBBTSBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRh
ZW56ZXIubmV0PiB3cm90ZToKPgo+IE9uIDIwMjAtMDEtMjkgOTowOSBhLm0uLCBEYW5pZWwgVmV0
dGVyIHdyb3RlOgo+ID4gVGhpcyBpcyBhbiBvdmVyc2lnaHQgZnJvbQo+ID4KPiA+IGNvbW1pdCA0
MjU4NTM5NWViYzEwMzRhOTg5Mzc3MDI4NDk2NjlmMTdlYWRiMzVmCj4gPiBBdXRob3I6IFBldGVy
IFJvc2luIDxwZWRhQGF4ZW50aWEuc2U+Cj4gPiBEYXRlOiAgIFRodSBKdWwgMTMgMTg6MjU6MzYg
MjAxNyArMDIwMAo+ID4KPiA+ICAgICBkcm06IHJhZGVvbjogcmVtb3ZlIGRlYWQgY29kZSBhbmQg
cG9pbnRsZXNzIGxvY2FsIGx1dCBzdG9yYWdlCj4gPgo+ID4gdjI6IEFsc28gcmVtb3ZlIGxlZnRv
dmVyIGxvY2FsIHZhcmlhYmxlLgo+ID4KPiA+IENjOiBQZXRlciBSb3NpbiA8cGVkYUBheGVudGlh
LnNlPgo+ID4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiA+
IENjOiBNaWNoZWwgRMOkbnplciA8bWljaGVsLmRhZW56ZXJAYW1kLmNvbT4KPgo+IEkgZG9uJ3Qg
dGhpbmsgdGhpcyBlLW1haWwgYWRkcmVzcyB3b3JrcyBhbnltb3JlLgo+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPgo+IFJldmlld2Vk
LWJ5OiBNaWNoZWwgRMOkbnplciA8bWRhZW56ZXJAcmVkaGF0LmNvbT4KPgoKQXBwbGllZC4gIFRo
YW5rcyEKCkFsZXgKCj4KPiAtLQo+IEVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAg
ICAgIHwgICAgICAgICAgICAgICBodHRwczovL3JlZGhhdC5jb20KPiBMaWJyZSBzb2Z0d2FyZSBl
bnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

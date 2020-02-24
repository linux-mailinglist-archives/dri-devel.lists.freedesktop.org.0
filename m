Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D65B316AAF1
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 17:11:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CC26E56D;
	Mon, 24 Feb 2020 16:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246886E575
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 16:11:00 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id m16so11017395wrx.11
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 08:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=89vzT1tBGfq5aP3PsJfuh7rnAupdiuFCT9HSGZKwt+k=;
 b=lEqAo4Onni2TnFKYyHsU8lriq/BTqlXbmjtqVnKWRsEO5dN5RgiU1wp/v1pxyhe21l
 SM+JRIaK6IX/w0GYGna+mRNPeWi6auuOH1qhQ3JdTybZ3uUK1qfGuyJSvEmXcb3T3j/B
 Z1MZ3lV5X82gpxYQm7+ZyZ2Z/YhXycq/52vchyY0EjdzdtFSnXKXtOdwq0M41Y8nMEFE
 M82jg5V8kci+8Hr3sBXJFlXhii9avKb2G54i/XkAkgty0vHxgUS6DfUl4FSnyZZczGhU
 KqUMu4f45A9O/w4BhVF+r7XkQ/TqN9js4/FTROeXfyVhv1lM9yCdgdlFMKlW+uwmkeOC
 8mvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=89vzT1tBGfq5aP3PsJfuh7rnAupdiuFCT9HSGZKwt+k=;
 b=iqGaFUibqEUpa01VQMseWKXlrnLTt4yI9T+C2h209j9vV0G5ZVvmNuiuOqK9dkhWRu
 0n3Dlgw7SXtT4H6JHSFYgA55uQ9gXL9PKHCYwqZowp6M1+DeOSGrAtIqk8L5GLHBLxyC
 rdBt89u1uzS1ipmTDtxR92cIG2dDbE0f5INulR+7e51OBibaaFtPMkIbZsT4qzr9S5Ps
 khfn+d8G+qJGQdWLH6e9+X8O5hAnwTCOCfnG7Aqp+yPk/nduq7qfTo/L3j6MAkArYEQG
 OUFwUp/O0mSVqw9vz8Gn4bWrgjGuCGyxaksHKzJKfrnk9GKTlwLtUMnLH11zVs+f1pvc
 uW2Q==
X-Gm-Message-State: APjAAAU5qmv5ZDZA0wVmwfMKvQFGblebroTejpJH+ZjvkBHGJSEd2zhz
 HZVKkaLZiWqdo8NhIFO5XtVMZ4AtCkoZkIxqa8Y=
X-Google-Smtp-Source: APXvYqyWJIRMsk62I1gYsV7ipA88OVV9xmuwzqnu2JPvMZW5bRp84c1wa6vqhWjGbk661VpoeBiNppDQWUPz4N7g+O4=
X-Received: by 2002:adf:b254:: with SMTP id y20mr66485228wra.362.1582560658774; 
 Mon, 24 Feb 2020 08:10:58 -0800 (PST)
MIME-Version: 1.0
References: <20200222175433.2259158-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20200222175433.2259158-1-daniel.vetter@ffwll.ch>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Feb 2020 11:10:47 -0500
Message-ID: <CADnq5_PLJgZGb+9mhw_06oxRXiYsfRuO3PiRHCBLmNYtV4Q64Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/amdgpu: Drop DRIVER_USE_AGP
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Xiaojie Yuan <xiaojie.yuan@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 "Tianci.Yin" <tianci.yin@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBGZWIgMjIsIDIwMjAgYXQgMTI6NTQgUE0gRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBmZndsbC5jaD4gd3JvdGU6Cj4KPiBUaGlzIGRvZXNuJ3QgZG8gYW55dGhpbmcgZXhjZXB0
IGF1dG8taW5pdCBkcm1fYWdwIHN1cHBvcnQgd2hlbiB5b3UKPiBjYWxsIGRybV9nZXRfcGNpX2Rl
digpLiBXaGljaCBhbWRncHUgc3RvcHBlZCBkb2luZyB3aXRoCj4KPiBjb21taXQgYjU4YzExMzE0
YTE3MDZiZjA5NGM0ODllZjVjYjI4Zjc2NDc4YzcwNAo+IEF1dGhvcjogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IERhdGU6ICAgRnJpIEp1biAyIDE3OjE2OjMxIDIw
MTcgLTA0MDAKPgo+ICAgICBkcm0vYW1kZ3B1OiBkcm9wIGRlcHJlY2F0ZWQgZHJtX2dldF9wY2lf
ZGV2IGFuZCBkcm1fcHV0X2Rldgo+Cj4gTm8gaWRlYSB3aGV0aGVyIHRoaXMgd2FzIGludGVudGlv
bmFsIG9yIGFjY2lkZW50YWwgYnJlYWthZ2UsIGJ1dCBJCj4gZ3Vlc3MgYW55b25lIHdobyBtYW5h
Z2VzIHRvIGJvb3QgYSB0aGlzIG1vZGVybiBncHUgYmVoaW5kIGFuIGFncAo+IGJyaWRnZSBkZXNl
cnZlcyBhIHByaWNlLiBBIHByaWNlIEkgbmV2ZXIgZXhwZWN0IGFueW9uZSB0byBldmVyIGNvbGxl
Y3QKPiA6LSkKPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENj
OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+Cj4gQ2M6IFhpYW9qaWUgWXVh
biA8eGlhb2ppZS55dWFuQGFtZC5jb20+Cj4gQ2M6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5j
b20+Cj4gQ2M6ICJUaWFuY2kuWWluIiA8dGlhbmNpLnlpbkBhbWQuY29tPgo+IENjOiAiTWFyZWsg
T2zFocOhayIgPG1hcmVrLm9sc2FrQGFtZC5jb20+Cj4gQ2M6IEhhbnMgZGUgR29lZGUgPGhkZWdv
ZWRlQHJlZGhhdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBpbnRlbC5jb20+CgpTZXJpZXMgaXM6ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFs
ZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkknbSBoYXBweSB0byB0YWtlIHRoZSBwYXRjaGVzIHRo
cm91Z2ggbXkgdHJlZSBvciBkcm0tbWlzYy4KCkFsZXgKCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kcnYuYwo+IGluZGV4IDQ1OTg4MzZjNWZhNC4uNmNlYTkyMDE3MTA5IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+IEBAIC0xMzc5LDcgKzEzNzksNyBA
QCBpbnQgYW1kZ3B1X2ZpbGVfdG9fZnByaXYoc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCBhbWRn
cHVfZnByaXYgKipmcHJpdikKPgo+ICBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIga21zX2RyaXZl
ciA9IHsKPiAgICAgICAgIC5kcml2ZXJfZmVhdHVyZXMgPQo+IC0gICAgICAgICAgIERSSVZFUl9V
U0VfQUdQIHwgRFJJVkVSX0FUT01JQyB8Cj4gKyAgICAgICAgICAgRFJJVkVSX0FUT01JQyB8Cj4g
ICAgICAgICAgICAgRFJJVkVSX0dFTSB8Cj4gICAgICAgICAgICAgRFJJVkVSX1JFTkRFUiB8IERS
SVZFUl9NT0RFU0VUIHwgRFJJVkVSX1NZTkNPQkogfAo+ICAgICAgICAgICAgIERSSVZFUl9TWU5D
T0JKX1RJTUVMSU5FLAo+IC0tCj4gMi4yNC4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==

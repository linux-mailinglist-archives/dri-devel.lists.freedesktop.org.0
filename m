Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAE3373DB0
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 16:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E656C6E4EC;
	Wed,  5 May 2021 14:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3446E4EC
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 14:30:48 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id e2so1185628plh.8
 for <dri-devel@lists.freedesktop.org>; Wed, 05 May 2021 07:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zEv8nAixPgL46JSR4uQPKjAUuyl9jKFKOraavjZjV7Y=;
 b=c4xPmkDnMx04sfqNIX2jDCykqc0WM7f7BBuIbvIBVqAOCuBzQr8ApRcT+61JmjqM17
 wHs+u5T2PLWq1YG0sFrl47YthOxPCewsZJ24uPu0WQRhuZYvuXhH03SNwcckh+fLAukP
 VbNIxT6JDSJ+WIvNCblB/btc4TUCAlkgeS1MnD2TsmKBV+OgoMEEDkGb8TaSNGFpvSoO
 dOw3UPmfvGmG7qYM/MJfvC97nPl0LzBCl6ZnlGyVirAwROwPGNGoxMsjGwl6TVK4i/U4
 twUs122WDx4NpIhUeFDjw2C09REIkWjLLQ3OTpnF+OEM4y6vBb/z5AeCCK4myrfNoMoF
 IV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zEv8nAixPgL46JSR4uQPKjAUuyl9jKFKOraavjZjV7Y=;
 b=uMgTHiaWVWyEkXb/G7ehvXFrb2NaJpefwBMvqk7REjqxl1RPjAh1/OSOo70oBa1LfJ
 z/qCdKEYZBiHJ6oItAAIWuabibw1FUo/iay8k5S+vCgP/jhiFH7DtbvJMubYiwmnu/J2
 pR+VbzFjNGK2qMFHKjsLJvHzFTCnT7kIlt8X4nVWXXyANjbE1Jk0heIAypXovUOQ9yTy
 M6tV7dJ2q8W7W41ewXf67RTqUlvKeaRjrcFapIs7YpsXhuVChqyQXX8LxzXDZ5meKu7G
 YN3IkbzyftrmeWosHy6UbnTOVOISo3EQQwTuQkhMN+S7pv8GFoMOXKaFCr7vGmjns1Zm
 jo5g==
X-Gm-Message-State: AOAM531h20nxVAbYufN4zTEcskEudDRlENt7jS3kViK/x7iMgyNphQ2K
 BHZFohTSuZbi6FXguFgqD8wenfpVxnzVNYcOCXIJXw==
X-Google-Smtp-Source: ABdhPJxZ1jFoxt2V7it6GVWCrH28jNJyganmzPP9tTaS6Fmd8tmjNaWi4T6fg+Bk1e218hElevMDhgtt8YN3Q42142k=
X-Received: by 2002:a17:90b:3504:: with SMTP id
 ls4mr11322599pjb.222.1620225048480; 
 Wed, 05 May 2021 07:30:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210504220207.4004511-1-adrien.grassein@gmail.com>
 <CAG3jFyu-aWLoiJ01h1DebVz66qtmt_T8adROKNBGBOzqbJvZvQ@mail.gmail.com>
In-Reply-To: <CAG3jFyu-aWLoiJ01h1DebVz66qtmt_T8adROKNBGBOzqbJvZvQ@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 5 May 2021 16:30:36 +0200
Message-ID: <CAG3jFyuf+-iknRuQbN-nPDc0f4MV-Hke3EQ9AyZzpaFbCPD57A@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: fix LONTIUM_LT8912B dependencies
To: Adrien Grassein <adrien.grassein@gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, msuchanek@suse.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UHVzaGVkIHRvIGRybS1taXNjLW5leHQKCk9uIFdlZCwgNSBNYXkgMjAyMSBhdCAxNjoyOCwgUm9i
ZXJ0IEZvc3MgPHJvYmVydC5mb3NzQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gSGkgQWRyaWVuLAo+
Cj4gVGhhbmtzIGZvciB0aGUgcXVpY2sgZml4Lgo+Cj4gT24gV2VkLCA1IE1heSAyMDIxIGF0IDAw
OjAyLCBBZHJpZW4gR3Jhc3NlaW4gPGFkcmllbi5ncmFzc2VpbkBnbWFpbC5jb20+IHdyb3RlOgo+
ID4KPiA+IExPTlRJVU1fTFQ4OTEyQiB1c2VzICJkcm1fZGlzcGxheV9tb2RlX3RvX3ZpZGVvbW9k
ZSIgZnJvbQo+ID4gRFJNIGZyYW1ld29yayB0aGF0IG5lZWRzIFZJREVPTU9ERV9IRUxQRVJTIHRv
IGJlIGVuYWJsZWQuCj4gPgo+ID4gRml4ZXM6IDMwZTJhZTk0M2MyNiAoImRybS9icmlkZ2U6IElu
dHJvZHVjZSBMVDg5MTJCIERTSSB0byBIRE1JIGJyaWRnZSIpCj4gPiBSZXBvcnRlZC1ieTogTWlj
aGFsIFN1Y2jDoW5layA8bXN1Y2hhbmVrQHN1c2UuZGU+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBZHJp
ZW4gR3Jhc3NlaW4gPGFkcmllbi5ncmFzc2VpbkBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBkcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcgfCAxICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9L
Y29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnCj4gPiBpbmRleCA0MDAxOTNl
MzhkMjkuLjcwYmNjZWFhZTliZiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvS2NvbmZpZwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnCj4gPiBA
QCAtNjgsNiArNjgsNyBAQCBjb25maWcgRFJNX0xPTlRJVU1fTFQ4OTEyQgo+ID4gICAgICAgICBz
ZWxlY3QgRFJNX0tNU19IRUxQRVIKPiA+ICAgICAgICAgc2VsZWN0IERSTV9NSVBJX0RTSQo+ID4g
ICAgICAgICBzZWxlY3QgUkVHTUFQX0kyQwo+ID4gKyAgICAgICBzZWxlY3QgVklERU9NT0RFX0hF
TFBFUlMKPiA+ICAgICAgICAgaGVscAo+ID4gICAgICAgICAgIERyaXZlciBmb3IgTG9udGl1bSBM
VDg5MTJCIERTSSB0byBIRE1JIGJyaWRnZQo+ID4gICAgICAgICAgIGNoaXAgZHJpdmVyLgo+ID4K
Pgo+IFJldmlld2VkLWJ5OiBSb2JlcnQgRm9zcyA8cm9iZXJ0LmZvc3NAbGluYXJvLm9yZz4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

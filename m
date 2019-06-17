Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC5148B3F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 20:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC8E892B6;
	Mon, 17 Jun 2019 18:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECF7892AA;
 Mon, 17 Jun 2019 18:04:02 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c6so374233wml.0;
 Mon, 17 Jun 2019 11:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=x5VqrGhaDJiLFrt7iyZycvqTLTrwKyX0b0VtcjwBMlo=;
 b=PXlNjPly2xvX4KmPNAqCJzNyL+zlYE/2NgPrhQTqnERfD2TK2K1bPBHtb/qS5OqUCF
 RU4hBfGrgCm/ljiXBN5zoIWyl06Una3MPvb57svEl5DOKJUS7UiE8zGpQ6IP3v4rEEMb
 xbNuG5s/pHCeCjU1A/6Qdy3lCeznhwLdFTRr1ciitt6Bf2ffmw2z1V3Z6XpJ3cn8/6RU
 FfVgJ/brt02TDuSH+KvCGez4Dx4ncCPncfUkZU270HXRp7YKgkJIaDt8s58ckED9XUqx
 S8kjTOWLyM+449MZ4Tburf9FJMnur9xbW/Iyu9cl92STWooHcUIAZKYumjhWORfuasTl
 WOaA==
X-Gm-Message-State: APjAAAW8t3CZBakzS0aEP+AGnW0baoHo/7ZCfhxFGUd+TRwgBh3foAKi
 bM6X3CGFEV07l+xBaq58vXC68Fdf
X-Google-Smtp-Source: APXvYqx/+AZOioC3dVyGuhA0Aq485DxEmanZimjL6R+6YMnsd2zpl+QuHYUdsK/urOPV12+X4XF1bQ==
X-Received: by 2002:a7b:cae2:: with SMTP id t2mr18450559wml.157.1560794641088; 
 Mon, 17 Jun 2019 11:04:01 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id h90sm26531193wrh.15.2019.06.17.11.04.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 11:04:00 -0700 (PDT)
Date: Mon, 17 Jun 2019 19:01:58 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [Intel-gfx] [PATCH 07/59] drm/arm/komeda: Remove DRIVER_HAVE_IRQ
Message-ID: <20190617180158.GA27349@arch-x1c3>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-8-daniel.vetter@ffwll.ch>
 <20190617062602.GA23827@james-ThinkStation-P300>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617062602.GA23827@james-ThinkStation-P300>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=x5VqrGhaDJiLFrt7iyZycvqTLTrwKyX0b0VtcjwBMlo=;
 b=HIVsO4dQx853iATHqYf4oem1BWdo+fR4fGJkFaqQ/V0bGWxf5hBTglr75kzH2dJBd+
 /mg5Ig2XRP7o2tfDXT3wXLpgoi5a5+5SENla9So/ogVFBrLvMI5Tl+ghGIRMd6g7YH8l
 i7N9gZm3+VLLniWJlGdPlxKKIR8+R/BU3VZhOYnimiOwSq+Dmy9/9NlH6C9OSLAsQnzu
 zz7ZQ5mwirgMIdoGKfdcLfFpfw4tvrxWFT6Tjwa2PL19QVZe/8dk2CTpE/ipjSVIyUzs
 fpD0Ut494y02pYfHwkEKNw3NRbBMtBowY0TS1WSG6zfIPie1UysbjkuwmLbGsYc51MpR
 aGvw==
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
Cc: nd <nd@arm.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNi8xNywgamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3Jv
dGU6Cj4gT24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMTA6MzU6MjNQTSArMDIwMCwgRGFuaWVsIFZl
dHRlciB3cm90ZToKPiA+IFJlYWQgdGhlIGRvY3MsIGtvbWVkYSBpcyBub3QgYW4gb2xkIGVub3Vn
aCBkcml2ZXIgZm9yIHRoaXMgOi0pCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+ID4gQ2M6ICJKYW1lcyAoUWlhbikgV2FuZyIg
PGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgo+ID4gQ2M6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRh
dUBhcm0uY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfa21zLmMgfCAzICstLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfa21zLmMKPiA+IGluZGV4IDBjNjM5NmRjMzIzZi4uYjlkNjk5Y2M3
YmJmIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfa21zLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2ttcy5jCj4gPiBAQCAtNTUsOCArNTUsNyBAQCBzdGF0aWMgaXJxcmV0dXJuX3Qga29t
ZWRhX2ttc19pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkYXRhKQo+ID4gIH0KPiA+ICAKPiA+
ICBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIga29tZWRhX2ttc19kcml2ZXIgPSB7Cj4gPiAtCS5k
cml2ZXJfZmVhdHVyZXMgPSBEUklWRVJfR0VNIHwgRFJJVkVSX01PREVTRVQgfCBEUklWRVJfQVRP
TUlDIHwKPiA+IC0JCQkgICBEUklWRVJfSEFWRV9JUlEsCj4gPiArCS5kcml2ZXJfZmVhdHVyZXMg
PSBEUklWRVJfR0VNIHwgRFJJVkVSX01PREVTRVQgfCBEUklWRVJfQVRPTUlDLAo+ID4gIAkubGFz
dGNsb3NlCQkJPSBkcm1fZmJfaGVscGVyX2xhc3RjbG9zZSwKPiA+ICAJLmlycV9oYW5kbGVyCQkJ
PSBrb21lZGFfa21zX2lycV9oYW5kbGVyLAo+IAo+IEhpIERhbmllbDoKPiAKPiBUaGFuayB5b3Ug
Zm9yIHRoZSBwYXRjaC4KPiAKPiBBbmQgQXlhbiBhbHNvIHNlbnQgdHdvIHBhdGNoZXMgZm9yIHRo
aXMgdG9waWMuIGxpa2U6Cj4gCj4gRm9yIGRyb3AgZHJtX2lycV9pbnN0YWxsOgo+IGh0dHBzOi8v
cGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjE3NjMvCj4gRm9yIG1hbnVhbGx5IHNl
dCBkcm0tPmlycV9lbmFibGVkOgo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9z
ZXJpZXMvNjE3NzYvCj4gCj4gRm9yIGNsZWFyLCBzZWVtcyB3ZSdkIGJldHRlciBzcXVhc2ggYWxs
IHRoZXNlIHRocmVlIHBhdGNoZXMgaW50byBvbmUKPiBzaW5nbGUgcGF0Y2guCj4gCj4gSGkgQXlh
bjoKPiBDb3VsZCB5b3UgaGVscCB0aGUgc3F1YXNoIGFsbCB0aGVzZSBwYXRjaGVzIHRvIGEgc2lu
Z2xlIG9uZS4KPiAKQ29uc2lkZXJpbmcgdGhlIGV4dHJhIHBhdGNoZXMsIG1pZ2h0IGJlIHdvcnRo
IHNwbGl0dGluZyB0aGlzIG91dHNpZGUgb2YKdGhpcyBodWdlIHNlcmllcz8KCkVtaWwKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBE71040FA
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 17:40:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDCE46E8B4;
	Wed, 20 Nov 2019 16:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B8B6E8B4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 16:40:20 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id w9so648105wrr.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 08:40:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=RB5ZmnOBrz94FKCQLZ2un9z7w5NJ9rHKH0gi3NUYCdU=;
 b=l9crOk6M1gvLZ/Z3dDznOk9tjdiisal360lde+tD0MDlxNlqji8gY9gddALAtbbzJH
 b2whXjXSTkb3ADLrq+zmRLfP9oGH7rFcfx0eRvxkt/BbiAFA+N+hK77x28yIGoKPqEBt
 nvH38w8gzRPuOBmc/U7+31DeIEMbInOME8DfESg58iRn9XFrUpKXeqRl3DJ6zTMLCYhi
 gufHkAJ2hslY3AI34KKWQqUPLAgYbl/GVlTBGhgl+JZLMVHGkXk6fjuqzFBdFJg7yhwu
 o9MMUSr1JD15it8iG2ivTpYrKJE8hffPb3fFCxTzgapK/vsPxqGa2gFAg/kVr6BGlrma
 jcvA==
X-Gm-Message-State: APjAAAW/uZBLBIrQZkwYvPI0O+v0jpSfFyuot4xtXfC7rxPyfQInWOy1
 IvrqrAJZMZQ891xtGofL3c5l8Gqa120=
X-Google-Smtp-Source: APXvYqzazHWNEpR6TDRVZdLb3zC82BtG8q56aJqXkTBYFpfvyUsFtFrKnrMMtTn/v7y7yNmvYXPxNg==
X-Received: by 2002:a5d:4142:: with SMTP id c2mr4626118wrq.60.1574268018953;
 Wed, 20 Nov 2019 08:40:18 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id d7sm32334298wrx.11.2019.11.20.08.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 08:40:18 -0800 (PST)
Date: Wed, 20 Nov 2019 17:40:16 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] drm/bridge: Fix Kconfig indentation
Message-ID: <20191120164016.GQ30416@phenom.ffwll.local>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
References: <20191120133634.11601-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120133634.11601-1-krzk@kernel.org>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RB5ZmnOBrz94FKCQLZ2un9z7w5NJ9rHKH0gi3NUYCdU=;
 b=FwQxQt24Jex/90mCOVXSXgGXgkuL9kqqWTITnZct9eutLKM27hcW/dirO3XvCbvgh9
 CbXUHLTBJj0Ki+t2u6auH58+YDsOk4+S5XLzwNow31+dDru1ONoyrKgVzoCNPQIDtbyW
 MHFA96nAIk7st9CwiU5tHzG1hSgfWEwY7SKzk=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMDk6MzY6MzRQTSArMDgwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBBZGp1c3QgaW5kZW50YXRpb24gZnJvbSBzcGFjZXMgdG8gdGFiICgrb3B0
aW9uYWwgdHdvIHNwYWNlcykgYXMgaW4KPiBjb2Rpbmcgc3R5bGUgd2l0aCBjb21tYW5kIGxpa2U6
Cj4gCSQgc2VkIC1lICdzL14gICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KCmxpbWEsIG1nYTIw
MGcgYW5kIGJyaWRnZSBwYXRjaGVzIGFsc28gcXVldWVkLgotRGFuaWVsCgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZp
Zwo+IGluZGV4IDM0MzYyOTc2Y2Q2Zi4uMTc2ZWZhMThlMzJjIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
S2NvbmZpZwo+IEBAIC02MCwxMCArNjAsMTAgQEAgY29uZmlnIERSTV9NRUdBQ0hJUFNfU1REUFhY
WFhfR0VfQjg1MFYzX0ZXCj4gIAlzZWxlY3QgRFJNX0tNU19IRUxQRVIKPiAgCXNlbGVjdCBEUk1f
UEFORUwKPiAgCS0tLWhlbHAtLS0KPiAtICAgICAgICAgIFRoaXMgaXMgYSBkcml2ZXIgZm9yIHRo
ZSBkaXNwbGF5IGJyaWRnZXMgb2YKPiAtICAgICAgICAgIEdFIEI4NTB2MyB0aGF0IGNvbnZlcnQg
ZHVhbCBjaGFubmVsIExWRFMKPiAtICAgICAgICAgIHRvIERQKysuIFRoaXMgaXMgdXNlZCB3aXRo
IHRoZSBpLk1YNiBpbXgtbGRiCj4gLSAgICAgICAgICBkcml2ZXIuIFlvdSBhcmUgbGlrZWx5IHRv
IHNheSBOIGhlcmUuCj4gKwkgIFRoaXMgaXMgYSBkcml2ZXIgZm9yIHRoZSBkaXNwbGF5IGJyaWRn
ZXMgb2YKPiArCSAgR0UgQjg1MHYzIHRoYXQgY29udmVydCBkdWFsIGNoYW5uZWwgTFZEUwo+ICsJ
ICB0byBEUCsrLiBUaGlzIGlzIHVzZWQgd2l0aCB0aGUgaS5NWDYgaW14LWxkYgo+ICsJICBkcml2
ZXIuIFlvdSBhcmUgbGlrZWx5IHRvIHNheSBOIGhlcmUuCj4gIAo+ICBjb25maWcgRFJNX05YUF9Q
VE4zNDYwCj4gIAl0cmlzdGF0ZSAiTlhQIFBUTjM0NjAgRFAvTFZEUyBicmlkZ2UiCj4gLS0gCj4g
Mi4xNy4xCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs

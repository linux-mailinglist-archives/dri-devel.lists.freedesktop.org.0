Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 902272C939E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 01:06:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE10E89D67;
	Tue,  1 Dec 2020 00:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339AA89D67;
 Tue,  1 Dec 2020 00:06:08 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id o25so16275268oie.5;
 Mon, 30 Nov 2020 16:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VJ6GVGZJnlia94V5K1MGzcsJQIbX5tNg1UJ/89bmUcU=;
 b=TSK5uOsu/FbeF3GDDL0u4zr97u2HPAHfevzLlKrwftFCYXCP3aV0mRrE9lPd14kA2a
 DxSKOeniR0G6XZzxjmAE6ROPljYL34xNeuDS24kRcTbg7yEcB5nEQoupithEVne70Mjh
 zPtHZec4cLhdz7O1yWy5yBLDG9ipUQ2X7Tqp5/9SPTtTqPSinqVXJxvzfiNc7J3VEo0e
 oGy7c8adhKiIx4aI785B/1Hx6qVLhif7HnSPeapZ8ImTo+2G5/E8rNMPArmHm90ZT+wh
 ap947bOeMkqVqWDX+PceR62RzRVNwH6oZLPU8tudP6EwP3a82BNbZb106+6Vcqfu//Vu
 8KMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VJ6GVGZJnlia94V5K1MGzcsJQIbX5tNg1UJ/89bmUcU=;
 b=B1P+YC+3YzNwEv8W4WkR7VZcKpU6tEdf7Vi3ZOXXmz2iZB+3r6DxR+HQxfJi5EMnj/
 1/R5iVTs2DwcCBWoElB+u2O9emGfHbcinUMwxdlsTgq837tKUVkVljnMEeKRSDKPKAwU
 l/sn7ZXvkPRXmk3JCU35imzVWLj+k5SrNd1xkt7Y/LUAFRn0OV14vJaN1RERlOefxfLa
 76VfzLLb8plH2z6NqmE6BNs2pZljHnq3Svgeqrw6cBxsyk9PmeOjl06XySbPEMm+n9kB
 Fr93UGbcAbuI3GxPK3INxF8ayqw2BjDabDyQ+XDqknPgyZwYuDALmJPLKXmzABxfmCAc
 c4hg==
X-Gm-Message-State: AOAM533Lu+8QFaJFceXKk7Lzc1vBFuNaJEJRn3HOPDmRCbYiemb0vaK/
 Uv+2/+ZveM8SUdDNkR2kyxsrmL4ZSbwTVBpu434=
X-Google-Smtp-Source: ABdhPJy81PYJy+yCScmXWOfjTflC7etYxCUmcD2F95/TLx6FI5rVtQ+OVJq4ym2V/ewVERoAs5nFMaDLDb0Su4XxR94=
X-Received: by 2002:a54:4608:: with SMTP id p8mr49420oip.5.1606781167608; Mon,
 30 Nov 2020 16:06:07 -0800 (PST)
MIME-Version: 1.0
References: <20201126134240.3214176-1-lee.jones@linaro.org>
 <20201126134240.3214176-39-lee.jones@linaro.org>
In-Reply-To: <20201126134240.3214176-39-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 19:05:56 -0500
Message-ID: <CADnq5_O_-uxOa0463_ZX5D3jMwxJMWX7eCvGHyiwaku559bNLw@mail.gmail.com>
Subject: Re: [PATCH 38/40] drm/amd/display/dc/basics/conversion: Include
 header containing our prototypes
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjYsIDIwMjAgYXQgODo0NCBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMv
YmFzaWNzL2NvbnZlcnNpb24uYzozNDoxMDogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBl
IGZvciDigJhmaXhlZF9wb2ludF90b19pbnRfZnJhY+KAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNd
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvYmFzaWNzL2NvbnZl
cnNpb24uYzo4MTo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGNvbnZl
cnRfZmxvYXRfbWF0cml44oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPgo+IENjOiBIYXJyeSBX
ZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KPiBDYzogTGVvIExpIDxzdW5wZW5nLmxp
QGFtZC5jb20+Cj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
PiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6
IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVz
IDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmFzaWNzL2NvbnZlcnNpb24uYyB8IDEg
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmFzaWNzL2NvbnZlcnNpb24uYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9iYXNpY3MvY29udmVyc2lvbi5jCj4gaW5kZXggNTBiNDdm
MTE4NzVjOS4uMjRlZDAzZDhjZGE3NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvYmFzaWNzL2NvbnZlcnNpb24uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9iYXNpY3MvY29udmVyc2lvbi5jCj4gQEAgLTI0LDYgKzI0LDcgQEAKPiAg
ICovCj4KPiAgI2luY2x1ZGUgImRtX3NlcnZpY2VzLmgiCj4gKyNpbmNsdWRlICJjb252ZXJzaW9u
LmgiCj4KPiAgI2RlZmluZSBESVZJREVSIDEwMDAwCj4KPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

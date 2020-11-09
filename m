Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7792B2AC047
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 16:54:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97B98931E;
	Mon,  9 Nov 2020 15:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F1C892EF
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 15:54:37 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r17so5301449wrw.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 07:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Vgj+VBb4FO5zUmdkThFUMaCS/pBU2/vFgFr8mGdc9Q8=;
 b=cmoCWERZwYwkY9glA4wA80U0LzeV8RfArHXrY66RMRFXbXJnrBbIC+YXfqUOqSS10L
 1+z4N39K3Wzhbn+jJi/shVXWO0n/CgGBUGUVFRAFor0hBo4Fa+X2Hg5YcIT8lDBLWpaG
 Km3NT6fzOGCnybiyXzY2jSyfKnmSlWKUB3fbk9JBXXvVaDyFzpsD6VDIc2z+0mfeqDNN
 3KPRiygEEwV5whCnuN7XI9oL7cQHWax+qgThnfO3RO2EcfKuOiG+/aeY2vKwTrPzeZFF
 PwBvjhE4x1ha1dpoyM+PVJwcxCrTBOSDqZLkJDksEOGi5xdw1qYxuLEVcvBw3wP9yDtL
 275A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Vgj+VBb4FO5zUmdkThFUMaCS/pBU2/vFgFr8mGdc9Q8=;
 b=KFscFEw6x993iBe4Dv3hFRkDyVLZfbMAgEZRtg4iDdN7LSoMesHzGQ5mMCHXZSQ5s7
 kwSGJ5n1IBcqLORYIoT75aZIpFViwal3X300ovHAJDZilzkG5Av+pQyd/5WyG5jviRWG
 OzAVtdGVU23WzG5VyK9k/hKxT9B5FsuJk+Hc9osvpK0rVKdr3x4fB56mRZUhvXhcxpoI
 JdrJZ8cyKeguZfnyGBSYDOxytcqXNs9ujlfJ07EVUxzj/TJ6W4FHz0dQSG1ajkiI5jcC
 Ul4nxrloRud9nP13pZYeB206f/C8eAqMMNnTLHNc2RKbO8VNv7hLQ3ibYb/wGMFD/KD4
 cX7g==
X-Gm-Message-State: AOAM532O5i+J+vs05w4omY211Z0Jrs6UK7FfHZFcCTYgAyDBs/dUE59X
 XQ4idx/bmMmgcDVxUL9PDPA6Q1nwnBbeMxvzzfo=
X-Google-Smtp-Source: ABdhPJxrujFH2LQdj14+1+dahP5PjEdUU1QdXfieb1Vx2w8lpP9i6Ehvv9Yxi3zUbnZonM7e3Kb1iJ36Pe4Whw6wjZ0=
X-Received: by 2002:adf:e350:: with SMTP id n16mr19177980wrj.419.1604937275905; 
 Mon, 09 Nov 2020 07:54:35 -0800 (PST)
MIME-Version: 1.0
References: <20201106141003.2535-1-christian.koenig@amd.com>
In-Reply-To: <20201106141003.2535-1-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 9 Nov 2020 10:54:24 -0500
Message-ID: <CADnq5_O80mQjQNP_vY5eVsCR8i0UeDVpT0GPQhj6nMjBFjvORg@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: fix missing NULL check in the new page pool
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: andy.lavr@gmail.com,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgNiwgMjAyMCBhdCA5OjEwIEFNIENocmlzdGlhbiBLw7ZuaWcKPGNrb2VuaWcu
bGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPgo+IFRoZSBwb29sIHBhcmFtZXRlciBj
YW4gYmUgTlVMTCBpZiB3ZSBmcmVlIHRocm91Z2ggdGhlIHNocmlua2VyLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKRG9lcyB0
aGlzIGZpeDoKaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9hbWQvLS9pc3N1ZXMv
MTM2MgoKQWNrZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
CgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jIHwgMiArLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9wb29sLmMKPiBpbmRleCA0NGVjNDFhYTc4ZDYuLjFiOTY3ODBiNDk4OSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9wb29sLmMKPiBAQCAtMTM1LDcgKzEzNSw3IEBAIHN0YXRpYyB2b2lkIHR0bV9wb29s
X2ZyZWVfcGFnZShzdHJ1Y3QgdHRtX3Bvb2wgKnBvb2wsIGVudW0gdHRtX2NhY2hpbmcgY2FjaGlu
ZywKPiAgICAgICAgICAgICAgICAgc2V0X3BhZ2VzX3diKHAsIDEgPDwgb3JkZXIpOwo+ICAjZW5k
aWYKPgo+IC0gICAgICAgaWYgKCFwb29sLT51c2VfZG1hX2FsbG9jKSB7Cj4gKyAgICAgICBpZiAo
IXBvb2wgfHwgIXBvb2wtPnVzZV9kbWFfYWxsb2MpIHsKPiAgICAgICAgICAgICAgICAgX19mcmVl
X3BhZ2VzKHAsIG9yZGVyKTsKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+ICAgICAgICAgfQo+
IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A512CE95A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC636E138;
	Fri,  4 Dec 2020 08:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBAF36E138
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 08:18:23 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id lt17so7456884ejb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Dec 2020 00:18:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VemDQ6EGsBsmNy3s9ek1G18QMI3vy92u8aJPDPxveeg=;
 b=nUhLwAJ0c281mgUVHk7nSnOOkuIiGP4tvl46ikqh7uUS0zbXHKuA3wDI3yreyXkzFS
 9T+qWTbQWDepgXkeXFTGA16f1PQmQAD2nk0HxwRke/ni7LeRL45pLBpvuHik7JZkOxgp
 2SUPYUWEotE+CTFopMuWGxm70xA3WzAw7QeUZ+6BAqk423WAqnSttcD4PtlZizfgHEjG
 I/3YG7mm76gbOWu7YkCzEWDq6mpA4BHKseIwmSaEdiGs5/+SDhxWTXYhxO2NKJtQDkWu
 e/vPfWYMQuW0WCwRbMSpqgBbFN1eY5qntzj1eUJCZgVbIVUGYiYgl5UCIAZ+qvxh/sff
 PXGg==
X-Gm-Message-State: AOAM533TuhErlwOxE4gzAX5ceNeOwxOVqMtYjKjDRFxjWHBQP95nqfBd
 /pEGUPtwGotEGArLDvRaTFA=
X-Google-Smtp-Source: ABdhPJwL0al19RhXuOfgb8PeQPspdUlFB4mwc2b7uxWixr+3jMaX8oS7lNdpsirID5U93f3GAg7S4A==
X-Received: by 2002:a17:906:c046:: with SMTP id
 bm6mr5770776ejb.436.1607069902146; 
 Fri, 04 Dec 2020 00:18:22 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id z22sm2504364eji.91.2020.12.04.00.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 00:18:20 -0800 (PST)
Date: Fri, 4 Dec 2020 10:18:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/2] drm/ingenic: depend on COMMON_CLK to fix compile tests
Message-ID: <20201204081819.GA3891@kozik-lap>
References: <20201116175301.402787-1-krzk@kernel.org>
 <20201116175301.402787-2-krzk@kernel.org>
 <3ANWJQ.LV5B6V47KTYS2@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ANWJQ.LV5B6V47KTYS2@crapouillou.net>
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
Cc: linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMDc6NTQ6MDNQTSArMDAwMCwgUGF1bCBDZXJjdWVpbCB3
cm90ZToKPiBIaSBLcnp5c3p0b2YsCj4gCj4gTGUgbHVuLiAxNiBub3YuIDIwMjAgw6AgMTg6NTMs
IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4gYSDDqWNyaXQKPiA6Cj4gPiBU
aGUgSW5nZW5pYyBEUk0gdXNlcyBDb21tb24gQ2xvY2sgRnJhbWV3b3JrIHRodXMgaXQgY2Fubm90
IGJlIGJ1aWx0IG9uCj4gPiBwbGF0Zm9ybXMgd2l0aG91dCBpdCAoZS5nLiBjb21waWxlIHRlc3Qg
b24gTUlQUyB3aXRoIFJBTElOSyBhbmQKPiA+IFNPQ19SVDMwNVgpOgo+ID4gCj4gPiAgICAgL3Vz
ci9iaW4vbWlwcy1saW51eC1nbnUtbGQ6Cj4gPiBkcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdl
bmljLWRybS1kcnYubzogaW4gZnVuY3Rpb24KPiA+IGBpbmdlbmljX2RybV9iaW5kLmlzcmEuMCc6
Cj4gPiAgICAgaW5nZW5pYy1kcm0tZHJ2LmM6KC50ZXh0KzB4MTYwMCk6IHVuZGVmaW5lZCByZWZl
cmVuY2UgdG8KPiA+IGBjbGtfZ2V0X3BhcmVudCcKPiA+ICAgICAvdXNyL2Jpbi9taXBzLWxpbnV4
LWdudS1sZDogaW5nZW5pYy1kcm0tZHJ2LmM6KC50ZXh0KzB4MTZiMCk6Cj4gPiB1bmRlZmluZWQg
cmVmZXJlbmNlIHRvIGBjbGtfZ2V0X3BhcmVudCcKPiA+IAo+ID4gUmVwb3J0ZWQtYnk6IGtlcm5l
bCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9m
IEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgo+IAo+IEFja2VkLWJ5OiBQYXVsIENlcmN1ZWls
IDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4KClRoYW5rcyBmb3IgdGhlIGFjay4KCkRhdmlkIGFuZCBE
YW5pZWwsCkkgdGhpbmsgdGhlcmUgaXMgbm8gZGVkaWNhdGVkIG1haW50YWluZXIgZm9yIEluZ2Vu
aWMgRFJNLCBzbyBjYW4geW91CnBpY2sgaXQgdXAgZGlyZWN0bHk/CgpCZXN0IHJlZ2FyZHMsCkty
enlzenRvZgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

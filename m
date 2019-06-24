Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB9051069
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 17:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCE389B49;
	Mon, 24 Jun 2019 15:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEBE89B49
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 15:29:50 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id B739820027;
 Mon, 24 Jun 2019 17:29:46 +0200 (CEST)
Date: Mon, 24 Jun 2019 17:29:44 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Inki Dae <daeinki@gmail.com>
Subject: Re: [PATCH v4 2/2] drm/exynos: trigger build of all modules
Message-ID: <20190624152944.GA20945@ravnborg.org>
References: <20190622115623.16314-1-sam@ravnborg.org>
 <20190622115623.16314-3-sam@ravnborg.org>
 <CAAQKjZPqunjVctjFJdwJMEmz7DHT8mDgMQ-_a3sw6BGO9K2q2w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAQKjZPqunjVctjFJdwJMEmz7DHT8mDgMQ-_a3sw6BGO9K2q2w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=YRlpexu18wrs5fNeD8wA:9 a=CjuIK1q_8ugA:10
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
Cc: David Airlie <airlied@linux.ie>, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSW5raQoKRnJvbSBjaGFuZ2Vsb2c6Cj4gPgo+ID4gSW5jbHVkZSBmaXggb2YgZXh5bm9zIGJ1
aWxkIGZvciBhbHBoYS4KPiA+CgoKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL2V4eW5vc19kcm1fZmJkZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2Ry
bV9mYmRldi5jCj4gPiBpbmRleCBhZWZjZDYyNGZlMzIuLmIwODc3Yjk3MjkxYyAxMDA2NDQKPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9mYmRldi5jCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmJkZXYuYwo+ID4gQEAgLTEwLDYg
KzEwLDcgQEAKPiA+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2NvbnNvbGUuaD4KPiA+ICAjaW5jbHVk
ZSA8bGludXgvZG1hLW1hcHBpbmcuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvdm1hbGxvYy5oPgo+
IAo+IElzIHRoaXMgY2hhbmdlIHJlbGF0ZWQgdG8gdGhpcyBwYXRjaD8KClRoaXMgaXMgdGhlIGFi
b3ZlIG1lbnRpb25lZCBmaXguCkFscGhhIG9mdGVuIG5lZWRzIG9uZSB0byBwdWxsIGluIHZtYWxs
b2MuaCAtIHdoZXJlIGFsbCBvdGhlcgphcmNoaXRlY3R1cmVzIGdldCBpdCBpbmRpcmVjdCB2aWEg
b3RoZXIgaGVhZGVycy4KSSBoYXZlIG5ldmVyIGJvdGhlcmVkIHRvIGZpbmQgb3V0IHdoeSBhbHBh
IG5lZWRzIG1vcmUgaGVhZGVycyBmaWxlcywKYnV0IEkgYWx3YXlzIG1ha2Ugc3VyZSB0byB0ZXN0
IHRoaW5ncyB1c2luZyBhbHBoYSBzbyAwLWRheSBkbyBub3QgeWVsbCBhdCBtZS4KCglTYW0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

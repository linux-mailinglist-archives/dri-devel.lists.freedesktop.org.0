Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E188562D
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 00:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A9D6E02B;
	Wed,  7 Aug 2019 22:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753B06E02B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 22:48:18 +0000 (UTC)
Received: from ip5f5a6044.dynamic.kabel-deutschland.de ([95.90.96.68]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1hvUj8-0003su-OM; Thu, 08 Aug 2019 00:48:14 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: John Keeping <john@metanate.com>
Subject: Re: [PATCH] drm/rockchip: fix VOP_WIN_GET macro
Date: Thu, 08 Aug 2019 00:48:14 +0200
Message-ID: <2679769.bco7YeSQm7@diego>
In-Reply-To: <20190703095111.29117-1-john@metanate.com>
References: <20190703095111.29117-1-john@metanate.com>
MIME-Version: 1.0
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
Cc: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gTWl0dHdvY2gsIDMuIEp1bGkgMjAxOSwgMTE6NTE6MTEgQ0VTVCBzY2hyaWViIEpvaG4gS2Vl
cGluZzoKPiBDb21taXQgOWE2MWM1NGI5YmZmICgiZHJtL3JvY2tjaGlwOiB2b3A6IGdyb3VwIHZv
cCByZWdpc3RlcnMiKSBzZWVtcyB0bwo+IGhhdmUgdW5pbnRlbnRpb25hbGx5IGNoYW5nZWQgdGhl
IGRlZmludGlvbiBvZiB0aGlzIG1hY3JvLiAgU2luY2UgaXQgaXMKPiB1bnVzZWQsIHRoaXMgd2Fz
IG5vdCBzcG90dGVkIGJ1dCBhbnkgYXR0ZW1wdCB0byB1c2UgaXQgcmVzdWx0cyBpbgo+IGNvbXBp
bGF0aW9uIGVycm9ycy4KPiAKPiBSZXZlcnQgdG8gdGhlIHByZXZpb3VzIGRlZmluaXRpb24uCj4g
Cj4gRml4ZXM6IDlhNjFjNTRiOWJmZiAoImRybS9yb2NrY2hpcDogdm9wOiBncm91cCB2b3AgcmVn
aXN0ZXJzIikKPiBTaWduZWQtb2ZmLWJ5OiBKb2huIEtlZXBpbmcgPGpvaG5AbWV0YW5hdGUuY29t
PgoKYXBwbGllZCB0byBkcm0tbWlzYy1uZXh0CgpUaGFua3MKSGVpa28KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

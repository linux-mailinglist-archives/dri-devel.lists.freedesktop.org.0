Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC641141EF7
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jan 2020 17:04:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBDC6E3FC;
	Sun, 19 Jan 2020 16:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495BE6E3FC
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jan 2020 16:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZOZk+gP1VJ2wj7bwOcS87OUCNxDRCwd2z6Z+GhIYdvo=; b=min0ay15iz5Azl8EH2gokGrmJo
 WrALYcl4GAeJrcbW2pClNb1UILmHYNePAK1bqx0uM30oy+8yqh9xSbgu2sxw8ssPPloLPr6GC3Hcq
 AVl/kgQ9TZqsdk5Xben+IttQaB/2e35AB/DQQU6aH+L0P6Pwr3I/p8oiz0ZrsaRSLXri6hyn4m9p+
 p3ayo18SpWGuSRkqGivOS29Pa4ye/dXk+KJld6bYTLGRcFlMnlzb2SiHHd5W1StLHw7oUTLa5VhOT
 QWmNsCsEz67NLeIXcxw/KCoXTgJjKzKMqm8dgDPuaNeeqPviORl8CxkqBSZJiKL6b564h5Xl1/arX
 bQK8owUQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:64649
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1itD3Q-0002R4-VY; Sun, 19 Jan 2020 17:04:00 +0100
Subject: Re: [PATCH v2 3/5] drm/mipi_dbi: Add support for display offsets
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Lechner <david@lechnology.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
References: <20200115124548.3951-1-geert+renesas@glider.be>
 <20200115124548.3951-4-geert+renesas@glider.be>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <04ac0b1f-daa9-b7ac-82ee-682c5da5d467@tronnes.org>
Date: Sun, 19 Jan 2020 17:03:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200115124548.3951-4-geert+renesas@glider.be>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Chris Brandt <chris.brandt@renesas.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTUuMDEuMjAyMCAxMy40NSwgc2tyZXYgR2VlcnQgVXl0dGVyaG9ldmVuOgo+IElmIHRo
ZSByZXNvbHV0aW9uIG9mIHRoZSBURlQgZGlzcGxheSBpcyBzbWFsbGVyIHRoYW4gdGhlIG1heGlt
dW0KPiByZXNvbHV0aW9uIHN1cHBvcnRlZCBieSB0aGUgZGlzcGxheSBjb250cm9sbGVyLCB0aGUg
ZGlzcGxheSBtYXkgYmUKPiBjb25uZWN0ZWQgdG8gdGhlIGRyaXZlciBvdXRwdXQgYXJyYXlzIHdp
dGggYSBob3Jpem9udGFsIGFuZC9vciB2ZXJ0aWNhbAo+IG9mZnNldCwgbGVhZGluZyB0byBhIHNo
aWZ0ZWQgaW1hZ2UuCj4gCj4gQWRkIHN1cHBvcnQgZm9yIHNwZWNpZnlpbmcgdGhlc2Ugb2Zmc2V0
cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNA
Z2xpZGVyLmJlPgo+IFJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+
Cj4gLS0tCgpBY2tlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B5667596
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 21:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9236E379;
	Fri, 12 Jul 2019 19:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1856E379
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 19:54:35 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id F3BB420000A;
 Fri, 12 Jul 2019 19:54:29 +0000 (UTC)
Date: Fri, 12 Jul 2019 21:54:29 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] drm/modes: Don't apply cmdline's rotation if it
 wasn't specified
Message-ID: <20190712195429.dlz5ofwoafciedcq@flea>
References: <20190711021313.29445-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190711021313.29445-1-digetx@gmail.com>
User-Agent: NeoMutt/20180716
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdWwgMTEsIDIwMTkgYXQgMDU6MTM6MTNBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IFRoZSByb3RhdGlvbiBtb2RlIGZyb20gY21kbGluZSBzaG91bGRuJ3QgYmUgdGFr
ZW4gaW50byBhY2NvdW50IGlmIGl0Cj4gd2Fzbid0IHNwZWNpZmllZCBpbiB0aGUgY21kbGluZS4g
VGhpcyBmaXhlcyBpZ25vcmVkIGRlZmF1bHQgZGlzcGxheQo+IG9yaWVudGF0aW9uIHdoZW4gZGlz
cGxheSBtb2RlIGlzIGdpdmVuIHVzaW5nIGNtZGxpbmUgd2l0aG91dCB0aGUKPiByb3RhdGlvbiBi
ZWluZyBzcGVjaWZpZWQuCj4KPiBGaXhlczogMWJmNGUwOTIyN2MzICgiZHJtL21vZGVzOiBBbGxv
dyB0byBzcGVjaWZ5IHJvdGF0aW9uIGFuZCByZWZsZWN0aW9uIG9uIHRoZSBjb21tYW5kbGluZSIp
Cj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgoKQWNr
ZWQtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+CgpUaGFua3Mh
Ck1heGltZQoKLS0KTWF4aW1lIFJpcGFyZCwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2Vy
bmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

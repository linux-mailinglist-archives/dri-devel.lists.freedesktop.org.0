Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEDAD586E
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2019 23:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8986E117;
	Sun, 13 Oct 2019 21:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD7B6E117
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2019 21:58:33 +0000 (UTC)
Received: from i59f7e0c5.versanet.de ([89.247.224.197] helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1iJlsm-0004vN-BX; Sun, 13 Oct 2019 23:58:32 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] drm/rockchip/rk3066: Use devm_platform_ioremap_resource()
 in rk3066_hdmi_bind()
Date: Sun, 13 Oct 2019 23:58:26 +0200
Message-ID: <12988569.FbAFs2EWry@phil>
In-Reply-To: <0666bc0b-6624-21a0-47c4-b78e2a3b3ad5@web.de>
References: <0666bc0b-6624-21a0-47c4-b78e2a3b3ad5@web.de>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-rockchip@lists.infradead.org, Johan Jonker <jbx6244@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Zheng Yang <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gU2Ftc3RhZywgMjEuIFNlcHRlbWJlciAyMDE5LCAyMDo0MDoxNiBDRVNUIHNjaHJpZWIgTWFy
a3VzIEVsZnJpbmc6Cj4gRnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNl
Zm9yZ2UubmV0Pgo+IERhdGU6IFNhdCwgMjEgU2VwIDIwMTkgMjA6MzI6MjUgKzAyMDAKPiAKPiBT
aW1wbGlmeSB0aGlzIGZ1bmN0aW9uIGltcGxlbWVudGF0aW9uIGJ5IHVzaW5nIGEga25vd24gd3Jh
cHBlciBmdW5jdGlvbi4KPiAKPiBUaGlzIGlzc3VlIHdhcyBkZXRlY3RlZCBieSB1c2luZyB0aGUg
Q29jY2luZWxsZSBzb2Z0d2FyZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXJrdXMgRWxmcmluZyA8
ZWxmcmluZ0B1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+CgphcHBsaWVkIHRvIGRybS1taXNjLW5leHQK
ClRoYW5rcwpIZWlrbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==

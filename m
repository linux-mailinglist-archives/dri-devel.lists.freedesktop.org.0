Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AA28E69F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A8C6E925;
	Thu, 15 Aug 2019 08:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2AF6E56E;
 Tue, 13 Aug 2019 00:22:35 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 9E0EE3E95F;
 Tue, 13 Aug 2019 00:22:32 +0000 (UTC)
Date: Mon, 12 Aug 2019 20:22:32 -0400
From: Brian Masney <masneyb@onstation.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/7] drm/msm/mdp4: Drop unused GPIO include
Message-ID: <20190813002232.GA7391@onstation.org>
References: <20190629125933.679-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190629125933.679-1-linus.walleij@linaro.org>
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1565655753;
 bh=sb0WR/Lam+MQeGrs+dKxlciD9ML3MyK8geyLpKKaC1Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VW81jMPwL4Fy7OcT/tg3E7kK7C8W1WdYNvi0AaKyHGxJ+iY8b52lc48Q85E60r67/
 I+VadjPwDyGglbpklKzAZxirfF8ixd0F4j+ox+kwdTRF1XEBU83/Q2L6U8rbtGThQr
 MpJGf3QslLSm2OfKEFNFg+Ph2o+EUt6NXJBRGIYY=
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
Cc: freedreno@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMjksIDIwMTkgYXQgMDI6NTk6MjdQTSArMDIwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBUaGlzIGZpbGUgaXMgbm90IHVzaW5nIGFueSBzeW1ib2xzIGZyb20gPGxpbnV4L2dw
aW8uaD4gc28ganVzdAo+IGRyb3AgdGhpcyBpbmNsdWRlLgo+IAo+IENjOiBSb2IgQ2xhcmsgPHJv
YmRjbGFya0BnbWFpbC5jb20+Cj4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgo+IENj
OiBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZwo+IENjOiBmcmVlZHJlbm9AbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVp
akBsaW5hcm8ub3JnPgoKRm9yIHRoZSBzZXJpZXM6CgpSZXZpZXdlZC1ieTogQnJpYW4gTWFzbmV5
IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==

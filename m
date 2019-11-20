Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C1F103BAA
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 14:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188246E9CF;
	Wed, 20 Nov 2019 13:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1656E9C3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 13:36:39 +0000 (UTC)
Received: from localhost.localdomain (unknown [118.189.143.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 479B521939;
 Wed, 20 Nov 2019 13:36:37 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: Fix Kconfig indentation
Date: Wed, 20 Nov 2019 21:36:34 +0800
Message-Id: <20191120133634.11601-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574256999;
 bh=KQHLvaPBIFjocC8JrZjfJUy2MvGrWCgUpnuB0PzKb8Q=;
 h=From:To:Cc:Subject:Date:From;
 b=xXjWHhibAsMZrP90j1ZQgMWY7T+2rmkTlBUNnofBO6Lrr/k7ndoDndJUWLXuaGOx6
 KA2uFOCS+rpCB8G1rfLvwucMYJ8BKEg5tsHESurVVfPp3EhgkOGEwQog4T/n+H7dp+
 5IVNgd7weM+11CwRUwwJQ0XkT5cxOMuOta1NaUi4=
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
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRqdXN0IGluZGVudGF0aW9uIGZyb20gc3BhY2VzIHRvIHRhYiAoK29wdGlvbmFsIHR3byBzcGFj
ZXMpIGFzIGluCmNvZGluZyBzdHlsZSB3aXRoIGNvbW1hbmQgbGlrZToKCSQgc2VkIC1lICdzL14g
ICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZp
ZyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnIGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnCmluZGV4IDM0MzYyOTc2Y2Q2Zi4uMTc2ZWZhMThl
MzJjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnCkBAIC02MCwxMCArNjAsMTAgQEAgY29uZmlnIERS
TV9NRUdBQ0hJUFNfU1REUFhYWFhfR0VfQjg1MFYzX0ZXCiAJc2VsZWN0IERSTV9LTVNfSEVMUEVS
CiAJc2VsZWN0IERSTV9QQU5FTAogCS0tLWhlbHAtLS0KLSAgICAgICAgICBUaGlzIGlzIGEgZHJp
dmVyIGZvciB0aGUgZGlzcGxheSBicmlkZ2VzIG9mCi0gICAgICAgICAgR0UgQjg1MHYzIHRoYXQg
Y29udmVydCBkdWFsIGNoYW5uZWwgTFZEUwotICAgICAgICAgIHRvIERQKysuIFRoaXMgaXMgdXNl
ZCB3aXRoIHRoZSBpLk1YNiBpbXgtbGRiCi0gICAgICAgICAgZHJpdmVyLiBZb3UgYXJlIGxpa2Vs
eSB0byBzYXkgTiBoZXJlLgorCSAgVGhpcyBpcyBhIGRyaXZlciBmb3IgdGhlIGRpc3BsYXkgYnJp
ZGdlcyBvZgorCSAgR0UgQjg1MHYzIHRoYXQgY29udmVydCBkdWFsIGNoYW5uZWwgTFZEUworCSAg
dG8gRFArKy4gVGhpcyBpcyB1c2VkIHdpdGggdGhlIGkuTVg2IGlteC1sZGIKKwkgIGRyaXZlci4g
WW91IGFyZSBsaWtlbHkgdG8gc2F5IE4gaGVyZS4KIAogY29uZmlnIERSTV9OWFBfUFROMzQ2MAog
CXRyaXN0YXRlICJOWFAgUFROMzQ2MCBEUC9MVkRTIGJyaWRnZSIKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

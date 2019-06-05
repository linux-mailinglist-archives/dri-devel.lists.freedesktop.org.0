Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB69B3638F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 20:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720DD8959D;
	Wed,  5 Jun 2019 18:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5251F8959D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 18:49:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id BD1192829B9
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/panfrost: Require the simple_ondemand governor
Date: Wed,  5 Jun 2019 15:48:59 -0300
Message-Id: <20190605184859.9432-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
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
Cc: kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGFuZnJvc3QgZGVwZW5kcyBvbiB0aGUgc2ltcGxlX29uZGVtYW5kIGdvdmVybm9yLCBhbmQgdGhl
cmVmb3JlCml0J3MgYSByZXF1aXJlZCBjb25maWd1cmF0aW9uLiBTZWxlY3QgaXQuCgpGaXhlczog
ZjM2MTdiNDQ5ZCAoImRybS9wYW5mcm9zdDogU2VsZWN0IGRldmZyZXEiKQpTaWduZWQtb2ZmLWJ5
OiBFemVxdWllbCBHYXJjaWEgPGV6ZXF1aWVsQGNvbGxhYm9yYS5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L0tjb25maWcgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9LY29uZmlnIGIvZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L0tjb25maWcKaW5kZXggODE5NjNlOTY0YjBmLi44NmNkYzBj
ZTc5ZTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9LY29uZmlnCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9LY29uZmlnCkBAIC0xMCw2ICsxMCw3IEBAIGNvbmZp
ZyBEUk1fUEFORlJPU1QKIAlzZWxlY3QgSU9NTVVfSU9fUEdUQUJMRV9MUEFFCiAJc2VsZWN0IERS
TV9HRU1fU0hNRU1fSEVMUEVSCiAJc2VsZWN0IFBNX0RFVkZSRVEKKwlzZWxlY3QgREVWRlJFUV9H
T1ZfU0lNUExFX09OREVNQU5ECiAJaGVscAogCSAgRFJNIGRyaXZlciBmb3IgQVJNIE1hbGkgTWlk
Z2FyZCAoVDZ4eCwgVDd4eCwgVDh4eCkgYW5kCiAJICBCaWZyb3N0IChHM3gsIEc1eCwgRzd4KSBH
UFVzLgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=

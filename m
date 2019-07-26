Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B356E76271
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9085E6ECF2;
	Fri, 26 Jul 2019 09:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDF76ECED
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 09:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 66D6EFB04;
 Fri, 26 Jul 2019 11:49:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cdYBpbSNeu8W; Fri, 26 Jul 2019 11:49:13 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id EF5BC46AA1; Fri, 26 Jul 2019 11:49:12 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Robert Chiras <robert.chiras@nxp.com>, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] drm/mxsfb: Read bus flags from bridge if present
Date: Fri, 26 Jul 2019 11:49:11 +0200
Message-Id: <cover.1564134488.git.agx@sigxcpu.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGJyaWRnZSBtaWdodCBoYXZlIHNwZWNpYWwgcmVxdWlybWVudGVzIG9uIHRoZSBpbnB1dCBi
dXMuIFRoaXMKaXMgZS5nLiB1c2VkIGJ5IHRoZSBpbXgtbndsIGJyaWRnZS4KClJvYmVydCwgbWF5
YmUgeW91IGNhbiBhZGQgdGhpcyBwYXRjaCB0byB5b3VyICdJbXByb3ZlbWVudHMgYW5kIGZpeGVz
IGZvciBteHNmYgpEUk0gZHJpdmVyJyBzaW5jZSBpdCBkZXBlbmRzIG9uIHRoZSBmaXJzdCBwYXRj
aCBpbiB0aGlzIHNlcmllcyBhbnl3YXk/CgpUZXN0ZWQgd2l0aCAnSW1wcm92ZW1lbnRzIGFuZCBm
aXhlcyBmb3IgbXhzZmIgRFJNIGRyaXZlcidbMF0gYW5kICdkcm06IGJyaWRnZToKQWRkIE5XTCBN
SVBJIERTSSBob3N0IGNvbnRyb2xsZXIgc3VwcG9ydCdbMV0gb24gbmV4dC0yMDE5MDcyNS4KClsw
XTogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82MjgyMi8KWzFdOiBo
dHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzY0MTg1LwoKR3VpZG8gR8O8
bnRoZXIgKDEpOgogIGRybS9teHNmYjogUmVhZCBidXMgZmxhZ3MgZnJvbSBicmlkZ2UgaWYgcHJl
c2VudAoKIGRyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9jcnRjLmMgfCA1ICsrKystCiAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

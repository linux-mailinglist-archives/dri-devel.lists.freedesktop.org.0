Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0302DA914
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 09:23:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85ADE6E195;
	Tue, 15 Dec 2020 08:23:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B5E6E17D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 08:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 97FCCFB04;
 Tue, 15 Dec 2020 09:23:40 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lrgQtBwn5rT4; Tue, 15 Dec 2020 09:23:39 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 90C2A43FDF; Tue, 15 Dec 2020 09:23:38 +0100 (CET)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] drm: mxsfb: Silence -EPROBE_DEFER while waiting for
 bridge
Date: Tue, 15 Dec 2020 09:23:37 +0100
Message-Id: <cover.1608020391.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgY2FuIHRha2UgbXVsdGlwbGUgaXRlcmF0aW9ucyB1bnRpbCBhbGwgY29tcG9uZW50cyBmb3Ig
YW4gYXR0YWNoZWQgRFNJCmJyaWRnZSBhcmUgdXAgbGVhZGluZyB0byBzZXZlcmFsOgoKWyAgICAz
Ljc5NjQyNV0gbXhzZmIgMzAzMjAwMDAubGNkLWNvbnRyb2xsZXI6IENhbm5vdCBjb25uZWN0IGJy
aWRnZTogLTUxNwpbICAgIDMuODE2OTUyXSBteHNmYiAzMDMyMDAwMC5sY2QtY29udHJvbGxlcjog
W2RybTpteHNmYl9wcm9iZSBbbXhzZmJdXSAqRVJST1IqIGZhaWxlZCB0byBhdHRhY2ggYnJpZGdl
OiAtNTE3CgpTaWxlbmNlIHRoaXMgYnkgY2hlY2tpbmcgZm9yIC1FUFJPQkVfREVGRVIgYW5kIHVz
aW5nIGRldl9lcnJfcHJvYmUoKSBzbwp3ZSBzZXQgYSBkZWZlcnJlZCByZWFzb24gaW4gY2FzZSBh
IGRlcGVuZGVuY3kgZmFpbHMgdG8gcHJvYmUgKHdoaWNoCnF1aWNrbHkgaGFwcGVucyBvbiBzbWFs
bCBjb25maWcvRFQgY2hhbmdlcyBkdWUgdG8gdGhlIHJhdGhlciBsb25nIHByb2JlCmNoYWluIHdo
aWNoIGNhbiBpbmNsdWRlIGJyaWRnZXMsIHBoeXMsIHBhbmVscywgYmFja2lnaHRzLCBsZWRzLCBl
dGMuKS4KClRoaXMgYWxzbyByZW1vdmVzIHRoZSBvbmx5IERSTV9ERVZfRVJST1IoKSB1c2FnZSwg
dGhlIHJlc3Qgb2YgdGhlIGRyaXZlcgp1c2VzIGRldl9lcnIoKS4KCkd1aWRvIEfDvG50aGVyICgx
KToKICBkcm06IG14c2ZiOiBTaWxlbmNlIC1FUFJPQkVfREVGRVIgd2hpbGUgd2FpdGluZyBmb3Ig
YnJpZGdlCgogZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2Rydi5jIHwgMTAgKysrKy0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCi0tIAoy
LjI5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

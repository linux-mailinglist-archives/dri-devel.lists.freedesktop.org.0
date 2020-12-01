Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4270F2CA165
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 12:34:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1136789C6B;
	Tue,  1 Dec 2020 11:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7637D89C6B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 11:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 680E4FB04;
 Tue,  1 Dec 2020 12:34:09 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 882LQzVv8614; Tue,  1 Dec 2020 12:34:08 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id EF1524068E; Tue,  1 Dec 2020 12:34:07 +0100 (CET)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] drm/imx/dcss: Add interconnect support
Date: Tue,  1 Dec 2020 12:34:06 +0100
Message-Id: <cover.1606822378.git.agx@sigxcpu.org>
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

VGhpcyBhbGxvd3MgdXMgdG8gcmFpc2UgRFJBTSBiYW5kaXd0aCB0byBhIGhpZ2ggZW5vdWdoIHZh
bHVlIGZvciBhCnN0YWJsZSBwaWN0dXJlIG9uIGkubXg4bXEuIFdlIHBpY2sgYSBiYW5kd2lkdGgg
dGhhdCBzaG91bGQgYmUgc3VmZmljaWVudApmb3IgNGtANjBIei4KClRoaXMgd2FzIHRlc3RlZCBv
biBhIExpYnJlbSA1IHdpdGggdGhlIChub3QgeWV0KSBtYWlubGluZSBtaGRwIERQIGNvbnRyb2xs
ZXIuCldpdGhvdXQgdGhhdCBpbml0aWFsIGJvb3Qgd29ya3MgZmluZSBidXQgZS5nLiBmYiB1bmJs
YW5rIHJlc3VsdHMgaW4gYSBjeWFuCnNjcmVlbi4KCk1vZGVsbGVkIGxpa2UgbWRwNV9rbXMuCgpH
dWlkbyBHw7xudGhlciAoMSk6CiAgZHJtL2lteC9kY3NzOiBBZGQgaW50ZXJjb25uZWN0IHN1cHBv
cnQKCiBkcml2ZXJzL2dwdS9kcm0vaW14L2Rjc3MvZGNzcy1kZXYuYyB8IDQ3ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tCiBkcml2ZXJzL2dwdS9kcm0vaW14L2Rjc3MvZGNzcy1kZXYuaCB8
ICAzICsrCiAyIGZpbGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgotLSAKMi4yOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK

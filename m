Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FBD1D3319
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 16:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DF06EB53;
	Thu, 14 May 2020 14:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274896EB52
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 14:36:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: rcn)
 with ESMTPSA id 5D1B42A2EE1
From: =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: Laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 1/4] ARM: dts: dove: Make the DT compliant with the ti,
 tfp410 binding
Date: Thu, 14 May 2020 16:36:09 +0200
Message-Id: <20200514143612.2094-2-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200514143612.2094-1-ricardo.canuelo@collabora.com>
References: <20200514143612.2094-1-ricardo.canuelo@collabora.com>
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
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, tomi.valkeinen@ti.com,
 kernel@collabora.com, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGVmaW5lIGEgJ3BvcnRzJyBub2RlIGZvciAnZHZpOiB2aWRlb0AzOScgYW5kIHVzZSB0aGUgcHJv
cGVyIG5hbWluZyBmb3IKdGhlIHBvd2VyZG93bi1ncGlvcyBwcm9wZXJ0eSB0byBtYWtlIGl0IGNv
bXBsaWFudCB3aXRoIHRoZSB0aSx0ZnA0MTAKYmluZGluZy4KClRoaXMgZmlsbHMgdGhlIG1pbmlt
dW0gcmVxdWlyZW1lbnRzIHRvIG1lZXQgdGhlIGJpbmRpbmcgcmVxdWlyZW1lbnRzLApwb3J0IGVu
ZHBvaW50cyBhcmUgbm90IGRlZmluZWQuCgpTaWduZWQtb2ZmLWJ5OiBSaWNhcmRvIENhw7F1ZWxv
IDxyaWNhcmRvLmNhbnVlbG9AY29sbGFib3JhLmNvbT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9k
b3ZlLXNiYy1hNTEwLmR0cyB8IDEzICsrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9k
dHMvZG92ZS1zYmMtYTUxMC5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9kb3ZlLXNiYy1hNTEwLmR0
cwppbmRleCAyYmI4NWE5Yjc2MTQuLjMyODA0Yzk4MTYyNSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0v
Ym9vdC9kdHMvZG92ZS1zYmMtYTUxMC5kdHMKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvZG92ZS1z
YmMtYTUxMC5kdHMKQEAgLTEzMiw3ICsxMzIsMTggQEAKIAlkdmk6IHZpZGVvQDM5IHsKIAkJY29t
cGF0aWJsZSA9ICJ0aSx0ZnA0MTAiOwogCQlyZWcgPSA8MHgzOT47Ci0JCXBvd2VyZG93bi1ncGlv
ID0gPCZncGlvX2V4dCAzIEdQSU9fQUNUSVZFX0xPVz47CisJCXBvd2VyZG93bi1ncGlvcyA9IDwm
Z3Bpb19leHQgMyBHUElPX0FDVElWRV9MT1c+OworCisJCXBvcnRzIHsKKwkJCSNhZGRyZXNzLWNl
bGxzID0gPDE+OworCQkJI3NpemUtY2VsbHMgPSA8MD47CisJCQlwb3J0QDAgeworCQkJCXJlZyA9
IDwwPjsKKwkJCX07CisJCQlwb3J0QDEgeworCQkJCXJlZyA9IDwxPjsKKwkJCX07CisJCX07CiAJ
fTsKIH07CiAKLS0gCjIuMTguMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==

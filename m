Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 114BD2DF51B
	for <lists+dri-devel@lfdr.de>; Sun, 20 Dec 2020 12:10:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46966E147;
	Sun, 20 Dec 2020 11:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 561 seconds by postgrey-1.36 at gabe;
 Fri, 18 Dec 2020 14:21:36 UTC
Received: from 1.mo4.mail-out.ovh.net (1.mo4.mail-out.ovh.net [178.33.248.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B416E03F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 14:21:36 +0000 (UTC)
Received: from player716.ha.ovh.net (unknown [10.108.54.94])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 6B9AF25A783
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 15:12:12 +0100 (CET)
Received: from armadeus.com (lfbn-str-1-215-46.w86-243.abo.wanadoo.fr
 [86.243.176.46])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player716.ha.ovh.net (Postfix) with ESMTPSA id 7F1E0194037F5;
 Fri, 18 Dec 2020 14:11:56 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001a0f67aaf-926a-48dd-a587-2bb9401b4345,
 F4E34FAEFBBC2F77A8F65A75F5C3271EDA163614)
 smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp: 86.243.176.46
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] dt-bindings: mxsfb: add compatible for i.MX6UL/i.MX6ULL
Date: Fri, 18 Dec 2020 15:10:35 +0100
Message-Id: <20201218141035.28038-3-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201218141035.28038-1-sebastien.szymanski@armadeus.com>
References: <20201218141035.28038-1-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 13311514602123383877
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudeliedgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhephfefhfejjeffgfeiteejhfetvdeftdekudeltedvveelleeileffgedufeefvddvnecukfhppedtrddtrddtrddtpdekiedrvdegfedrudejiedrgeeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeduiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-Mailman-Approved-At: Sun, 20 Dec 2020 11:10:15 +0000
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
Cc: Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aS5NWDZVTC9pLk1YNlVMTCBoYXZlIGVMQ0RJRiBjb250cm9sbGVyLCB0b28uCgpTaWduZWQtb2Zm
LWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5j
b20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbXhzZmIu
dHh0IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9teHNmYi50eHQgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9teHNmYi50eHQKaW5kZXggYzk4
NTg3MWM0NmIzLi42YzFjNGFkMDRiODkgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L214c2ZiLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9teHNmYi50eHQKQEAgLTUsNiArNSw3IEBAIE5ldyBiaW5k
aW5nczoKIFJlcXVpcmVkIHByb3BlcnRpZXM6CiAtIGNvbXBhdGlibGU6CVNob3VsZCBiZSAiZnNs
LGlteDIzLWxjZGlmIiBmb3IgaS5NWDIzLgogCQlTaG91bGQgYmUgImZzbCxpbXgyOC1sY2RpZiIg
Zm9yIGkuTVgyOC4KKwkJU2hvdWxkIGJlICJmc2wsaW14NnVsLWxjZGlmIiBmb3IgaS5NWDZVTC9p
Lk1YNlVMTC4KIAkJU2hvdWxkIGJlICJmc2wsaW14NnN4LWxjZGlmIiBmb3IgaS5NWDZTWC4KIAkJ
U2hvdWxkIGJlICJmc2wsaW14OG1xLWxjZGlmIiBmb3IgaS5NWDhNUS4KIC0gcmVnOgkJQWRkcmVz
cyBhbmQgbGVuZ3RoIG9mIHRoZSByZWdpc3RlciBzZXQgZm9yIExDRElGCi0tIAoyLjI2LjIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

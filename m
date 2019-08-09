Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4993D87FC8
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 18:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E87C89CE2;
	Fri,  9 Aug 2019 16:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76BA589309
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 16:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 8677FFB06;
 Fri,  9 Aug 2019 18:24:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zhSWzhnDUXoG; Fri,  9 Aug 2019 18:24:24 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id B0B2540B40; Fri,  9 Aug 2019 18:24:23 +0200 (CEST)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Robert Chiras <robert.chiras@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 1/3] arm64: imx8mq: add imx8mq iomux-gpr field defines
Date: Fri,  9 Aug 2019 18:24:21 +0200
Message-Id: <e0562d8bb4098dc4cdb4023b41fb75b312be22a5.1565367567.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1565367567.git.agx@sigxcpu.org>
References: <cover.1565367567.git.agx@sigxcpu.org>
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

VGhpcyBhZGRzIGFsbCB0aGUgZ3ByIHJlZ2lzdGVycyBhbmQgdGhlIGRlZmluZSBuZWVkZWQgZm9y
IHNlbGVjdGluZwp0aGUgaW5wdXQgc291cmNlIGluIHRoZSBpbXgtbndsIGRybSBicmlkZ2UuCgpT
aWduZWQtb2ZmLWJ5OiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3JnPgotLS0KIGluY2x1
ZGUvbGludXgvbWZkL3N5c2Nvbi9pbXg4bXEtaW9tdXhjLWdwci5oIHwgNjIgKysrKysrKysrKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAx
MDA2NDQgaW5jbHVkZS9saW51eC9tZmQvc3lzY29uL2lteDhtcS1pb211eGMtZ3ByLmgKCmRpZmYg
LS1naXQgYS9pbmNsdWRlL2xpbnV4L21mZC9zeXNjb24vaW14OG1xLWlvbXV4Yy1ncHIuaCBiL2lu
Y2x1ZGUvbGludXgvbWZkL3N5c2Nvbi9pbXg4bXEtaW9tdXhjLWdwci5oCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uNjJlODVmZmFjZmFkCi0tLSAvZGV2L251bGwKKysr
IGIvaW5jbHVkZS9saW51eC9tZmQvc3lzY29uL2lteDhtcS1pb211eGMtZ3ByLmgKQEAgLTAsMCAr
MSw2MiBAQAorLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSAqLworLyoK
KyAqIENvcHlyaWdodCAoQykgMjAxNyBOWFAKKyAqICAgICAgICAgICAgICAgMjAxOSBQdXJpc20g
U1BDCisgKi8KKworI2lmbmRlZiBfX0xJTlVYX0lNWDhNUV9JT01VWENfR1BSX0gKKyNkZWZpbmUg
X19MSU5VWF9JTVg4TVFfSU9NVVhDX0dQUl9ICisKKyNkZWZpbmUgSU9NVVhDX0dQUjAJMHgwMAor
I2RlZmluZSBJT01VWENfR1BSMQkweDA0CisjZGVmaW5lIElPTVVYQ19HUFIyCTB4MDgKKyNkZWZp
bmUgSU9NVVhDX0dQUjMJMHgwYworI2RlZmluZSBJT01VWENfR1BSNAkweDEwCisjZGVmaW5lIElP
TVVYQ19HUFI1CTB4MTQKKyNkZWZpbmUgSU9NVVhDX0dQUjYJMHgxOAorI2RlZmluZSBJT01VWENf
R1BSNwkweDFjCisjZGVmaW5lIElPTVVYQ19HUFI4CTB4MjAKKyNkZWZpbmUgSU9NVVhDX0dQUjkJ
MHgyNAorI2RlZmluZSBJT01VWENfR1BSMTAJMHgyOAorI2RlZmluZSBJT01VWENfR1BSMTEJMHgy
YworI2RlZmluZSBJT01VWENfR1BSMTIJMHgzMAorI2RlZmluZSBJT01VWENfR1BSMTMJMHgzNAor
I2RlZmluZSBJT01VWENfR1BSMTQJMHgzOAorI2RlZmluZSBJT01VWENfR1BSMTUJMHgzYworI2Rl
ZmluZSBJT01VWENfR1BSMTYJMHg0MAorI2RlZmluZSBJT01VWENfR1BSMTcJMHg0NAorI2RlZmlu
ZSBJT01VWENfR1BSMTgJMHg0OAorI2RlZmluZSBJT01VWENfR1BSMTkJMHg0YworI2RlZmluZSBJ
T01VWENfR1BSMjAJMHg1MAorI2RlZmluZSBJT01VWENfR1BSMjEJMHg1NAorI2RlZmluZSBJT01V
WENfR1BSMjIJMHg1OAorI2RlZmluZSBJT01VWENfR1BSMjMJMHg1YworI2RlZmluZSBJT01VWENf
R1BSMjQJMHg2MAorI2RlZmluZSBJT01VWENfR1BSMjUJMHg2NAorI2RlZmluZSBJT01VWENfR1BS
MjYJMHg2OAorI2RlZmluZSBJT01VWENfR1BSMjcJMHg2YworI2RlZmluZSBJT01VWENfR1BSMjgJ
MHg3MAorI2RlZmluZSBJT01VWENfR1BSMjkJMHg3NAorI2RlZmluZSBJT01VWENfR1BSMzAJMHg3
OAorI2RlZmluZSBJT01VWENfR1BSMzEJMHg3YworI2RlZmluZSBJT01VWENfR1BSMzIJMHg4MAor
I2RlZmluZSBJT01VWENfR1BSMzMJMHg4NAorI2RlZmluZSBJT01VWENfR1BSMzQJMHg4OAorI2Rl
ZmluZSBJT01VWENfR1BSMzUJMHg4YworI2RlZmluZSBJT01VWENfR1BSMzYJMHg5MAorI2RlZmlu
ZSBJT01VWENfR1BSMzcJMHg5NAorI2RlZmluZSBJT01VWENfR1BSMzgJMHg5OAorI2RlZmluZSBJ
T01VWENfR1BSMzkJMHg5YworI2RlZmluZSBJT01VWENfR1BSNDAJMHhhMAorI2RlZmluZSBJT01V
WENfR1BSNDEJMHhhNAorI2RlZmluZSBJT01VWENfR1BSNDIJMHhhOAorI2RlZmluZSBJT01VWENf
R1BSNDMJMHhhYworI2RlZmluZSBJT01VWENfR1BSNDQJMHhiMAorI2RlZmluZSBJT01VWENfR1BS
NDUJMHhiNAorI2RlZmluZSBJT01VWENfR1BSNDYJMHhiOAorI2RlZmluZSBJT01VWENfR1BSNDcJ
MHhiYworCisvKiBpLk1YOE1xIGlvbXV4IGdwciByZWdpc3RlciBmaWVsZCBkZWZpbmVzICovCisj
ZGVmaW5lIElNWDhNUV9HUFIxM19NSVBJX01VWF9TRUwJCUJJVCgyKQorCisjZW5kaWYgLyogX19M
SU5VWF9JTVg4TVFfSU9NVVhDX0dQUl9IICovCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

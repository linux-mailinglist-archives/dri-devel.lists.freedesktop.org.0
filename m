Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FD417410
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 10:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F4989819;
	Wed,  8 May 2019 08:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2103 seconds by postgrey-1.36 at gabe;
 Tue, 07 May 2019 16:02:48 UTC
Received: from 5.mo69.mail-out.ovh.net (5.mo69.mail-out.ovh.net
 [46.105.43.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5536F89F31
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 16:02:48 +0000 (UTC)
Received: from player697.ha.ovh.net (unknown [10.109.160.46])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id E18154BDD8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 17:27:42 +0200 (CEST)
Received: from armadeus.com (lfbn-1-7591-179.w90-126.abo.wanadoo.fr
 [90.126.248.179])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 261115875B80;
 Tue,  7 May 2019 15:27:23 +0000 (UTC)
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH RE-RESEND 2/2] ARM: dts: opos6uldev: use OF graph to describe
 the display
Date: Tue,  7 May 2019 17:27:13 +0200
Message-Id: <20190507152713.27494-2-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190507152713.27494-1-sebastien.szymanski@armadeus.com>
References: <20190507152713.27494-1-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 11812378874205393943
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrkedtgdelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-Mailman-Approved-At: Wed, 08 May 2019 08:41:38 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 stable@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VG8gbWFrZSB1c2Ugb2YgdGhlIG5ldyBlTENESUYgRFJNIGRyaXZlciBPRiBncmFwaCBkZXNjcmlw
dGlvbiBpcwpyZXF1aXJlZC4gRGVzY3JpYmUgdGhlIGRpc3BsYXkgdXNpbmcgT0YgZ3JhcGggbm9k
ZXMuCgpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAjIHY0LjE5ClNpZ25lZC1vZmYtYnk6IFPD
qWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KLS0t
CiBhcmNoL2FybS9ib290L2R0cy9pbXg2dWwtb3BvczZ1bGRldi5kdHMgfCAzNyArKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMjEgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnVsLW9wb3M2dWxk
ZXYuZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnVsLW9wb3M2dWxkZXYuZHRzCmluZGV4IDBl
NTllZTU3ZmQ1NS4uOGVjZGI5YWQyYjJlIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9p
bXg2dWwtb3BvczZ1bGRldi5kdHMKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14NnVsLW9wb3M2
dWxkZXYuZHRzCkBAIC01Niw3ICs1Niw3IEBACiAJCXN0ZG91dC1wYXRoID0gJnVhcnQxOwogCX07
CiAKLQliYWNrbGlnaHQgeworCWJhY2tsaWdodDogYmFja2xpZ2h0IHsKIAkJY29tcGF0aWJsZSA9
ICJwd20tYmFja2xpZ2h0IjsKIAkJcHdtcyA9IDwmcHdtMyAwIDE5MTAwMD47CiAJCWJyaWdodG5l
c3MtbGV2ZWxzID0gPDAgNCA4IDE2IDMyIDY0IDEyOCAyNTU+OwpAQCAtOTcsNiArOTcsMTggQEAK
IAkJZ3Bpb3MgPSA8JmdwaW81IDEgR1BJT19BQ1RJVkVfSElHSD47CiAJfTsKIAorCXBhbmVsOiBw
YW5lbCB7CisJCWNvbXBhdGlibGUgPSAiYXJtYWRldXMsc3QwNzAwLWFkYXB0IjsKKwkJcG93ZXIt
c3VwcGx5ID0gPCZyZWdfM3YzPjsKKwkJYmFja2xpZ2h0ID0gPCZiYWNrbGlnaHQ+OworCisJCXBv
cnQgeworCQkJcGFuZWxfaW46IGVuZHBvaW50IHsKKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8Jmxj
ZGlmX291dD47CisJCQl9OworCQl9OworCX07CisKIAlyZWdfNXY6IHJlZ3VsYXRvci01diB7CiAJ
CWNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsKIAkJcmVndWxhdG9yLW5hbWUgPSAiNVYi
OwpAQCAtMTgyLDI4ICsxOTQsMTEgQEAKICZsY2RpZiB7CiAJcGluY3RybC1uYW1lcyA9ICJkZWZh
dWx0IjsKIAlwaW5jdHJsLTAgPSA8JnBpbmN0cmxfbGNkaWY+OwotCWRpc3BsYXkgPSA8JmRpc3Bs
YXkwPjsKLQlsY2Qtc3VwcGx5ID0gPCZyZWdfM3YzPjsKIAlzdGF0dXMgPSAib2theSI7CiAKLQlk
aXNwbGF5MDogZGlzcGxheTAgewotCQliaXRzLXBlci1waXhlbCA9IDwzMj47Ci0JCWJ1cy13aWR0
aCA9IDwxOD47Ci0KLQkJZGlzcGxheS10aW1pbmdzIHsKLQkJCXRpbWluZzA6IHRpbWluZzAgewot
CQkJCWNsb2NrLWZyZXF1ZW5jeSA9IDwzMzAwMDAzMz47Ci0JCQkJaGFjdGl2ZSA9IDw4MDA+Owot
CQkJCXZhY3RpdmUgPSA8NDgwPjsKLQkJCQloYmFjay1wb3JjaCA9IDw5Nj47Ci0JCQkJaGZyb250
LXBvcmNoID0gPDk2PjsKLQkJCQl2YmFjay1wb3JjaCA9IDwyMD47Ci0JCQkJdmZyb250LXBvcmNo
ID0gPDIxPjsKLQkJCQloc3luYy1sZW4gPSA8NjQ+OwotCQkJCXZzeW5jLWxlbiA9IDw0PjsKLQkJ
CQlkZS1hY3RpdmUgPSA8MT47Ci0JCQkJcGl4ZWxjbGstYWN0aXZlID0gPDA+OwotCQkJfTsKKwlw
b3J0IHsKKwkJbGNkaWZfb3V0OiBlbmRwb2ludCB7CisJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JnBh
bmVsX2luPjsKIAkJfTsKIAl9OwogfTsKLS0gCjIuMTkuMgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

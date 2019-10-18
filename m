Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2BBDDB9D
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 02:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E054589CC4;
	Sun, 20 Oct 2019 00:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9C26EBC6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 18:46:51 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6F3CFF60="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.28.1 DYNA|AUTH)
 with ESMTPSA id R0b2a8v9IIkXDLG
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Fri, 18 Oct 2019 20:46:33 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>
Subject: [PATCH 5/7] ARM: DTS: omap36xx: add sgx gpu child node
Date: Fri, 18 Oct 2019 20:46:28 +0200
Message-Id: <e0021cc2a92ff07c31dc663150965416ad143e0f.1571424390.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1571424390.git.hns@goldelico.com>
References: <cover.1571424390.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 20 Oct 2019 00:06:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1571424410; 
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=WRu/4Luy3zB9n/uNoqHwWsEwvyXUJ69VeOCpFcp5KEM=;
 b=lTayQx7yxX04WFBXmCTBEibAh9JTsZeYvVRNW9MzxOxQnUTjKZywmQ8zxjW+b3z1jj
 1FsH5WFw0rfSg1/wmLaoMpyxxEqpTe3V6I/RYJMeBWh2iPuIVP8o14P4EjflkAzmK8jS
 LTQSH5WxqxdEsp7CxdTTH5xaedDnu1Mmb930LRNl15SlFEKI8ypH2ClkAlp1W6vtbae/
 OSibC8fb1Y4HUZJF3QSfI6mqa/17X7Tzv7f2z/XrU6YxY3pgd5tOviO1FG0IPXe5GX4o
 SJ2peggpK9WAHAG6s7L9NGAZwifsgoGtIt8envgLsL2Ix+5gnSyIqZnau2N5TXhaHsIK
 S1Mw==
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
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
 "H. Nikolaus Schaller" <hns@goldelico.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YW5kIGFkZCB0aW1lciBhbmQgaW50ZXJydXB0LgoKVGVzdGVkIG9uIEdUQTA0IGFuZCBCZWFnbGVC
b2FyZCBYTS4KClNpZ25lZC1vZmYtYnk6IEguIE5pa29sYXVzIFNjaGFsbGVyIDxobnNAZ29sZGVs
aWNvLmNvbT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9vbWFwMzZ4eC5kdHNpIHwgMTMgKysrKysr
KystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9vbWFwMzZ4eC5kdHNpIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvb21hcDM2eHguZHRzaQppbmRleCAxZTU1MmYwOGYxMjAuLjRkODEzY2NlODY3NiAx
MDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvb21hcDM2eHguZHRzaQorKysgYi9hcmNoL2Fy
bS9ib290L2R0cy9vbWFwMzZ4eC5kdHNpCkBAIC0xNDUsNyArMTQ1LDcgQEAKIAkJICogInRpLHN5
c2Mtb21hcDQiIHR5cGUgcmVnaXN0ZXIgd2l0aCBqdXN0IHNpZGxlIGFuZCBtaWRsZSBiaXRzCiAJ
CSAqIGF2YWlsYWJsZSB3aGlsZSBvbWFwMzR4eCBoYXMgInRpLHN5c2Mtb21hcDIiIHR5cGUgc3lz
Y29uZmlnLgogCQkgKi8KLQkJc2d4X21vZHVsZTogdGFyZ2V0LW1vZHVsZUA1MDAwMDAwMCB7CisJ
CXRhcmdldC1tb2R1bGVANTAwMDAwMDAgewogCQkJY29tcGF0aWJsZSA9ICJ0aSxzeXNjLW9tYXA0
IiwgInRpLHN5c2MiOwogCQkJcmVnID0gPDB4NTAwMGZlMDAgMHg0PiwKIAkJCSAgICAgIDwweDUw
MDBmZTEwIDB4ND47CkBAIC0xNjIsMTAgKzE2MiwxMyBAQAogCQkJI3NpemUtY2VsbHMgPSA8MT47
CiAJCQlyYW5nZXMgPSA8MCAweDUwMDAwMDAwIDB4MjAwMDAwMD47CiAKLQkJCS8qCi0JCQkgKiBD
bG9zZWQgc291cmNlIFBvd2VyVlIgZHJpdmVyLCBubyBjaGlsZCBkZXZpY2UKLQkJCSAqIGJpbmRp
bmcgb3IgZHJpdmVyIGluIG1haW5saW5lCi0JCQkgKi8KKwkJCXNneDogc2d4QDAgeworCQkJCWNv
bXBhdGlibGUgPSAiaW1nLHNneDUzMC0xMjUiLCAiaW1nLHNneDUzMCIsICJ0aSxvbWFwLW9tYXAz
LXNneDUzMC0xMjUiOworCQkJCXJlZyA9IDwweDAgMHgxMDAwMD47CS8qIDY0a0IgKi8KKwkJCQly
ZWctbmFtZXMgPSAic2d4IjsKKwkJCQlpbnRlcnJ1cHRzID0gPDIxPjsKKwkJCQl0aW1lciA9IDwm
dGltZXIxMT47CisJCQl9OwogCQl9OwogCX07CiAKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

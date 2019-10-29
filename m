Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17909E97E4
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 09:15:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D456ECCB;
	Wed, 30 Oct 2019 08:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C298F6E5B6
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 18:54:26 +0000 (UTC)
Received: from p200300ccff099e001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff09:9e00:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1iPWdE-0002QE-1J; Tue, 29 Oct 2019 19:54:16 +0100
Received: from andi by aktux with local (Exim 4.92)
 (envelope-from <andreas@kemnade.info>)
 id 1iPWdD-00087K-Av; Tue, 29 Oct 2019 19:54:15 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Dan Murphy <dmurphy@ti.com>, Mark Rutland <mark.rutland@arm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH next] dt-bindings: backlight: lm3630a: fix missing include
Date: Tue, 29 Oct 2019 19:53:50 +0100
Message-Id: <20191029185350.31155-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Wed, 30 Oct 2019 08:14:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8qXMF18KwuhIBxEjpbV0BD087kurmWidJw1E63DDswk=; b=VtVRBnxfNioWWOt88m63wzIauE
 wUwHgTC95bTRT0EvggGuNe3GbeFk42DGXsHKJVids6OlzG3XfQ86F9MqhKSSkElZ2QaY17Y1Q7fsl
 9DgX/OeFJ0dSNStPsZnMeRXjlyV5k5CPQRYjB/Tj+8828xC4+YGQEL+y8pBXif3CAqGw=;
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
Cc: Andreas Kemnade <andreas@kemnade.info>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZXhhbXBsZSBmYWlsZWQgdG8gY29tcGlsZSBkdWUgdG8gdW5kZWZpbmVkIEdQSU9fQUNUSVZFX0hJ
R0gKZml4IHRoYXQgYnkgYWRkaW5nIHRoZSBuZWVkZWQgI2luY2x1ZGUgdG8gdGhlIGV4YW1tcGxl
CgpGaXhlczogYWU5MjM2NWNkZDc1ICgiZHQtYmluZGluZ3M6IGJhY2tsaWdodDogbG0zNjMwYTog
QWRkIGVuYWJsZS1ncGlvcyB0byBkZXNjcmliZSBIV0VOIHBpbiIpClNpZ25lZC1vZmYtYnk6IEFu
ZHJlYXMgS2VtbmFkZSA8YW5kcmVhc0BrZW1uYWRlLmluZm8+Ci0tLQogLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbG0zNjMwYS1iYWNrbGlnaHQueWFtbCAgICB8IDEgKwog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xtMzYzMGEtYmFja2xpZ2h0Lnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbG0z
NjMwYS1iYWNrbGlnaHQueWFtbAppbmRleCBjODQ3MDYyOGZlMDIuLjA4ZmU1Y2Y4NjE0YSAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0
L2xtMzYzMGEtYmFja2xpZ2h0LnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xtMzYzMGEtYmFja2xpZ2h0LnlhbWwKQEAgLTkzLDYgKzkz
LDcgQEAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCiAKIGV4YW1wbGVzOgogICAtIHwKKyAg
ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZ3Bpby9ncGlvLmg+CiAgICAgaTJjIHsKICAgICAgICAg
I2FkZHJlc3MtY2VsbHMgPSA8MT47CiAgICAgICAgICNzaXplLWNlbGxzID0gPDA+OwotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

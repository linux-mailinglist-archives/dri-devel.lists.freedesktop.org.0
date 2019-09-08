Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AFAAD3BF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 09:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F87B89872;
	Mon,  9 Sep 2019 07:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCC489789
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2019 21:17:41 +0000 (UTC)
Received: from p200300ccff4729001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff47:2900:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1i73vn-0000wL-Aw; Sun, 08 Sep 2019 22:37:07 +0200
Received: from andi by aktux with local (Exim 4.92)
 (envelope-from <andreas@kemnade.info>)
 id 1i73vm-0007rN-W2; Sun, 08 Sep 2019 22:37:07 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
 robh+dt@kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 0/2] backlight_lm3630a: add enable_gpios property
Date: Sun,  8 Sep 2019 22:37:02 +0200
Message-Id: <20190908203704.30147-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Mon, 09 Sep 2019 07:23:02 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WLNvj34w1pMydEMVCJGWGNCq90dYkz0edkv/6Infxco=; b=gWNUGaQHNjgOqY5zrZ+BPjNJ/t
 nXKXYK8g5xv+b4o4OJ7PoWuZ4TdtVR+ADL8078ghBlGq5JIn7GX3YYYNPdBCd8dnAgS+fOnizKSk0
 HOxJnNH3asiCrxW4OycyeZrRHWupr6FrA8586BBGINUZMWm25lwruT06eEB7eCFMQRMY=;
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

VG8gYmUgYWJsZSB0byBoYW5kbGUgdGhlIEhXRU4gcGluIG9mIHRoZSBsbTM2MzBhLCBhZGQKYW4g
ZW5hYmxlIGdwaW8gdG8gdGhlIGRyaXZlciBhbmQgYSBwcm9wZXJ0eS4KClRlc3RlZCBvbiBLb2Jv
IENsYXJhIEhECgpBbmRyZWFzIEtlbW5hZGUgKDIpOgogIGJhY2tsaWdodDogbG0zNjMwYTogYWRk
IGFuIGVuYWJsZSBncGlvIGZvciB0aGUgSFdFTiBwaW4KICBkdC1iaW5kaW5nczogYmFja2xpZ2h0
OiBsbTM2MzBhOiBhZGQgZW5hYmxlX2dwaW9zCgogLi4uL2xlZHMvYmFja2xpZ2h0L2xtMzYzMGEt
YmFja2xpZ2h0LnlhbWwgICAgICB8ICA0ICsrKysKIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xt
MzYzMGFfYmwuYyAgICAgICAgICAgfCAxOCArKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hh
bmdlZCwgMjIgaW5zZXJ0aW9ucygrKQoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

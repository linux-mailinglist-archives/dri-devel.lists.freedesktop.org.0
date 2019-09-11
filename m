Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C423B0936
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 09:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F526EBB4;
	Thu, 12 Sep 2019 07:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDCE6E0E8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 17:21:26 +0000 (UTC)
Received: from p200300ccff0b59001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff0b:5900:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1i86It-0006kA-J3; Wed, 11 Sep 2019 19:21:15 +0200
Received: from andi by aktux with local (Exim 4.92)
 (envelope-from <andreas@kemnade.info>)
 id 1i86It-0003Lz-0Q; Wed, 11 Sep 2019 19:21:15 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
 robh+dt@kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v3 0/2] backlight_lm3630a: add enable_gpios property
Date: Wed, 11 Sep 2019 19:21:04 +0200
Message-Id: <20190911172106.12843-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Thu, 12 Sep 2019 07:07:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LQxw/u540K2TPFsuUGW/nsJsLYCtpA6SW4wjQ2RiCn4=; b=Enw8fEVpNTlLP3CEbfW/3P9zv7
 q6ZAWTnc0G0NtMPIWDXHVUSl5TYA2UAZbpLvdUBpVN2QBgr22U+sVuFtpzUJRScehYULw5zunqHgW
 FvRUUiBY1bq1tpy/XM6ndBlK6ORNyaGPgXv7qV6fnFBFE0X+FT36SFVXY9LwLOUq6Dvc=;
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
IENsYXJhIEhELgoKQ2hhbmdlcyBpbiB2MjoKc2ltcGxpZmljYXRpb24gYW5kIHJlb3JkZXJpbmcK
CkNoYW5nZXMgaW4gdjM6CmFkZGVkIGFja2VkLWJ5CnJlbW92ZWQgbGVnYWN5IGluY2x1ZGUKCkFu
ZHJlYXMgS2VtbmFkZSAoMik6CiAgZHQtYmluZGluZ3M6IGJhY2tsaWdodDogbG0zNjMwYTogYWRk
IGVuYWJsZV9ncGlvcwogIGJhY2tsaWdodDogbG0zNjMwYTogYWRkIGFuIGVuYWJsZSBncGlvIGZv
ciB0aGUgSFdFTiBwaW4KCiAuLi4vYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbG0zNjMwYS1iYWNr
bGlnaHQueWFtbCAgICAgICB8IDUgKysrKysKIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xtMzYz
MGFfYmwuYyAgICAgICAgICAgICAgICAgICAgIHwgOSArKysrKysrKysKIDIgZmlsZXMgY2hhbmdl
ZCwgMTQgaW5zZXJ0aW9ucygrKQoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs

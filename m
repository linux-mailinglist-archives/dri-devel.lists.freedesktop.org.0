Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F3AB18D4
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 09:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA146EE97;
	Fri, 13 Sep 2019 07:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC106EE36
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 21:33:47 +0000 (UTC)
Received: from p200300ccff1554001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff15:5400:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1i8Wig-0006RM-H3; Thu, 12 Sep 2019 23:33:38 +0200
Received: from andi by aktux with local (Exim 4.92)
 (envelope-from <andreas@kemnade.info>)
 id 1i8Wig-0006Jl-5j; Thu, 12 Sep 2019 23:33:38 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
 robh+dt@kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v4 0/2] backlight_lm3630a: add enable_gpios property
Date: Thu, 12 Sep 2019 23:32:55 +0200
Message-Id: <20190912213257.24147-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Fri, 13 Sep 2019 07:24:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ojikyP8DDDZht6MCI3yymMMHVNO3MHdZIWJlDeI920E=; b=TaJ+XvsFaOcfMv6INNBtKM3s+z
 VtG/EVb9hsoJUJU5JGEi7DYPxbI10za9P1tUM3uYuGeTcZeGTEj0HPuF/XpnHo43hOXXqACN4ZxAF
 ZCW5bdbAs3GAB0BD8Ya62vGi/wNC9t0udMttfrheMDaWpV5hh0eYq2IX9ak9AuL2we1s=;
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
CkNoYW5nZXMgaW4gdjM6CmFkZGVkIGFja2VkLWJ5CnJlbW92ZWQgbGVnYWN5IGluY2x1ZGUKCkNo
YW5nZXMgaW4gdjQ6CmFkZGVkIHJldmlld2VkLWJ5Cm1vdmVkIGdwaW8gdG8gdGhlIHJpZ2h0IHBv
c2l0aW9uIGluIHRoZSBiaW5kaW5ncyBleGFtcGxlCgpBbmRyZWFzIEtlbW5hZGUgKDIpOgogIGR0
LWJpbmRpbmdzOiBiYWNrbGlnaHQ6IGxtMzYzMGE6IGFkZCBlbmFibGVfZ3Bpb3MKICBiYWNrbGln
aHQ6IGxtMzYzMGE6IGFkZCBhbiBlbmFibGUgZ3BpbyBmb3IgdGhlIEhXRU4gcGluCgogLi4uL2Jp
bmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xtMzYzMGEtYmFja2xpZ2h0LnlhbWwgICAgICAgfCA1ICsr
KysrCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBhX2JsLmMgICAgICAgICAgICAgICAg
ICAgICB8IDkgKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKCi0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

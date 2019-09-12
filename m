Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4E9B18D6
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 09:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D87B6EE9A;
	Fri, 13 Sep 2019 07:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0F86EE38
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 21:33:47 +0000 (UTC)
Received: from p200300ccff1554001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff15:5400:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1i8Wij-0006Rb-Vj; Thu, 12 Sep 2019 23:33:42 +0200
Received: from andi by aktux with local (Exim 4.92)
 (envelope-from <andreas@kemnade.info>)
 id 1i8Wij-0006Jo-Nb; Thu, 12 Sep 2019 23:33:41 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
 robh+dt@kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: backlight: lm3630a: add enable_gpios
Date: Thu, 12 Sep 2019 23:32:56 +0200
Message-Id: <20190912213257.24147-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190912213257.24147-1-andreas@kemnade.info>
References: <20190912213257.24147-1-andreas@kemnade.info>
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Fri, 13 Sep 2019 07:24:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RdVFr/UHTqBlHMpQmP0HURFAUMKBVs0CWKPuLAbmJAw=; b=gfk4TNjgGbO/jHyy6J1NzVpHMs
 Dxl8c4t6MoT3giG+AIBZS0fuDD/4cor+0kuyR/arUfBq/+WnOiNxGgXoyuSOmeprcwPCE6qElRYdE
 3qfu0n7IZ53J7VMjy399vZG/k5ulUbq6QA/9tWk7Jvsil1hVDqaQhVVlnc/1eu9nTZjQ=;
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

YWRkIGVuYWJsZS1ncGlvcyB0byBkZXNjcmliZSBIV0VOIHBpbgoKU2lnbmVkLW9mZi1ieTogQW5k
cmVhcyBLZW1uYWRlIDxhbmRyZWFzQGtlbW5hZGUuaW5mbz4KQWNrZWQtYnk6IERhbmllbCBUaG9t
cHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Ci0tLQpjaGFuZ2VzIGluIHYyOiBhZGRl
ZCBleGFtcGxlCmNoYW5nZXMgaW4gdjM6IGFkZGVkIEFja2VkLWJ5CmNoYW5nZXMgaW4gdjQ6IG1v
dmVkIGVuYWJsZS1ncGlvcyB0byB0aGUgcmlnaHQgcG9zaXRpb24KICBpbiB0aGUgZXhhbXBsZQog
Li4uL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xtMzYzMGEtYmFja2xpZ2h0LnlhbWwgICAgICAg
ICAgIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sbTM2
MzBhLWJhY2tsaWdodC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xl
ZHMvYmFja2xpZ2h0L2xtMzYzMGEtYmFja2xpZ2h0LnlhbWwKaW5kZXggZGMxMjlkOWEzMjllLi5j
ODQ3MDYyOGZlMDIgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9sZWRzL2JhY2tsaWdodC9sbTM2MzBhLWJhY2tsaWdodC55YW1sCisrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sbTM2MzBhLWJhY2tsaWdodC55
YW1sCkBAIC0yOSw2ICsyOSwxMCBAQCBwcm9wZXJ0aWVzOgogICAnI3NpemUtY2VsbHMnOgogICAg
IGNvbnN0OiAwCiAKKyAgZW5hYmxlLWdwaW9zOgorICAgIGRlc2NyaXB0aW9uOiBHUElPIHRvIHVz
ZSB0byBlbmFibGUvZGlzYWJsZSB0aGUgYmFja2xpZ2h0IChIV0VOIHBpbikuCisgICAgbWF4SXRl
bXM6IDEKKwogcmVxdWlyZWQ6CiAgIC0gY29tcGF0aWJsZQogICAtIHJlZwpAQCAtOTYsNiArMTAw
LDcgQEAgZXhhbXBsZXM6CiAgICAgICAgIGxlZC1jb250cm9sbGVyQDM4IHsKICAgICAgICAgICAg
ICAgICBjb21wYXRpYmxlID0gInRpLGxtMzYzMGEiOwogICAgICAgICAgICAgICAgIHJlZyA9IDww
eDM4PjsKKyAgICAgICAgICAgICAgICBlbmFibGUtZ3Bpb3MgPSA8JmdwaW8yIDUgR1BJT19BQ1RJ
VkVfSElHSD47CiAKICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKICAgICAg
ICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

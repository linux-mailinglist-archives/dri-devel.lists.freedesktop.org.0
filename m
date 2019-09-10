Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2477AF646
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 09:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0DF6EA1D;
	Wed, 11 Sep 2019 07:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E12C6E090
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 18:42:03 +0000 (UTC)
Received: from p200300ccff17ef007ee9d3fffe1fa246.dip0.t-ipconnect.de
 ([2003:cc:ff17:ef00:7ee9:d3ff:fe1f:a246] helo=eeepc)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1i7l5R-0005mG-Lg; Tue, 10 Sep 2019 20:41:57 +0200
Received: from andi by localhost with local (Exim 4.89)
 (envelope-from <andreas@kemnade.info>)
 id 1i7hzy-0001xi-Vb; Tue, 10 Sep 2019 17:24:07 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 hns@goldelico.com
Subject: [PATCH] backlight: lm3630a: fix module aliases
Date: Tue, 10 Sep 2019 17:23:59 +0200
Message-Id: <20190910152359.7448-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.11.0
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Wed, 11 Sep 2019 07:01:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=kemnade.info; s=20180802; h=Message-Id:Date:Subject:Cc:To:From:Sender:
 Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vJAeRMch7ip54W8wc3UhVFZN0MUREcLR4FPZHtlSeHo=; b=F3kG4VZua+8Qi8Sh/M8n8kd4/d
 HuXgSQsgcHQaCjMlbmdwDlrOfAS6im9RsPoB3CTVRStUhPnduMbdlPVzCd5MID0gsQrVi+IQqVhLk
 uoHLTnVSwToOI5xa4jOSZ3IX8OZGnkZZHOcHDwgegGUzAmd12IpXwvVvKQqJ4YyC9EBY=;
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGV2aWNldHJlZSBhbGlhc2VzIGFyZSBtaXNzaW5nLCBzbyB0aGF0IG1vZHVsZSBhdXRvbG9hZGlu
Zwpkb2VzIG5vdCB3b3JrIHByb3Blcmx5LgoKU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBLZW1uYWRl
IDxhbmRyZWFzQGtlbW5hZGUuaW5mbz4KLS0tCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2
MzBhX2JsLmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBhX2Js
LmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBhX2JsLmMKaW5kZXggM2I0NWExNzMz
MTk4Li45ZDY3YzA3ZGIyZjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xt
MzYzMGFfYmwuYworKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBhX2JsLmMKQEAg
LTYxNywxMiArNjE3LDE0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaTJjX2RldmljZV9pZCBsbTM2
MzBhX2lkW10gPSB7CiAJe30KIH07CiAKK01PRFVMRV9ERVZJQ0VfVEFCTEUoaTJjLCBsbTM2MzBh
X2lkKTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbG0zNjMwYV9tYXRjaF90
YWJsZVtdID0gewogCXsgLmNvbXBhdGlibGUgPSAidGksbG0zNjMwYSIsIH0sCiAJeyB9LAogfTsK
IAotTU9EVUxFX0RFVklDRV9UQUJMRShpMmMsIGxtMzYzMGFfaWQpOworTU9EVUxFX0RFVklDRV9U
QUJMRShvZiwgbG0zNjMwYV9tYXRjaF90YWJsZSk7CiAKIHN0YXRpYyBzdHJ1Y3QgaTJjX2RyaXZl
ciBsbTM2MzBhX2kyY19kcml2ZXIgPSB7CiAJLmRyaXZlciA9IHsKLS0gCjIuMTEuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

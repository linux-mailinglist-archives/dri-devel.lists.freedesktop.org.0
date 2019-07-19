Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A05F6DAAB
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 06:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F206E501;
	Fri, 19 Jul 2019 04:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D366E507
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 04:03:39 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4D68C218A6;
 Fri, 19 Jul 2019 04:03:38 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 025/141] drm/bridge: sii902x: pixel clock unit is
 10kHz instead of 1kHz
Date: Fri, 19 Jul 2019 00:00:50 -0400
Message-Id: <20190719040246.15945-25-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719040246.15945-1-sashal@kernel.org>
References: <20190719040246.15945-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563509019;
 bh=D9BmbBuuM+wIhLMScxfAIfeSr7v6szNVEbHQRxIphdM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wLMOQQa5LHfWGUWfWXuR64PfiDwhN1KX0A3X4j47w2H/Hw6KR7pKUf7gXhhyXpOJk
 4fUW12ysHi+qHLSasz6waly2Ca8B6YHDWUfOVlt63Syjz3irPXTm9V8pEmWlaXAhpW
 Lbh3zOBhAs0n6JFggAbp/byBtzMvmLqC31UA3IH4=
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSnlyaSBTYXJoYSA8anNhcmhhQHRpLmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IDhkYmZj
NWI2NTAyM2I2NzM5N2FjYTI4ZThhZGIyNWM4MTlmNjM5OGMgXQoKVGhlIHBpeGVsIGNsb2NrIHVu
aXQgaW4gdGhlIGZpcnN0IHR3byByZWdpc3RlcnMgKDB4MDAgYW5kIDB4MDEpIG9mCnNpaTkwMjIg
aXMgMTBrSHosIG5vdCAxa0h6IGFzIGluIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlLiBEaXZpc2lv
biBieQoxMCBmaXhlcyB0aGUgaXNzdWUuCgpTaWduZWQtb2ZmLWJ5OiBKeXJpIFNhcmhhIDxqc2Fy
aGFAdGkuY29tPgpSZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNv
bT4KUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNv
bmJvYXJkLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5n
LmNvbT4KTGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lk
LzFhMmE4ZWFlMGI5ZDYzMzNlN2E1ODQxMDI2YmY3ZmQ2NWM5Y2NkMDkuMTU1ODk2NDI0MS5naXQu
anNhcmhhQHRpLmNvbQpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5v
cmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMgfCA1ICsrKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9zaWk5MDJ4LmMKaW5kZXggMDhlMTJmZWYxMzQ5Li41ZjQwZTM4ZDE0MDcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2Uvc2lpOTAyeC5jCkBAIC0yMzksMTAgKzIzOSwxMSBAQCBzdGF0aWMgdm9pZCBzaWk5MDJ4
X2JyaWRnZV9tb2RlX3NldChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAogCXN0cnVjdCByZWdt
YXAgKnJlZ21hcCA9IHNpaTkwMngtPnJlZ21hcDsKIAl1OCBidWZbSERNSV9JTkZPRlJBTUVfU0la
RShBVkkpXTsKIAlzdHJ1Y3QgaGRtaV9hdmlfaW5mb2ZyYW1lIGZyYW1lOworCXUxNiBwaXhlbF9j
bG9ja18xMGtIeiA9IGFkai0+Y2xvY2sgLyAxMDsKIAlpbnQgcmV0OwogCi0JYnVmWzBdID0gYWRq
LT5jbG9jazsKLQlidWZbMV0gPSBhZGotPmNsb2NrID4+IDg7CisJYnVmWzBdID0gcGl4ZWxfY2xv
Y2tfMTBrSHogJiAweGZmOworCWJ1ZlsxXSA9IHBpeGVsX2Nsb2NrXzEwa0h6ID4+IDg7CiAJYnVm
WzJdID0gYWRqLT52cmVmcmVzaDsKIAlidWZbM10gPSAweDAwOwogCWJ1Zls0XSA9IGFkai0+aGRp
c3BsYXk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==

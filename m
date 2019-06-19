Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECD44B2A2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40296E2B4;
	Wed, 19 Jun 2019 07:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E066E280;
 Wed, 19 Jun 2019 02:32:14 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 4B7F03EA09;
 Wed, 19 Jun 2019 02:32:13 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: bjorn.andersson@linaro.org, agross@kernel.org, david.brown@linaro.org,
 robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org
Subject: [PATCH v2 2/6] dt-bindings: display: msm: gmu: add optional ocmem
 property
Date: Tue, 18 Jun 2019 22:32:05 -0400
Message-Id: <20190619023209.10036-3-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190619023209.10036-1-masneyb@onstation.org>
References: <20190619023209.10036-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1560911533;
 bh=vjdYkOGb7QqwyS3qQ2Y0nfwXzLWO7f7pViDR8epWJjI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i2nf+3slNAwb24oyGu+ALO1v0e43fLyWhBTFI1M5B9UlAOdujTO3fWHbOBKL7+q/d
 WMUEcmg9wuALtvYv4ZeMTrdRsWvuYOAHGDilVYi9hksMRHLAb11SpTNa22pzeV6Q6S
 MV8Orni6KF/pW1v2XJkNFmGhL9qjVjPgZt4hPLvw=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jonathan@marek.ca,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZSBBM3h4IGFuZCBBNHh4IEFkcmVubyBHUFVzIGRvIG5vdCBoYXZlIEdNRU0gaW5zaWRlIHRo
ZSBHUFUgY29yZSBhbmQKbXVzdCB1c2UgdGhlIE9uIENoaXAgTUVNb3J5IChPQ01FTSkgaW4gb3Jk
ZXIgdG8gYmUgZnVuY3Rpb25hbC4gQWRkIHRoZQpvcHRpb25hbCBvY21lbSBwcm9wZXJ0eSB0byB0
aGUgQWRyZW5vIEdyYXBoaWNzIE1hbmFnZW1lbnQgVW5pdCBiaW5kaW5ncy4KClNpZ25lZC1vZmYt
Ynk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgotLS0KQ2hhbmdlcyBzaW5j
ZSB2MToKLSBOb25lCgogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
bXNtL2dtdS50eHQgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20v
Z211LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9n
bXUudHh0CmluZGV4IDkwYWY1YjBhNTZhOS4uYzc0NmI5NWU5NWQ0IDEwMDY0NAotLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZ211LnR4dAorKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZ211LnR4dApAQCAt
MzEsNiArMzEsMTAgQEAgUmVxdWlyZWQgcHJvcGVydGllczoKIC0gaW9tbXVzOiBwaGFuZGxlIHRv
IHRoZSBhZHJlbm8gaW9tbXUKIC0gb3BlcmF0aW5nLXBvaW50cy12MjogcGhhbmRsZSB0byB0aGUg
T1BQIG9wZXJhdGluZyBwb2ludHMKIAorT3B0aW9uYWwgcHJvcGVydGllczoKKy0gb2NtZW06IHBo
YW5kbGUgdG8gdGhlIE9uIENoaXAgTWVtb3J5IChPQ01FTSkgdGhhdCdzIHByZXNlbnQgb24gc29t
ZSBTbmFwZHJhZ29uCisgICAgICAgICBTb0NzLiBTZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3NvYy9xY29tL3Fjb20sb2NtZW0ueWFtbC4KKwogRXhhbXBsZToKIAogLyB7Ci0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

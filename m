Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B70A8CDC23
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 09:02:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EC86E49A;
	Mon,  7 Oct 2019 07:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A29289C88;
 Mon,  7 Oct 2019 01:45:23 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id AFB9D3F23B;
 Mon,  7 Oct 2019 01:45:22 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com,
	sean@poorly.run
Subject: [PATCH RFC v2 3/5] ARM: dts: qcom: pm8941: add 5vs2 regulator node
Date: Sun,  6 Oct 2019 21:45:07 -0400
Message-Id: <20191007014509.25180-4-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191007014509.25180-1-masneyb@onstation.org>
References: <20191007014509.25180-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Oct 2019 07:01:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1570412723;
 bh=gzdgs5zsOWrjVwg2I8HksBIuH1s4hkhufGSorWKu1mI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PhMYZfXEjQ9WbuoaMd9YNUF3WP3En77w80xXRCf1KlpMRFzmeAMpOu3G4Ya+O3hth
 h6lL+ADPRViKAuiuElORVwWcOB2vXT1c8jUvkuAHah97QsYquU4IYZg4HtvmsosAvf
 nU/AxP09NHE6SKn9kJ/veTb+RfySZjPQlFtRob2E=
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
Cc: jonathan@marek.ca, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, Laurent.pinchart@ideasonboard.com,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cG04OTQxIGlzIG1pc3NpbmcgdGhlIDV2czIgcmVndWxhdG9yIG5vZGUgc28gbGV0J3MgYWRkIGl0
IHNpbmNlIGl0cwpuZWVkZWQgdG8gZ2V0IHRoZSBleHRlcm5hbCBkaXNwbGF5IHdvcmtpbmcuIFRo
aXMgcmVndWxhdG9yIHdhcyBhbHJlYWR5CmNvbmZpZ3VyZWQgaW4gdGhlIGludGVycnVwdHMgcHJv
cGVydHkgb24gdGhlIHBhcmVudCBub2RlLgoKTm90ZSB0aGF0IHRoaXMgcmVndWxhdG9yIGlzIHJl
ZmVycmVkIHRvIGFzIG12czIgaW4gdGhlIGRvd25zdHJlYW0gTVNNCmtlcm5lbCBzb3VyY2VzLgoK
U2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+ClJldmll
d2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Ci0tLQpDaGFu
Z2VzIHNpbmNlIHYxOgotIE5vbmUKCiBhcmNoL2FybS9ib290L2R0cy9xY29tLXBtODk0MS5kdHNp
IHwgMTAgKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9xY29tLXBtODk0MS5kdHNpIGIvYXJjaC9hcm0vYm9v
dC9kdHMvcWNvbS1wbTg5NDEuZHRzaQppbmRleCBmMTk4NDgwYzhlZjQuLmMxZjIwMTJkMWM4YiAx
MDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvcWNvbS1wbTg5NDEuZHRzaQorKysgYi9hcmNo
L2FybS9ib290L2R0cy9xY29tLXBtODk0MS5kdHNpCkBAIC0xNzgsNiArMTc4LDE2IEBACiAJCQkJ
cWNvbSx2cy1zb2Z0LXN0YXJ0LXN0cmVuZ3RoID0gPDA+OwogCQkJCXJlZ3VsYXRvci1pbml0aWFs
LW1vZGUgPSA8MT47CiAJCQl9OworCisJCQlwbTg5NDFfNXZzMjogNXZzMiB7CisJCQkJcmVndWxh
dG9yLWVuYWJsZS1yYW1wLWRlbGF5ID0gPDEwMDA+OworCQkJCXJlZ3VsYXRvci1wdWxsLWRvd247
CisJCQkJcmVndWxhdG9yLW92ZXItY3VycmVudC1wcm90ZWN0aW9uOworCQkJCXFjb20sb2NwLW1h
eC1yZXRyaWVzID0gPDEwPjsKKwkJCQlxY29tLG9jcC1yZXRyeS1kZWxheSA9IDwzMD47CisJCQkJ
cWNvbSx2cy1zb2Z0LXN0YXJ0LXN0cmVuZ3RoID0gPDA+OworCQkJCXJlZ3VsYXRvci1pbml0aWFs
LW1vZGUgPSA8MT47CisJCQl9OwogCQl9OwogCX07CiB9OwotLSAKMi4yMS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

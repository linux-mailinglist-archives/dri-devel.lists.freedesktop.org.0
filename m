Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DF547511
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5BB891F4;
	Sun, 16 Jun 2019 14:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6392F890D2;
 Sun, 16 Jun 2019 13:29:47 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id CA9F43E93E;
 Sun, 16 Jun 2019 13:29:44 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com,
 sean@poorly.run, robh+dt@kernel.org
Subject: [PATCH 0/6] qcom: add OCMEM support
Date: Sun, 16 Jun 2019 09:29:24 -0400
Message-Id: <20190616132930.6942-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1560691785;
 bh=akXf0t16W4Sv5yqWMp8rlGNlkVwrweBmlxxAJMCWsQw=;
 h=From:To:Cc:Subject:Date:From;
 b=Lpa7v/Gp1/3yY9yBwkC4e6pSdJBxEMiwerKe3c5+Y57mKACYCkm3+fH+44SEPHSTU
 1qmNLda5eF25JuF84km1i5ujC7/B5DclnGtWByOYDsrgQr1EJd5ZenrG3gmZENxdsY
 yg8PvSpwX+d1QhsV0H+zbST8u+UzsHUpxDn8gjOU=
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
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBRdWFsY29tbSdzIE9uIENoaXAgTUVN
b3J5IChPQ01FTSkKdGhhdCBpcyBuZWVkZWQgaW4gb3JkZXIgdG8gc3VwcG9ydCBzb21lIEEzeHgg
YW5kIEE0eHggYmFzZWQgR1BVcwp1cHN0cmVhbS4gVGhpcyBpcyBiYXNlZCBvbiBSb2IgQ2xhcmsn
cyBwYXRjaCBzZXJpZXMgdGhhdCBoZSBzdWJtaXR0ZWQKaW4gT2N0b2JlciAyMDE1IGFuZCBJIGFt
IHJlc3VibWl0dGluZyB1cGRhdGVkIHBhdGNoZXMgd2l0aCBoaXMKcGVybWlzc2lvbi4KClRoaXMg
d2FzIHRlc3RlZCB3aXRoIHRoZSBHUFUgb24gYSBMRyBOZXh1cyA1IChoYW1tZXJoZWFkKSBwaG9u
ZSBhbmQKdGhpcyB3aWxsIHdvcmsgb24gb3RoZXIgbXNtODk3NC1iYXNlZCBzeXN0ZW1zLiBGb3Ig
YSBzdW1tYXJ5IG9mIHdoYXQKY3VycmVudGx5IHdvcmtzIHVwc3RyZWFtIG9uIHRoZSBOZXh1cyA1
LCBzZWUgbXkgc3RhdHVzIHBhZ2UgYXQKaHR0cHM6Ly9tYXNuZXliLmdpdGh1Yi5pby9uZXh1cy01
LXVwc3RyZWFtLy4KCkJyaWFuIE1hc25leSAoMyk6CiAgZHQtYmluZGluZ3M6IHNvYzogcWNvbTog
YWRkIE9uIENoaXAgTUVNb3J5IChPQ01FTSkgYmluZGluZ3MKICBkdC1iaW5kaW5nczogZGlzcGxh
eTogbXNtOiBnbXU6IGFkZCBvcHRpb25hbCBvY21lbSBwcm9wZXJ0eQogIGRybS9tc20vZ3B1OiBh
ZGQgb2NtZW0gaW5pdC9jbGVhbnVwIGZ1bmN0aW9ucwoKUm9iIENsYXJrICgzKToKICBmaXJtd2Fy
ZTogcWNvbTogc2NtOiBhZGQgc3VwcG9ydCB0byByZXN0b3JlIHNlY3VyZSBjb25maWcKICBmaXJt
d2FyZTogcWNvbTogc2NtOiBhZGQgT0NNRU0gbG9jay91bmxvY2sgaW50ZXJmYWNlCiAgc29jOiBx
Y29tOiBhZGQgT0NNRU0gZHJpdmVyCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9t
c20vZ211LnR4dCAgIHwgICA0ICsKIC4uLi9iaW5kaW5ncy9zb2MvcWNvbS9xY29tLG9jbWVtLnlh
bWwgICAgICAgICB8ICA2NiArKysKIGRyaXZlcnMvZmlybXdhcmUvcWNvbV9zY20tMzIuYyAgICAg
ICAgICAgICAgICB8ICA1NiArKysKIGRyaXZlcnMvZmlybXdhcmUvcWNvbV9zY20tNjQuYyAgICAg
ICAgICAgICAgICB8ICAxOCArCiBkcml2ZXJzL2Zpcm13YXJlL3Fjb21fc2NtLmMgICAgICAgICAg
ICAgICAgICAgfCAgNjMgKysrCiBkcml2ZXJzL2Zpcm13YXJlL3Fjb21fc2NtLmggICAgICAgICAg
ICAgICAgICAgfCAgMTUgKwogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTN4eF9ncHUuYyAg
ICAgICAgIHwgIDMzICstCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hM3h4X2dwdS5oICAg
ICAgICAgfCAgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E0eHhfZ3B1LmMgICAg
ICAgICB8ICAzMCArLQogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTR4eF9ncHUuaCAgICAg
ICAgIHwgICAzICstCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1LmMgICAg
ICAgfCAgNDEgKysKIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19ncHUuaCAgICAg
ICB8ICAxMCArCiBkcml2ZXJzL3NvYy9xY29tL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAg
fCAgMTAgKwogZHJpdmVycy9zb2MvcWNvbS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgIHwg
ICAxICsKIGRyaXZlcnMvc29jL3Fjb20vb2NtZW0uYyAgICAgICAgICAgICAgICAgICAgICB8IDQw
MiArKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvc29jL3Fjb20vb2NtZW0ueG1sLmggICAgICAg
ICAgICAgICAgICB8ICA4NiArKysrCiBpbmNsdWRlL2xpbnV4L3Fjb21fc2NtLmggICAgICAgICAg
ICAgICAgICAgICAgfCAgMjggKysKIGluY2x1ZGUvc29jL3Fjb20vb2NtZW0uaCAgICAgICAgICAg
ICAgICAgICAgICB8ICAzNCArKwogMTggZmlsZXMgY2hhbmdlZCwgODU3IGluc2VydGlvbnMoKyks
IDQ2IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zb2MvcWNvbS9xY29tLG9jbWVtLnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL3NvYy9xY29tL29jbWVtLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3Nv
Yy9xY29tL29jbWVtLnhtbC5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9zb2MvcWNvbS9v
Y21lbS5oCgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=

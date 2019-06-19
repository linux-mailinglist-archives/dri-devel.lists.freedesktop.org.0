Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FD04B2D5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966D46E2F0;
	Wed, 19 Jun 2019 07:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26626E280;
 Wed, 19 Jun 2019 02:32:13 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id E4A803E916;
 Wed, 19 Jun 2019 02:32:11 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: bjorn.andersson@linaro.org, agross@kernel.org, david.brown@linaro.org,
 robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org
Subject: [PATCH v2 0/6] qcom: add OCMEM support
Date: Tue, 18 Jun 2019 22:32:03 -0400
Message-Id: <20190619023209.10036-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1560911532;
 bh=CgLY5oLR5lb5ja9eObXPqJkD6mFawrypxrsKG6eRDBw=;
 h=From:To:Cc:Subject:Date:From;
 b=TFWXNjZNLhbD5D5xvTYPsg936DgaLeNPI5FE11ly6KUE14fMvGdlAWBa7pbizHT9y
 7WXus2cabxrqFyBQXWBvblmok7bCoDhqyes6aR+QpMuRxypXdHDb/9l+HxCUwQrTL8
 1F2GECRTv+2XK8e/yMephrrlEw0vXUtydCi7UOSc=
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

VGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBRdWFsY29tbSdzIE9uIENoaXAgTUVN
b3J5IChPQ01FTSkKdGhhdCBpcyBuZWVkZWQgaW4gb3JkZXIgdG8gc3VwcG9ydCBzb21lIEEzeHgg
YW5kIEE0eHggYmFzZWQgR1BVcwp1cHN0cmVhbS4gVGhpcyBpcyBiYXNlZCBvbiBSb2IgQ2xhcmsn
cyBwYXRjaCBzZXJpZXMgdGhhdCBoZSBzdWJtaXR0ZWQKaW4gT2N0b2JlciAyMDE1IGFuZCBJIGFt
IHJlc3VibWl0dGluZyB1cGRhdGVkIHBhdGNoZXMgd2l0aCBoaXMKcGVybWlzc2lvbi4gU2VlIHRo
ZSBpbmRpdmlkdWFsIHBhdGNoZXMgZm9yIHRoZSBjaGFuZ2Vsb2cuCgpUaGlzIHdhcyB0ZXN0ZWQg
d2l0aCB0aGUgR1BVIG9uIGEgTEcgTmV4dXMgNSAoaGFtbWVyaGVhZCkgcGhvbmUgYW5kCnRoaXMg
d2lsbCB3b3JrIG9uIG90aGVyIG1zbTg5NzQtYmFzZWQgc3lzdGVtcy4gRm9yIGEgc3VtbWFyeSBv
ZiB3aGF0CmN1cnJlbnRseSB3b3JrcyB1cHN0cmVhbSBvbiB0aGUgTmV4dXMgNSwgc2VlIG15IHN0
YXR1cyBwYWdlIGF0Cmh0dHBzOi8vbWFzbmV5Yi5naXRodWIuaW8vbmV4dXMtNS11cHN0cmVhbS8u
CgpCcmlhbiBNYXNuZXkgKDQpOgogIGR0LWJpbmRpbmdzOiBzb2M6IHFjb206IGFkZCBPbiBDaGlw
IE1FTW9yeSAoT0NNRU0pIGJpbmRpbmdzCiAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IG1zbTogZ211
OiBhZGQgb3B0aW9uYWwgb2NtZW0gcHJvcGVydHkKICBzb2M6IHFjb206IGFkZCBPQ01FTSBkcml2
ZXIKICBkcm0vbXNtL2dwdTogYWRkIG9jbWVtIGluaXQvY2xlYW51cCBmdW5jdGlvbnMKClJvYiBD
bGFyayAoMik6CiAgZmlybXdhcmU6IHFjb206IHNjbTogYWRkIE9DTUVNIGxvY2svdW5sb2NrIGlu
dGVyZmFjZQogIGZpcm13YXJlOiBxY29tOiBzY206IGFkZCBzdXBwb3J0IHRvIHJlc3RvcmUgc2Vj
dXJlIGNvbmZpZyB0bwogICAgcWNtX3NjbS0zMgoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvbXNtL2dtdS50eHQgICB8ICAgNCArCiAuLi4vYmluZGluZ3Mvc3JhbS9xY29tL3Fjb20s
b2NtZW0ueWFtbCAgICAgICAgfCAgNjQgKysrCiBkcml2ZXJzL2Zpcm13YXJlL3Fjb21fc2NtLTMy
LmMgICAgICAgICAgICAgICAgfCAgNTIgKystCiBkcml2ZXJzL2Zpcm13YXJlL3Fjb21fc2NtLTY0
LmMgICAgICAgICAgICAgICAgfCAgMTIgKwogZHJpdmVycy9maXJtd2FyZS9xY29tX3NjbS5jICAg
ICAgICAgICAgICAgICAgIHwgIDUzICsrKwogZHJpdmVycy9maXJtd2FyZS9xY29tX3NjbS5oICAg
ICAgICAgICAgICAgICAgIHwgICA5ICsKIGRyaXZlcnMvZ3B1L2RybS9tc20vS2NvbmZpZyAgICAg
ICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hM3h4X2dw
dS5jICAgICAgICAgfCAgMzMgKy0KIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2EzeHhfZ3B1
LmggICAgICAgICB8ICAgMyArLQogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTR4eF9ncHUu
YyAgICAgICAgIHwgIDMwICstCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNHh4X2dwdS5o
ICAgICAgICAgfCAgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19ncHUu
YyAgICAgICB8ICAzNiArKwogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2dwdS5o
ICAgICAgIHwgIDEwICsKIGRyaXZlcnMvc29jL3Fjb20vS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICB8ICAxMCArCiBkcml2ZXJzL3NvYy9xY29tL01ha2VmaWxlICAgICAgICAgICAgICAgICAg
ICAgfCAgIDEgKwogZHJpdmVycy9zb2MvcWNvbS9vY21lbS5jICAgICAgICAgICAgICAgICAgICAg
IHwgNDMzICsrKysrKysrKysrKysrKysrKwogaW5jbHVkZS9saW51eC9xY29tX3NjbS5oICAgICAg
ICAgICAgICAgICAgICAgIHwgIDI2ICsrCiBpbmNsdWRlL3NvYy9xY29tL29jbWVtLmggICAgICAg
ICAgICAgICAgICAgICAgfCAgNjIgKysrCiAxOCBmaWxlcyBjaGFuZ2VkLCA3OTUgaW5zZXJ0aW9u
cygrKSwgNDcgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3NyYW0vcWNvbS9xY29tLG9jbWVtLnlhbWwKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL3NvYy9xY29tL29jbWVtLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNs
dWRlL3NvYy9xY29tL29jbWVtLmgKCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

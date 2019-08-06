Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB38A82C9D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1955189EFF;
	Tue,  6 Aug 2019 07:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7413A6E1B7;
 Tue,  6 Aug 2019 00:22:57 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id A40DD3E916;
 Tue,  6 Aug 2019 00:22:55 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
 robh+dt@kernel.org, bjorn.andersson@linaro.org
Subject: [PATCH v5 0/7] qcom: add OCMEM support
Date: Mon,  5 Aug 2019 20:22:22 -0400
Message-Id: <20190806002229.8304-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1565050976;
 bh=VrRYKG1TitvesrzHMHOF4beZiqGQImgS2ECJaCf7+tk=;
 h=From:To:Cc:Subject:Date:From;
 b=IHYIWMKuPl6bx1j4ulwA0yqY61goA73AvAuGBI9YP6mxiXQvW0KmgwQMRo2lCrSRD
 GRg8nB8IGiLhsZ4x9q0tX776GRWTnZqu59dt9uLC57y5GN90q6QwRAl5pgX1neBmW1
 XMGz8dkudWyiWHfcoNoY2HJImzTzfiikU5YAsUUE=
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBRdWFsY29tbSdzIE9uIENoaXAgTUVN
b3J5IChPQ01FTSkKdGhhdCBpcyBuZWVkZWQgaW4gb3JkZXIgdG8gc3VwcG9ydCBzb21lIGEzeHgg
YW5kIGE0eHgtYmFzZWQgR1BVcwp1cHN0cmVhbS4gVGhpcyBpcyBiYXNlZCBvbiBSb2IgQ2xhcmsn
cyBwYXRjaCBzZXJpZXMgdGhhdCBoZSBzdWJtaXR0ZWQKaW4gT2N0b2JlciAyMDE1IGFuZCBJIGFt
IHJlc3VibWl0dGluZyB1cGRhdGVkIHBhdGNoZXMgd2l0aCBoaXMKcGVybWlzc2lvbi4gU2VlIHRo
ZSBpbmRpdmlkdWFsIHBhdGNoZXMgZm9yIHRoZSBjaGFuZ2Vsb2cuCgpUaGlzIHdhcyB0ZXN0ZWQg
d2l0aCB0aGUgR1BVIG9uIGEgTEcgTmV4dXMgNSAoaGFtbWVyaGVhZCkgcGhvbmUgYW5kCnRoaXMg
d2lsbCB3b3JrIG9uIG90aGVyIG1zbTg5NzQtYmFzZWQgc3lzdGVtcy4gRm9yIGEgc3VtbWFyeSBv
ZiB3aGF0CmN1cnJlbnRseSB3b3JrcyB1cHN0cmVhbSBvbiB0aGUgTmV4dXMgNSwgc2VlIG15IHN0
YXR1cyBwYWdlIGF0Cmh0dHBzOi8vbWFzbmV5Yi5naXRodWIuaW8vbmV4dXMtNS11cHN0cmVhbS8u
CgpCcmlhbiBNYXNuZXkgKDUpOgogIGR0LWJpbmRpbmdzOiBzb2M6IHFjb206IGFkZCBPbiBDaGlw
IE1FTW9yeSAoT0NNRU0pIGJpbmRpbmdzCiAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IG1zbTogZ211
OiBhZGQgb3B0aW9uYWwgb2NtZW0gcHJvcGVydHkKICBzb2M6IHFjb206IGFkZCBPQ01FTSBkcml2
ZXIKICBkcm0vbXNtL2dwdTogYWRkIG9jbWVtIGluaXQvY2xlYW51cCBmdW5jdGlvbnMKICBBUk06
IHFjb21fZGVmY29uZmlnOiBhZGQgb2NtZW0gc3VwcG9ydAoKUm9iIENsYXJrICgyKToKICBmaXJt
d2FyZTogcWNvbTogc2NtOiBhZGQgT0NNRU0gbG9jay91bmxvY2sgaW50ZXJmYWNlCiAgZmlybXdh
cmU6IHFjb206IHNjbTogYWRkIHN1cHBvcnQgdG8gcmVzdG9yZSBzZWN1cmUgY29uZmlnIHRvCiAg
ICBxY21fc2NtLTMyCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZ211LnR4
dCAgIHwgIDUwICsrCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9zcmFtL3Fjb20sb2NtZW0ueWFt
bCAgfCAgOTYgKysrKwogYXJjaC9hcm0vY29uZmlncy9xY29tX2RlZmNvbmZpZyAgICAgICAgICAg
ICAgIHwgICAxICsKIGRyaXZlcnMvZmlybXdhcmUvcWNvbV9zY20tMzIuYyAgICAgICAgICAgICAg
ICB8ICA1MiArKy0KIGRyaXZlcnMvZmlybXdhcmUvcWNvbV9zY20tNjQuYyAgICAgICAgICAgICAg
ICB8ICAxMiArCiBkcml2ZXJzL2Zpcm13YXJlL3Fjb21fc2NtLmMgICAgICAgICAgICAgICAgICAg
fCAgNTMgKysrCiBkcml2ZXJzL2Zpcm13YXJlL3Fjb21fc2NtLmggICAgICAgICAgICAgICAgICAg
fCAgIDkgKwogZHJpdmVycy9ncHUvZHJtL21zbS9LY29uZmlnICAgICAgICAgICAgICAgICAgIHwg
ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2EzeHhfZ3B1LmMgICAgICAgICB8ICAy
OCArLQogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTN4eF9ncHUuaCAgICAgICAgIHwgICAz
ICstCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNHh4X2dwdS5jICAgICAgICAgfCAgMjUg
Ky0KIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E0eHhfZ3B1LmggICAgICAgICB8ICAgMyAr
LQogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2dwdS5jICAgICAgIHwgIDQwICsr
CiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1LmggICAgICAgfCAgMTAgKwog
ZHJpdmVycy9zb2MvcWNvbS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgIDEwICsKIGRy
aXZlcnMvc29jL3Fjb20vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2
ZXJzL3NvYy9xY29tL29jbWVtLmMgICAgICAgICAgICAgICAgICAgICAgfCA0MzMgKysrKysrKysr
KysrKysrKysrCiBpbmNsdWRlL2xpbnV4L3Fjb21fc2NtLmggICAgICAgICAgICAgICAgICAgICAg
fCAgMjYgKysKIGluY2x1ZGUvc29jL3Fjb20vb2NtZW0uaCAgICAgICAgICAgICAgICAgICAgICB8
ICA2MiArKysKIDE5IGZpbGVzIGNoYW5nZWQsIDg3MCBpbnNlcnRpb25zKCspLCA0NSBkZWxldGlv
bnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc3JhbS9xY29tLG9jbWVtLnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3NvYy9x
Y29tL29jbWVtLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL3NvYy9xY29tL29jbWVtLmgK
Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==

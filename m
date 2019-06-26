Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BD556436
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E426E2F8;
	Wed, 26 Jun 2019 08:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB6F6E204;
 Wed, 26 Jun 2019 02:22:05 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id BE7C03E887;
 Wed, 26 Jun 2019 02:22:03 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
 robh+dt@kernel.org, bjorn.andersson@linaro.org
Subject: [PATCH v3 0/6] qcom: add OCMEM support
Date: Tue, 25 Jun 2019 22:21:42 -0400
Message-Id: <20190626022148.23712-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1561515724;
 bh=6wTPy9KKBizKnrnUdUtaxPyNqun7HU3CFL9ZBYn8eao=;
 h=From:To:Cc:Subject:Date:From;
 b=vjDl/c5rDxt9/iXgEfyHgGFUd4hclgr5iKX9dqRsko7AYdv5rS5SfORMqoIhPIJNX
 yhNUD0sPAdBvrfFsLJaFFN1eIS2U62QfBhjMgFhdozVqifGycrWEwn1TqF5VIVgsoJ
 Gk3dy0Ndiq6iePQi2whkM7NVmsJfrJpVZC2Va/0c=
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
b3J5IChPQ01FTSkKdGhhdCBpcyBuZWVkZWQgaW4gb3JkZXIgdG8gc3VwcG9ydCBzb21lIGEzeHgg
YW5kIGE0eHgtYmFzZWQgR1BVcwp1cHN0cmVhbS4gVGhpcyBpcyBiYXNlZCBvbiBSb2IgQ2xhcmsn
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
c3BsYXkvbXNtL2dtdS50eHQgICB8ICA1MCArKwogLi4uL2JpbmRpbmdzL3NyYW0vcWNvbS9xY29t
LG9jbWVtLnlhbWwgICAgICAgIHwgIDg0ICsrKysKIGRyaXZlcnMvZmlybXdhcmUvcWNvbV9zY20t
MzIuYyAgICAgICAgICAgICAgICB8ICA1MiArKy0KIGRyaXZlcnMvZmlybXdhcmUvcWNvbV9zY20t
NjQuYyAgICAgICAgICAgICAgICB8ICAxMiArCiBkcml2ZXJzL2Zpcm13YXJlL3Fjb21fc2NtLmMg
ICAgICAgICAgICAgICAgICAgfCAgNTMgKysrCiBkcml2ZXJzL2Zpcm13YXJlL3Fjb21fc2NtLmgg
ICAgICAgICAgICAgICAgICAgfCAgIDkgKwogZHJpdmVycy9ncHUvZHJtL21zbS9LY29uZmlnICAg
ICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2EzeHhf
Z3B1LmMgICAgICAgICB8ICAyOCArLQogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTN4eF9n
cHUuaCAgICAgICAgIHwgICAzICstCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNHh4X2dw
dS5jICAgICAgICAgfCAgMjUgKy0KIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E0eHhfZ3B1
LmggICAgICAgICB8ICAgMyArLQogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2dw
dS5jICAgICAgIHwgIDQwICsrCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1
LmggICAgICAgfCAgMTAgKwogZHJpdmVycy9zb2MvcWNvbS9LY29uZmlnICAgICAgICAgICAgICAg
ICAgICAgIHwgIDEwICsKIGRyaXZlcnMvc29jL3Fjb20vTWFrZWZpbGUgICAgICAgICAgICAgICAg
ICAgICB8ICAgMSArCiBkcml2ZXJzL3NvYy9xY29tL29jbWVtLmMgICAgICAgICAgICAgICAgICAg
ICAgfCA0MzMgKysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL2xpbnV4L3Fjb21fc2NtLmggICAg
ICAgICAgICAgICAgICAgICAgfCAgMjYgKysKIGluY2x1ZGUvc29jL3Fjb20vb2NtZW0uaCAgICAg
ICAgICAgICAgICAgICAgICB8ICA2MiArKysKIDE4IGZpbGVzIGNoYW5nZWQsIDg1NyBpbnNlcnRp
b25zKCspLCA0NSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3Mvc3JhbS9xY29tL3Fjb20sb2NtZW0ueWFtbAogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvc29jL3Fjb20vb2NtZW0uYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGlu
Y2x1ZGUvc29jL3Fjb20vb2NtZW0uaAoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

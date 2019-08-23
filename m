Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 093B19C6A2
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 02:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053166E142;
	Mon, 26 Aug 2019 00:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54E46EC7B;
 Fri, 23 Aug 2019 12:16:51 +0000 (UTC)
Received: from localhost.localdomain (wsip-184-191-162-253.sd.sd.cox.net
 [184.191.162.253])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id B5FEB3E83A;
 Fri, 23 Aug 2019 12:16:48 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
 robh+dt@kernel.org, bjorn.andersson@linaro.org
Subject: [PATCH v7 0/7] qcom: add OCMEM support
Date: Fri, 23 Aug 2019 05:16:30 -0700
Message-Id: <20190823121637.5861-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Aug 2019 00:18:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1566562610;
 bh=eh6YeVR/aaRQNy0BfSesizLKEGUOODPOyckdT4m9Imk=;
 h=From:To:Cc:Subject:Date:From;
 b=j+jFpA5dm8HNQPPS6RDTSJGMa2v6pL8IZuN0d/WDqF0vpib3TTBvrwAd/SWd0ynsI
 AZQSp3DLmHdo4EA5Wz6xya3DkGu31B5rttiRE4YhsOhRZualg9mChcRFkRrPkI+fdr
 4Yu0F/g+nstdUJFxyEqzR/9w+M6tnc+9KJ2zRDzM=
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
CgpDaGFuZ2VzIHNpbmNlIHY2OgotIGxpbmsgdG8gZ211LXNyYW0gY2hpbGQgbm9kZSBpbiBkZXZp
Y2UgdHJlZQotIGFkZCByYW5nZXMgcHJvcGVydHkgdG8gb2NtZW0gZXhhbXBsZSBpbiBhZHJlbm8g
R01VIGV4YW1wbGUgKHBhdGNoIDIpCiAgdG8gbWF0Y2ggYmluZGluZ3MgaW4gcGF0Y2ggMQoKU2Vl
IGluZGl2aWR1YWwgcGF0Y2hlcyBmb3IgY2hhbmdlbG9ncyBmb3IgcHJldmlvdXMgdmVyc2lvbnMu
CgpCcmlhbiBNYXNuZXkgKDUpOgogIGR0LWJpbmRpbmdzOiBzb2M6IHFjb206IGFkZCBPbiBDaGlw
IE1FTW9yeSAoT0NNRU0pIGJpbmRpbmdzCiAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IG1zbTogZ211
OiBhZGQgb3B0aW9uYWwgb2NtZW0gcHJvcGVydHkKICBzb2M6IHFjb206IGFkZCBPQ01FTSBkcml2
ZXIKICBkcm0vbXNtL2dwdTogYWRkIG9jbWVtIGluaXQvY2xlYW51cCBmdW5jdGlvbnMKICBBUk06
IHFjb21fZGVmY29uZmlnOiBhZGQgb2NtZW0gc3VwcG9ydAoKUm9iIENsYXJrICgyKToKICBmaXJt
d2FyZTogcWNvbTogc2NtOiBhZGQgT0NNRU0gbG9jay91bmxvY2sgaW50ZXJmYWNlCiAgZmlybXdh
cmU6IHFjb206IHNjbTogYWRkIHN1cHBvcnQgdG8gcmVzdG9yZSBzZWN1cmUgY29uZmlnIHRvCiAg
ICBxY21fc2NtLTMyCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZ211LnR4
dCAgIHwgIDUxICsrKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvc3JhbS9xY29tLG9jbWVtLnlh
bWwgIHwgIDk2ICsrKysKIGFyY2gvYXJtL2NvbmZpZ3MvcWNvbV9kZWZjb25maWcgICAgICAgICAg
ICAgICB8ICAgMSArCiBkcml2ZXJzL2Zpcm13YXJlL3Fjb21fc2NtLTMyLmMgICAgICAgICAgICAg
ICAgfCAgNTIgKystCiBkcml2ZXJzL2Zpcm13YXJlL3Fjb21fc2NtLTY0LmMgICAgICAgICAgICAg
ICAgfCAgMTIgKwogZHJpdmVycy9maXJtd2FyZS9xY29tX3NjbS5jICAgICAgICAgICAgICAgICAg
IHwgIDUzICsrKwogZHJpdmVycy9maXJtd2FyZS9xY29tX3NjbS5oICAgICAgICAgICAgICAgICAg
IHwgICA5ICsKIGRyaXZlcnMvZ3B1L2RybS9tc20vS2NvbmZpZyAgICAgICAgICAgICAgICAgICB8
ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hM3h4X2dwdS5jICAgICAgICAgfCAg
MjggKy0KIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2EzeHhfZ3B1LmggICAgICAgICB8ICAg
MyArLQogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTR4eF9ncHUuYyAgICAgICAgIHwgIDI1
ICstCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNHh4X2dwdS5oICAgICAgICAgfCAgIDMg
Ky0KIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19ncHUuYyAgICAgICB8ICA0MCAr
KwogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2dwdS5oICAgICAgIHwgIDEwICsK
IGRyaXZlcnMvc29jL3Fjb20vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8ICAxMCArCiBk
cml2ZXJzL3NvYy9xY29tL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJp
dmVycy9zb2MvcWNvbS9vY21lbS5jICAgICAgICAgICAgICAgICAgICAgIHwgNDMzICsrKysrKysr
KysrKysrKysrKwogaW5jbHVkZS9saW51eC9xY29tX3NjbS5oICAgICAgICAgICAgICAgICAgICAg
IHwgIDI2ICsrCiBpbmNsdWRlL3NvYy9xY29tL29jbWVtLmggICAgICAgICAgICAgICAgICAgICAg
fCAgNjIgKysrCiAxOSBmaWxlcyBjaGFuZ2VkLCA4NzEgaW5zZXJ0aW9ucygrKSwgNDUgZGVsZXRp
b25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3NyYW0vcWNvbSxvY21lbS55YW1sCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9zb2Mv
cWNvbS9vY21lbS5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9zb2MvcWNvbS9vY21lbS5o
CgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=

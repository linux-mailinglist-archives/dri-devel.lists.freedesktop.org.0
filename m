Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C0C81379
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0826E2C2;
	Mon,  5 Aug 2019 07:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE086E4DD;
 Sat,  3 Aug 2019 14:20:42 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 31A2E3E911;
 Sat,  3 Aug 2019 14:20:41 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
 robh+dt@kernel.org, bjorn.andersson@linaro.org
Subject: [PATCH v4 0/6] qcom: add OCMEM support
Date: Sat,  3 Aug 2019 10:20:20 -0400
Message-Id: <20190803142026.9647-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:34:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1564842042;
 bh=AyN5wQsPxPTEJYAgV1yzeXYMQ15czOuk0KIihcraLSQ=;
 h=From:To:Cc:Subject:Date:From;
 b=LvF1jtvevdB+pD55EVf+sBrBhUXMlF5WEr0I4F42bHqLhP4ue0s99dvDFDaSrWGIO
 V9xqAexfLVoigDYQ4s4XbeiRRwhkhALXXtXDR4zqFIh2uQ2BtIUX1H0p1RpUZXx4Qp
 JzPtAWsC6HO31EHsc3mbTF3qtmYi5Rj4CEqrvqhU=
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
CgpCcmlhbiBNYXNuZXkgKDQpOgogIGR0LWJpbmRpbmdzOiBzb2M6IHFjb206IGFkZCBPbiBDaGlw
IE1FTW9yeSAoT0NNRU0pIGJpbmRpbmdzCiAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IG1zbTogZ211
OiBhZGQgb3B0aW9uYWwgb2NtZW0gcHJvcGVydHkKICBzb2M6IHFjb206IGFkZCBPQ01FTSBkcml2
ZXIKICBkcm0vbXNtL2dwdTogYWRkIG9jbWVtIGluaXQvY2xlYW51cCBmdW5jdGlvbnMKClJvYiBD
bGFyayAoMik6CiAgZmlybXdhcmU6IHFjb206IHNjbTogYWRkIE9DTUVNIGxvY2svdW5sb2NrIGlu
dGVyZmFjZQogIGZpcm13YXJlOiBxY29tOiBzY206IGFkZCBzdXBwb3J0IHRvIHJlc3RvcmUgc2Vj
dXJlIGNvbmZpZyB0bwogICAgcWNtX3NjbS0zMgoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvbXNtL2dtdS50eHQgICB8ICA1MCArKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvc3Jh
bS9xY29tLG9jbWVtLnlhbWwgIHwgIDk2ICsrKysKIGRyaXZlcnMvZmlybXdhcmUvcWNvbV9zY20t
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
ICAgICAgICAgICAgICAgICB8ICA2MiArKysKIDE4IGZpbGVzIGNoYW5nZWQsIDg2OSBpbnNlcnRp
b25zKCspLCA0NSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3Mvc3JhbS9xY29tLG9jbWVtLnlhbWwKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL3NvYy9xY29tL29jbWVtLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRl
L3NvYy9xY29tL29jbWVtLmgKCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==

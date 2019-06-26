Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F1956437
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:13:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECA06E2FF;
	Wed, 26 Jun 2019 08:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76C86E207;
 Wed, 26 Jun 2019 02:22:05 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id C8D3E3EA13;
 Wed, 26 Jun 2019 02:22:04 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
 robh+dt@kernel.org, bjorn.andersson@linaro.org
Subject: [PATCH v3 1/6] dt-bindings: soc: qcom: add On Chip MEMory (OCMEM)
 bindings
Date: Tue, 25 Jun 2019 22:21:43 -0400
Message-Id: <20190626022148.23712-2-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626022148.23712-1-masneyb@onstation.org>
References: <20190626022148.23712-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1561515725;
 bh=NNWCQFfV7/jn6sShBvH15o4aX6Z5qXDaPn1VH92lNBA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YtvmbDc04vrtth/SjLVbjE1oEa/Pi4SdiKla7YqQnAhKSoyOWOmZd2cL/uxZqY8gQ
 5M5ULnBDfNJSIBjF11ZCcLwMwEi9+0Mt2vMjPVbFJOavfhfxg5u+kZBi8MrANFNYjj
 UC1qGeuoptN1OL9GlxMOcbx1L7FWiKWQ26f7p3GU=
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

QWRkIGRldmljZSB0cmVlIGJpbmRpbmdzIGZvciB0aGUgT24gQ2hpcCBNZW1vcnkgKE9DTUVNKSB0
aGF0IGlzIHByZXNlbnQKb24gc29tZSBRdWFsY29tbSBTbmFwZHJhZ29uIFNvQ3MuCgpTaWduZWQt
b2ZmLWJ5OiBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9uLm9yZz4KLS0tCkNoYW5nZXMg
c2luY2UgdjI6Ci0gQWRkICotc3JhbSBub2RlIGFuZCBnbXUtc3JhbSB0byBleGFtcGxlLgoKQ2hh
bmdlcyBzaW5jZSB2MToKLSBSZW5hbWUgcWNvbSxvY21lbS1tc204OTc0IHRvIHFjb20sbXNtODk3
NC1vY21lbQotIFJlbmFtZWQgcmVnLW5hbWVzIHRvIGN0cmwgYW5kIG1lbQotIHVwZGF0ZSBoYXJk
d2FyZSBkZXNjcmlwdGlvbgotIG1vdmVkIGZyb20gc29jIHRvIHNyYW0gbmFtZXNwYWNlIGluIHRo
ZSBkZXZpY2UgdHJlZSBiaW5kaW5ncwoKIC4uLi9iaW5kaW5ncy9zcmFtL3Fjb20vcWNvbSxvY21l
bS55YW1sICAgICAgICB8IDg0ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4
NCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3NyYW0vcWNvbS9xY29tLG9jbWVtLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3JhbS9xY29tL3Fjb20sb2NtZW0ueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcmFtL3Fjb20vcWNvbSxvY21lbS55
YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uYTBiZjBhZjQ4NjBh
Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Ny
YW0vcWNvbS9xY29tLG9jbWVtLnlhbWwKQEAgLTAsMCArMSw4NCBAQAorIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRp
ZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvc3JhbS9xY29tL3Fjb20sb2NtZW0ueWFt
bCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1s
IworCit0aXRsZTogT24gQ2hpcCBNZW1vcnkgKE9DTUVNKSB0aGF0IGlzIHByZXNlbnQgb24gc29t
ZSBRdWFsY29tbSBTbmFwZHJhZ29uIFNvQ3MuCisKK21haW50YWluZXJzOgorICAtIEJyaWFuIE1h
c25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgorCitkZXNjcmlwdGlvbjogfAorICBUaGUgT24g
Q2hpcCBNZW1vcnkgKE9DTUVNKSBpcyB0eXBpY2FsbHkgdXNlZCBieSB0aGUgR1BVLCBjYW1lcmEv
dmlkZW8sIGFuZAorICBhdWRpbyBjb21wb25lbnRzIG9uIHNvbWUgU25hcGRyYWdvbiBTb0NzLgor
Citwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGNvbnN0OiBxY29tLG1zbTg5NzQtb2Nt
ZW0KKworICByZWc6CisgICAgaXRlbXM6CisgICAgICAtIGRlc2NyaXB0aW9uOiBDb250cm9sIHJl
Z2lzdGVycworICAgICAgLSBkZXNjcmlwdGlvbjogT0NNRU0gYWRkcmVzcyByYW5nZQorCisgIHJl
Zy1uYW1lczoKKyAgICBpdGVtczoKKyAgICAgIC0gY29uc3Q6IGN0cmwKKyAgICAgIC0gY29uc3Q6
IG1lbQorCisgIGNsb2NrczoKKyAgICBpdGVtczoKKyAgICAgIC0gZGVzY3JpcHRpb246IENvcmUg
Y2xvY2sKKyAgICAgIC0gZGVzY3JpcHRpb246IEludGVyZmFjZSBjbG9jaworCisgIGNsb2NrLW5h
bWVzOgorICAgIGl0ZW1zOgorICAgICAgLSBjb25zdDogY29yZQorICAgICAgLSBjb25zdDogaWZh
Y2UKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorICAtIHJlZworICAtIHJlZy1uYW1lcwor
ICAtIGNsb2NrcworICAtIGNsb2NrLW5hbWVzCisKK3BhdHRlcm5Qcm9wZXJ0aWVzOgorICAiXi4r
LXNyYW0kIjoKKyAgICB0eXBlOiBvYmplY3QKKyAgICBkZXNjcmlwdGlvbjogfAorICAgICAgQSBy
ZWdpb24gb2YgcmVzZXJ2ZWQgbWVtb3J5LgorCisgICAgcHJvcGVydGllczoKKyAgICAgIHJlZzoK
KyAgICAgICAgbWF4SXRlbXM6IDEKKworICAgIHJlcXVpcmVkOgorICAgICAgLSByZWcKKworZXhh
bXBsZXM6CisgIC0gfAorICAgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3Fjb20scnBt
Y2MuaD4KKyAgICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9xY29tLG1tY2MtbXNtODk3
NC5oPgorCisgICAgICBvY21lbTogb2NtZW1AZmRkMDAwMDAgeworICAgICAgICBjb21wYXRpYmxl
ID0gInFjb20sbXNtODk3NC1vY21lbSI7CisKKyAgICAgICAgcmVnID0gPDB4ZmRkMDAwMDAgMHgy
MDAwPiwKKyAgICAgICAgICAgICAgPDB4ZmVjMDAwMDAgMHgxODAwMDA+OworICAgICAgICByZWct
bmFtZXMgPSAiY3RybCIsCisgICAgICAgICAgICAgICAgICAgICJtZW0iOworCisgICAgICAgIGNs
b2NrcyA9IDwmcnBtY2MgUlBNX1NNRF9PQ01FTUdYX0NMSz4sCisgICAgICAgICAgICAgICAgIDwm
bW1jYyBPQ01FTUNYX09DTUVNTk9DX0NMSz47CisgICAgICAgIGNsb2NrLW5hbWVzID0gImNvcmUi
LAorICAgICAgICAgICAgICAgICAgICAgICJpZmFjZSI7CisKKyAgICAgICAgI2FkZHJlc3MtY2Vs
bHMgPSA8MT47CisgICAgICAgICNzaXplLWNlbGxzID0gPDE+OworCisgICAgICAgIGdtdS1zcmFt
QDAgeworICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHgxMDAwMDA+OworICAgICAgICB9Owor
ICAgICAgfTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs

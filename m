Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF488138B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC796E2EE;
	Mon,  5 Aug 2019 07:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D4F6E4DD;
 Sat,  3 Aug 2019 14:20:43 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 95CEB3E99C;
 Sat,  3 Aug 2019 14:20:42 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
 robh+dt@kernel.org, bjorn.andersson@linaro.org
Subject: [PATCH v4 2/6] dt-bindings: display: msm: gmu: add optional ocmem
 property
Date: Sat,  3 Aug 2019 10:20:22 -0400
Message-Id: <20190803142026.9647-3-masneyb@onstation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803142026.9647-1-masneyb@onstation.org>
References: <20190803142026.9647-1-masneyb@onstation.org>
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:34:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1564842043;
 bh=Tmdnwzu6ddgCiEXgtofjWAAx33POUU2yRy5Wp0tg268=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nCeuOc50pAOxdF5xG/DTpWLeIFxUNoCujOIfYS7K13nntM+UHOVHxOxliECMo/fXC
 G5yRnrQGh1nPT6BHskhZpVD3Y4lxvcWU1WTiS1WHH4fLu8mpl8UjCAWt87UG/NRCe9
 7geYl5Rqa3K8I2GgS6i1zIWVnmZmSW0mfit1bigU=
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

U29tZSBBM3h4IGFuZCBBNHh4IEFkcmVubyBHUFVzIGRvIG5vdCBoYXZlIEdNRU0gaW5zaWRlIHRo
ZSBHUFUgY29yZSBhbmQKbXVzdCB1c2UgdGhlIE9uIENoaXAgTUVNb3J5IChPQ01FTSkgaW4gb3Jk
ZXIgdG8gYmUgZnVuY3Rpb25hbC4gQWRkIHRoZQpvcHRpb25hbCBvY21lbSBwcm9wZXJ0eSB0byB0
aGUgQWRyZW5vIEdyYXBoaWNzIE1hbmFnZW1lbnQgVW5pdCBiaW5kaW5ncy4KClNpZ25lZC1vZmYt
Ynk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgotLS0KQ2hhbmdlcyBzaW5j
ZSB2MzoKLSBjb3JyZWN0IGxpbmsgdG8gcWNvbSxvY21lbS55YW1sCgpDaGFuZ2VzIHNpbmNlIHYy
OgotIEFkZCBhM3h4IGV4YW1wbGUgd2l0aCBPQ01FTQoKQ2hhbmdlcyBzaW5jZSB2MToKLSBOb25l
CgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZ211LnR4dCAgIHwgNTAgKysr
KysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZ211
LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9nbXUu
dHh0CmluZGV4IDkwYWY1YjBhNTZhOS4uNjcyZDU1N2NhYmE0IDEwMDY0NAotLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZ211LnR4dAorKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tc20vZ211LnR4dApAQCAtMzEs
NiArMzEsMTAgQEAgUmVxdWlyZWQgcHJvcGVydGllczoKIC0gaW9tbXVzOiBwaGFuZGxlIHRvIHRo
ZSBhZHJlbm8gaW9tbXUKIC0gb3BlcmF0aW5nLXBvaW50cy12MjogcGhhbmRsZSB0byB0aGUgT1BQ
IG9wZXJhdGluZyBwb2ludHMKIAorT3B0aW9uYWwgcHJvcGVydGllczoKKy0gb2NtZW06IHBoYW5k
bGUgdG8gdGhlIE9uIENoaXAgTWVtb3J5IChPQ01FTSkgdGhhdCdzIHByZXNlbnQgb24gc29tZSBT
bmFwZHJhZ29uCisgICAgICAgICBTb0NzLiBTZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3NyYW0vcWNvbSxvY21lbS55YW1sLgorCiBFeGFtcGxlOgogCiAvIHsKQEAgLTYzLDMg
KzY3LDQ5IEBAIEV4YW1wbGU6CiAJCW9wZXJhdGluZy1wb2ludHMtdjIgPSA8JmdtdV9vcHBfdGFi
bGU+OwogCX07CiB9OworCithM3h4IGV4YW1wbGUgd2l0aCBPQ01FTSBzdXBwb3J0OgorCisvIHsK
KwkuLi4KKworCWdwdTogYWRyZW5vQGZkYjAwMDAwIHsKKwkJY29tcGF0aWJsZSA9ICJxY29tLGFk
cmVuby0zMzAuMiIsCisJCSAgICAgICAgICAgICAicWNvbSxhZHJlbm8iOworCQlyZWcgPSA8MHhm
ZGIwMDAwMCAweDEwMDAwPjsKKwkJcmVnLW5hbWVzID0gImtnc2xfM2QwX3JlZ19tZW1vcnkiOwor
CQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMzMgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCWludGVy
cnVwdC1uYW1lcyA9ICJrZ3NsXzNkMF9pcnEiOworCQljbG9jay1uYW1lcyA9ICJjb3JlIiwKKwkJ
ICAgICAgICAgICAgICAiaWZhY2UiLAorCQkgICAgICAgICAgICAgICJtZW1faWZhY2UiOworCQlj
bG9ja3MgPSA8Jm1tY2MgT1hJTElfR0ZYM0RfQ0xLPiwKKwkJICAgICAgICAgPCZtbWNjIE9YSUxJ
Q1hfQUhCX0NMSz4sCisJCSAgICAgICAgIDwmbW1jYyBPWElMSUNYX0FYSV9DTEs+OworCQlvY21l
bSA9IDwmb2NtZW0+OworCQlwb3dlci1kb21haW5zID0gPCZtbWNjIE9YSUxJQ1hfR0RTQz47CisJ
CW9wZXJhdGluZy1wb2ludHMtdjIgPSA8JmdwdV9vcHBfdGFibGU+OworCQlpb21tdXMgPSA8Jmdw
dV9pb21tdSAwPjsKKwl9OworCisJb2NtZW06IG9jbWVtQGZkZDAwMDAwIHsKKwkJY29tcGF0aWJs
ZSA9ICJxY29tLG1zbTg5NzQtb2NtZW0iOworCisJCXJlZyA9IDwweGZkZDAwMDAwIDB4MjAwMD4s
CisJCSAgICAgIDwweGZlYzAwMDAwIDB4MTgwMDAwPjsKKwkJcmVnLW5hbWVzID0gImN0cmwiLAor
CQkgICAgICAgICAgICAgIm1lbSI7CisKKwkJY2xvY2tzID0gPCZycG1jYyBSUE1fU01EX09DTUVN
R1hfQ0xLPiwKKwkJICAgICAgICAgPCZtbWNjIE9DTUVNQ1hfT0NNRU1OT0NfQ0xLPjsKKwkJY2xv
Y2stbmFtZXMgPSAiY29yZSIsCisJCSAgICAgICAgICAgICAgImlmYWNlIjsKKworCQkjYWRkcmVz
cy1jZWxscyA9IDwxPjsKKwkJI3NpemUtY2VsbHMgPSA8MT47CisKKwkJZ211LXNyYW1AMCB7CisJ
CQlyZWcgPSA8MHgwIDB4MTAwMDAwPjsKKwkJfTsKKwl9OworfTsKLS0gCjIuMjEuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

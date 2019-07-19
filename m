Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 902926EF61
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2019 14:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFD66E899;
	Sat, 20 Jul 2019 12:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F156E807
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 10:19:14 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A66801A0046;
 Fri, 19 Jul 2019 12:19:13 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4AEA41A0159;
 Fri, 19 Jul 2019 12:19:09 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 1703A402E7;
 Fri, 19 Jul 2019 18:18:57 +0800 (SGT)
From: Wen He <wen.he_1@nxp.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
 robh+dt@kernel.org
Subject: [v2 4/4] arm64: ls1028aqds: Add support DP nodes for LS1028AQDS
Date: Fri, 19 Jul 2019 18:09:42 +0800
Message-Id: <20190719100942.12016-4-wen.he_1@nxp.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20190719100942.12016-1-wen.he_1@nxp.com>
References: <20190719100942.12016-1-wen.he_1@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Sat, 20 Jul 2019 12:51:43 +0000
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
Cc: Wen He <wen.he_1@nxp.com>, leoyang.li@nxp.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGQgSERQIFBIWSBDb250cm9sbGVyIHJlbGF0ZWQgbm9kZXMgb24gdGhlIExT
MTAyOEFRRFMuCgpTaWduZWQtb2ZmLWJ5OiBBbGlzb24gV2FuZyA8YWxpc29uLndhbmdAbnhwLmNv
bT4KU2lnbmVkLW9mZi1ieTogV2VuIEhlIDx3ZW4uaGVfMUBueHAuY29tPgotLS0KIGFyY2gvYXJt
NjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczEwMjhhLXFkcy5kdHMgfCAxMiArKysrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9h
cm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMTAyOGEtcWRzLmR0cyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczEwMjhhLXFkcy5kdHMKaW5kZXggZGU2ZWYzOWYzMTE4
Li5hOWFmNmU4YTY1MTcgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxl
L2ZzbC1sczEwMjhhLXFkcy5kdHMKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUv
ZnNsLWxzMTAyOGEtcWRzLmR0cwpAQCAtMTczLDMgKzE3MywxNSBAQAogJnNhdGEgewogCXN0YXR1
cyA9ICJva2F5IjsKIH07CisKKyZoZHB0eDAgeworCWZzbCxub19lZGlkOworCXJlc29sdXRpb24g
PSAiMzg0MHgyMTYwQDYwIiwKKwkJICAgIjE5MjB4MTA4MEA2MCIsCisJCSAgICIxMjgweDcyMEA2
MCIsCisJCSAgICI3MjB4NDgwQDYwIjsKKwlsYW5lX21hcHBpbmcgPSA8MHg0ZT47CisJZWRwX2xp
bmtfcmF0ZSA9IDwweDY+OworCWVkcF9udW1fbGFuZXMgPSA8MHg0PjsKKwlzdGF0dXMgPSAib2th
eSI7Cit9OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=

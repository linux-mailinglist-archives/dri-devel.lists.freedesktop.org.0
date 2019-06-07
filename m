Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAC93A5A2
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D9E8928D;
	Sun,  9 Jun 2019 12:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F43489D53
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 11:11:36 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pAwkq13LM="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.22 DYNA|AUTH)
 with ESMTPSA id i01b98v57BBFPaT
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Fri, 7 Jun 2019 13:11:15 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, tomi.valkeinen@ti.com,
 imirkin@alum.mit.edu, marek.belisko@gmail.com,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3 5/5] dt-bindings: drm/panel: simple: add sharp,
 lq070y3dg3b panel
Date: Fri,  7 Jun 2019 13:11:11 +0200
Message-Id: <ee90ed56d2c294ce8ac3b44bf2229c5ab9f85e91.1559905870.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1559905870.git.hns@goldelico.com>
References: <cover.1559905870.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1559905894; 
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=z2Lawv9tCJkbiMtjftVTXc595vid1xyVceWlHWvLNYs=;
 b=VBiBG0OlPCd5RABljbWAHdo0+XmliJM13PZq6XmdeafyRvgfL+Z0/Rumbv52/V12yI
 EdZq7eRXaWdmUDFwWUAhrx5VMVBFTTn9w59vTzEzubRzFBKto28Y3YtYa0WtqvitDOfw
 lSOpkLgNBpuM1Ojd+HDuvctkZvBkIEBGutxpERy1Gg3Sqveq/3b1wsakadObIFjUqufJ
 bhlSKSe5pbLRWcXvCGebNXgk+dCvtUMkdT0D1XOsLtgjDFWKiFljxksyL3K0IHA/L/vE
 EhIbVKU+VIfRreUPs+9IzyV5d2gMtwhoHLjE0gSFj6h/xNUIl4ksmfQvEmMvyzoX4yo4
 ++Iw==
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
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
 "H. Nikolaus Schaller" <hns@goldelico.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, letux-kernel@openphoenux.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogSC4gTmlrb2xhdXMgU2NoYWxsZXIgPGhuc0Bnb2xkZWxpY28uY29tPgot
LS0KIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3NoYXJwLGxxMDcweTNkZzNiLnR4dCAgICAg
fCAxMiArKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCiBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvc2hhcnAsbHEwNzB5M2RnM2IudHh0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc2hhcnAsbHEwNzB5M2RnM2IudHh0IGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvc2hhcnAsbHEw
NzB5M2RnM2IudHh0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uOTU1
MzRiNTVlZTVmCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvc2hhcnAsbHEwNzB5M2RnM2IudHh0CkBAIC0wLDAgKzEsMTIg
QEAKK1NoYXJwIExRMDcwWTNERzNCIDcuMCIgV1ZHQSBsYW5kc2NhcGUgVEZUIExDRCBwYW5lbAor
CitSZXF1aXJlZCBwcm9wZXJ0aWVzOgorLSBjb21wYXRpYmxlOiBzaG91bGQgYmUgInNoYXJwLGxx
MDcweTNkZzNiIgorCitPcHRpb25hbCBwcm9wZXJ0aWVzOgorLSBlbmFibGUtZ3Bpb3M6IEdQSU8g
cGluIHRvIGVuYWJsZSBvciBkaXNhYmxlIHRoZSBwYW5lbAorLSBiYWNrbGlnaHQ6IHBoYW5kbGUg
b2YgdGhlIGJhY2tsaWdodCBkZXZpY2UgYXR0YWNoZWQgdG8gdGhlIHBhbmVsCistIHBvd2VyLXN1
cHBseTogcGhhbmRsZSBvZiB0aGUgcmVndWxhdG9yIHRoYXQgcHJvdmlkZXMgdGhlIHN1cHBseSB2
b2x0YWdlCisKK1RoaXMgYmluZGluZyBpcyBjb21wYXRpYmxlIHdpdGggdGhlIHNpbXBsZS1wYW5l
bCBiaW5kaW5nLCB3aGljaCBpcyBzcGVjaWZpZWQKK2luIHNpbXBsZS1wYW5lbC50eHQgaW4gdGhp
cyBkaXJlY3RvcnkuCi0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==

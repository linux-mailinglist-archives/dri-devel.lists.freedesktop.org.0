Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E4986553
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 17:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907066E875;
	Thu,  8 Aug 2019 15:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6556E865
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 15:12:13 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8815D28CAD0;
 Thu,  8 Aug 2019 16:12:11 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RFC 19/19] ARM: dts: imx: imx51-zii-rdu1: Fix the display
 pipeline definition
Date: Thu,  8 Aug 2019 17:11:50 +0200
Message-Id: <20190808151150.16336-20-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190808151150.16336-1-boris.brezillon@collabora.com>
References: <20190808151150.16336-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGN1cnJlbnQgZGVmaW5pdGlvbiBkb2VzIG5vdCByZXByZXNlbnQgdGhlIGV4YWN0IGRpc3Bs
YXkgcGlwZWxpbmUgd2UKaGF2ZSBvbiB0aGUgYm9hcmQ6IHRoZSBMVkRTIHBhbmVsIGlzIGFjdHVh
bGx5IGNvbm5lY3RlZCB0aHJvdWdoIGEKcGFyYWxsZWwgLT4gTFZEUyBicmlkZ2UuIExldCdzIGZp
eCB0aGF0IHNvIHRoZSBkcml2ZXIgY2FuIHNlbGVjdCB0aGUKcHJvcGVyIGJ1cyBmb3JtYXQgb24g
dGhlIENSVEMgZW5kLgoKU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6
aWxsb25AY29sbGFib3JhLmNvbT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9pbXg1MS16aWktcmR1
MS5kdHMgfCAyNCArKysrKysrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3Qv
ZHRzL2lteDUxLXppaS1yZHUxLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDUxLXppaS1yZHUx
LmR0cwppbmRleCAzNTk2MDYwZjUyZTcuLmRiMDA2YTRkNDI1MCAxMDA2NDQKLS0tIGEvYXJjaC9h
cm0vYm9vdC9kdHMvaW14NTEtemlpLXJkdTEuZHRzCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lt
eDUxLXppaS1yZHUxLmR0cwpAQCAtOTUsMTEgKzk1LDMxIEBACiAJCQlyZWcgPSA8MT47CiAKIAkJ
CWRpc3BsYXlfb3V0OiBlbmRwb2ludCB7Ci0JCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZwYW5lbF9p
bj47CisJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZsdmRzX2VuY29kZXJfaW4+OwogCQkJfTsKIAkJ
fTsKIAl9OwogCisgICAgICAgIGx2ZHMtZW5jb2RlciB7CisgICAgICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJ0aSxzbjc1bHZkczgzIiwgImx2ZHMtZW5jb2RlciI7CisgICAgICAgICAgICAgICAg
I2FkZHJlc3MtY2VsbHMgPSA8MT47CisgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47
CisKKyAgICAgICAgICAgICAgICBwb3J0QDAgeworICAgICAgICAgICAgICAgICAgICAgICAgcmVn
ID0gPDA+OworICAgICAgICAgICAgICAgICAgICAgICAgbHZkc19lbmNvZGVyX2luOiBlbmRwb2lu
dCB7CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwm
ZGlzcGxheV9vdXQ+OworICAgICAgICAgICAgICAgICAgICAgICAgfTsKKyAgICAgICAgICAgICAg
ICB9OworCisgICAgICAgICAgICAgICAgcG9ydEAxIHsKKyAgICAgICAgICAgICAgICAgICAgICAg
IHJlZyA9IDwxPjsKKyAgICAgICAgICAgICAgICAgICAgICAgIGx2ZHNfZW5jb2Rlcl9vdXQ6IGVu
ZHBvaW50IHsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50
ID0gPCZwYW5lbF9pbj47CisgICAgICAgICAgICAgICAgICAgICAgICB9OworICAgICAgICAgICAg
ICAgIH07CisgICAgICAgIH07CisKIAlwYW5lbCB7CiAJCS8qIG5vIGNvbXBhdGlibGUgaGVyZSwg
Ym9vdGxvYWRlciB3aWxsIHBhdGNoIGluIGNvcnJlY3Qgb25lICovCiAJCXBpbmN0cmwtbmFtZXMg
PSAiZGVmYXVsdCI7CkBAIC0xMTAsNyArMTMwLDcgQEAKIAogCQlwb3J0IHsKIAkJCXBhbmVsX2lu
OiBlbmRwb2ludCB7Ci0JCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZkaXNwbGF5X291dD47CisJCQkJ
cmVtb3RlLWVuZHBvaW50ID0gPCZsdmRzX2VuY29kZXJfb3V0PjsKIAkJCX07CiAJCX07CiAJfTsK
LS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

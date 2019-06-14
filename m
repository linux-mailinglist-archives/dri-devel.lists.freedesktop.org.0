Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D30474EF
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FED891CA;
	Sun, 16 Jun 2019 14:01:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17968936B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 11:57:57 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id BD4B1200EA1;
 Fri, 14 Jun 2019 13:51:04 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id AF900200E9E;
 Fri, 14 Jun 2019 13:51:04 +0200 (CEST)
Received: from fsr-ub1664-046.ea.freescale.net
 (fsr-ub1664-046.ea.freescale.net [10.171.96.34])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 9A27720606;
 Fri, 14 Jun 2019 13:51:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by fsr-ub1664-046.ea.freescale.net (Postfix) with ESMTP id 67DA155AD;
 Fri, 14 Jun 2019 14:51:04 +0300 (EEST)
Received: from fsr-ub1664-046.ea.freescale.net ([127.0.0.1])
 by localhost (fsr-ub1664-046.ea.freescale.net [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id NgXw2_MzS-3i; Fri, 14 Jun 2019 14:51:04 +0300 (EEST)
Received: from localhost (localhost [127.0.0.1])
 by fsr-ub1664-046.ea.freescale.net (Postfix) with ESMTP id 050A055AF;
 Fri, 14 Jun 2019 14:51:04 +0300 (EEST)
X-Virus-Scanned: amavisd-new at ea.freescale.net
Received: from fsr-ub1664-046.ea.freescale.net ([127.0.0.1])
 by localhost (fsr-ub1664-046.ea.freescale.net [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id yF_fcMKFJFci; Fri, 14 Jun 2019 14:51:03 +0300 (EEST)
Received: from fsr-ub1664-120.ea.freescale.net
 (fsr-ub1664-120.ea.freescale.net [10.171.82.81])
 by fsr-ub1664-046.ea.freescale.net (Postfix) with ESMTP id C0B924D1D;
 Fri, 14 Jun 2019 14:51:03 +0300 (EEST)
From: Robert Chiras <robert.chiras@nxp.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 0/2] Add DSI panel driver for Raydium RM67191
Date: Fri, 14 Jun 2019 14:51:01 +0300
Message-Id: <1560513063-24995-1-git-send-email-robert.chiras@nxp.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
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
Cc: Robert Chiras <robert.chiras@nxp.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaC1zZXQgY29udGFpbnMgdGhlIERSTSBwYW5lbCBkcml2ZXIgYW5kIGR0LWJpbmRp
bmdzIGRvY3VtZW50YXRpb24KZm9yIHRoZSBEU0kgZHJpdmVuIHBhbmVsOiBSYXlkaXVtIFJNNjcx
OTEuCgpSb2JlcnQgQ2hpcmFzICgyKToKICBkdC1iaW5kaW5nczogZGlzcGxheTogcGFuZWw6IEFk
ZCBzdXBwb3J0IGZvciBSYXlkaXVtIFJNNjcxOTEgcGFuZWwKICBkcm0vcGFuZWw6IEFkZCBzdXBw
b3J0IGZvciBSYXlkaXVtIFJNNjcxOTEgcGFuZWwgZHJpdmVyCgogLi4uL2JpbmRpbmdzL2Rpc3Bs
YXkvcGFuZWwvcmF5ZGl1bSxybTY3MTkxLnR4dCAgICAgfCAgNDIgKysKIGRyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgICA5ICsKIGRyaXZlcnMvZ3B1
L2RybS9wYW5lbC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1yYXlkaXVtLXJtNjcxOTEuYyAgICAgIHwgNzMwICsrKysrKysr
KysrKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCA3ODIgaW5zZXJ0aW9ucygrKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Bh
bmVsL3JheWRpdW0scm02NzE5MS50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtcmF5ZGl1bS1ybTY3MTkxLmMKCi0tIAoyLjcuNAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C25AAA83D7
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 15:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BE1892CB;
	Wed,  4 Sep 2019 13:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75BE892CB
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 13:37:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (mobile-access-bceeb5-228.dhcp.inet.fi [188.238.181.228])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E6C3A440;
 Wed,  4 Sep 2019 15:37:31 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/2] drm/panel: panel-simple: Set OSD070T1718 panel type
Date: Wed,  4 Sep 2019 16:37:23 +0300
Message-Id: <20190904133723.30418-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190904132804.29680-1-laurent.pinchart@ideasonboard.com>
References: <20190904132804.29680-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1567604252;
 bh=fH68X5KVGNzS3BX2VJ8RuyK6mW5XbHM9UcK12bhwdso=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EqfW3RnyVe10rWT8d/9GnwjM31kLLbyRHFWO94EN0McfTCZ4BZX+lkyCuxaG1/XWO
 HvmgyIdvKfZQet2FLMpE4b/UlHtumL1mfuSsAHpuXAefzRpowqKUkGo1WHDPDt1PkL
 g7yCdS7J14V+oCEn5yYBCAIjPVgQM1Hglc14NQug=
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIE9TRDA3MFQxNzE4IGlzIGEgRFBJIHBhbmVsLCBzZXQgaXRzIHR5cGUgYWNjb3JkaW5nbHku
CgpTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFz
b25ib2FyZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIHwg
MSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFu
ZWwtc2ltcGxlLmMKaW5kZXggNGI5MmIyN2ViYTg2Li41ZDQ4NzY4NmQyNWMgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKQEAgLTIzOTgsNiArMjM5OCw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgcGFuZWxfZGVzYyBvc2RkaXNwbGF5c19vc2QwNzB0MTcxOF8xOXRzID0gewogCX0s
CiAJLmJ1c19mb3JtYXQgPSBNRURJQV9CVVNfRk1UX1JHQjg4OF8xWDI0LAogCS5idXNfZmxhZ3Mg
PSBEUk1fQlVTX0ZMQUdfREVfSElHSCB8IERSTV9CVVNfRkxBR19QSVhEQVRBX0RSSVZFX1BPU0VE
R0UsCisJLmNvbm5lY3Rvcl90eXBlID0gRFJNX01PREVfQ09OTkVDVE9SX0RQSSwKIH07CiAKIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBwZGFfOTFfMDAxNTZfYTBfbW9kZSA9
IHsKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

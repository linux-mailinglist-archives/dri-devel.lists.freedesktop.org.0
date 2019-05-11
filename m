Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A14DD1A990
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2019 23:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E15789AEA;
	Sat, 11 May 2019 21:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1EE89AC2
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2019 21:07:39 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E40989F9;
 Sat, 11 May 2019 23:07:34 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 08/10] arm64: dts: renesas: r8a7799[05]: Point LVDS0 to its
 companion LVDS1
Date: Sun, 12 May 2019 00:07:00 +0300
Message-Id: <20190511210702.18394-9-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1557608855;
 bh=1B7dAooCfZpIkl+dK29uGYb9y0qALr5WKOWOQ2/nL+M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p3ns6Do9pj/WAIEMvZK2n+fuNMkt4x5nyX//mrN7C71aBGjsCRMzXZ6zWX8wCgqYU
 SF4kZJFaFpmfNStXG3CABEsKFsWKeVQ17znfQ46oy1Q4039KOIFI9LCwxehCwA+Sub
 kkWBc59NIb5cyTDpccDMSXtKTqHaHwwiEaOjInlI=
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHRoZSBuZXcgcmVuZXNhcyxjb21wYW5pb24gcHJvcGVydHkgdG8gdGhlIExWRFMwIG5vZGUg
dG8gcG9pbnQgdG8gdGhlCmNvbXBhbmlvbiBMVkRTIGVuY29kZXIgTFZEUzEuCgpTaWduZWQtb2Zm
LWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJv
YXJkLmNvbT4KLS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTAuZHRzaSB8
IDIgKysKIGFyY2gvYXJtNjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3Nzk5NS5kdHNpIHwgMiArKwog
MiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0
L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTAuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcmVu
ZXNhcy9yOGE3Nzk5MC5kdHNpCmluZGV4IGQyYWQ2NjVmZTJkOS4uYjUyZTNmZGI1ZmNhIDEwMDY0
NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTAuZHRzaQorKysgYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTAuZHRzaQpAQCAtMTczMSw2ICsxNzMx
LDggQEAKIAkJCXJlc2V0cyA9IDwmY3BnIDcyNz47CiAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwog
CisJCQlyZW5lc2FzLGNvbXBhbmlvbiA9IDwmbHZkczE+OworCiAJCQlwb3J0cyB7CiAJCQkJI2Fk
ZHJlc3MtY2VsbHMgPSA8MT47CiAJCQkJI3NpemUtY2VsbHMgPSA8MD47CmRpZmYgLS1naXQgYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTUuZHRzaSBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvcmVuZXNhcy9yOGE3Nzk5NS5kdHNpCmluZGV4IDViZjNhZjI0NmUxNC4uOTRiNTE3N2Vi
MTUyIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTUuZHRz
aQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5OTUuZHRzaQpAQCAtMTAz
OCw2ICsxMDM4LDggQEAKIAkJCXJlc2V0cyA9IDwmY3BnIDcyNz47CiAJCQlzdGF0dXMgPSAiZGlz
YWJsZWQiOwogCisJCQlyZW5lc2FzLGNvbXBhbmlvbiA9IDwmbHZkczE+OworCiAJCQlwb3J0cyB7
CiAJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CiAJCQkJI3NpemUtY2VsbHMgPSA8MD47Ci0tIApS
ZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CA06DB48
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 06:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2026F6E54C;
	Fri, 19 Jul 2019 04:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC366E550;
 Fri, 19 Jul 2019 04:08:36 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C9DA218BB;
 Fri, 19 Jul 2019 04:08:34 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 029/101] drm/amd/display: fix compilation error
Date: Fri, 19 Jul 2019 00:06:20 -0400
Message-Id: <20190719040732.17285-29-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719040732.17285-1-sashal@kernel.org>
References: <20190719040732.17285-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563509315;
 bh=wkULyQRXP14aeC86+dGvNKwqYMCKi3U5/yIPxp27Dnk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h6USihHqa99FS9VOVKiBn2213ggTjStitWGlQdweiQOQGidycv19/8ca7B3BhePmg
 9C+LyF1yAQYVmwE3JIP5Tcw4WJFaeBIeslFF7irF84WAPR+yIk/SjUIJkMhrsiF/C7
 +0sVT1YzYGbywyW0OdOsASvJ/jTEA14BUMoSZ3aM=
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Hariprasad Kelam <hariprasad.kelam@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSGFyaXByYXNhZCBLZWxhbSA8aGFyaXByYXNhZC5rZWxhbUBnbWFpbC5jb20+CgpbIFVw
c3RyZWFtIGNvbW1pdCA4ODA5OWY1M2NjMzcxNzQzN2Y1ZmM5Y2Y4NDIwNWM1YjY1MTE4Mzc3IF0K
CnRoaXMgcGF0Y2ggZml4ZXMgYmVsb3cgY29tcGlsYXRpb24gZXJyb3IKCmRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2VyLmM6IElu
CmZ1bmN0aW9uIOKAmGRjbjEwX2FwcGx5X2N0eF9mb3Jfc3VyZmFjZeKAmToKZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYzoy
Mzc4OjM6CmVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJh1ZGVsYXni
gJkKWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCiAgIHVkZWxheSh1bmRl
cmZsb3dfY2hlY2tfZGVsYXlfdXMpOwoKU2lnbmVkLW9mZi1ieTogSGFyaXByYXNhZCBLZWxhbSA8
aGFyaXByYXNhZC5rZWxhbUBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNh
c2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24x
MC9kY24xMF9od19zZXF1ZW5jZXIuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2Rj
bjEwX2h3X3NlcXVlbmNlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEw
L2RjbjEwX2h3X3NlcXVlbmNlci5jCmluZGV4IDc3MzZlZjEyM2U5Yi4uZWFkMjIxY2NiOTNlIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdf
c2VxdWVuY2VyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2Rj
bjEwX2h3X3NlcXVlbmNlci5jCkBAIC0yMyw2ICsyMyw3IEBACiAgKgogICovCiAKKyNpbmNsdWRl
IDxsaW51eC9kZWxheS5oPgogI2luY2x1ZGUgImRtX3NlcnZpY2VzLmgiCiAjaW5jbHVkZSAiY29y
ZV90eXBlcy5oIgogI2luY2x1ZGUgInJlc291cmNlLmgiCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

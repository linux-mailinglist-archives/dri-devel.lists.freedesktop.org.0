Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 037646DAAC
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 06:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AE06E507;
	Fri, 19 Jul 2019 04:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D13A6E4F1;
 Fri, 19 Jul 2019 04:03:42 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 68EAC21852;
 Fri, 19 Jul 2019 04:03:41 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 026/141] drm/amd/display: CS_TFM_1D only applied
 post EOTF
Date: Fri, 19 Jul 2019 00:00:51 -0400
Message-Id: <20190719040246.15945-26-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719040246.15945-1-sashal@kernel.org>
References: <20190719040246.15945-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563509022;
 bh=z+8JcC18Jtyh8uyT6UA2/SC24y/hq7VVcY9YA+weTuk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=INrLGGr2tGkPMzWCVfW7IZQSnJU5FvkBcFX9Nte5umu6BFp+VEIN2YQGAz8wO7cgv
 ePq7jHIb6y/cKRpuje6CSfISwfmptNgxsQM+1c5+8yU8hTPoOIPsWcWBBMS/GtFJNy
 6XywLBdArfldITTMQ3+ljyFF5Z6owR05i8aNZlVo=
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
Cc: Sasha Levin <sashal@kernel.org>, Krunoslav Kovac <Krunoslav.Kovac@amd.com>,
 Leo Li <sunpeng.li@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogS3J1bm9zbGF2IEtvdmFjIDxLcnVub3NsYXYuS292YWNAYW1kLmNvbT4KClsgVXBzdHJl
YW0gY29tbWl0IDZhZDM0YWRlYWVjNWI1NmE1YmE5MGU5MDA5OWNhYmYxYzFmZTlkZDIgXQoKW1do
eV0KVGhlcmUncyBzb21lIHVubmVjZXNzYXJ5IG1lbSBhbGxvY2F0aW9uIGZvciBDU19URk1fSUQu
IFdoYXQncyB3b3JzZSwgaXQKZGVwZW5kcyBvbiBMVVQgc2l6ZSBhbmQgc2luY2UgaXQncyA0SyBm
b3IgQ1NfVEZNXzFELCBpdCBpcyAxNnggYmlnZ2VyCnRoYW4gaW4gcmVndWxhciBjYXNlIHdoZW4g
aXQncyBhY3R1YWxseSBuZWVkZWQuIFRoaXMgbGVhZHMgdG8gc29tZQpjcmFzaGVzIGluIHN0cmVz
cyBjb25kaXRpb25zLgoKW0hvd10KU2tpcCByYW1wIGNvbWJpbmluZyBkZXNpZ25lZCBmb3IgUkdC
MjU2IGFuZCBEWEdJIGdhbW1hIHdpdGggQ1NfVEZNXzFELgoKU2lnbmVkLW9mZi1ieTogS3J1bm9z
bGF2IEtvdmFjIDxLcnVub3NsYXYuS292YWNAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFyaWMgQ3ly
IDxBcmljLkN5ckBhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
U2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2NvbG9yL2NvbG9yX2dhbW1hLmMgfCAzICsr
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2NvbG9yL2NvbG9yX2dh
bW1hLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9jb2xvci9jb2xvcl9n
YW1tYS5jCmluZGV4IGExMDU1NDEzYmFkZS4uMzFmODY3YmI1YWZlIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9jb2xvci9jb2xvcl9nYW1tYS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2NvbG9yL2NvbG9yX2dhbW1hLmMK
QEAgLTE1NjQsNyArMTU2NCw4IEBAIGJvb2wgbW9kX2NvbG9yX2NhbGN1bGF0ZV9yZWdhbW1hX3Bh
cmFtcyhzdHJ1Y3QgZGNfdHJhbnNmZXJfZnVuYyAqb3V0cHV0X3RmLAogCiAJb3V0cHV0X3RmLT50
eXBlID0gVEZfVFlQRV9ESVNUUklCVVRFRF9QT0lOVFM7CiAKLQlpZiAocmFtcCAmJiAobWFwVXNl
clJhbXAgfHwgcmFtcC0+dHlwZSAhPSBHQU1NQV9SR0JfMjU2KSkgeworCWlmIChyYW1wICYmIHJh
bXAtPnR5cGUgIT0gR0FNTUFfQ1NfVEZNXzFEICYmCisJCQkobWFwVXNlclJhbXAgfHwgcmFtcC0+
dHlwZSAhPSBHQU1NQV9SR0JfMjU2KSkgewogCQlyZ2JfdXNlciA9IGt2Y2FsbG9jKHJhbXAtPm51
bV9lbnRyaWVzICsgX0VYVFJBX1BPSU5UUywKIAkJCSAgICBzaXplb2YoKnJnYl91c2VyKSwKIAkJ
CSAgICBHRlBfS0VSTkVMKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A028DF7FEA
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 20:30:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C6C6E283;
	Mon, 11 Nov 2019 19:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E673B6E283;
 Mon, 11 Nov 2019 19:30:02 +0000 (UTC)
Received: from localhost (unknown [69.71.4.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 470262184C;
 Mon, 11 Nov 2019 19:30:02 +0000 (UTC)
From: Bjorn Helgaas <helgaas@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/2] drm: replace magic numbers
Date: Mon, 11 Nov 2019 13:29:30 -0600
Message-Id: <20191111192932.36048-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573500602;
 bh=/6YuVyX8+CxUq2e6F7e9g+b1C2bSx1WCkr5GbVkW9Xs=;
 h=From:To:Cc:Subject:Date:From;
 b=fafL6OYNK8Cw8CWPDakiGzTnD86oWHwarGqqueP7zWkIWHFcNjlv+Fci1aHuu0ScV
 QguxNMhurKQ9ijInqiaCmj6OtVdZqV1SezT7oUD7gJCGRrmyVaijA9KRDnqiTmwzjv
 EevmB60AD22bc6aZKsGIhqfoxEZOiV2xQKazGwn4=
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
Cc: Frederick Lawler <fred@fredlawl.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmpvcm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KCmFtZGdwdSBhbmQgcmFk
ZW9uIGRvIGEgYml0IG9mIG11Y2tpbmcgd2l0aCB0aGUgUENJZSBMaW5rIENvbnRyb2wgMgpyZWdp
c3Rlciwgc29tZSBvZiBpdCB1c2luZyBoYXJkLWNvZGVkIG1hZ2ljIG51bWJlcnMuICBUaGUgaWRl
YSBoZXJlIGlzIHRvCnJlcGxhY2UgdGhvc2Ugd2l0aCAjZGVmaW5lcy4KCkkgZG9uJ3QgaW50ZW5k
IHRoZSBUYXJnZXQgTGluayBTcGVlZCBwYXRjaCB0byBjaGFuZ2UgYW55dGhpbmcsIHNvIGl0IHNo
b3VsZApiZSBzdHJhaWdodGZvcndhcmQgdG8gcmV2aWV3LgoKU2luY2UgdjE6CiAgLSBBZGQgbXkg
c2lnbmVkLW9mZi1ieSBhbmQgQWxleCdzIHJldmlld2VkLWJ5LgoKQmpvcm4gSGVsZ2FhcyAoMik6
CiAgZHJtOiByZXBsYWNlIGluY29ycmVjdCBDb21wbGlhbmNlL01hcmdpbiBtYWdpYyBudW1iZXJz
IHdpdGgKICAgIFBDSV9FWFBfTE5LQ1RMMiBkZWZpbml0aW9ucwogIGRybTogcmVwbGFjZSBUYXJn
ZXQgTGluayBTcGVlZCBtYWdpYyBudW1iZXJzIHdpdGggUENJX0VYUF9MTktDVEwyCiAgICBkZWZp
bml0aW9ucwoKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Npay5jIHwgMjIgKysrKysrKysr
KysrKystLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2kuYyAgfCAxOCArKysr
KysrKysrKy0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmMgICAgIHwgMjIgKysr
KysrKysrKysrKystLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaS5jICAgICAgfCAy
MiArKysrKysrKysrKysrKy0tLS0tLS0tCiBpbmNsdWRlL3VhcGkvbGludXgvcGNpX3JlZ3MuaCAg
ICB8ICAyICsrCiA1IGZpbGVzIGNoYW5nZWQsIDU1IGluc2VydGlvbnMoKyksIDMxIGRlbGV0aW9u
cygtKQoKLS0gCjIuMjQuMC5yYzEuMzYzLmdiMWJjY2QzZTNkLWdvb2cKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

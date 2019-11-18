Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A94101AFF
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B9F6EC07;
	Tue, 19 Nov 2019 08:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF916E483
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 11:40:11 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id o14so1416033pjr.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 03:40:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UKlXFmsyCCcDDwPIPUpIzSPGgE4nu5epjuY/dy6jNM4=;
 b=tKlRokIAmudn043PPUIOEecCUc3QxLvBbXE/PmcgH9DY0Krx4rFTljPtOLr8wUnuMz
 Lj/XP+MeF77P9Txh/lqqChZAJKk6adobiUwaclZB9XE1HkLLlBHkKOr2e7g7JgqGBv3R
 2vDtVgbbh5eNXUPAIBE6+EyxodIPLSL7sRW6aSp2RCS5JQ00A4Ug9+m0fEB54jGTF6fL
 i25NukJNtdl8oPJg4+2gH4y7VetJvM92pPVzUZgymdcO95nNo6rEtfIbsPxVEhc049L4
 WI/fTk4HvbK00vnNrBjpgWZ7/IJuQVUvkTHtfJiGUJE9ihY51Ea6vDQc9DTuyXTleXj3
 AVPQ==
X-Gm-Message-State: APjAAAVw7JiYlUiFOYAlicb2eTN+4i2Te56KFqep0FDKdG23nphwb8NI
 czC7VZR4XcZWbeBjI5fRcfY=
X-Google-Smtp-Source: APXvYqyn0Lsr2kVbd6T3MWbNxpcGTpsIQ/Ohr+Rq2gUm+qBRKnowv1C9yHHyvWVJjkkaPpH71dqLLw==
X-Received: by 2002:a17:90a:9741:: with SMTP id
 i1mr39483570pjw.41.1574077211147; 
 Mon, 18 Nov 2019 03:40:11 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id l21sm17515128pjt.28.2019.11.18.03.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 03:40:10 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] drm/exynos: gsc: add missed component_del
Date: Mon, 18 Nov 2019 19:39:55 +0800
Message-Id: <20191118113955.25373-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UKlXFmsyCCcDDwPIPUpIzSPGgE4nu5epjuY/dy6jNM4=;
 b=ROuGzm4jkxrXQOcqLXKOOHwYgxDKwtdPl3VFO5rmmHsV1yBi4P8YFqizjyeHwzceSm
 NTwkx2EPcWAlt2MSDtu17OAdb9h1kHTZ2fFPvUFN3W+rvpe1WKWpC/YvImORx4Lx3UfP
 +zvyMSMsSqHOJhHMxRmHZT+A5r9rvh+R36tPkhcC86rtI9t7T00B2X5ftPl0q/uk9dTG
 9tGWjvKyI0dNVhq8TBFPW3wSqvoU9FiyDXk81jWxks+VNiz8/bvtINGEwtZMFGUliW6E
 MmRoh/81FIXROovu5KFBZF1PaD7Y0i4NZTpMOQ6AfJo8pAwK5xYlYPfXylyBF3coPa5q
 JEiw==
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
Cc: linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Chuhong Yuan <hslester96@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRyaXZlciBmb3JnZXRzIHRvIGNhbGwgY29tcG9uZW50X2RlbCBpbiByZW1vdmUgdG8gbWF0
Y2ggY29tcG9uZW50X2FkZAppbiBwcm9iZS4KQWRkIHRoZSBtaXNzZWQgY2FsbCB0byBmaXggaXQu
CgpTaWduZWQtb2ZmLWJ5OiBDaHVob25nIFl1YW4gPGhzbGVzdGVyOTZAZ21haWwuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nc2MuYyB8IDEgKwogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5v
cy9leHlub3NfZHJtX2dzYy5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dz
Yy5jCmluZGV4IDdhZTA4N2IwNTA0ZC4uODhiNmZjYWEyMGJlIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ3NjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4
eW5vcy9leHlub3NfZHJtX2dzYy5jCkBAIC0xMzEzLDYgKzEzMTMsNyBAQCBzdGF0aWMgaW50IGdz
Y19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgZGV2aWNl
ICpkZXYgPSAmcGRldi0+ZGV2OwogCisJY29tcG9uZW50X2RlbChkZXYsICZnc2NfY29tcG9uZW50
X29wcyk7CiAJcG1fcnVudGltZV9kb250X3VzZV9hdXRvc3VzcGVuZChkZXYpOwogCXBtX3J1bnRp
bWVfZGlzYWJsZShkZXYpOwogCi0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==

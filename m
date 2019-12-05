Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3BB114D65
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 09:18:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E13C6EB8B;
	Fri,  6 Dec 2019 08:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E3A6E988
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 16:05:35 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id w7so1416027plz.12
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 08:05:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UKlXFmsyCCcDDwPIPUpIzSPGgE4nu5epjuY/dy6jNM4=;
 b=KWrMOBImZObZCdJpXS0oy5nc7K1K9Z5LcZx4sD2H7AZz+EPjKWIUjRSykRs49ICZVi
 bco0mDm/0uRBbI9T9EI/Etqyd2An2y/ChoXmAIqCuNCEbg8apdigiXk4SF0Tzz7a7vp7
 UQv6KhtGLY79V7u/IrAYmZMyrfmDr9d3T87y208QHXX7psu6wPbfGvV3DQgS1xYKA+mZ
 2IjFvDTIhE1wKw0Akuh5oTaUqbeUgWBWO8GNCVWSQeNSjIlhJaZWVBcrRIqRmohZJ/Wy
 /bdMRQa4MUBW5Qpbe6vAJaHmWwrL406Y3WtjUEbwkQNzMucmE6Jzv4rQKaA5OlRJttRT
 exlQ==
X-Gm-Message-State: APjAAAUN6NzodNtvV0ys31naI557kgPfzUB8W8f7V2SeVdF72PvLOYgw
 UGDxSsTENWer6dgLOnycyGuZXWNd
X-Google-Smtp-Source: APXvYqyg6jDDIuUjk0ppe+Py08NjE/qtzDD1oo0Tm7cVTE7k/KaRbCfv99/ONFToupOaJS3e3I5RMw==
X-Received: by 2002:a17:902:bb83:: with SMTP id
 m3mr9424484pls.94.1575561934927; 
 Thu, 05 Dec 2019 08:05:34 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id b2sm13229869pff.6.2019.12.05.08.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 08:05:34 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH resend] drm/exynos: gsc: add missed component_del
Date: Fri,  6 Dec 2019 00:05:20 +0800
Message-Id: <20191205160520.31955-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Dec 2019 08:17:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UKlXFmsyCCcDDwPIPUpIzSPGgE4nu5epjuY/dy6jNM4=;
 b=nazofESih7AXvfwNZmyfhH0uQR3YVRvZN2HjlxMs6kzxGlLd7vjEgyDgq2QKlLD9qm
 HegcL1lC8G4DghBfGBWCM2AeXXNK+XSWTbIcJ+Vi+CQ4f+xakpNN9p/bSCYyRNUMvWDa
 tHrFvhdjoSmH7UhcqLfGN/0+9G/k18RkB7bmI3lxPtNtJozmq8fv9+Kl6S6b5My5Su5V
 O2yvei4BgLjTbtnOPUslo8F1w2Xj+ao5bVUEj78KNq6EG7niaoQgsRQmL75lAzW/+jcG
 phxjFgczueN+Pmwyd/tT7G1VYS1hyD7DufECR5GxWgmD4ODqTTZq57h4oPlmAN4RofC6
 d/Cw==
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

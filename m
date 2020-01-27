Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4390F14B0EB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 09:36:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A9D6ED0A;
	Tue, 28 Jan 2020 08:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFB16EBB6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 14:07:37 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id gv17so3163367pjb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 06:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0GNKW4dAwC2IPC8DrYUW50WkaWvnguz2WhfJNZ54dek=;
 b=rwhr13/HrBEf9QNvCTpsZTGUEvrogC0nV4FkwsdlXPtdykUvBfZeU/7Z+Zjf5A/k1x
 vXrOocthoKZrdQaVO9zcsMwtnesNllpddSrLBnxB+ga1sFr2O1TMn+LhNuTosAxVgiv2
 20EmndfmZ3wF+weTulUTurBQgD6BRAxAPYWaZwich0nYbqn++i30saeQ8o7s4a8nn3KK
 StTgtK2C+cEYxbaSTz1CSR6hQmvIx0FMrpGuyB0of0WhiKxyrdBTFek8Bl9xPEVNWJFm
 8OlpyyKhpLslGqG0mWgQEM8wh/wgtqUJax+o3zZRUZuRYq2vB6mpvcSpntbfL7GxJRO2
 y2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0GNKW4dAwC2IPC8DrYUW50WkaWvnguz2WhfJNZ54dek=;
 b=FOnQiBnLdwzoa77vk5Yff4RZxKp0bBjQns/du7dOF8ocibTqyJ933/yiXZBfhjOcc8
 XmxPo4SccezAHhHeia5G+owa3Me6urFc2R/p1/rdR8ulKbtBe5zKJL2AjaSBSEN30HjW
 ebWn2ZflW6SPCbgnu/vphSTuCxbcw/3jFYgKX0kS7iTTZG243A+mETDtygattEvrKxAo
 l2McsCOlfE6IPMxH4gSl33NNCGttgxbqvzCSeVfLagqngm7KfT//2A9xAGiW4mDpV/F+
 n/0FIuGxqk9DVa3PnOaiLDlIdhvVYkCOA5xYogxG9o648uWjw2pXlXiI6ZnSgPz0siJR
 N8tQ==
X-Gm-Message-State: APjAAAXwtz2J2a+/8QNGH/D+MNzbBjXEru1u5fuJQdLn9UTGSb7o4wID
 vGQlEFFUQrQ8hcocofD+GUVaUAdH4fQBPQ==
X-Google-Smtp-Source: APXvYqzBRYAxDsGrgyOKBpShwFV/wANY+piTn7TwHNOttnXNFt9T76smOWQZxc4dJe0zlfwMm/nYfw==
X-Received: by 2002:a17:902:265:: with SMTP id
 92mr16479330plc.188.1580134056768; 
 Mon, 27 Jan 2020 06:07:36 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d809:ffa6:583:2633:933c:f34d])
 by smtp.gmail.com with ESMTPSA id
 l2sm16016167pjt.31.2020.01.27.06.07.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 Jan 2020 06:07:36 -0800 (PST)
From: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To: noralf@tronnes.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 1/3] dt-bindings: add vendor prefix for OzzMaker and
 Waveshare Electronics
Date: Mon, 27 Jan 2020 19:37:05 +0530
Message-Id: <aa8799c4164b54fa5c4ca55e48966d7b61352c2c.1580133212.git.kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1580133211.git.kamlesh.gurudasani@gmail.com>
References: <cover.1580133211.git.kamlesh.gurudasani@gmail.com>
X-Mailman-Approved-At: Tue, 28 Jan 2020 08:36:33 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add vendor prefix for OzzMaker [1] and Waveshare Electronics [2]
Both are display manufacturers

[1] https://ozzmaker.com/about/
[2] https://www.waveshare.com/contact_us

Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ac4804d..dfb926d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -721,6 +721,8 @@ patternProperties:
     description: OmniVision Technologies
   "^oxsemi,.*":
     description: Oxford Semiconductor, Ltd.
+  "^ozzmaker,.*":
+    description: OzzMaker
   "^panasonic,.*":
     description: Panasonic Corporation
   "^parade,.*":
@@ -1038,6 +1040,8 @@ patternProperties:
     description: Vision Optical Technology Co., Ltd.
   "^vxt,.*":
     description: VXT Ltd
+  "^waveshare,.*":
+    description: Waveshare Electronics
   "^wd,.*":
     description: Western Digital Corp.
   "^wetek,.*":
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

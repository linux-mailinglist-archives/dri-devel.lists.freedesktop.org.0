Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9A714B0ED
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 09:36:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F146ED0F;
	Tue, 28 Jan 2020 08:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103D56E4D7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 14:25:43 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id a6so3014231pjh.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 06:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0GNKW4dAwC2IPC8DrYUW50WkaWvnguz2WhfJNZ54dek=;
 b=H0pDaIKUY3LIPy4nvspAzrrnoJE0u0o82gQlr2lz8J1fSbwCMtb84vUC9YWHnD2qyH
 P14GY7v2yR/1aDRmaTO1SH0EgQ9eQ6oDFf5RJ2E6vKH0WLBVRKOKXOzM9o6svE7+0wre
 CAHrYzzXtQEBpgQoLjRYVxAOlMJ3JTX2juz9mkBb6uwaMDHOZj/jLeAr+5vC8bNAjTlm
 2JCGxOWJ+xidKTzHPi+fzi1iCOrIpc/cFqKgweeTRK58z3paoMDVvBYRN5W5C4L9Oaun
 LAtOBADISYYG/WDne+srhxcusfupoYrSGvZ0diZ0bqMMfOlSvBHXOwwri61DNJ7SXxcw
 +qAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0GNKW4dAwC2IPC8DrYUW50WkaWvnguz2WhfJNZ54dek=;
 b=hXDDYOWCdL8k08Nh7PB+jJRa4aN3/rHjkXFUsM/hPtBo4jg6IPRCYdmR4+gzGajwMW
 stEKRc8DzggvjATQ7ejI4RZVmIX2ZtafiaLkGGY5OMI22psSFWh3E/spnWeVtmhpqEG7
 +OnLeP27zSjQ81kEUpVzTZ3VQgYG9tU1lDkaWcV7oQigN5ijyT5DCCSb/7PqKleeBq5G
 AiMbg4F6DWyH4NlS6nK9Pg1NOdycVhYNldDBl3zzzGa420qig/PznZHqpgwgFe7vp4Vi
 mBrSurpoWr9uJ7m/MM3y2LQk7d00w0hkMb8pKW1TDes6p0KuPmgsq90HX+UmLiZjze0g
 2NHg==
X-Gm-Message-State: APjAAAUqHJnAkqXew4nVAG+GDLo6prylnUMEYIwKlJeHHkoKY/Sw3wfo
 sgoRe18uGyaSMlBXYT6X7V3v/bZ+YKfRkA==
X-Google-Smtp-Source: APXvYqz0Q5j3nM/3shrUkC76OHHxyHL8sPHjxQLfQxghJE26Ql4TSTpUVw0xQoFLL54nRDhxPIHr2Q==
X-Received: by 2002:a17:902:7484:: with SMTP id
 h4mr17320821pll.206.1580135142694; 
 Mon, 27 Jan 2020 06:25:42 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d809:ffa6:583:2633:933c:f34d])
 by smtp.gmail.com with ESMTPSA id
 k12sm15811506pgm.65.2020.01.27.06.25.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 Jan 2020 06:25:42 -0800 (PST)
From: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To: noralf@tronnes.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v4 1/3] dt-bindings: add vendor prefix for OzzMaker and
 Waveshare Electronics
Date: Mon, 27 Jan 2020 19:55:33 +0530
Message-Id: <aa8799c4164b54fa5c4ca55e48966d7b61352c2c.1580134320.git.kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1580134320.git.kamlesh.gurudasani@gmail.com>
References: <cover.1580134320.git.kamlesh.gurudasani@gmail.com>
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

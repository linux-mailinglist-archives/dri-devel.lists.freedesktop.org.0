Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B827E4C14C5
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 14:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6051E10F1C1;
	Wed, 23 Feb 2022 13:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D5A10E240
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 10:50:48 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id cm8so33887346edb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 02:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=timesys-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GQkcv0FBlLZrWZbu8HeqgB4QGKFRh7/F9RKe9Z+VHUA=;
 b=yiaVLcLQPPIlbQYkFLlDXK3uaQ5BuJ+lGwEJn1Du5UIebYOxrflRpvfM2Za1hrJVgy
 zWKNjG7Zeog0I6vCrnb2BML7B/w4DArfN0xN3uNHeREZyk+6G6wcv/Lye1pHfAYi75H6
 0RtRF41AwjxECPUEyLs5DfZm/We6GeXLcgzEcuE9qy0hvX8L94bjHiTDQlOV+pEOiK92
 kNG7MEITfOJCXASsRsrnPdXqNco+1OSkvqmJ6qwXTsaCJy2e5SZr46pcpgVf9Rgr0V/h
 h0xmdxSXjMs+o9Js4V/+8aGU78/6hJ3Lf6P+DrMBBv2b7VumgMIEEo6TKBjnmuDFM/MS
 GIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GQkcv0FBlLZrWZbu8HeqgB4QGKFRh7/F9RKe9Z+VHUA=;
 b=kTVMdMdf9tp9xa7PI2Fb2azSo+kDU6WwvOgn7Ne6Sf2SAKlcD1fUVyKWIY17pX0N2a
 g548sU+sPtWVPznvj1xmvd8uXg3feqrb7yIuhKWsMVNAM10J613NFSm+i8bTd0lK5fBF
 toKGhqktxYwKPg/wC1HU7/c4zA6vnrXVWLdGvu9GMltODoF397lKGE8PsZ+qPQjpb8/a
 u0XBKMq1NnaWVHVwEXPkczB9NIKX5kGeLw7u1TQSq2BqTPPR2FWOq+5Xf3rCabQdywrq
 KkpW7USjj2z3SGbd49JEyfFVB1GDSd14G7vCBu/8sWZtrATaZnGq8BRj4qzBVlXBNKN3
 yUhg==
X-Gm-Message-State: AOAM5317OkpQgtDy7ScZWFJMZFKEBuZuGl3Zvv4ThyVQzKMMg8PRsYk4
 r2+aQ+I/LEzC5nRgoMfqev5D6g==
X-Google-Smtp-Source: ABdhPJzIwW7AbJXAgO5SuO32Yeqxi2KLict1hvsSBtNuzv9uWi1+Vak2I65R6qFGKv81Wy2sSf9U+A==
X-Received: by 2002:a05:6402:42d4:b0:412:c26b:789 with SMTP id
 i20-20020a05640242d400b00412c26b0789mr25444497edc.232.1645613447392; 
 Wed, 23 Feb 2022 02:50:47 -0800 (PST)
Received: from localhost.localdomain
 (host-79-40-238-223.business.telecomitalia.it. [79.40.238.223])
 by smtp.gmail.com with ESMTPSA id m7sm6353079eds.104.2022.02.23.02.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 02:50:46 -0800 (PST)
From: Angelo Dureghello <angelo.dureghello@timesys.com>
To: tomba@kernel.org
Subject: [PATCH] dt-bindings: display/ti: remove ti,hwmods property
Date: Wed, 23 Feb 2022 11:50:28 +0100
Message-Id: <20220223105028.3340037-1-angelo.dureghello@timesys.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 23 Feb 2022 13:51:45 +0000
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
Cc: Angelo Dureghello <angelo.dureghello@timesys.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove ti,hwmods from required properties, since the
target-module approach is actually used.

Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
---
 Documentation/devicetree/bindings/display/ti/ti,dra7-dss.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,dra7-dss.txt b/Documentation/devicetree/bindings/display/ti/ti,dra7-dss.txt
index 91279f1060fe..948cb0f9f0e3 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,dra7-dss.txt
+++ b/Documentation/devicetree/bindings/display/ti/ti,dra7-dss.txt
@@ -10,7 +10,6 @@ DSS Core
 Required properties:
 - compatible: "ti,dra7-dss"
 - reg: address and length of the register spaces for 'dss'
-- ti,hwmods: "dss_core"
 - clocks: handle to fclk
 - clock-names: "fck"
 - syscon: phandle to control module core syscon node
@@ -42,7 +41,6 @@ DISPC
 Required properties:
 - compatible: "ti,dra7-dispc"
 - reg: address and length of the register space
-- ti,hwmods: "dss_dispc"
 - interrupts: the DISPC interrupt
 - clocks: handle to fclk
 - clock-names: "fck"
-- 
2.34.1


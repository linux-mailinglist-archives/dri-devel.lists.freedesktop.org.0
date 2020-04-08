Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADAA1A29EC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D9A6EAE8;
	Wed,  8 Apr 2020 19:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC736EAE3
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:52:13 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id b1so9037790ljp.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 12:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6D6qYDVAoDX49O3pqM7t4Fg8LndWENhGAQHVsmY5Z5o=;
 b=XXutsEU3l6r+yPO9oJgX925/EDBqLG+ysEOjCx8DGzfZCFdjWwBb5YErtaIjok8IsY
 I/cHrBMUtYMWwnEm/3A/VDSnpY3BsPhb4/TC5NmFIEj/5kqLZobOSL7ZfTegy00rNoUI
 tzqjFODTBjWuonPRDA7ypa72lBvL7i4woLyBpa3Aj89AZO1XWzckF9HHFLWpvNEYkY5/
 NKS0dcOMUVTFe8qngfzfQF+m5KPSHggKQjcjDdqn0XuT9VjV3hbk8wyiAlOIYi8WFgQT
 uKrEZasT4W9KZ5ab70JIsGnm/7qu1pvm/QezA1Z5Mws2KO8cMM1J2XIbXiNjFx5qvm1w
 pDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6D6qYDVAoDX49O3pqM7t4Fg8LndWENhGAQHVsmY5Z5o=;
 b=D5eSsAuSI4jrllDqqHixQKE/VegNVWQM8XkLJBZhNuYC7lK56bJaJuEwkJiZa1OAo/
 Q/tF/XCU52gUVsFKVSTYQ32EcHC4Y4jqc6Ox8LmVUJ0w7NOGKzWmkcnlB7CtYuZeGv2G
 k6nhAsr8beYrqun53z8432+xUv0zHAYXnNCycjip2qMmol8LqbsWTlaBr4p6untkN4sY
 MMnC8AawN54cklxhS1UPCZZxtzzSJN4MnCsIfX8mZbZruYsdW079YQIYLZJyE0GAZbBR
 SIC1xeMtO60cqTnp/2zR3XJpj4JN1lQPlC1kFIc9fM6mzZJTSgoOm3gm4TNwSx8nb2xa
 VQ8g==
X-Gm-Message-State: AGi0PuZioTd02+VmHMF004GUguDGMs4qaE02IeNROx2urlWHHgh6buIl
 5DoZkG920gX8qNEwr7trzcdwTEjVVRg=
X-Google-Smtp-Source: APiQypKNYRQcSSHozxvibYIjkxAF3kS1iwCxc1DBka0R8azioQKkkgz4VifSElVsqxT/YIokQcgAUg==
X-Received: by 2002:a2e:6809:: with SMTP id c9mr5871304lja.251.1586375531273; 
 Wed, 08 Apr 2020 12:52:11 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i20sm3961304lfe.15.2020.04.08.12.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 12:52:10 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 28/36] dt-bindings: display: drop unused simple-panel.txt
Date: Wed,  8 Apr 2020 21:51:01 +0200
Message-Id: <20200408195109.32692-29-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are no more references to simple-panel.txt.
Delete it.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 Documentation/devicetree/bindings/display/panel/simple-panel.txt | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/simple-panel.txt

diff --git a/Documentation/devicetree/bindings/display/panel/simple-panel.txt b/Documentation/devicetree/bindings/display/panel/simple-panel.txt
deleted file mode 100644
index e11208fb7da8..000000000000
--- a/Documentation/devicetree/bindings/display/panel/simple-panel.txt
+++ /dev/null
@@ -1 +0,0 @@
-See panel-common.yaml in this directory.
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

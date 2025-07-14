Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783F2B052F5
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812AD10E53C;
	Tue, 15 Jul 2025 07:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=scandent.com header.i=@scandent.com header.b="djatVU1H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A936610E500
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 22:18:15 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-4ab60e97cf8so22968001cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 15:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=scandent.com; s=google; t=1752531494; x=1753136294;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WIaH38Gh5kKcHJRj8XVnX3nblAGXvNpyNwpxmX14OvU=;
 b=djatVU1HaadF8gJKwOTyKNicKgoUAGPpG8GGu0Cl3FvsCwGt8oVUhrP+JiIp+r8Wvn
 Apj1S1adOnw7PFjnth1B8T378rSDHNn88Zw65iG4B2vNh9QquXelUyGLvKsPIGcApSRT
 64yKykbsaiXjn9wXEmnjgZcXtXZo+AYha14zptfKb6Q8p8e5ymsS5CCE6bYp3nnyuoNY
 edOtAs/ZvJIQqncMlZjxC5Yoxn1MiMUHx3eWwTKELMZI9Asyc9txc+Aj9g23h9FL+dOQ
 HlNEQP+2TsYpkl+rKG1MJC+5yEcNWAbyDAPqg3yLgZOOfhRXent7XJFLirmYyM1AWKqt
 b3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752531494; x=1753136294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WIaH38Gh5kKcHJRj8XVnX3nblAGXvNpyNwpxmX14OvU=;
 b=nEs2m746hxtFp4ZX9JR8TNAMjdx2MdPsw5lQZzRb+gC04PuSDJMJtX1gs85LKfOTxt
 X8kKyThd2+ezn+8yDc1774tkh0pj3N9ua4Sfj+5oaiAQh1FKJCvOYZjFoJRvCR5+XqyN
 iIpnC5TwEd+EeXkqB/qb3GZ89oCxTzVBoaMoGYQNreOi4ARjEDRFQrfWe6eojcZmZZNl
 UomlsXdPMGrm/z4wXSZTvJc5EMAsiYbEFL3svUVcz3yHCLidY+MC2SzcM7jYfuWj0psI
 gbT2bsIH4UgBRzi6l0rTMixK7GCHFevf5KKpkO/05pmI7M9eciciOhHShDUQFOi1u5BR
 O7vg==
X-Gm-Message-State: AOJu0YwInJIrdA+Wks+ugPNnnKMDOaGgv1JFhnk+qt8Orn1Yy9V5tuok
 +u3JL+3QZJFW4iBwLfOPYTxPFI/5DDXsHAUWg9bNOWlTkXkHQDWQfJfkNLERKmIMex3wltSEWfa
 v5VMXhPw=
X-Gm-Gg: ASbGncs1cTXylOJLr9nOT+RMc13adT/4HHHRGL8wijzkj2nUh3fNjrvntvkX0Xo+hQm
 1bM6tOvkoIbV11wvAgEG3sInLylg1QS8mr6Q0Ia7xfsi2elBlxyX3jPS1gZahMmqcF9lbzjObjT
 WWG7CJeJrifNygFf4MJddZ09XpcMOY0kzoFCI4dGqecdcyBTzQqYKL6vZxPhCcIJW0CGgQK4QrH
 XrRMeif1n8mYxK2uk9XCeMJyLoDUatR1JBCP5Kt1jX6Cc9Fy4eu0ae7ZwfLe8AyY3lNHQ/i+kfI
 FpzBfX1C9Wc+8Wa+IcUVd4ElSUzpNsQgCP4x0PrHYumCNrlOS196GsohZTXXoZgNf7AwHklakui
 pis+pQdFOTpMApJ+wW5Ki8/V019XzGQkgV6Jds91hKn0dVP7F
X-Google-Smtp-Source: AGHT+IHF+khwSUVbi38c6jhWBuadogmIeY/qCFpX9uS8IQMaxlml1sIb3wH8o1wLSvvGA3Y1kGkIjw==
X-Received: by 2002:ac8:59d5:0:b0:4a4:3147:41d6 with SMTP id
 d75a77b69052e-4aa35ca9258mr235602601cf.15.1752531494043; 
 Mon, 14 Jul 2025 15:18:14 -0700 (PDT)
Received: from vserver (ool-44c5118c.dyn.optonline.net. [68.197.17.140])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ab3a1ceae0sm37822021cf.25.2025.07.14.15.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 15:18:13 -0700 (PDT)
From: Richard Yao <richard@scandent.com>
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akshay Athalye <akshay@scandent.com>, Richard Yao <richard@scandent.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Andre Przywara <andre.przywara@arm.com>, Junhao Xie <bigfoot@classfun.cn>,
 Caleb James DeLisle <cjd@cjdns.fr>, Kever Yang <kever.yang@rock-chips.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add Tianxianwei name
Date: Mon, 14 Jul 2025 18:17:59 -0400
Message-ID: <20250714221804.25691-2-richard@scandent.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250714221804.25691-1-richard@scandent.com>
References: <20250714221804.25691-1-richard@scandent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 15 Jul 2025 07:24:49 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tianxianwei is a company based in Shenzhen, China, making LCD screens.

Add their name to the list of vendors.

Signed-off-by: Richard Yao <richard@scandent.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6..a2151e2aef4b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1548,6 +1548,8 @@ patternProperties:
     description: Texas Instruments
   "^tianma,.*":
     description: Tianma Micro-electronics Co., Ltd.
+  "^tianxianwei,.*":
+    description: Shenzhen Tianxianwei technology co., LTD
   "^tlm,.*":
     description: Trusted Logic Mobility
   "^tmt,.*":
-- 
2.50.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 827941C8320
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 09:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB74D6E944;
	Thu,  7 May 2020 07:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161A56E8EB
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 21:10:04 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k12so4050703wmj.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 May 2020 14:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y3rbQKHu7o2im/e5E3RSPiMp5YHJ3tSxbniLGmCUMFg=;
 b=Hn0gc1Yj3U4MfSjnTPtlQqD91CNqRVHtTeIYjJJtg1dNUAaviMdzem5K2AbzXiRltb
 67fpDh0gFjfWVaPMuFIjd2fCrb5sieAgs3Kb0QemO+p6FRXeQs7Wp7s3dG19Nd7/i0f3
 5patmQKG37+XwjnpLHYlyaQGNim4vMfjld9njGuaZKM/33Kbvqe1seY0JXRFw3YYEsvY
 5WLAjuaBz3apwNTv/atOpnR4o8BQOt1rV3xaviWp0lTSS2zUzd5j0MVTvubhLEkpremD
 zXP0Ptc3SV+snKil6G46sEgc+iqYLSTQHxdYEESyeSjov5U2M5Qi6c8zErDnmH+hexR0
 0eGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y3rbQKHu7o2im/e5E3RSPiMp5YHJ3tSxbniLGmCUMFg=;
 b=eAev3rGZX5CfIsvIMP9EdJiNp/i/atLvD0a8ARRZzxg0TmiVVNI208bFrrgTwd2qfI
 3nMSygkXAI7a2+c0Z7YX41CHnAx6p7JMssn0e+ID4uCl7XwTQg/k/0XQMt65Pg7dx7qD
 g8D19X7SkWCPzDQFHUFJBPlowwMgkn+76bQtwXTGaJKHxXsN+3DrGHQWuM9iidH2xk/4
 9G+EKJQ4H/y8u92Oz/5Dh0jqNl8SSKDyBjNXRLA4u1m30uADZkFT2WMWKHf/wsevr6zG
 jmVNPr5Fag8cKR0ZCvNlGRyXxr7E3KjqOLLxg+lyO99gplyhM2xsRH0LuNANh5EA81mo
 6m7Q==
X-Gm-Message-State: AGi0Pub6YIB+MuIti8a0U+O0MMmwxhy0r/mtYvmaWR5UXF5t5g26tOpe
 XDmgl1Vi8mJ5tec43WVULWA=
X-Google-Smtp-Source: APiQypIqMBN1Bt9aSmemGVfbQ5HnoKxiEkTWnPreIzJg3/Rmkj4e86n21tqDW0PdqQL2Pwmm8fS8xw==
X-Received: by 2002:a1c:2392:: with SMTP id j140mr6364478wmj.136.1588799402510; 
 Wed, 06 May 2020 14:10:02 -0700 (PDT)
Received: from localhost.localdomain (abag125.neoplus.adsl.tpnet.pl.
 [83.6.170.125])
 by smtp.googlemail.com with ESMTPSA id b191sm5135056wmd.39.2020.05.06.14.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 14:10:01 -0700 (PDT)
From: Konrad Dybcio <konradybcio@gmail.com>
To: 
Subject: [v4 PATCH 0/2] Add support for ASUS Z00T TM5P5 NT35596 panel
Date: Wed,  6 May 2020 23:09:54 +0200
Message-Id: <20200506210957.344590-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 07 May 2020 07:05:09 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Konrad Dybcio <konradybcio@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

changes since v3:
- fix dt-bindings issue

changes since v2:
- fix Kconfig indentation

changes since v1:
- make `backlight_properties props` constant
- a couple of line breaks
- change name and compatible to reflect ASUS being the vendor
- remove a redundant TODO

Konrad Dybcio (2):
  drivers: drm: panel: Add ASUS TM5P5 NT35596 panel driver
  dt-bindings: display: Document ASUS Z00T TM5P5 NT35596 panel
    compatible

 .../panel/asus,z00t-tm5p5-nt35596.yaml        |  56 +++
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../drm/panel/panel-asus-z00t-tm5p5-n35596.c  | 367 ++++++++++++++++++
 4 files changed, 434 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/asus,z00t-tm5p5-nt35596.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

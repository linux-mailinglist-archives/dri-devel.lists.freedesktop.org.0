Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E4E53E3E5
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 11:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C3910E662;
	Mon,  6 Jun 2022 09:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B912710E348
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 09:22:45 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id v1so17020441ejg.13
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 02:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YRul4En+zUsvPscyNur2BYtLJ2pA1uRWUnvIRnDGwd4=;
 b=pvyIsI7n6qmT9178HKdHJ+asUjScObVc4OEl1M7mzVYo4ABDlmCZMmwt4+NEkQi3dY
 Tqr4aGLjZwyhmHZqYpzAWUewSdELp4B8lhQxwq0hm0dynLQFf/PmlGooGA5YxSfoZAV6
 NqSEUpEbhK6NCZgUGPmMsnb80byIWbiH2Jd2rl1PxEFNG8iyy8LqeZna/kno2f2RorEI
 WIsHR/EnSH3X5XslvgYyd4VUixl3jJ+KXU6nU+Ec2j8/uwKxxUdAxZPQYBNtVArh2qMf
 ALNrMXO6+9woEyca3X7h1am4Bt4J0z2cWDteO5KKuZBtCPTh2lkfK293+hmIT0Jemm7q
 mQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YRul4En+zUsvPscyNur2BYtLJ2pA1uRWUnvIRnDGwd4=;
 b=CmRRN4GDPS4I1qfG3Yid+zWwl9Zz4p5cRDH4NIFXoeQd0MYVoDYu1HLO/kAyFmB/b0
 MThE+FZBKO1Jv11P3bNNvoAWw59sw+17vWHap6LWujItS2Q2lZBxfrp1A40K38zqZKtQ
 BqcLVrz+0h3j9ncEXJM6M42ou4Nz8SkF+rYjcBuVUdR87GqhSkM2vinxlDVvkAesWR3P
 kIFOR0++qr+luTiT4EPy3MG56HGb7qhpkeeM32qRFWibSOwpdZY5aPGTcNy489+3ocHG
 CIZfQJYYE7nOq7MIcNDlidhvzkSVUxJ3xbm2Jgoy9+JhJBng/KBwT9dLB+pCH5erzSmp
 n+AA==
X-Gm-Message-State: AOAM5321/fmRFdzH7cMvW/k33pCgmMBCQ4K4MZA9oBSjjIkmn2B1FExv
 D6u6qUpeU6sGhJxd8FBL7ahXeA==
X-Google-Smtp-Source: ABdhPJwKE3yxHKkpb+wb3yYnG20dDaj72u4ByxtQEbBoT8JgvyXTD9DJ5O3+EtlrYr2h87XGF3eF3w==
X-Received: by 2002:a17:907:6e12:b0:6fe:c2fd:89b7 with SMTP id
 sd18-20020a1709076e1200b006fec2fd89b7mr19647703ejc.581.1654507364209; 
 Mon, 06 Jun 2022 02:22:44 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 u21-20020a1709064ad500b006f3ef214e14sm5956397ejt.122.2022.06.06.02.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 02:22:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
 linux-samsung-soc@vger.kernel.org
Subject: Re: (subset) [PATCH 3/3] ARM: dts: exynos: add panel and backlight to
 p4note
Date: Mon,  6 Jun 2022 11:22:35 +0200
Message-Id: <165450734050.62970.863137205835285072.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220516193709.10037-3-martin.juecker@gmail.com>
References: <20220516193709.10037-1-martin.juecker@gmail.com>
 <20220516193709.10037-3-martin.juecker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 16 May 2022 21:37:09 +0200, Martin Jücker wrote:
> Add configuration for the LTL101AL01 panel and a pwm backlight to drive
> the display in the p4note devices.
> 
> 

Applied, thanks!

[3/3] ARM: dts: exynos: add panel and backlight to p4note
      https://git.kernel.org/krzk/linux/c/6c52573bf4c3a0f6e7142264fb36b31ae2c3707a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

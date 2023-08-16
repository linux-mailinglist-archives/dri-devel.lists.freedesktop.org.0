Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E01DD77E669
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 18:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517EA10E381;
	Wed, 16 Aug 2023 16:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E3410E381
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 16:29:49 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-99c3d3c3db9so909389766b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 09:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692203387; x=1692808187;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iXGFip4xPQmMc5o7WGRu/er7WEU0mmI/vsDic791oFk=;
 b=nav2gjQSHKdfSoi26eHLcYD2RTczPmWHhP9Wz123smxcYh9WU4evRt3NPI9Qz9N/I1
 qNeVriHM6r+4Hqc41JCa12Yx5VhTVQyRlWGWMpg+a29P/S1fGBRGdVZfIIbUmUw8wgwJ
 qpaULOP/ByK8TtxAexpFYqpyarMP7Osjh97BeFVxnwzLe1qJ27ljP/UPQuDL5aMynjck
 39KbCTcGKm4fVBFNg5VvJnfdTvXmaNdkaIVwJevkqTFPUh1i6rvH4AB5ZWwaBFZx63jV
 X/HmuaxBvgNRmQUccRO6HxGGKrobYWjhghK8Bc+OdTpW3kjNJqaTE8MmClDT9DI3mECr
 Xf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692203387; x=1692808187;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iXGFip4xPQmMc5o7WGRu/er7WEU0mmI/vsDic791oFk=;
 b=fAvZR3W6DTwI43o4Of2Egla9jpDsS9hV6VwYAfy86Or9y2JMKFsjmbcAMZAsyj43iO
 TFbiOb0nK9KxrXbgL/VtGEIwaHhg3/Pj2kK5KlGkS85FErg+f1Ip55CUQd52Vq3vvGnm
 u40tiVNhuM05xJtDpE1NHu00yn+uVERAZt6EKkBvZvInh1lc3VxRbgI5EEFVSLIyXZ/J
 8n87x7t7H7EVK38WMlIhoMgVgV+VtxleTDRqCTgGvG+jX1kcj05MBb/OOEGG3vD3Fb6j
 8EDz3jTwxyEO3PBPOaDuUQEVseDOJPuZFpLlBpT1H7wxllf01ANFXirgJdM2fAYKGuT9
 iRrg==
X-Gm-Message-State: AOJu0Yz+qgnOcJSANLooUiAOAvtRcgDo/0zNQb/JWu0LVk4g4DfmfMZr
 C0usELERhF417p32OE2AZew=
X-Google-Smtp-Source: AGHT+IFHKqf7og4SYztrQ3hgIh5ddW0RNG/gZrAwpm3G8/UpTC9TEWnOgxvGkdelTp6fWETrxjdcIg==
X-Received: by 2002:a17:906:504e:b0:970:c9f:2db6 with SMTP id
 e14-20020a170906504e00b009700c9f2db6mr1458897ejk.63.1692203387361; 
 Wed, 16 Aug 2023 09:29:47 -0700 (PDT)
Received: from localhost
 (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 kg7-20020a17090776e700b009829d2e892csm8760489ejc.15.2023.08.16.09.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 09:29:46 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, thierry.reding@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: Re: (subset) [PATCH v3 0/5] Add JDI LPM102A188A display panel support
Date: Wed, 16 Aug 2023 18:29:45 +0200
Message-ID: <169220337040.3329623.1496882748150713518.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807133307.27456-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20230807133307.27456-1-diogo.ivo@tecnico.ulisboa.pt>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>


On Mon, 07 Aug 2023 14:33:00 +0100, Diogo Ivo wrote:
> These patches add support for the JDI LPM102A188A display panel,
> found in the Google Pixel C.
> 
> Patch 1 adds the DT bindings for the panel.
> 
> Patch 2 adds the panel driver, which is based on the downstream
> kernel driver published by Google and developed by Sean Paul.
> 
> [...]

Applied, thanks!

[3/5] arm64: dts: smaug: Add DSI/CSI regulator
      (no commit info)
[4/5] arm64: dts: smaug: Add backlight node
      (no commit info)
[5/5] arm64: dts: smaug: Add display panel node
      (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

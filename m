Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2842B4B3684
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 17:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE79C10E705;
	Sat, 12 Feb 2022 16:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3AE10E276
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 16:37:13 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5DE0C402C7
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 16:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644683832;
 bh=15hMJzU1fmathDo+CvBtL4KOBTGHiJyQDvhqhMcjvDg=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=Y7W2mMsV9ij6Vtq8SNjvdXrExl4B2t1a8UKyzYYEBn1iEZaZ6DQRrHeoGMHMEsmJG
 W0Py8ZGhsxfq9eRtIw1EeVNDTO8AVl+h2c8zoHyQWK4u6uDc3ZK/KwncwoYImHpyGc
 A5LUGC04kNbSk1j7dfPbY7e/MKrQutODOUBTdN4eCU476P6o7bW1fF/ttHzg5d33uz
 STrpE8gY/F/UFxyZ2HN4MA0ldC7MAT2fd2zVmr8ibQ6fo4Qu7lNL3xliE6FpPkzkW2
 pvWFzzbvDoTsxrLKos/L4T+2/Z47V5zEX9yjl5TbSH8l/MUx+iSiFNpabbiE96qTRC
 oCX81aESHCLEg==
Received: by mail-ed1-f72.google.com with SMTP id
 t3-20020a056402524300b0041010127313so5160611edd.16
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 08:37:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=15hMJzU1fmathDo+CvBtL4KOBTGHiJyQDvhqhMcjvDg=;
 b=xtfvGAUJOWQcZb+9gY2vfqnE2NCeNFpERWXOUkCwOd34+Cb94BDU0QBfTEYeIvktN1
 PCe4mQng+/mhyEPaCTlaj2oifvTQb5EAak1DvvQTmlHP9C/T/+92+Y0FyN2w36wXkf20
 xbGZXSzC+MlUGHgRSeW9vdHqQ0Hu7GCnz9A0VHWuMKNh1w7shnYovuaOlBxYz8MwzniC
 aPwzKxqFQ59axHtV5oEOXTlOgz0wVe8bSsXBmlhcuiICWKd7C3pkeE1o9E8tvbdJspVe
 ZpLWTEcNpU5c3jpK8u8Gi2eYUzk9j4Dl0bwXPtIXqW0Hk4bxOmnpHxYyTNA+0CwnI5XL
 IcZQ==
X-Gm-Message-State: AOAM531nfYMGeztQ9RLG8V7Bt1GfyAtwGq7DRRB5sSbbCBqlb9bwSNCl
 TGPhYXbvA1c4tYUxALfqbUiL6+36o+/EhtQTLY/TdTbvX95Hd4Pe9sL2McgQrehQ5n3DwKDAjuK
 PcrNJksXKmJKf9OZE+NAkau1kQ0wgX5EhomYTGNLMHpXusw==
X-Received: by 2002:a50:9dca:: with SMTP id l10mr7054316edk.311.1644683831490; 
 Sat, 12 Feb 2022 08:37:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKd2PgvPfnFZh8rSZyPq0B14QPo5js//TUm4+syJvIQzZKlxeHGKY7MDAVXnpzjoJMBxl36w==
X-Received: by 2002:a50:9dca:: with SMTP id l10mr7054288edk.311.1644683831272; 
 Sat, 12 Feb 2022 08:37:11 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id x10sm2494443edd.20.2022.02.12.08.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Feb 2022 08:37:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Kishon Vijay Abraham I <kishon@ti.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 linux-arm-kernel@lists.infradead.org,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>,
 linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Vinod Koul <vkoul@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: (subset) [PATCH 02/10] ARM: dts: exynos: add missing HDMI
 supplies on SMDK5420
Date: Sat, 12 Feb 2022 17:37:04 +0100
Message-Id: <164468382250.54495.17613053424810805341.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220208171823.226211-3-krzysztof.kozlowski@canonical.com>
References: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
 <20220208171823.226211-3-krzysztof.kozlowski@canonical.com>
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
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, stable@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 8 Feb 2022 18:18:15 +0100, Krzysztof Kozlowski wrote:
> Add required VDD supplies to HDMI block on SMDK5420.  Without them, the
> HDMI driver won't probe.  Because of lack of schematics, use same
> supplies as on Arndale Octa and Odroid XU3 boards (voltage matches).
> 
> 

Applied, thanks!

[02/10] ARM: dts: exynos: add missing HDMI supplies on SMDK5420
        commit: 453a24ded415f7fce0499c6b0a2c7b28f84911f2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

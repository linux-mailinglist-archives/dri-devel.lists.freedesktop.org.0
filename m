Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BFD4B367D
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 17:37:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004DD10E2B0;
	Sat, 12 Feb 2022 16:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2606C10E276
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 16:37:13 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 16404402BB
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 16:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644683830;
 bh=tMqilUYIpgE4D+Oy8hol1pf8fg4uaneK2N51DubcZr4=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=TiRW7YRnNGf2WNlYqFkEI9zM+jgoTc4a5gPK1pQSH55ZdZOw8GRiz27Jkhp31nsrh
 5uAjjzhv/lF+uY4GcEweIVsqksr6y2Ec4PY4u6ls3ClJ36C9Pq0v6D7pZADmIa5ZtP
 Be1Cy8mZh+DeJZ0rxWwhwz0xzw4knFdQfROeTcPtmavSDg0BfJ8Epvd4thXv9wxedu
 SfsbfE5WXWCnGunbAfQOiFz8Gzt1w5+QOZl/ZvqtsuJRh1a1n6C1b/hoJ18MoYzD4H
 MZPhzvp3u7hydYvuEVdijUB1aCCM36EfpLDVqJLbmmO1k7pii+v+p2pCWNN8F2wFE3
 OBu7LkCF4vlQQ==
Received: by mail-ed1-f72.google.com with SMTP id
 g3-20020a056402424300b004107aa941ffso2802541edb.14
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 08:37:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tMqilUYIpgE4D+Oy8hol1pf8fg4uaneK2N51DubcZr4=;
 b=tOiQBQ5c8AVkoSoHhBRkBQmRZaRu5IkAhs79S9eBNYOI7oaiKUij5hvU/HjJSN6Obx
 Ns9LsiZer8ZRW8we15FiMA958ZoPsePrueBRWcaKimkUEdzZwEhGQIoyYhYUF5aCd6Tv
 K1e4ksbwsR6F7mcHLWWNdZw+boK/KWPGjhYYY9gNTELEMg+qGDetgEgZgUqXJXYRnk9+
 JPc9BODXLD0chZbJVSohmZ/UPHiGIzKKX7IGSZjSP+QKCS5H8RYEgdCHy7XAu2sYENvc
 tI8H/W/IEERBjLqs55i+K5TXezZ333JUoT2oo70UrPGlA72iaNwAyB7S8zI7T4AFqM6z
 dGzQ==
X-Gm-Message-State: AOAM530Dw+DE6Rq4YrS330gXXmQgcWdTKTy0ei352/I6FKMzcefL/kJs
 GOFvJJfw5XowQIaGtGHqLbYEC4F8mNkbvkfEIiYjHhFtw9K+rKVoen9k5ZtU4y51Wa8nShOFOb/
 TDl/+YLX5dyEHTt4YiBet/AlmZBRJCeYhCMun0sXsXO3X1A==
X-Received: by 2002:a17:907:c07:: with SMTP id
 ga7mr5546521ejc.536.1644683829509; 
 Sat, 12 Feb 2022 08:37:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxD2vBUSSwJtNtb2tnnNYmZ8ce5zaQGnbpfOOmEuusMoNeqmKg6uKEeUXp4CHd4UHdvHqCobg==
X-Received: by 2002:a17:907:c07:: with SMTP id
 ga7mr5546511ejc.536.1644683829366; 
 Sat, 12 Feb 2022 08:37:09 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id x10sm2494443edd.20.2022.02.12.08.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Feb 2022 08:37:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: linux-phy@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-arm-kernel@lists.infradead.org,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Vinod Koul <vkoul@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, David Airlie <airlied@linux.ie>,
 devicetree@vger.kernel.org, Inki Dae <inki.dae@samsung.com>,
 linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 01/10] ARM: dts: exynos: add missing HDMI
 supplies on SMDK5250
Date: Sat, 12 Feb 2022 17:37:03 +0100
Message-Id: <164468382250.54495.17179167915023420156.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220208171823.226211-2-krzysztof.kozlowski@canonical.com>
References: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com>
 <20220208171823.226211-2-krzysztof.kozlowski@canonical.com>
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

On Tue, 8 Feb 2022 18:18:14 +0100, Krzysztof Kozlowski wrote:
> Add required VDD supplies to HDMI block on SMDK5250.  Without them, the
> HDMI driver won't probe.  Because of lack of schematics, use same
> supplies as on Arndale 5250 board (voltage matches).
> 
> 

Applied, thanks!

[01/10] ARM: dts: exynos: add missing HDMI supplies on SMDK5250
        commit: 60a9914cb2061ba612a3f14f6ad329912b486360

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

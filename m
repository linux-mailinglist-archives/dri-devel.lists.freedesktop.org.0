Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A7667CE4D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 15:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C9110E915;
	Thu, 26 Jan 2023 14:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7716110E915
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 14:37:21 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id fi26so2027901edb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 06:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=neC2J2NiikFKD1DH99boQHYW1Cc4DcDPvmoJjFl/uiw=;
 b=XIYectCzSHJAAaa7Bdi8U6Ff08nfXOoYrDHsNb7SbpoNtqPdFF8MkVD8QHIW+EkyLR
 dXJQWv6k+3+rW4zuLt8EwEyg6A7MS+h1o7Zb4oTE+m9Z9Q7Dg8fM1QZTiJUwXm+KU8SC
 jNjf7zcRQlNrAM5fLPUAyr7l6+mH3jL5n62mmqgjwOAgPmmtgkFuauSTOz5mFqydVdBy
 7YQlkcitzbFZBLHYoYPZRFaXdg6z/83VwoOVulICMS+UOxXj2x4D5foljp1T+s6yR8Au
 srs0Ad3bu7N/RP+gV0QwauU55vYnO2venRkhbqkJtqTCjTZXVuF+R8ailzvgq3CAufGG
 WvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=neC2J2NiikFKD1DH99boQHYW1Cc4DcDPvmoJjFl/uiw=;
 b=T0clBWr3w+Du7GJfOPa3fd/vo2ZECnzAFcPqxD0iSDeOCSbRgSKBokcQWN0nM9RJyg
 D694BgtezP6WvmxHHO3toNX9aIwpUUW5HBDKjFkNqnC4hU34Jzqz5Tp58zfGAkV4z/vd
 COBqtloYsz9M6bZXXdTgD6whyEIUi0KEG12f8d0b9zFT+pzdlwtpTUqcSzjBbjaRsJQv
 eq8SFo1oqsjVvYrkIjT6oSE5FvtFXiyrtQ78+QqVoLB1LonwoYnxK7LHAFalSZD6xBIh
 S33qMLygnxezp8xu+3xyxmeCr0WcD8mqIyc8egc/jue8QecstxJ8pMIPu3EVZmmoDjJe
 MKwQ==
X-Gm-Message-State: AFqh2kovL48VSVbkBgPJJI/EvtFhqZO98akGpTY3sfhNSlAS7ysMCmdZ
 B3GQH1XZrqYzXcI6YwbpvsQ=
X-Google-Smtp-Source: AMrXdXv65LpAxJbI8nt34DB2ZlyWFFhGPxslQDQj/tP65D8A7gBzAMVLrZAxzV4ggdokLf55fcbbXQ==
X-Received: by 2002:aa7:de94:0:b0:474:a583:2e1a with SMTP id
 j20-20020aa7de94000000b00474a5832e1amr37658467edv.12.1674743839858; 
 Thu, 26 Jan 2023 06:37:19 -0800 (PST)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 r24-20020aa7cfd8000000b00495c3573b36sm834221edy.32.2023.01.26.06.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 06:37:19 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/4] arm64: tegra: Mark host1x as dma-coherent on
 Tegra194/234
Date: Thu, 26 Jan 2023 15:37:15 +0100
Message-Id: <167474380847.1640957.15918634834244629931.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230119133901.1892413-1-cyndis@kapsi.fi>
References: <20230119133901.1892413-1-cyndis@kapsi.fi>
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

On Thu, 19 Jan 2023 15:38:58 +0200, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Ensure appropriate configuration is done to make the host1x device
> and context devices DMA coherent by adding the dma-coherent flag.
> 
> 

Applied, thanks!

[1/4] arm64: tegra: Mark host1x as dma-coherent on Tegra194/234
      (no commit info)
[2/4] gpu: host1x: Fix mask for syncpoint increment register
      commit: c42babb37bc2ba84d692d8d13ce900636b19d2b7
[3/4] gpu: host1x: Don't skip assigning syncpoints to channels
      commit: 529babe886a29b3e4ffcdc61b755c3d7245c6cf2
[4/4] drm/tegra: firewall: Check for is_addr_reg existence in IMM check
      commit: 40aef7daa1bdf73bd66aa97e6e2069e340415a38

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

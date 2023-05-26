Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 433A17120C8
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 09:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060C310E7A8;
	Fri, 26 May 2023 07:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C91010E7A5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 07:22:14 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f6042d610fso4702625e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 00:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685085733; x=1687677733;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V4R8gq4VV9FH7vEiMGGKmwIH253z5jV5ue8L2RgLn9w=;
 b=ydqGwHwpA29vslczQHBZDgtmWGPCzgojPE1SKs+AT+Cku2M5Xiwvfq1P02PbVG4nTX
 LbAbKiD2R6uz+URZlcyKqwFisrCWrHKgAzVrpuiAiQuA9Tk62QjO4WWquYkiOArV8e8G
 uVg3Dc9MpMNp+Afvl+e+5kH8i05zgB355Ph+yRlZSmRbAwvqupMBGGJv/dpMPQJ6g/HV
 qGufaqUlHDomcBdQturnisi/kfLQwbGV1GZHYy5BTbz6laG8yDoJz+lJh4/yFdYZbqUH
 DxpvrUkYnHEYQO16QesjVJzwu8S+pJO37WlbJorJoW/43Suj1vf7Ev+sKayw3JGkv8l/
 NKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685085733; x=1687677733;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V4R8gq4VV9FH7vEiMGGKmwIH253z5jV5ue8L2RgLn9w=;
 b=R/IHOw6KJBs0xehz6HwKlDD13+yiUy/wCFwDEa+3utC2aLkLF2lh58Kc2TAAMGLt5q
 9zY83WLuimCWnQsenFCIvlZsxGaTcdBbmsGe9HKFcjZIdsO2S2gkZJNFsxRK6vHk4Y4Y
 caWXJY4WKYJ9kbB/zlnoT8n4n8uLE+5hIhkaFY1aJh//BmGInmRibS1DAk7G4qq1I0nd
 oAA+XKZBP6UeMMU7/1Mo5TY45HymEYskiZdcptqCwqPQh4HlA7Pat7j/DpU9nzKfLHpH
 uaaNDf1wl4zt6FukmcmKx3QIZz+pKl1XgOZv7HJ9OgZjgNuzt2zW7Csm5As40jWv+hry
 bmhQ==
X-Gm-Message-State: AC+VfDyqGSSklVsUxEqDqn6L7K5ydo21gxaln0hk8yWQk+anVRQJch1P
 +NuHoNDQYRAIQS/guQD7OeEmqQ==
X-Google-Smtp-Source: ACHHUZ67r+CPazD5B3hbLYQQG45/vUi5DI/DCFLbpAsyxlkY5IOAPh4kl1wSTYJpIFlNJzN3AJ0n1Q==
X-Received: by 2002:adf:e30c:0:b0:306:45ff:b527 with SMTP id
 b12-20020adfe30c000000b0030645ffb527mr612405wrj.45.1685085733323; 
 Fri, 26 May 2023 00:22:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r6-20020adff706000000b0030903371ef9sm4115935wrp.22.2023.05.26.00.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 May 2023 00:22:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Adam Ford <aford173@gmail.com>
In-Reply-To: <20230518230626.404068-1-aford173@gmail.com>
References: <20230518230626.404068-1-aford173@gmail.com>
Subject: Re: [PATCH V7 0/6] drm: bridge: samsung-dsim: Support variable
 clocking
Message-Id: <168508573242.1449766.4668062755722232780.b4-ty@linaro.org>
Date: Fri, 26 May 2023 09:22:12 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
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
Cc: Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, aford@beaconembedded.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 18 May 2023 18:06:20 -0500, Adam Ford wrote:
> This series fixes the blanking pack size and the PMS calculation.  It then
> adds support to allows the DSIM to dynamically DPHY clocks, and support
> non-burst mode while allowing the removal of the hard-coded clock values
> for the PLL for imx8m mini/nano/plus, and it allows the removal of the
> burst-clock device tree entry when burst-mode isn't supported by connected
> devices like an HDMI brige.  In that event, the HS clock is set to the
> value requested by the bridge chip.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/6] drm: bridge: samsung-dsim: fix blanking packet size calculation
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a617b33f7e513f25becf843bc97f8f1658c16337
[2/6] drm: bridge: samsung-dsim: Fix PMS Calculator on imx8m[mnp]
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=54f1a83c72250b182fa7722b0c5f6eb5e769598d
[3/6] drm: bridge: samsung-dsim: Fetch pll-clock-frequency automatically
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=33d8d14c83bf67aa0d262961a6fda9c40f3c1052
[4/6] drm: bridge: samsung-dsim: Select GENERIC_PHY_MIPI_DPHY
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=171b3b1e0f8b8c894f2388e1cf765a56f831ee5e
[5/6] drm: bridge: samsung-dsim: Dynamically configure DPHY timing
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=89691775f5735fca9dc40e119edcbb52a25b9612
[6/6] drm: bridge: samsung-dsim: Support non-burst mode
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=bb0e13b9e223b218c9f242f8d340a332b4381042

-- 
Neil


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B05A47A89F2
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 19:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0829310E51C;
	Wed, 20 Sep 2023 17:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE69D10E0E6
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 17:02:19 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-404732a0700so566835e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 10:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695229338; x=1695834138; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jn2Ngd3ukFjoHjH9W9ENbDDoYAtr6LLLpGel78I6ZB0=;
 b=mmOIH2z27K/I68WAZB8yBCyDcfs9TAB3ALTzFFWQgeKyqp+ADgh+9AT9s0ZiI5wfkU
 8kt/xJCC8b9C3K/zYpuZIvdSd+bNQVwF7iNQfSr0Fgt5I3q30HhA2hKC8NUP+VQZAvi/
 USouiQPJqfULqQ9jXZ74nTX4J6jAw2DJkD2CpZwgpN293++m6Wif68LCnv0rc03ZubDs
 QAsgf9dsy2EhA0gg5WsXPI3hcG2hmmLINfj9agub6JYTQHPbhkYlA9SLw6/a96g0hok8
 /5IDzPsn/YY7b37hRo1TDI+KqkT3Scby9x+m9YsDJRpWsNDPCM8jpRbEybDc8D37C4RG
 j8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695229338; x=1695834138;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jn2Ngd3ukFjoHjH9W9ENbDDoYAtr6LLLpGel78I6ZB0=;
 b=aspzAdn2iAMwd23LJvE6AdbR/ZtylEu+K/57Z6z8iaSZ1J5tsBZQ5w7M8tS+R/Cz/b
 dfk9n4kfHwVcZM8l7cDLcGEpLO+A7EBGp1gnFEfUZsg4FRFRYrLDW1Io52fwyV0os2qt
 7WEFBEcC7TTJ7y5J9hVrFup9J2HGCWwyksRZOxoX/YHNY39k536nTNnXzlD9hEs2ry1m
 kblr9oPuNQmzrKvDpxvbW2/goYSiLIBaHCPelSdsQ7IHepU2uUMtAFH1oPSK6BHtWnTA
 JhkjX74SbdDLBVr1/BpIqN3zoy13cxkAt7x2iG0cTdrMhb2hGDIhSP5fJsxCooVRlF8x
 Bo/Q==
X-Gm-Message-State: AOJu0YzA9lqh77ZuKLUe76kDfP06dNlM2guZHKboeMTWIP4498l7YluQ
 CkMVWCPamAOLwFP4UqyoYhj5Vw==
X-Google-Smtp-Source: AGHT+IHQwC4CCE0u7zaSVVROxrBB4EbV/lQdgjnSt+j2QBhsWsgfuJK8PN2PW5lRoOHFRGdAEdvUKg==
X-Received: by 2002:a7b:cbc5:0:b0:402:ee72:2314 with SMTP id
 n5-20020a7bcbc5000000b00402ee722314mr2918067wmi.3.1695229338096; 
 Wed, 20 Sep 2023 10:02:18 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 9-20020a05600c248900b003fee849df23sm2441693wms.22.2023.09.20.10.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 10:02:17 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: andrzej.hajda@intel.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230920082727.57729-1-angelogioacchino.delregno@collabora.com>
References: <20230920082727.57729-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] drm/bridge: panel: Fix device link for
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-Id: <169522933708.2429100.2452577965890146025.b4-ty@linaro.org>
Date: Wed, 20 Sep 2023 19:02:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: ulf.hansson@linaro.org, rfoss@kernel.org, jonas@kwiboo.se,
 victor.liu@nxp.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, ehristev@collabora.com,
 Laurent.pinchart@ideasonboard.com, wenst@chromium.org, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 20 Sep 2023 10:27:27 +0200, AngeloGioacchino Del Regno wrote:
> When external bridges are attached with DRM_BRIDGE_ATTACH_NO_CONNECTOR,
> the panel bridge may also get the same flag, but in the .attach()
> callback for the panel bridge a device link is added only when this
> flag is not present; To make things worse, the .detach() callback
> tries to delete the device link unconditionally and without checking
> if it was created in the first place, crashing the kernel with a NULL
> pointer kernel panic upon calling panel_bridge_detach().
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/bridge: panel: Fix device link for DRM_BRIDGE_ATTACH_NO_CONNECTOR
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=887878014534186cc50dbd16a62e744ad217b4b1

-- 
Neil


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA137047B8
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 10:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FF810E324;
	Tue, 16 May 2023 08:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AEE10E322
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 08:25:29 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3090408e09bso2678205f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 01:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684225527; x=1686817527;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+pFJano5Bm7/4Wj7Vuhd/IaaZxuENtuX15bdwD6I5UE=;
 b=yKTPc8HoOitwxtMsm0g5H2PfHqBq1fDMyqj9xC9VY/mhHRpGiJMsmTpHHsmhZY1AEO
 A4uXaEk15ZQ9APsgaEdylQhGSTIUeUViIQW2rMQwnsBr8D8eeXjXIwBujotNW177eSGZ
 LtQtScRJ/u+xFyxU14aNcCZU6ScRlZNMOL+jIRfh9Dw7k1jEP/u52qfFKedPTJDAeNAW
 8K9mT8hmnyhFBhPMm0bxVXeeL9H8KBcPFcCDX6VT+2BmScTssobHm8CG84zH8S1T7gN4
 0giYXRkCziKcuUzej7ILcaoIWx57hlRffuU4XT6xHX+rzNQsassLehSrQ6xki7CIb46z
 Po8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684225527; x=1686817527;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+pFJano5Bm7/4Wj7Vuhd/IaaZxuENtuX15bdwD6I5UE=;
 b=ZoTWMhQajM59Qg9CdZ16kqUBP+/zMx5MaogbIP17sSoW5r62rbLZz1Z3o1TUU+bvqS
 1HfZNrL+rYuD0a3S+ryQ7fSxFpDOuUhAWwlsVozDpL4p/E78SgHXQZx1eQqJ4CIYjzRT
 HFmBRXOOREwL4q2CFI39whHaxu0Jx1C9sRXyS4SaL/xJG3iGAMWZ89HFD3mvXRwJFOuf
 iHJPjjAunWVnnfAQpkp6A47PO3xIMPFcTtmwUEDPeQNJp4RTO2bSLuVKRP+SHC/TWGNL
 2ZL7GDJ8IMfrXQs+D8lydxyKBTP61TuaPiPV7u2BXZTdsivxcreSpNKRzCr385HC+a0R
 wIBQ==
X-Gm-Message-State: AC+VfDxbDyuutviFPaV4OdgdB8fi5tMtvqfkcL/oKy13FtA5dVMGvSnR
 W0mvEmom+m+dBvYb5wZohyPyHg==
X-Google-Smtp-Source: ACHHUZ4cSbq7K4tEpauuBUbqTuMP7KQuJwf3JpcvbyifkW07RgANwscAx1w2Nmcd6poi1DpqAsrJww==
X-Received: by 2002:adf:ce84:0:b0:309:2b6:5c83 with SMTP id
 r4-20020adfce84000000b0030902b65c83mr8957075wrn.1.1684225527143; 
 Tue, 16 May 2023 01:25:27 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a5d494e000000b003063a92bbf5sm1727505wrs.70.2023.05.16.01.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 01:25:26 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anup Sharma <anupnewsmail@gmail.com>
In-Reply-To: <ZF9igb/nvL6GRBsq@yoga>
References: <ZF9igb/nvL6GRBsq@yoga>
Subject: Re: [PATCH] gpu: drm: bridge: No need to set device_driver owner
Message-Id: <168422552612.63953.10959326183714499182.b4-ty@linaro.org>
Date: Tue, 16 May 2023 10:25:26 +0200
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, 13 May 2023 15:42:17 +0530, Anup Sharma wrote:
> There is no need to exclusively set the .owner member of the struct
> device_driver when defining the platform_driver struct. The Linux core
> takes care of setting the .owner member as part of the call to
> module_platform_driver() helper function.
> 
> Issue identified using the platform_no_drv_owner.cocci Coccinelle
> semantic patch as:
> drivers/gpu/drm/bridge/samsung-dsim.c:1957:6-11: No need to set .owner here.
> The core will do it.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] gpu: drm: bridge: No need to set device_driver owner
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=728cb3f061e2b3a002fd76d91c2449b1497b6640

-- 
Neil


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B395B76E32B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 10:32:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4358110E5CE;
	Thu,  3 Aug 2023 08:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7484C10E5CE
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 08:32:05 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fe2048c910so6973035e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 01:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691051524; x=1691656324;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DIBfxub9CM01UtScGp+GlDrmpYqPbe9y/M/0ui+FdrA=;
 b=u03rVYohPugy5ggUV+yVILLHwa/fApSrXPMLwWpf964VAaPXySwveplGmdXdDuCKVW
 AEjP9snX0q8hSemntEF1DNi6yBDMfqOp8vxtD94PhM2DwBi7MIeJ10tzTirXCwGO/NeW
 Ve5tmUQ6nWk7RRJA8HYWQ6yRs2uHNWNSv6N8S+E6kSVLIv8GuL9adgB6sMUPnTPb8JKa
 Daamc38M7HEuHfyIGoxJSOk4r1BNq2DXqHbPuo+KPz+1nV6R2TQ9pwVyfXrryalsypXt
 A3Y7IBCYyMLDTZBLbv8jzrIrsMG2duRIWCjgi/2TYE7QFZ6KxZBRWBDSyonwXIAMqdz6
 sLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691051524; x=1691656324;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DIBfxub9CM01UtScGp+GlDrmpYqPbe9y/M/0ui+FdrA=;
 b=I8rIUH15BW/SEm8jcj6x2coFWNWhmVWQFOmNxm/4GLW27UFvY6kWJsReftY/uWXghZ
 61jqElagIXfFN09LGvmGYJKmxuTaFTifUEaL5RsI3q0dNC2CSW2bM/nItstbpKjCtVOB
 PhMqmA6/12yblffKdq+7z7wT7iIZqqfs2WcVh6mfWPv+jwyBPrhKW5NA9x/g9t2z/uQl
 KatHx8l8omLUy3vDzaPcGB1962zil+umnT2/MAwbYnj3T+WL7+OFLcuxOKy//RDHL9Gs
 vYkTsFuVk2q8oDrlfUYA8N6CRv1LM9gGq6Q6Ke68lSmiJfACEAI9LMBf/zin+Hmsw2Dp
 dJsg==
X-Gm-Message-State: ABy/qLYhz65IPOjW8f4DfCl42376Cwkyir9O0CTFoVLXxbEgmBWp7Hsq
 NUWPAPaDPCd2aDButGfUffiBow==
X-Google-Smtp-Source: APBJJlHh7x7hfbVuixT27Kq22dQd+UEZdFISupP7IvnKRnCX3W9nWlXJcIc6br+n6dnAt0vliCQ04A==
X-Received: by 2002:a5d:498c:0:b0:317:5b5f:3348 with SMTP id
 r12-20020a5d498c000000b003175b5f3348mr5633469wrq.71.1691051523868; 
 Thu, 03 Aug 2023 01:32:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a5d60c1000000b00317afc7949csm6676364wrt.50.2023.08.03.01.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 01:32:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Pin-yen Lin <treapking@chromium.org>
In-Reply-To: <20230727100131.2338127-1-treapking@chromium.org>
References: <20230727100131.2338127-1-treapking@chromium.org>
Subject: Re: [PATCH] drm/bridge: it6505: Check power state with
 it6505->powered in IRQ handler
Message-Id: <169105152304.2528955.6714983966012972300.b4-ty@linaro.org>
Date: Thu, 03 Aug 2023 10:32:03 +0200
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 27 Jul 2023 18:01:10 +0800, Pin-yen Lin wrote:
> On system resume, the driver might call it6505_poweron directly if the
> runtime PM hasn't been enabled. In such case, pm_runtime_get_if_in_use
> will always return 0 because dev->power.runtime_status stays at
> RPM_SUSPENDED, and the IRQ will never be handled.
> 
> Use it6505->powered from the driver struct fixes this because it always
> gets updated when it6505_poweron is called.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/bridge: it6505: Check power state with it6505->powered in IRQ handler
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e9d699af3f65d62cf195f0e7a039400093ab2af2

-- 
Neil


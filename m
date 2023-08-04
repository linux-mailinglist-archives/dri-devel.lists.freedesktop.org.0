Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC81076FC15
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 10:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5407410E250;
	Fri,  4 Aug 2023 08:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8460B10E6B7
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 08:33:34 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fe0eb0ca75so2968922e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 01:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691138013; x=1691742813;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N6nwwHLkVG+OtVOcxb9BDvvn6MafDWFcOyabImoFU+A=;
 b=KBmq3vL5fNLVwTa2+FypT8jrqb/g0EPTJ0TXq7MBZHYuDaO8AOPDLQvuYxTnZpqs9a
 lM2eY0uKw3jxL4Hivc5wAEY+5ITe4Or1zycqN35knpYLItevTVQhJTj7QMw7lG/9iG/q
 iP9G2m8Ml297DZntW2QiGm9kLraT/4BmBSVz4vXou6HpmjuUhrkWZ+rqc8RrBSDHuOgX
 qymE+pHPfvk5x+EzKSpPTntei2KIqWWmpFHAW8f07ZovbOpBPTPSTnkJBwfgMxIvvJB5
 hF6To5tCf8s05szuXYDeUsc08HXMVi4GIp76nSPKoZ5CS+3HNTzALHTMT8B/5mH4eMEV
 t0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691138013; x=1691742813;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N6nwwHLkVG+OtVOcxb9BDvvn6MafDWFcOyabImoFU+A=;
 b=ZliWR4obzkWkVV17pSwqJb8HelQ3KSuuMsw7f99L5j1R16xgoF6ItN4ULdUHo9sHUi
 IpPpHPpjFdpi2bG9l3Xgahd67lmTCy0l8IoTPaKv17JegNKSDG2/ghtpDy50SXqeX/yZ
 PiA4QzlSYz/teEvP/rTvMoOU/f2AKLPK+AnBVqABO6G5NHvvhuL2aGJSXh0+8jepVg33
 RTnLN7QONx5V5dmLoH+/9klcYFWphNzp4S+ISx4x0eVUH3KuHQZjddrOOFKTjHzxUccW
 oxQVT8LvpUdcnigK306uWszhV1N8ma3Iox06gCXQfgzSHNT78p57OjCfmLJ0SPQPoByr
 l1XQ==
X-Gm-Message-State: AOJu0YyFdjqzWVhFVvtzJI9Hb6StQ7VNZaCkj5PSKEC9q94P17MSlHRD
 L4ox2etWvVjHHYBQWzcMjrEgggecrU+GgNXUJ81Vng==
X-Google-Smtp-Source: AGHT+IEMeJXfONqMoY3iVQdO66rqCDGbo3R40rjhpbKanJglhxYE5V5UlpOohZC6WXxoVCJPbivftA==
X-Received: by 2002:a19:9116:0:b0:4fb:78b1:1cd4 with SMTP id
 t22-20020a199116000000b004fb78b11cd4mr692530lfd.49.1691138012596; 
 Fri, 04 Aug 2023 01:33:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 y16-20020adff150000000b0031762e89f94sm1880871wro.117.2023.08.04.01.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 01:33:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Sandor Yu <Sandor.yu@nxp.com>
In-Reply-To: <20230804061145.2824843-1-Sandor.yu@nxp.com>
References: <20230804061145.2824843-1-Sandor.yu@nxp.com>
Subject: Re: [PATCH v2] drm: bridge: dw_hdmi: Fix ELD is not updated issue
Message-Id: <169113801157.3169525.1095046691218420995.b4-ty@linaro.org>
Date: Fri, 04 Aug 2023 10:33:31 +0200
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
Cc: the.cheaterman@gmail.com, rfoss@kernel.org, jonas@kwiboo.se,
 cychiang@chromium.org, shengjiu.wang@nxp.com, adrian.larumbe@collabora.com,
 jernej.skrabec@gmail.com, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, treding@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 04 Aug 2023 14:11:45 +0800, Sandor Yu wrote:
> The ELD (EDID-Like Data) is not updated when the HDMI cable
> is plugged into different HDMI monitors.
> This is because the EDID is not updated in the HDMI HPD function.
> As a result, the ELD data remains unchanged and may not reflect
> the capabilities of the newly connected HDMI sink device.
> 
> To address this issue, the handle_plugged_change function should move to
> the bridge_atomic_enable and bridge_atomic_disable functions.
> Make sure the EDID is properly updated before updating ELD.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm: bridge: dw_hdmi: Fix ELD is not updated issue
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=6db96c7703edd6e37da8ca571dfe5e1ecb6010c1

-- 
Neil


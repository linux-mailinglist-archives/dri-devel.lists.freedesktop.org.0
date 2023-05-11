Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C74366FEE03
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 10:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D1510E5BF;
	Thu, 11 May 2023 08:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A9810E5BF
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 08:48:47 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-30796c0cbcaso4623110f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 01:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683794925; x=1686386925;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jYXOA8zWM3jNNbfPJj41pkQhEa8v8qdITfpT3KLBxPc=;
 b=Z5R4tmsGyw3Ok5zpXFWjfLJAkGcAakaxt2Jg2ZIDMsU5FnsiYM9EU3QWaMWHBZjkcI
 O+/cjOULwsKc4EnOKHpaM9Ho2mrBKfKGEo+OdCqBMNG/+lDk7FlbJVBZA16eBRj9NWCZ
 FG0amxGw/vnv1olwuwzjKPE3xZi/SVt12SNfmxGcVPYPCuwA6/SE5Fu9uSY+hIvsVHHg
 6QZoJwBp1AKHVO4Q33xF8s0Wac52yKUVxNfTmWg9Y4z/sZuTVakmFxXXJ7FiPHri34Nc
 WIeWGJH1GvfEYlbB1MaCXA1++rN3QDt8v7rR3cqtbDfuumk6qmIxucy4Iq+hcA03eb7F
 z2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683794925; x=1686386925;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jYXOA8zWM3jNNbfPJj41pkQhEa8v8qdITfpT3KLBxPc=;
 b=OllmBZMxV+nHaAFgwX0e/+HRBhDNQNPHsWeBrCGiGOZHQ0atlxzi6kNmEpv4BXaJIY
 YC1k6WR0motwsRl8yMkFsTQdxj5VTu1mOAeiidiNI1Imo54QTnyoRlSeqliT+lXNppEO
 Fzp5gdruJIbK3yytx3EnboLJSRtKER+6/kaAz6vPgVs3odOYWZz+NsPuVHbBI/TczJY1
 QVmNbvrFJiEqteYBhGXdTQav9FbBA+DE41NJJFUBaDTAUdF26PGViq2da4/E6KZAMt1O
 vGxC5zSz0hIjzpksSsNlmKuyLuv5A9Fes9VJz+SGzy1dlJm1mozYHCpktJzkvHcqOM/X
 Y2lQ==
X-Gm-Message-State: AC+VfDy0dt/tembnKHqmluAQfTWtk4mfhoZUTgza8P9ReLRhzEc14dZY
 agBgE+I5nvBV1gr8jOvMZGpSOQ==
X-Google-Smtp-Source: ACHHUZ7DvajCB9jH6R+ncwbVGAAsE30eCK9r3LX38KBGLTpcIkya0694Nlh8PjtSMrXjtonaRDQYYg==
X-Received: by 2002:adf:e547:0:b0:2e4:bfa0:8c30 with SMTP id
 z7-20020adfe547000000b002e4bfa08c30mr15384948wrm.47.1683794925436; 
 Thu, 11 May 2023 01:48:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 z6-20020adff746000000b002f103ca90cdsm19707750wrp.101.2023.05.11.01.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:48:45 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230507172639.2320934-1-dmitry.baryshkov@linaro.org>
References: <20230507172639.2320934-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/2] drm/panel: sharp-ls043t1le01: adjust mode settings
Message-Id: <168379492469.1992146.2328488621044620059.b4-ty@linaro.org>
Date: Thu, 11 May 2023 10:48:44 +0200
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, 07 May 2023 20:26:38 +0300, Dmitry Baryshkov wrote:
> Using current settings causes panel flickering on APQ8074 dragonboard.
> Adjust panel settings to follow the vendor-provided mode. This also
> enables MIPI_DSI_MODE_VIDEO_SYNC_PULSE, which is also specified by the
> vendor dtsi for the mentioned dragonboard.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] drm/panel: sharp-ls043t1le01: adjust mode settings
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=dee23b2c9e3ff46d59c5d45e1436eceb878e7c9a
[2/2] drm/panel: sharp-ls043t1le01: drop dummy functions and data fields
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=7e8ba34d357127e2c93f18123d09b5c817156512

-- 
Neil


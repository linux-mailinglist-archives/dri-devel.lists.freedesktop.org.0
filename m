Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8057696F8
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 15:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DD110E28F;
	Mon, 31 Jul 2023 13:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3BD10E28F
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 13:01:22 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3090d3e9c92so4665647f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 06:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690808481; x=1691413281;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BZR18Xj99HGOD1PDk2Wg3AoA7XuLUWWBfQUMdU0ykAY=;
 b=hV+Fa/iXvze4EZHc4nHJxlGxRetuNEIbLhs5E0XXYKB8oBw519mtJiK1+s2jqcN75V
 Fi4aT4kuLs8DJepDyLQE9C4MAG5dEDC0F6jHsOsSK+IryHYhBTpObKS2xDPjJurf0+yO
 dlbLBjsrj3lgMVDRs4Ru+dCl3/4/+cdIbqm7f+Tgv8ypVc9UJRJ5sb3mzqcn4MS/0O4M
 bqGyJ56bfjvdfFw94bSsWOsUSPaahBGE9EEPpBlc7W44YhHrbm/7bEigI3f13HVE5jxJ
 Wzu/LMVFamzixGigFcIpmr6/iQWjnu3z14XTGBkuZ1RMCFqeuNmRN2XwPXZWwApp8PqV
 zDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690808481; x=1691413281;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BZR18Xj99HGOD1PDk2Wg3AoA7XuLUWWBfQUMdU0ykAY=;
 b=M5LHQRPPzmP7uSZN9H5dFzR3KzwJupvh2GmAG/1qCYnNUBKfnT9u7K6F+FiYst+Sky
 MQOBUomfgX70awFdkJmZfMp4vthJ4bs4UrewM2y32sodsJLTrdWIXg4FnhjoJZcHIWfB
 Psx7wvGs9TF5NhP9ZZ6wlfV+aC4PcLabmxlD45HLSqoGvIPY4hvezeqXGLNvBXmUUkoP
 lBWmNgmLAaGmswkxvaIyz6+Ea3Fbj1cqDU+dJ6RfCl/eMto3zLRFmi2R4u9ueFQUoY6J
 sYi9NWt5PpFLHAwKlNW+6Ci9073wnN0AK0ShdrIgmFjhRBt/qLBxnydrJ8IEmZ40X2wV
 8b/g==
X-Gm-Message-State: ABy/qLYIAqctDM7B8GUW9u6j7BYbxJW69SgGyGNphUl9AY+aqo6z3IRM
 hYyQnbxBOFp8reC8ofq2Dyti9Q==
X-Google-Smtp-Source: APBJJlGKwp4AmZBH8wn9WCGXvrGNKhkG80luhvVxrKuEKffDnq+76vxp1MDIU12B9wvo6hBrXjyR9g==
X-Received: by 2002:a5d:548b:0:b0:316:fc86:28ae with SMTP id
 h11-20020a5d548b000000b00316fc8628aemr8853742wrv.15.1690808480379; 
 Mon, 31 Jul 2023 06:01:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 j4-20020adfe504000000b003063a92bbf5sm13220390wrm.70.2023.07.31.06.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 06:01:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20230719130940.659837-1-arnd@kernel.org>
References: <20230719130940.659837-1-arnd@kernel.org>
Subject: Re: [PATCH] drm/panel: r66451: select CONFIG_DRM_DISPLAY_DP_HELPER
Message-Id: <169080847948.304500.9472944038515886970.b4-ty@linaro.org>
Date: Mon, 31 Jul 2023 15:01:19 +0200
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 19 Jul 2023 15:09:21 +0200, Arnd Bergmann wrote:
> The newly added driver only builds when DRM_DISPLAY_DP_HELPER is enabled:
> 
> x86_64-linux-ld: drivers/gpu/drm/panel/panel-visionox-r66451.o: in function `visionox_r66451_enable':
> panel-visionox-r66451.c:(.text+0x105): undefined reference to `drm_dsc_pps_payload_pack'
> 
> Select both CONFIG_DRM_DISPLAY_DP_HELPER and CONFIG_DRM_DISPLAY_HELPER to
> ensure the helper function is always available.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/panel: r66451: select CONFIG_DRM_DISPLAY_DP_HELPER
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a1865d3b98c97d25cbfbba4318180f5cfe8ec22d

-- 
Neil


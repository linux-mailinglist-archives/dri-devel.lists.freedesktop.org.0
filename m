Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E828C7696A7
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 14:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2147D10E289;
	Mon, 31 Jul 2023 12:45:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6110A10E289
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 12:45:48 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3fbea14706eso41225665e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 05:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690807546; x=1691412346;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BZR18Xj99HGOD1PDk2Wg3AoA7XuLUWWBfQUMdU0ykAY=;
 b=jgvt699AzMVlxBH1oI2qowHO2B2mkSF5UBl7C6x3uE+V+7CXitS/vDrUwVNm4sjn7A
 hYWqdaTLy0kSJwdomx4xQgMck79czHorgg6+3JupHIGLsOTbX0XMbShgajp9JT8YP+Z4
 iGnJv9Wi3ATuAD/rhPvOTCp2jFZffrI5knghLZAdGIrq3+YQpopxA7itc+zCnnWLV2pB
 asjqZ4Mz1oPYkTfTemqY3ntBXeqKJT411x5DQMU/SbzKUwGrExPu02ciL+ylmGuhmVVT
 bnxCXDj+mepnM3PD8aQ7adWDinXC3470xSbC8ADmvKn/32xl9bknJfeHHx1TO/YicqiB
 jGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690807546; x=1691412346;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BZR18Xj99HGOD1PDk2Wg3AoA7XuLUWWBfQUMdU0ykAY=;
 b=QHyH3jWMOwIt8FL3uk9d0I4N9dgZ+3ITRkSjAVeoQsEuVm0hu9X3jXvv8mxU/ehoEr
 9hiZMPoK5lidCC/II5xhlI6cBlySNlDWggEL7zIWl4TLTPzfLnBPjVsVUVY8TQmdaSWJ
 BFiatGx4589FNuuxLGnin6BO+W98iiHJtet0enm566DZF5jSkhxkw+ytG5XpxvkL80wU
 iqm8DKV3Ilvz+beH7L+6nRPEArEXtzYEeuMQuVsZBSJ+v4JIKZJWvKYXxI2qZ8j845OD
 TAOhciNTWFPQbr+T17hit5YSILJ6YIcoE8uqXEVjWDsbNyxUWN9rCdscuh+L+p+I+kJL
 9x6Q==
X-Gm-Message-State: ABy/qLbsDfvpZB/vCwj1dTfYHJpabH+zRONlMt/c0ZcxqHpcG/YDR+D9
 v1wRhVamiXcWAyJOz63lnS6fDA==
X-Google-Smtp-Source: APBJJlFOCYdoGZugE0LD+eK8NwPii03aq8NdDzG7hI3uuNB7Ncsp30TabHxmxmI8t53MEh1yuMWeFw==
X-Received: by 2002:a7b:cc91:0:b0:3fe:2102:8083 with SMTP id
 p17-20020a7bcc91000000b003fe21028083mr1660224wma.26.1690807546572; 
 Mon, 31 Jul 2023 05:45:46 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 s21-20020a1cf215000000b003fc00892c13sm11117068wmc.35.2023.07.31.05.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 05:45:46 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20230719130940.659837-1-arnd@kernel.org>
References: <20230719130940.659837-1-arnd@kernel.org>
Subject: Re: [PATCH] drm/panel: r66451: select CONFIG_DRM_DISPLAY_DP_HELPER
Message-Id: <169080754563.253642.4338546109176180391.b4-ty@linaro.org>
Date: Mon, 31 Jul 2023 14:45:45 +0200
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


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0465070FB70
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 18:10:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 649F910E4BD;
	Wed, 24 May 2023 16:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6064210E552
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 16:10:20 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f6042d60b5so12916625e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 09:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684944618; x=1687536618;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=68APWrLI/lODKmNHwIM0ukcJpP1wefTEFp5Sr6qhG9I=;
 b=j2kolavyACh6gqcIimKmP/K323GslHL3Lyhf27xsdVH5SvQyk6YU5cyIUgIa7CWdfM
 IlQ03hhq0lnlMnPG/3ePrr01OcmHUx1+OugHMAf4QlTlh7UbylwGNhmBzZQNBJXMmsnW
 ybyc0ViCZdVLv0NZtJCg2d4WnpsW5zwDAiueQ6pN8q92EMPegJQJYQXU9tc0REspucvy
 LOJC398nCw4dAkszxjwPnhrdajF12s4RD+k+LDS+3fekoJDAWB1bUIc515Sn32yTik13
 zpWHi9kTAgEk02cpRrrv/gbY+tV9ofqtJlQjsG2UfFcSrdKy6tAySVVDGuqPoi5W9rTy
 xMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684944618; x=1687536618;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=68APWrLI/lODKmNHwIM0ukcJpP1wefTEFp5Sr6qhG9I=;
 b=FGxSeyVsPHUHX4nUQjildmLtjLfzX4+S8DRVF4rurF75Eal75GV4tsy8BIUgyYQgWd
 7ZuI9yCznrI5pLI6/B9S6K07uVPhs3fWqq8VjMVRgauSNGSI/egQGIp45UQv3PH5QT1K
 O2EkRP04C+da57/h6GkiyKwQ8onJ85RobM9JWbHBkUjoh7d4JAkmKNR/nR3rCeo0u7D2
 sxKxN7NiSXFuN1u5P3tiVLXAH2qTqfhWjov/1fV6gkf0t4kUi+AzfwCMHaxcJb13lFlt
 csEvZcxT7aBZcBf6jPVqnkpZ6bVTrSTUcCklIxrebKWGS6njY1E8hOIUQ/MF5NMojPnp
 KbKQ==
X-Gm-Message-State: AC+VfDxH2sppbTtueZDOpBb5oU9A1nRwXa+cmVeQ+scj/FXqBlAZGOd6
 adWPK9clk28PDMj95UA5nBs2zA==
X-Google-Smtp-Source: ACHHUZ7Hc7E2ydGg0YS+yWHxWltrgPKxcLAgicQOx2yuY8MZwOAy2cFJzu+reC17VIzNrkvp2fr0Hg==
X-Received: by 2002:a05:600c:224a:b0:3f6:53a:6665 with SMTP id
 a10-20020a05600c224a00b003f6053a6665mr239012wmm.19.1684944618231; 
 Wed, 24 May 2023 09:10:18 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c214700b003f4f89bc48dsm2865399wml.15.2023.05.24.09.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 09:10:17 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
In-Reply-To: <20230524155956.382440-1-robdclark@gmail.com>
References: <20230524155956.382440-1-robdclark@gmail.com>
Subject: Re: [PATCH v5 0/7] drm: fdinfo memory stats
Message-Id: <168494461705.3403386.1668654169323555925.b4-ty@linaro.org>
Date: Wed, 24 May 2023 18:10:17 +0200
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
Cc: linux-doc@vger.kernel.org, Lijo Lazar <lijo.lazar@amd.com>,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rob Clark <robdclark@chromium.org>, Guchun Chen <guchun.chen@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 linux-arm-msm@vger.kernel.org,
 =?utf-8?q?Marek_Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Sean Paul <sean@poorly.run>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 24 May 2023 08:59:30 -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Similar motivation to other similar recent attempt[1].  But with an
> attempt to have some shared code for this.  As well as documentation.
> 
> It is probably a bit UMA-centric, I guess devices with VRAM might want
> some placement stats as well.  But this seems like a reasonable start.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/7] drm/docs: Fix usage stats typos
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0020582a8afe9a8570f80ec503c59bf049a616de
[2/7] drm: Add common fdinfo helper
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3f09a0cd4ea3b9d34495450d686227d48e7ec648
[3/7] drm/msm: Switch to fdinfo helper
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=51d86ee5e07ccef85af04ee9850b0baa107999b6
[4/7] drm/amdgpu: Switch to fdinfo helper
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=376c25f8ca47084c4f0aff0f14684780756ccef4
[5/7] drm: Add fdinfo memory stats
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=686b21b5f6ca2f8a716f9a4ade07246dbfb2713e
[6/7] drm/msm: Add memory stats to fdinfo
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3e9757f5ddb98238226ad68a1609aa313de35adb
[7/7] drm/doc: Relax fdinfo string constraints
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=90d63a150b85fd1debb9c01237fb78faee02746a

-- 
Neil


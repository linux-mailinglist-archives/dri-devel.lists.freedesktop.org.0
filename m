Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD35673C18
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 15:34:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E06B10E95B;
	Thu, 19 Jan 2023 14:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A36710E968
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 14:34:01 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so3696959wml.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 06:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yx2sgR4I+PCqSdEJtAUh2LY7zlVFeams01kArMc5MAQ=;
 b=Hz0ugRV4NBOTO6QAdNbUHpUtlQLtvH6+/rvMt+dL9gK4pvFOCbn0EGhSaYRAnqMTYd
 rUGzPAV3+WrHZCog/auxZ4IFl3CVihBlMfMkLdkhfXFTIsVmwxVSmEKLInlefFnOshbr
 ldbdX5Aiks1Wd1enfa4K5FJ+SQuoxlzFmnx52wjB4Ybge1nzzykkv2ANTIXKMXOHXAKo
 PMk/GhsoKvGT9cLDsSMY0m6jLyejTS/JgX71IPmZvgoKcXm3ipkdZJz4fU/yQGg9du3c
 KeN/VMpUlVHX6QkfDFjpp8oyqWHx2EvCDnnR1GQxEP7Oy+MOU7ovfVlZsyBBnKSfvylB
 7ZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yx2sgR4I+PCqSdEJtAUh2LY7zlVFeams01kArMc5MAQ=;
 b=tTaRmJAN9d/yVpi6tgWBaWMpfIPSE+TpZBlmHiyfhffICDQyoso61YCcMV5k+0mBuM
 12oNtuz2/6jF8b1muL9u5WIxu85t5yQNMp+TYd0+QOgntysAVukVSsab+oZMjj/bDwID
 gqY30HMxhoB0fpsGMgpZRiXAN1cRJ13pDFKDKE8AlHfQ8XErl2Y3Z8hNRZGc2k9yoMcs
 1c6Q33lqsvDnel/vo0Aumt+/79Pc3/Qsxn1mOOEOlcOQK5ZLqPmeqRnZkPwI8fjCWoxt
 Ad9uRZ4DDJ5kzMcsYjOaVX+t3etEMTh31msLWcd9c3gaEPRGk60qVq7zPURaVAZd1fzt
 NeHw==
X-Gm-Message-State: AFqh2kp5YWMoWQba1G1ZCgobSWHTZJKF4OKxdFKJkYXV0VM3j2Zwps4H
 E0ntNooGa02r2YjNkGd5h53lPw==
X-Google-Smtp-Source: AMrXdXsgEg/Qm0W/QIFawUu26Bw1sWppVEJ4LAUXOnzVHWIuhwj3UOeKLF7fV5+pQcGTFgqIRBsMFg==
X-Received: by 2002:a05:600c:995:b0:3da:f4f5:ad0e with SMTP id
 w21-20020a05600c099500b003daf4f5ad0emr10396023wmp.9.1674138840071; 
 Thu, 19 Jan 2023 06:34:00 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a05600c3b1b00b003db012d49b7sm7832926wms.2.2023.01.19.06.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 06:33:59 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Richard Acayan <mailingradian@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20230119-topic-sm8550-vtdr6130-fixup-v1-1-82c4fb008138@linaro.org>
References: <20230119-topic-sm8550-vtdr6130-fixup-v1-1-82c4fb008138@linaro.org>
Subject: Re: [PATCH] drm/panel: vtdr6130: fix unused ret in
 visionox_vtdr6130_bl_update_status
Message-Id: <167413883934.668266.5467309619492454547.b4-ty@linaro.org>
Date: Thu, 19 Jan 2023 15:33:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 19 Jan 2023 15:04:12 +0100, Neil Armstrong wrote:
> Fix the following warning:
> panel-visionox-vtdr6130.c:249:12: warning: 'ret' is used uninitialized [-Wuninitialized]
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/panel: vtdr6130: fix unused ret in visionox_vtdr6130_bl_update_status
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ebd05c0e12edc568243056711ce00f79e19eab68

-- 
Neil

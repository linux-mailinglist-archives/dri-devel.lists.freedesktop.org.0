Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 120DE509111
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 22:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF93C89E08;
	Wed, 20 Apr 2022 20:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DE089E08;
 Wed, 20 Apr 2022 20:06:41 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id bg25so1206990wmb.4;
 Wed, 20 Apr 2022 13:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=nWM6fd421Z4mKGkR1OIW70pm4ctWscYqXgFoO0lKsdE=;
 b=WCxCuoNchmrc/oA4EswPMRVUrXUqZW5DzagrGczH8EpL1ShlI9Ip0lE+2P3fIR/8A3
 nSZGQha3A+hSniBiMQCMlbyLHwpXrS2x0d+ge86bMgUrr6oX+1HhgNoHXe/w/PU9p4oA
 R/BtqXmIqBn4I65qfZbX1zGjs/SgNLf+gGLNrsS/t9iEWhMKhOaKy3eogScToO68HwBw
 G3NbNRCkLLGFHA7lmLusnIp3P1DBmACX45+MSbJ1zLPzpKtohTM+EGlI8uorwTHH3uFo
 PD0SC+OuHL+qEdbcUs+Wg554dfoRPduXe6y2TWERqZmFsCMyYMM35tlkoJwvYNJcP5jW
 1dpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=nWM6fd421Z4mKGkR1OIW70pm4ctWscYqXgFoO0lKsdE=;
 b=5aMlhslrjbQLN+zYMkWonqjxgAUnXVRiYW9HJoHkhqlyEhMph3fnLDJ68kckwUI91s
 sBGwBueQj32NHDJGMmPcXB45RTwZvYY3YBlPIDKvjSVjP/ts8MXdebnaNG8PiJGJi6Y8
 CDuXSfW4FhM0YLM31sN4KTFYlFqrDvG3q+M2sKbD2vRE2XewJEFirxTWshfGSFOx1Ca9
 QjVnCAXnxvwcVUcmvQk7haZ2bda9zwo5OxxcQ7CyGDzmrsFnpkyicTHUaW9iz2hdaxQN
 B44X0XoOhIjP95iqvgiHVNkyLVnx5yeNw3iFAlGEybvTUCohrJvzeChee7pAzx9DO4Ph
 38uw==
X-Gm-Message-State: AOAM530LNbidQD241tHRPiob5CjmwUOCtwtzOGwizpS8SezPuA1FMXPa
 pjCMxd/uj/A/IEXAjuASM39P6Da8vRfv8xi/bzi8k8Lj2VY=
X-Google-Smtp-Source: ABdhPJwa5LiP99fr6eQduCzYo4KsoL4ArGW9pdCWo3BZH9Cuso01h+ojF/xAPij16lY7vWBDIcBCEEykjJktJXqpG4k=
X-Received: by 2002:a05:600c:1f17:b0:392:5c1a:5ed9 with SMTP id
 bd23-20020a05600c1f1700b003925c1a5ed9mr5492570wmb.148.1650485199416; Wed, 20
 Apr 2022 13:06:39 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 20 Apr 2022 13:07:44 -0700
Message-ID: <CAF6AEGtvPo4xD2peAztDMPP2n4utb7d9WQboMFwsba9E8U2rCw@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2022-04-20 for v5.18
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

One more fix for v5.18.. actually a revert to fix iommu breakage on
older devices

The following changes since commit 390d645877ffd6dcb55f162d618045b2779217b3:

  drm/msm/gpu: Avoid -Wunused-function with !CONFIG_PM_SLEEP
(2022-04-11 18:35:31 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2022-04-20

for you to fetch changes up to 0371870b96907bf560ecf7dc3fadc238fadf7845:

  drm/msm: Revert "drm/msm: Stop using iommu_present()" (2022-04-19
10:33:07 -0700)

----------------------------------------------------------------
Dmitry Baryshkov (1):
      drm/msm: Revert "drm/msm: Stop using iommu_present()"

 drivers/gpu/drm/msm/msm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

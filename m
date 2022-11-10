Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F1462477B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 17:49:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF6F10E6D1;
	Thu, 10 Nov 2022 16:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A1E10E15B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 16:49:49 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id u6so1831205plq.12
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 08:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wyrWfcByjJXJ5u7emZGohwKYRcoGGODByISYDFHgldU=;
 b=SkZKW3Yo1le1fuMFEG+mH3AW0pGZzhfl1jquZr26xXoWgcpGUgwx/9i59trYLnbyNp
 0fECbdTZThXTLRMivyi83uOwpVX+PQtcAkIY/lpHnBGqzgJ8HE/JGcY/yGpDr/tts6s8
 fEUAZIy98nqHcvqsGCP73UaA5HAyPfN1MhCsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wyrWfcByjJXJ5u7emZGohwKYRcoGGODByISYDFHgldU=;
 b=r4L05TDVIo4K3Hp5Q85iDaZ5dU0S+UQSoq2r2ZBvh85AL8L6FeP1fBm1TAaGdDOyse
 g/iKoAgjL9u5jjA9bglsnZLY1DtNal1bdle+IZk7qlDXnmg/l9twi6vjrWf3Ii3iGq8e
 4J9NRWbT6IO+/UVOy7+rvi7LgZJHJwrTzHtiS5BYv2TZ4agF1DAY1cUcUNKFGZmJSW41
 AepqEj/LbvHCI6zMAMPlcGfEVfYIetKvbIDtT2LMQr2/pCrIj+jzKNCP/Rw8hcEJM0Yo
 /fW34Q5BwHJMa8I6f6bAXD/qaFasZn+0ILDf7PtjAWHJO9uj3UfQ/BTGCKkCRHDoBjS8
 qG6w==
X-Gm-Message-State: ACrzQf0Mw5wzW6hjFpGh9HRLp9eE8c8RS+pOqBVAXLJty1I4OTF4KDC/
 SLTVmDWIw4LQtEEZqEHi/7pHGQ==
X-Google-Smtp-Source: AMsMyM4giYvP77sTPDWGk4iRexWkKdhko7Z9x8ZbVQ0+6fKkZQD8biAGSZtsNEYAUXSGiobU0OhdmQ==
X-Received: by 2002:a17:902:e803:b0:187:3a52:d262 with SMTP id
 u3-20020a170902e80300b001873a52d262mr47366180plg.85.1668098988693; 
 Thu, 10 Nov 2022 08:49:48 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a170903120e00b0016be834d54asm11586089plh.306.2022.11.10.08.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 08:49:48 -0800 (PST)
From: coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date: Thu, 10 Nov 2022 08:49:47 -0800
To: Ben Skeggs <bskeggs@redhat.com>
Subject: Coverity: nvkm_dp_train(): Integer handling issues
Message-ID: <202211100849.DDBADD2A6@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Karol Herbst <kherbst@redhat.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-next@vger.kernel.org, linux-hardening@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20221110 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Wed Nov 9 10:43:10 2022 +1000
    8bb30c882334 ("drm/nouveau/disp: add method to trigger DP link retrain")

Coverity reported the following:

*** CID 1527267:  Integer handling issues  (NEGATIVE_RETURNS)
drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c:458 in nvkm_dp_train()
452     	u8  pwr;
453
454     	/* Retraining link?  Skip source configuration, it can mess up the active modeset. */
455     	if (atomic_read(&outp->dp.lt.done)) {
456     		for (rate = 0; rate < outp->dp.rates; rate++) {
457     			if (outp->dp.rate[rate].rate == ior->dp.bw * 27000)
vvv     CID 1527267:  Integer handling issues  (NEGATIVE_RETURNS)
vvv     "ret" is passed to a parameter that cannot be negative.
458     				return nvkm_dp_train_link(outp, ret);
459     		}
460     		WARN_ON(1);
461     		return -EINVAL;
462     	}
463

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527267 ("Integer handling issues")
Fixes: 8bb30c882334 ("drm/nouveau/disp: add method to trigger DP link retrain")

Thanks for your attention!

-- 
Coverity-bot

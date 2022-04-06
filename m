Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 637914F56E3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 09:51:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19FA10F259;
	Wed,  6 Apr 2022 07:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58DF010F250
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 07:51:38 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id bg10so2533207ejb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 00:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:reply-to:mime-version
 :content-transfer-encoding;
 bh=2nELXTDvrDfP+iHQ0Hafjwd7TmrLV55lCfpPKHMnA/8=;
 b=gIMUQl5p+xLXWYDMVAENVjFSbODt5IfB70ttwEAtyYhDx3Fci8LcHsa9NEEIIOau90
 ATlrlhpzeCIYKfl7+x/vAf2jc+H6zhGH3i0B/khLxyA0JkQJcH86Gr3kFkf++P1x9HrE
 uEuznJ9OekWWf8NejG6BTbM/kA35JD7PAf0YeoNoBotbZaiq88TsWNSUYfS0GVhZryJQ
 hGlkL0egr2r9Lbpe5k0BsRp8MoahbSMaMoKHtNUz0uMeycxFny1R4hMgZU3ODGBxVBrI
 tk/7Y1fJ2jKWXdmll17HPR2vMZWMI3vsv0HSPsqc7BcT4sy4MAVjJeyc5GBbBSX5Hmxz
 lhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:reply-to
 :mime-version:content-transfer-encoding;
 bh=2nELXTDvrDfP+iHQ0Hafjwd7TmrLV55lCfpPKHMnA/8=;
 b=6gbqviL4Jtp1d6427KdItNqY9rQyS1BzaJgt9acSiwoBVRgRiRt86RgGxg3BS63p+S
 FsqYS+Jv44t3rFn/xObOuP+qX05WYZLCCdcmjvC3l2hAx3mKGPWZYJICVrDbWlHxKwuA
 qtZ9JHUyzj5HxYiPRp0UXkO9iW8rdoY0J7WWJLOlJ1DZ9mzgOeAWa7LhEmaog7eF35vu
 kIHr90zTipmJZiIP2v95WlDGRGN9e/3QAKgbc02NXy4c+/hpm/U/s9dCfp8t2QrGTQGU
 cBisffv72aSJbKNdI/UTy1ywE1Y9vNZeXl8P/BjG3RQ/IDVoLQFYr0G8TGpqFD659Obg
 b+RQ==
X-Gm-Message-State: AOAM53370JpznHLiS+tJgkjf4NQu3MpsrZqfkm7M/VjGKh5lEjMHCHvC
 7651cQPRfmwoFYDpaMzv54YwQwy2Tp4=
X-Google-Smtp-Source: ABdhPJy3Z4BUctGN137i76zvO59Ap3tpgWA41MtK4WTFO/RO0oBql9dblsGDQFlm0rij/nPL81nevQ==
X-Received: by 2002:a17:907:2d93:b0:6db:ab5e:7e0b with SMTP id
 gt19-20020a1709072d9300b006dbab5e7e0bmr7077313ejc.262.1649231496786; 
 Wed, 06 Apr 2022 00:51:36 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 bs7-20020a056402304700b004197e5d2350sm7376386edb.54.2022.04.06.00.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 00:51:35 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: 
Date: Wed,  6 Apr 2022 09:51:16 +0200
Message-Id: <20220406075132.3263-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Reply-To: DMA-resv@freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

rebased on top of all the changes in drm-misc-next now and hopefully
ready for 5.19.

I think I addressed all concern, but there was a bunch of rebase fallout
from i915, so better to double check that once more.

Regards,
Christian.



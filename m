Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FAD40F795
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35CB76EC45;
	Fri, 17 Sep 2021 12:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7614F6EC44;
 Fri, 17 Sep 2021 12:35:17 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t8so14939664wrq.4;
 Fri, 17 Sep 2021 05:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NqzuWFeqLMR3DIAr8L16pZ3er+uc6gXgKxZaXcF1adA=;
 b=MR4GVrYUq6pOKxeWCneMvbSRqOC+VP7J5W57KEltAJySgk58K8pLppWet97v8xr9aX
 eb2V/mPYRz6HL01TnvLNKPQ8Tz2PlzAAqNDxPkCgOec3gIuwxxFwml86jPEsA8B3aQQ8
 iZB/PiZ4oLuGzCphdVPgKJ6L54dJvbQ46+jf3uI7NTYjLgv9o3HLQk949201HWtFMOXM
 xAYI/JNljopIky6BUOHugrkZZyUec0piAVdIschbj4Er9Ak502jXuQ3qJFIkMzquZa8Q
 n43uaQzUhAPF8ddZ3lRUE+oZtPlVf7U5Dzrl1Pk9J9wsAQ/dH8KARjNA0DIonGaHMW3s
 oRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NqzuWFeqLMR3DIAr8L16pZ3er+uc6gXgKxZaXcF1adA=;
 b=B6+5v8N5F6Y3+jBECwYGGWI7TmuBBh4/DXwBa5JfMLfgcPX1E6RSgix8aLWO0YX2I0
 okv5zeOmKbfarQsv+XMDVeaCswOFLadQfm2pVA9mrHDPiNBN58NG0BOsigphkMpDh4Zd
 EOfTwGxC97koc/YETJ8dOlQxdhlYTqS4LbTSWSj485T800NDOTgl6GSKu2wMZSSBiPKi
 FjvGEPbWErk0mDOfAxKFZVVwf0+TgWqMzCdl7sInEUfCdt6kuyqxlZrSWghs2DiTd9V6
 eRKSDkJriGfgXnPKtAaU3S2bB3G7+waW5jQpSIw3qwY4BlJklSZFs3/xuuqueqNMFtmi
 GoNw==
X-Gm-Message-State: AOAM530i8IdmlsuA2XhjD6K6kQCo/g19IoBEihtGN2eG3eTv+gggg6IP
 ckW1tzjeB0X+CidfCsQJT5e8cmu4aZ0=
X-Google-Smtp-Source: ABdhPJyK+onjjmSAKaFQWBBQw+peagAXA1OgNeJVDQ/AMdoYnHiB3CR/VT28asGrQ3AobNAvWnDc4g==
X-Received: by 2002:adf:f18a:: with SMTP id h10mr12091268wro.42.1631882116093; 
 Fri, 17 Sep 2021 05:35:16 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l21sm6122049wmh.31.2021.09.17.05.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:35:15 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
Subject: Deploying new iterator interface for dma-buf
Date: Fri, 17 Sep 2021 14:34:47 +0200
Message-Id: <20210917123513.1106-1-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hopefully the last round for this.

Added dma_resv_iter_begin/end as requested by Daniel. Fixed a bunch of
problems pointed out by the CI systems and found a few more myselve.

Please review and/or comment,
Christian.



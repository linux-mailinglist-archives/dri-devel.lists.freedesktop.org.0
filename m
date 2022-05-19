Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BA452CFDD
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7169B11B32B;
	Thu, 19 May 2022 09:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774D211B323;
 Thu, 19 May 2022 09:55:12 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id gi33so397580ejc.3;
 Thu, 19 May 2022 02:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/vsJMbX6LWEXAt8nycXMSv1hplzPEWvHAX2svqfeVlQ=;
 b=b3Yy+hFzKiLqpW1ZaipZgGZ2+tgCLCYCKLZF9EmcaJmoiiqioolHrY16GX7t+g3bBr
 GoxTR8jUUkukc3ouPKX22L2KLyIHzEP2blk+SBftPhyhRzwnDKGl0m2NuMh0Ortgi2sU
 449m8BB5BM3f9WqW2RJIyjqvGaLC/keExm8hOLBgck05kwnDJazQrBP5rlUqLRIOKAQH
 DF2vEgbc5XGhLEuYY6GdGr7zMZ0OoY2hvx5fI6XrgfsOlYPivgoOlCxUnhq/hyUm6Q51
 asvs2ryb+uvKOEoB7uAtKYhwKlBQbi/5DbLSXP6WwT+vc/yWAy7wY5NVufmDwU5W1t/A
 KOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/vsJMbX6LWEXAt8nycXMSv1hplzPEWvHAX2svqfeVlQ=;
 b=xWxPR3kz1aGNemcvBqKT418G/N2LlHhlqVOu2lNkzgsOFeNStFIJ6/ggW/PZuMHfMZ
 7C0i6Q+4UecBB6emKpuGTS/9xJjTKD98f2L8/7ayt/6GQZYw+Z8/rdVyuUcC1C33hGbP
 eb67zlkeSFdrWBgOQWjwBJp7srjaK9IjcJUnbZS4TMtPQGt9Vl6mgfuHqtrYHFuKyS/x
 0kVfOitEJJMRtsmAhWpRdn+lAykhtu2oyXDDsGn9JSw7f8ux8pxQypb0xXAfs5pFaYg/
 nAsxdHgVKs5alAT3Diid+xbFdt0keIQBeo2KRFoOiUrR1Z60+afIdfzFfkxWHg/nn6Cq
 ZTVg==
X-Gm-Message-State: AOAM530M8XjTW7/pFIAic92hFW/bt8cDhKYlAu9iKyA2BMGhqJ6+CYAD
 MQWklDqUg9vdbO5bBaH/smW0qlyEBrE=
X-Google-Smtp-Source: ABdhPJwH1VEGfx1JH2pTYLnJWp5keoXVmnbTgWxMvSbQIt7/oZYO8mNl1qxsoiUAlsiCl4/GR+l9xA==
X-Received: by 2002:a17:906:b74a:b0:6fe:a118:8963 with SMTP id
 fx10-20020a170906b74a00b006fea1188963mr91640ejb.537.1652954110905; 
 Thu, 19 May 2022 02:55:10 -0700 (PDT)
Received: from able.fritz.box (p57b0bdaa.dip0.t-ipconnect.de. [87.176.189.170])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a170906518600b006fe9c65ffb8sm388267ejk.92.2022.05.19.02.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 02:55:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org
Subject: 
Date: Thu, 19 May 2022 11:54:57 +0200
Message-Id: <20220519095508.115203-1-christian.koenig@amd.com>
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
Cc: matthew.william.auld@gmail.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just sending that out once more to intel-gfx to let the CI systems take
a look.

No functional change compared to the last version.

Christian.



Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A7E414496
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 11:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D25F6EB22;
	Wed, 22 Sep 2021 09:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F89A6EB22;
 Wed, 22 Sep 2021 09:10:48 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t8so4714252wrq.4;
 Wed, 22 Sep 2021 02:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QPaZIA3OXheGq7H12t8v9AcLQzxM/IY6gpIxbQ9NIBU=;
 b=HRcjuNmtQ4dQCHzxiGyBFlz1o6ZIpqHFAJn9cSrSLn0hZTX6aD5UG1NC2wwnL9lW83
 lMYhp13/0ku4zCP5lIwxCiL8K2SVl7MQuQZUeoKuvi5U0jFCrxj1Ib8aqERCnwd5rb03
 wpm7porZmDT6b8347w/vFSGIvriPPXKJm6FfpiT3wVOnW4pg4kc4b7W8E5gnDeSeuXHk
 /Ojsw0ybbotcHCHTvbU5cNuN8jXmr2peThQfgIwvuEAQGpMkHa99wb9Hhz3Q10T/k0LG
 gNMKPqaT24m34a4Ex2qsZccF8y1YdpbiOAPqKboRzc/P+odMXwSqLm21hB+1ObMSm9Ld
 KvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QPaZIA3OXheGq7H12t8v9AcLQzxM/IY6gpIxbQ9NIBU=;
 b=GIfsz2o0JTQfVsJsMYCtyf6173fnR5EmXy6KePJtoC/55+agLa+tag0alZLF22JBd7
 xZMWsYwDNJyu6zhYS1smDdTKPBKDxFDSgOc05+tSzSYV+yn65PUloV05mYmeSwXwURQJ
 tCCbEyZxFBoXm4Bx8sxV5wWgS8Kpb1JeDBzKwc4b73V1/tUlFvNLSGXKJu74brHfQZ9s
 SbXj/vHRDSKm1tdJoKOGGe7T3s0UWHkOuVHW9J7lC090yrvfcnyBYPHmDV1owsxCfl0Q
 i8oLP29nO32swRzIPrH3jFpOhsM3URIvh9v/oHNuGmo87LvOKMFcr+xa+KQthYAYTzVJ
 Dkzg==
X-Gm-Message-State: AOAM532dPiJjYLoW2YpRXET/mCjKj+HNp7V4LSY43X7En2NS5GRUFwUE
 wqp6aV3uDeLZ2inlAIPflZI=
X-Google-Smtp-Source: ABdhPJwz9tdHs2Dqxbtq5mgu3pKD03j1gaYVtgUGe+HEoIn8RvQgu8P5MxeqyaGJXezpZ6uHsic2rg==
X-Received: by 2002:a05:6000:156e:: with SMTP id
 14mr29311279wrz.393.1632301846902; 
 Wed, 22 Sep 2021 02:10:46 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 r25sm1535515wra.76.2021.09.22.02.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 02:10:46 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: Deploying new iterator interface for dma-buf
Date: Wed, 22 Sep 2021 11:10:18 +0200
Message-Id: <20210922091044.2612-1-christian.koenig@amd.com>
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

Hi guys,

The version I've send out yesterday had a rather obvious coding error and I honestly forgot the cover letter.

This one here is better tested and will now hopefully not be torn apart from the CI system immediately.

I tried to address all review and documentation comments as best as I could, so I'm hoping that we can now considering pushing this.

Cheers,
Christian.



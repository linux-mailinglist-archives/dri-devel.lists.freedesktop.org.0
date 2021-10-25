Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B90894390CE
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 10:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE1989C59;
	Mon, 25 Oct 2021 08:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1EE89C59;
 Mon, 25 Oct 2021 08:05:36 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id v127so9787441wme.5;
 Mon, 25 Oct 2021 01:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/BvdSrmLvfbeS7vCscUDTyG7q7FC8+46Uolr6cwrk/w=;
 b=HCCePTtrW7QvELmRg9lWH7Io+EGZLKYAADy/xb5f2dTe/GeG61WO+11YazF76VS+Q2
 T2emHRjGm8lT1oyyfz1Sm8Bs/bxNPElydxYEIYQwRMtvui/IRCEtTC+TAVwgdoj4/8gj
 WoZXf5qF7j6c8QXQeqi3k1BfyO929KpRZYJ+4jlxTwCmDl4khDqSXGQzVWp/G25ki4Q1
 tDhadYWWUab2h96MvwYEoMiuFjNsIkkv5Lb8w2BB/wfAHuS0s23Hg6sLFytdGiL8iOsz
 Ep7f8qSZpFY83naIbPpj79iNgfGeF2pxA2pNTlK3ATvMV0F4hZppEpTY3lRcQ2f9y88i
 lB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/BvdSrmLvfbeS7vCscUDTyG7q7FC8+46Uolr6cwrk/w=;
 b=LbpM1xzCkVpzIghV8g3dfO89wbh2snZYEGSW+SIqW3dv2Tifr2IiNsl12FNrU44qSo
 O9rzejl0VXiywshfX7HQ7jItIzAs8oPq5mQTjpRjJev0lI+MmMR45EHwLWCyYOKVbRmT
 DDlhHRWob6MBqrym+Z+tj0nDdzqcSJBThAjGXPhemxEIue6A23zkatM5UR9VlaHFLXE5
 wsguJtu+qBq0UjPz2tyqonFtro5pe4iN7Q1rtRmAc2mvOO/2Fh6wFF32f68JT3utIzI+
 DGZy1yczVteC+Pad1yIc8eHB96sTFzRrou+BmOrG5ZkmOR6N8mX7d/ZEFQa7ZMDohlsX
 NM2g==
X-Gm-Message-State: AOAM532jUUZ9dJ2QUKhthidzUDnnSyPQTqgmDYDYhoNGiN7tgH6t1FV1
 iK6n4XJ2yhHMKFntfJZ7Flv0F6UcUzA=
X-Google-Smtp-Source: ABdhPJxBhS30Y82jamu4xa+XrJ2R797/ttNKXrYuDjhwj6ogtV0uTy9RloQJJXRanzZo455qlYXrLQ==
X-Received: by 2002:a7b:cd16:: with SMTP id f22mr8124980wmj.42.1635149134951; 
 Mon, 25 Oct 2021 01:05:34 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l1sm6319691wrb.73.2021.10.25.01.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 01:05:34 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux+etnaviv@armlinux.org.uk,
	l.stach@pengutronix.de
Cc: etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: Two minor etnaviv DMA-buf cleanups
Date: Mon, 25 Oct 2021 10:05:30 +0200
Message-Id: <20211025080532.177424-1-christian.koenig@amd.com>
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

just two minor cleanups related to the new DMA-buf iterators. Can I get an rb or ack-by for that?

Thanks,
Christian.



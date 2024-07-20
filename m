Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39653937E6C
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2024 02:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D85610E225;
	Sat, 20 Jul 2024 00:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hmTpvJbT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B1210E227
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2024 00:08:51 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-70211abf4cbso1368068a34.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 17:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721434130; x=1722038930; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mCMKiB9PHfD52qPd1wfrk3t3J3IE++dXgoLcXRwYgnc=;
 b=hmTpvJbTDgXzn39NRf/DMMygjdPNcdAZRvspDehTlk1S8rHfh7PC2h67uBOPFmAZEL
 2K85SIUpRfW5x2M54WAQsMIwZfsk8hrrTAlXFsYqmFT+59tVVgY2qdDp1TC0mY+gMpSr
 8C0GRWeLbbs+OTarkiwpyeze6gmYoNR9+3CN5tuvKoAErw2SPhYWMh4lB8+LlkaGFcdj
 ziAKaPlsyIieSUciM5zdnyb5BcOlOaJkLhoND/WHvOGL6FcEvCp23F0i8Q0QLW4JIvm4
 xysWyyB9OxdOwCYMW8+icZGn/gxScVILnJ9SWEDS9MidSy3m88IuKGaikPP9plNrUeeU
 haNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721434130; x=1722038930;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mCMKiB9PHfD52qPd1wfrk3t3J3IE++dXgoLcXRwYgnc=;
 b=ha6ax2WV0IkJNLhekAv3gYd6DQ4/s7XoR9d3KnUzgRCROlBKX6+K7ObXOFzQuH/hTE
 ZJTdlhe6rVLdDKlwNG9iwaRXixlhC3apZETThqIFwoq0/U9YFo43yYfBaUy9W5qQ1cLd
 c3ivOoPQA8mBPQsxF/wIgK0AR3Rhryx/v3DnpLHqrGUzp7tWDNF0E9pjVEfv1NkxOjuQ
 PgFkSS9oB1JvRPsbZrQFT1WocP1cxgKwAjUAM6XdSgUlqgNYMKWspR1WIjyUpfNphsWm
 ZQNQJJg4fsgB/rN4SuAlVgDZdQ9Zf34xA1JR4S1DtyjGdkgeEGfjODUgaxu0UFsHd3vW
 EImA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr4HZcMTCDXunGq9ak5rHXtXstgsJQrvF1NdXVxw4NgG1nFLX9nuUQa8WIo/Z7FXYGmh8IMDZxS9xc4SYzR/FCVswBEgadFYOs6GGqn8xR
X-Gm-Message-State: AOJu0YwnMxOnnrf0qCRqnURmHg3ZdMjxJs5/1iALhAgxKpolVGdgPypO
 uairU2c0eu61EKOp1ianDFb/aKn5PmmmEmwOo7uzvt43lwIYm93KH+A6e1p74uI=
X-Google-Smtp-Source: AGHT+IFBuE1IdMv1IBmtbQHR53BRikJg2qb1/NqXUSNkPs4oi8KiZp3h3WK/mJhpUiX35iU5T0NESA==
X-Received: by 2002:a05:6830:7301:b0:704:4bb7:af8a with SMTP id
 46e09a7af769-708fdb05e4cmr1317892a34.20.1721434130493; 
 Fri, 19 Jul 2024 17:08:50 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:739a:b665:7f57:d340])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-708f6189c41sm518252a34.66.2024.07.19.17.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 17:08:50 -0700 (PDT)
Date: Fri, 19 Jul 2024 19:08:47 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stefan Schake <stschake@gmail.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org
Subject: [bug report] drm/vc4: Add CTM support
Message-ID: <18db2352-5f54-48ce-98ca-cbd898cc6406@stanley.mountain>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Stefan Schake,

Commit 766cc6b1f7fc ("drm/vc4: Add CTM support") from Apr 20, 2018
(linux-next), leads to the following Smatch static checker warning:

	drivers/gpu/drm/vc4/vc4_kms.c:555 vc4_ctm_atomic_check()
	warn: reusing outside iterator: 'i'

drivers/gpu/drm/vc4/vc4_kms.c
    504 static int
    505 vc4_ctm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
    506 {
    507         struct vc4_dev *vc4 = to_vc4_dev(dev);
    508         struct vc4_ctm_state *ctm_state = NULL;
    509         struct drm_crtc *crtc;
    510         struct drm_crtc_state *old_crtc_state, *new_crtc_state;
    511         struct drm_color_ctm *ctm;
    512         int i;
    513 
    514         for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
    515                 /* CTM is being disabled. */
    516                 if (!new_crtc_state->ctm && old_crtc_state->ctm) {
    517                         ctm_state = vc4_get_ctm_state(state, &vc4->ctm_manager);
    518                         if (IS_ERR(ctm_state))
    519                                 return PTR_ERR(ctm_state);
    520                         ctm_state->fifo = 0;
    521                 }
    522         }
    523 
    524         for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
                                                                                           ^
This loops from zero to state->dev->mode_config.num_crtc - 1.

    525                 if (new_crtc_state->ctm == old_crtc_state->ctm)
    526                         continue;
    527 
    528                 if (!ctm_state) {
    529                         ctm_state = vc4_get_ctm_state(state, &vc4->ctm_manager);
    530                         if (IS_ERR(ctm_state))
    531                                 return PTR_ERR(ctm_state);
    532                 }
    533 
    534                 /* CTM is being enabled or the matrix changed. */
    535                 if (new_crtc_state->ctm) {
    536                         struct vc4_crtc_state *vc4_crtc_state =
    537                                 to_vc4_crtc_state(new_crtc_state);
    538 
    539                         /* fifo is 1-based since 0 disables CTM. */
    540                         int fifo = vc4_crtc_state->assigned_channel + 1;
    541 
    542                         /* Check userland isn't trying to turn on CTM for more
    543                          * than one CRTC at a time.
    544                          */
    545                         if (ctm_state->fifo && ctm_state->fifo != fifo) {
    546                                 DRM_DEBUG_DRIVER("Too many CTM configured\n");
    547                                 return -EINVAL;
    548                         }
    549 
    550                         /* Check we can approximate the specified CTM.
    551                          * We disallow scalars |c| > 1.0 since the HW has
    552                          * no integer bits.
    553                          */
    554                         ctm = new_crtc_state->ctm->data;
--> 555                         for (i = 0; i < ARRAY_SIZE(ctm->matrix); i++) {
                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This uses the same iterator and restarts the loop.

    556                                 u64 val = ctm->matrix[i];
    557 
    558                                 val &= ~BIT_ULL(63);
    559                                 if (val > BIT_ULL(32))
    560                                         return -EINVAL;
    561                         }
    562 
    563                         ctm_state->fifo = fifo;
    564                         ctm_state->ctm = ctm;
    565                 }
    566         }
    567 
    568         return 0;
    569 }

regards,
dan carpenter

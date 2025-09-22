Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2762DB91A3A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 16:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2279D10E4BC;
	Mon, 22 Sep 2025 14:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aUYNPz08";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C85410E4BC
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 14:21:24 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3ecdf2b1751so2603572f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 07:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758550883; x=1759155683; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ee6b65LXU1FZHCCb5W7Ktsx19CyxUeRFxdlgW2AOYMM=;
 b=aUYNPz086/Ek4+9HhRTEJE2quJbXtRhtLPJcFqglcVxcJxKKSJdAOEaDindb/+nzQ1
 onfs2XcZbv6i3sjaVKWqHCQIMBTGEytv18amXAIIdASKu0oI8m5wjHEYVAmVgHlu9tPP
 CZ698gHpLqN3O289HLXRys8A8ryzIip6xiusq11P7bFoHJbpwZ3qTjZsbu/wDmywptJM
 Bjb6T0UFO+K0TPa+9IGj9l7Od/BKFxIsxITXLUU0T8RDVzeAt0OejkWFh8IzkiiqUFaP
 gHAf5Dzu4nfhzCTZL7AOI+VTzzxzSjYgQw1H+ByK2nNoMbKvpgn5PJy1q1FUrheiraEn
 ciqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758550883; x=1759155683;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ee6b65LXU1FZHCCb5W7Ktsx19CyxUeRFxdlgW2AOYMM=;
 b=pJhKfvy5uE2J0w/jUQLxi2K/cYreCo8MsixMhi02lbEPfg7TFM1bQTBlt3cr1OyG68
 U0/53RHb4FXi7gm0OMgsEQYK4qm8/S/HE3v4hFiBMf8u8agTk5DrONwBrU4zZVn86dDZ
 LIus1Njunpd2gwTmfKlsoarbSoRPTBp2djdHN0lRhS2MXZJsuOL5pa+kBLhuMJ2RbFEj
 DBW67ZHF/zCxm4M/7HCG3j02ZqKqnJ/b66a6k3dIgPG1dAa5F2YeBNhIo6Q9qyzgtI80
 k+rYrhJ5O5lxbD8FwuHQXPYg2zUjm0JNa6tsG+73I/5CNmIS/pdI4alS0Gpwq4KbmS17
 NXNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlRuRM/+Eoc8bN4B1VHvOHq4bEApyDjclin5BhO6DiSkt4yH5U/JgpEABGw2XBHWBZb9QHSFKqyQE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwORp/lUU6M0XI8MalgRAo1BvNiOBPV62MKpe4TzN8yLgUTOMCh
 cmXftBVrod1ItCcUb0F5c/VYtKoYjOo21IWuSiPV0TxXDZxc+EPY0M/duk3DKXUiBQE=
X-Gm-Gg: ASbGncv6tm8XuFiBwcl2SivE/Lf9aiXwQvgEAubkPNNJppmDqs0WoFUWiWW5WtfXFDy
 gNMtF9KsKy/EZPo3cd+chM705ifdiYtKC8fjpysI1cPPoex7E2BlrZE6VF4nC/+J/eh/j+gPBis
 LZBYwaG+ggc3/O9T+r7V+fNqoOiabOII35lfJ3hMfN0RqTnmIXPrEXpXc9CIFTdhPB5Gf8o30CY
 qjy0VuzG5q+rXBAWWnxU0bYmH4wEbfHK3mDMVWwtN2Dr7BzRnXobgtPDPllibno9TyFCQj42sWx
 dmlYPDJlJyCYPX+7Yxl5gXY3huZBcrola4oD6VU/bWcHmKadAkA2zpL6bk2//eKBoD0i66uXQhx
 Hb35bfl8Svy77hmxwc6oeUL6iXhLO
X-Google-Smtp-Source: AGHT+IGVth8Rkr+N0aKIQlgQTtQX/JETqm+y/O8LvhGk2/XDYb7EWMJGIyQGkoAosRAyxrZyAS0nOg==
X-Received: by 2002:a05:6000:2010:b0:3d6:212b:9ae2 with SMTP id
 ffacd0b85a97d-3ee88b04e25mr11499266f8f.63.1758550882470; 
 Mon, 22 Sep 2025 07:21:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3f9c62d083esm7771062f8f.32.2025.09.22.07.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 07:21:22 -0700 (PDT)
Date: Mon, 22 Sep 2025 17:21:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: [bug report] drm/scheduler: fix
 drm_sched_job_add_implicit_dependencies harder
Message-ID: <aNFbXq8OeYl3QSdm@stanley.mountain>
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

Hello Rob Clark,

Commit 963d0b356935 ("drm/scheduler: fix
drm_sched_job_add_implicit_dependencies harder") from Nov 16, 2021
(linux-next), leads to the following Smatch static checker warning:

	drivers/gpu/drm/scheduler/sched_main.c:972 drm_sched_job_add_resv_dependencies()
	warn: passing freed memory 'fence' (line 970)

drivers/gpu/drm/scheduler/sched_main.c
    962         struct dma_fence *fence;
    963         int ret;
    964 
    965         dma_resv_assert_held(resv);
    966 
    967         dma_resv_for_each_fence(&cursor, resv, usage, fence) {
    968                 /* Make sure to grab an additional ref on the added fence */
    969                 dma_fence_get(fence);
    970                 ret = drm_sched_job_add_dependency(job, fence);
    971                 if (ret) {
--> 972                         dma_fence_put(fence);

drm_sched_job_add_dependency() consumes the fence whether or not it
succeeds, so calling dma_fence_put() seems like a double free.  I
don't think the dma_resv_for_each_fence() loop takes a reference does it?

    973                         return ret;
    974                 }
    975         }
    976         return 0;
    977 }

regards,
dan carpenter

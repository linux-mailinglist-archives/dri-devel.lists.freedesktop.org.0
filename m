Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C05CBD38DC
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 16:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C64FA10E463;
	Mon, 13 Oct 2025 14:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WgcBJWS6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0095210E0D7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 14:35:06 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-639e1e8c8c8so8180684a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 07:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760366105; x=1760970905; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YZPF3TsDwqw3Z9G6KN4eJ0Uvl8lh/hd0MSmrorlao90=;
 b=WgcBJWS6h/lVC/GDbc6ki7knfNyGmIZQtKRshklVlt9wl2DARcmuk2o3gWLcMTpp8e
 D/km8fpUy6+ogx+AUVY2GJkvnZRZ1l+8zBD0fJl/cwrRQ2Wz1PtyaxjJGTUb6SZO5UhE
 OE14lt72ShXpAL1etB7hp1wCLNkY1nn+iOXzWPbJhyIP8uBOrFigR1OnvyHjZYIBP6wX
 t8U/Cr7NX7pCuOq+DsQojpixkfrPWfMtHTsfT7d1v0bb04TJqq3vbnHZSPi5D2bmCf9l
 lEx+HppzYpq9tK/cZPZir757LGr6zRQlQlN+jjVUKlRtGzN/rIX4qGM4oLl5If7w1VV+
 PmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760366105; x=1760970905;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YZPF3TsDwqw3Z9G6KN4eJ0Uvl8lh/hd0MSmrorlao90=;
 b=awQMtB07+qoaeU1LnRDkDGArnE2fs9rrB1Qg0yKQz7wME3p0wAG2aIzjNkGIToaSbe
 e2Sf9F8ja/213ptYaO2zbpURnPDVHHByNIPtmSBALiLVCnTU4xqguh8LAXNcE9A6828W
 n6yanNza8Cvcu8hOVpWFfPCiE3zHlWLKzj3MQw7KYjrEYOsGLIJRSQ/rz2SamZ1R2rJI
 nXxTfHBH5g97SKps8w5qpWUcJzMTifI7TLGd7eb5u5H6L5g+5NG5lCDen9wmzEFfIbVF
 EhMoEgSul7oUr+lnaaMQxk9UoErLdUnFTOgtowAqXTAe6TcY0H2jYt46ht/a5Oj+KKCR
 0Sxg==
X-Gm-Message-State: AOJu0YwPTGEYUU641r6TKyjY7yFMHV4bTw3NjJuOyRPYPPx9eOIL8mV9
 7d0o+y3CLgKTMVQBn/KbYBX5IFlhVH+PNhHLS/EDSwBKfd1t6icltkA8
X-Gm-Gg: ASbGnculTApMPcdx70sQ8RFnjUzdaIyXAp6iNXGTNmRh2LJN1fsAz+6lDtWjmgXvCyV
 ca0Tmx5EF9W+IBXTUucZuWXPNG80NfOJpZbYIQi79hv1SqOkZFbPPrZJr6WvMwx6yOwOi3KBvtw
 61NePH0TvcPTROwPd50VJDHqLXdIt/EtfVlyYe4Yf3FJg1xkCF5rSHm+k5QPssJdzTfmluMlij3
 DhI5l69IF0Jk5wW6zHpuDi88z9bGTgu/B9Mwu+0E4McxMNYomcMucydqaskELY2FkYpiq9gDFcQ
 rZqYSUC2Sq6YV4zl4665jQyDYVLCunY95gmLSlmYuotsUm53HtTz6F1wElB2a2Y91FyfEgLnyOB
 ePgwmAZl09Pwoc5bQ6wWs6Bi6YOf521lYr+y/6cqz25zkeKgslpSxzob6J7fyusZeOA==
X-Google-Smtp-Source: AGHT+IGs/aNwZAUk3NKcgSt1hAEhaNDM53lJclve2de3HSTb59YjSiCLEeLKHZJKg92EZaBGz33KPA==
X-Received: by 2002:a05:6402:1453:b0:639:fefb:996a with SMTP id
 4fb4d7f45d1cf-639fefc0db9mr14527206a12.12.1760366105193; 
 Mon, 13 Oct 2025 07:35:05 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:151b:dc00:15d1:ebc5:76e6:730f])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a5c321453sm8942037a12.39.2025.10.13.07.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 07:35:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: Independence for dma_fences!
Date: Mon, 13 Oct 2025 15:48:27 +0200
Message-ID: <20251013143502.1655-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Hi everyone,

dma_fences have ever lived under the tyranny dictated by the module
lifetime of their issuer, leading to crashes should anybody still holding
a reference to a dma_fence when the module of the issuer was unloaded.

But those days are over! The patch set following this mail finally
implements a way for issuers to release their dma_fence out of this
slavery and outlive the module who originally created them.

Previously various approaches have been discussed, including changing the
locking semantics of the dma_fence callbacks (by me) as well as using the
drm scheduler as intermediate layer (by Sima) to disconnect dma_fences
from their actual users.

Changing the locking semantics turned out to be much more trickier than
originally thought because especially on older drivers (nouveau, radeon,
but also i915) this locking semantics is actually needed for correct
operation.

Using the drm_scheduler as intermediate layer is still a good idea and
should probably be implemented to make live simpler for some drivers, but
doesn't work for all use cases. Especially TLB flush fences, preemption
fences and userqueue fences don't go through the drm scheduler because it
doesn't make sense for them.

Tvrtko did some really nice prerequisite work by protecting the returned
strings of the dma_fence_ops by RCU. This way dma_fence creators where
able to just wait for an RCU grace period after fence signaling before
they could be save to free those data structures.

Now this patch set here goes a step further and protects the whole
dma_fence_ops structure by RCU, so that after the fence signals the
pointer to the dma_fence_ops is set to NULL when there is no wait nor
release callback given. All functionality which use the dma_fence_ops
reference are put inside an RCU critical section, except for the
deprecated issuer specific wait and of course the optional release
callback.

Additional to the RCU changes the lock protecting the dma_fence state
previously had to be allocated external. This set here now changes the
functionality to make that external lock optional and allows dma_fences
to use an inline lock and be self contained.

The new approach is then applied to amdgpu allowing the module to be
unloaded even when dma_fences issued by it are still around.

Please review and comment,
Christian.


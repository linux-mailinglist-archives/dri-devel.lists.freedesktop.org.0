Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D557C254CF
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 14:44:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F00210EB43;
	Fri, 31 Oct 2025 13:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ma5hWRpb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA8C10EB47
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 13:44:48 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-475dd559b0bso29840495e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 06:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761918287; x=1762523087; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8l4ubcMd7fh1t9v6bYRfKmDgoG7zfmnbjqlGtcnGlQ4=;
 b=ma5hWRpbhOG2HoBos7+ThsqEm6o5UpFORhqJ79ExSuUN2nEw03tzyXf/azIL6Kg3iZ
 RWN5lxcBzH9krdEgLcHS4inNi0648k4sDMisVs6eNQYJcwc0jJScGbLO1obAwADubZXR
 KE6ScmSJdQ3bV7ZzELD0AMkqSgc51LuzulK3w83g/Os1fSyDm30Nj+P/3ORU4VL6mQFg
 6e4SwvIDiL9u9WVv/ojHQ136v+yO+u+nn2QGZbffgCGPF1bGXmYvzBkYy70qQ/IiVABX
 Y41LVEm7hVISHX8sTsHg+Jk3n4KyjgQ1/rbmmplN8MDx48uTEie7BpVxAwpYpGG9cZJi
 IlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761918287; x=1762523087;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8l4ubcMd7fh1t9v6bYRfKmDgoG7zfmnbjqlGtcnGlQ4=;
 b=q091XousGyTLqZVIaR+wzht8m1D4FqAKinDptZikSTxj8xeRIFu4FAY9XNEUeBUwEd
 i//srm10x8UnXdn2xFhtp7oa/LaXNe9jtAugrAR9ETNiuwS0MnFCdOwgL/ibVHR6oLJt
 0FdCOxKJGnfs7UsNClvhlzidIihlD7cZmr9PneYIFrnpIHfnNzmmNgxnGes2I04prPmZ
 X9YchqPTTBM74+KuqrrnjT1cnWHawRarAmT1sP9F91Tmkr4ptE5q6fasF9TijIkAlFFh
 G+ciCYB3jFOicRTWRR15/b+brhwRM/bAM5lOqiVIZcoJ1P7R1f/F2z3S6jX4F+JnlHQd
 s/kQ==
X-Gm-Message-State: AOJu0YyDaMNC8edLLq9F4ETZxYOE3ZVlbUo5q/Wjk3lMb3tsb1OwF7t0
 tKOGODAqpemQSO3aMxU/4ziJXm75lEjqksDKVFYVPinSmaq5auAav8nm
X-Gm-Gg: ASbGncvrRNwlqUyPZHjt8xAResP5Bo45KC4wIgmknJj7sc1QztoLSVZgugXgW5t08PC
 msaQ1HtowzCMAyWsxUbCeni6JuIpUiX1hHF6oi5MkWsEbGgOFChvItN5SEr0w2gfdMeZWwIjV+a
 YvpBuBF+oxelh38t3inSQ8SKTwXwgNSH/+XNz76jDg6ld+7yvW5JkF/nlyN9YcDItLgPVOmG/xR
 5Lp0REK3lSGlW4NuQJkYo3wlKMkPpG/VkdpJ45h9SQbq+1dXKaSSxpf6pbOiUggqpT7jWWI5hmX
 wKlsU7GztVY0P1Le93WcG4scm8CluHNlmf2vaqGtB3FCkFmHovjBEx+Go/PMtEFS767Dv3Qrmtq
 bgbl9bV4KmatQPbxJ79X6YA/UsYqVxoEYNW1gKygKo69VfOVZlMm1sNOQLmbKVGonAm9e9VDFgb
 I/gIWSt6GgnnnxpQ==
X-Google-Smtp-Source: AGHT+IFPyGiMbJajkSi+avrTdCfsEH04+atqUrSKZodvnp1ote0dv/5nDF8K1ptv4L/v5ax2GjW3nw==
X-Received: by 2002:a05:600c:871b:b0:475:dddc:8c08 with SMTP id
 5b1f17b1804b1-47730833ec7mr32394245e9.15.1761918286821; 
 Fri, 31 Oct 2025 06:44:46 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1599:7d00:73cb:d446:bf90:f1c0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47732fe119bsm34502635e9.10.2025.10.31.06.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 06:44:45 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, airlied@gmail.com, felix.kuehling@amd.com,
 matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: Independence for dma_fences! v2
Date: Fri, 31 Oct 2025 14:16:34 +0100
Message-ID: <20251031134442.113648-1-christian.koenig@amd.com>
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

The basic problem is that when buffer are shared between drivers
dma_fence objects can leak into external drivers and stay there even
after they are signaled. The dma_resv object for example only lazy releases
dma_fences.

So what happens is that when the module who originally created the dma_fence
unloads the dma_fence_ops function table becomes unavailable as well and so
any attempt to release the fence crashes the system.

Previously various approaches have been discussed, including changing the
locking semantics of the dma_fence callbacks (by me) as well as using the
drm scheduler as intermediate layer (by Sima) to disconnect dma_fences
from their actual users, but none of them are actually solving all problems.

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

This patch set addressed all previous code review comments, is now based
on drm-tip instead of amd-staging-drm-next, includes my changes for amdgpu
as well as Mathew's patches for XE.

Please review and comment,
Christian.


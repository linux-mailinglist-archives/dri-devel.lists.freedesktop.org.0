Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6412BCB5CCA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 13:24:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6964410E7E8;
	Thu, 11 Dec 2025 12:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="du+hCA3s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD49310E7E7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 12:24:11 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-477b1cc8fb4so263925e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 04:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765455850; x=1766060650; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0a67G2H0qIRONtFJczR9cwq/2mKRXEXcVict8Y14Xe8=;
 b=du+hCA3sdSqLeBT+iu2jg2U/uVHJQr5+O3+aFA3XOSxMehFkE4PRa2CnKbxI1tbY7J
 nSoYxyuuFHSRkLBB2bTP+9VgBIXz1yLTwxWD+ICmEP4dMDVkGAOcnIFmpmy9/NFDJPcf
 UQlYMzNbaSD9KoBJ/QUOU99O8/eQytFAPzTpi1xpDRolSGQDWXo7DRpxopmr+AQ4Lg5C
 UGwL0boCyO7jHUKFsVaR0tT70C5gzQGNYYidbY/to1NLTPBefY5xD9r6swjn+CaJ1qNo
 UJ/XOhasm9TGtyg4JiRv3aFQDY7eVpZu1V1RY+Sgv1w8Jeu98bU6noI7piPrsKcPTyUe
 Z3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765455850; x=1766060650;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0a67G2H0qIRONtFJczR9cwq/2mKRXEXcVict8Y14Xe8=;
 b=m2PfP6VrYH/QbRxmbZiFt/S8X/2uqCJMlP5R3TNAnKXOmq8I9eGyawkNXSBpIOAhEJ
 68LeRUbsz9Vr6+pkkw+Ezj7LvBpnLqfm/D7WjBizkoo5iyOdlBLIJens07QuXoS2t/Z0
 YFmCtIcoZWhjuXCf1tdcTmrvlA/vqMJbjIz6hALxORv33bQHEHx98L28uolN8WtD3/KI
 Hz/MVEZ+l7HNBmWo9UWnz1BFis0OwLGGjiEppR5sgmWWq0gxf0ae1ENic582lrTOTARR
 obPyZeVnp2oPwZ3m4YgsVkLLjVJ5tu/aKAxfB3YrZzzGJKdelKjAbjntlR7KcDFbeWbl
 YP5A==
X-Gm-Message-State: AOJu0YxKe7r8+t1Ca4m3RPvnnZ6mGUn3wOtU+C4knQOycgLpur51wmKX
 aue/vgazfVQVRM1zmx4Irow4tN5RsP/lh2e2psvgzBM+IO8nbE9wgRpc
X-Gm-Gg: AY/fxX7NfW6gm7gnxRyEXDw599HeDqL87NwWtNtPHfy72Rex4E+dGXHS/LS/g/dJ3YI
 djlfm4atAsMaz1+6XGSgEIyVrAi0gGLqIlMHEvtCTlTnltNEzIa1ktn19ZJhSbS102XwyVMtcAw
 luLqJT31QdjEoj4tono7cnq94HgzL99MUiTohHvc/LWVNW8gbe6LhHtd+UJEpGDoyTzFEttmd16
 molBbfakWJYiSBWP0EBAvLgD0bvskznftQ2+pprB4FauDMM9rEX2BbBhxUq7aQHudZ6TAzR7fBP
 3Lh4T1Yk1FFp0EERDUIQSaH/cWmlyK6zpaaa3IeP/BumDONrVrKr7GSlKnEGotE7Szb51Pbm2r7
 s/dfyFD+2aX+0Ixm+N+ows9h5175j+le+92s0eQz2JhnjuA4NK/7AcUiJk6gKwSRljEpmoQLDLR
 53jJxZ7rKNVUbGkMwio9ZAXMtc
X-Google-Smtp-Source: AGHT+IEFgPOeyP7yAC4u1S1JuH/V/ecALw9TF3dmS9ERTxQfeJYX547HL8h47JkLlhjOXMBl1Da0rA==
X-Received: by 2002:a05:600c:630d:b0:477:641a:1402 with SMTP id
 5b1f17b1804b1-47a8376e2abmr59660595e9.4.1765455850042; 
 Thu, 11 Dec 2025 04:24:10 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:9f00:dc26:feac:12f7:4088])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89d8e680sm12172785e9.6.2025.12.11.04.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 04:24:09 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: Independence for dma_fences! v4
Date: Thu, 11 Dec 2025 13:16:31 +0100
Message-ID: <20251211122407.1709-1-christian.koenig@amd.com>
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

v4:

Rebases the whole set on upstream changes, especially the cleanup
from Philip in patch "drm/amdgpu: independence for the amdkfd_fence!".

Adding two patches which brings the DMA-fence self tests up to date.
The first selftest changes removes the mock_wait and so actually starts
testing the default behavior instead of some hacky implementation in the
test. This one should probably go upstream independent of this set.
The second drops the mock_fence as well and tests the new RCU and inline
spinlock functionality.

Especially the first patch still needs a Reviewed-by, apart from that I
think I've addressed all review comments.

The plan is to push the core DMA-buf changes to drm-misc-next and then the
driver specific changes through the driver channels as approprite.

Please review and comment,
Christian.



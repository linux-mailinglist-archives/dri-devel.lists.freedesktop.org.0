Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3A9D3C646
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 11:57:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9E610E023;
	Tue, 20 Jan 2026 10:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c2veQLs6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DCB89186
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 10:57:00 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4801c314c84so32739285e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 02:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768906619; x=1769511419; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dEORR3284U70dvlcfkxCpvGm9I9oOaxPh+wqNvOupwk=;
 b=c2veQLs66M5qeYH2ZNy3DnXpQVEkRubn+FeKF+41GyvexrwvRiXa16oozlEQXfrWs0
 SsQckcV6ThahALdR5LE3Hk++iYBBIWO1a7KMH9bDjUUHDR7s7s6G1vBVlYiWVoyM/Nyk
 vISkYaKF8XVc3iN0iWwNTruoScRvRNdUZJzugoYwKI6qiMhESu96McQqUuAlAOlwGSVW
 cu8u8kuljblXHzsRS1CoBeP5jLzTwHcFa4GQwJxXPrjjU4kYxskAqcH1ebYoag2Cv4tp
 meHH7lEBf9fPymtbAP8Vw00HvSrjnSmQNVJ/cxXXWDbx0XEfuZJ3T3GzOtcLtYm1O1Ea
 Zd1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768906619; x=1769511419;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dEORR3284U70dvlcfkxCpvGm9I9oOaxPh+wqNvOupwk=;
 b=WN9SRwz2BbTqFYtggdXRXyQtEgtOefIcza+waTDUC9PckKOQiOJNCCzfNNSfBZYB2b
 GMW3gVQpCSfDjMTWgUd3e4aTt+oOW/zTMunBSF3BzhpSwP94FiuJhvomxl6ORIaKrWlG
 IDTINz7zvYqfPQ8oaxxGx16inNLyrsez2i7BXGdu9pWsVo3X6ViNRAF/DqHHMPdXaAAY
 BZP6b9PI/3mGgW1+YNdpw/A8lC4HyrTOpPnHz70Z+Iitd2QnpucUq3jPmAU8UGDYRIxo
 sEQ3tJpPdpULFaH1jHlrzod4pgpVi/LaBP2ZFCcvTnxp30oPMlqqhHOo6Jh7yLcKhvSa
 +DdA==
X-Gm-Message-State: AOJu0Yw2kT4/e4Fo4Zcp2ayUCKgEZA7jqsN9REWBMqI2gp1ExLbicKgy
 mUg3xntvm3Au4Y1HE3h1fKyNI3chKI0eL11l9vFRRygObsRN8HVllFC4
X-Gm-Gg: AY/fxX4pUWXXHSHQYb1Jd+vjVk7esSv4AqQHoq3HPzOSB2wWumtmKVXKMYsMe7SLWwr
 ijoUYEwfwFsLhztCYU98XtystSiUsVIxx6uFqvylevRZtnSGsVWYz9TbI7aVqcLCNODeOfAh57L
 YR5JaM32X8ICv0gqS5tctnbATN2Y1w02NNR0Doy6/qso6pwFwB/RkV4eXBJv5ztT/CYyUTUQD1O
 iOl5jtBZ2dEVJ5KrpcULJenxtSosqd1z4EHL/bZIQxnlv8j5a9Ptj3HomSAb2z150d9symqHCSD
 xYeep5kdeONq9lvSZqJSm7y4gXJJ41NwcOCTd/IOJf9FBwTn1V61kJ07hohce2/rLO+twM/UiGy
 Baf/eR59XkWXUyX0GTMhYQBL9AJHlKQHUPCGmlBNXLwNL0ghIOyX+woNxvYloagvRyur63vkRjO
 ARE6CgiSL7x6jpfoU4wuztAkBF
X-Received: by 2002:a05:600c:c178:b0:477:a977:b8c5 with SMTP id
 5b1f17b1804b1-4801e34cd0emr204143915e9.31.1768906618439; 
 Tue, 20 Jan 2026 02:56:58 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1563:d000:1067:f6c4:3bf8:ea8a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801fe67780sm99418105e9.16.2026.01.20.02.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 02:56:57 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: Independence for dma_fences! v6
Date: Tue, 20 Jan 2026 11:54:39 +0100
Message-ID: <20260120105655.7134-1-christian.koenig@amd.com>
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
test. This one got upstreamed independent of this set.
The second drops the mock_fence as well and tests the new RCU and inline
spinlock functionality.

v5:

Rebase on top of drm-misc-next instead of drm-tip, leave out all driver
changes for now since those should go through the driver specific paths
anyway.

Address a few more review comments, especially some rebase mess and
typos. And finally fix one more bug found by AMDs CI system.

v6:

Minor style changes, re-ordered patch #1, dropped the scheduler fence
change for now

Please review and comment,
Christian.


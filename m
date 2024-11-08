Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCF39C196C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 10:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE68E10E94F;
	Fri,  8 Nov 2024 09:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fn9n0Ju/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1861810E94F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 09:43:02 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5ceb75f9631so2382564a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2024 01:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731058980; x=1731663780; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=VZb1WrQphLGZbvPqJp3yPZ3CIFQdbv2SQFAaCUYi54M=;
 b=fn9n0Ju/oc1C7SIqjYFGyYj65A0i9GyXsbfCqT8zwaAze4429+dkNLURTSldueR2Bi
 vnQ/RbGUzw6R3bEFkr4W4oXoX/twbIa1gBAsGqLsEcdM2PaTOVd3urUO2Qd68gXoWc6V
 uBZxnxi0pJq7syvkT5Yb+mRAnfmk/HNRTnWaWXpXM5dro2J3nHo1Sz377FtJL4UJ0/eL
 Q9yJUVEXBDDEu1F9CRF6VhhJlSjNg+qLC75rNyOsCFiYrFqHe71n30kuVwPx5ZsMm0G/
 aVbrXQ0QMd1SOBzRL4r4oBIxv7lbckfsgDLRjKQCQRxdR9ZIFt7eZcwAgH8XzZ4VV6VF
 KIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731058980; x=1731663780;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VZb1WrQphLGZbvPqJp3yPZ3CIFQdbv2SQFAaCUYi54M=;
 b=uyGpNuju+f20sghGPg3cUxl8FY6S+UY835wsJPFE3YozcOZ89O41RhQX50SR1BL0sn
 8Bii+EXFTfqwwyAI3F36LrFEt2Z8C/r9dyDUArwMecp+Mdgi5wzLij0+BRjj1zxtM6Ki
 l1gBI2oqH3tkp4xXSRqvfPpBfUkvDBlDDmVdTdyXAkEVXWUQ7x/QsTG70+OGH0OJ8z8c
 0E9pK9Y7/sXVSlq4O2S4FhXpMNXn4B216k3Yi7VWZMHNU53OpCRep0ypW3m5t6FaxjMy
 PrP00EerDYc9mG05EuN0I1qdtJDKVZQotRv9/DVQvP9fpYBwDdIfbgs6+fvWkHeiarkh
 ci/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgvh1FxTZo4VgnJoqVz4SdP2Ti3qH+JccNUwwt5qVUC4aIwL3lHpakg0OoGswoF8jR7BTa5NrWBcQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsHZo1128Kd3e14M+YiazbFlcZwyxnuLbKpyTbxo4y3WpwqVXq
 lTAxajQHtqbTPz3iuezYBLltGj/FjYos6FPxTWJm0vFPJKiNrG0K
X-Google-Smtp-Source: AGHT+IEJWO/uwDtG00s5G6dgxZsCdPv53Pay9vm3wiVYSD6f42UwSTAzPOiYSicZJSVO1pQpPgygVg==
X-Received: by 2002:a05:6402:1ed1:b0:5cf:526:5c04 with SMTP id
 4fb4d7f45d1cf-5cf0a43f2f9mr1697408a12.26.1731058979960; 
 Fri, 08 Nov 2024 01:42:59 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:153e:2b00:4f76:20be:cb86:c8de])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03c7c455sm1756385a12.73.2024.11.08.01.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 01:42:59 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: boris.brezillon@collabora.com, olvaffe@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 lionel.g.landwerlin@intel.com, dri-devel@lists.freedesktop.org,
 faith.ekstrand@collabora.com, simona@ffwll.ch
Subject: Ensure progress for dma_fence_array
Date: Fri,  8 Nov 2024 10:42:55 +0100
Message-Id: <20241108094256.3717-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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

as pointed out by Chia-I userspace doesn't see any progress when
signaling is not enabled and Boris noted that this is because
dma_fence_array_signaled() never returns true in this case.

Improve this by fixing the dma_fence_array_signaled() implementation to
also return true even if signaling was never explicitely enabled.

We should probably adjust the documentation as well that when the
callback is implemented it should make progess visible even without
enabling signaling.

Please test and review,
Christian.



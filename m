Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EC6974DB4
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 10:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DA810E803;
	Wed, 11 Sep 2024 08:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Stks1/Ih";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B665510E17C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 08:59:08 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-42cb2191107so29056645e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 01:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726045147; x=1726649947; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=1IbTjyxmaxCeWQaYBY/pYeV1dKT2HEoXsh/mY2Cbox0=;
 b=Stks1/IhF12MdQrFP177qP3xMqYnODLHHiP4mDozJAicUDuR3ms+lsEW1dGf5DbTKA
 y6atYgjf49ZKftk+ZDWX53M/BRMeugMW+XTdTFf5OFpz4WLsb6v2GROw9j79CPjEslu4
 DWRYKWB8YJqm6Tk5Obf3pQjQsXHbXFlKp3+TKbHn5KGabP8hC7J1lKnGm831W/j6Bm59
 OKQReKvfcsixPXi1+ZFi/MuY7MnSaBARU+fzSQmgiTgJ6g5tc536Cioc4g2CAqezQxb8
 LS1XFdtoSSx6k5hJEgn5QHTuLGqE5jFeZcMOl+AJ+/gqit6evdonPupprM9HidFoVTN9
 pBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726045147; x=1726649947;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1IbTjyxmaxCeWQaYBY/pYeV1dKT2HEoXsh/mY2Cbox0=;
 b=gS15RbHTfYTIAUcFxqcww0BN6vmmH9AhgBXX7D6CjT2kPk+h/gbwZMd5qJJ6+cHply
 8KZ3E44e3pajjAnl4cAp2VWGYIQbAEXNTQ92jezEbDcuGpVQHZZRkoeHnu5xvvo3nUvr
 1RcYG9qGVaPeyQRoNPZvkefVMVjxNqxR0KWOzXUddAUB9CcT8jZnd7/gXUpgPdkO3Iso
 KJo4/5jd/vibMqlAkvvzbSXuQZUfwXYx0UNiqAxX4m968xWRIOuv99/7vCQZF9T4pfb7
 B32zaJpwEYxwYcjQT7Zc0P0D5by3k5gpH8/arGXXB1fzJLqzLUouW0yJeWTTHi1QiPAH
 c89w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDrsp+V0tFEQ4ZrWzHl7ROE0yrbPy0O3pu7bTHrBzbpq+brjgxw13BHI9OJcvMRrHYc84UOaqZYSs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4qJynjaYL7rkKtcN8qMUVOT/pqxasJsa/bsjqrp3w1MC+YW/M
 GinKUI14BXeWWNfZh3P2stwztHmgvitgfehvR1Rl0DPu1U0N8p3/
X-Google-Smtp-Source: AGHT+IEVwOrpeq1ygzLvsq1aSKLsP/Hrv5UNabmPm9iDStecdLZD53LYkyN+WqAGbpn0NR2wqEtQ4w==
X-Received: by 2002:a5d:58d5:0:b0:378:80c8:57a with SMTP id
 ffacd0b85a97d-378926857e4mr8294124f8f.9.1726045145999; 
 Wed, 11 Sep 2024 01:59:05 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15d6:de00:8f84:56ce:f670:6ad4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956de4b9sm10978174f8f.111.2024.09.11.01.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 01:59:05 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: simona.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [RFC] Re-working dma_fence to not call enable_signaling with
Date: Wed, 11 Sep 2024 10:58:56 +0200
Message-Id: <20240911085903.1496-1-christian.koenig@amd.com>
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

Hello everyone,

The enable_signaling callback is the only function the dma_fence
objects calls with the fence lock held (the signaled callback might be
called with the fence lock held as well, but that isn't guaranted).
    
The background of that decision was to avoid races with other
CPUs trying to signal the fence at the same time and potentially
enforce an ordering of fence signaling.
    
The only problem is that this never worked correctly.
    
First of all the enabling_signaling call can still race with
signaling a fence, it's just that informing the installed callbacks
is blocking for the enable signaling to finish. If that is required
(radeon is an example of that) then drivers can still grab the fence
themselves, everybody else doesn't need that.

Then regarding fence ordering it is perfectly possible that fences
emitted in the order A,B,C call their installed callbacks in the
order B, C, A. The background is that the optimization to signal
fences from dma_fence_is_signaled() decouples the fence signaling
from the interrupt handlers. The result is that fence C can signal
because somebody queried it's state while A and B still wait for their
interrupt to arrive.

While those two reasons are just unnecessary churn the documentation
is simply erroneous and suggests an illegal operation to
implementations: "This function can be called from atomic context,
but not from irq context, so normal spinlocks can be used.". Since
the enable_signaling callback was called with interrupts disabled that
practice could deadlock.

Furtunately nobody actually ran into problems with that, but
considering that we should probably re-work the locking to allow
dma_fence objects to exists after their drivers were unloaded this
patch re-works all this to not call the callback with the dma_fence
spinlock held and rather move the handling into the drivers which
actually need it.

Going to send this out once more to the individual driver maintainers
affected, but wanted to get a general feedback first if that is the
right approach.

Please comment and/or review,
Christian.



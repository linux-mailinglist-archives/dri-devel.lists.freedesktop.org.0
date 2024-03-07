Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F90875747
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 20:32:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F678112676;
	Thu,  7 Mar 2024 19:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="d0/Roda7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CB9113802
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 19:32:42 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6e66a3d492fso26387b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 11:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709839962; x=1710444762;
 darn=lists.freedesktop.org; 
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y7tFAO5LyLvnL3+HqT9Xq5HyhhJG+8Hgt83qwkFfBN8=;
 b=d0/Roda7lQgY9JaNRHcI9u7Ypmex6rnpY74ddZ7qu76t0+UVe2lcTREi5L9/tM3dMd
 CsImvwJH4Y8wwBezJTxNCIvvaR++0xWRWVASdKadDUh3vA3TbiAej/+tlrOtByuroatk
 RzVpyK1Wq6vO0agY81pxRXTW9UFfvekojvLCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709839962; x=1710444762;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y7tFAO5LyLvnL3+HqT9Xq5HyhhJG+8Hgt83qwkFfBN8=;
 b=DXvgaCNBIC/oRzbML/HKpB5z/jNIPBOs8AQ7a1qeaxqHI2dPdx2xVLDhQE7GhHWX0N
 4X25OWtyW2PgE3awLn5dYUxjdGYJtNWV3yU2mZBncmN2bpFH+zSWN3uEpmi3eEgmVI8S
 5nKn6byJ3jWrDBewYP/DQrtfwo90/a9qn6OK3HkKNgI+q1gByBGaUaNOArsHWKtLuPG7
 jxfQXH3vyzAuqkNEK5ZylXsTl97ceJJsMz7f6tITa9raqBJinrsGw793Lw2xXqyNJLgo
 L9S0gDX0LaTwGiYUzoTOpymG5jUXdcJmm4IpXI4EBCFuzr4NZOAqww/l1kuNqb2AUMg6
 07TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxK+JQBVXOBdoEN0xrFbizWnmXUAB5threl7iyKsQx1LS3a7Vi3eCTXFm3b4bQ03E65VfYzmx0qmyRSZGy13vwx6SM5uXgeOpSvxHWjHJB
X-Gm-Message-State: AOJu0YyAFEcLOor7RvJXLKvc/QhbdReUVoeZ3TfRfZgiryFH2s5UKQnP
 /5cwtXj8iRQMZkid0LN5vPLsQVV7KFPiSCwZBXHZmy1rXBDJUg+w4hiU1kN4gw==
X-Google-Smtp-Source: AGHT+IEXA1GnqxDeU9jnlIUs1LLr1HCKc49pvwZhgKzU/0L/Llfntwa/OA4IWFglH8mIi9V2Pf//fw==
X-Received: by 2002:a05:6a00:3cca:b0:6e5:9342:f0fb with SMTP id
 ln10-20020a056a003cca00b006e59342f0fbmr21379242pfb.14.1709839961147; 
 Thu, 07 Mar 2024 11:32:41 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 x20-20020a056a000bd400b006e65d66bb3csm1526541pfu.21.2024.03.07.11.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 11:32:40 -0800 (PST)
From: coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date: Thu, 7 Mar 2024 11:32:40 -0800
To: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, intel-xe@lists.freedesktop.org,
 Oded Gabbay <ogabbay@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: xe_gt_tlb_invalidation_ggtt(): Error handling issues
Message-ID: <202403071132.198D11C@keescook>
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

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20240307 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Tue Mar 5 16:48:55 2024 -0800
    27ee413bbc0b ("drm/xe: Do not grab forcewakes when issuing GGTT TLB invalidation via GuC")

Coverity reported the following:

*** CID 1584246:  Error handling issues  (CHECKED_RETURN)
drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c:250 in xe_gt_tlb_invalidation_ggtt()
244     		seqno = xe_gt_tlb_invalidation_guc(gt);
245     		if (seqno <= 0)
246     			return seqno;
247
248     		xe_gt_tlb_invalidation_wait(gt, seqno);
249     	} else if (xe_device_uc_enabled(xe)) {
vvv     CID 1584246:  Error handling issues  (CHECKED_RETURN)
vvv     Calling "xe_force_wake_get" without checking return value (as is done elsewhere 15 out of 16 times).
250     		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
251     		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
252     			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
253     					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
254     			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC0,
255     					PVC_GUC_TLB_INV_DESC0_VALID);

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1584246 ("Error handling issues")
Fixes: 27ee413bbc0b ("drm/xe: Do not grab forcewakes when issuing GGTT TLB invalidation via GuC")

Thanks for your attention!

-- 
Coverity-bot

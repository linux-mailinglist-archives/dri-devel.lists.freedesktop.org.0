Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8K+iIeFNoWkfsAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 08:55:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F22E1B4279
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 08:55:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD2010E0EB;
	Fri, 27 Feb 2026 07:55:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="A+6pYEIX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACE510E0EB
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 07:55:09 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-48378136adcso10056345e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 23:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772178908; x=1772783708; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0bo1+MeHyz3oo0R9LPXDVH4BNCFrZ2q0p2S2NbLydZI=;
 b=A+6pYEIXWEW7cWn8OIuPXubR9GI76T5KDQvZKHwYHhqS1GOgaLABxHrz+oYTiRWxSE
 +H2zBp0xvbRwCc7iWacIxYJ7dnUPSAZQhmVrHFYK3RULG81VocebYyf3GRMr5EgCsRtD
 E29ZcK+l74HbfSZKTcsp/1qlPelWSm+yCMvGfz3PYwqcxEUqteJw2cjO7K60BbEYoHTz
 ovYqADgeq6kuvmTJzhxpcTHCyD+PP2LHR9R7x/G7zqwTxY1Q4o9pB04VIAkj9gtvB+jE
 HaT8JF7Fz1S5jF/lsc6xAMEMZmhUSU7RCD2s5TjsttgEUTRWueGIgxF6R0RjNLyJiqL7
 +ZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772178908; x=1772783708;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0bo1+MeHyz3oo0R9LPXDVH4BNCFrZ2q0p2S2NbLydZI=;
 b=HjrZEKJsgAuUUbNerYefvgAxMWPF3dIccIAWJ2QoWF6hMiXWovrVKrN9yZ3rGDigFW
 K6LZEd6UlYBIAwTYXtJd6p0UTObVNaehdMweWRBwMXhUQkMzFiSoHQXq8bNTROBPnZLl
 F89E6ABIwZVFS8NofOTwkCTG69EXla85AHdmGKkYP0tUyBTgoS2H5sX59uYlhxpaJQzC
 0Qth/UN7OJ+qkXVtP8xA3YuYPip3MnP637DIkCjsmH6J0KhgQdId6RxjUywqX8jdREtO
 c8xmghcS+69LGVPl3SjKSuDDT189CxlZ7BxW+bCArcKbMpRL7v4Uc2Y4jb4kuEUU1vCC
 H0XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA9RcwaiNRZJXf+jHIRJh6Y8KFsINbV9OMTreAgMmJ7iXrbQ8Ro2nRVS4WR2lhlNUu9LaAxc0qC9A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/pqxt7rDsHMIGCGajl3TFgTaerUjFk9gsqFFurRfhVvTkegCm
 wSfXYUSeqDwNUCd+nuRLLg9Yv3Pr1hghUrChlOasuA4WbUVHSnMiGzv5lTd/xSiS6sY=
X-Gm-Gg: ATEYQzyAVAbXmCOghWghJ0We5Ougz/fOf8F01aR7/D5PYHTHvrmsQzf5jWLDV89f65L
 h2aBCz9//VjRLZkC0t5ZD86zRrtPnwNUZ1d6cmA+sL7/OI3TJ2DqySWcT0mNI/CM92C1bjLKbGs
 SeX/2e1Cx1fgU6uWAp4gsUIh+12Bf3J1jylxi6+/FJFS0l/IQHNNfjDGdApplOtHAIgCE7XURZm
 uxuNEI8DoKSrND6eAB6bf4YIFkcCPUy4/aCFxYRZ6kI0JBJ/J8faw3X2wAEPij0NWLQKh7gBctJ
 MkU6oDxigWF5B0EUYfNgdht5TOirnSM6vCWe8hvoc6n6cSWoK069TIKtxgqkdYbd7ukx7GIxPl0
 O9gjZKZQQSlsXSgPwnq8mDYP5LB5VBb8SQ3F48+7WF1LEjoT29sBBscRTYcTjyr96APicaXF6KO
 3FlruxHgRU988zQJh3AFCyrGZljS7+
X-Received: by 2002:a05:600c:828c:b0:482:dbd7:a1c1 with SMTP id
 5b1f17b1804b1-483c9c23c72mr23232475e9.34.1772178907803; 
 Thu, 26 Feb 2026 23:55:07 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd7507adsm219000415e9.9.2026.02.26.23.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 23:55:07 -0800 (PST)
Date: Fri, 27 Feb 2026 10:55:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 "SHANMUGAM, SRINIVASAN" <SRINIVASAN.SHANMUGAM@amd.com>
Subject: [bug report] drm/amdgpu: add missing lock in amdgpu_benchmark_do_move
Message-ID: <aaFN2JyOolrjynKP@stanley.mountain>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dan.carpenter@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pierre-eric.pelloux-prayer@amd.com,m:amd-gfx@lists.freedesktop.org,m:SRINIVASAN.SHANMUGAM@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:dkim]
X-Rspamd-Queue-Id: 1F22E1B4279
X-Rspamd-Action: no action

[ Smatch checking is paused while we raise funding. #SadFace
  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

Hello Pierre-Eric Pelloux-Prayer,

Commit 30f2daedf4d8 ("drm/amdgpu: add missing lock in
amdgpu_benchmark_do_move") from Nov 18, 2025 (linux-next), leads to
the following Smatch static checker warning:

	drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c:57 amdgpu_benchmark_do_move()
	warn: inconsistent returns '&adev->mman.default_entity.lock'.

drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
    31 static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
    32                                     uint64_t saddr, uint64_t daddr, int n, s64 *time_ms)
    33 {
    34         ktime_t stime, etime;
    35         struct dma_fence *fence;
    36         int i, r;
    37 
    38         mutex_lock(&adev->mman.default_entity.lock);
    39         stime = ktime_get();
    40         for (i = 0; i < n; i++) {
    41                 r = amdgpu_copy_buffer(adev, &adev->mman.default_entity,
    42                                        saddr, daddr, size, NULL, &fence,
    43                                        false, 0);
    44                 if (r)
    45                         goto exit_do_move;
    46                 r = dma_fence_wait(fence, false);
    47                 dma_fence_put(fence);
    48                 if (r)
    49                         goto exit_do_move;
    50         }
    51         mutex_unlock(&adev->mman.default_entity.lock);
    52 
    53 exit_do_move:

The unlock should be after the exit_do_move label.

    54         etime = ktime_get();
    55         *time_ms = ktime_ms_delta(etime, stime);
    56 
--> 57         return r;
    58 }

regards,
dan carpenter

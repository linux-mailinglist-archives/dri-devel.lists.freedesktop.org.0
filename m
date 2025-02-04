Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A119A26FBC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 12:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79DF410E5EA;
	Tue,  4 Feb 2025 11:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="OHDfhFf0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD0610E5EA
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 11:00:38 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-388cae9eb9fso3132216f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 03:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738666837; x=1739271637; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1qEq+ElMf3tzfmwe9V3JN7eeJb5z/31FY7C4V4/CChY=;
 b=OHDfhFf09TkE3xG2rgC+ZVusRk/Wk9nSjjydirS0DvxYUGAUKI1LYaescZSQmNRAgF
 S/nMB77icsSwh5yzZSdTcmyisXPt+0Wdelk5gwDC3VaIrpU6Qf9JSgfbujmujqCQXQNG
 rIWD4NMwUWPa+ltzOJwv9sRBn7rjom0sNZ8rY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738666837; x=1739271637;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1qEq+ElMf3tzfmwe9V3JN7eeJb5z/31FY7C4V4/CChY=;
 b=bJ7ga4OsdMMkp9uAsSZ6GuGAed3hxC1ezlCXEZxvwcIGFY43ykzu49VKfYE8I41Mki
 GvihvCQVvHgLRrKmNuylceq5XI1n5Sg+/L7FQGjnwxEfGqpn2ddBcPFyyQ67N7Dro6vz
 3dPjetOsufpbxCsKuTSV+DVP+P0LSNMMvYla0beLwhO+vT9TCap2YSvJrm5EYJspt54V
 2f6ljz5xRLnZA9bkyvTNvp92fdClezQXFE0cu67YOm4CWtmklt0r0Z/Za5sTL8CUwbHj
 aDpg7E1nuVbTXeOzfa0qR/gWz+zjv062wFXOrcvYUbeFTu+uSB8ZjgQrTYt9ko0zDu/b
 EEPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpWJTZyUp2YDKbvxMOxvdQo2gdr4LJJKnfCSlGScoqqNY14pTwC7Db5SDMBrCR93rzS8NE+e8Ily4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQYnMXo/LrkcFZVA6X7b4+c/E8LzErUNGWKuOVXx5iiuDMcmub
 92pPQ5Cc6OHI8CmtV/3ZIrtlnYy7184r0IrNSOGg+3C1F9PpuRKC+xDaJ027W0I=
X-Gm-Gg: ASbGnctfsEZSaMU8HolpcZgMTHlZ86Ti+0B0bCc6qe4ZJEMEJ04Bi0L10RAB8g3wb7B
 T/gc1PoxO/agM8+MQlT5N1rCOx1NhGcbRzObPin0W9oR0+K+KQMpWGuj4hsgwGYYKptr5k3dqJZ
 JDUAW0FxrWoJMQmbzbgxcSGReQ/rV1cej9+tRSwU8NrLwJOKWLyhKHB6RzSOal7v7+DpNChknSG
 ZueOCFieV4zR74iuon7viuqupG8DtANfgXX3RhTeOd82GZywdvtKeOkY1QbpFgEJUQLYKTf68wi
 xnUdkKVWNutprih74gErzO4yzcw=
X-Google-Smtp-Source: AGHT+IH8E/wHWTyhYFZ9PZjCo1HsdJQC/yHrtDwtnInnH1WvV9/UailC+a7uxbTK7laZAYXd3pK4hQ==
X-Received: by 2002:a5d:59ad:0:b0:385:f560:7911 with SMTP id
 ffacd0b85a97d-38c5194c68dmr21045402f8f.10.1738666836603; 
 Tue, 04 Feb 2025 03:00:36 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b4e99sm15513991f8f.74.2025.02.04.03.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 03:00:36 -0800 (PST)
Date: Tue, 4 Feb 2025 12:00:34 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] drm/tests: Fix locking issues (kind of)
Message-ID: <Z6HzUidu_pOth2BS@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250129-test-kunit-v2-0-fe59c43805d5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129-test-kunit-v2-0-fe59c43805d5@kernel.org>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Wed, Jan 29, 2025 at 03:21:52PM +0100, Maxime Ripard wrote:
> Hi,
> 
> Here's another attempt at fixing the current locking issues with the
> HDMI kunit tests.
> 
> The initial issue was reported by Dave here:
> https://lore.kernel.org/all/CAPM=9tzJ4-ERDxvuwrCyUPY0=+P44orhp1kLWVGL7MCfpQjMEQ@mail.gmail.com/
> 
> After fixing it, there was still a lockdep warning for a circular
> dependency. This series is also fixing the issue.

So this looks like it's a kthread_exit, which yes is broken. You cannot
acquire a lock in one thread and release it in another thread, that does
not work for lockdep and therefore is forbidden for mutexes.

It's kinda allowed for semaphore, but that's why semaphores cannot be
automatically checked by lockdep. So yeah we cannot use such a deferred
action, it would need to be a deferred action that's run synchronously.
-Sima

> 
> There's still an issue though. When running the tests, I get:
> 
> KTAP version 1
> 1..1
>     KTAP version 1
>     # Subtest: drm_atomic_helper_connector_hdmi_check
>     # module: drm_hdmi_state_helper_test
>     1..1
> 
> ====================================
> WARNING: kunit_try_catch/25 still has locks held!
> 6.13.0-rc2-00410-gbd9d16533367 #18 Tainted: G                 N
> ------------------------------------
> 2 locks held by kunit_try_catch/25:
>  #0: fff00000021586f0 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_kunit_helper_acquire_ctx_alloc+0x5c/0xf0
>  #1: fff0000002158718 (crtc_ww_class_mutex){+.+.}-{0:0}, at: drm_kunit_helper_acquire_ctx_alloc+0x5c/0xf0
> 
> stack backtrace:
> CPU: 0 UID: 0 PID: 25 Comm: kunit_try_catch Tainted: G                 N 6.13.0-rc2-00410-gbd9d16533367 #18
> Tainted: [N]=TEST
> Hardware name: linux,dummy-virt (DT)
> Call trace:
>  show_stack+0x18/0x30 (C)
>  dump_stack_lvl+0x70/0x98
>  dump_stack+0x18/0x24
>  debug_check_no_locks_held+0x9c/0xa4
>  do_exit+0x52c/0x970
>  kthread_exit+0x28/0x30
>  kthread+0xdc/0xf0
>  ret_from_fork+0x10/0x20
>     ok 1 drm_test_check_hdmi_funcs_reject_rate
> ok 1 drm_atomic_helper_connector_hdmi_check
> 
> I believe it's due to the fact that drm_kunit_helper_acquire_ctx_alloc()
> will acquire the lock directly, but will release it as a deferred kunit
> action. It's not unsafe, as the lock is eventually released, but I don't
> really know what the best course of action is here:
> 
>   * Forget about the idea of a context tied to the lifetime of a test
>   * Make lockdep know that it's ok, and we know what to do 
> 
> I've tried the latter, using lockdep_pin/unpin_lock, but that didn't fix
> the issue so I must have done something wrong.
> 
> Let me know what you think,
> Maxime
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Changes in v2:
> - Fix circular dependency warning
> - Link to v1: https://lore.kernel.org/r/20241031091558.2435850-1-mripard@kernel.org
> 
> ---
> Maxime Ripard (4):
>       drm/tests: hdmi: Fix WW_MUTEX_SLOWPATH failures
>       drm/tests: hdmi: Remove redundant assignments
>       drm/tests: hdmi: Reorder DRM entities variables assignment
>       drm/tests: hdmi: Fix recursive locking
> 
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 200 +++++++++++----------
>  1 file changed, 103 insertions(+), 97 deletions(-)
> ---
> base-commit: e2a81c0cd7de6cb063058be304b18f200c64802b
> change-id: 20250129-test-kunit-5ba3c03bffb0
> 
> Best regards,
> -- 
> Maxime Ripard <mripard@kernel.org>
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

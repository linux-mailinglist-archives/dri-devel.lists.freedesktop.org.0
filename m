Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEFDA1BA09
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 17:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081E010E9D3;
	Fri, 24 Jan 2025 16:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="MyVmTwK7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DCC10E9D3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 16:09:49 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43621d27adeso15581835e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 08:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1737734988; x=1738339788; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xsbYJojFnJHyb7Z1vIeeeMLtGZUUYponZdFzStqck0c=;
 b=MyVmTwK7YmqKU9vhj35pTbhkll8sTdxFyte6eFuvw7fgQbHFqlUMJ9SSMC0nTMxMVE
 OB8ECBkUcyhB7uh+lRK26Gz7hb3sBL870zLZGcBvSGpHjcrQkmL0NqiXwHCF9CH5q4nO
 cLneam7SqsDaybb4Ma0guppQMHiZ7mQO2ZaZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737734988; x=1738339788;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xsbYJojFnJHyb7Z1vIeeeMLtGZUUYponZdFzStqck0c=;
 b=f1BjlaV0qcnfzfjhbEu1uiXW2JJQWPsinzcGIu7bnBpZiJBmrvYK83cLw2ht9t2LuS
 Xe/ityf+jNE+rGsXD7UZh+atee1KOOTMNMA61nwYsEoSuVE8zIBzAozcM3PzJ7bhfK60
 ONYHqNTzufdzGPT+Tm/SQXgSXC+AobHaVlDLdAa9wYpcBgusbepF/xq2h79DHNGECqmJ
 nO42JfDZJdD3rYszspoPxzMAPL7bAMM8RNx3o42O3QS0inYmtzynyag6pGvNKrwLR/lZ
 ZSDhRtyk5C+httIXcaQNfdc92QTS7LMjyq3z6eAmEkxw3gtE4RJXYRxN/ec6idzHLm0X
 69Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDUQENAa+Ew5w3Rt97ZBJkCCSlySeAxjKEa2wDHew+PKBWU9nqYAHOAyEUau2j3cAmK0foxb+bh8k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrDyfl4utDTdY9qdZg7DPQuT58Kmx5OPvlakjHqiq9suwiePmy
 /fyVYR7ThIdQUMWVXNY9z69Pjx8jaZCQ4RWPelvgfsgXbfTXKocItrCkQ3Ied+4=
X-Gm-Gg: ASbGncvDfo7NLMqffzaywuGU4tQaQ5cQ1Mg6zpKgqJzQ2HnblKwxzWuBL2fhC0z53Qu
 S/9wbN/1qBDnGfTwLElqLz09PGruBIZESZf3ONdAMCj7GOzLgeAo/Xb8Ug2AqCZk+e+Pej73CTB
 tKJaoSKznx/jRiiq9IrS574vfRs2HJK7qVs3Z9WWuUOhikqBCSdH0F4SfRAo4yB4kPOXiv/Zu2V
 vv/xVuqywocDuFV0un6kXEJfcVuer+L1GZxR5foEo/UiU1whIipvCQAuUui9wFYvHIRO+6IIyuo
 NRYUH4trkTyWwh99
X-Google-Smtp-Source: AGHT+IGgcwlojMe2eUG5XvTv971ynSVi+nq4QiUkAIk0hlzmzlheXCJ9b8dBpY6DONEmnVl8dN1sZw==
X-Received: by 2002:a05:600c:4ed4:b0:434:feb1:adae with SMTP id
 5b1f17b1804b1-438913c8604mr285707565e9.3.1737734988285; 
 Fri, 24 Jan 2025 08:09:48 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd43cdbbsm31778555e9.0.2025.01.24.08.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:09:47 -0800 (PST)
Date: Fri, 24 Jan 2025 17:09:45 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PULL] drm-misc-next-fixes
Message-ID: <Z5O7STQ4ZJrE6kva@phenom.ffwll.local>
References: <0d4a18f4-222c-4767-9169-e6350ce8fea5@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d4a18f4-222c-4767-9169-e6350ce8fea5@linux.intel.com>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Fri, Jan 24, 2025 at 04:25:32PM +0100, Maarten Lankhorst wrote:
> Hi Dave, Simona,
> 
> Oops, I messsed up the pull request, didn't see the other commits in the
> branch.
> 
> Additionally:
> - Fix bogus Kconfig change in cgroup/rdma
> - Kernel doc fixup for xlnx.
> - virtio UAF in virtgpu

Ah here it was, I only looked at the annotated tag and was wondering why
you didn't include these. Already typed up my own version.

btw dim allows you to redo a pr, it just adds a suffix to the tag name.

> Cheers,
> ~Maarten
> 
> drm-misc-next-fixes-2025-01-24:
> drm-misc-next-fixes for v6.14-rc1:
> - Fix a serious regression from commit e4b5ccd392b9 ("drm/v3d: Ensure
>   job pointer is set to NULL after job completion")
> The following changes since commit 07c5b277208cf9a9e9cf31bf0143977d7f030aa1:
> 
>   Merge v6.13 into drm-next (2025-01-23 14:42:21 +0100)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/misc/kernel.git
> tags/drm-misc-next-fixes-2025-01-24
> 
> for you to fetch changes up to 6e64d6b3a3c39655de56682ec83e894978d23412:

Pulled, thanks a lot.
-Sima

> 
>   drm/v3d: Assign job pointer to NULL before signaling the fence (2025-01-23
> 16:15:01 -0300)
> 
> ----------------------------------------------------------------
> drm-misc-next-fixes for v6.14-rc1:
> - Fix a serious regression from commit e4b5ccd392b9 ("drm/v3d: Ensure
>   job pointer is set to NULL after job completion")
> 
> ----------------------------------------------------------------
> Geert Uytterhoeven (1):
>       cgroup/rdma: Drop bogus PAGE_COUNTER select
> 
> Maarten Lankhorst (1):
>       Merge remote-tracking branch 'drm/drm-next' into drm-misc-next-fixes
> 
> Maíra Canal (1):
>       drm/v3d: Assign job pointer to NULL before signaling the fence
> 
> Tomi Valkeinen (1):
>       drm: xlnx: zynqmp_dpsub: Fix kernel doc
> 
> Vivek Kasireddy (1):
>       drm/virtio: Fix UAF in virtgpu_dma_buf_free_obj()
> 
>  Documentation/gpu/zynqmp.rst           |  2 --
>  drivers/gpu/drm/v3d/v3d_irq.c          | 16 ++++++++++++----
>  drivers/gpu/drm/virtio/virtgpu_prime.c | 11 ++++++-----
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.h    |  1 +
>  init/Kconfig                           |  1 -
>  5 files changed, 19 insertions(+), 12 deletions(-)

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

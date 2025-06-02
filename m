Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D269ACB39C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 16:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED58310E544;
	Mon,  2 Jun 2025 14:43:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Kp/JOzXc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78DA10E544
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 14:43:40 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so48851085e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jun 2025 07:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1748875419; x=1749480219; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BmRnOjxFQaT42NxVRt03FTSH3KzxlAbjYGkqubhhB6U=;
 b=Kp/JOzXcjUujEKt6YVl/hqlF+O8YMLFLNmtNh70tBHfZsUXpCWZsKUC23+Nopfh30t
 8rxud6d1of92/kWd8iS/xn+Y2JAE4dbY3Q77YQUVGjkjVMgdJ0VGrunV1IrDuqJjxl3Q
 BscXo01RGAUhkmg0dDNzKhLdnFp/ycsnPtQdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748875419; x=1749480219;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BmRnOjxFQaT42NxVRt03FTSH3KzxlAbjYGkqubhhB6U=;
 b=SxkaHul/Xd/e6kfX3ICmQBWrxelPl9GsaGc/HYzcOZiDSQ57n6iWbBqpaYObTKyixT
 SeuoaoJy2YI8Bnp7/4v0kpvWsdYlXOcQIuFTnTWWjIZaushUrLehoooM+WZZhwrBRDpG
 BWS2H4vQ7FzY0Wi2OZaakhIShooxj2BNb60dR/+KuOSdYfW/wymI7ymiBVUv+A57XH/f
 r+Jiz44Px/iYZwDXnx/dPrz3VaqlD6osyh+139A+bC7SKWCq14rR3tn+8cQlqZJnbgtw
 DIkhbwk1LbX7zD+3KiPO8/wG8JuDRZxRj3OjyrdcmQpdkX46MR5Z+wl5yWAs9YO7q5mo
 xq6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW02zwm6G0zY6qtSMfScedj4t3TpodEQCRA0Tx8w+OmfBsBdEzrNuN41CU0SDO/tmeZpK0plGA4VCs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKy2WS4cnvGrVlgiDqtnqVCUeqD0dvRVp/kWCYKScK2ulXZ0Oi
 2BIUlEur+a6jKJ2/9MIrvh/1+wDhiwnO8osKtcxF26nOO5HdhDUS/ENFwuQ+zv3xnN4=
X-Gm-Gg: ASbGnctoBg/U90txGfZ6J5aXF2onrBY+9QWeyIsQHPvWJaFJrtbpSFgUdLR8bqb/gg1
 2j2QaUXqsHWPWdHhsuUsekoQu9xQUqFVhqi8+Lc17mTA14GXM29DNsG5rQyKt4r6/d/Z2DZDhLs
 7ISIndOLWUKhSQfpVUkx1CoqTvf9CDVJ+Xvm/FYKaxm6e5fOBoqmG7u+JUJE9UXKIDBtJzcfBT1
 P+qHUFnRogDoVWqdxque78UJYJwTFKc8LKhZuqG+DZTpSaMjLM5RRpb/HqTAyUysHHRLZjceDvG
 K5YzwK+H506vaMAvZRV5NFaBSL6e8Vyz6adpi9DFiH+JdF944uoPrn6PUcZZFfc=
X-Google-Smtp-Source: AGHT+IFo+Z0NR0XEqF7bGgCU/zFo04aIkuwKr4I5i9fvBh1/D97TYslci1leA382fPNo1VYX/jntFg==
X-Received: by 2002:a05:600c:8b34:b0:442:ccfa:1461 with SMTP id
 5b1f17b1804b1-4511ecc2a30mr78544895e9.13.1748875418792; 
 Mon, 02 Jun 2025 07:43:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f00971e4sm15380816f8f.65.2025.06.02.07.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 07:43:38 -0700 (PDT)
Date: Mon, 2 Jun 2025 16:43:35 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 intel-xe@lists.freedesktop.org, Carl Vanderlip <quic_carlv@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Simona Vetter <simona.vetter@intel.com>
Subject: Re: [PATCH 4/8] accel/qaic: delete qaic_bo.handle
Message-ID: <aD24l3NoZWWwScx6@phenom.ffwll.local>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
 <20250528091307.1894940-5-simona.vetter@ffwll.ch>
 <70ad82b5-19f3-4e05-bc7a-858dafc563ef@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70ad82b5-19f3-4e05-bc7a-858dafc563ef@oss.qualcomm.com>
X-Operating-System: Linux phenom 6.12.25-amd64 
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

On Wed, May 28, 2025 at 09:15:22AM -0600, Jeff Hugo wrote:
> On 5/28/2025 3:13 AM, Simona Vetter wrote:
> > Handles are per-file, not global, so this makes no sense. Plus it's
> > set only after calling drm_gem_handle_create(), and drivers are not
> > allowed to further intialize a bo after that function has published it
> > already.
> 
> intialize -> initialize
> 
> > It is also entirely unused, which helps enormously with removing it
> > :-)
> 
> There is a downstream reference to it which hasn't quite made it upstream
> yet, but tweaking that should be fine. This is clearly a problem anyways, so
> we'll need to find a solution regardless. Thank you very much for the audit.
> 
> > Since we're still holding a reference to the bo nothing bad can
> > happen, hence not cc: stable material.
> > 
> > Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> > Cc: Carl Vanderlip <quic_carlv@quicinc.com>
> > Cc: linux-arm-msm@vger.kernel.org
> > Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
> > Signed-off-by: Simona Vetter <simona.vetter@intel.com>
> 
> SOB chain seems weird to me. I got this email from @ffwll.ch, which would be
> the author. Where is @intel.com contributing to the handoff of the patch?

I work for intel, so I just whack both of my emails on there for sob
purposes. The intel email tends to be a blackhole for public mail, which
is why I don't use it as From: for anything public.

> Overall, looks good to me. Seems like either I can ack this, and you can
> merge, or I can just take it forward. I have no preference.  Do you?

Whatever you like most, I'll resend the series with the wrong patches
dropped soon anyway.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2841439ACA8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 23:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F176E5CD;
	Thu,  3 Jun 2021 21:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6BF6E5CD;
 Thu,  3 Jun 2021 21:20:48 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 p67-20020a4a2f460000b0290245cdf2d1a4so1737371oop.8; 
 Thu, 03 Jun 2021 14:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3SeUvF7OIDkpxCXqtIck2gO5mE5Gg4u2wRaOQGVjGWw=;
 b=W6+O0iug26rLcB+roGOt+18y3GK4Bf+OYXYRX4uiq1TLDGLGcU9uJg+vRpAg8IN8WV
 8P6BNiE7CEhaYbETChSMvtjLWl9b/Yc1B3q4eivOKd+bwukk9vIlnHLjfRZwoS409JJF
 uyQ6SraBR0zQK40RJ+0wJFFWcs9oq7i+miK80VDsYw6v6/eZ+UdIT5TdUlRuPlvXI5Ij
 Q6cQejYD/zoVjjxqQv55Xh0R6gsQ2uBcYol/Bo6d93GI1gRN7chCZCvmNNJUqf9PcTw2
 ncxipyQ9GllRX7CCDtXaa6r9J/SjhL7Lybe/au69Yz/jtIXedeIzigw1lt8BVE5mjOus
 +f9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3SeUvF7OIDkpxCXqtIck2gO5mE5Gg4u2wRaOQGVjGWw=;
 b=nXtR0geYtrFp4oGo6UPo2IWqgwjsT+s4W6U68o+vXHVdi9Yj1BYYqCCRXg9NAa0gYg
 v2OU1OBG9fqQlnhiPumKqeFnVfkf6tJULBg8Bvp/AMNT6qCDATwc7YpVmkE7dvbrbLFh
 j+11QsTPkwbYy7dB1YvHVtWYXFQy0A+eqPP3kfC+gqpfWkPESFNlTF0g5ulwXb04cMxt
 ZLd+LLVKa2hCqaOgwXHnkv27vLW0cz6NLjZxov8V1mnEt2Tzl8k14glslHBe9CM/0uGQ
 xeHq45ASwEJkC6rqogknodvATcLkWep3AtbXnhSfL2xbqNpUUt3mjHe9O6mlPCL/kWaZ
 Zy6w==
X-Gm-Message-State: AOAM5324eyEoIPIVE4eXJp0/MsuXhck37bLo1DzL9deGgkj1jnafp783
 RJul2As4cZFZABZskaMNzO5le7wPOWNbX/5bs5A=
X-Google-Smtp-Source: ABdhPJy8ZNDycH1ijYMXayKBFnDLTcFWz7GeziFoo4NKpFef0nGYSICXcxd+28mjudNGaH9VAE3S9BQt6LsXJaNbb9E=
X-Received: by 2002:a4a:8c09:: with SMTP id u9mr1027595ooj.72.1622755247767;
 Thu, 03 Jun 2021 14:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210601201702.23316-1-andrey.grodzovsky@amd.com>
In-Reply-To: <20210601201702.23316-1-andrey.grodzovsky@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 3 Jun 2021 17:20:36 -0400
Message-ID: <CADnq5_Nfs_j9XE1Siou2wGYuwd5cvTD1T7m9gFpS9z74D=AuAQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] libdrm tests for hot-unplug feature
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Please open a gitlab MR for these.

Alex

On Tue, Jun 1, 2021 at 4:17 PM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
> Adding some tests to acompany the recently added hot-unplug
> feature. For now the test suite is disabled until the feature
> propagates from drm-misc-next to drm-next.
>
> Andrey Grodzovsky (7):
>   tests/amdgpu: Fix valgrind warning
>   xf86drm: Add function to retrieve char device path
>   test/amdgpu: Add helper functions for hot unplug
>   test/amdgpu/hotunplug: Add test suite for GPU unplug
>   test/amdgpu/hotunplug: Add basic test
>   tests/amdgpu/hotunplug: Add unplug with cs test.
>   tests/amdgpu/hotunplug: Add hotunplug with exported bo test
>
>  tests/amdgpu/amdgpu_test.c     |  42 +++-
>  tests/amdgpu/amdgpu_test.h     |  26 +++
>  tests/amdgpu/basic_tests.c     |   5 +-
>  tests/amdgpu/hotunplug_tests.c | 357 +++++++++++++++++++++++++++++++++
>  tests/amdgpu/meson.build       |   1 +
>  xf86drm.c                      |  23 +++
>  xf86drm.h                      |   1 +
>  7 files changed, 450 insertions(+), 5 deletions(-)
>  create mode 100644 tests/amdgpu/hotunplug_tests.c
>
> --
> 2.25.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

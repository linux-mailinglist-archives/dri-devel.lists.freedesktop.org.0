Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3666A3983B9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 09:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8FDF6E086;
	Wed,  2 Jun 2021 07:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1500E6EB6F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 07:59:13 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 v19-20020a0568301413b0290304f00e3d88so1689975otp.4
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 00:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qGvUg7g5napozN81BeHjEpK95x/aqYy7PtsRq+Mdc5E=;
 b=R2tiPBsEGIDqXjwieTtACdfLOACuaDag9L/+f51fjJzSJVyFPpA4Ljp4ORadpaYtV5
 Mlnas7VvWSWOQlvmFbOTBWru/Kqi7e6JOi3NEABL2STqfmKj4CLKAqG5699uGT62lK9V
 77GTdcmFKg0zAhDz/vaX5UtGE4fPZVGtGYPe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qGvUg7g5napozN81BeHjEpK95x/aqYy7PtsRq+Mdc5E=;
 b=O9KfQk+QDdIrOf52V7p20+2Su694s+YDoX+Xa1vecfx+Oppug6Nx+pJbngGgMaCuzt
 WMbW3yCdeWtjMmXkGX5at3wOUdmVMlnc3zbkS8Bix8cetiv3/MP0s4WPvvqcRhAt7lKY
 fzWdDdoep6Bosi1TV/ZnWb5ITjbcBjF+3TRMC9WhUGNfjm0ixGcrVTzXi7lXhpn+cqK0
 7zigRdjELSnspsf+CHMPwtluN1O+XnW4N7Cw8M61HQqVPTIhbWKIkJDubXLVo5je1CRY
 tB63wv9k/mZL3K0iNYlkkRv09uZrJMf1B9pT0uJIS03xR43GbqDxNJa5VHSSOGJW+Tv4
 8uaQ==
X-Gm-Message-State: AOAM530KknTxWLCC/WYl3g0Og130T1Acqo7z8fpA/s3u3zQEQiddwKPJ
 JFU1kRvdZ7fK9LWiFiGHyD37nQ42jBk4lTRyYlc4dQ==
X-Google-Smtp-Source: ABdhPJx1g/OLNyZ55JeYwk8dci0GheN+3UPp7HULJgUiGCuX7h7dda+hPxqK58LjJBKBSzmk1iqT2eOTTTlVd5WmOMI=
X-Received: by 2002:a9d:4008:: with SMTP id m8mr15846097ote.188.1622620752246; 
 Wed, 02 Jun 2021 00:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210601201702.23316-1-andrey.grodzovsky@amd.com>
In-Reply-To: <20210601201702.23316-1-andrey.grodzovsky@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 2 Jun 2021 09:59:01 +0200
Message-ID: <CAKMK7uFoLmOFCTkPMm4mMSScF0xa+MnHvY2FVmfBUM8b8S0_PQ@mail.gmail.com>
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 1, 2021 at 10:17 PM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
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

Given how nasty hotunplug is I really think collaborating on igt tests
on this would be best for everyone ... do we have to keep doing
parallel tests here for amdgpu?
-Daniel

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


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

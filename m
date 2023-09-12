Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D664079C202
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 03:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559A810E13F;
	Tue, 12 Sep 2023 01:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A5110E13F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 01:55:47 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-501cba1ec0aso8394764e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 18:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694483745; x=1695088545; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Dfh8/mDNgK8vxrADw9UDg9zBqSEE3ndEwyQtmVmeyWM=;
 b=pM3mmQOzo7zsnXLLfpvHiWyUvMmvYj+QUsqSsZlra6vsQFLLu2e20eRr3LnKkVBd6K
 qivvr5KF6Lj8Cw15fJrWNWD/9AiI84FFmP6yigyb1xVuCjqpKkLosP/9iazShja/JSnO
 ie4zlE2/A/J0m5h41WKn7wKEBTqsiAQLBUyOmMQi8Qsm5TYW0fpgRjV7tIYXeYfUHVtu
 PKoATVqIqs5+N9sdMzDVoeIEI7yQSlp9/Laa6DP5JmsmdunwWVAcXff+qPzJ8X/4AX2c
 vK8Oh7CpIiKvW4kzWEYgaohcJ2VrsdIDNL/AabrqwZUHRORqteehGDJgTboSAcuVe62m
 ZT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694483745; x=1695088545;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dfh8/mDNgK8vxrADw9UDg9zBqSEE3ndEwyQtmVmeyWM=;
 b=d82aKVXgB8t7CRjX00UpyV2HJR3lMKJR/TEj8qMm4bWmg4NtWxcqcMzZ9xikGLA4wW
 lWm//mNCdhQjNtL3LlDQc606G5Il/QFDyzKnInSIUJ1roo/JCICAbdtiY2xHHTu0fgG4
 g6FNfnAVQFg2A/hGGdOPrAzSLcO2fEow1qVcaxAASTtN+gEx7u0ZXvAMirYTWGbbOOwL
 C0feN6BmaYagl7gjjW+Zzj8dNtkbKNF9W2WanBF+a6AaMSP2EDsGR3JovUhKigVNPyFn
 6h9BiaWxsXpquK0jvfgMRsdrhkvXCbGcFCM2ALdPgT07TA+dT5IfqJ/X8bkuGq3IvHXA
 YZYA==
X-Gm-Message-State: AOJu0YxGskGi6r/yOraGh0A7yzMfw3h6Wxt6btKfSRTsb1egj9Fa2opO
 51dlcWknhi1XJhW657p2unAuwl5D6T5L4vGQsUo=
X-Google-Smtp-Source: AGHT+IHCiNJcSbNJ7RSxRhN3Yzlcqa52uNMH/Uq5EU5bd/OleEn/UkclTnAiq3uWYeQwY9zvyocqW9aSvAzI8CUXWrA=
X-Received: by 2002:a05:6512:2038:b0:500:75f1:c22e with SMTP id
 s24-20020a056512203800b0050075f1c22emr7814227lfs.40.1694483744716; Mon, 11
 Sep 2023 18:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1694202430.git.pstanner@redhat.com>
 <CA1AA415-FDF0-4A7A-9BB0-FFF055803F77@kernel.org>
In-Reply-To: <CA1AA415-FDF0-4A7A-9BB0-FFF055803F77@kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 12 Sep 2023 11:55:32 +1000
Message-ID: <CAPM=9txUQ64PMmN-KSXC6PG5ozhSB4eLQN8iAUMrv1R9F6Sm6Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Introduce new wrappers to copy user-arrays
To: Kees Cook <kees@kernel.org>
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
Cc: Andy Shevchenko <andy@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Siddh Raman Pant <code@siddh.me>, Kees Cook <keescook@chromium.org>,
 Philipp Stanner <pstanner@redhat.com>, kexec@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Disseldorp <ddiss@suse.de>,
 linux-hardening@vger.kernel.org, Nick Alcock <nick.alcock@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Sept 2023 at 11:27, Kees Cook <kees@kernel.org> wrote:
>
> On September 8, 2023 12:59:39 PM PDT, Philipp Stanner <pstanner@redhat.com> wrote:
> >Hi!
> >
> >David Airlie suggested that we could implement new wrappers around
> >(v)memdup_user() for duplicating user arrays.
> >
> >This small patch series first implements the two new wrapper functions
> >memdup_array_user() and vmemdup_array_user(). They calculate the
> >array-sizes safely, i.e., they return an error in case of an overflow.
> >
> >It then implements the new wrappers in two components in kernel/ and two
> >in the drm-subsystem.
> >
> >In total, there are 18 files in the kernel that use (v)memdup_user() to
> >duplicate arrays. My plan is to provide patches for the other 14
> >successively once this series has been merged.
> >
> >
> >Changes since v1:
> >- Insert new headers alphabetically ordered
> >- Remove empty lines in functions' docstrings
> >- Return -EOVERFLOW instead of -EINVAL from wrapper functions
> >
> >
> >@Andy:
> >I test-build it for UM on my x86_64. Builds successfully.
> >A kernel build (localmodconfig) for my Fedora38 @ x86_64 does also boot
> >fine.
> >
> >If there is more I can do to verify the early boot stages are fine,
> >please let me know!
> >
> >P.
> >
> >Philipp Stanner (5):
> >  string.h: add array-wrappers for (v)memdup_user()
> >  kernel: kexec: copy user-array safely
> >  kernel: watch_queue: copy user-array safely
> >  drm_lease.c: copy user-array safely
> >  drm: vmgfx_surface.c: copy user-array safely
> >
> > drivers/gpu/drm/drm_lease.c             |  4 +--
> > drivers/gpu/drm/vmwgfx/vmwgfx_surface.c |  4 +--
> > include/linux/string.h                  | 40 +++++++++++++++++++++++++
> > kernel/kexec.c                          |  2 +-
> > kernel/watch_queue.c                    |  2 +-
> > 5 files changed, 46 insertions(+), 6 deletions(-)
> >
>
> Nice. For the series:
>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Hey Kees,

what tree do you think it would best to land this through? I'm happy
to send the initial set from a drm branch, but also happy to have it
land via someone with a better process.

Dave.

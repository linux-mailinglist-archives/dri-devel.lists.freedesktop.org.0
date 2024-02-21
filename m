Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 150DF85E094
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 16:09:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F22C10E47D;
	Wed, 21 Feb 2024 15:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kAKMVTjm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F9910E6A2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 15:09:36 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1dc1ff58fe4so14208995ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 07:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708528176; x=1709132976; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RYGokGLx+MsZssGjhMGohu1anyJAoXCl5Na4dmZHiyA=;
 b=kAKMVTjm8/GSBprbAD7m92XEkcx+0x1Q45U2rOfqZgKXPWHFxqhLROk8dqWCUb6Jq1
 P2tPxcGu8Ilaq9+fYO7fKK908VDqXHAkmg65E2zcLwnmabAQKMoPXweIaoGS4yuouKIh
 6Z6XmkOmEJboKCNXUN4+HC4BZukZ9I7xJ0HO70KPcKOhXtVNuJSJVz59KlJgcATkOxXR
 TXDYC2o9eJHyFDrTl9GhkYmjTYAoSQZBwKwBc4E/grz+ErVLnY9LcP18Dh/7DpAlRrxu
 MY1u37WTtu+oHmSzHYjDKG2DIhKkqir+74Uf/9Sim7JJHWYhFVJ4oTZPbBD7bi/e9gmI
 9+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708528176; x=1709132976;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RYGokGLx+MsZssGjhMGohu1anyJAoXCl5Na4dmZHiyA=;
 b=cB9a58DUr+T61Qf2Ddhmv8Xw7Xp9kbxnbLQg8I5q2GxOrLBX1N88K2ujwvM+vbdhhS
 zjUaRuke95f1h6V6EbwDT/h2qoKRR/49crblw79HYaS0nMZv43AAuOm8OOvW6giEEOZJ
 gJKaXMEFTER6XZoZ8PAnQV+BqXJ+a4MCGkirttlNGNJiBDf4JzcBhUNBTwK7nNkFuZvb
 aFK99u7mizeLg0jg5slmUEzOdjIDV24YcRahYnuq7TwM7+9MIEuznRParqrn1vIuC8pe
 +BYN9uDgU1LsuH/ReXSR8xjhXcdvBW2oArn12xYol/9Gp+avnRGPUCOLpVXa+KQUfIvD
 TZCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUrvBKk6F/MN1KkklXlUegdOBiC6XBCgc34MxeiRZxfX4iKE0mqpW1lDCUsPEeClIhh++Y/1378/t7rgoSG/HlBpGlQ88hJnNn/1tRVKs+
X-Gm-Message-State: AOJu0YwKEuz4HSdU3fguLywjNvYNV3c9JEdIA9B+ETFaSJzshOb1TTVN
 6kOv5KTUXjR+ZAIZe3sCSmiOb1QA+CWWgxQzJwjNDwR/Z4K3cVh4BcEg4D/KEl8BbADv3+EiBRd
 BbsvIqiQxTJdn1qz7RCzs17wWoIA=
X-Google-Smtp-Source: AGHT+IEca0w2zET9mnuEfIMyzr4ETxGm3rQePup7GK4aE/VKbU+SdeUCwyLtvZWLCoMpo2QIQfBpTxTE7FvykWhJkkg=
X-Received: by 2002:a17:90a:a008:b0:297:24b8:6dd4 with SMTP id
 q8-20020a17090aa00800b0029724b86dd4mr15598276pjp.21.1708528176285; Wed, 21
 Feb 2024 07:09:36 -0800 (PST)
MIME-Version: 1.0
References: <20240219230116.77b8ad68@yea> <ZdRtDOhQGQUm5X4d@archie.me>
 <20240220134556.61f6441c@yea> <ae1ffd81-5026-4d64-b055-4f60090962a5@amd.com>
 <20240220184323.2c8b4f0a@yea> <3c5b80a7-5bf9-4752-a596-438924fdec9c@amd.com>
In-Reply-To: <3c5b80a7-5bf9-4752-a596-438924fdec9c@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 21 Feb 2024 10:09:23 -0500
Message-ID: <CADnq5_NUuZ_cfLxsS-ZBFh9b1DDNi-oNuuQuMz8Px7LtT_g6_A@mail.gmail.com>
Subject: Re: Running ttm_device_test leads to list_add corruption. prev->next
 should be next (ffffffffc05cd428), but was 6b6b6b6b6b6b6b6b.
 (prev=ffffa0b1a5c034f0) (kernel 6.7.5)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Erhard Furtner <erhard_f@mailbox.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Karolina Stolarek <karolina.stolarek@intel.com>, 
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Feb 21, 2024 at 9:13=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 20.02.24 um 18:43 schrieb Erhard Furtner:
> > On Tue, 20 Feb 2024 14:50:04 +0100
> > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> >
> >> Yeah and that's probably the problem. The test is not supposed to be
> >> compiled and executed on bare metal, but rather just as unit test
> >> through user mode Linux.
> >>
> >> We probably don't check that correctly in the kconfig for some reason.
> >> Can you provide your .config file?
> >>
> > Here's my v6.8-rc5 .config attached.
>
> Thanks for that.
>
> As long as nobody comes up with an approach how to run the test even
> when other drivers want to interact with TTM the attached patch is my
> best idea.
>
> It basically disabled compiling the TTM tests as long as neither
> compiling for UML or COMPILE_TEST are set.
>
> Opinions?

Makes sense to me.

Acked-by: Alex Deucher <alexander.deucher@amd.com>

>
> Thanks,
> Christian.
>
> >
> > Regards,
> > Erhard

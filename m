Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 847FD9876E8
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 17:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72BB10E192;
	Thu, 26 Sep 2024 15:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i+bqMJdz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A666F10E192
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 15:50:13 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-206b9ab5717so871095ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 08:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727365813; x=1727970613; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+hz1pRYvAdYf3uaHNcOJRfXb7RPzl6a7JO5wKzDv1+Y=;
 b=i+bqMJdzHUayDmBc0JKzMQ29AmTvffi8kj2m0y1p/NTBD9lTfBuAkRJtFs/B349vPx
 +xuhLQlPHP+MJaRUAfqPX6e05CKf1LgVXzxVgQG2mSd7t/tcvvtuY2sVhD8bgUjt5rG/
 PTGs1cG57zOtU/OXoH7aB0cY6FOw352xg1+Cjx8IAB/1gtOTkShcw2UFMEJpNB8rakAx
 kPyxK9U9T9hXpcXa4eSB+TWnn7VK5S47aTqFIIV85sY9Ejj804IyGuBprrQQk4idT9su
 kinuJObqZ/J1PZ9EyrH6VipKQy5uHMq6XGSjtId9E97y93VU5e7BVOPIn8JhPWN0yiN4
 ab4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727365813; x=1727970613;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+hz1pRYvAdYf3uaHNcOJRfXb7RPzl6a7JO5wKzDv1+Y=;
 b=HxNf5MrAJXhA6jUP/qjBe0ppHqnbMUi8aX0h87avkeEUi8DqcPPKFHFGDgUAPHNgic
 f2a+78qZhAsrelLMVOIytxzPJYig11t/onx20zTFW6Q1y6P8bl3Rrn8RZyXlC6xX9/03
 s/BxNAYsh5E5Eukkk4zJv6PL/oO1+SROLMXde3o6Ka9fxC0e8jXAg+mztimff5UOeMDd
 /UiMagLBsXqoK+QVKHcfjSqDxffnuMVYimgpavAgac2BQK+vDFf+DHgoZ2swZGPtQK73
 48B/UuyiJJtsTs1/w5eZ/cQQSOGVHMitZOioHFtfKeQx9KCA0GR4EPZO36j3FKZwrNMH
 AP+g==
X-Gm-Message-State: AOJu0YxzXfNMP5I2KdKrBF6NJTYdnfpBJP4iK0zAyxel8dYZt5zJK79N
 8TWC+hd311IgC+UcKzSLjlwgBw/zod3eT+1eU90JpkAF3doglABLMOiweZykq3sASz/KN+ko7iJ
 DqD8kfpwfwU0M3dd549BMualO7O84lDBn
X-Google-Smtp-Source: AGHT+IF3XfDTy4lHhQwXS2eunEni0t1BgyfzZ0WRgjJy2jNlthN9xPIER4+F7QAV9uk/QwNgb0bqIZ/uo9mTsRCS0vA=
X-Received: by 2002:a17:902:c405:b0:206:8f25:a3d with SMTP id
 d9443c01a7336-20b367d7cdamr1234895ad.4.1727365813047; Thu, 26 Sep 2024
 08:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <f163bcec-e5b1-4aef-91dd-431736fd6d11@xenosoft.de>
In-Reply-To: <f163bcec-e5b1-4aef-91dd-431736fd6d11@xenosoft.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 26 Sep 2024 11:50:01 -0400
Message-ID: <CADnq5_MM6UYOwFSPkZRauAyckFaUjCRGT97cVhsK=xZ9CzuXVw@mail.gmail.com>
Subject: Re: Kernel doesn't boot after DRM updates (drm-next-2024-09-19)
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>, 
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Darren Stevens <darren@stevens-zone.net>,
 hypexed@yahoo.com.au
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

On Sun, Sep 22, 2024 at 12:28=E2=80=AFAM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
>
> Hi All,
>
> The lastest Git kernel doesn't boot anymore after the latest DRM updates
> (drm-next-2024-09-19). [1]
>
> I tested it with an AMD Radeon HD 6970 (Cayman XT) and with an AMD
> Radeon HD 5870 (Cypress XT).
>
> I reverted the DRM updates and after that the kernel boots without any
> problems.
>
> Please note: Due to a lack of time, I can't do a bisect.
>
> Please check the latest DRM updates.

Can you attach your dmesg output?  There was a regression in the dma
subsystem what was fixed by this commit:

commit b348b6d17fd1d5d89b86db602f02be
a54a754bd8
Author: Leon Romanovsky <leon@kernel.org>
Date:   Sun Sep 22 21:09:48 2024 +0300

    dma-mapping: report unlimited DMA addressing in IOMMU DMA path

Alex




>
> Thanks,
> Christian
>
>
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dde848da12f752170c2ebe114804a985314fd5a6a
>
>
>

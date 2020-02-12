Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBFC15B1E9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 21:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2216EAEF;
	Wed, 12 Feb 2020 20:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18EC46EAEF
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 20:33:19 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D18DF24672
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 20:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581539599;
 bh=Bo+9/jUSa0NpQtciq7tNRztsfaEVnk+kdyhA8MoMgss=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ONC/jXagdwupezmQbJaHWSwDzDb2gj9Z0Q8pBqC4i/ggqDi7q0WADqDLcHeLL9qDL
 uYdr8h+1UZaJzn/dSCA/tU8ZXXvc+Pl4/ZFHpk5e6GhS85o2L/dAo9zcf1eUXc6PuT
 DBYPhvIoaSqddAlnrzgwZyymZdy5rcYy3bQAxVy0=
Received: by mail-qv1-f45.google.com with SMTP id o18so1580079qvf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 12:33:18 -0800 (PST)
X-Gm-Message-State: APjAAAXnRGmM+ck6IjLES1M4gnfrGtG+jnI/FTDH7uxMJCcBwL3ZxAja
 Q7SxWfzdcBsj/7GoOFE9NVz1rBDuNoXQROTPnw==
X-Google-Smtp-Source: APXvYqzre1CEhmCZxdnqAWYpg8FbsvimAbvrSYpW/TM7sS3n6YPLS4HOei7P5FSDxFM49Mt4fmLX+ckAuwTDSPKYjl4=
X-Received: by 2002:a0c:f6cd:: with SMTP id d13mr20705135qvo.20.1581539597924; 
 Wed, 12 Feb 2020 12:33:17 -0800 (PST)
MIME-Version: 1.0
References: <20200203152724.42611-1-yuehaibing@huawei.com>
In-Reply-To: <20200203152724.42611-1-yuehaibing@huawei.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 12 Feb 2020 14:33:07 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+BFrJ-bdDuKxCJ0OX=rLGsoHVf6u55irCA7duCJBB7sA@mail.gmail.com>
Message-ID: <CAL_Jsq+BFrJ-bdDuKxCJ0OX=rLGsoHVf6u55irCA7duCJBB7sA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/panfrost: Remove set but not used variable 'bo'
To: YueHaibing <yuehaibing@huawei.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, linaro-mm-sig@lists.linaro.org,
 Hulk Robot <hulkci@huawei.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 3, 2020 at 9:33 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/gpu/drm/panfrost/panfrost_job.c: In function 'panfrost_job_cleanup':
> drivers/gpu/drm/panfrost/panfrost_job.c:278:31: warning:
>  variable 'bo' set but not used [-Wunused-but-set-variable]
>
> commit bdefca2d8dc0 ("drm/panfrost: Add the panfrost_gem_mapping concept")
> involved this unused variable.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_job.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Applied to drm-misc-fixes.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

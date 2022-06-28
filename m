Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDDD55E55F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 16:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377A810F260;
	Tue, 28 Jun 2022 14:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAD510E2FE;
 Tue, 28 Jun 2022 14:38:00 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id ay16so26230828ejb.6;
 Tue, 28 Jun 2022 07:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8hQk/b0dG+ocD4kJkrdVLcqXI9aTRhPcr2tzOyCb7mk=;
 b=FftgfCRZNOFK3Y04oOXzjZwBv01ZPqBAsXGdkky+kO4cE8jNkzJjWL1lyBbv5cCMzt
 8ZHo7aDVBL4WTzIKpcJFig+44I2dHAu4WuZE2hWqbj43Oy9+kz8VZRWuxIAC1IVWr7r+
 7UVFPFEvmhpI+l8mWNF7XiuJKkzRo8CIEcU60klYX480FgZciwWg/mQsXS2iLpsukq1V
 8LC6NWfqzLKNmrE1prgCNsO9NdbH6n5xqJV7Ty70dkNZNbGOraGm3unIOTuvrQCWoh1l
 ZQbMrtIhZYzd3Ha5wSzQC8ZMAS6ZQInJTuZ9miKlPSmiuiOFX58iU+qS0nwHu6FHEvYZ
 h+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8hQk/b0dG+ocD4kJkrdVLcqXI9aTRhPcr2tzOyCb7mk=;
 b=7+ttgWPLzgZneIGf7j6wNcQdoxhRG8glXMvOFK/MspXqdkP/0sumR1okYjsZuEcB+c
 42prT1zE1rfquV2ZcMEvKhH0Zgtv5g5Ckd7VwV/bw79c9+v0sQFLOKSNkDk9YSTSGiR3
 4284QFmgsosNAqdG8ofV3PvHrUJnIGuZBTE+h8brb7rOU7Uoz7bcnAoqH2XlTkIlfYXM
 /B6+H/n+9G1BaqKzLmWxLa6PpuAZOrE+OxYNq+ShoYw1je75JBkmxVh4+prWhHVEOHte
 m8QtcKG4HNYhHUpT+A2LmePOa9klg6cCj2CbAWrEf8FTtwHCZG+d1PW4F+bBz3ggeNTb
 HnIg==
X-Gm-Message-State: AJIora9lAPvGwKJP78gagjGo6MzlfR00AzkRwILqQ0fEr/lRrvENwuNd
 obIiI2eEtmiUHCyVfOE7FkkHRywXCzh5xX1/Ooo=
X-Google-Smtp-Source: AGRyM1sjewq/YDh9ewRpgbEn647mcNCTsFzlz2ApXt/lWtI5R9O39yhXZpkP6sUScjKV7B7HZKEprynWngvkhAfQV4M=
X-Received: by 2002:a17:907:a40f:b0:726:a8f5:1031 with SMTP id
 sg15-20020a170907a40f00b00726a8f51031mr9317125ejc.185.1656427078995; Tue, 28
 Jun 2022 07:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1656409369.git.mchehab@kernel.org>
 <ac8ece934af1145bc16531b9f10d69c76216cb66.1656409369.git.mchehab@kernel.org>
In-Reply-To: <ac8ece934af1145bc16531b9f10d69c76216cb66.1656409369.git.mchehab@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 28 Jun 2022 10:37:47 -0400
Message-ID: <CADnq5_OxGq_rBr5-n16-5aHhG1WPDhTDjPAgMjMkWw-fG4o=8A@mail.gmail.com>
Subject: Re: [PATCH 10/22] drm: amdgpu: amdgpu_device.c: fix a kernel-doc
 markup
To: Mauro Carvalho Chehab <mchehab@kernel.org>
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
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Guchun Chen <guchun.chen@amd.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>, Lang Yu <lang.yu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 28, 2022 at 5:46 AM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
>
> The function was renamed without renaming also kernel-doc markup:
>         drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:5095: warning: expecting prototype for amdgpu_device_gpu_recover_imp(). Prototype was for amdgpu_device_gpu_recover() instead
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

I actually sent out the same patch a few days ago, however, the code
has since changed with Andrey's recent GPU reset series and the patch
is no longer applicable.

Thanks,

Alex


> ---
>
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/22] at: https://lore.kernel.org/all/cover.1656409369.git.mchehab@kernel.org/
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 9d6418bb963e..6d74767591e7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5079,7 +5079,7 @@ static inline void amdggpu_device_stop_pedning_resets(struct amdgpu_device *adev
>
>
>  /**
> - * amdgpu_device_gpu_recover_imp - reset the asic and recover scheduler
> + * amdgpu_device_gpu_recover - reset the asic and recover scheduler
>   *
>   * @adev: amdgpu_device pointer
>   * @job: which job trigger hang
> --
> 2.36.1
>

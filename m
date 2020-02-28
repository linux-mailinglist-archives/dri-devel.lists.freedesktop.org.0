Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 629A81741D4
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 23:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E9A6F4F9;
	Fri, 28 Feb 2020 22:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2246F4F1;
 Fri, 28 Feb 2020 22:12:58 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id m10so10290085wmc.0;
 Fri, 28 Feb 2020 14:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4vEgSlwH75ppaka6b+eKVprx44dYfhzjy3hFcJ1TMew=;
 b=Pgn/BGOmhwNTEW9jt9xY95LAAaP/UusK+8Su8i9f6r3ojI8KeWFQuDqpmJ1FzAhokR
 tT8tcCFvUGmp/p70sk2gIiHpRUeylLGWL0bpUAO6Kdp85WvIFX6wGSHzmFI8l2B2gSvu
 Qih+FYevFdaaedcaR0c6dFEw1RyExACbuXfv2iztndTNz8vDErMsRdzdevj4nTsTGOJ6
 NTOLrb6stEwM/3MZb6szs7jgOysv2cZhuMjBdrdu1GiSbYicm/kFRAECfyHxazTcRyzX
 785Z5a5QtAxxXzKU7+F7y4UVszryTRBQEdSvu2ZvpQmESl7UJRqRq5NbryYs4ZUr0G46
 PJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4vEgSlwH75ppaka6b+eKVprx44dYfhzjy3hFcJ1TMew=;
 b=WSGSyQN9nPsivsnF4qLlxi+9wuozUCnpQAQJ45TBKL7UgF2vDsXMT7VEp0u3cWfx/l
 Crs2w8FuylYNiyMhFDcXr4RIa0yU89Misd3GLNcREE2Fu4gRrUNktEva9R5O9h2QDTvn
 JCkcEmppdldER+P2boAIF3oJsZh6Nbb3Z+paPRkO428K1maIo4+Nf+175PuvejYlf5ay
 NvWLJ8A4OlDnxLE+2EkAnLrbqhjYNyZcjEDbi4Y5OM/C86zAz3l64bYnchYg89ehBeY7
 KFGzrJ7DA8dvQhzHEsdtevqN0lPqQWF1yrRpo64KXitKOPV1Z/+Z2JlqXCmTal9KbtyJ
 +A9A==
X-Gm-Message-State: APjAAAUlxFLlIKftOPl/yIpd5IjNWxzhYOa/KoY45npYg4MaPJD4rxsO
 qJvNLKZfOsO/1RH833Q9BHmGfy/18GAp1QbkjW0=
X-Google-Smtp-Source: APXvYqyg3Su2Vwre81Y3TJjLjQDh/KfhxYi5ii+aVVnW0os7zljNoaDM0iXi4ScsRG1uz0qAapyLHxVvt9Xn+3EXPl0=
X-Received: by 2002:a7b:c257:: with SMTP id b23mr6528043wmj.70.1582927977310; 
 Fri, 28 Feb 2020 14:12:57 -0800 (PST)
MIME-Version: 1.0
References: <20200228130821.64695-1-colin.king@canonical.com>
In-Reply-To: <20200228130821.64695-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 28 Feb 2020 17:12:45 -0500
Message-ID: <CADnq5_NU-GFbj0pTkzjGeMh_J5KM_mNV_NJ_gMFsjt0-Xi=vZw@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amdkfd: fix indentation issue
To: Colin King <colin.king@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Fri, Feb 28, 2020 at 8:08 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a statement that is indented with spaces instead of a tab.
> Replace spaces with a tab.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> index f547e4769831..5db42814dd51 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> @@ -490,7 +490,7 @@ static ssize_t node_show(struct kobject *kobj, struct attribute *attr,
>                         dev->node_props.num_sdma_queues_per_engine);
>         sysfs_show_32bit_prop(buffer, "num_cp_queues",
>                         dev->node_props.num_cp_queues);
> -    sysfs_show_64bit_prop(buffer, "unique_id",
> +       sysfs_show_64bit_prop(buffer, "unique_id",
>                         dev->node_props.unique_id);
>
>         if (dev->gpu) {
> --
> 2.25.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

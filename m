Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A443E341383
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 04:36:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACC96E975;
	Fri, 19 Mar 2021 03:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FE36E970;
 Fri, 19 Mar 2021 03:36:05 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 x187-20020a4a41c40000b02901b664cf3220so1964287ooa.10; 
 Thu, 18 Mar 2021 20:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V5N2rEg9VhvQue8bVp0pO6l2JMPpHyJZDJ/KHUZ6Vc8=;
 b=gsF2SBGxPuldrPBxT5jwhewdWAlJbxr1L9dZBZUUcFwdgZx9Ms2OhyJXS2groCwCSv
 NGs1qwm/SvN9bBqhpLgNByrDc4kHjPn/+oKQX7xydlyomPlyJfaLfz+FeGWHAKJqxnRS
 bguiSo4SOkcgj5x4aatLQuvabk+r9ICB5Yn5uMCQXRKKdfpjUMeltXB/yvq0VKgRiPhj
 35qlxaR9w8n7jbDyKYbU383MwyxpV52t5yeymGHcjsdIk8SMlUDVM2mbnGlx9QSj2n96
 EK40qRsNSZ22qbw3kZ/M9aitqHhijPycjqZuwEEtwrQ9946SOrjwAyImgzwnxqXY09jW
 zaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V5N2rEg9VhvQue8bVp0pO6l2JMPpHyJZDJ/KHUZ6Vc8=;
 b=cQ3Tj86snYYM8wCCVjAHT9UJ04Anar1Jip94HCke3GSNWgmbZu/BnU5tVx/Fqgv4Bc
 9tHx3KeJjI7p2dCayJmm+7sjfw0fPEKwyzPZK+AC2sfCdFxudGuym66G9IAQJQTVu6A7
 XQQg1VhGnYRt8LFUiOvkEGQxNHl3z3vvO+OjPQx9IPMNS1pg5b5uwLKprENSY0Cyfqan
 Mmvwg5i0PBkQTT8GwOcsZ060bpyig3IyXZmR8JLcZqEW9YXTv3IwJ6/Jok5nD+IRMJy9
 DYfvAeSnQv9aoFzbyYzkg5kg2M2DzbmpB9PKDEJzpTcZFUp6seNMTp0ahTPzVkE0pISC
 y82Q==
X-Gm-Message-State: AOAM5335523b1BRydkLtgo260dLJKTTyoOrk/rw9jNGUUahNw2NPwrcj
 xueocjUlZCcNGQfinJ+QQS9SJBLSMQSgWtobOx0=
X-Google-Smtp-Source: ABdhPJyNOud3n18QxGzdZdz018WeLgmgfKwbaEPYrkO1ZJitepN9fMereYb0SpwZhay6NBxjkw/To45EBcK2OfWgoz4=
X-Received: by 2002:a4a:7615:: with SMTP id t21mr9986585ooc.72.1616124965033; 
 Thu, 18 Mar 2021 20:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210318231815.19546-1-unixbhaskar@gmail.com>
In-Reply-To: <20210318231815.19546-1-unixbhaskar@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 18 Mar 2021 23:35:53 -0400
Message-ID: <CADnq5_MC6f72e06xhWxQ_UKMYiw_=KfiESWxFm8s8rXBPPkMSw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix a typo
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, "Chen, Guchun" <guchun.chen@amd.com>,
 Dave Airlie <airlied@linux.ie>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Huang Rui <ray.huang@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jiansong Chen <Jiansong.Chen@amd.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 John Clements <John.Clements@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied both patches.  Thanks!

Alex

On Thu, Mar 18, 2021 at 7:20 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
>
> s/proces/process/
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/psp_v11_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> index bf3857867f51..c1d5a3085bae 100644
> --- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> @@ -598,7 +598,7 @@ static int psp_v11_0_memory_training_send_msg(struct psp_context *psp, int msg)
>  }
>
>  /*
> - * save and restore proces
> + * save and restore process
>   */
>  static int psp_v11_0_memory_training(struct psp_context *psp, uint32_t ops)
>  {
> --
> 2.26.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

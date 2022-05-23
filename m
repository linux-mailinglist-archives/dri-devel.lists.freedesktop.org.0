Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 669EC5315F0
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 22:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93C910F592;
	Mon, 23 May 2022 20:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5047F10F592;
 Mon, 23 May 2022 20:17:46 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 t14-20020a9d66ce000000b0060af9ed4b87so5726311otm.9; 
 Mon, 23 May 2022 13:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9DUh6l8ZBN76lnS45q0wf6jiM8BayaXvjyPIbUUAWTA=;
 b=R/AES/FlpFR4Wmbz51yvQ/jtXB3RgnmZ9r8MHiSzVwh62L5Oj6rGCFpXrvzOZ6MUoN
 NJud8DwB0Kq3PwBJnPWnJZND/dRITJBxkz00GFyn0N6HLcOEJ9kMpvPuvXwdaLHio+U0
 7uWAN8smybjlAD4Rjju8jBi4Sn4I+S5yVIdX4l1eQ2BjJiBUkM6W2V8Pyx3Ui275KdOn
 Mb1xB9hUOzo2joQecY5CnJNDZsLwImfMrALeAr1cFQkOINceHcBqI92wD3a0D3our4UV
 qiuvDuNR5kiBFXeqFAofGUaqibsL3JzaGqNLQWzVhnyz07v8/cAKJCim+h1qvvr/0IMa
 TWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9DUh6l8ZBN76lnS45q0wf6jiM8BayaXvjyPIbUUAWTA=;
 b=KLtHmcvGLPhGNKOjNHkqKp4+ZVm0Iw7a7Y9ZPvV6fHOWjiUD+IE5dcSFiDd302rT3Q
 14VRU1unC0C4J0d7Dsz8jU0ABVrFKvCuSbTVcis1jkkbQHx9HvwFdw9cec+4m/y/Hhjt
 pJZuOIjeQ7y6kQ/CZf7uh8uX9INauhOBFDo+mDJtMUbtExG9Z4riYfZtP9Spq1Vdo39s
 eko2J54asxCoUBZ9Brq9Q4nsGhXhE7vz44F1LBS4DI/ragbijZWEl7/xiPGeS/XF/Apy
 TLTCdKj8Es5gjYkytfknICAqszip072I8BDtbtL2W2kQuClLkY5UVYkIFhiTedZYA4ex
 bnXQ==
X-Gm-Message-State: AOAM532Bx1OeAOOn+VW43wVT9d56XiEQlN3rlHBLpxkDJgHj4SpFlX5b
 bKaCrpvJwj5CUjrUlgTJB1pklf6pFzSGLYuNF9O5q4gW
X-Google-Smtp-Source: ABdhPJwVz/W2po1d5TwSlFiQ3ZLNrMa1hBA0NDPQZsBA4wCrc5SAYByfN9LWffY9S9XDU65c6eFAONAuiF4zTdWNZaE=
X-Received: by 2002:a9d:6543:0:b0:605:e789:271e with SMTP id
 q3-20020a9d6543000000b00605e789271emr9333863otl.200.1653337065638; Mon, 23
 May 2022 13:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220521111145.81697-74-Julia.Lawall@inria.fr>
In-Reply-To: <20220521111145.81697-74-Julia.Lawall@inria.fr>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 23 May 2022 16:17:34 -0400
Message-ID: <CADnq5_NJq-b4UfF_PpwYc2PV8Nt++cj0RsC=yxkbCfQtJ+meJQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: fix typo in comment
To: Julia Lawall <Julia.Lawall@inria.fr>
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Sat, May 21, 2022 at 7:12 AM Julia Lawall <Julia.Lawall@inria.fr> wrote:
>
> Spelling mistake (triple letters) in comment.
> Detected with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 8b5452a8d330..67abf8dcd30a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -1621,7 +1621,7 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
>
>         mutex_lock(&mem->lock);
>
> -       /* Unpin MMIO/DOORBELL BO's that were pinnned during allocation */
> +       /* Unpin MMIO/DOORBELL BO's that were pinned during allocation */
>         if (mem->alloc_flags &
>             (KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL |
>              KFD_IOC_ALLOC_MEM_FLAGS_MMIO_REMAP)) {
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C221551AE7C
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 21:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8682D10E7FE;
	Wed,  4 May 2022 19:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7EB310E7FE
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 19:57:43 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 c5-20020a9d75c5000000b00605ff3b9997so1614613otl.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 12:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dy7VslocYd7Ik7ZVi8wr4XTgiG9in8eYLGuya5id5sY=;
 b=Ahg034XZu9daK3HQWsW05rJlO+NjIZej5l9ow7RuB4MCjcTAFI4s2edxeS7UcoqFIR
 u7G5pYkAFvLENp0OI5HIxBXCRUoBq3BRg/lRHT8L53yN0eWGnK4ksb68PbBa08dT3REI
 Gqi1Dvc7wyTF4YObgFSUn9RjR9hgKCfCv2vm+/DtAksZTAWwqD52cfBLAGee0H9hL3/z
 dGJwrG9Beq5jv2Jdq/nq/xoLX02pcQdzSmq+48ILK2N07CJRnx5vJtnHxlKrpNZLWy3K
 8VEyuIkG41VkkQWAfkMKJopnOjdgOkeIrkuVQQGYHlPwHgIhoWQRypz7M5FYdXo3/9XH
 qRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dy7VslocYd7Ik7ZVi8wr4XTgiG9in8eYLGuya5id5sY=;
 b=AR3Z2OIf7MpD9wet1pCMZdx5Hz+U2pVh/IJV1CqeUYUFp5H/72cViKzxTTt5gyRBvO
 iLO1sydiyNRwOGT8x/53zCsPm3qsw7waxXksgunOIGiZVbwlYgI78TguoFYa8sd5FTBN
 be5OKL7m5xG9VNMHL99ZTxJQ99rDq/sfUFknklXozof8SswiST5GaJdEf4QAKXfXHdKB
 DG9SKeS9CjB2kJC1rJvZOSeojao06Y+CPCKZTEXrXgD83yCqbuoIOK50S8s9qjI7RdYr
 kIacFpds1CrpoqSroJdkrDifbJltQ6JIppPtQYIc3mFfMRrOaFLnQLI+0XObnDSUGgsE
 t23Q==
X-Gm-Message-State: AOAM530lVVEfoKz7AvQGDddsb0QnnMEbnw19K5bwg0VtV6HrcElc0SEm
 ajL5cAB9AArGSZVEe+B426k5PPzSMYm0FWordPDacn7B
X-Google-Smtp-Source: ABdhPJz09O0tnqGq/8JVFI4LWivSYk0ccPwS9vHhZongUY/gNE+NP9w0eKtYSNE2AWLkFnxhDJJlxciNfdsBWeWRzDs=
X-Received: by 2002:a9d:195:0:b0:605:eb43:5b84 with SMTP id
 e21-20020a9d0195000000b00605eb435b84mr8153917ote.357.1651694263062; Wed, 04
 May 2022 12:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220504165009.82557-1-mike@fireburn.co.uk>
 <20220504165009.82557-2-mike@fireburn.co.uk>
In-Reply-To: <20220504165009.82557-2-mike@fireburn.co.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 4 May 2022 15:57:31 -0400
Message-ID: <CADnq5_O+PTUdnEnY8GbX3Bp_k+_wG0zkdEmKCuXzBDueGK_gnA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/amdgpu/gfx10: Initalise index
To: Mike Lothian <mike@fireburn.co.uk>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 4, 2022 at 12:50 PM Mike Lothian <mike@fireburn.co.uk> wrote:
>
> This stops clang complaining:
>
> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3846:6: warning: variable 'index' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
>         if (ring->is_mes_queue) {
>             ^~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3903:30: note: uninitialized use occurs here
>         amdgpu_device_wb_free(adev, index);
>                                     ^~~~~
> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3846:2: note: remove the 'if' if its condition is always false
>         if (ring->is_mes_queue) {
>         ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:3839:16: note: initialize the variable 'index' to silence this warning
>         unsigned index;
>                       ^
>                        = 0
>

Thanks for the patches.  The proper fix for patches 1 and 2 is to
protect amdgpu_device_wb_free() with if (!ring->is_mes_queue).  Care
to rework the patches that way?

Alex


> Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> index fc289ee54a47..7ce62b12e5b4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -3836,7 +3836,7 @@ static int gfx_v10_0_ring_test_ib(struct amdgpu_ring *ring, long timeout)
>         struct amdgpu_device *adev = ring->adev;
>         struct amdgpu_ib ib;
>         struct dma_fence *f = NULL;
> -       unsigned index;
> +       unsigned index = 0;
>         uint64_t gpu_addr;
>         volatile uint32_t *cpu_ptr;
>         long r;
> --
> 2.35.1
>

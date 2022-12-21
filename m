Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BDB65381D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 22:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1753010E4AF;
	Wed, 21 Dec 2022 21:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E05610E4AE;
 Wed, 21 Dec 2022 21:11:41 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-14455716674so276700fac.7; 
 Wed, 21 Dec 2022 13:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bmpu7AL+fAIuY/tlwJdP/dq9eTvyl96yltPRV9LiAiA=;
 b=nOAnXdGXwbMk/4KnLPJ4VLWAHS+8OUfWRF1Tt/ignb3vMBtHwESucSAgaBvgDBp/Y4
 ihUu67reNu4J6tQzlUps60JAnqU5HVRj5z42r8aNqXkbH2ZFE443t/mU9HKRvFUleQbq
 Y9yGESrQwOQZYeIsfZAOTjuwgXruOPVSyFcrZpa9xn9WhA6K7F7u0GGtQAVAztuBJrs5
 TGuzGjwtWvOcr/86Jm8IbsVemolSB13a/r/D4b070t4I87ReOzCuONRvyoiQz5QNfJfk
 +vuwY/aGJiKoMEPy0uW/ncdAc6SgvardnoxUEpB1CjUkuPZxP4WPynLjxtqw9h+UkOfK
 XNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bmpu7AL+fAIuY/tlwJdP/dq9eTvyl96yltPRV9LiAiA=;
 b=FmSGwNlDOdAGTYdg3YDzY/xH4W23DmNzeseu478EAIl+YWqEOqUBHgkXg+pBI1O7Zd
 Hlao3+VL1jcxx9M+Yj320mquax2zP6YQIT0FVIQsMCUFbJQhovqpFYDoC9OYzS8sywSA
 ZZLO596ebv/aCEYrjLXL0kK8YLAGlv8udq01Za5lA7vL+FecaCErRThFCjuBtvNrtLIO
 qUoEb+jlgEcTazaMZ9rP9jtZ2AG/+qfgh9DqrXVBPhrxcUe2hccH3vAEGo/mthpVnkmb
 CAhvx+vS3ouZavyIZTPl2SW9hxqgj0lcujmen3RGQA8Id7RULnrVb8mDHjyktQMU/h1e
 sKVA==
X-Gm-Message-State: AFqh2kpurp1CcC5Lhdf7PSgCheckSKFYm4OdqScJ22IJxbbj7Ub6lAcF
 sJycxqNEv2HsZuLstsH0bVSmRHF4kToRzU2uSmdrR/hW
X-Google-Smtp-Source: AMrXdXv8Xtywvi0EhEnkpNM8pHFNJ//rBoeCPI3qTpCw7dSEPWqPuPld4BVlRh0w1T6haQh3h+88ASugTxJbzCG3nGE=
X-Received: by 2002:a05:6871:4410:b0:14c:6b59:b014 with SMTP id
 nd16-20020a056871441000b0014c6b59b014mr256289oab.96.1671657100512; Wed, 21
 Dec 2022 13:11:40 -0800 (PST)
MIME-Version: 1.0
References: <20221219142150.56654-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20221219142150.56654-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 21 Dec 2022 16:11:29 -0500
Message-ID: <CADnq5_Ms_hzDKPUm8a8tU5bFEy0PyBFdQiU1z0dsWgJOTjGmAg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove the unused function
 dmub_outbox_irq_info_funcs
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Dec 19, 2022 at 9:22 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> The function dmub_outbox_irq_info_funcs is defined in the
> irq_service_dcn201.c file, but not called elsewhere, so remove this
> unused function.
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn201/irq_service_dcn201.c:139:43: warning: unused variable 'dmub_outbox_irq_info_funcs'.
>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3520
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  .../gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c   | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c b/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
> index 5f4f6dd79511..27dc8c9955f4 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
> @@ -136,11 +136,6 @@ static const struct irq_source_info_funcs vupdate_no_lock_irq_info_funcs = {
>         .ack = NULL
>  };
>
> -static const struct irq_source_info_funcs dmub_outbox_irq_info_funcs = {
> -       .set = NULL,
> -       .ack = NULL
> -};
> -
>  #undef BASE_INNER
>  #define BASE_INNER(seg) DMU_BASE__INST0_SEG ## seg
>
> --
> 2.20.1.7.g153144c
>

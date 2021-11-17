Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD9E454F80
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 22:40:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46EA46E858;
	Wed, 17 Nov 2021 21:40:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BA489A1F;
 Wed, 17 Nov 2021 21:40:42 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id s139so9302912oie.13;
 Wed, 17 Nov 2021 13:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=80qrjaKuckfIxKf3DLVTv6a7iYoyD9Sd1U/A6GrtV40=;
 b=AjM9ULmodQVC58Cu0Dno9jz4ysnFH2WEnIivupLTuRkk7hn0LPaYS477qAkjYt4T76
 4L9um1lijnyvYCMUp3vkHhHEDwwL/1CjaDGhIxJcnnL+2upS7hXM90dXhFInZVc4fUTG
 ZOwqBRuF+Js5dkKZXWrqx2eXCoY7ZJNxokKNSmIKfQKUma6a8m2ue84OLVluZsP0qKlQ
 vIYnpkWXh70s1glTHAWmfwHfJwIUmkDDjM2dKUKeRnIEbSnMTK0WtHlJV0cuB4KAtI5t
 qsIwC5bSbizogJ/rE5xWK/vJwUecbWTGUe64Q0bawFbMB1+1hZ5mf3M0zO8tDfQIhLtu
 bQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=80qrjaKuckfIxKf3DLVTv6a7iYoyD9Sd1U/A6GrtV40=;
 b=seY+k5+Jfxlmp4uD+YlKkbCTZE9lXjYVWDtRl9yML6VNB60Gj2pxQMRLngtARsSJj8
 eg8U8kKIHsaTz0qsihXwZr+/D+e4iac2kkz7Zr9SMgXn/7K8ceq34nZc9yvpum7G1+E9
 n4RqOZfLKBEO2nfch1taGDu7rs0qYoMLL9jG5a5N2U0j+TpQDIljt610yv14nOMQ1ZgY
 5GPMEcjvSCwdXZwFvqzpI2u7bEtivRjsmAN89yZxKJHG1GclXqaB8BpNZ5JDY4YuI4CU
 TZmep5P0JANFLCt1eqR5EGnaTzpzM/Pu5WJLuKd9zZaw2unWIZZnzWPe0dZyoGG7t4p1
 +ZFw==
X-Gm-Message-State: AOAM53297CIr59Lu3K9hbPxV/EgVYELXMe8/8Z5l9trYSalTRZR/nHeW
 HE7veUhtZbdQy2s3UTD+1QAVoemPnM0HPrDzdB6z8h3S
X-Google-Smtp-Source: ABdhPJxrs7xTtPn1zFRtZ5i3FY/8UZ/DJotfsZ7+hYwxZMxL6ar5KwSQnPGsPX0qTiwORjQm6ItE+gRSOvERV7I704w=
X-Received: by 2002:aca:3f87:: with SMTP id m129mr2809816oia.5.1637185242017; 
 Wed, 17 Nov 2021 13:40:42 -0800 (PST)
MIME-Version: 1.0
References: <1636963819-19726-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1636963819-19726-1-git-send-email-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 17 Nov 2021 16:40:31 -0500
Message-ID: <CADnq5_O+h4J5hYrnODix4_bdMgyZMt-wcUsSWr6DGrWwUkJFog@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: check top_pipe_to_program pointer
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: Dave Airlie <airlied@linux.ie>, llvm@lists.linux.dev, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Nov 15, 2021 at 3:10 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> Clang static analysis reports this error
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:2870:7: warning:
> Dereference of null pointer [clang-analyzer-core.NullDereference]
>                 if
> (top_pipe_to_program->stream_res.tg->funcs->lock_doublebuffer_enable) {
>                     ^
>
> top_pipe_to_program being NULL is caught as an error
> But then it is used to report the error.
>
> So add a check before using it.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index 39ad385..34382d0 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -2867,7 +2867,8 @@ static void commit_planes_for_stream(struct dc *dc,
>  #endif
>
>         if ((update_type != UPDATE_TYPE_FAST) && stream->update_flags.bits.dsc_changed)
> -               if (top_pipe_to_program->stream_res.tg->funcs->lock_doublebuffer_enable) {
> +               if (top_pipe_to_program &&
> +                       top_pipe_to_program->stream_res.tg->funcs->lock_doublebuffer_enable) {
>                         if (should_use_dmub_lock(stream->link)) {
>                                 union dmub_hw_lock_flags hw_locks = { 0 };
>                                 struct dmub_hw_lock_inst_flags inst_flags = { 0 };
> --
> 1.8.3.1
>

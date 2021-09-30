Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DAE41DFCF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 19:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6749D6EC0F;
	Thu, 30 Sep 2021 17:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3759B6E444;
 Thu, 30 Sep 2021 17:10:01 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id s24so8156325oij.8;
 Thu, 30 Sep 2021 10:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yQogwYZrvFu5Jfwlkrcfq3WvY8WdwXPWkmnjzSEdhJA=;
 b=BnTi5yVXAfDjmWTBRPXF8NGo1YE+5AZtAQsVeFujbgn52DpBNG/u8BQCEA6yTZObMG
 wehpKbgoGdQ9/QTuH+G5l39mHnrCNXaZC3HRFNjQuNBadU1z9yvSWHC06Gx7uhyZHMFc
 mib9yjTtb6lr7ZhK1la1hOWvhyIRII+nMOl9PVfm9aUTXNvmW0hANEbfugTvEBEmSatI
 xaTq4+hIWVdNRE4a/lKOUOeV8VynnBZxyRIZFtxa6m7GTlSsM8qRTDLXcILWujx6ipOb
 JRUqVVydfpl1D/YwKGad+pUGCOBKPdk/EgzL3PB30/ZwSzU2g7QUYKe9HVgDJt3wcLmo
 BDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yQogwYZrvFu5Jfwlkrcfq3WvY8WdwXPWkmnjzSEdhJA=;
 b=4ppO9BFLSdY0NSRgMHizDVfWe69Pom5RQfWrO5Jys5dvFnQTV/P4VbMUGDPy5V4TTt
 ukwkADDhOq4P1Aq0fvBHZcDlaN3zDcWPuMMpGx/IDNbE6ey5wLFADvgh6BeVUHH+YIaj
 ub7rjc3fBO0u+ydSBB/ogvBVOMify6guxuGIY1Yump/AM34jcy4OzsSF6nBsQnmVfc8M
 Cf3l4F39BYlCpWj11BABFQLXirwJoxDvjYw1YFAOPSdoBIwzkeDMh2LJ2yES7D5Jw06u
 np6Bplw6GfqC+dlvLEyGBL5/OiawZYJu5yWClFBsU/FhVGaDhXYZFOlKoOfqWvs1rpKl
 pPQQ==
X-Gm-Message-State: AOAM530RfEEDnQq8kuCwj/Jv7cMaEAnEHIryTn8iZR3KuQ5GKYlbIrvL
 uOuJX03ni9nRloOR2A5jBplWV/gTIqyCLdGtiaE=
X-Google-Smtp-Source: ABdhPJyRKPsrHxUPVPxsmZJBSYdQhA0oY4DyYGw0Ib3s43wNku5L4chLBN6tFR9C67rUuP9Cv4X16bsCZ1CgRYrsJxc=
X-Received: by 2002:aca:706:: with SMTP id 6mr283505oih.5.1633021800478; Thu,
 30 Sep 2021 10:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210930162302.2344542-1-nathan@kernel.org>
In-Reply-To: <20210930162302.2344542-1-nathan@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 30 Sep 2021 13:09:49 -0400
Message-ID: <CADnq5_PBMGdUG8VMUQ2UOSdd9qXbZ7QoyGH2RTgUPnTjdzKqFA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Return NULL instead of false in
 dcn201_acquire_idle_pipe_for_layer()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Sep 30, 2021 at 12:23 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Clang warns:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_resource.c:1017:10: error: expression which evaluates to zero treated as a null pointer constant of type 'struct pipe_ctx *' [-Werror,-Wnon-literal-null-conversion]
>                 return false;
>                        ^~~~~
> 1 error generated.
>
> Use NULL instead of false since the function is returning a pointer
> rather than a boolean.
>
> Fixes: ff7e396f822f ("drm/amd/display: add cyan_skillfish display support")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1470
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c
> index aec276e1db65..8523a048e6f6 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c
> @@ -1014,7 +1014,7 @@ static struct pipe_ctx *dcn201_acquire_idle_pipe_for_layer(
>                 ASSERT(0);
>
>         if (!idle_pipe)
> -               return false;
> +               return NULL;
>
>         idle_pipe->stream = head_pipe->stream;
>         idle_pipe->stream_res.tg = head_pipe->stream_res.tg;
>
> base-commit: b47b99e30cca8906753c83205e8c6179045dd725
> --
> 2.33.0.591.gddb1055343
>

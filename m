Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5578314E0DE
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 19:36:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157346E8D8;
	Thu, 30 Jan 2020 18:36:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789096E8D5;
 Thu, 30 Jan 2020 18:36:38 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z3so5420902wru.3;
 Thu, 30 Jan 2020 10:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nxOm33nBoQ951BS1wuIg4vUOUtrE7fNhIJifAOgimy0=;
 b=EgiscpUZcNg/uQV40kNR1mI8E2cAbOC5WOnuSQYuP8DgyFwZgcie/n2AC5zhOE6dML
 RTzpOWCThdFJel22VW0FBSRcT4STT9IptAe4liugxThmFiKKVb9UmzVDI+4vnVmCVbKh
 /vo0JvGjcQsbN5TPjH1riLpXfG1Jx2TFk87NFenMIR7dnDzk0nZgxlLMq9JQOCXphzOG
 bZJX1zfmlzbwCUI+dE8CXTbW5YLxDnNKlXyFlb64nEDDgQscq6aMUtyiOQxG2YXffdQq
 EmiQ5z69NdkLS3iPIxIeL0EPBq5ZBcPl8UIID5TA9BAh5el3gWwQ/ymkgwHUh73t1FnV
 3wIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nxOm33nBoQ951BS1wuIg4vUOUtrE7fNhIJifAOgimy0=;
 b=e/MTsRiq4S7vbEIIillpE+sUgW7r+L7msIGq7GsSyAU8K0peKS2vINXV0toFeavzcD
 6oFBzBFNWzc6cyrxYQq2i13gUHGnEnIrM8TGduuZeI+1FFALNWzmqY7zqqqu/7pfgFow
 auRbwJOH4s1+HvatqcURR0HQvcRrWZOtvsmNnTk31G+zCUyu+vnambgxFwRcK9ErGaWh
 3iOwDKTYTLqMzbY4/cWnEB5shvbIc4m8XIoCv2PWQDI4+afp1ra7XYKxWui3iEO88ZaD
 3C8rFCplqUa26Ij0tj2LMIjNgf+wGwphvIZtCzCpHspt3wcubPu4nOTg6KO7NQY65HBK
 fWUQ==
X-Gm-Message-State: APjAAAXxyd/fNWEM6xGUJXKZKsQWmQc69NBseWqBMIDLGOzu+LKMHAUm
 Lw1FaPkGTCC87T0XOh/zPBePJVCrEtRK4eRl22I=
X-Google-Smtp-Source: APXvYqx2TzHXCb6BKa82GXdtX4Wu+vDT/+VJdGzjhuQ9HifgSYooKyQNebZQAjfJYETs1lqSs58NYc3eQ8q6xsd+0Pw=
X-Received: by 2002:adf:ec4c:: with SMTP id w12mr7381485wrn.124.1580409397096; 
 Thu, 30 Jan 2020 10:36:37 -0800 (PST)
MIME-Version: 1.0
References: <20200130012435.49822-1-natechancellor@gmail.com>
In-Reply-To: <20200130012435.49822-1-natechancellor@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 30 Jan 2020 13:36:25 -0500
Message-ID: <CADnq5_MzvC=7pLufULN3nGDAwBE7Th7oWcUKXbYFouv0729GwA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix implicit enum conversion in
 gfx_v9_4_ras_error_inject
To: Nathan Chancellor <natechancellor@gmail.com>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 30, 2020 at 3:33 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Clang warns:
>
> ../drivers/gpu/drm/amd/amdgpu/gfx_v9_4.c:967:35: warning: implicit
> conversion from enumeration type 'enum amdgpu_ras_block' to different
> enumeration type 'enum ta_ras_block' [-Wenum-conversion]
>         block_info.block_id = info->head.block;
>                             ~ ~~~~~~~~~~~^~~~~
> 1 warning generated.
>
> Use the function added in commit 828cfa29093f ("drm/amdgpu: Fix amdgpu
> ras to ta enums conversion") that handles this conversion explicitly.
>
> Fixes: 4c461d89db4f ("drm/amdgpu: add RAS support for the gfx block of Arcturus")
> Link: https://github.com/ClangBuiltLinux/linux/issues/849
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_4.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4.c
> index e19d275f3f7d..f099f13d7f1e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4.c
> @@ -964,7 +964,7 @@ int gfx_v9_4_ras_error_inject(struct amdgpu_device *adev, void *inject_if)
>         if (!amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__GFX))
>                 return -EINVAL;
>
> -       block_info.block_id = info->head.block;
> +       block_info.block_id = amdgpu_ras_block_to_ta(info->head.block);
>         block_info.sub_block_index = info->head.sub_block_index;
>         block_info.inject_error_type = amdgpu_ras_error_to_ta(info->head.type);
>         block_info.address = info->address;
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

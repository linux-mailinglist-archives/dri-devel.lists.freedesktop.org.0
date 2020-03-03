Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3302F178BC3
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 08:48:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888056EAD4;
	Wed,  4 Mar 2020 07:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C23D6E964
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 21:59:08 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id h8so2170699pgs.9
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 13:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ddapSUJt6ntLiYzzjDAEz3gG4fW9QkFbYIQvX7Nl4Wc=;
 b=HvFSulAcRQ9FH1nMyqzV2UlBduKJxbKupcWDMN6FDg342qavq7XRv4+kauubRe7OTf
 tpJHVbvlzT18i/r27rTEYINBnzpXMkhr1uHas5plyxkywdThRYkPbDsuMUaWbmR822aY
 hSNDw3l5DDYqBaG51Km/QULhrlNGyRDPM/LKMOs1/mNfuTyNM66y+opv9NXbB62zcmAF
 Ihu7ymArZ2+Jf1c9TA6FaFHstjgRfeCjxNdCKF5DN0IJS0o0Fm/85jn6TmD7BquCdDdk
 MWPtVQnns4SH1MqLxMGFcngWwdrSDQkOUWeHmcBc2cnJd8Tpp/jqjsVIf6kwSBOUe4HR
 ihZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ddapSUJt6ntLiYzzjDAEz3gG4fW9QkFbYIQvX7Nl4Wc=;
 b=DtmMtZNpV0xE+t+tZ8B84Y7aOO0FE6XGSD2mRjq3N85Pc60/HWjNVqBbHs3XjMHCvX
 ud6dPo3BSg4tRrydGad/fuEyWsTkrrjvQSxMPMglfjwPBM7AKJdtoZ/R2dmjC2uzjmtJ
 dAPT5kUCqqzMi5iicKhpWkyjc3V7iE72sru1s2fH2T2xPydpk3VkhUqWhgu7E78Rbv6G
 f2+8izdEiK3kQlokzvX1rF/S/qcuNdiseqk0E5SFlGDGMlUwHLpHJNYz0SAd/syPA7qr
 2csUTAA6GKppKJugz6a3+dDjI3FK4nWSQXZv87qKOlg1NVZjla5Tfyw7ccXcrLCs9kSn
 dgEg==
X-Gm-Message-State: ANhLgQ2EpO05sBr4n4G0M/P3z+M8b3+GWnLfHz75OloOkjFzFu3IZPkQ
 ovNTzKX/jK+lpPrrRkVX/XCxr1F2z5166oxOzQu30A==
X-Google-Smtp-Source: ADFU+vuSSO5ovOYN0PsHWrzzb/fJClDu5pNQ9UPGolmosCGXWuIMIFmAgxO6x7bG2Tpjw+xFGeX17CX9X2YpTRcLBuc=
X-Received: by 2002:a63:4e22:: with SMTP id c34mr6056814pgb.263.1583272747246; 
 Tue, 03 Mar 2020 13:59:07 -0800 (PST)
MIME-Version: 1.0
References: <20200302224217.22590-1-natechancellor@gmail.com>
In-Reply-To: <20200302224217.22590-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 3 Mar 2020 13:58:56 -0800
Message-ID: <CAKwvOdkaiU39xmtEheM=754sdGMTB-sP1GRGacpW4DGkdjugfw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove pointless NULL checks in
 dmub_psr_copy_settings
To: Nathan Chancellor <natechancellor@gmail.com>
X-Mailman-Approved-At: Wed, 04 Mar 2020 07:47:28 +0000
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 2, 2020 at 2:43 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Clang warns:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:147:31: warning:
> address of 'pipe_ctx->plane_res' will always evaluate to 'true'
> [-Wpointer-bool-conversion]
>         if (!pipe_ctx || !&pipe_ctx->plane_res || !&pipe_ctx->stream_res)
>                          ~ ~~~~~~~~~~^~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:147:56: warning:
> address of 'pipe_ctx->stream_res' will always evaluate to 'true'
> [-Wpointer-bool-conversion]
>         if (!pipe_ctx || !&pipe_ctx->plane_res || !&pipe_ctx->stream_res)
>                                                   ~ ~~~~~~~~~~^~~~~~~~~~
> 2 warnings generated.
>
> As long as pipe_ctx is not NULL, the address of members in this struct
> cannot be NULL, which means these checks will always evaluate to false.
>
> Fixes: 4c1a1335dfe0 ("drm/amd/display: Driverside changes to support PSR in DMCUB")
> Link: https://github.com/ClangBuiltLinux/linux/issues/915
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Indeed, they are not pointers, and no members within `struct
plane_resource` or `struct stream_resource` seem to indicate that they
are somehow invalid.  Good job sleuthing out the correct fixes by tag.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> index 2c932c29f1f9..a9e1c01e9d9b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> @@ -144,7 +144,7 @@ static bool dmub_psr_copy_settings(struct dmub_psr *dmub,
>                 }
>         }
>
> -       if (!pipe_ctx || !&pipe_ctx->plane_res || !&pipe_ctx->stream_res)
> +       if (!pipe_ctx)
>                 return false;
>
>         // First, set the psr version
> --
> 2.25.1
>


-- 
Thanks,
~Nick Desaulniers
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

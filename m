Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A20532F6801
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 18:45:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 346FE89BB2;
	Thu, 14 Jan 2021 17:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E697989A34;
 Thu, 14 Jan 2021 17:45:23 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id j20so5945361otq.5;
 Thu, 14 Jan 2021 09:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=biVMFSBw0YDhsHHZD25EuPPOy/9ylGC+kj+DhNfcuK0=;
 b=adPoh0/PQ4EF55+Tnwj7ZNyJFQL8HROJbrAOy4PcjhxyvBRh068TN8gwbjOIFG5Rc9
 fvuJEd+sA1t76HIiAPUp3Y5RlJNs0XvWRK65xd9bwbH69hP1pSmbPbTSpYP1Sm1/DrZI
 xvxMcwCeD8EST+qBAciW6rAHFY+qNg4pELXoTmqTy9V+mtEzMbWYUOFR12M+TEsSfWeW
 tUdjutNQ4Fr5koPy9snsXyrE0HieJSiNMBReTLRLjTV8lTa9co1j/42CWeIlqAovQfFo
 UjsVINDarxji89xgIghPgWb9suLUGAx+pOmz9wWYxDQiWq2OJjFr/a9Yby+Zm91RubKh
 l6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=biVMFSBw0YDhsHHZD25EuPPOy/9ylGC+kj+DhNfcuK0=;
 b=uGcAGEjpgPZT8nTQ3Qsql6WvdFLWEd6I6UNRKlL0RD+OS/lTy50jfLSCCiLeSHVNy8
 Bn8VNSg26Svt2eQtfGoi9ZiwklOxdYFTIoKBaAaADL+191BubFt8rlbQDcL4jan8qb6i
 nObNL8BwG0N5QNDIsuRx3SFSAVnjTY1uIPCDn6l34JYzw6HBz3IGK2DLQlgFkZDaouh+
 8t/xKRIhI27hWAiVoZ7axg/EK5JItlk+A5BMkcLjUEd5DNDvcHBMTkv+/kymQ6jkN45V
 7V2LeeG+/U7uOTGdLjBxLBLKk+4OchjzRZhXhDOSLh4ytNwQ4P2OcbMKjmA5eUvL6HlQ
 YOIA==
X-Gm-Message-State: AOAM5326M5oC7GeeaRVcOMcMSOA8ZR+wd31GQz18XCvKtVBeH49utyDs
 GF64+s/YE33fF3EdIQEQAPqda1g7CdjtntpEex0=
X-Google-Smtp-Source: ABdhPJy7vuCtX7WvgMlO6/iSixQuiAhNNyVMyJE9M+O+u56bCoDNtw9abgiE92q98Bsdq4GyUpFiU65Nyta1++5xi3s=
X-Received: by 2002:a05:6830:1b7b:: with SMTP id
 d27mr5559182ote.132.1610646323286; 
 Thu, 14 Jan 2021 09:45:23 -0800 (PST)
MIME-Version: 1.0
References: <1610531055-56146-1-git-send-email-abaci-bugfix@linux.alibaba.com>
In-Reply-To: <1610531055-56146-1-git-send-email-abaci-bugfix@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Jan 2021 12:45:11 -0500
Message-ID: <CADnq5_PCkSMJcYu5YGa7zNg_xhfxMHWgAZoe5ybT0TQU+fK2ZQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Simplify bool comparison
To: Yang Li <abaci-bugfix@linux.alibaba.com>
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 13, 2021 at 8:51 AM Yang Li <abaci-bugfix@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warning:
> ./drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c:3141:30-39:
> WARNING: Comparison to bool
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <abaci-bugfix@linux.alibaba.com>

Applied all 4 patches.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
> index 45f0289..f33e3de 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
> @@ -3138,7 +3138,7 @@ static void CalculateFlipSchedule(
>                                 4.0 * (TimeForFetchingMetaPTEImmediateFlip / LineTime + 0.125),
>                                 1) / 4.0;
>
> -               if ((GPUVMEnable == true || DCCEnable == true)) {
> +               if ((GPUVMEnable || DCCEnable)) {
>                         mode_lib->vba.ImmediateFlipBW[0] = BandwidthAvailableForImmediateFlip
>                                         * ImmediateFlipBytes / TotImmediateFlipBytes;
>                         TimeForFetchingRowInVBlankImmediateFlip = dml_max(
> --
> 1.8.3.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

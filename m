Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 070A639E518
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 19:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DAEF6E95C;
	Mon,  7 Jun 2021 17:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716A46E95A;
 Mon,  7 Jun 2021 17:17:10 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id w127so18772159oig.12;
 Mon, 07 Jun 2021 10:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AtFqg3TR/taE0y/EKR7pUF5yxr+poA+jtZYTuPIvfeU=;
 b=UiwljjcSSloI3uGyBgqJOz+hqJuyMgwNynMRAK1DanPqP4KuB6AoDsslE3PDnOhhM5
 IEvI9akDR+vK7Am2aD4pk5XZbUcq/+qzUKMxcuyQPQaaOsLobrsMii9BgFMsgh/jakoo
 5wolJvn0IHCaFGhRZUSgUDFvxKltSFbvS18aP6d/qkncCIPuxppYcfuNzqYxNYBB3m5d
 wLXNTobxjRgZni41zzpE/7OA4ygN+c3UHXuiremmdVsVXW1Z8Tk7u5+HgzIT2YjwiJji
 JQQXlSYiMeGnCRfH2ExbIgXkHjy/+piLVVi4a5MRFP1em605rsOxheuIfwJqFJnsoXNH
 tSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AtFqg3TR/taE0y/EKR7pUF5yxr+poA+jtZYTuPIvfeU=;
 b=CFuMsBXDsrH4CSgHU75IUS43LSEIctBsCFahX7kDbMRIkLkbtG23SvSwGQYRNfLMse
 0Wdu0YeiTptKfYZxvMu7rkzRGYKxAupcWH0BLsNWYVD+j4Pkz6TYm1FRXZqPiju+QHlj
 9h4Ihh+ml+mf+rXhBgwkl15WiWrDkryxJsivLyUht0/jYT3Pj6/0n3m0Zf+C7p7MsQx5
 Arr+Qj6mv7lRnDncM5tREP/SPgapXsYTt5Gp/ntQQV8SAKAMe5dJq2Y6OEm0QahP23/e
 c3OK+nJ3XizoWHc9Y3nqSq1Hv8bd6pRWgNrkAyasENzLPlw33GTo76fyWoxG7m+rZ7uX
 yeig==
X-Gm-Message-State: AOAM532p5gKPO2N+leXqenCNEimUHyxkHBAEwL9P8tSC4tty5A80f//e
 2QAYtuK2USIZcGa9kC/DVYFH8az7ydoybEp5S8TtYfml
X-Google-Smtp-Source: ABdhPJzwkHlxtqTsMiF6NFAkb/Z3ua0k5ZWZ0fLzkk/iXTit2hlNeZTmodS5Bx8mn0idkpNDfkw9O7y6UfTHGGFB9Po=
X-Received: by 2002:a05:6808:999:: with SMTP id
 a25mr167646oic.123.1623086228330; 
 Mon, 07 Jun 2021 10:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <1623061651-33021-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1623061651-33021-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Jun 2021 13:16:57 -0400
Message-ID: <CADnq5_PnyYyzZwAMTb-A=fNM3BN5GmkrEciAT_n2XqqcAQKWrw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix duplicate included
 dce110_hw_sequencer.h
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Jun 7, 2021 at 6:27 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Clean up the following includecheck warning:
>
> ./drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c:
> dce110_hw_sequencer.h is included more than once.
>
> No functional change.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> index e731987..04d02ce 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
> @@ -32,7 +32,6 @@
>  #include "core_status.h"
>  #include "resource.h"
>  #include "dm_helpers.h"
> -#include "dce110_hw_sequencer.h"
>  #include "dce110_timing_generator.h"
>  #include "dce/dce_hwseq.h"
>  #include "gpio_service_interface.h"
> --
> 1.8.3.1
>

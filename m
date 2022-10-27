Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F19860FFF6
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 20:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C031A10E04D;
	Thu, 27 Oct 2022 18:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6181710E04D;
 Thu, 27 Oct 2022 18:14:09 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id y67so3244970oiy.1;
 Thu, 27 Oct 2022 11:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O9gqzuSFD8OHrR9IjrolL9UfkWIT9N31C4ipvtJhMW8=;
 b=JuqTzzID34wq6D1oN12Cd6J4Zq0xzc0zuLcz6NUrrTu9+v7ofooLT1itaZcs9MzZC1
 BCG3RGQpB22gU3Au43lu42WPhkdsUVfRTWPVEA3xcJ6YMMwI+I5EOtqCr5fLJ5R7blLA
 urKyTSa0XqOGaw/Hu1yj3mY37fHb0qUEutsEEXtpZvmD0scdfh9OkPfzccjMRYE0y7Xg
 heGrCoUmunHuaIkUrQcsCQX0GFZI1FIOdngfGdOsSI5gEZtaTLtuLIpa+8jEPT5etey0
 ZU2BjmXhwgkY8QhWy5HogrSpZJn5RabKCUKX6xgyo6OWgPizrzYC/TeVKc8P67QJEnaS
 uJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O9gqzuSFD8OHrR9IjrolL9UfkWIT9N31C4ipvtJhMW8=;
 b=SUeCIHJ2NIwdj+1BD5S6UGk1MryzbUEzmdMSgyOBs+kcV1uJAS2TKdlDHShSvl9DvW
 0iV8msYmrumLfR1kMQKxM0mLHdunmLwBVj7ZJaEDJ7DNvV9D6Vjz9YgWAv3cbG+APZNq
 0DkOnqHEEXPLvjn6Iotdj7+Q/Spvfdu+gURdfvnuLHOKmBdgFGLVEi287bffHgJrjJL3
 4A4Z52NLqKCZkaZC7szShDdT8+f+DBr6Tsw5cWEWboyj46AcZNbgmqEquOK8CfLzb09t
 mHJEPb+H5gpqI60EDgfmyZuYMjiDS/0mHW2396Zwe0WF8SpzeVLcs3ZKMUnegM7G/vm2
 O6IQ==
X-Gm-Message-State: ACrzQf0RF3j/9iMKPy/Llx5HleVniTGsB7+nZVqLJmvqFXiAj2bNP8oB
 QLMJMf290+EEaYVEI3wAIOeXTNBcjTZJGRKxK3A=
X-Google-Smtp-Source: AMsMyM4TkBtBzw97AttzykCWImSm8pLeapwXLsEUfoctb8c365GhyTENUYp7BGzF7yEEe04UhM5r8FrNGPbwWBbbzNM=
X-Received: by 2002:a05:6808:14d2:b0:354:c733:abd3 with SMTP id
 f18-20020a05680814d200b00354c733abd3mr5721852oiw.96.1666894448715; Thu, 27
 Oct 2022 11:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <20221026070110.35364-1-jiapeng.chong@linux.alibaba.com>
 <20221026070110.35364-2-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20221026070110.35364-2-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 Oct 2022 14:13:57 -0400
Message-ID: <CADnq5_M4jCG4fuikkegn+PBMedW=xX=qLq86uFhwKNw7k_EsAw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amd/display: Modify mismatched function name
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

Applied the series.  Thanks!

Alex

On Wed, Oct 26, 2022 at 3:02 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> No functional modification involved.
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:615: warning: expecting prototype for setup_subvp_dmub_command(). Prototype was for populate_subvp_cmd_pipe_info() instead.
>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2587
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> index 774e06936661..67eef5beab95 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> +++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> @@ -595,7 +595,7 @@ static void update_subvp_prefetch_end_to_mall_start(struct dc *dc,
>  }
>
>  /**
> - * setup_subvp_dmub_command - Helper to populate the SubVP pipe info for the DMUB subvp command
> + * populate_subvp_cmd_pipe_info - Helper to populate the SubVP pipe info for the DMUB subvp command
>   *
>   * @dc: [in] current dc state
>   * @context: [in] new dc state
> --
> 2.20.1.7.g153144c
>

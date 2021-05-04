Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AEF373094
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 21:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E316B6EB63;
	Tue,  4 May 2021 19:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76D96EB63;
 Tue,  4 May 2021 19:16:17 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id i11so9819111oig.8;
 Tue, 04 May 2021 12:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BRdBRW+o9Ai+DQFYSW89RtTHfHNn9agjE1x322TlyYU=;
 b=YFh8/z0qssn1bDst6eQniGRWqA1rbFmsUe/5XvGdnPgWEEx0miL0Ow1LmuL8mzhBWy
 D6j1b0mybesUhYhK+V/0BOsRQz0Nja4e+ScRLBvNf/TsHzKbH9gqkvkcqvMcri5oRDUI
 VarX+fs785iqHINhFykZAwK/atw908NM5Ko5uwdWqNht1gyFbDe6z2pBbrl+Ms/uVHO5
 ikBO2hO/FLDzc53OKIupBI3q1NvK7ar4zsNAaESgDWgJWCWxwmugTVz6H3PIPClGSLVY
 WKAqDPVV+8cObeoLx94t3Bin01e7vfGERcwEc8Dzb7KkoluGkaVk9jvx6cVuJ1lC0rna
 9d5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BRdBRW+o9Ai+DQFYSW89RtTHfHNn9agjE1x322TlyYU=;
 b=STKO7jUPVmunVQ/T44J5VA+XnKwLv7yRVs4047KtcIpAir1CH4ON071pN2Q4dOXggU
 Vw3VEskfO931MEj3/kM1p3PEWEKetYFxZyL6TB/0GBSvRu4aI9X+E/EFVn8wDPKtnbqL
 k/40fYVVv8SsgLSYtqVmXQOEc2nrX1oiLmYOLkVxGm4JSG21wVjIF+3oCIbxEIGhhhvD
 ljWYyLit9OYeOM9kRbZO6JVs9l/56LvT4ateX36uYy69D9V4lzTOwhVlwLkYu/Et5wiD
 zfzZ2KNodTqUehwyqtD/0Gl0SfF64otfeF6lFSOrBIbi5bGyuvlI+VJ5WL2z/exS4JtL
 INtA==
X-Gm-Message-State: AOAM532uMSQf6ngyUfoPEoEuwrHCiiZgGMTmSf8Myqp6XNTAbLaPIsdS
 tCPIcu6LtF4r7v6ixLu8lK3C6YUNnCwgv6H2fY0=
X-Google-Smtp-Source: ABdhPJya2bVj9h7KBqRQ3GTlSw15Uqe2pIFXZ6Bx+WDG+eu/A9eQ8xpig33j58f5r+Ek7yQJYrWPW2qQXLC9cX9BkUE=
X-Received: by 2002:aca:c08a:: with SMTP id q132mr3946514oif.5.1620155777060; 
 Tue, 04 May 2021 12:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210430171654.3326745-1-trix@redhat.com>
In-Reply-To: <20210430171654.3326745-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 4 May 2021 15:16:06 -0400
Message-ID: <CADnq5_NN0DRKcZvpsOPjeHn3Nrppc=bNAAAXs_ws8xCmaQfQpw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: initialize variable
To: Tom Rix <trix@redhat.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Kevin Wang <kevin1.wang@amd.com>,
 Huang Rui <ray.huang@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Nirmoy Das <nirmoy.das@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Powell, Darren" <darren.powell@amd.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "Quan, Evan" <evan.quan@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 30, 2021 at 2:05 PM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> Static analysis reports this problem
>
> amdgpu_pm.c:478:16: warning: The right operand of '<' is a garbage value
>   for (i = 0; i < data.nums; i++) {
>                 ^ ~~~~~~~~~
>
> In some cases data is not set.  Initialize to 0 and flag not setting
> data as an error with the existing check.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied.  Thanks!

Alex


> ---
>  drivers/gpu/drm/amd/pm/amdgpu_pm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> index 4e459ef632ef..9a54066ec0af 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> @@ -451,7 +451,7 @@ static ssize_t amdgpu_get_pp_cur_state(struct device *dev,
>         struct drm_device *ddev = dev_get_drvdata(dev);
>         struct amdgpu_device *adev = drm_to_adev(ddev);
>         const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
> -       struct pp_states_info data;
> +       struct pp_states_info data = {0};
>         enum amd_pm_state_type pm = 0;
>         int i = 0, ret = 0;
>
> --
> 2.26.3
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF5526EB49
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 04:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974316E105;
	Fri, 18 Sep 2020 02:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7AB56E105
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 02:05:58 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id i26so5900022ejb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 19:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ImzYFdv7FV86GEX3X/1tw1hfTU6H6hUSLVTXY/iYER8=;
 b=Y58xKi1obOp2IninGGVaFXvJGsFdsmII8kZ+jjhOcGrqyYoWPKMSQuXr1fQOhMXDH7
 ke7OElRKM0lP/hUCKkFBTvxbnmcrdq8oW+XdwHOxwkf7zLpn3V350ZdQZ3wiTro5H1w9
 NufqIxN544+s5HOUZ91dQ1QSuFHGmjewxAfFYNqCStBz05lQIOYb59kYUSJqfbYpvw32
 BZ4k3oEBJRlfZ6KTuCgywM3T13KJPRsnM6XZoEtjsTLa6FHTEiarx8PMfGG4PViqHJam
 3BiziNkfZFVdTo7dd7iTEAAe62jUVzgPBjXCC7cBiMbPzBYm7tv7De5ycK9NdPELUd6g
 iHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ImzYFdv7FV86GEX3X/1tw1hfTU6H6hUSLVTXY/iYER8=;
 b=Aa5A8LgvulPtP8f6traw+pFfdNeALXcUA6mtJq4vwdV6jR0WAmFjpu//dZ6svlCHvy
 mWM6k6a4zeKnHujFDGLKDB7yPVLzKCXmybjA4UIZL2jx0QptVPBvnCq9e4/TJo+qS6oQ
 h+TG2YYjMbR2pw1PDPjzurnoJGTK9iEsWECh6M6A6dGlwFPPvP3WX5pHOQgr2bIo4sEo
 n0uMr6M03zSGjgr1DMz8khZCSuh/shhf0daZyR4xpl9EGy7eabgw3YsDKBLL+2xAD2Cv
 FCqT7e9P1IfMAqTKTO5zM/cERhJIUYPvT2welM/PwO+pItwiUZsoV28PI0wYmRyhJInD
 WVyQ==
X-Gm-Message-State: AOAM533w0Mls6BEIr6pXwzPYoYcmZmTwf6zyFCcfNRDkLUNOFpGoDvsW
 55uWqOryYUTGnnLWWTYzal9opAiM0VDbhBgAFBMB2Q==
X-Google-Smtp-Source: ABdhPJxlg7ODADz80YFnr6Q7tPZD8jDi9k5Ly/WiLL8uJJ7BSWXenxN/XEM895zONY25h5SaYAzMlKPht9rTnAX/rTA=
X-Received: by 2002:a17:906:37c6:: with SMTP id
 o6mr22553734ejc.404.1600394757373; 
 Thu, 17 Sep 2020 19:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200918020110.2063155-1-sashal@kernel.org>
In-Reply-To: <20200918020110.2063155-1-sashal@kernel.org>
From: Eric Anholt <eric@anholt.net>
Date: Thu, 17 Sep 2020 19:05:46 -0700
Message-ID: <CADaigPWfTDJ_G6z3ZKm-bqBO8LPthEBkJoqXk=znGqvDhkw3bw@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.4 001/330] drm/v3d: don't leak bin job if
 v3d_job_init fails.
To: Sasha Levin <sashal@kernel.org>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Iago Toral Quiroga <itoral@igalia.com>, LKML <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 17, 2020 at 7:01 PM Sasha Levin <sashal@kernel.org> wrote:
>
> From: Iago Toral Quiroga <itoral@igalia.com>
>
> [ Upstream commit 0d352a3a8a1f26168d09f7073e61bb4b328e3bb9 ]
>
> If the initialization of the job fails we need to kfree() it
> before returning.
>
> Signed-off-by: Iago Toral Quiroga <itoral@igalia.com>
> Signed-off-by: Eric Anholt <eric@anholt.net>
> Link: https://patchwork.freedesktop.org/patch/msgid/20190916071125.5255-1-itoral@igalia.com
> Fixes: a783a09ee76d ("drm/v3d: Refactor job management.")
> Reviewed-by: Eric Anholt <eric@anholt.net>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

You're double freeing with this patch, the bug is already solved.

> ---
>  drivers/gpu/drm/v3d/v3d_gem.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 19c092d75266b..6316bf3646af5 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -565,6 +565,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
>                 ret = v3d_job_init(v3d, file_priv, &bin->base,
>                                    v3d_job_free, args->in_sync_bcl);
>                 if (ret) {
> +                       kfree(bin);
>                         v3d_job_put(&render->base);
>                         kfree(bin);
>                         return ret;
> --
> 2.25.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

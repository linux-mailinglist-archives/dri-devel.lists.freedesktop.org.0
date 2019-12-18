Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DA6125764
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 00:07:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581F66EA9F;
	Wed, 18 Dec 2019 23:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C316EA9E;
 Wed, 18 Dec 2019 23:07:39 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id m30so2914112lfp.8;
 Wed, 18 Dec 2019 15:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kFNBCz9Mj7HvlX/JvqxPooc+oL5hLvbOZR4LUsz4wPM=;
 b=NkngWumEWVv47jxw17iMWW553FzYgE2+ezf3EkKSb09UI3Rs/7UdpCxq4YEe2nI+7j
 9BoxPeMlcZtc5oOOB872eV2r1nkWNAscqDjBSt1JYlx3pf+d9SM7Z4AMkhcVCCjvpO+l
 cL9rnZfqdOE/m/74P1rHPseXnwJXX/B+zoS47G36DR6mqYQVV7LCZ3k5OSgG/wQXjZ+T
 10EOrMrN9hAv6bZBmfE8ll4PMgBWZfravObRDjHX0akvGOFAsV20si6itIwl5eSay4l4
 fJIiTix2MXjr6ivp18++q9b6TQnXjCGebq0CQ8J/o7KBXJQ4mnvnwyfTo+PXuCmGI/PR
 DByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kFNBCz9Mj7HvlX/JvqxPooc+oL5hLvbOZR4LUsz4wPM=;
 b=bQVvf+lUjIvEmUvEmc69b3wfzn0tLwYgd0vMBN5rE+yiSTjFcHnjasIZBCwMfIBPgm
 I3/dmt8Mq56hpsepeYugoe1oAC5nMpblBYgk8hspQxc/H2REbF6J5smKoQIQdhhd4+vv
 K7dES6xoRxOyXdsCUPTZ5zcFosOeVopYkf4xJucgp1SYlr1Rg3hAcjDdGHee6ePnZrrn
 xVGGVWQMB9CjgJZ4vurRGRr09v4iKJZo7zc+O94v1L9srOD28PRzqZBAfKvDzC2ncFFf
 U5t5d2Mj3rl3iR80ohMaCTxoTxkCPoC0LDm/16I7glvq5loViB0EjXnQYCS5C1kuBlgU
 VSUQ==
X-Gm-Message-State: APjAAAXPB8irLD1RIOQkmgsYRSJJtChpl6kpmYi02AmBkqy2QhujWbu0
 m7SZWFbLDjYb7hnxRAr+RePeHOGsW7gmIHUgHSmm7kxM
X-Google-Smtp-Source: APXvYqx6gEcVwW37/uBoa7eOOKgsJdqCG/ZIfgWNL7Sr5Pmk27XQZSHtRHo3XBHqUUqNgUp4yZXIU0ff+3n29W1OUU8=
X-Received: by 2002:ac2:465e:: with SMTP id s30mr3439928lfo.134.1576710457310; 
 Wed, 18 Dec 2019 15:07:37 -0800 (PST)
MIME-Version: 1.0
References: <20191217204707.2258744-1-alexander.deucher@amd.com>
 <20191217204707.2258744-2-alexander.deucher@amd.com>
In-Reply-To: <20191217204707.2258744-2-alexander.deucher@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 19 Dec 2019 09:07:25 +1000
Message-ID: <CAPM=9twOo9TRcBkT+iR7LUJh4zkQirHB2J0A5vL7Ei0LYkQ-2Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu/display: use msleep rather than udelay for
 HDCP
To: Alex Deucher <alexdeucher@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

I've pulled in these two patches to drm-next directly because my arm
test build was broken.

Dave.

On Wed, 18 Dec 2019 at 06:47, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> ARM has a 2000us limit for udelay.  Switch to msleep.  This code
> executes in a worker thread so shouldn't be an atomic context.
>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/display/modules/hdcp/hdcp2_execution.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp2_execution.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp2_execution.c
> index bcbc0b8a9aa0..f730b94ac3c0 100644
> --- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp2_execution.c
> +++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp2_execution.c
> @@ -153,7 +153,7 @@ static enum mod_hdcp_status poll_l_prime_available(struct mod_hdcp *hdcp)
>  {
>         enum mod_hdcp_status status;
>         uint8_t size;
> -       uint16_t max_wait = 20000; // units of us
> +       uint16_t max_wait = 20; // units of ms
>         uint16_t num_polls = 5;
>         uint16_t wait_time = max_wait / num_polls;
>
> @@ -161,7 +161,7 @@ static enum mod_hdcp_status poll_l_prime_available(struct mod_hdcp *hdcp)
>                 status = MOD_HDCP_STATUS_INVALID_OPERATION;
>         else
>                 for (; num_polls; num_polls--) {
> -                       udelay(wait_time);
> +                       msleep(wait_time);
>
>                         status = mod_hdcp_read_rxstatus(hdcp);
>                         if (status != MOD_HDCP_STATUS_SUCCESS)
> @@ -474,7 +474,7 @@ static enum mod_hdcp_status locality_check(struct mod_hdcp *hdcp,
>                          hdcp, "lc_init_write"))
>                 goto out;
>         if (is_dp_hdcp(hdcp))
> -               udelay(16000);
> +               msleep(16);
>         else
>                 if (!mod_hdcp_execute_and_set(poll_l_prime_available,
>                                 &input->l_prime_available_poll, &status,
> --
> 2.23.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

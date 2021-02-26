Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A9A326983
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 22:29:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263966EE37;
	Fri, 26 Feb 2021 21:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1538D6EE37;
 Fri, 26 Feb 2021 21:29:40 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id l133so11217640oib.4;
 Fri, 26 Feb 2021 13:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T+XuI1x+8YDlt07TAQPA3xx8+2WYMMEBzo0uXxTMkC4=;
 b=mJlk0wqt+hovCyn5pQJ5lMizNw18al5kCVeYtx1FPDccDVE7hpeji7OHh9al4m/HAf
 Pxsnznei5j6RO9dyA23/LwklDtMFEo/dljBb7oKyGLlW8u7+g+XtIq8ySo6pXhdKwvbh
 jSxviSw42gDvyi3+A9tuXV/lIYwfPVLlZ4bgLvyVkdoM5grOxKP5GYFdXXpQmGVfoh2S
 fwwZT+mwfymQN2ZtjF9u5noz+qnIAc4DJvV5HB9l+TpV05wY2m6w9Zm4ChBqELnsTDT0
 vkiPG+VuQpEDn6MPfwAzRwJ3uBMTC6msW7Qb8BFZLBBtTTsxj2k+pdnZQ/X2orhJio02
 IsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T+XuI1x+8YDlt07TAQPA3xx8+2WYMMEBzo0uXxTMkC4=;
 b=e5vtOhhrhgOoAzUXZVVeLWCCVMgPgsoEgW/OID1VBOX31nSKWGXy0PAS/Dviu2Bkil
 OtFvl23/fMN4YgbOtW3MHwtGnIV/AXH+F+9NZcjIza55HOycLE+7T+EW8yY4xA0W1shR
 hU6MOPV58/HYO5ZP+0ukZG8jCvCdHQzP32D/hDTdkki0iIyGUSBzEga9dqBH6IAhFrJ/
 XcLtU2zcgCmqDeIr6L5QckqPDUqfHI717Oc7a0E+lof6CN93yBdPFx5EvMx6dXEbDZkG
 Cfgpes/lb0+pwx0Q2SKA5wflmUucC83Nt4q4FBAbGF9w2n75xIwafdc9psRlUADqtbmB
 wd5w==
X-Gm-Message-State: AOAM531wMYdoyRfco8GGG/M1vVegj33qY9QN55STogEqxL9MSYyJhRTL
 5v2cJVCnxRsF2JDI820ptNdy4u2gysHUCodBWHA=
X-Google-Smtp-Source: ABdhPJzM/GD97FBNksX+qUYYCV5b+mBloW+GDX6JAIooMsjETRDa6/4gNIukKjRYSZ1ufHxF9fzRZbq2+cKYNgPZDsQ=
X-Received: by 2002:aca:fccb:: with SMTP id a194mr3362138oii.5.1614374979385; 
 Fri, 26 Feb 2021 13:29:39 -0800 (PST)
MIME-Version: 1.0
References: <1614332527-5014-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1614332527-5014-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 26 Feb 2021 16:29:28 -0500
Message-ID: <CADnq5_M2vL2RE5eJ727FFskdONAmW4RL-0LrXRTiJiACHY8SYQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display/dc/dce/dmub_psr: Remove unnecessary
 conversion to bool
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 26, 2021 at 4:42 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warnings:
>
> ./drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c:273:16-21: WARNING:
> conversion to bool not needed here.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> index 69e34be..c13f967 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
> @@ -269,8 +269,7 @@ static bool dmub_psr_copy_settings(struct dmub_psr *dmub,
>         copy_settings_data->frame_cap_ind                       = psr_context->psrFrameCaptureIndicationReq;
>         copy_settings_data->init_sdp_deadline                   = psr_context->sdpTransmitLineNumDeadline;
>         copy_settings_data->debug.u32All = 0;
> -       copy_settings_data->debug.bitfields.visual_confirm      = dc->dc->debug.visual_confirm == VISUAL_CONFIRM_PSR ?
> -                                                                       true : false;
> +       copy_settings_data->debug.bitfields.visual_confirm      = dc->dc->debug.visual_confirm == VISUAL_CONFIRM_PSR;
>         copy_settings_data->debug.bitfields.use_hw_lock_mgr             = 1;
>
>         dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
> --
> 1.8.3.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

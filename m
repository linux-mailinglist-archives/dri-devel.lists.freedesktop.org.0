Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455CE5B40FF
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 22:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE75F10EE56;
	Fri,  9 Sep 2022 20:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B9210EE55;
 Fri,  9 Sep 2022 20:46:19 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1278a61bd57so6978547fac.7; 
 Fri, 09 Sep 2022 13:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=fIWWFRWToSyjND5u32f5EwlAkJEA8KQOjYH9kYp+XHw=;
 b=ii/jSDrdVYygo+6BfJIU+E/q04lrQEhFJv/UxSLRbbQ76BmfzhBfe938IDSrQS6Y+e
 6LJlYHvRDS7tLmEIJdHcl3B2P5L+Asems9NCYW2weKImyBqW+je0Oii+bwvX69oNQLDd
 nTguM0fs6zP5RqTIFTaiCz8UqDpOBk+jWjJmIKA4ux5Nd6ycTm/fpAmfXdeDfWf+/Qm3
 hh443dUp58IIfeWJz7ddTeVXvJiYkCn1UJfXbCf4xJdCaEyEigZFMntYh9OBJtVbsnno
 Dople/SpP1j2Ol+i0CqEJ9qw/i0I0/NINIuuXAUW9WQvbOGtcTCwK3WJ0BWbF0J+Xq+y
 u69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=fIWWFRWToSyjND5u32f5EwlAkJEA8KQOjYH9kYp+XHw=;
 b=0qrJI9sbglnOFl0u1JGdjFiXFnROfB3ihr+bpfV+nmveEpnz1hRq2EFD6A6V1M2YNx
 P6FI3HZes7Bx2+lvxG+w8N+h4P2Ybsi6YGqPQbOKs1BsGodMplkiGV2WYNq1J+eAFzoU
 eN2VBIil08SoCNY/ca6maz5sbYiVdLgpZ402iSI954+qX8Y8xYOkdpf+DggYY/PfsoJl
 H7q63Iqp3xSoVOTj3RXpS22sQNBblNwbdLNhiMwQrKL57l5tKtWjjni9QFKOkuUfhpu8
 /x7EQ0047OEbt+jKK4LVcxFQO0tU0bikh+9mP1HUgB8t5v63CC4xuSFZEiOq2+R82SIB
 PxrQ==
X-Gm-Message-State: ACgBeo0iLzIFi9RNmQOWcMRJjmVLNhR590JmTXQj5pEw/HL8igjYFQSI
 mKgDw930BCY+sETNpSog3o30aGNTSeZQjL2F0xQ=
X-Google-Smtp-Source: AA6agR5xiiLiZPpsFq6YQrxT7/tHRboxJGNQw12HUSDCAvkjWrEy6Cg42aJ/OF36IUtsRmY4md2+xpswpxG5l7N94ZQ=
X-Received: by 2002:a05:6808:138e:b0:345:13d1:fd66 with SMTP id
 c14-20020a056808138e00b0034513d1fd66mr4521225oiw.96.1662756379115; Fri, 09
 Sep 2022 13:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220902073320.319673-1-ye.xingchen@zte.com.cn>
In-Reply-To: <20220902073320.319673-1-ye.xingchen@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 9 Sep 2022 16:46:07 -0400
Message-ID: <CADnq5_PSreYBqUg2HDVTBmZ1L-0z40EkfO45Yoru7JAz+d4-Ww@mail.gmail.com>
Subject: Re: [PATCH linux-next] drm/radeon: Remove the unneeded result variable
To: cgel.zte@gmail.com
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
Cc: airlied@linux.ie, ye xingchen <ye.xingchen@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Sep 2, 2022 at 3:33 AM <cgel.zte@gmail.com> wrote:
>
> From: ye xingchen <ye.xingchen@zte.com.cn>
>
> Return the value radeon_drm_ioctl() directly instead of storing it in
> another redundant variable.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>  drivers/gpu/drm/radeon/radeon_drv.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
> index a28d5ceab628..6cbe1ab81aba 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -512,14 +512,11 @@ long radeon_drm_ioctl(struct file *filp,
>  static long radeon_kms_compat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  {
>         unsigned int nr = DRM_IOCTL_NR(cmd);
> -       int ret;
>
>         if (nr < DRM_COMMAND_BASE)
>                 return drm_compat_ioctl(filp, cmd, arg);
>
> -       ret = radeon_drm_ioctl(filp, cmd, arg);
> -
> -       return ret;
> +       return radeon_drm_ioctl(filp, cmd, arg);
>  }
>  #endif
>
> --
> 2.25.1

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 495FD3462F3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:34:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28436E850;
	Tue, 23 Mar 2021 15:33:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB50F6E850;
 Tue, 23 Mar 2021 15:33:58 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 s11-20020a056830124bb029021bb3524ebeso3086378otp.0; 
 Tue, 23 Mar 2021 08:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BU22F3GylJCKeCQWy9MpZdNcfqLAl6Ije4lLEtEa8GY=;
 b=FBzNhcrN7thCIaDBITnPorfkjdlRIsHFHiUvYcccyToaj4vMKgH80eNBrdw/Gnw3tB
 uErAaGg4NWxUEbPUWotD7t8VcUg2Zf71LavYayx6de7yRsxby7ufzIauY1L4URerzG/W
 VDEJX0K/fIyHR9ieW8q9zQZ5q/rJgB+i3tHbwHNAyJFrWV5I1XM8hngCNi5ltGeUu8nQ
 VHsKIBJQor4+2XLwUCrJjKejy78IuAt9lL0pP/P4NBQq/2/hsmo48+sDFlRFWywlHZuk
 reuzf40q/emMKXjMjpt1RpDlBl7CngRU+UDa0YZc1Mh2uERPFssPgsvKilX+DcAb9hwP
 tRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BU22F3GylJCKeCQWy9MpZdNcfqLAl6Ije4lLEtEa8GY=;
 b=m35wlYSjv799Rknkq7pmEiiOUE4q8nt9Z595KlWlRcIcZBRHXDoEZA01fxTSiKqfcm
 mFFNbJ7FJ4Gond+q4VytFWuKF6hq6urn2Zy6KPM6LrntBScT2hGUVVchI/s6zygxLoV7
 s54u637ZrX1Kx4KXNu8OzQT8G6XvXAl4CXvSA17fGa3BQWLZxSEzv4yA+O1kZjBjuYSi
 sOp4Mw3COCrzRf2wPMHYJT0nw6FTl1b3H8pFTU/TORkXCAgv4yMq0+1/nqJFoiqXVKv/
 pwjmHSQeYpcTYg/tJFhsOzQi9MXvH72gCsKAwzvFKOCmjqKPOEDw8D9fWfeFmlM2CtFy
 iCAQ==
X-Gm-Message-State: AOAM531EKWZ3k9KLEfgf/jURGaDgp67fnwFULhxkIDBMLriqgl0eHS4r
 vWmhkorBQTaPLajSlzLERRB+ca16LYwFBnPVMuI=
X-Google-Smtp-Source: ABdhPJxFXYs/7acwhn00qep8mlUpC9T+CKHJrdfAbBpBhuQNReaMkZBPCVNWLBPFYIy648/pkeGe+lCHThIvm+KGocQ=
X-Received: by 2002:a05:6830:408f:: with SMTP id
 x15mr5048220ott.132.1616513638090; 
 Tue, 23 Mar 2021 08:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210323130430.2250052-1-arnd@kernel.org>
In-Reply-To: <20210323130430.2250052-1-arnd@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Mar 2021 11:33:47 -0400
Message-ID: <CADnq5_MYZF2VWe=fYOqj-M5QA2myYTy-Lwu6uchuXZEz+oZbQw@mail.gmail.com>
Subject: Re: [PATCH] amdgpu: fix gcc -Wrestrict warning
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: Jinzhou Su <Jinzhou.Su@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Mar 23, 2021 at 9:04 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> gcc warns about an sprintf() that uses the same buffer as source
> and destination, which is undefined behavior in C99:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c: In function 'amdgpu_securedisplay_debugfs_write':
> drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c:141:6: error: 'sprintf' argument 3 overlaps destination object 'i2c_output' [-Werror=restrict]
>   141 |      sprintf(i2c_output, "%s 0x%X", i2c_output,
>       |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   142 |       securedisplay_cmd->securedisplay_out_message.send_roi_crc.i2c_buf[i]);
>       |       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c:97:7: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
>    97 |  char i2c_output[256];
>       |       ^~~~~~~~~~
>
> Rewrite it to remember the current offset into the buffer instead.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
> index 834440ab9ff7..69d7f6bff5d4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
> @@ -136,9 +136,10 @@ static ssize_t amdgpu_securedisplay_debugfs_write(struct file *f, const char __u
>                 ret = psp_securedisplay_invoke(psp, TA_SECUREDISPLAY_COMMAND__SEND_ROI_CRC);
>                 if (!ret) {
>                         if (securedisplay_cmd->status == TA_SECUREDISPLAY_STATUS__SUCCESS) {
> +                               int pos = 0;
>                                 memset(i2c_output,  0, sizeof(i2c_output));
>                                 for (i = 0; i < TA_SECUREDISPLAY_I2C_BUFFER_SIZE; i++)
> -                                       sprintf(i2c_output, "%s 0x%X", i2c_output,
> +                                       pos += sprintf(i2c_output + pos, " 0x%X",
>                                                 securedisplay_cmd->securedisplay_out_message.send_roi_crc.i2c_buf[i]);
>                                 dev_info(adev->dev, "SECUREDISPLAY: I2C buffer out put is :%s\n", i2c_output);
>                         } else {
> --
> 2.29.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB6F349782
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 18:01:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD0A6EDCA;
	Thu, 25 Mar 2021 17:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6756EDC1;
 Thu, 25 Mar 2021 17:01:40 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 g8-20020a9d6c480000b02901b65ca2432cso2616390otq.3; 
 Thu, 25 Mar 2021 10:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wJ8zHlM8qfvcT77mCcQxpLWUbrfiiGwRTV3uVZ1+Q5c=;
 b=Z7ULpDZtsbxI2ysuOWL2BF/qgIuGGJ+WWpS77Yfmszj+y7UWsA5mzt6wkwVjuRyiwx
 lPNGLipNXE1/IdWMLjPAZ22YRwdK2vI6qIS8gkg7O1WP+JOTAtAjv0qhHIaCRuXVndnq
 a9mTfNi9zCMTDD19JiFhe98YcHPqN/DdaVI/ViUr5dbtar8mI4ZCkxMiTMIPTY38lcDV
 9evC0uMLO8R4K1Yil7GtxCtS1gP5+rnSd1Diwl6ouDgIaESOCN6Z08Py3z4sDIpEJNaH
 WaSHIzn8Upm5EhBBO8HLTQl4necgCbD/oHbrkXivtUWzQsMEdWM1BcgT3sAl1RlvtZHc
 H4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wJ8zHlM8qfvcT77mCcQxpLWUbrfiiGwRTV3uVZ1+Q5c=;
 b=ZTqdSW2JcLxiZEsYp0xjBpCsaw03BaWzzNL4QuhMltZHMRFV9jvjf9e8Rrb6ploWVD
 PPTaP3nThYA0CC3glt98DVmXhNalK2IkeyeYr75gR7pdG/1Pd3x/88UzzBeEO6BuALQv
 DKXkm44mNNd0i9VW6zvYlhOhQtkAaTv3vA2Y/08qKjeUmbH3rVhs3u6uPijadUL84bN7
 MXYUF8ApaNAP82i0jJVjoxxMaMZv6ZVMSp+4dTdWXK9yXFFNICQaYayiLHRDV2mFI38N
 Rv1tllCGgOr2ei3Vcpqg1h4lcyG5SibTEYjXF+MreJZObQzuXLdtPvGDyCjSUQsZB2pb
 4SlQ==
X-Gm-Message-State: AOAM530yEBto6DQ09MhjTHqxKEYb2r/V0X3Og5v7vfnOxLdTIFIIQzhv
 qIw7b/MXcFd0g7RGLkdu8OlR+8jYXLyTXNVEnos=
X-Google-Smtp-Source: ABdhPJzaNvM9VQW41z7AkU7Mo0seISiGbYGwZorNkvm1iNHJHID2QGt+wE7Y+5+rr4rmF7L6MmZS8L8aWH9xC8klIEU=
X-Received: by 2002:a05:6830:408f:: with SMTP id
 x15mr8697018ott.132.1616691699957; 
 Thu, 25 Mar 2021 10:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210324133705.2664873-1-arnd@kernel.org>
In-Reply-To: <20210324133705.2664873-1-arnd@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 25 Mar 2021 13:01:29 -0400
Message-ID: <CADnq5_Mtr4EaR_pXETdWiwNtutXweDMeB_2V=2mgqimt=OJt+w@mail.gmail.com>
Subject: Re: [PATCH] amdgpu: securedisplay: simplify i2c hexdump output
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
 David Airlie <airlied@linux.ie>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 LKML <linux-kernel@vger.kernel.org>,
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

On Wed, Mar 24, 2021 at 9:37 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> A previous fix I did left a rather complicated loop in
> amdgpu_securedisplay_debugfs_write() for what could be expressed in a
> simple sprintf, as Rasmus pointed out.
>
> This drops the leading 0x for each byte, but is otherwise
> much nicer.
>
> Suggested-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
> index 69d7f6bff5d4..fc3ddd7aa6f0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
> @@ -92,9 +92,7 @@ static ssize_t amdgpu_securedisplay_debugfs_write(struct file *f, const char __u
>         struct drm_device *dev = adev_to_drm(adev);
>         uint32_t phy_id;
>         uint32_t op;
> -       int i;
>         char str[64];
> -       char i2c_output[256];
>         int ret;
>
>         if (*pos || size > sizeof(str) - 1)
> @@ -136,12 +134,9 @@ static ssize_t amdgpu_securedisplay_debugfs_write(struct file *f, const char __u
>                 ret = psp_securedisplay_invoke(psp, TA_SECUREDISPLAY_COMMAND__SEND_ROI_CRC);
>                 if (!ret) {
>                         if (securedisplay_cmd->status == TA_SECUREDISPLAY_STATUS__SUCCESS) {
> -                               int pos = 0;
> -                               memset(i2c_output,  0, sizeof(i2c_output));
> -                               for (i = 0; i < TA_SECUREDISPLAY_I2C_BUFFER_SIZE; i++)
> -                                       pos += sprintf(i2c_output + pos, " 0x%X",
> -                                               securedisplay_cmd->securedisplay_out_message.send_roi_crc.i2c_buf[i]);
> -                               dev_info(adev->dev, "SECUREDISPLAY: I2C buffer out put is :%s\n", i2c_output);
> +                               dev_info(adev->dev, "SECUREDISPLAY: I2C buffer out put is: %*ph\n",
> +                                        TA_SECUREDISPLAY_I2C_BUFFER_SIZE,
> +                                        securedisplay_cmd->securedisplay_out_message.send_roi_crc.i2c_buf);
>                         } else {
>                                 psp_securedisplay_parse_resp_status(psp, securedisplay_cmd->status);
>                         }
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

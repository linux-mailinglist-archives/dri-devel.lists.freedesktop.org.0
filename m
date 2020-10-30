Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9F029FCA6
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 05:15:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F2F6E94F;
	Fri, 30 Oct 2020 04:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53C16E94F;
 Fri, 30 Oct 2020 04:15:51 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id k21so2519338wmi.1;
 Thu, 29 Oct 2020 21:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BqWBGxp83tXBly8ZHVM6eJ0MtxhFupmftKu7NV/OBXU=;
 b=IC4UPPAraPaFBL01yPA31xu/1JnYIZLD2Zb8bHtgPnFS1fkrboUlvaF7A1g1CETk1U
 aA4c51rNES2T7YczUU3hL21wRB7DXzJz3MEPy7XrTmw0Jt3V3Mse/Kj8DKOtyMmIl9GJ
 i/OYoRR8ZYklJTFxTYilS3tSY0Orf5nONcbZ0s+hotGD+cw1VQCL7V9eZgh7pdO0zi2D
 nqjeYX2EpcgR9v2E0gijfUByEDDqRo0f8Q1XrQX+23XrR4l0CBoxwt5wzNVctkRBpCYR
 Hx33UJdV7HQR+MCZ0yWv4GQxGsehskZS981FlGT986u1b0Kxmo9wFVOuns36BJuyohH/
 u3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BqWBGxp83tXBly8ZHVM6eJ0MtxhFupmftKu7NV/OBXU=;
 b=TObqAiCzo+4In3PIxIA1PSQML6/IMZUQMJaJaRx2dUNe8GgfjDrqOl8P0JON98NKgp
 Jo8ch/tkX3wqQ7SIzKvJIa3zXBvrMonjSdJzvczam48A2PbQcKilkCG0FZYFApfBEQjL
 SBMwe5DlmVhGVvzGIEoIf99C3bkZ1/9yyQDDBhOEwDSwMq0SKX+4f9A2z8nCAOmImW/I
 D5F0dH0qRhysAgGLv59SOZpaeVY3HlQdYRMpc58YtnEpHHeu5+wck257xLDzv6lwhFgT
 izeM/+XBGpXrTuDOUdu/2Kon14EArQxkQazWmxz77QFHa3lZy27oJTKevYf+N2W7qYCL
 OH4Q==
X-Gm-Message-State: AOAM533YCnRAtUym5urGUfdyowgc7zi8T4DcgBcCxUViJqyzlFYGAvlW
 kUxMCFK/jsbCgw6eMaqoyhah8o9d8E7m5LOK4Vo=
X-Google-Smtp-Source: ABdhPJxEbj4ViG6nx+9BHcArb72+dptqPezIyx9BdE/F9YYCz5xQc1TZuRt+lxUttX6q3ieThBBuPMwGgeNM4Sc8HwY=
X-Received: by 2002:a05:600c:25a:: with SMTP id 26mr327725wmj.39.1604031350500; 
 Thu, 29 Oct 2020 21:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20201029094346.14185-1-unixbhaskar@gmail.com>
In-Reply-To: <20201029094346.14185-1-unixbhaskar@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 30 Oct 2020 00:15:39 -0400
Message-ID: <CADnq5_Ooq5zdskLceuBgkFoYux3mTkhTsv=bLWLadoMH6Mz22g@mail.gmail.com>
Subject: Re: [PATCH] drivers: amdgpu: Correct spelling defalut to default in
 comment
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Oct 29, 2020 at 9:17 AM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
> Correct spelling in one of the comment.
>
> s/defalut/default/p
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  CCing Greg becasue it touched drivers file. Trivial though.
>
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index 8cd646eef096..cdc8dd220a77 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -556,7 +556,7 @@ static ssize_t dp_phy_test_pattern_debugfs_write(struct file *f, const char __us
>         bool disable_hpd = false;
>         bool valid_test_pattern = false;
>         uint8_t param_nums = 0;
> -       /* init with defalut 80bit custom pattern */
> +       /* init with default 80bit custom pattern */
>         uint8_t custom_pattern[10] = {
>                         0x1f, 0x7c, 0xf0, 0xc1, 0x07,
>                         0x1f, 0x7c, 0xf0, 0xc1, 0x07
> --
> 2.26.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6F311826D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:40:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442D989D2F;
	Tue, 10 Dec 2019 08:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37BC889A8C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 20:52:53 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id k3so7056565pgc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 12:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AvjOGQmItdmAy3vt51SLf/vsbTcB+aY7zT7fuJp4dP4=;
 b=BMWEse7d1vmm4hcRPwoeetEsOJYLiI4dgw9xLiplO0kcQPQGJTWcCySVk/dxpgEIjD
 aKuwxgkKhpRzsNinYeQ6WaeRPPQmSUj7TOmGQMOUgD+fgRMu6zW+lWsT1kEJAA8lbRZJ
 YRiyUsGtUoDgz4LdpMB563SEhOIhgoz0+7Kcc2aw6rUJp0mOgAPM5Q3WBm7i9sZsfiHW
 0sqil7OCE6YPGohvE/BdFR055EKas3ushjKPqXVqq8BjMOiavvdM0iDBkPajR8FSGpC4
 naLDsMfafXdYWwxdcVl6JR2dBsXK6xLG8XlXJaqxvUyWFtncztTKGy53J38WMbqh8i+a
 vQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AvjOGQmItdmAy3vt51SLf/vsbTcB+aY7zT7fuJp4dP4=;
 b=t6yZ/LGVIz4VFLcWRWl30mfJJ5yy6If3xCT1s82gGWm9nuuaWFYyB7EH8OtXiBZ531
 LQi7GY4HUyvchoQpMHUlYaPK4DFHLasT/8Cd8WEQv89V01i/FQNjlvfJigs0LrZYHQuT
 5MwCI6VXaomYtM1gdsHVyUZbauLqD9l6t6KSs4S/bsUNsWJk4pd8vpAWGtUontASnxzd
 tYzuC8rbmchm1Pdm+PItsyDMT3VYo8EVC6AQAdCDYBCVA3ZKROMNaR2dBkhEG2wueEMm
 1TB5nLQ1BZSSGTEKHlMfB6b7eOne9PCd/JbxnrQXgWSLZvNjvw0wfJV6rtxXtz8jtQ11
 e07g==
X-Gm-Message-State: APjAAAUfKmRV1d/Y3sYx83yUuA5lhxPeg83eBNxkMZlCIKCYQXNCprtx
 TQcXSJcUKpQHziXi0EW0w6QIrh/L5A8rCZBrbZIYJQ==
X-Google-Smtp-Source: APXvYqz8Ve5gTEe1GJWo8d+hmU7g5Xc1hhSGGDWsktmPt0CbWvIadFurW+S41A/AyyWjRjToxNxMLj9v6BgHAqXJmZU=
X-Received: by 2002:a65:590f:: with SMTP id f15mr20415804pgu.381.1575924772395; 
 Mon, 09 Dec 2019 12:52:52 -0800 (PST)
MIME-Version: 1.0
References: <20191209203230.1593-1-natechancellor@gmail.com>
In-Reply-To: <20191209203230.1593-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 Dec 2019 12:52:40 -0800
Message-ID: <CAKwvOdkeCCuYDWQFHitFczFX1-R1LjWoJ2gAfLuQAqvGz0ymPg@mail.gmail.com>
Subject: Re: [PATCH] drm: msm: mdp4: Adjust indentation in
 mdp4_dsi_encoder_enable
To: Nathan Chancellor <natechancellor@gmail.com>
X-Mailman-Approved-At: Tue, 10 Dec 2019 08:40:04 +0000
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 9, 2019 at 12:32 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Clang warns:
>
> ../drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c:124:3: warning:
> misleading indentation; statement is not part of the previous 'if'
> [-Wmisleading-indentation]
>          mdp4_crtc_set_config(encoder->crtc,
>          ^
> ../drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c:121:2: note:
> previous statement is here
>         if (mdp4_dsi_encoder->enabled)
>         ^
>
> This warning occurs because there is a space after the tab on this line.
> Remove it so that the indentation is consistent with the Linux kernel
> coding style and clang no longer warns.

Thanks for the cleanup. Nothing to see here, but should help us find
more interesting cases.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
(If there are other instances in drivers/gpu/drm/msm, they should be
rolled up into this commit)

>
> Fixes: 776638e73a19 ("drm/msm/dsi: Add a mdp4 encoder for DSI")
> Link: https://github.com/ClangBuiltLinux/linux/issues/792
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
> index 772f0753ed38..aaf2f26f8505 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c
> @@ -121,7 +121,7 @@ static void mdp4_dsi_encoder_enable(struct drm_encoder *encoder)
>         if (mdp4_dsi_encoder->enabled)
>                 return;
>
> -        mdp4_crtc_set_config(encoder->crtc,
> +       mdp4_crtc_set_config(encoder->crtc,
>                         MDP4_DMA_CONFIG_PACK_ALIGN_MSB |
>                         MDP4_DMA_CONFIG_DEFLKR_EN |
>                         MDP4_DMA_CONFIG_DITHER_EN |
> --
> 2.24.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20191209203230.1593-1-natechancellor%40gmail.com.



-- 
Thanks,
~Nick Desaulniers
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

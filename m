Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EE34565B6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 23:28:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57AAD6E419;
	Thu, 18 Nov 2021 22:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3466B6E84E;
 Thu, 18 Nov 2021 22:28:47 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 h12-20020a056830034c00b0055c8458126fso13658998ote.0; 
 Thu, 18 Nov 2021 14:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iTIRoBMB8dTH55Lw8avCBAoOzO2H2LeNFnFB35W++GY=;
 b=C5gpD143CDgtmN2qVZv2V1OwteZNHALmoAxcCNJZGv3NS1r78PBJtS/pK9WbcA5q9S
 Rjfqu04wyUqbuB6L7yx7PMuWCASDhigrbeu8kGy2Rh1RJklEmVODoc2p3HAXNrvS/GJn
 B/w0COX77qXhtcWSaLbG/eN1+F7Vc6y4su+BdmYKJLSB29IrfCdZSQwgo6e3WAcyAtmk
 AISWmuf3fG8kndvz9eVangzRWtrA9N/acw/wnPOhezSImDc/gQCnM5cEgXTmBthrz5io
 u4FtoUqbH0p/kLBvD/dCVun6VSnmZaNBwCEFt9nTHj6H+fFFb8hveFWzPWo7zswSe7TK
 3Nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iTIRoBMB8dTH55Lw8avCBAoOzO2H2LeNFnFB35W++GY=;
 b=vV0EeoujekkK5FYMlrpYijc6bOoZ3bh2POaG0s3Ak+VS/PvPYtJ7yMWCVFLTx532nD
 nsRNVLNkcGrD0c8I5ETklzZJM+k/XK46Jj2qr4nNm+YyKC6HbI3FhiElCOcLghw2E8iI
 xL+4ao0Dgki47jZ0NhPpwu8eM6fDeXtgdCcfZUG3Kt8DQePAYc5fLbhCpri4gAkuyYAP
 ScsPPmVThn4w9AOQvVKC/brYGy1VJxnEyEsILrE3xNtCpbcIW1/JdZ+3woq4B4eY1QRS
 UP7Msm0hwcm5PFn81kPd/F44QSNK3jhOT/WkBgQxItoQ+mbPwZwt6dR4eAf7w0uGur5Z
 IhGw==
X-Gm-Message-State: AOAM532IpeFQCIBkxCmHknTOw6KXZ/amLBrvG8vZloBgxroHQS70SZNK
 yHro9aJ9xVvpLefM7D3sG2YO3aWhT6WWR56FuYA=
X-Google-Smtp-Source: ABdhPJzyznhO8pdRdplpF77M8F5//6rspO6NfKtmr5De3xuos3zWUtNbCBNN29BnYBWyOf9dB8vdrMP6DZ5X3cS3pGI=
X-Received: by 2002:a9d:67c1:: with SMTP id c1mr567099otn.299.1637274526546;
 Thu, 18 Nov 2021 14:28:46 -0800 (PST)
MIME-Version: 1.0
References: <1637233039-22503-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1637233039-22503-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 18 Nov 2021 17:28:35 -0500
Message-ID: <CADnq5_MK+O-6rMSojCGquCD8HooVfKMwyLez+RKsT38c_X=SMA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/pm: clean up some inconsistent indenting
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
Cc: Dave Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Nov 18, 2021 at 5:57 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Eliminate the follow smatch warning:
>
> drivers/gpu/drm/amd/amdgpu/../pm/powerplay/amd_powerplay.c:1554
> pp_asic_reset_mode_2() warn: inconsistent indenting.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> index 8d796ed..20cb234 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> @@ -1551,7 +1551,7 @@ static int pp_set_ppfeature_status(void *handle, uint64_t ppfeature_masks)
>  static int pp_asic_reset_mode_2(void *handle)
>  {
>         struct pp_hwmgr *hwmgr = handle;
> -               int ret = 0;
> +       int ret = 0;
>
>         if (!hwmgr || !hwmgr->pm_en)
>                 return -EINVAL;
> --
> 1.8.3.1
>

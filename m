Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAE3499C71
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 23:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1CB10E191;
	Mon, 24 Jan 2022 22:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B9C10E191;
 Mon, 24 Jan 2022 22:08:40 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 z25-20020a0568301db900b005946f536d85so24194927oti.9; 
 Mon, 24 Jan 2022 14:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5AU7UHXWGTgXus+jcgLu4tYknaJHqkDWYn1T5acuUH8=;
 b=NMM7a/yjJoWOPQjiTo+SdO9A7Y7k+6dqKIG3Kq3o8dz5RSoZ1W2vD77yq2K3z1Nxt4
 2Qn4P18bkaT2nk5dsqlPUyMhY/TB3Qoo6FJRy1W+8sr33cSUmBdktRvJMckxtUpC7ev5
 NS4RFF6uAiFsuqMj/uJEnwtonchUz8WDNLz/9Wj0/0qE5/gDqlonX/RwX/0T7sfOjJsJ
 mIRTYh6QH+zNutWNdWHCUp+LbnJaxAVIF41PJPKVg7CoHdgjKGgvoNgaGqzpbgr4/4Ox
 X1OrHW75bzMi9cF1nNAmFxIVFjO2qiS8K+uCqfqG980sJeDjyS8uL0x5tfK1XA0vq274
 2OwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5AU7UHXWGTgXus+jcgLu4tYknaJHqkDWYn1T5acuUH8=;
 b=XjSiQCVYjZUWWEl7p0gG1oDOoenqFIpuLaWcHI/AtIf9kvMP+WZ1r660++de6YFs8K
 lMzRul69ra4Rqw33aYYVLeef/i9ULECc5EBMLGD0ylRuLvH0tLipID9QFaQIOvqLbRW0
 C0W3xsgGXHYB9KmttONp4FEeA0ds9xmQIXQfzbZ+qy9Y5MqJsF9bUvKd42a2yfnReQUu
 ASysDIBpQtBr/7Pck67LqfqiWCXaj/eDrfiqmkV2yriGr3T7S8JQSq71+0zRgftd2Bce
 ar7BQ+kSZC63ZoponPM/NcWy/u39o6NGdDKuwNz1WISlYZGXaoNMSLWZo1N4EgI60/v1
 oY3A==
X-Gm-Message-State: AOAM5337LCzabwrtf1awcctJRVXsGiKpbBFcdnTXf/Pn5OeLQuX2Vk93
 8nlTE1fvJpclPBO7AS3pR8f2K2ITnVs1xyGzmVM=
X-Google-Smtp-Source: ABdhPJyRp7jJ3E/mwEtBlF6sV7zRxPUTudHrillxpCsaSQDiBOb6hmpGdoVdYTdWWuI6WFz59OvDXIFEApG8s+eBGw0=
X-Received: by 2002:a9d:601a:: with SMTP id h26mr3605702otj.357.1643062119806; 
 Mon, 24 Jan 2022 14:08:39 -0800 (PST)
MIME-Version: 1.0
References: <20220124201812.1078824-1-trix@redhat.com>
In-Reply-To: <20220124201812.1078824-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jan 2022 17:08:28 -0500
Message-ID: <CADnq5_M+xmJkiMkug=5bix8ypxHzr0embK7GN4GRY57BK1y4FA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/pm: return -ENOTSUPP if there is no
 get_dpm_ultimate_freq function
To: Tom Rix <trix@redhat.com>
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
Cc: "Lazar, Lijo" <lijo.lazar@amd.com>, "Chen, Guchun" <guchun.chen@amd.com>,
 Arunpravin <Arunpravin.PaneerSelvam@amd.com>, Dave Airlie <airlied@linux.ie>,
 xinhui pan <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Nathan Chancellor <nathan@kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Powell,
 Darren" <darren.powell@amd.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "Quan, Evan" <evan.quan@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, llvm@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Jan 24, 2022 at 3:18 PM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> clang static analysis reports this represenative problem
> amdgpu_smu.c:144:18: warning: The left operand of '*' is a garbage value
>         return clk_freq * 100;
>                ~~~~~~~~ ^
>
> If there is no get_dpm_ultimate_freq function,
> smu_get_dpm_freq_range returns success without setting the
> output min,max parameters.  So return an -ENOTSUPP error.
>
> Fixes: e5ef784b1e17 ("drm/amd/powerplay: revise calling chain on retrieving frequency range")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
> v2: return error instead of initializing min/max
>
> drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> index 5ace30434e603..264eb09ccfd51 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> @@ -116,7 +116,7 @@ int smu_get_dpm_freq_range(struct smu_context *smu,
>                            uint32_t *min,
>                            uint32_t *max)
>  {
> -       int ret = 0;
> +       int ret = -ENOTSUPP;
>
>         if (!min && !max)
>                 return -EINVAL;
> --
> 2.26.3
>

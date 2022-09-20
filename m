Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D1C5BEADF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 18:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E6B10E70D;
	Tue, 20 Sep 2022 16:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2196410E70A;
 Tue, 20 Sep 2022 16:11:31 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 w22-20020a056830061600b006546deda3f9so2067505oti.4; 
 Tue, 20 Sep 2022 09:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=CFL7aF0Lpx3sGV7EQnRPGBaKXb71NBZ9UzzFCX2PLnU=;
 b=XgAcGjAHKfLFS16nM9iiM7B7UtPyyObCuRf2WBRt4DIn/J2kHABErMfKUJgNiIeXz6
 eDPxZJDOPXYul99wfO/V2nUPQKvXAPgXoGYPv7/AGh0ROPmaMjiXVYfPM2frgs6BkKuo
 FSjHDZiJLqr3Cli4CqqDraHHCGAXsEJLbNNtsjVMzCaDI86E9DY1DUvGfpss8cZY2jro
 uDm1n8IDF0IATWb5OCNv0aZRNYuXwuCKXVXXmFu3e0sg7q3Tpq0BDZN7ux80nJOcYimZ
 yYAoWhQHR+uot/VYBVOnXHDfP7GEoXWYmKSuVWja34oYzBb2uqy8Zs32MxNaWCPe7tCT
 IvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=CFL7aF0Lpx3sGV7EQnRPGBaKXb71NBZ9UzzFCX2PLnU=;
 b=BHXaTn0tGTQnLQBkPPK+Ab6f54gAS4uDs2oTi7P2QKw2ewaqCxw8FoHXYMrR7+hVB+
 JYirewFFuE76jjfEEOtmFU+iJ80BpG5fz2ySc+bOi+TFxmPYZvHxZeSyvHYleGheuwIP
 kuu9/xDCo4Z/z+316vCV+ihSA4Fci08HRNRWuBRuMVKEBVr9r3ULfkIOFln/U4h85tnu
 f3aMskWCyzjkpcP6IEdZF4ZJMPiBXwpB5n5VVd5HwNBuwHNv53nRoc6bRglE1BmXsqzz
 iHeVUZ4JuQOvk3A9D2l+1FtDE8K0qWqxDVDUP/8TLKXwSmjwcQngrXw869dM5+eVIo5R
 W+xg==
X-Gm-Message-State: ACrzQf1//VXzqBtFgiwZ3MQ7WcuZklYb573TLz6LfXHPF013M1bfWrD7
 1a/3wbjcWKEBvJbn4TRhOEbypxGgN1vZN1r+W8fG9LJy
X-Google-Smtp-Source: AMsMyM6A0fKosrNPb6aIaCncIrF3lfn+IGCf3YGllsL/BcIc5fpjbW3Yq75JpmRUqIFBJu7g3jiYBKlN9DtGV3Ccrag=
X-Received: by 2002:a9d:376:0:b0:655:b4bc:fd6e with SMTP id
 109-20020a9d0376000000b00655b4bcfd6emr10670481otv.233.1663690290428; Tue, 20
 Sep 2022 09:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220920063600.215257-1-ye.xingchen@zte.com.cn>
In-Reply-To: <20220920063600.215257-1-ye.xingchen@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 20 Sep 2022 12:11:19 -0400
Message-ID: <CADnq5_PB=z9JeVV4c1YC6hbAXXvHPLbD=kZvOyS1QxR-WMU9Gw@mail.gmail.com>
Subject: Re: [PATCH linux-next] drm/amd/pm: Remove unneeded result variable
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
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, evan.quan@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Sep 20, 2022 at 2:36 AM <cgel.zte@gmail.com> wrote:
>
> From: ye xingchen <ye.xingchen@zte.com.cn>
>
> Return the value atomctrl_initialize_mc_reg_table_v2_2() directly instead
> of storing it in another redundant variable.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
> index 45214a364baa..e7ed2a7adf8f 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
> @@ -2567,15 +2567,13 @@ static uint8_t polaris10_get_memory_modile_index(struct pp_hwmgr *hwmgr)
>
>  static int polaris10_initialize_mc_reg_table(struct pp_hwmgr *hwmgr)
>  {
> -       int result;
>         struct polaris10_smumgr *smu_data = (struct polaris10_smumgr *)(hwmgr->smu_backend);
>         pp_atomctrl_mc_reg_table *mc_reg_table = &smu_data->mc_reg_table;
>         uint8_t module_index = polaris10_get_memory_modile_index(hwmgr);
>
>         memset(mc_reg_table, 0, sizeof(pp_atomctrl_mc_reg_table));
> -       result = atomctrl_initialize_mc_reg_table_v2_2(hwmgr, module_index, mc_reg_table);
>
> -       return result;
> +       return atomctrl_initialize_mc_reg_table_v2_2(hwmgr, module_index, mc_reg_table);
>  }
>
>  static bool polaris10_is_dpm_running(struct pp_hwmgr *hwmgr)
> --
> 2.25.1

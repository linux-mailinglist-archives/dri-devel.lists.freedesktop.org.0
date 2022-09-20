Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD855BEADB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 18:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2814B10E709;
	Tue, 20 Sep 2022 16:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6A210E708;
 Tue, 20 Sep 2022 16:10:27 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id v130so4348474oie.2;
 Tue, 20 Sep 2022 09:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=UXjaeEik90YzXeLDR2W4WjZVnnFwHMwroQ6yWKNSRgA=;
 b=T9cdH6v0/SKVdljrr56ri4Rz6BWh+Z2maSeep3o/Wy4lglPjbxhUnt0+188DQ9W8vR
 FxkLw2KDhxGMqlerWZb+YlQqG7p4wH6RbiXp0ReVW3LYeNVuRf0cc3oLCMhYmfNc5B8O
 /8CacwwkO4KyPMTPRugvNO+wpUlzob6Fz2403wCtYVA89z5iXgnOg5eoXRg1IEjYfX7r
 LG8wrLyzdo38dHCQZtkSEOFXq3zjyHtm4FLKNTpX37miXFWVVdS3e7BJXw7DhK4QbbDq
 iOOavo63+ACY1QhQtaLRznU9URM4gSV29mYw+BT7AkRE41Djj7wHKDqbPoioJPtnKmhj
 yaFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=UXjaeEik90YzXeLDR2W4WjZVnnFwHMwroQ6yWKNSRgA=;
 b=f1iF3dbPNIQyycAbHp9tldLD03mtW/9ozatD9cboOzvCGk+InlC2rN7F8nESeq2fAt
 Hwr2HQQk8yFJBV9B1k7GfXLQQP3kMHgqF+7teXs4VCs5nZ8c+eMNgq4/vgvwzMcioftc
 TIMmRg0esvNTOS8H9X9kyuadWWNPMUiJUlapihcS3mWrArkGSQae1EMeeW4ZBuoKeLXe
 Vn7dA7PikapB0+8g80RfMucXH4wdcZoMIKwc1dxBU78xIUpsXX2LzcxRvTyYlY3ZuOIu
 9260Yk4WwqDNge3+IHHg1A/EkObDCI3OumAdZSmgnBspkfU0chOXS9w4x/ewWLLOGb4C
 p55Q==
X-Gm-Message-State: ACrzQf1RhfozK/Hh4a8KFapnelPCO4P64Gfx4lW44RFu9Hg8/vP72T6Y
 ItsZi2D0/b3Xs910WClN4vK83mL7NTu4lojHCmY=
X-Google-Smtp-Source: AMsMyM5RRkIjKFuqLc2MRgC2GoMfxwkEDftEddw+q0j18vgSxojkeoXJDTSg8dASbarhqiwRe12QKnFaGiSp7RSy3hw=
X-Received: by 2002:a05:6808:2390:b0:350:5c6b:5ef9 with SMTP id
 bp16-20020a056808239000b003505c6b5ef9mr1985622oib.96.1663690226955; Tue, 20
 Sep 2022 09:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220920063503.215199-1-ye.xingchen@zte.com.cn>
In-Reply-To: <20220920063503.215199-1-ye.xingchen@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 20 Sep 2022 12:10:15 -0400
Message-ID: <CADnq5_O8DSAGzbjhz-2XD6tkAQmWMGM1d7YBngzGEmf0w-trdw@mail.gmail.com>
Subject: Re: [PATCH linux-next] drm/amd/pm: Remove the unneeded result variable
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

Applied.  Thanks.

On Tue, Sep 20, 2022 at 2:35 AM <cgel.zte@gmail.com> wrote:
>
> From: ye xingchen <ye.xingchen@zte.com.cn>
>
> Return the value append_vbios_pptable() directly instead of storing it in
> another redundant variable.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>  .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c  | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c
> index 1e79baab753e..bd54fbd393b9 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c
> @@ -195,7 +195,6 @@ static int init_powerplay_table_information(
>         struct phm_ppt_v3_information *pptable_information =
>                 (struct phm_ppt_v3_information *)hwmgr->pptable;
>         uint32_t disable_power_control = 0;
> -       int result;
>
>         hwmgr->thermal_controller.ucType = powerplay_table->ucThermalControllerType;
>         pptable_information->uc_thermal_controller_type = powerplay_table->ucThermalControllerType;
> @@ -257,9 +256,7 @@ static int init_powerplay_table_information(
>         if (pptable_information->smc_pptable == NULL)
>                 return -ENOMEM;
>
> -       result = append_vbios_pptable(hwmgr, (pptable_information->smc_pptable));
> -
> -       return result;
> +       return append_vbios_pptable(hwmgr, (pptable_information->smc_pptable));
>  }
>
>  static int vega12_pp_tables_initialize(struct pp_hwmgr *hwmgr)
> --
> 2.25.1

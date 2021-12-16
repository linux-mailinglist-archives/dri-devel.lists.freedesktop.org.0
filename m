Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2664775B8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 16:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C4410ED50;
	Thu, 16 Dec 2021 15:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDADF10ED1B;
 Thu, 16 Dec 2021 15:20:31 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 u18-20020a9d7212000000b00560cb1dc10bso29307972otj.11; 
 Thu, 16 Dec 2021 07:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BzROn8ygEIvbgv1YLRyZ5KtKZ741t/BVqbnCoQQpFcI=;
 b=hzrKz0GP7Af08AiTFt6vyTs82/qpYYXkPNcJsIJI5Cs2ooHjlq7z6GFiVWoHUaO4dJ
 809J0cpvrRGNBvLpNhWZ36mIEFtCIlvWUfrCVLpIscPlMfU8PgOKpdn+8xZeKDf5Ult8
 tc/Rx4OBK5bzyo2lQgb39j8rzXManNzeXqRVDcCK7E/rgSoeUuokEI5A0N90opouRAki
 sIbe8GLcaCPGvPQKu+Ju+5tMlrvi0m40UjjuujoS9oyyoF13WAotLpZpHzGjBPb9cvVP
 HaSCBrFMYqy2oxNSfAQQTP4pQUivjXroQeua1IQkWmrZIAW450HcZY+23dZc5YVMiL99
 VruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BzROn8ygEIvbgv1YLRyZ5KtKZ741t/BVqbnCoQQpFcI=;
 b=1swk/lG/sAkiwnMmUusIinPQe0gWE56bWv3cBtHjUHmzkjIGdYhOtGUHtIdf4x6SFY
 /GRR4MAkryJ94Qnv1Vn65Pm35k74sTQlEuQrI/Fy6W+juRn+Va07nuI9uTtgoF56ON1I
 7hfWQ2WrsJGa/R/gEOEu7PfbzgECFT2v28lXKxr6nU1QgP80WE4UN/qFvc573gI4fs6m
 G4sOLpHNrQuGiZ1t0UenoTFzWcYQaVx1VTVJH1cmHtghNUqcH5Db69FkmKyPzuSbXA72
 34CEmqXn6nsDerP7RPfmuqX+XY2kOHiaFbL/TIMC5SNRY/dihi5GIO0RFdq7SnLBgT25
 s3eA==
X-Gm-Message-State: AOAM53331WO6ZNCh2LyjsNLMIyXHQh3dPsqivzH8ePbWZMGHGM12D6I+
 ukHXP8MSvM8gPEetTreMXMEk4yApUXfFurw4RjsYfMU7
X-Google-Smtp-Source: ABdhPJwic3C3ahfgH+CaAHrVLrjrsIqftmDBpwPvpOxhFIPcFLq3nEH9vzxZr7cRlDsGItxYtVYwg2vDH6jx+kmYxL4=
X-Received: by 2002:a9d:6855:: with SMTP id c21mr13159059oto.357.1639668031273; 
 Thu, 16 Dec 2021 07:20:31 -0800 (PST)
MIME-Version: 1.0
References: <20211216075017.73996-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20211216075017.73996-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Dec 2021 10:20:20 -0500
Message-ID: <CADnq5_N4rVUenOBs_oh1_AkyNYcKOKHp_gduiMYq-hGrkyrStw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix warning comparing pointer to 0
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 Abaci Robot <abaci@linux.alibaba.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Dec 16, 2021 at 2:50 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warning:
>
> ./drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c:744:35-36:
> WARNING comparing pointer to 0.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c
> index 8f78e62b28b7..48005def1164 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c
> @@ -741,7 +741,7 @@ void vg_clk_mgr_construct(
>                                 sizeof(struct watermarks),
>                                 &clk_mgr->smu_wm_set.mc_address.quad_part);
>
> -       if (clk_mgr->smu_wm_set.wm_set == 0) {
> +       if (!clk_mgr->smu_wm_set.wm_set) {
>                 clk_mgr->smu_wm_set.wm_set = &dummy_wms;
>                 clk_mgr->smu_wm_set.mc_address.quad_part = 0;
>         }
> --
> 2.20.1.7.g153144c
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1865A308C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 22:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FE210E3EB;
	Fri, 26 Aug 2022 20:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A6F10E3E8;
 Fri, 26 Aug 2022 20:39:33 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id o184so3330563oif.13;
 Fri, 26 Aug 2022 13:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=dddmhs6+o4Xh9+N13zA/oRm8MafN5+Bs+QATExsKyJY=;
 b=hKBtKzMs03S28uiZi6W8K8XZgK75JXvAxKo69eY/sQekyRhp1YDNE92qlzZ1RrAq3M
 QsDsiQB7qxj8u5WGLGJHEZN07uqx4uc0DTtu5I/rzwTBshwnXs6bsC5fraE+DzBgABfq
 lJf137qOxIx2CcV4CeSlhGUTvJUGsGWMiR+hC4BwUa4b2NwK/oVTNO2xok8F82P7n4Ep
 RxPpF7+nfDHOA1DhvwWcT2s2Vm11G62IR+Bl5ajoBGVZxYxGlU+DLmQ61DOgfjg35AOy
 zGeumYcJWLrbLg4asbyORIc7ded9kdzu0zs+lFpE60Shh652rk31pj+32mP95lMFUTfH
 idkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=dddmhs6+o4Xh9+N13zA/oRm8MafN5+Bs+QATExsKyJY=;
 b=NUP7kwmW4PQQEQXG60zdTC9MWsdNJnYOLxBE1GfPaFmBNWqjn2LCiIpqxpmw94cCkL
 EKWpqjHSF64Sb1OpXV42YGz57XTOQXGZLEDGZtEMCH6exWIXVneOc4e7BBUWYQOm0me7
 eCe9cRDkU06IUsc6bTsL5k0+nBuv7d//vVUjYKENcc1jrZXfBt1s01oV1dHLYZAAtF0q
 8IecYA/6T/wAE7v9CuindpFvIou/t47/6CyUsuWbpXaxYmlvIYB3NREjm14nZKRJx9BQ
 OUJZ2+neKlrO+bMCxybtqeAJbQUcoTBr2pcEMBfUjEgXdOhNYSA7T9yi4jBgKYwz8N31
 VCig==
X-Gm-Message-State: ACgBeo2nR1VXDZx9qQzB6B5/VWjIjqKGmZyWYAotm+ncbMEJ0Y/YCz87
 sFI8u8zAwmKDNsCQDQ8gBZP27GZgLD8/mo1tMNE=
X-Google-Smtp-Source: AA6agR5YV12hxD8EP5woASxrumAqZLtWB2nIX2ZgJ6CEQXi1v32YpdrloQb1NynuwLMpljxfEtaSTgJaT+IXUD3ZTbs=
X-Received: by 2002:a05:6808:2187:b0:344:eccd:3fc5 with SMTP id
 be7-20020a056808218700b00344eccd3fc5mr2542948oib.46.1661546372683; Fri, 26
 Aug 2022 13:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220826084121.94319-1-sunliming@kylinos.cn>
In-Reply-To: <20220826084121.94319-1-sunliming@kylinos.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 26 Aug 2022 16:39:21 -0400
Message-ID: <CADnq5_O2WoDxCJG0rx_x1VhqVHxDT8Aa-X1h+5XwPALiO=8qOA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix variable dereferenced before check
To: sunliming <sunliming@kylinos.cn>
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
Cc: kernel test robot <lkp@intel.com>, airlied@linux.ie,
 kelulanainsley@gmail.com, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Aug 26, 2022 at 4:41 AM sunliming <sunliming@kylinos.cn> wrote:
>
> Fixes the following smatch warning:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:311 dc_dmub_srv_p_state_delegate()
> warn: variable dereferenced before check 'dc' (see line 309)
>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: sunliming <sunliming@kylinos.cn>
> ---
>  drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> index 09b304507bad..ebf99e8f93e0 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> +++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> @@ -323,11 +323,13 @@ bool dc_dmub_srv_p_state_delegate(struct dc *dc, bool should_manage_pstate, stru
>         struct dmub_cmd_fw_assisted_mclk_switch_config *config_data = &cmd.fw_assisted_mclk_switch.config_data;
>         int i = 0;
>         int ramp_up_num_steps = 1; // TODO: Ramp is currently disabled. Reenable it.
> -       uint8_t visual_confirm_enabled = dc->debug.visual_confirm == VISUAL_CONFIRM_FAMS;
> +       uint8_t visual_confirm_enabled;
>
>         if (dc == NULL)
>                 return false;
>
> +       visual_confirm_enabled = dc->debug.visual_confirm == VISUAL_CONFIRM_FAMS;
> +
>         // Format command.
>         cmd.fw_assisted_mclk_switch.header.type = DMUB_CMD__FW_ASSISTED_MCLK_SWITCH;
>         cmd.fw_assisted_mclk_switch.header.sub_type = DMUB_CMD__FAMS_SETUP_FW_CTRL;
> --
> 2.25.1
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E7E26ACD6
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 21:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD0689C17;
	Tue, 15 Sep 2020 19:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1115089C03;
 Tue, 15 Sep 2020 19:01:07 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z4so4461738wrr.4;
 Tue, 15 Sep 2020 12:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w5YqpllGkEhbUqBHfOeKyCpHAJAP7nCJ7uA9Og5Y3N0=;
 b=DX/XslHWstHmoXV3z9+jZRklMKGmuWTt+LE6drX1s90S+KWYF/13VSXkZNSimQ8TE5
 xQS+tt7uTf/hTFoov2EVRwbRg8jKEYSQyif3HlrLkX6tjSsxjACHd3wpM2Ft69eq8MZh
 1+p/Nu9y1PdtxlE/Qkv/XxtG3KuWSMgP5G4X/G6DKfh66A5cgPVu4yLQFM3gPRrPAHw/
 Q2VqDA7A/BIWNjwNYdcOpSdL53Dce8BugmUqCZ3+ftmqAW6qKhUKiPlHANbKrmm7LNTK
 IJwo9CSCL7ytmtMCDYFBP9oTJxLRKvivGu1yCoSfoAQ80pA8TppvxeMX13fhR3947IaP
 253w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w5YqpllGkEhbUqBHfOeKyCpHAJAP7nCJ7uA9Og5Y3N0=;
 b=uGaLytlEMx9GsefEap94lJ6dJlThQWllzoRVGzQM+qybop3p/c6fAVHMAzGUvX/wp8
 J3UllURB2CAYlLf12H2v+UoKBnpC1e8VQgK0M/uHIICBVd006wm/jpQDE3QNHyFRcQBo
 9Gczfr+V6sBrzuMrIVMmcfDsOAZyCIg/9IIAYe6bv2/Gd4xTKyUXCVCoGlh43vVCCN7f
 Yu9IIwpOJ++NEd1TaEnoBlHlXMkGC9FVjdu+Kmx51Ju82v3zr6rXkuRPn4sDYSRMpmbV
 9opzEslVHCPN5lmlkZ2tPCbSC82inPzU+K7Wzq7AaNgGrr5CA3r5Ezf4+TFrAMV9Z1R7
 QUjA==
X-Gm-Message-State: AOAM532ywuBDHbIyhzTSDYIpJBO8hdBmcq4YY2+y57Xd4s7vsGyhi/h9
 W2ccxrWJ4ixtFImwisjYUQ3Wkg7/0RvGXJnmkSM=
X-Google-Smtp-Source: ABdhPJx1DHgoxeZrju3jbJYcv3wbxCLaXhWMCkEHgn3amTjhKjouKilvEJkDrqVN75M9YRXOhqxLaVDJ8DQjJppUCG4=
X-Received: by 2002:adf:dd82:: with SMTP id x2mr24242119wrl.419.1600196465753; 
 Tue, 15 Sep 2020 12:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <a31672e7-9047-e4ef-93d8-d0c9afd47964@infradead.org>
In-Reply-To: <a31672e7-9047-e4ef-93d8-d0c9afd47964@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Sep 2020 15:00:54 -0400
Message-ID: <CADnq5_NS2UB5VNKe2j6s4X3v2OQ7ow=se2xtFp0UD=7gJ4wMTA@mail.gmail.com>
Subject: Re: [PATCH] drm: amd/display: fix spelling of "function"
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: Leo Li <sunpeng.li@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Sep 9, 2020 at 3:05 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix spellos of "function" in drivers/gpu/drm/amd/display/.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.h   |    2 +-
>  drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.h |    2 +-
>  drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.h   |    2 +-
>  drivers/gpu/drm/amd/display/dc/gpio/dce120/hw_factory_dce120.c      |    2 +-
>  drivers/gpu/drm/amd/display/dc/gpio/dcn10/hw_factory_dcn10.c        |    2 +-
>  drivers/gpu/drm/amd/display/dc/gpio/dcn20/hw_factory_dcn20.c        |    2 +-
>  drivers/gpu/drm/amd/display/dc/gpio/dcn21/hw_factory_dcn21.c        |    2 +-
>  drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.c        |    2 +-
>  8 files changed, 8 insertions(+), 8 deletions(-)
>
> --- linux-next-20200908.orig/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.h
> +++ linux-next-20200908/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.h
> @@ -33,7 +33,7 @@ struct display_mode_lib;
>
>  // Function: dml_rq_dlg_get_rq_reg
>  //  Main entry point for test to get the register values out of this DML class.
> -//  This function calls <get_rq_param> and <extract_rq_regs> fucntions to calculate
> +//  This function calls <get_rq_param> and <extract_rq_regs> functions to calculate
>  //  and then populate the rq_regs struct
>  // Input:
>  //  pipe_src_param - pipe source configuration (e.g. vp, pitch, etc.)
> --- linux-next-20200908.orig/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.h
> +++ linux-next-20200908/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.h
> @@ -33,7 +33,7 @@ struct display_mode_lib;
>
>  // Function: dml_rq_dlg_get_rq_reg
>  //  Main entry point for test to get the register values out of this DML class.
> -//  This function calls <get_rq_param> and <extract_rq_regs> fucntions to calculate
> +//  This function calls <get_rq_param> and <extract_rq_regs> functions to calculate
>  //  and then populate the rq_regs struct
>  // Input:
>  //  pipe_src_param - pipe source configuration (e.g. vp, pitch, etc.)
> --- linux-next-20200908.orig/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.h
> +++ linux-next-20200908/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.h
> @@ -32,7 +32,7 @@ struct display_mode_lib;
>
>  // Function: dml_rq_dlg_get_rq_reg
>  //  Main entry point for test to get the register values out of this DML class.
> -//  This function calls <get_rq_param> and <extract_rq_regs> fucntions to calculate
> +//  This function calls <get_rq_param> and <extract_rq_regs> functions to calculate
>  //  and then populate the rq_regs struct
>  // Input:
>  //  pipe_param - pipe source configuration (e.g. vp, pitch, scaling, dest, etc.)
> --- linux-next-20200908.orig/drivers/gpu/drm/amd/display/dc/gpio/dce120/hw_factory_dce120.c
> +++ linux-next-20200908/drivers/gpu/drm/amd/display/dc/gpio/dce120/hw_factory_dce120.c
> @@ -162,7 +162,7 @@ static void define_hpd_registers(struct
>  }
>
>
> -/* fucntion table */
> +/* function table */
>  static const struct hw_factory_funcs funcs = {
>         .init_ddc_data = dal_hw_ddc_init,
>         .init_generic = NULL,
> --- linux-next-20200908.orig/drivers/gpu/drm/amd/display/dc/gpio/dcn10/hw_factory_dcn10.c
> +++ linux-next-20200908/drivers/gpu/drm/amd/display/dc/gpio/dcn10/hw_factory_dcn10.c
> @@ -194,7 +194,7 @@ static void define_hpd_registers(struct
>  }
>
>
> -/* fucntion table */
> +/* function table */
>  static const struct hw_factory_funcs funcs = {
>         .init_ddc_data = dal_hw_ddc_init,
>         .init_generic = dal_hw_generic_init,
> --- linux-next-20200908.orig/drivers/gpu/drm/amd/display/dc/gpio/dcn20/hw_factory_dcn20.c
> +++ linux-next-20200908/drivers/gpu/drm/amd/display/dc/gpio/dcn20/hw_factory_dcn20.c
> @@ -221,7 +221,7 @@ static void define_generic_registers(str
>         generic->base.regs = &generic_regs[en].gpio;
>  }
>
> -/* fucntion table */
> +/* function table */
>  static const struct hw_factory_funcs funcs = {
>         .init_ddc_data = dal_hw_ddc_init,
>         .init_generic = dal_hw_generic_init,
> --- linux-next-20200908.orig/drivers/gpu/drm/amd/display/dc/gpio/dcn21/hw_factory_dcn21.c
> +++ linux-next-20200908/drivers/gpu/drm/amd/display/dc/gpio/dcn21/hw_factory_dcn21.c
> @@ -202,7 +202,7 @@ static void define_hpd_registers(struct
>  }
>
>
> -/* fucntion table */
> +/* function table */
>  static const struct hw_factory_funcs funcs = {
>         .init_ddc_data = dal_hw_ddc_init,
>         .init_generic = dal_hw_generic_init,
> --- linux-next-20200908.orig/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.c
> +++ linux-next-20200908/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.c
> @@ -218,7 +218,7 @@ static void define_hpd_registers(struct
>  }
>
>
> -/* fucntion table */
> +/* function table */
>  static const struct hw_factory_funcs funcs = {
>         .init_ddc_data = dal_hw_ddc_init,
>         .init_generic = dal_hw_generic_init,
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

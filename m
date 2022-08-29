Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DF85A54AC
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 21:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6714510E3E7;
	Mon, 29 Aug 2022 19:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EBA10E3DD;
 Mon, 29 Aug 2022 19:46:07 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-11c4d7d4683so11703229fac.8; 
 Mon, 29 Aug 2022 12:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=vETszXP4tpDPkrySBXLgi1EkRM0QIaqBCFSpjffSf6A=;
 b=NwVZOfhTEFuNXz+pARnpVVoHpeMj7OR7hnfJiKnJnjG65J2EwYFa5F2LT5j9HaXnSu
 K6QI+xlxIA0ycuifqvLzWsYCk20WPrFSVOoORLYTbZ4gJKJAYQ1rQgBmja5WPZWI7uxv
 8zo/nsJF9knzLhre8yyB919nv5LI/zCXHZlN18axFiPgvDyI+rgwlpwp8AQXDsLUO251
 No20kghi+90Wv6nW7MLjHFNsELraNG9l1sxa7nzYkEQ5tkMzoVeQQ3UnhJMFtJlz9LRb
 CQmxSjFAYq/LcRVyWMw1k1XZcEEIuqfE27KTI02WzG5gLFS95VDaUAlTQW2Eh2wOnT26
 Tp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=vETszXP4tpDPkrySBXLgi1EkRM0QIaqBCFSpjffSf6A=;
 b=x0EWm3PGRkWExG+V6o8BD/1o7LG7s4QvUR0wF4w8pRih0aWwBboTxoryCqSlT0OOK7
 5nSnkCPaAJV/OfWqmngql/clg5LnyHnE5jygDnPutA2rsmYDxEfrXROO+F5rL6a+ykLZ
 I/NqJ/Z/1ESDwG0+S0aiYXmTTPNVocs4JhFFYdgQKjDRgiQwU/MH/RFmro1/77pM1sPU
 hcV6lahwjEaSTjRAaytOvi5ghMwsRjIQn5Bl+5gsj9/Z1+RMQJjtkwGEPZTKqJBRKaCy
 W4tg17/AH4MqOg9E4Ts9etdWuVAN2nNz0ikOlDvE3dGX6KkbW4tC3kCuNHCkGqAZDZtr
 jKxQ==
X-Gm-Message-State: ACgBeo3QDDP7g2Ej/EQ/vrBAsGWQM42pvletACA/HobK0El1C8pJHDlH
 Mef0wqCN9G5iUlMeE3xxcnUyoUr+L2rR29CiEXk=
X-Google-Smtp-Source: AA6agR7YRRp6PNAzq4KftL331TiXIS5EjF73/0OlDNq0lmw7QCGwt3wKpQgAsM9gYb+yDZEiaZW0sg8C3OViNSuAqjY=
X-Received: by 2002:a05:6808:138e:b0:345:13d1:fd66 with SMTP id
 c14-20020a056808138e00b0034513d1fd66mr8076771oiw.96.1661802366350; Mon, 29
 Aug 2022 12:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220829121320.267892-1-cui.jinpeng2@zte.com.cn>
In-Reply-To: <20220829121320.267892-1-cui.jinpeng2@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 29 Aug 2022 15:45:55 -0400
Message-ID: <CADnq5_O6b5bhpppqjOrnXhyfk+jXeMcYiQCDLXDz_HcCujQ4Ag@mail.gmail.com>
Subject: Re: [PATCH linux-next] drm/amd/display: remove redundant
 vertical_line_start variable
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
Cc: airlied@linux.ie, dale.zhao@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yi-Ling.Chen2@amd.com, isabbasso@riseup.net,
 Anthony.Koo@amd.com, Jinpeng Cui <cui.jinpeng2@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, alex.hung@amd.com, Jerry.Zuo@amd.com,
 sunpeng.li@amd.com, mwen@igalia.com, hanghong.ma@amd.com,
 agustin.gutierrez@amd.com, Sungjoon.Kim@amd.com, dingchen.zhang@amd.com,
 Xinhui.Pan@amd.com, Roman.Li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Aug 29, 2022 at 8:13 AM <cgel.zte@gmail.com> wrote:
>
> From: Jinpeng Cui <cui.jinpeng2@zte.com.cn>
>
> Return value from expression directly instead of
> taking this in another redundant variable.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Jinpeng Cui <cui.jinpeng2@zte.com.cn>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> index 37246e965457..8f4f1ea447a7 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> @@ -3741,7 +3741,6 @@ int dcn10_get_vupdate_offset_from_vsync(struct pipe_ctx *pipe_ctx)
>         int vesa_sync_start;
>         int asic_blank_end;
>         int interlace_factor;
> -       int vertical_line_start;
>
>         patched_crtc_timing = *dc_crtc_timing;
>         apply_front_porch_workaround(&patched_crtc_timing);
> @@ -3757,10 +3756,8 @@ int dcn10_get_vupdate_offset_from_vsync(struct pipe_ctx *pipe_ctx)
>                         patched_crtc_timing.v_border_top)
>                         * interlace_factor;
>
> -       vertical_line_start = asic_blank_end -
> +       return asic_blank_end -
>                         pipe_ctx->pipe_dlg_param.vstartup_start + 1;
> -
> -       return vertical_line_start;
>  }
>
>  void dcn10_calc_vupdate_position(
> --
> 2.25.1
>

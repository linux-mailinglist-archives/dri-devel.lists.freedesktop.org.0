Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4448C581628
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 17:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05CF14B662;
	Tue, 26 Jul 2022 15:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8685411BF06;
 Tue, 26 Jul 2022 15:13:01 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id m8so18071733edd.9;
 Tue, 26 Jul 2022 08:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yBRJ8tjENtSpeGeTiHbZwiRBnJ1kinArNIbw/C/Deio=;
 b=hnWhl18EZMAMwY1NbWl9Q2ew4kUnjjCqLMbb0F9JJjclqDY7CuP912KLiNKu590o+1
 8RnF31fx2WT2LYTxOEFlaS6xTqeFZQpvL6tqgLaEcBuyRfeADvMyMNu7WKCDqi4h+FQc
 aeP8E4YfZNPbL8yntzBlyrsxz96lXL2twpARm5kz32NHETxnRGKnDz3uZSV9PMuODHwB
 32GcyieXHvubioLoH1q0V7YJgJRjd8AdV7VH9OCH2Cfw96PKVgwSF2ZK1GvnKPO+DMeL
 dT3lhkXWhgL04qhFKhUWZylGGXoTebKaYIcUqEVB39EMYhRJ5lYkhfD5zxkRB8i5oFD2
 T8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yBRJ8tjENtSpeGeTiHbZwiRBnJ1kinArNIbw/C/Deio=;
 b=zyaIXkuft/xXu05YnylRvYtbxLsLQouTzzJSIuZnh5iWVIMbPGI6bEnlWVfXsCQqR1
 3bZPVsfsmVZDncopSTtbABZ4xRZy7KNlRBWTjgJ+CseH1xHC8hq9HjeOSJuEPiVqiu1B
 QAjZpwibhiZidXGL31nV0YQ9MPWCwx3zxvfaL2PrPMHIbnMDWUnrWv0EcnVd8iGBgW3j
 P+OT96HoGCJO8w4w1DXnj8nc58lgsCso79fnSJc+hgZWlNZJKqxQ1YXGeuFwIqOsRlUR
 aHF+fhHTP2W4Ia7yjIOko+0Pg5IxCyypoN/1WeCZN8tiV0M3ztFBNLHe7Xm3kKRGCOq9
 Z/tg==
X-Gm-Message-State: AJIora/g7avXwpOQU3UQ6bM14gaybEKxI8poBlXYn3y5l61OL5756Tbc
 X2OmJdunvwPLmweXdNylWRa9RQq5LnsotXy2pxMt3Hw+
X-Google-Smtp-Source: AGRyM1tTEzA+j1LcE8eqCjN/NB3z2kPwkvrzkDdGBPUNyOcJTawPwyOiihQ4eBh42pZcKNXQGF+9YNePw0SL33WUunY=
X-Received: by 2002:a05:6402:248d:b0:437:dd4c:e70e with SMTP id
 q13-20020a056402248d00b00437dd4ce70emr18432424eda.75.1658848379911; Tue, 26
 Jul 2022 08:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220726072555.91323-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20220726072555.91323-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 26 Jul 2022 11:12:48 -0400
Message-ID: <CADnq5_MtM9+ThO3O-ejdrD+dhSvN5A9KgX4Bf2zt0iKge1FJZA@mail.gmail.com>
Subject: Re: [PATCH 01/20] drm/amd/display: Clean up some inconsistent
 indenting
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
Cc: airlied@linux.ie, Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied the series.  Thanks!

Alex

On Tue, Jul 26, 2022 at 3:26 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> No functional modification involved.
>
> smatch warning:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_hwseq.c:910 dcn32_init_hw() warn: inconsistent indenting.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
> index b6bada383958..201516a62b4b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
> @@ -907,10 +907,10 @@ void dcn32_init_hw(struct dc *dc)
>                 dc->res_pool->hubbub->funcs->init_crb(dc->res_pool->hubbub);
>
>         // Get DMCUB capabilities
> -    if (dc->ctx->dmub_srv) {
> -       dc_dmub_srv_query_caps_cmd(dc->ctx->dmub_srv->dmub);
> -       dc->caps.dmub_caps.psr = dc->ctx->dmub_srv->dmub->feature_caps.psr;
> -    }
> +       if (dc->ctx->dmub_srv) {
> +               dc_dmub_srv_query_caps_cmd(dc->ctx->dmub_srv->dmub);
> +               dc->caps.dmub_caps.psr = dc->ctx->dmub_srv->dmub->feature_caps.psr;
> +       }
>  }
>
>  static int calc_mpc_flow_ctrl_cnt(const struct dc_stream_state *stream,
> --
> 2.20.1.7.g153144c
>

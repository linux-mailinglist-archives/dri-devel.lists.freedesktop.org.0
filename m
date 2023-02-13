Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF84694C23
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 17:14:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A29110E617;
	Mon, 13 Feb 2023 16:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9334110E617;
 Mon, 13 Feb 2023 16:14:37 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-169ba826189so15749937fac.2; 
 Mon, 13 Feb 2023 08:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0+daSh/Z6FdPjI606HSEb8Krfq5/w7DOEju6X6glUWc=;
 b=ea7Smiuhu4d9oZABwxVM0NTMtLIFiHVnmKQaOfsLt5w2uJyoLJLiGtgMDAG0CqSZ7w
 IDUJhB6w0bzXVBybdy1JpA53L+suWpiS4Jd2nWiTyO8pE+BBI3H72nfRyN2ubU5xcGtq
 K/QYzK0RT51rA99IjrWZdCwSwUbCVJRgy3Kl6/umR7eVyzlwL3ssegn8EZ1yLHaAOusk
 S4R0Nwx6IUfBX8j6ZVoiZbmIG1J+Sr3b1iBrcRV3qK3Hx4mzzvO1zDD3yn/Llqst9Fw5
 UjnN/1atOusuH2DZoDWeQd3VCb3m3d3MP4WKsuHOJwm6EIa3o78vq1AVJbzcL5jyYZBX
 9iHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0+daSh/Z6FdPjI606HSEb8Krfq5/w7DOEju6X6glUWc=;
 b=JafGF3tyeQkxw9hqloffSbEv8FHqFSsXHP5mxE5EL6bCA5K3RFGplshx8BxQTVlsOp
 fKDEfTCFy4qr0tuxxz1i6TfawWa7QVgkZ74MQ9hVNZ2DKndSejz0tiyYHfLIoNi/O7D5
 lswxYXJhUeN4Rkd6sxhF3piZwWX1cA9t8BmBitJ6lGCusQqMH/Eb3jTF8QXgS7UsNsdZ
 CF/AAZxsB90L4BM4V1EeSmCbPQRC8tuJHYOw55UlLcMrCGK/dGMVL+CBV5nEEIBPFaY+
 usAa/R0E3Et0aPfzFWXvBmy39Ie1Q3SPi+2knTSJUX2HDXMyKIGeT+Wn9vap/zVIJQzZ
 o+tA==
X-Gm-Message-State: AO0yUKXEpMceW+yMEtWiP1odoHiKuVBMHlhmraF/5xOMZpd0eVx8w0iI
 BvGL0vxbKkllB9frzpeB83t+acJLFjZJaqTRf8o=
X-Google-Smtp-Source: AK7set97WCzJ4Aa7TmQ1GCX0WG33oXuc2vcHSz1xIZ92ltEtafFhAodhFKGmdvH9ZrEk40q3d6gB/FepHwjoZ9XNELQ=
X-Received: by 2002:a05:6870:13d1:b0:163:a303:fe2f with SMTP id
 17-20020a05687013d100b00163a303fe2fmr2647493oat.96.1676304876804; Mon, 13 Feb
 2023 08:14:36 -0800 (PST)
MIME-Version: 1.0
References: <20230210010558.10621-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20230210010558.10621-1-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Feb 2023 11:14:25 -0500
Message-ID: <CADnq5_OR9QN7yXhEF2SJ4oRtX3uLtwCT6WCWTcNj0ibj7Azptw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: clean up some inconsistent
 indentings
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: sunpeng.li@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Feb 9, 2023 at 8:06 PM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_factory.c:145 get_ddc_line() warn: inconsistent indenting
> drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_factory.c:201 dc_link_construct_phy() warn: inconsistent indenting
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4026
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/link/link_factory.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_factory.c b/drivers/gpu/drm/amd/display/dc/link/link_factory.c
> index 13a766273755..23f668d90460 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/link_factory.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/link_factory.c
> @@ -142,7 +142,7 @@ static enum channel_id get_ddc_line(struct dc_link *link)
>         struct ddc *ddc;
>         enum channel_id channel;
>
> -               channel = CHANNEL_ID_UNKNOWN;
> +       channel = CHANNEL_ID_UNKNOWN;
>
>         ddc = get_ddc_pin(link->ddc);
>
> @@ -196,8 +196,8 @@ static bool dc_link_construct_phy(struct dc_link *link,
>
>         DC_LOGGER_INIT(dc_ctx->logger);
>
> -               link->irq_source_hpd = DC_IRQ_SOURCE_INVALID;
> -               link->irq_source_hpd_rx = DC_IRQ_SOURCE_INVALID;
> +       link->irq_source_hpd = DC_IRQ_SOURCE_INVALID;
> +       link->irq_source_hpd_rx = DC_IRQ_SOURCE_INVALID;
>         link->link_status.dpcd_caps = &link->dpcd_caps;
>
>         link->dc = init_params->dc;
> --
> 2.20.1.7.g153144c
>

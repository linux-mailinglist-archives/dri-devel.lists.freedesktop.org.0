Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAD050B56D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 12:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3927E10E029;
	Fri, 22 Apr 2022 10:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8847E10E046
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 10:42:08 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id b95so13760197ybi.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 03:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sRlCrOg5yqyYWcX3Vmg+YXtz00jXFt02K1SvmfVHuEo=;
 b=YZKNNVCdCW1H9YpHWN2WwcXTeHpzenuCACQWt1cFsofkPWDjj+CZhGo5qBz34bXMrL
 a8sGChDb4rj11K4jsnxJQrpcCmi/sg7315+vVhjz+9kcNVq0RLVpAunksA3AeNO7kccO
 QnNI74QbFKhy8/7Hn2169LoSjveGvAA/Z6ar8aCW0HQP89inqH/9L9x7cFs3j0YJMi24
 Vjl4hdYaqEQWvZhlLqiDMVG79bCKBj8oRlloEsu3mrlqK7q7t842V9yGwDbx4guv3qh6
 zSgBtiXdqIR3W3Eg+4JrHKGcvBwnvXDx2oadjegPOLpPoCnkhqXvmyP5PynUzjZz/MkE
 hD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sRlCrOg5yqyYWcX3Vmg+YXtz00jXFt02K1SvmfVHuEo=;
 b=jqeIwYaEFaCEaDO5wqVMkUiOTEPhofFl4V8uxb3CIV/pvIKzLYQQ6domMp9IhL0Yxk
 sBUJgq015Bdmlhz0dwOe37yEMHB481Se8VyOE2Nj41rEtTZoQzDIvcxZS38CtzY40iEo
 tYDk9EfBkAc3XimGBJRR0NCG/4eLi9mkwbSMVPqyCrOemBnV5j2yhvV50rqrwHNHDEWU
 hVTjPhLw3QpUTDVc5SaJQOHFQciOiM6LIW5fbuEDLGKgdTEpbp2gOyH4FQRDA3plldfw
 o91BcsQKwvEHf5WmQdBLme5xC8Ilg2/WcqIzyorOrdXC5ZQC/+FB22B8ip1PcK46XYtu
 rjmQ==
X-Gm-Message-State: AOAM530+mlWvVe2ziWnMCwBxNl1LJ7qXUb9zajqArVoHw4YR2jvsBIqa
 rTizCZffgKipR7OjGs0bCpfZFv01AdHDn9kCjjx2vw==
X-Google-Smtp-Source: ABdhPJy+O9d88W+UfOJ7vyvqvuTfKHdZH3HhJTpSFNYmS29n1nw7GUb9A4Lca7pUm7kxAmK0DqCAl/r83g43Qgqyask=
X-Received: by 2002:a25:d507:0:b0:63d:a541:1a8c with SMTP id
 r7-20020a25d507000000b0063da5411a8cmr3865477ybe.92.1650624127547; Fri, 22 Apr
 2022 03:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220422084951.2776123-1-lv.ruyi@zte.com.cn>
In-Reply-To: <20220422084951.2776123-1-lv.ruyi@zte.com.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Apr 2022 13:41:56 +0300
Message-ID: <CAA8EJpqJrWpRo_DJJdJqSMyDUyJJt3L3S7dNuWw6YeQgsp+TkA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: fix error check return value of
 irq_of_parse_and_map()
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, Lv Ruyi <lv.ruyi@zte.com.cn>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, bjorn.andersson@linaro.org, quic_khsieh@quicinc.com,
 sean@poorly.run, Zeal Robot <zealci@zte.com.cn>, linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Apr 2022 at 11:50, <cgel.zte@gmail.com> wrote:
>
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
>
> The irq_of_parse_and_map() function returns 0 on failure, and does not
> return an negative value.
>
> Fixes:  8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index a42732b67349..3926d2ac107d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1239,7 +1239,7 @@ int dp_display_request_irq(struct msm_dp *dp_display)
>         dp = container_of(dp_display, struct dp_display_private, dp_display);
>
>         dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
> -       if (dp->irq < 0) {
> +       if (!dp->irq) {
>                 rc = dp->irq;
>                 DRM_ERROR("failed to get irq: %d\n", rc);
>                 return rc;
> --
> 2.25.1
>


-- 
With best wishes
Dmitry

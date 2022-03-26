Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0F04E83A0
	for <lists+dri-devel@lfdr.de>; Sat, 26 Mar 2022 20:07:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9CA110E082;
	Sat, 26 Mar 2022 19:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A1710E082
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Mar 2022 19:07:40 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id n135so5924480vkf.6
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Mar 2022 12:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9+ZMgF8rHzqNlDkErLZI/DheSIs9iRBaxXLkva+BiWM=;
 b=MD7VvaQZmHal8Xv/fx01kI1KmByj2fQOUC5MgJ6KApMYVC8a8wU+KoSpFvPXYq0TGZ
 zZ2tBixUPv0UFU5ecP4ePgSX6FGzi52qYj9VBVhnrhp4+XRO0qCg8aKY50WPgsneX8/c
 105dltBOkBstFSRzmSwraSUeA6g4EIHpqMS2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9+ZMgF8rHzqNlDkErLZI/DheSIs9iRBaxXLkva+BiWM=;
 b=r0kn899vKoW/hQR1kx8VK66+EbdHwlSmam4NQeh/8zfQEfE0jTuHVJhghinHuG5FKa
 ss0kSQpniVXpGXGn5kGKKSMxYA6UH/5FySu5+WI4q1BkbGsR5+uhBE3Jifx6bCmiZRDZ
 bPx0slDipkuVyAmAlMx5uoNsuCBhQn2kOHuDJxnRvsSWFZmnYDykX9H9DDitbIOjYXCO
 RB4g/KyMJo19M3KT0K0zW3/yvC0Mk66k3V+DBI7LlruyU4tYoTPPwtIB9UGgA/5nVtoS
 NbBx3VT5ksqSjm+VOTTQD5fkPQ2Tw0xBBZOMZw7yXym4vD0kiSoATp25CHiP0REFd96W
 7SJw==
X-Gm-Message-State: AOAM532dcPkFDOzptHFC+I5m3iNEAkksV8RNCb9vUd0J7YH6mhN8+HW7
 T2PINb7G9Q/HT5Egrxan0MXAgA3KdI+wfOXlOOqiCg==
X-Google-Smtp-Source: ABdhPJz7w1eEIH1Yjli6v9gw/q4r6yOcjoplh2ugVMhe4rGKmJyp/buoks/Yv7HcJOH7R6CVnmvS6bbI6l+0An3OS2U=
X-Received: by 2002:a05:6122:1245:b0:33f:e889:f353 with SMTP id
 b5-20020a056122124500b0033fe889f353mr5624016vkp.17.1648321659222; Sat, 26 Mar
 2022 12:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220326073326.3389347-1-yangyingliang@huawei.com>
In-Reply-To: <20220326073326.3389347-1-yangyingliang@huawei.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Sun, 27 Mar 2022 03:07:13 +0800
Message-ID: <CAJMQK-hA+k8hsQiBq7v9QROQyDkrzy+J40b2uF4AcmrXDe0gKw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: add missing destroy_workqueue() in
 anx7625_i2c_probe()
To: Yang Yingliang <yangyingliang@huawei.com>
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
Cc: robert.foss@linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, xji@analogixsemi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 26, 2022 at 3:24 PM Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> Add the missing destroy_workqueue() before return from
> anx7625_i2c_probe() in the error handling case.
>
> Fixes: adca62ec370c ("drm/bridge: anx7625: Support reading edid through aux channel")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>

>  drivers/gpu/drm/bridge/analogix/anx7625.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 31ecf5626f1d..1895e3448c02 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2654,7 +2654,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>         if (ret) {
>                 if (ret != -EPROBE_DEFER)
>                         DRM_DEV_ERROR(dev, "fail to parse DT : %d\n", ret);
> -               return ret;
> +               goto free_wq;
>         }
>
>         if (anx7625_register_i2c_dummy_clients(platform, client) != 0) {
> @@ -2669,7 +2669,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>         pm_suspend_ignore_children(dev, true);
>         ret = devm_add_action_or_reset(dev, anx7625_runtime_disable, dev);
>         if (ret)
> -               return ret;
> +               goto free_wq;
>
>         if (!platform->pdata.low_power_mode) {
>                 anx7625_disable_pd_protocol(platform);
> --
> 2.25.1
>

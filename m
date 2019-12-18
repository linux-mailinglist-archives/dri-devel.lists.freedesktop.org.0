Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ADB124938
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 15:16:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9BB6E2DA;
	Wed, 18 Dec 2019 14:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E316E038;
 Wed, 18 Dec 2019 14:15:56 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id p8so2346772ljg.0;
 Wed, 18 Dec 2019 06:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vElzyrLLbOAfEd/SjURJfSBcOl1qaMizRDyquQbiEIU=;
 b=EY1p3Ms7ACguK+t+9jszqcFTKZPHbemKLA/TTrXYUM24Z6U+NLLtuaF2o5Hzju0HdK
 LThLApU05fbPDXfRZUsdf69Eptkel6kv/mDd5vWxF1x1GP3Jz2g57ymUxeekZne+now0
 ru/NH3JzwXnrManDiZnBKEwdg/rkJ3+KwY2kAgHJBB9pfS0k25gBktP5BXAUJuQzwoDi
 boRyQKsj4fL96/dxt8TZSYQboz8UUBIR1gFK84y9DT8XGL+iZS839EMN2WpJtvjpEKYB
 CwJelRrYIW3DupulMju3bNix+GYawNd/NyHUhEfNWxnKCcbkP3nk748R3xaxx/vRlzjH
 jVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vElzyrLLbOAfEd/SjURJfSBcOl1qaMizRDyquQbiEIU=;
 b=YRcFRwPbZLrCBwm2dwp/KkFJkz14X2afQrGpk4NT0Ur5968A20UHz6g64GZACzRUdZ
 jq/PfhpqYjad+NKaUevq3OXZhQJ0hwOfr6wj4hIl+b46E5E60vmXXMLbOxC7XV3WkZsS
 YCKYtQR2Ll5VgPRyMXcYWmVuqA6I9s5qs49qb6PWX+ydglVf5dbQMxtR/nrDw7Pk9MCi
 RlKvw4bWVHlFbaRCsPWlkL/MqthZ4HW9vm+qUMY+rfe/au7SxsPRezTGRNQf/wHcbszM
 5+6900Rk/CX5NigVzvSC7soFXBwvNP/f5vVGL/nhsjToRH2l5Vbg8FCuWECAhRYjv5wR
 oaPw==
X-Gm-Message-State: APjAAAW1UXUMzhLS55OmcASZ4nyzP0vLZNFiXNfwtUq8lzb4rWn/3m0z
 Iu35S2QJ3fQdeJ+kVV4Khi4Qag0brSOBT0lkAUo=
X-Google-Smtp-Source: APXvYqxQaMetKsP7tlWdjAWGP6YEt/iylWCstVvZdqsFmGbCXQZiIpZEDdGWngizWZdz7PQlMwgSzUKMbgDyy6pS8UA=
X-Received: by 2002:a2e:814e:: with SMTP id t14mr1878668ljg.149.1576678554801; 
 Wed, 18 Dec 2019 06:15:54 -0800 (PST)
MIME-Version: 1.0
References: <20191210231145.24838-1-festevam@gmail.com>
In-Reply-To: <20191210231145.24838-1-festevam@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 18 Dec 2019 11:15:50 -0300
Message-ID: <CAOMZO5CHZF99cMUMfOpdJ2i94k2TGie7ctZqZMeev97hMd1MfA@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/msm/adreno: Do not print error on
 "qcom,gpu-pwrlevels" absence
To: Rob Clark <robdclark@gmail.com>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Tue, Dec 10, 2019 at 8:12 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Booting the adreno driver on a imx53 board leads to the following
> error message:
>
> adreno 30000000.gpu: [drm:adreno_gpu_init] *ERROR* Could not find the GPU powerlevels
>
> As the "qcom,gpu-pwrlevels" property is optional and never present on
> i.MX5, turn the message into debug level instead.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> Trying once again :-)
>
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 0783e4b5486a..5d7bdb4c83cc 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -826,7 +826,7 @@ static int adreno_get_legacy_pwrlevels(struct device *dev)
>
>         node = of_get_compatible_child(dev->of_node, "qcom,gpu-pwrlevels");
>         if (!node) {
> -               DRM_DEV_ERROR(dev, "Could not find the GPU powerlevels\n");
> +               DRM_DEV_DEBUG(dev, "Could not find the GPU powerlevels\n");

A gentle ping...
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

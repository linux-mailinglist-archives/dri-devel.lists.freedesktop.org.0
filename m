Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49691133DF2
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 10:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB936E19A;
	Wed,  8 Jan 2020 09:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B6C6E19A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 09:12:47 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id h23so2509727ljc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2020 01:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NSRXBmbI4K9SJWTndImb6/QuzMsMIzFzBHbV5ZWEJ8g=;
 b=V3nD0GB4Xcs+Bk2fajfsc/L0TAJmnRzgImnFRpf94E3COREr1g6UzDhtf2aMxtdYlh
 28sdhiGJ3TKb33HK76E+bwxi0vgF5GpQ0gOyCazOnmYTswARFDkErWkncOl9BSrLHteu
 1C7TmLu2JpvR8xAeIzMijnuDoTUSOprW11/ufFflVrRC087MeX5VNhldArAm64qZMZul
 TmpwLdoRwiL4VEkpdjKc+lWbljyQio+67ZhQmC2zt/DKS5flWg0R+fXBChu1pFn6culH
 l65wG2yqKdwc+2RPlD62iqkUuI79TLzsn6pvusXN0gOVePsjzazHrzFV0G+KZJ9PIcNb
 N1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NSRXBmbI4K9SJWTndImb6/QuzMsMIzFzBHbV5ZWEJ8g=;
 b=I6KaizQcpsLNw32GCdnEIWRyNUWI/eAzH4/CWPWSXXBblT98wosR/zXAOATHQWNBmX
 Zstu4BY3UvhkaACmovm6v/1uw4pyhtjEfQJoc3wfqTGi9ipp6uIKIUoLOQ9MPW8W+630
 SGhRWBpAoLB5JzSdFgCO5cy4CtB7D2vBeVlDpYrUvkV/YZzqC27gNafWUiZ4iu456h+E
 ldnYZzHFppiQUQ2mEikGI4ZG2BAo09Zi7qfrRznHfoDIwpwB4jvJaUeFQNSAW/IYO4GG
 Y2d+gTPzZvUyCeCRqQ1KPc5dM0oIYKPe8cCkey5KeoNATqVcM9BH3/YTzr9Zuu2trIo6
 4ohw==
X-Gm-Message-State: APjAAAX/qVEIyDHS3AFmbK9UJ6Zo4eBWDPePVurXuDgU0X7wvA0G2Fbq
 d1sBxXv3Yj/lsKP+sd+aCUsMFyaYsPz3wDDd6z8=
X-Google-Smtp-Source: APXvYqxpyQq/UHQabiIuF0OTy3EUrOivAw+JIegqNL6S3XfcYZPfmTToE1h8OTmr2MLDXAAjlUZxueDRFDuVv2RTBzM=
X-Received: by 2002:a05:651c:1214:: with SMTP id
 i20mr2287435lja.107.1578474766167; 
 Wed, 08 Jan 2020 01:12:46 -0800 (PST)
MIME-Version: 1.0
References: <20191227114811.14907-1-chenzhou10@huawei.com>
In-Reply-To: <20191227114811.14907-1-chenzhou10@huawei.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 8 Jan 2020 10:12:35 +0100
Message-ID: <CAMeQTsY2+9Z1ShVrp1AbQo4+VbVymHrv2meg7353=YDoWbFeLw@mail.gmail.com>
Subject: Re: [PATCH next] drm/gma500: remove set but not used variables
 'hist_reg'
To: Chen Zhou <chenzhou10@huawei.com>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 27, 2019 at 12:52 PM Chen Zhou <chenzhou10@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/gpu/drm/gma500/psb_irq.c: In function psb_irq_turn_off_dpst:
> drivers/gpu/drm/gma500/psb_irq.c:473:6:
>         warning: variable hist_reg set but not used [-Wunused-but-set-variable]
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>

Applied to drm-misc-next

Thanks
Patrik

> ---
>  drivers/gpu/drm/gma500/psb_irq.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
> index 40a37e4..91f9001 100644
> --- a/drivers/gpu/drm/gma500/psb_irq.c
> +++ b/drivers/gpu/drm/gma500/psb_irq.c
> @@ -470,12 +470,11 @@ void psb_irq_turn_off_dpst(struct drm_device *dev)
>  {
>         struct drm_psb_private *dev_priv =
>             (struct drm_psb_private *) dev->dev_private;
> -       u32 hist_reg;
>         u32 pwm_reg;
>
>         if (gma_power_begin(dev, false)) {
>                 PSB_WVDC32(0x00000000, HISTOGRAM_INT_CONTROL);
> -               hist_reg = PSB_RVDC32(HISTOGRAM_INT_CONTROL);
> +               PSB_RVDC32(HISTOGRAM_INT_CONTROL);
>
>                 psb_disable_pipestat(dev_priv, 0, PIPE_DPST_EVENT_ENABLE);
>
> --
> 2.7.4
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

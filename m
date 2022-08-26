Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E03005A3091
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 22:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBA610E3F6;
	Fri, 26 Aug 2022 20:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5056F10E3F6;
 Fri, 26 Aug 2022 20:41:27 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-11c4d7d4683so3513778fac.8; 
 Fri, 26 Aug 2022 13:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=K/ePAycXqy51oFeXUt6JjGKkq1z8q/7xr7tRKH3+c5k=;
 b=obakSEJ4izX3iVZj3KOtetmevh8RAX2xSvFVa7lOs66USdVv4m+7jIkQj1Ee92YRzX
 vwdQC9/B3BhuefYfKDrm9t20eHKN0JvZbcXejyyvF1paXlrHa7K9Wjwgp7oKCM2jvMQG
 tKJBFGvX0TDPsP1Y8Meus7j6M++aQddvKd28Xm7kNzV8c39UusrUtqyaCZrF0TjA7sKO
 ZDm2gjuL77EL/lFb51mfkRWM5tyJwN5OaU0+A1uaIOGh1me6gckcgIhe0e18w4USDjqW
 Hv6ildtotiYcRQgWJTMDj1UsfIthh++fIZ7OAe/gIwNrxolE1eBJNegl5ScCqzJJBjfW
 5eHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=K/ePAycXqy51oFeXUt6JjGKkq1z8q/7xr7tRKH3+c5k=;
 b=1sy8Yo7oy4mU+gVcuzttolh3RV++vJpluuYk9SiGKjQeRaUzfylpX6X55xEP8HHup6
 f08dtgwIsbrElEdGu6IBlE2BptjXZbsBLl7bg6OfwTc75iYK2uN/w7w4YWLfiUdMFXVd
 EH8h5kyei62Gc0q5EB/DS7n1SwdnGsnJmhGj9m1Y34/H5+hazZb49VhWSbhH62DA5Kvz
 TrEgS5IQ8bunicHaTX8PTIds1cfc6u0daTtzPlpdSMIRqncTmXh4ZQXGrL2jedNjxygP
 TdSHF4oUS3lm9joZyA76ysKfsQMWU7Hg6tkugqJlsAluQlABhQ3JV4hGnvJIDiEwo6XD
 XYdg==
X-Gm-Message-State: ACgBeo1ZdnYHAtel8FRZyZIZpOFLXFx6YLJED3VsqMxcYyarbOHoXWv6
 7c0rGxTrVt6sD2eizt6y7Ccx/iG9J92NBBtEJw0ncQku
X-Google-Smtp-Source: AA6agR5p3NlrcAZYv3F09Emqjq7q5ADXiA7NQoyGpPUgZIrMlZUDjjJKMUTRMnsyxm2Jxr1CWDWn1fP7ntCneyFCZWk=
X-Received: by 2002:a05:6870:3484:b0:11e:4465:3d9b with SMTP id
 n4-20020a056870348400b0011e44653d9bmr2878995oah.46.1661546486597; Fri, 26 Aug
 2022 13:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220826085754.2296572-1-yangyingliang@huawei.com>
In-Reply-To: <20220826085754.2296572-1-yangyingliang@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 26 Aug 2022 16:41:15 -0400
Message-ID: <CADnq5_NomUqdzmoYcsPuOiFP9BCCiC=Vtt3AGiXqc=SmP6SODA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amdgpu: add missing pci_disable_device() in
 amdgpu_pmops_runtime_resume()
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 pavan.ramayanam@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Aug 26, 2022 at 4:50 AM Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> Add missing pci_disable_device() if amdgpu_device_resume() fails.
>
> Fixes: 8e4d5d43cc6c ("drm/amdgpu: Handling of amdgpu_device_resume return value for graceful teardown")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 429fcdf28836..de7144b06e93 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2563,8 +2563,11 @@ static int amdgpu_pmops_runtime_resume(struct device *dev)
>                 amdgpu_device_baco_exit(drm_dev);
>         }
>         ret = amdgpu_device_resume(drm_dev, false);
> -       if (ret)
> +       if (ret) {
> +               if (amdgpu_device_supports_px(drm_dev))
> +                       pci_disable_device(pdev);
>                 return ret;
> +       }
>
>         if (amdgpu_device_supports_px(drm_dev))
>                 drm_dev->switch_power_state = DRM_SWITCH_POWER_ON;
> --
> 2.25.1
>

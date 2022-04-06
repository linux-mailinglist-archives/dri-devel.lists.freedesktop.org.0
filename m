Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE924F56D2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 09:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9BA10F49A;
	Wed,  6 Apr 2022 07:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2288410F499
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 07:27:31 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id o20so1203626pla.13
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 00:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FKzm3ts/p6RnszpnwSKsUwR1wyDzLKNmtQRoYiUd/Hk=;
 b=OMyV3E+AUaGadK52HWRLwkBXPhxNoHdBTufKc2Zw5jOXf1FfHJ7YSdn9KDcAfcO3L4
 KPyMtDrvp9R/V/E9HpxKDmQkvcbtxHwLz6/eEupW86fjupzGHc6nwHPVU4MnRRQp0A+b
 AsQDD2OwDe6ln8Isy5Toheh2tPcF6LJ4iPWL/ZYTZRyhwb+/QWJ4fr3FYwhGYEH+hP2t
 bu1FESE8ZLYGeyMzpkdptkuMf9QS8qBJAq+3gMuKNMF8pEnAWCGr9qFyaysmEztj2Nec
 +PNpclku4O/k4c+/8bw1IihP9xOrI9yceEdXfY7Yr5qTZwKifoLgVTbYGEuYubS/b2hf
 TFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FKzm3ts/p6RnszpnwSKsUwR1wyDzLKNmtQRoYiUd/Hk=;
 b=R6/LrKPiQsj/8VfwXPb5ghTitqCX6M57xjOk8Mhjayb2Z+bteDwxsTKfbLVMypd6TD
 g11mjkgyo8ovsZdCW8uUbKyzw1jSDTen26+NgABGpgYSsLXkjP+vBJwF6rNKiYTEhW1u
 dp+Cpz9woCBZQCQwErpj+ur58vJe8a0hGknBx4Skwq8735lMdPAWpniSIbAHyw6ky7Pj
 0QU7q3gYXucexy5JNQaI4eIz3xGO0aQglFhekdUpUXI1z3N3spViMVakSjXH0XXiTs9G
 ydCgcHhDuLIH9HSdTxIJW8cS4lhp04kwmOl8Y7tpNjzMGD+lj/Clekw11NU1IBKgxU/6
 Zv/A==
X-Gm-Message-State: AOAM532HI9wan+/7V1YcEw9Xb92mMNCjxj8Woh4HBIyxJyp4ezxeZLWx
 GNJAb0xYu7i/w+/n/etFCi8nnjwgc/HCku0PM1Q=
X-Google-Smtp-Source: ABdhPJxFRMVQkG3dZ4jB+r4LgFBIFnZkirPkN4hRK9dO72zMJqI8mtPvMiSYiqpivMhRFM13LUEFyvkca8bOcT97nTQ=
X-Received: by 2002:a17:902:7e0d:b0:156:47a4:a7c4 with SMTP id
 b13-20020a1709027e0d00b0015647a4a7c4mr7534354plm.141.1649230050621; Wed, 06
 Apr 2022 00:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220401115811.9656-1-xiam0nd.tong@gmail.com>
In-Reply-To: <20220401115811.9656-1-xiam0nd.tong@gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 6 Apr 2022 09:27:19 +0200
Message-ID: <CAMeQTsbK+Akk0m3UUCx-U9F6ju_OVM0R6uZN5KB-Gu6C6Do1pw@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: fix a missing break in psb_driver_load
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 1, 2022 at 1:58 PM Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:
>
> Instead of exiting the loop as expected when an entry is found, the
> list_for_each_entry() continues until the traversal is complete. To
> avoid potential executing 'ret = gma_backlight_init(dev);' repeatly,
> break the loop when the entry is found.
>
> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
> ---
>  drivers/gpu/drm/gma500/psb_drv.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
> index 2aff54d505e2..b61a8b0eea38 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.c
> +++ b/drivers/gpu/drm/gma500/psb_drv.c
> @@ -402,6 +402,9 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
>                         ret = gma_backlight_init(dev);
>                         break;
>                 }
> +
> +               if (!ret)
> +                       break;

Hi,
We cannot do it like this either. If the first connector isn't LVDS or
MIPI we would just break out of the iteration because ret is
presumably 0 at start and gma_backlight_init() would never run.

-Patrik

>         }
>         drm_connector_list_iter_end(&conn_iter);
>
> --
> 2.17.1
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1FB53B4DC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 10:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D653F10E5F4;
	Thu,  2 Jun 2022 08:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4180C10E5F4
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 08:18:53 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id q123so4148211pgq.6
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 01:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9x70fvT7190YbXzYteL9ewuvFT6uvelNfhT9PEGH0Jo=;
 b=l3pImPs02AnbeW4PG6d/LLREKZDDPuOgmTR7BZEc8TFrQLuOHeR5H7dBdjLTSUIMJq
 MW2ss1m0nACsyV8pT5yo14DvK6odeFduMzd+hFmR1X1ymeFIqUba+q7gQJTR0O5fx8GV
 YM+SaHyioTlula8sifqJ+/RZtFC0G12A0gP5mvZWZaf/WAJR34YssAkGLHRRsmeEBkDo
 DA28WTc89C+tVtCBx00I3whLNqR7i/sRfb8gQXMJVJUy0Ph/565BWG+474XPruA6OGrO
 awIKjmmKhQn/Psondu1fRyAWE4+XSImuJR99/VLdvbNnq1+DjQTBL7rkbtEuN5joZi8D
 2W0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9x70fvT7190YbXzYteL9ewuvFT6uvelNfhT9PEGH0Jo=;
 b=h5uJx87YKblENgbV7M/P88ZzaKZVrP37QrP9eSJEkOt1H1Lbo3Yjd96yA7ukd4/W+e
 M+nJSpby6PNABEAhb3hf9CigzVLXmVE0/L1+e568z78PobATI/IwEWyKmDc2F/aFZRA9
 a97pLt8sjUXH12Iyr9pHAfVVX8YAmLmR6kJOEkbwLJv/b/Jb7xVfoZpGLRgLfCNpFJry
 Utec9NYGNEuMusRPdLDG7Cedpgv9kl+b4x3BhYFpWJjvIZHua9NVSIp/QmyV+AzoY7ka
 z3m+E3DFC9HQkzdgtRluDD0M7NtjxSpfTgjzacM+xfFJTOG2qi2BhlKXjoy0XRQN1UoV
 zyKg==
X-Gm-Message-State: AOAM531/PSLGVWtFxuIG5Uzdjs+CPwxZ2r8D+lU2qoDv8b1UIdMgKR3I
 dJghiXtmaATlHIrh6B6drK9UTy2VmXznrwHj+/A=
X-Google-Smtp-Source: ABdhPJyG4+cUsja7ESmtAXhM7XYcDz7HxGU78eyY7PjZw8CmobXFOmEGx/kKArbjttnCiuftnEG8a5gfQ6QWrpsd1JI=
X-Received: by 2002:a63:8749:0:b0:3fc:9fd7:1e20 with SMTP id
 i70-20020a638749000000b003fc9fd71e20mr3253985pge.619.1654157932832; Thu, 02
 Jun 2022 01:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220505080954.84416-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20220505080954.84416-1-jiapeng.chong@linux.alibaba.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 2 Jun 2022 10:18:41 +0200
Message-ID: <CAMeQTsZVaqw8oj+Ovk+jbKK83XJ10e4XdE7=ibHBRs=BcE_v0g@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: Clean up some inconsistent indenting
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
Cc: David Airlie <airlied@linux.ie>, Abaci Robot <abaci@linux.alibaba.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 5, 2022 at 10:10 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Eliminate the follow smatch warning:
>
> drivers/gpu/drm/gma500/cdv_device.c:250 cdv_errata() warn:
> inconsistent indenting.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Hi Jiapeng,
One entire patch to remove a single whitespace seems a bit excessive.
Would you mind fixing a few more of the code style issues in
cdv_device.c while you're at it?

Checkpatch can give you a few hints:
./scripts/checkpatch.pl -f drivers/gpu/drm/gma500/cdv_device.c

Thanks
Patrik

> ---
>  drivers/gpu/drm/gma500/cdv_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/gma500/cdv_device.c b/drivers/gpu/drm/gma500/cdv_device.c
> index dd32b484dd82..09684c42cbf6 100644
> --- a/drivers/gpu/drm/gma500/cdv_device.c
> +++ b/drivers/gpu/drm/gma500/cdv_device.c
> @@ -247,7 +247,7 @@ static void cdv_errata(struct drm_device *dev)
>          *      Bonus Launch to work around the issue, by degrading
>          *      performance.
>          */
> -        CDV_MSG_WRITE32(pci_domain_nr(pdev->bus), 3, 0x30, 0x08027108);
> +       CDV_MSG_WRITE32(pci_domain_nr(pdev->bus), 3, 0x30, 0x08027108);
>  }
>
>  /**
> --
> 2.20.1.7.g153144c
>

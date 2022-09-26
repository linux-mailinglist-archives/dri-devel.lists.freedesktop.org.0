Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAC15EB080
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 20:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB30D10E788;
	Mon, 26 Sep 2022 18:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D36810E08D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 18:49:43 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id lc7so16196921ejb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 11:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=4NYxgBCy61KE2DpMIQzG7XwqLg0XUKMJLHwDukFM71g=;
 b=WRwDVDskPoJtCmLDaGKj7MajqWr/IC+X+ehCo2GdM38soGAE92/3+tUaGUPsUBK16U
 f/mCAYIaG7+He0ZRR7aEvXC9FvENLwQiKPoS7BubKcqG1YN5xES9HRcT6nfKe8HPZUKN
 kJLXb8b2PNo4HWyZbMTM/JPl19rVGd9efFEY69a30Ot09fHCgATGfS+4F97gweIRHWTN
 TbR/74o1TBmdbufRp5w/V0qwcRRrZPX1SVqcdMH3JyKXjM13nMMEvFHZH7HJVJ9khIvN
 BaZhl75eWiwELstKjd3HA4kd8aBzOenCOjtr7lkFLtSAjVfcR0x8t51JwCMKdW+8Wnzh
 R2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=4NYxgBCy61KE2DpMIQzG7XwqLg0XUKMJLHwDukFM71g=;
 b=lvfjJ+nOOhg8H8T3yPG0RzxhIyyqOpfmOoXbshzexQZ+FcGIdEThF8KIKnkql61gjk
 hUIZYZHkdCxzBNjBAqeXx/Qbo/zCGF+HWruU64lanTyBEQCnb+zBAXS0wtxAaqyWsEJH
 MqMhaGJKLdIH7ZTIte2EogQOl+Zz4fEq6+APNpA7rBMfa5HFsYd0ncsrvDiKz/b/ODXy
 d0pDyT2oclpab9Nh4yaoPVZBhXWE3S6VIYhIa3rxsv2kURZXVUT5+dXoaviPNw774YZF
 ltUBpy322OI3Bk6fL+EB5pS1Pa06GcDBaXFdEOCce/3dERpTz//GJH5h/NP18Qsn9aKV
 JdIA==
X-Gm-Message-State: ACrzQf3vNOoTFxH00NJf9uCw8eNCj9nLwV6LwiI81WFqlC6zfPU0zOOP
 LC4OhcC838rA4/wqi0okk3lViixdR4ili+SMCXg=
X-Google-Smtp-Source: AMsMyM6HQ2MlV4QhnFMeH0w5fCQRLjmZlL/DQ91O7L+18zeFe4GsMZudusU9gtKm3YA27hZExgR9L71GygrRHwW06vQ=
X-Received: by 2002:a17:906:8a6b:b0:780:ab37:b63 with SMTP id
 hy11-20020a1709068a6b00b00780ab370b63mr19126110ejc.365.1664218182085; Mon, 26
 Sep 2022 11:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220923063533.239315-1-ye.xingchen@zte.com.cn>
 <YzGo2o3bVLnOiQJr@maple.lan>
In-Reply-To: <YzGo2o3bVLnOiQJr@maple.lan>
From: Han Jingoo <jingoohan1@gmail.com>
Date: Mon, 26 Sep 2022 11:49:30 -0700
Message-ID: <CAPOBaE7sMPR9YgfLV2Y12E=jxO72PhOzJ=G=tdTkN-Af1CMuRA@mail.gmail.com>
Subject: Re: [PATCH linux-next] backlight: lp8788: use sysfs_emit() to instead
 of scnprintf()
To: Daniel Thompson <daniel.thompson@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org, cgel.zte@gmail.com, deller@gmx.de,
 lee@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ye xingchen <ye.xingchen@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 26, 2022 Daniel Thompson <daniel.thompson@linaro.org> wrote:
>
> On Fri, Sep 23, 2022 at 06:35:33AM +0000, cgel.zte@gmail.com wrote:
> > From: ye xingchen <ye.xingchen@zte.com.cn>
> >
> > Replace the open-code with sysfs_emit() to simplify the code.
> >
> > Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> > ---
> >  drivers/video/backlight/lp8788_bl.c | 2 +-
>
> This one has the subject right and is a good change. However I'd still
> prefer it as a single patchset that fixes *all* instances of this code
> pattern.

Yes, I agree with Daniel's opinion.

Xingchen,
Please make a "Single" patch for including "ALL" fixes
for this pattern in the 'drivers/video/backlight' directory.
Thank you.

Best regards,
Jingoo Han

>
>
> Daniel.

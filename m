Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B7C419F17
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 21:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7B66E859;
	Mon, 27 Sep 2021 19:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1C86E856;
 Mon, 27 Sep 2021 19:25:59 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 5-20020a9d0685000000b0054706d7b8e5so25888214otx.3; 
 Mon, 27 Sep 2021 12:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MCXAWoe2hPDnl6UuxlpuLdgfQU364PBppRCGEYPmVb0=;
 b=mbGQxRgTqATeGY9NASfmguVg9jvSV3496BTmre+jw8LnT1PyWF8ESk/hhQZxTVuXRx
 RA7MY1ggMsy5TuPRrLIEOz2dvGlIe64Bbnb4wSr5ACfkekarDHL0ivpJsBmEvrtkfI0V
 zphtnmLnFCsr3w2K+6yIkZzaPhCki9gXOQ2fwxoWTu47/duXoQFDKIyVF3RrB2Yki8Pn
 XivF82i72WACsannApXQrVsjOSysc1txsJspoawaGIjVY/+sdyQLwtFX052+DrgaHNrK
 7rEsSsKTQeDygsLqRtt8QIgDYWhWRBSZtaEg7elSQnKC3XWr1Uu8m63RL3JW3BXhnv1X
 nDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MCXAWoe2hPDnl6UuxlpuLdgfQU364PBppRCGEYPmVb0=;
 b=as6c8K0yOI8iHRtWR/Y33kM0pT3+a66UWqm0g2t6Tc75uKnLMPpq5boUOcChnUAm7E
 R3aM35QW3PUn4yb7+gHTCPFuPdQKSCCHEm73y1e2h/7mOdu/Chqw7cNJAlnJsYe/Pevu
 uP4uLR/kGZcKfJ/5ct70f2KATgbGSt3keHXrTj2KYQTSS+Ixc8ruTX+YjjSuwqvh6I6q
 gkw2aGVb7W/LbsbDFOhcDglIINB9kA4jk7m8YvYXXwf9Sub3ocz50AT5AdViMgO7X6Z4
 d1vIXUhhV+QpGO16/RFD32CAi5uv4oUmfnx8cTNILXJjZY3iVRW64KvImuBSO8BLG/pM
 huOw==
X-Gm-Message-State: AOAM531CvSD9FFllQoYX2r5AqK7Q/s92RfzJMbSQ8AEeTic2ZOsV9yol
 oF/RCtCWQtRg+n2qWrUK6nCqojW6RG/XevbYSIo=
X-Google-Smtp-Source: ABdhPJzvL6jbsH32X8drgu7cUpkFkANqhgHe2V/FPLLTmzQetUIWUmnyOAuAliaEv2uj54t9YSXftSws04/L1i21t5s=
X-Received: by 2002:a9d:6d14:: with SMTP id o20mr1475135otp.357.1632770758956; 
 Mon, 27 Sep 2021 12:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <1632640580-61609-1-git-send-email-yang.lee@linux.alibaba.com>
 <CAFeW=pYwkZ8=pVi9f-kHGwr-7Gb2OuWYd=LPzHt+yPWRP_gn8w@mail.gmail.com>
In-Reply-To: <CAFeW=pYwkZ8=pVi9f-kHGwr-7Gb2OuWYd=LPzHt+yPWRP_gn8w@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Sep 2021 15:25:48 -0400
Message-ID: <CADnq5_Oi15o3Ok8rDF19bTi_Nzw2mXaF-+v1oH0Ni4bS8pvfpw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: fix resource_size.cocci warnings
To: Amos Jianjun Kong <kongjianjun@gmail.com>
Cc: Yang Li <yang.lee@linux.alibaba.com>, Dave Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, "Kuehling, Felix" <Felix.Kuehling@amd.com>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Sun, Sep 26, 2021 at 3:10 PM Amos Jianjun Kong <kongjianjun@gmail.com> wrote:
>
> On Sun, Sep 26, 2021 at 3:17 PM Yang Li <yang.lee@linux.alibaba.com> wrote:
>>
>> Use resource_size function on resource object
>> instead of explicit computation.
>>
>> Clean up coccicheck warning:
>> ./drivers/gpu/drm/amd/amdkfd/kfd_migrate.c:905:10-13: ERROR: Missing
>> resource_size with res
>>
>> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
>> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
>> ---
>>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> index 4a16e3c..f53e17a 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> @@ -901,8 +901,7 @@ int svm_migrate_init(struct amdgpu_device *adev)
>>
>>                 /* Disable SVM support capability */
>>                 pgmap->type = 0;
>> -               devm_release_mem_region(adev->dev, res->start,
>> -                                       res->end - res->start + 1);
>> +               devm_release_mem_region(adev->dev, res->start, resource_size(res));
>
>
> Looks good.
> Reviewed-by: Amos Kong <kongjianjun@gmail.com>
>
>
>>
>>                 return PTR_ERR(r);
>>         }
>>
>> --
>> 1.8.3.1
>>

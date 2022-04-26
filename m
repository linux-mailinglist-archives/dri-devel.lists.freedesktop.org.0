Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4665100EE
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 16:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3217810E3FD;
	Tue, 26 Apr 2022 14:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F84410E3B6;
 Tue, 26 Apr 2022 14:51:02 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 t6-20020a056830224600b00605491a5cd7so13179557otd.13; 
 Tue, 26 Apr 2022 07:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mjUtCSyBnFk8A3kTILIrriQceuNIreHcu/IG7ob7Yjw=;
 b=eEihIfAYOPixN4pXa9pV6rApPJ/mm+Ff36ssgjFVVtp6lXlr8xUkUFSXFY2R5btYUh
 e0bPxX4RJNBOBvjBM5mH0kDJOuNImtnNAUiqKNLl1ts5txepBbOJS0W+CxxJ7IqBj5VY
 mWVQN8+pTokpaJ8lG7CWp+dPeEyOulLirq4omYYkDQxB24tGSJmjVU40upQrW4VZcu2s
 ij4AqBttsogwiH4XU2M2l9Dw6xVQLoAc4G5knFHo3/TNUKhJTJgABL5kngE/mPK9Nnw9
 TlL2svtdIEJAh7kW/Xseb/5gzLETsWfkAL0LcBCzi8v1JEEc8rtYynsAuItgiOfC+3gl
 7vYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mjUtCSyBnFk8A3kTILIrriQceuNIreHcu/IG7ob7Yjw=;
 b=goCWJG8vIRLR9o6x6IGivXoAJvlgzUdis/oXOe6Y5MZVBFigZjjEJaQI8qxSg3g8ir
 LLuZiWMhRQ3PkZogc9E4wjKRYsu5NcJJb2oFgaALWYrS5eW9uDCSUKOlTx4EseROV6Id
 TGszzppg8rI7QopEcnt8hIvS66s5x//GCUVL3OSgQeaqzyMBsUVRqXACaXuk0HW8EiGu
 VTf96HJ6TA3ECtAFWp+8ADVYM2qXKEYWNKvmu2RMUkkUnrmqxbJlTYMwZLifi13I4F4F
 po+e43kOerIdAX/E4AoTu8lpB41gY0CeoSXAs8lC1SzdWY0PelT5iis5EitFgzwKSp/Q
 qW0A==
X-Gm-Message-State: AOAM532d2FAk+w/09yO2PXDh+r4+N8OCzA2tC1r8YKPhgo/LowPs7i2M
 IR2Nu6LopZMPaa6UhIYTtO41g6ZJvcuDM2jbxWk=
X-Google-Smtp-Source: ABdhPJwQWZyiDHzcPHPthMVbpOd+wMn9jPepqdWib/QYV5CmxlYnXLUwO6hhH6jHp7CQeRHWTBjQ9784pbyYkooY4Hg=
X-Received: by 2002:a9d:110:0:b0:605:a618:4a68 with SMTP id
 16-20020a9d0110000000b00605a6184a68mr4761422otu.357.1650984661559; Tue, 26
 Apr 2022 07:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220426100616.1411209-1-oushixiong@kylinos.cn>
In-Reply-To: <20220426100616.1411209-1-oushixiong@kylinos.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 26 Apr 2022 10:50:50 -0400
Message-ID: <CADnq5_NC+LckMSBYXHGDohyTB6PbELwtYqAknBgRvR3q7N_LYw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Fix spelling typo in comment
To: oushixiong <oushixiong@kylinos.cn>
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
Cc: xinhui pan <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Jiawei Gu <Jiawei.Gu@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 John Clements <john.clements@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks.

Alex

On Tue, Apr 26, 2022 at 8:56 AM oushixiong <oushixiong@kylinos.cn> wrote:
>
> Signed-off-by: oushixiong <oushixiong@kylinos.cn>
> ---
>  drivers/gpu/drm/amd/include/atomfirmware.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/include/atomfirmware.h b/drivers/gpu/drm/amd/include/atomfirmware.h
> index 7bd763361d6e..b7a1e2116e7e 100644
> --- a/drivers/gpu/drm/amd/include/atomfirmware.h
> +++ b/drivers/gpu/drm/amd/include/atomfirmware.h
> @@ -3,7 +3,7 @@
>  *  File Name      atomfirmware.h
>  *  Project        This is an interface header file between atombios and OS GPU drivers for SoC15 products
>  *
> -*  Description    header file of general definitions for OS nd pre-OS video drivers
> +*  Description    header file of general definitions for OS and pre-OS video drivers
>  *
>  *  Copyright 2014 Advanced Micro Devices, Inc.
>  *
> --
> 2.25.1
>

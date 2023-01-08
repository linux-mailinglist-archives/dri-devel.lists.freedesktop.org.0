Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D45F6615EA
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 15:52:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B00E10E1ED;
	Sun,  8 Jan 2023 14:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDC710E1ED
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 14:51:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A3FCE60C91
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 14:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5144C433F1
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 14:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673189513;
 bh=KjA5BnH8CE2ygFiZf0BIJuiFfY+3yoOv6vwmcQ3/x6c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MgXxwlwGjziPFX9NjwMHPU/CjvQoYLIMU7mBMw++Tg+D2zbt1LAFDwP04eckcZCIv
 oSecZ/CYh1Ml4RGaN9ASgKEQbtEiqBXK+ZrjcnjrJC8IJwCUJI+pUjeTq2uxW2oeug
 qMoUGWut0EGrSPBBPnViu6hPPREBT134/1OOL78ikxnLE7+XnlIRYM0Kt4OW/2Qb/w
 HHuiOzkHLlZkz6lkwaf6XL+WYUvQml1bi8izeE2ckl7HVPeM7gLqS8XXtTYI4HN8fN
 RuFk/eo1Dg+qgcQx8aUMo12erxVhePwAV5N7VZUj5QcPthUlusYSDH8d8aNNoPAiZY
 tHohof8meqWzg==
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-4a2f8ad29d5so82710027b3.8
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 06:51:53 -0800 (PST)
X-Gm-Message-State: AFqh2kpWKhoqtHEB9gXhPlBMcdeRaLB8T+fA56gekk6f9IAuPmyhaHuq
 1B2cprGWXgvMB1uE1PomB/T8qacqpQf/JRWTkiw=
X-Google-Smtp-Source: AMrXdXsm/I+2zXpzZ30pXsubs+V9qnmWOjrp3oDKmo5Sd/U+Sm76tzcvWicAFaOHDSMObStcbbmWMOuIQ/HnPqp2qXU=
X-Received: by 2002:a05:690c:c91:b0:4bd:471e:ed00 with SMTP id
 cm17-20020a05690c0c9100b004bd471eed00mr1822331ywb.487.1673189512831; Sun, 08
 Jan 2023 06:51:52 -0800 (PST)
MIME-Version: 1.0
References: <20230107184827.2837347-1-trix@redhat.com>
In-Reply-To: <20230107184827.2837347-1-trix@redhat.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Sun, 8 Jan 2023 16:51:26 +0200
X-Gmail-Original-Message-ID: <CAFCwf10tOe4H1wyOeJiDk_0NWUAbsNRXemzg1H_6RBsf7Yz8dw@mail.gmail.com>
Message-ID: <CAFCwf10tOe4H1wyOeJiDk_0NWUAbsNRXemzg1H_6RBsf7Yz8dw@mail.gmail.com>
Subject: Re: [PATCH] habanalabs: remove redundant memset
To: Tom Rix <trix@redhat.com>
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
Cc: osharabi@habana.ai, gregkh@linuxfoundation.org, dliberman@habana.ai,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 talcohen@habana.ai, obitton@habana.ai
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 7, 2023 at 8:48 PM Tom Rix <trix@redhat.com> wrote:
>
> From reviewing the code, the line
>   memset(kdata, 0, usize);
> is not needed because kdata is either zeroed by
>   kdata = kzalloc(asize, GFP_KERNEL);
> when allocated at runtime or by
>   char stack_kdata[128] = {0};
> at compile time.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/accel/habanalabs/common/habanalabs_ioctl.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/accel/habanalabs/common/habanalabs_ioctl.c b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
> index 619d56c40b30..949d38527160 100644
> --- a/drivers/accel/habanalabs/common/habanalabs_ioctl.c
> +++ b/drivers/accel/habanalabs/common/habanalabs_ioctl.c
> @@ -1123,8 +1123,6 @@ static long _hl_ioctl(struct file *filep, unsigned int cmd, unsigned long arg,
>                         retcode = -EFAULT;
>                         goto out_err;
>                 }
> -       } else if (cmd & IOC_OUT) {
> -               memset(kdata, 0, usize);
>         }
>
>         retcode = func(hpriv, kdata);
> --
> 2.27.0
>

Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Applied to -next.

Thanks,
Oded

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B16CB8C9CD1
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 14:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70A510E37B;
	Mon, 20 May 2024 12:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sIHpW8zh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F0010E4DD
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 12:00:43 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-61e0c2b5cd2so14083367b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 05:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716206442; x=1716811242; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qVN4sbNkbDEnW1RK7cK93DMtRTTOozrAuE7GvJdhEvI=;
 b=sIHpW8zhLVLmr85ou1luQlAW3eIntlq3GmbmZUbxNGoBxJjrw26fXI2h4P7EecIVRa
 X9ZfjUE8G92gz/UTiq9egEYGoTAWa98y7v/xh9hlGtngeuIF2nPQHA+TOdF5pclwQ0dQ
 DrgHcBH4hV8teIyDbjHP3MOKRru0rNXcqn68FbgayakLKZtaOMp3VAG2vCFIEZBtK2bc
 ecUscHvQ4rmrJ2YplNcnnYtKpf+bQqffDPzxFL+vjAGYpJ6HGIrB8VB56uiGzfAmXcvW
 gs4PhycXtpicnrZXvt/6foqn4gtcVau0vojb28eSpjie3kEG93oIybMsnIW4WktpCA/4
 rgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716206442; x=1716811242;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qVN4sbNkbDEnW1RK7cK93DMtRTTOozrAuE7GvJdhEvI=;
 b=qzQozoXp2fRbBuEXl7V4a1nIsPqKAH7gE4IyxEbO7h4l1henQihqDY7DxJFravsBZo
 yzDGkG6phBqvu5FS/eLNtPWjHiIWYzgWpYsh0zvc8fKl+n5567M5DB+jfJJRvi8kNMTZ
 kdUk6hEb7t/fYtqvvViEYwjVALF6ppMLUOvzDrmq5Qt/4zAmtXFS62xgdyVW354ZeEGu
 0ws8tsANpnidTh2VMe0kGqNiMxEslv6nGtCIzFS302Y21dCINZFbaY6xN+eXVO09OU9K
 5XHAI0RxQQSEsyVZ2C16zog2Di1FaS+pRnPDEIPT8GCdtUlMfwpyVo1gzKQKSI/96u3g
 1g9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNW0lJPWgSnkHM0xYAeY0JRyBfrQ1LzH/LLZ3cGqg4WcxNfE2HS4Smbf/mUIL8zW3DCqo1xfLUMEdeTzTYnyrVwt6EpFwcHp+arwFcrUon
X-Gm-Message-State: AOJu0YwKkjz1XHiQAdIVmnpsh/vFE5IIzzIL0zmYelSCuZNIbcY7eBPa
 tWSXnGG/n/dfxPAM4kkHr4oTiBt8edZBwggvKhj/GHZfzHf0WqSYAXgNvLpNTWhesu85V5CkDju
 4tBtaw4hF/lNLtLfhDd6pKfAJOqOhLQuI4b4mWA==
X-Google-Smtp-Source: AGHT+IHSVI5Muun1d4Yraywna+3qKbgYbyrSHITOEnEVTFE6fqyv1bnRVC6Bix6ZgiBn65MdtlTnre4LV5hO4NgFAM4=
X-Received: by 2002:a05:690c:7442:b0:622:f7df:aa0a with SMTP id
 00721157ae682-627972d3d56mr36406697b3.22.1716206442502; Mon, 20 May 2024
 05:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240516101006.2388767-1-victor.liu@nxp.com>
 <evnxopqt5be56vxuxqdj4l3mcd5nrrvucio7jhwgg4emraai3t@gherubdynyip>
 <e2d4e8b4-bab4-448f-8b67-21f2902fdcd2@linux.dev>
 <CAA8EJppH1rYQ5pzkGP+V-=cOPBYMWm=ZK2Ei1ttjOiN6GRDP+w@mail.gmail.com>
 <acc508e2-b067-47ef-b3e2-fcac51403fe0@linux.dev>
In-Reply-To: <acc508e2-b067-47ef-b3e2-fcac51403fe0@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 May 2024 15:00:30 +0300
Message-ID: <CAA8EJpowLnrnV8ezXYj=oWBFFTa6LqkPFFHc9F49un6AYgZvzw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: adv7511: Exit interrupt handling when
 necessary
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, biju.das.jz@bp.renesas.com, 
 u.kleine-koenig@pengutronix.de, aford173@gmail.com, jani.nikula@intel.com, 
 bli@bang-olufsen.dk
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

On Mon, 20 May 2024 at 14:48, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
> Hi,
>
>
> On 5/20/24 19:13, Dmitry Baryshkov wrote:
> > On Mon, 20 May 2024 at 14:11, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
> >>
> >> Hi,
> >>
> >> On 5/20/24 06:11, Dmitry Baryshkov wrote:
> >>> On Thu, May 16, 2024 at 06:10:06PM +0800, Liu Ying wrote:
> >>>> Commit f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
> >>>> fails to consider the case where adv7511->i2c_main->irq is zero, i.e.,
> >>>> no interrupt requested at all.
> >>>>
> >>>> Without interrupt, adv7511_wait_for_edid() could return -EIO sometimes,
> >>>> because it polls adv7511->edid_read flag by calling adv7511_irq_process()
> >>>> a few times, but adv7511_irq_process() happens to refuse to handle
> >>>> interrupt by returning -ENODATA.  Hence, EDID retrieval fails randomly.
> >>>>
> >>>> Fix the issue by checking adv7511->i2c_main->irq before exiting interrupt
> >>>> handling from adv7511_irq_process().
> >>>>
> >>>> Fixes: f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
> >>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >>>> ---
> >>>>    drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 3 ++-
> >>>>    1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> >>>> index 6089b0bb9321..2074fa3c1b7b 100644
> >>>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> >>>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> >>>> @@ -479,7 +479,8 @@ static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
> >>>>               return ret;
> >>>>
> >>>>       /* If there is no IRQ to handle, exit indicating no IRQ data */
> >>>> -    if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
> >>>> +    if (adv7511->i2c_main->irq &&
> >>>> +        !(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
> >>>>           !(irq1 & ADV7511_INT1_DDC_ERROR))
> >>>>               return -ENODATA;
> >>>
> >>> I think it might be better to handle -ENODATA in adv7511_wait_for_edid()
> >>> instead. WDYT?
> >>>
> >>
> >> I think this is may deserve another patch.
> >
> > My point is that the IRQ handler is fine to remove -ENODATA here,
>
> [...]
>
> > there is no pending IRQ that can be handled.
>
> But there may has other things need to do in the adv7511_irq_process()
> function.

But the function returns anyway. So, we know that the condition is broken.

>
> > So instead of continuing
> > the execution when we know that IRQ bits are not set,
>
> Even when IRQ bits are not set, it just means that there is no HPD
> and no EDID ready-to-read signal. HDMI CEC interrupts still need
> to process.

Yes. Let's get the CEC fixed. Then maybe we won't need this commit at all.

>
>
> > it's better to
> > ignore -ENODATA in the calling code and go on with msleep().
> >
>
> So, It's confusing to ignore the -ENODATA here.

[BTW: you had quotation levels wrong in two places, I've fixed them]

-- 
With best wishes
Dmitry

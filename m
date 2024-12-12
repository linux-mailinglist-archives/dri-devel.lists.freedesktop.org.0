Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 408629EE31B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 10:34:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8010C10E1B0;
	Thu, 12 Dec 2024 09:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CfzV7JDU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [IPv6:2607:f8b0:4864:20::a2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0A510E1B0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 09:34:36 +0000 (UTC)
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-518799f2828so243700e0c.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 01:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733996075; x=1734600875; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vIiyY1DojuqYwP8kOfCtRvyI9XPWag4T5+yXbCexAAc=;
 b=CfzV7JDU885Cw52rWGu42/HMeZnsdSyLvKSMiI+7w7Poje7ijRinT8jq2UNs8ydjso
 vUEWKwqlXaguMMD8I41CSWlOZ6rqqFiptTUc8X6+PnkOzGcB4qg7qSer4HeVrvHIDGA5
 z8gn2ywr5wQo3+/MQKduFydBT4d7bFOx8JPnDFQW50wCk8URt+ntU5OSN+cxQx2aeM3X
 GpkjOVJfYOSi4YwzBmUbS4PcIdoGB7P9+d0BMKO4V4pVWDcEAerljEHnAgykGF405Lw0
 6dWBEOLCnIxdLsxgTxUWnf1UKj5rcRpobYu6QSb3jFz4C2AW2LsIJYf0f4Bfb/ruMlxZ
 Uq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733996075; x=1734600875;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vIiyY1DojuqYwP8kOfCtRvyI9XPWag4T5+yXbCexAAc=;
 b=QPo3KKtQE14GxXkMvnAxt4Fkf7DMIL18JJiLe5X+ZN9otBKLjXa9m6R9Q+T49/Jx+k
 DTwFIg2ZJpikHaaHML0H45xYMXYUXhF96pN1hh6nOd0ZPLvMKnIqDCC8SJMK+XiZ8yZQ
 S6abGn0Qmwolym0SlD1lDdi3Ktlb5wv9qOKu8D87f4lmpZz21Brp5O4gn2zaJijr/Cfg
 Ck7RbIaPV8v9YIWX/GmQfU3/slBPXKKWVjrqUmAfRKVYyvqLlVv4JvUqh/83JDTQtroJ
 4KdWCCIR36eDD7wdsY5J5WPRDWsiPZEgsRm1+vbdy7dAXhqb/WKEIAyfOvHtlxziZXsg
 Ildg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOcNezKVUqokpRc7zY4q+5nXu7Ul/4QAaBtK0Y1HLeUS4Dc9Mzq5e+tKFTGixhQfj6mTtZVmNMXjY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0EzZ0YNJuSYnYz+RAhp1XP2gmB2MxzAXeHZriZXB71gzQeTdd
 /OUWVwgXo7yyOkmsOCgdvE2bLt/4OrT/cSkheTAMWHGYB7B+WBBs9nUmjyJ9vKa/3i2z7/IT8uM
 HSAsvRLTZPlml3sUwtgtwV0WypfQ=
X-Gm-Gg: ASbGncvrSOQFuM+xJ6zhFRUmwEK06zauT3isKm7Y5Y6SfeJOCescLEg8+XlnmVW9Yv2
 jHXHg0vkaStzRRVRimzYQrCK+xIwzCBh1dXSnzA==
X-Google-Smtp-Source: AGHT+IEZdVuZkfUgdpPT2XxtE4NxJsWzqM3d6A/dsmpnRJSb9HoGfRwCAOhclvChuS+G2XD7aJsNnWUsWJSD7eWoaug=
X-Received: by 2002:a05:6122:914:b0:518:7d3a:dd13 with SMTP id
 71dfb90a1353d-518b5d0e582mr1947522e0c.7.1733996075319; Thu, 12 Dec 2024
 01:34:35 -0800 (PST)
MIME-Version: 1.0
References: <20241211122026.797511-1-karprzy7@gmail.com>
 <20241211125936.GA23711@pendragon.ideasonboard.com>
In-Reply-To: <20241211125936.GA23711@pendragon.ideasonboard.com>
From: Karol P <karprzy7@gmail.com>
Date: Thu, 12 Dec 2024 10:34:24 +0100
Message-ID: <CAKwoAfqFbZ0rWzYwX+WTJzMUE1K1Es_UtZj6YXwDKqs=HR6f5g@mail.gmail.com>
Subject: Re: [PATCH] drm: zynqmp_dp: Fix integer overflow in
 zynqmp_dp_rate_get()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 michal.simek@amd.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Wed, 11 Dec 2024 at 13:59, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Karol,
>
> Thank you for the patch.
>
> On Wed, Dec 11, 2024 at 01:20:26PM +0100, Karol Przybylski wrote:
> > This patch fixes a potential integer overflow in the zynqmp_dp_rate_get() function.
> >
> > The issue comes up when the expression drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000 is evaluated using 32-bit arithmetic.
>
> Please wrap your commit message text to 82 columns.
>
> >
> > Now the constant is casted to compatible u64 type.
> >
> > Resolves CID 1636340 and CID 1635811
> >
>
> Does this need a Fixes: tag ? How about 'Cc: stable@vger.kernel.org' to
> get it backported to stable kernels ?

Thanks for the feedback, I'll add it.

>
> > Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
> > ---
> >  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > index 25c5dc61e..55e92344b 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > @@ -2190,7 +2190,7 @@ static int zynqmp_dp_rate_get(void *data, u64 *val)
> >       struct zynqmp_dp *dp = data;
> >
> >       mutex_lock(&dp->lock);
> > -     *val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000;
> > +     *val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * (u64)10000;
>
> You can also make the integer a 64-bit constant with
>
>         *val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000ULL;
>
> >       mutex_unlock(&dp->lock);
> >       return 0;
> >  }

It does look better. I will send v2 of this patch.

>
> --
> Regards,
>
> Laurent Pinchart

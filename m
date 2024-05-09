Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDA18C17BD
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 22:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82BD10E5BE;
	Thu,  9 May 2024 20:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KPofqg1d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFC310F400
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 20:43:01 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-de8b66d1726so2070932276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 13:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715287380; x=1715892180; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GyO7lOaBJGIXBBRmSEVUT3jjg2maQrneBPVuSy70JpQ=;
 b=KPofqg1dnumWm/bo9ncPzXdUIq5puccsY0zByOHJhFfSUTvauG0KtepLe7ZCVOjjeh
 g87Eqtiab2u0RTPrO08/hL8A8FxYWbsG01d8f17SHbcBidDCOeuFHeok0jM9UE4ry/tt
 8o1Bh2BcX7Jll0XN53260AhlM8ut+2dESZT/Fyb36qL6neCrc1r0YtTLHEihzdS6zdoo
 J5C3uLy4EWDrig9mVlT/N/dQx7iC30FVr3OK7XFXF2zfwEciWyiHdf29ePhj+P0r4sp2
 Cuy5YkbPknyJCp7E7lDZxsyMuvgC/JOc3hbJcRiIDKK8MVnpOB019PPhaDuFd/ySQgaT
 OChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715287380; x=1715892180;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GyO7lOaBJGIXBBRmSEVUT3jjg2maQrneBPVuSy70JpQ=;
 b=mNhA2HioAg2sOpQ7seLCdf0RpSm2ozBkLS4LXvH5wdK7/9xeXPoW3en4Pi3mLUaJNN
 PUR6bboXoaOHJVlLQI7e9jTJsrA9iFay99hBoL0iiNCC0hBH7z65ZeIvG+EKGlL6yZT3
 Ys+cVdXkSCV6YNiZyBz7m3Sc7ov9417PtK5ubJK9FIC/ST2eMIXRuVUvuHXv4ZYbfuiW
 bxRFzZlbJpwjoMwiwExo9iQIkxYnOawGT/+5dP/UYHraQfwKv7n1yNX3RtwOc2kiM8kr
 0P9/tahhyKOhDhrPEzi7QFjUHPqIGsx5j98YQZMt9XBNCD5nGWLSSmHuhjy2lsVKwXJ0
 3RFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVE8hCWWCFH4bvqkoosha0q7l5iodgGSopMMwI9u92beBq2epZ+psemN4UfkpeX/Esd2UpPiE9pQUdilj/DQEQRxw1h6Ef8Q88cwuKbweam
X-Gm-Message-State: AOJu0Yx4un3t+RfUbAjDZz0j/ZMQbLGBw4q/K2My+MjoRtXkyikkakV6
 IOIx0szk3lhMa6QZsQSD/GoCyAvFeY+OFOzL1thiKQHAFiCsNwL5b2yWuXha42rMFkVLsAFgV7b
 Aq0gm0mpbWT7v8ZR+aIcOqUr4vDW0MOzh0gJDpA==
X-Google-Smtp-Source: AGHT+IG+qfOYPvC5Bh3mUYNkbKmgsIu9m523SnqmodnTG2ySW8CcwXrwuEZ/k1V57bmNDi9Db8o7UONgcoAYL1Cwt9w=
X-Received: by 2002:a25:102:0:b0:dc2:3a05:489 with SMTP id
 3f1490d57ef6-dee4e4a7b67mr807131276.14.1715287380304; 
 Thu, 09 May 2024 13:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240509-irq_wait-v2-1-b8b687b22cc4@gmail.com>
In-Reply-To: <20240509-irq_wait-v2-1-b8b687b22cc4@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 9 May 2024 23:42:49 +0300
Message-ID: <CAA8EJpqQWN4zE7vn=dG+CNPnU=94z_of5o7NSdom6x3d7nObHA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: fix encoder irq wait skip
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, 9 May 2024 at 22:40, Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail=
.com> wrote:
>
> The irq_idx is unsigned so it cannot be lower than zero, better
> to change the condition to check if it is equal with zero.
> It could not cause any issue because a valid irq index starts from one.
>
> Fixes: 5a9d50150c2c ("drm/msm/dpu: shift IRQ indices by 1")
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail.com>

In the previous revision you have got the Reviewed-by tag, which you
didn't include here for some reason.


This revision is:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Note, there is no need to send a next iteration just for these tags.
They usually get picked up by the patch management software (including
the Fixes tag).


> ---
> Changes in v2:
> - Add Fixes in commit message.
> - Link to v1: https://lore.kernel.org/r/20240509-irq_wait-v1-1-41d653e378=
4e@gmail.com
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_encoder.c
> index 119f3ea50a7c..cf7d769ab3b9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -428,7 +428,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encode=
r_phys *phys_enc,
>                 return -EWOULDBLOCK;
>         }
>
> -       if (irq_idx < 0) {
> +       if (irq_idx =3D=3D 0) {
>                 DRM_DEBUG_KMS("skip irq wait id=3D%u, callback=3D%ps\n",
>                               DRMID(phys_enc->parent), func);
>                 return 0;
>
> ---
> base-commit: 704ba27ac55579704ba1289392448b0c66b56258
> change-id: 20240509-irq_wait-49444cea77e2
>
> Best regards,
> --
> Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail.com>
>


--
With best wishes
Dmitry

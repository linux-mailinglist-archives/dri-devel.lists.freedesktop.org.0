Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0017C4DEA55
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 20:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C7310E3A2;
	Sat, 19 Mar 2022 19:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B53B10E0FF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 14:25:46 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id a8so11078383ejc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 07:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vckV0ZlF5pMU5EOclP3oYh1APp1+Oy/OTUafdY9W0U0=;
 b=ElG57lX2M22jXW1614RoNU9sFuWlREI++GMdCXHsLsj2BBm34g8Dijq+uyt4VMOqPS
 jIPyiECtHE23o92fQCogKBNeqrdHbXvRmY7juhlGVe2IR9Qpd0vHZRYO41F+cmJpF8vS
 20z9bui8gwU5XmpwKvriWPh70C8sd47qi3nHdOW5EjNMkAOnWhaobCfkxCQhLmw417Gr
 q11yrzxYQBTuNOUk2uVPIu0O8TPpbJRF4UtW3eiWLPSLJvbiPdQjc54izEJOQIa447t6
 SvFmt9LbwzLzyGLpFVXMyoC/Irh7j2MAxnVx9inhaG07T9OG4Q6jwSD1lKI1+Q5sooPQ
 jWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vckV0ZlF5pMU5EOclP3oYh1APp1+Oy/OTUafdY9W0U0=;
 b=lunml0OWKs3TyDYU2zXvqe0PXMk5IvGJ/RNhEuHJWKCPng223EgD6bIqsYTWMXnA3y
 4w8ApM30vnVs0liU2Syf12ekVmQtoTeXmeMdpu2eh2pYVI8EMJne15354jW+g4Q6LnmM
 923M0a8sHUC8gyeliaBoGBwxwr9aHqfEW5e7nVIRIXDHAjh8PnnYDJdvVLhDdaz2BWaf
 ny67OZgXAkvGkhH/fmPcf5rA6vwJPT67+KZUKmKrtPhTppo9oXYZgoI3lY7OuZH3/OIY
 oUZ2X/Q2KAgaVZt/C7/QXYFI2iD3oFhl3nNyzAbAGMs4RMpEFp3fF0u1xDyklGY/XqyY
 GsxQ==
X-Gm-Message-State: AOAM532SY/QLf77T0mD80qSKM92jvmE3xCbkpSyclE4BUZGZNPuYOSv4
 CWJIvKHkf/C6PDOsS+GYQ+lCZYRelq9AIbRjNXKqFA==
X-Google-Smtp-Source: ABdhPJwhCmmWamgxlR0O80jFQK/ZX8dRZaDWA+kvJU61ovH/1XbdFamrkCJOVBITnnHIsWStuCBud4PeQx2hX8JZYtY=
X-Received: by 2002:a17:906:d554:b0:6df:a6f8:799a with SMTP id
 cr20-20020a170906d55400b006dfa6f8799amr1274844ejc.492.1647527136467; Thu, 17
 Mar 2022 07:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220317140115.541007-1-shraash@google.com>
In-Reply-To: <20220317140115.541007-1-shraash@google.com>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 17 Mar 2022 07:25:25 -0700
Message-ID: <CABXOdTdGbSDuUepv_MRLYqAfRxB6UPQKP4QGSTmWRUSH3dg6AQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fixed the unused-but-set-variable warning
To: Aashish Sharma <shraash@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 19 Mar 2022 19:14:45 +0000
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
Cc: Anson Jacob <Anson.Jacob@amd.com>, Jake Wang <haonan.wang2@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Wayne Lin <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Guenter Roeck <groeck@chromium.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 17, 2022 at 7:01 AM Aashish Sharma <shraash@google.com> wrote:
>
> Fixed this kernel test robot warning:
>
> drivers/gpu/drm/amd/amdgpu/../display/dmub/inc/dmub_cmd.h:2893:12:
> warning: variable 'temp' set but not used [-Wunused-but-set-variable]
>
> Replaced the assignment to the unused temp variable with READ_ONCE()
> macro to flush the writes.
>
> Signed-off-by: Aashish Sharma <shraash@google.com>
> ---
>  drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
> index 873ecd04e01d..b7981a781701 100644
> --- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
> +++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
> @@ -2913,13 +2913,12 @@ static inline void dmub_rb_flush_pending(const struct dmub_rb *rb)
>         uint32_t wptr = rb->wrpt;
>
>         while (rptr != wptr) {
> -               uint64_t volatile *data = (uint64_t volatile *)((uint8_t *)(rb->base_address) + rptr);
> +               uint64_t *data = (uint64_t volatile *)((uint8_t *)(rb->base_address) + rptr);

also drop the volatile in the typecast

>                 //uint64_t volatile *p = (uint64_t volatile *)data;

The above commented out code serves no purpose and should be removed as well.

Thanks,
Guenter

> -               uint64_t temp;
>                 uint8_t i;
>
>                 for (i = 0; i < DMUB_RB_CMD_SIZE / sizeof(uint64_t); i++)
> -                       temp = *data++;
> +                       (void)READ_ONCE(*data++);
>
>                 rptr += DMUB_RB_CMD_SIZE;
>                 if (rptr >= rb->capacity)
> --
> 2.35.1.723.g4982287a31-goog
>

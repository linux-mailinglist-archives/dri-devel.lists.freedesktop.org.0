Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE2B917C54
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 11:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB7B10E7EF;
	Wed, 26 Jun 2024 09:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sH1/XNXm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E969F10E7EF
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 09:20:12 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-630daaec9c7so58318617b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 02:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719393612; x=1719998412; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ooMt7loSs1UOnKsHhjRSZI9zBiuRhsVP332g7JAojRQ=;
 b=sH1/XNXmNP7ofMu+ue6ITAyzuiPnpJfd64SC4mL+WdGfEgFH/QBVWgIjXT4Wg+je9E
 0XTDYnlPu9n5PqiZxPOwHisiKFXBG0+PMuQUs/t7RFtfK8xzxNv6YF2kinzn9sAllMEc
 wityMvZN3nDD+iUtbClcssuJgfDtDbwQInBU19VO2dHDZXay5GNXK8sF2+/G2AbcBLdq
 2CisCJAzWUmiJWTjZhixrs63umTZfbJ77qOfOs5BL//362oTV61Cu4K5MN76L+jzmeKZ
 4oOftNLc45LEpvUfkVdIEDkiHItR7oRzdWw1CFrqhdheb8KHZMbYRanbGcwyey1yqdXl
 QNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719393612; x=1719998412;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ooMt7loSs1UOnKsHhjRSZI9zBiuRhsVP332g7JAojRQ=;
 b=RvwalaxVl/uGKaw/JjDBqErXiB+PQZzSeXOTFbygXokBV08YbzLsFsDhCScJagVdSL
 bxSGM0zXlewwmky4G97V2wIvUcuF5z3UvV14S1e9dUFf5tsv823YGzozM+m+JiG7nnbW
 RQskz8JLhGQMDLbWlvByoKkIjpbtRWZFlE2xEl/LrCkGRGw9N3pLCL61Vz2gPmrcj//i
 +28HZZcUZIaQ1Kh+oXSdOUQfwyrazhgDAGkNUQG0IARcd6XeXNozMSzYNLFab8Yi8KZL
 nyHMkoNvZn1d/oTcuqkJl6PQyfOLO0aILot8OtkI/Mto5GJDEdYD9BEFouIRkSlDOztA
 Gotw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXArfE5XVbGa5CfPJqv+WgiGaW7ME04mT6oRD0SfhOt77X3pp6EnnbBodGTs85E9ArbW25aK7nvSjV1/8cP20Befs/npk+q+ReK5bpc1ECw
X-Gm-Message-State: AOJu0YwmZ4+W2y8Xb3j3UYqq1T+b6JM+7V7mYGoIkeIzYaTZ/obxH5iv
 hLjAHgXUUSK9LGEQ0GQxiKdOgKNgt5wYtgkvXWFlAYJ4kph8I/8uCL3iwEg/08TlRHCzKFjEHEq
 tV+oCv4Hu5xvWLOf9rYVALhD9u66JnbLBPIPD9Q==
X-Google-Smtp-Source: AGHT+IE4ix/i/ULSMOAVZm3q7PDDKAFbl2Zq/1M2PXq1tz1mqipWTnoJqt7hK5wKypFCB8/G841JZI80T3OeVSM9BSw=
X-Received: by 2002:a05:690c:827:b0:62c:f772:2af3 with SMTP id
 00721157ae682-643a9af84aemr96087667b3.1.1719393610698; Wed, 26 Jun 2024
 02:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240625131815.14514-1-tzimmermann@suse.de>
 <n22c255ozkpnbvt45ugfgpqyjmebmgsjblduwurf6yr7ralffd@yvbrl4rsabea>
 <e4fe3aab-0b3f-42dd-916c-db15dd6b7646@suse.de>
 <cq7xbwehvdyopndjjmxl2ekq2v7gpynxrhzh5yqkt5etao6hee@ifxdrp4gmtmb>
 <d8859a60-bbb4-4139-85e2-00b4ff694a8f@suse.de>
In-Reply-To: <d8859a60-bbb4-4139-85e2-00b4ff694a8f@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 26 Jun 2024 12:19:56 +0300
Message-ID: <CAA8EJpptUMAQxFw6VAHvkMfqv_=74q5Yt3PHo8w6fDX+imDgkw@mail.gmail.com>
Subject: Re: [PATCH] drm/ast: Inline drm_simple_encoder_init()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org
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

On Wed, 26 Jun 2024 at 12:19, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 26.06.24 um 11:10 schrieb Dmitry Baryshkov:
> > On Wed, Jun 26, 2024 at 11:01:11AM GMT, Thomas Zimmermann wrote:
> >> Hi
> >>
> >> Am 26.06.24 um 06:34 schrieb Dmitry Baryshkov:
> >>> On Tue, Jun 25, 2024 at 03:18:09PM GMT, Thomas Zimmermann wrote:
> >>>> The function drm_simple_encoder_init() is a trivial helper and
> >>>> deprecated. Replace it with the regular call to drm_encoder_init().
> >>>> Resolves the dependency on drm_simple_kms_helper.h. No functional
> >>>> changes.
> >>>>
> >>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>> ---
> >>>>    drivers/gpu/drm/ast/ast_mode.c | 45 ++++++++++++++++++++++++++++++----
> >>>>    1 file changed, 40 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> >>>> index 6695af70768f..2fd9c78eab73 100644
> >>>> --- a/drivers/gpu/drm/ast/ast_mode.c
> >>>> +++ b/drivers/gpu/drm/ast/ast_mode.c
> >>>> @@ -45,7 +45,6 @@
> >>>>    #include <drm/drm_managed.h>
> >>>>    #include <drm/drm_panic.h>
> >>>>    #include <drm/drm_probe_helper.h>
> >>>> -#include <drm/drm_simple_kms_helper.h>
> >>>>    #include "ast_ddc.h"
> >>>>    #include "ast_drv.h"
> >>>> @@ -1358,6 +1357,14 @@ static int ast_crtc_init(struct drm_device *dev)
> >>>>            return 0;
> >>>>    }
> >>>> +/*
> >>>> + * VGA Encoder
> >>>> + */
> >>>> +
> >>>> +static const struct drm_encoder_funcs ast_vga_encoder_funcs = {
> >>>> +  .destroy = drm_encoder_cleanup,
> >>>> +};
> >>>> +
> >>>>    /*
> >>>>     * VGA Connector
> >>>>     */
> >>>> @@ -1411,7 +1418,8 @@ static int ast_vga_output_init(struct ast_device *ast)
> >>>>            struct drm_connector *connector = &ast->output.vga.connector;
> >>>>            int ret;
> >>>> -  ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
> >>>> +  ret = drm_encoder_init(dev, encoder, &ast_vga_encoder_funcs,
> >>>> +                         DRM_MODE_ENCODER_DAC, NULL);
> >>> What about using drmm_encoder_init() instead? It will call
> >>> drm_encoder_cleanup automatically.
> >> IIRC the original use case for the drmm_encoder_*() funcs was to solve
> >> problems with the clean-up order if the encoder was added dynamically. The
> >> hardware for ast is entirely static and ast uses drmm_mode_config_init() for
> >> auto-cleaning up the modesetting pipeline. Using drmm_encoder_init() seems
> >> like a bit of wasted resources for no gain.
> > I'd say it's qui pro quo. We are wasting resources on drmm handling, but
> > then keep it by dropping all drm_encoder_funcs instances.
>
> With drm_encoder_init() there's a static-const declared struct in RO
> memory. With drmm_encoder_init(), there's a kalloc for the managed
> callback data. It's RW memory and the alloc can fail. Therefore I prefer
> drm_encoder_init() in this case.

Ack.

-- 
With best wishes
Dmitry

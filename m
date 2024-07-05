Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5032E9286E0
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 12:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C461410EA6F;
	Fri,  5 Jul 2024 10:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NhbJbstd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2603210EA55
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 10:37:19 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-64b417e1511so13932037b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2024 03:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720175838; x=1720780638; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=m2XtIKUct3GoVpvVT51gcMt9lCIMQVUjJmUxCbtHQWg=;
 b=NhbJbstdyaa5PlnnL7TTnlpLiJH+6Nw6h/ZpDr+lDpscMwJrsqa0wg2qU3gOHPCFpA
 e8GHY6G7435VUiyDMDhD1VpWsAwz8Tdsewr1aaa5V8rr2N4FckuDBhZo5yo7MMqkATUr
 zIBBYBjfffhBqyd4Uy1ScWr7PUj+TuQgQnN1I0BFSVTx7X+S4CqNBcJ7/kEY2SDk2LnM
 xiKGxqVVZ7RVnHRXahPVD74PL3/zjvdtiR0ajjmtw3S+D3iWmHixfqKPqBppQBii+EEt
 3z4lZctFopPVQMcPbL8hTtj/uFTgtNjbhlcPsmLPEr09nkP9359Hmuw9CnaBGkgbYSjt
 GjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720175838; x=1720780638;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m2XtIKUct3GoVpvVT51gcMt9lCIMQVUjJmUxCbtHQWg=;
 b=vcGzvPrw97b9z5nNWy+qfJPq+xZC9GQoNabh4XaKVw1DZxq5abzLFhygpiywF5bbp8
 OkMpc3gkn+3QcNLJzsxyMSg7QF33u4XKILwawBTeHU2NU3QrhLMRuQ+V/nmjdAAUOuMQ
 Ilw8anhHiufgrm4/Wbue2M7190yiPQYYeNtIF87/rv2s4zxiYBxCDBSJ/31o3RZnNbvY
 UOfEqm0kbuAhLJLhI1JDB/2/0dQURazIna+Md1bNnvQ4gvH5I3WDCF3uCWta6T7ZCyn2
 99Dowb51zJ7wordYDVvv0CEk1Fn3J8PRKmwv9q8Kkt+SQ/KHqpRmEq/6cse4n6qrjyDd
 k1ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjMsG3IacXDzKR/rBUoqmEyruWq4jf5g/oAwwiRvqtOqwi7CrX7UsSQyZ01lb93lIMfRPe0dVq4QL/kjFJM9z/qvs5X7AvEI/UeHs13o3t
X-Gm-Message-State: AOJu0YyrMx7EibwjPrNtk3KhRKvITOoLqs2V8q46e34Mk9jjAXLPgP8G
 dEqMXG3p3K7Ki29ktMBPaPHpxZGlyiP0mK43cAj4phdBjV//ceymlAanQGPvBX33NnIODS3zvsO
 XYuMYF2oFA2i1/cY+z5F/FSGPFphFcUxoAQuUDw==
X-Google-Smtp-Source: AGHT+IFUuR9ynJphCsPUUswmmP1sTtxf3bEWDrRSxQM5hyzJJMrR4TCQnlrOPzhdeD9bqEPMvuoPyV/zYG97IutZQI4=
X-Received: by 2002:a81:8453:0:b0:63b:eed2:64bf with SMTP id
 00721157ae682-652d8037b15mr42197147b3.32.1720175838157; Fri, 05 Jul 2024
 03:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240330203831.87003-1-krzysztof.kozlowski@linaro.org>
 <20240330205722.93801-1-krzysztof.kozlowski@linaro.org>
 <20240527144700.GC713992@gnbcxd0016.gnb.st.com>
 <77b4e4ad-2b1e-4b6d-bc3b-0c7b339bc295@linaro.org>
 <f207b481-f530-4f54-a482-218908869050@linaro.org>
 <78384e57-4139-47c9-ae5a-480c0d6b9daa@linaro.org>
In-Reply-To: <78384e57-4139-47c9-ae5a-480c0d6b9daa@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Jul 2024 13:37:07 +0300
Message-ID: <CAA8EJpqmawrbXyhQ+5SrX+=F5LUuyLNnOb21SPzbg=3vbnDg7g@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/sti: hdmi: drop driver owner assignment
To: neil.armstrong@linaro.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Fri, 5 Jul 2024 at 13:04, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 05/07/2024 11:59, Krzysztof Kozlowski wrote:
> > On 04/06/2024 15:18, Krzysztof Kozlowski wrote:
> >> On 27/05/2024 16:47, Alain Volmat wrote:
> >>> Hi Krzysztof,
> >>>
> >>> thanks for your patch, sorry for the delay.
> >>>
> >>> On Sat, Mar 30, 2024 at 09:57:21PM +0100, Krzysztof Kozlowski wrote:
> >>>> Core in platform_driver_register() already sets the .owner, so driver
> >>>> does not need to.  Whatever is set here will be anyway overwritten by
> >>>> main driver calling platform_driver_register().
> >>>>
> >>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>> ---
> >>>>
> >>>> I forgot two drivers.
> >>>>   drivers/gpu/drm/sti/sti_hdmi.c | 1 -
> >>>>   1 file changed, 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
> >>>> index 500936d5743c..b0d84440a87b 100644
> >>>> --- a/drivers/gpu/drm/sti/sti_hdmi.c
> >>>> +++ b/drivers/gpu/drm/sti/sti_hdmi.c
> >>>> @@ -1485,7 +1485,6 @@ static void sti_hdmi_remove(struct platform_device *pdev)
> >>>>   struct platform_driver sti_hdmi_driver = {
> >>>>    .driver = {
> >>>>            .name = "sti-hdmi",
> >>>> -          .owner = THIS_MODULE,
> >>>>            .of_match_table = hdmi_of_match,
> >>>>    },
> >>>>    .probe = sti_hdmi_probe,
> >>>> --
> >>>> 2.34.1
> >>>>
> >>>
> >>> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
> >>
> >> What does this ack mean? You are the maintainer, so what is supposed to
> >> happen now? If maintainer does not take patches, then the DRM STI looks
> >> orphaned.
> >
> > +Cc Neil, Dmitry,
> >
> > I pinged and pinged and wanted some sort of clarification here but one
> > month passed and nothing was clarified.
> >
> > I could be understanding the DRM process wrong, but if no one picks up
> > trivial cleanups for 1.5 months, then to me subsystem is orphaned. I
> > will send respective MAINTAINERS update.
>
> Let's do that, if Alain doesn't take his own patches that were reviewed
> then it should either be orphaned  or moved to drm-misc.

But it already a part of drm-misc as far as I can see:

DRM DRIVERS FOR STI
M:      Alain Volmat <alain.volmat@foss.st.com>
L:      dri-devel@lists.freedesktop.org
S:      Maintained
T:      git https://gitlab.freedesktop.org/drm/misc/kernel.git
F:      Documentation/devicetree/bindings/display/st,stih4xx.txt
F:      drivers/gpu/drm/sti

-- 
With best wishes
Dmitry

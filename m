Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4109427BE6
	for <lists+dri-devel@lfdr.de>; Sat,  9 Oct 2021 18:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F4A892CF;
	Sat,  9 Oct 2021 16:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90616E845
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Oct 2021 16:22:42 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id z15so8334385qvj.7
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Oct 2021 09:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ps7DiQtOW0yxAPEQdZyI3WtmSKsINX3O22ig4yrRkE0=;
 b=KzlqXDDtk47pPSC9GsMmBzmf0IOh6D1Wcti108dAkQdpZd3NdNTFOpp6HBtqRizfC1
 p1AGFQXVSP0TU4XlTlXrsywxgYv4sMRSvwwY1MU+c4QOqn1doef7DUUcZIcgUO+xBI3t
 UMbr2b+fPYdo3DWT1uKjaLvE2CHqwI2TqQl8sKiMyukknM+51UUBxL3EmfDM717VGwSO
 UbY4OE78Gw2aG0lSjuKDZe/XA77HMe6/iiMQaSTpS0Mn7uObsnZV2kRCf9oYbVe4AOL7
 vKwrJ1ZvVLTj0770a3GgR/Whp34ZdScZLoaLoJ2xq0YrCQdovB0oerOr7msSwpViC4zW
 WySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ps7DiQtOW0yxAPEQdZyI3WtmSKsINX3O22ig4yrRkE0=;
 b=aM6ENoU4tiRxjYtKrgDyQgF+7n7BQc/nSMpOQKp/bpeLw1Bycfwxj/5MAFri3xHhVo
 7JVLuzOuIf+sia1H8w2nXYmycV3bvlqTPbk+b7RSGfWuvbhEWK+4ErFsnCj3yGYCZy0F
 YhZJzll1cOZjPW1x5CmehU4A5x4G+HgPRt3OGDxjZ88oTk7Lc+mDqnObKlzujR9rCIbf
 O2HDKRKloHvxFIt6InE6JrRHR7/oFasON0PRTN/4V2NjdByppMRKuxzHQPbN+vbbXvgA
 coFqTEXmZRe+/iuC9rt1vWW9Tn08zSLyh01qtn2Zl+ZIgNLttT8e5Swzn73ntfTN9JHW
 YC1g==
X-Gm-Message-State: AOAM533/ymG85tBU6WaDawM5r5Tl99Z60Ya5iJbWDkpsDil80njlfSsx
 8gd+a4jmMWKqAuQsgnArqZ+w17mWFRZ39OAAK7rURg==
X-Google-Smtp-Source: ABdhPJyzMbqYmICxCJiO0kJAwrdaVGemEC/CVJakJfw0G7PzEcywRdikyCTJ7DRm4WhyRdmW4SyQq2iRexvTKx8A0pA=
X-Received: by 2002:a05:6214:70f:: with SMTP id
 b15mr15970638qvz.16.1633796561708; 
 Sat, 09 Oct 2021 09:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210926001005.3442668-1-dmitry.baryshkov@linaro.org>
 <20210926001005.3442668-3-dmitry.baryshkov@linaro.org>
 <YWG3oC7Bp54tIYkN@ravnborg.org>
In-Reply-To: <YWG3oC7Bp54tIYkN@ravnborg.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 9 Oct 2021 19:22:30 +0300
Message-ID: <CAA8EJppeW=s8ngS59hvUyCqmhodtTO3f8k7Aof=-umudCvs2jA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/panel: Add support for Sharp LS060T1SX01 panel
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
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

On Sat, 9 Oct 2021 at 18:39, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Dmityry,
>
> On Sun, Sep 26, 2021 at 03:10:05AM +0300, Dmitry Baryshkov wrote:
> > Add driver to support Sharp LS06T1SX01 FullHD panel. The panel uses
> > nt35695 driver IC. For example this LCD module can be found in the
> > kwaek.ca Dragonboard Display Adapter Bundle.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> The driver looks fine. It would have been nicer could you have used
> regulator_bulk - but I guess timing constraints prevents that - right?

Yes, there are explicit timing constraints in the datasheet, so I had
to follow them and to turn regulators on and off one by one.

>
> Please address the following checkpatch warnings:
>
> -:181: WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
> #181: FILE: drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c:129:
> +       msleep(1);
>
> -:187: WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
> #187: FILE: drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c:135:
> +       msleep(10);
>
> -:193: WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
> #193: FILE: drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c:141:
> +       msleep(10);
>
> -:210: WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
> #210: FILE: drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c:158:
> +       msleep(10);
>
> -:241: WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
> #241: FILE: drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c:189:
> +       msleep(10);
>

Ack, I'll fix the msleep's and send the v4.

>
> I expect patches to be checkpatch --strict clean - or it is mentioned in
> the changelog otherwise.
>
>         Sam



-- 
With best wishes
Dmitry

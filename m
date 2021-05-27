Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A773924E9
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 04:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BCF6EDEB;
	Thu, 27 May 2021 02:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA49E6E8B7;
 Thu, 27 May 2021 02:32:42 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id z16so4958313ejr.4;
 Wed, 26 May 2021 19:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TV+wC0WFoKchEerG4axbdcV4seO64TyW3pbGdwqfpJc=;
 b=iTyPMYOsNLuaTnfQk1SALHo6QRQMwdVAV+cufxsffWt1Jj0Q5/72gy2hsqXz/Lw5CP
 p3w7/9fXwr/8klthDTc9Bn4/0Eug57QRh/SIiM1ka2aEQb75p1Eb5kGpvnHTF8NG0bJd
 swnXJjG2C8A9cAoohGjA8clmbCEyTUgwDcqn65dRZtBJYY8LOOy0f1r6cqoGtFGpwWSk
 scWTRIaZ9dePGAwX2cLiUTmuKht3RkmNskxtfH945xzd6LrgmkEs8CDr2RJrOQFpxAdg
 W/1c23Ul4vuBr1LUwpM2pRxHlfH43xBsB/bWIVzz7DC3uNZc6sG7ts+XYgcvc5ViRJ/6
 5nLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TV+wC0WFoKchEerG4axbdcV4seO64TyW3pbGdwqfpJc=;
 b=knzOT/wbTyB5sgrG6Ggu5q7lsSqbENRG1BUpuju084TiovFcmHfkU+MoL7jgSvZNed
 Y103koxIO7YVgFXDdbZrekYez0StIlGcev/0iJjmD+YhaL8bdDQY4jXFA2PNJT5FzWE1
 tbE9qNj0H1vDQeshANisAcFOQhXzmrDOORTLIlkvv6oMmXV8aWjY6lM8Z83m6tRDKmz+
 o42N/DmCVJPHuLCPKuJkoUXPpRTUjRIMk8MEhtEmKbl4dhZib411FY9TNl75kkfmOwCU
 33bX2/BXdhUvW5bytQm8z5pEyIsPhpxTSYKXuq8Tz3gpFnTBq9A8zccuYHBEzXI5cqd2
 Ywcw==
X-Gm-Message-State: AOAM530S5/0rT1lszvm8izbZTpecL7//7Xryd/u1fHT9yBsdk07p7kXo
 vFAQzUSV3fb9n5d4BVD0FcgrKOzA2LV3S7sAxZE=
X-Google-Smtp-Source: ABdhPJwLwL4Noh/s/BkOlp186Rrpkjoiiy23P/QOFO3PvNKzg5ao/zNlA6EJBqpA3nwvgDt3HRBPA9WGsmXWUUqpUIE=
X-Received: by 2002:a17:906:4704:: with SMTP id
 y4mr1397988ejq.68.1622082761433; 
 Wed, 26 May 2021 19:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210516121315.30321-1-tzimmermann@suse.de>
 <057a9a16-3ed7-b159-22d7-33f1dc523d14@suse.de>
In-Reply-To: <057a9a16-3ed7-b159-22d7-33f1dc523d14@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 26 May 2021 22:32:30 -0400
Message-ID: <CADnq5_PaOmQAw-X7+RtBThg_e74uuzoiqrDUguksLVOWkKUnNw@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm: Finally retire struct drm_format_name_buf
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Dave Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Alex Deucher <alexander.deucher@amd.com>
for the amdgpu changes.

On Wed, May 26, 2021 at 3:21 PM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> ping for further a-bs / r-bs
>
> Am 16.05.21 um 14:13 schrieb Thomas Zimmermann:
> > This is a cleanup patchset to remove drm_format_name_buf et al. There
> > are two instances in drivers that need to be replaced with the %4cc
> > printk format modifier. Patch 3 was left over back from an earlier
> > patchset. [1] Patch 4 removes struct drm_format_name_buf.
> >
> > I built-tested with drm-tip. The patchsetcan be mered through drm-misc.
> >
> > [1] https://lore.kernel.org/dri-devel/20210216155723.17109-1-sakari.ail=
us@linux.intel.com/
> >
> > Sakari Ailus (1):
> >    drm: Remove drm_get_format_name()
> >
> > Thomas Zimmermann (3):
> >    drm/amdgpu: Use %p4cc to print 4CC format
> >    drm/simpledrm: Use %p4cc to print 4CC format
> >    drm/fourcc: Remove struct drm_format_buf_name
> >
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c |  7 ++----
> >   drivers/gpu/drm/drm_fourcc.c                | 25 --------------------=
-
> >   drivers/gpu/drm/tiny/simpledrm.c            |  6 ++---
> >   include/drm/drm_fourcc.h                    |  9 --------
> >   4 files changed, 4 insertions(+), 43 deletions(-)
> >
> > --
> > 2.31.1
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>

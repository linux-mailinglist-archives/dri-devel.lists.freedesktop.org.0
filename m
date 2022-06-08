Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D1D543115
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 15:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9051210FE2E;
	Wed,  8 Jun 2022 13:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [IPv6:2607:f8b0:4864:20::a2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DF910FE29
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 13:10:31 +0000 (UTC)
Received: by mail-vk1-xa2e.google.com with SMTP id u188so8981445vku.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 06:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sHyDTOm6lqUiG1tD8A2W8nqmZQbSNybMLepUwsmygh4=;
 b=Olt6xkR9Ye+XreClVMgFeqMIfyq8Prv9k+5XYI6uUPlAxxA/INsPsZp9/8kgsOsUvy
 yRmwYz8DVT2cnNLyMRvqwmxFS1qB+X04wTJkeo0mjQpFZt1YD7P4Zd8oe9zZqYl6sqmc
 HiYn/UO5tcB8kOEClkmAV55xFhy5EkhWYWY2iXqPcXlD/o2ND2+kXETuMpT05OPbtwX3
 YGqkur4u7rfB5RrEKs9s5iv1m7sXUzVVzsgQOuKaiPbpBdd9+U02wDGJk348zY2Wvoxe
 O+hbjoF86lBwFTLDDB3FoqPT6Q2j2peE7/bZu/zSDpXMeBEEyTDbu1ccCnDW1kpkiTly
 ajlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sHyDTOm6lqUiG1tD8A2W8nqmZQbSNybMLepUwsmygh4=;
 b=sqJCMJhzTKPn98NI5B2Dx60N73Ie+Xd3mf1y+gW154iy+c6LdXIRvp9LBI+SZzorTm
 No7WMck8ifbImfROKF73ZNhnvDnlmLk42rMoN5cKCBzbmTbhEJWabwMKwCb6fORb2DDs
 YquucpRUqyOKCt90WKqARaQ9jpRfKEAXvkGZnITg9ckeZ7U0m9sKAjDGswqMExOGEj2y
 ctxKvM4O/6WDGyalrqgi1r4Faj2zmMpS4PhZ9vLGrvLgD5uIiVrTt/Z5HwUOn6D259pv
 kxLDyED5LFgGe9Ahqf9puCqVJtMszJsFStXGLRZeez6WgsnW0Q64vd5wKunzRek7pSD5
 aliQ==
X-Gm-Message-State: AOAM530sWMELE5kv4IAR5faDoI4Qf2YKrsHG9cEy5Zkzsxa4GsLRIe0E
 wSneuEDu8Pr/JUZsPFXpuWDuDTBnKsIOW8rK9GM=
X-Google-Smtp-Source: ABdhPJx9FBBBy2XeqE8s8EmFtFgqC3JYLKQd/NS49O0DTX2HitpWKnhU0TiAIticKb9ryJiEaTKeGwRM8N/xIrw34HI=
X-Received: by 2002:a1f:1245:0:b0:35d:7991:7385 with SMTP id
 66-20020a1f1245000000b0035d79917385mr11780357vks.2.1654693830800; Wed, 08 Jun
 2022 06:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <75eec8af-66fd-bbaa-9aea-4cdf634bf2c8@arcor.de>
In-Reply-To: <75eec8af-66fd-bbaa-9aea-4cdf634bf2c8@arcor.de>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Wed, 8 Jun 2022 14:10:19 +0100
Message-ID: <CALeDE9MzaG0vGfwMrZVArCWpNT94=vTakoM71qykBkVbeL1QmQ@mail.gmail.com>
Subject: Re: drm/vc4: module dysfunctional on Raspberry Pi 3B as of 5.18.0
To: Peter Mattern <pmattern@arcor.de>, Maxime Ripard <maxime@cerno.tech>,
 stefan.wahren@i2se.com
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Peter,

Adding Stefan and Maxime

> As of Linux 5.18.0, module vc4 apparently isn't working on Raspberry Pi
> 3B any more.
>
> If a monitor is attached to the device, the boot messages show up as
> usual, but right when KMS starts, the screen turns black. Similarly, the
> screen also turns black when the module is blacklisted at boot time and
> loaded from the running system.
> The problem looks quite similar to the one posted some months ago in [1].
>
> Unfortunately, looking through systemd's journal didn't seem to yield
> any real hint. Nevertheless, the results from grepping vc4 are

I'm seeing the same issue with vc4 on a RPi3 on 5.18.1 on Fedora so
can confirm the regression. Maxime would know what might be up here?

> =E2=86=92 5.17.1
>  > kernel: vc4-drm soc:gpu: bound 3f400000.hvs (ops vc4_hvs_ops [vc4])
>  > kernel: rc rc0: vc4 as /devices/platform/soc/3f902000.hdmi/rc/rc0
>  > kernel: input: vc4 as /devices/platform/soc/3f902000.hdmi/rc/rc0/input=
0
>  > kernel: vc4-drm soc:gpu: bound 3f902000.hdmi (ops vc4_hdmi_ops [vc4])
>  > kernel: vc4-drm soc:gpu: bound 3f806000.vec (ops vc4_vec_ops [vc4])
>  > kernel: vc4-drm soc:gpu: bound 3f004000.txp (ops vc4_txp_ops [vc4])
>  > kernel: vc4-drm soc:gpu: bound 3f206000.pixelvalve (ops vc4_crtc_ops
> [vc4])
>  > kernel: vc4-drm soc:gpu: bound 3f207000.pixelvalve (ops vc4_crtc_ops
> [vc4])
>  > kernel: vc4-drm soc:gpu: bound 3f807000.pixelvalve (ops vc4_crtc_ops
> [vc4])
>  > kernel: vc4-drm soc:gpu: bound 3fc00000.v3d (ops vc4_v3d_ops [vc4])
>  > kernel: fb0: switching to vc4 from simple
>  > kernel: [drm] Initialized vc4 0.0.0 20140616 for soc:gpu on minor 0
>  > kernel: vc4-drm soc:gpu: [drm] fb0: vc4drmfb frame buffer device
>  > systemd-logind[338]: Watching system buttons on /dev/input/event0 (vc4=
)
> =E2=86=92 5.18.0
>  > kernel: fb0: switching to vc4 from simple
>  > kernel: vc4-drm soc:gpu: bound 3f400000.hvs (ops vc4_hvs_ops [vc4])
>  > kernel: rc rc0: vc4 as /devices/platform/soc/3f902000.hdmi/rc/rc0
>  > kernel: input: vc4 as /devices/platform/soc/3f902000.hdmi/rc/rc0/input=
0
>  > kernel: vc4-drm soc:gpu: bound 3f902000.hdmi (ops vc4_hdmi_ops [vc4])
>  > kernel: vc4-drm soc:gpu: bound 3f806000.vec (ops vc4_vec_ops [vc4])
>  > kernel: vc4-drm soc:gpu: bound 3f004000.txp (ops vc4_txp_ops [vc4])
>  > kernel: vc4-drm soc:gpu: bound 3f206000.pixelvalve (ops vc4_crtc_ops
> [vc4])
>  > kernel: vc4-drm soc:gpu: bound 3f207000.pixelvalve (ops vc4_crtc_ops
> [vc4])
>  > kernel: vc4-drm soc:gpu: bound 3f807000.pixelvalve (ops vc4_crtc_ops
> [vc4])
>  > kernel: vc4-drm soc:gpu: bound 3fc00000.v3d (ops vc4_v3d_ops [vc4])
>  > kernel: [drm] Initialized vc4 0.0.0 20140616 for soc:gpu on minor 0
>  > kernel: vc4-drm soc:gpu: [drm] fb0: vc4drmfb frame buffer device
>  > systemd-logind[337]: Watching system buttons on /dev/input/event0 (vc4=
)
>
> Regards,
>
> Peter Mattern
>
> [1]
> https://lists.freedesktop.org/archives/dri-devel/2022-January/339458.html
>

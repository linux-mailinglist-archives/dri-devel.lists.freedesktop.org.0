Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4767C51C449
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 17:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C012610E7A3;
	Thu,  5 May 2022 15:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61DF710E7A3
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 15:53:11 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id gh6so9606479ejb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 08:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1imTbFvxSu0eMtn2Ea7a1QwVSeRsNsaWdQpXFh00o/s=;
 b=JfpSQd3gaJ+Ed4G9YtnYm6kZ+FIOM5VXR603FG7MY0xIZqMeY7V4l9wEpXstNwsAHP
 cDfh4ZcNUGOGdlbv+HwQWvDMXX3/9wCujtPuU5aEMRr0agBAlVueTJrufPNjOVTdCUG7
 eY47+K/EnXB1451xaJMDLF2X/0Wn3e5z2TpVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1imTbFvxSu0eMtn2Ea7a1QwVSeRsNsaWdQpXFh00o/s=;
 b=ZmhEuOIJpD+nPw5jXgPDoY3Ww6Xeoy5C8+fEltnMzofd4zS9cLLDoheOH/SxtdqDp7
 pR2AfGLF69VmVRTQ/GFyHXvWxGwiA/kndD+ac08rM6nHkNQysdKCpyPRRuyHPe5UPWqt
 VKjtOuOWp6FaZ90wPh7baT2WbvnjV27xFQf1hxolxmxaqfZFpPqcArYIu+QclA37YmWm
 +W5Fy4KAyPro1AOH3UIdWROQoLSs73Bkfcp70ZFEjBKGBag6G9gTCiA6W5SBANtMJzY6
 xGnEcMi7UdQtxVdZLqMNZDT+4kvXmUe6zSJKiT5xIlOqALmvPdWAKpJRrFGv9p12tZk6
 Vp+A==
X-Gm-Message-State: AOAM5305Q/lFVrwpzPHjyX+uFZUwlbob6M9IL08Nz6QCzyWm6a6/s8TL
 2hS+2MV2Y3qjFOyH/XadrqaaWHkPqIY5R6Xm+K8=
X-Google-Smtp-Source: ABdhPJx5B9DrsQz9EvUNxFrZ+U/hJn5hRAuFxIeGGfZfcynr2kuGU4/RqNAUphhEmo/m35joBYS3Rg==
X-Received: by 2002:a17:906:2314:b0:6f4:d3d0:9ede with SMTP id
 l20-20020a170906231400b006f4d3d09edemr7673889eja.765.1651765989637; 
 Thu, 05 May 2022 08:53:09 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 gz17-20020a170907a05100b006f3ef214e72sm863177ejc.216.2022.05.05.08.53.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 08:53:09 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id
 a14-20020a7bc1ce000000b00393fb52a386so5386807wmj.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 08:53:09 -0700 (PDT)
X-Received: by 2002:a7b:c7c2:0:b0:394:18b:4220 with SMTP id
 z2-20020a7bc7c2000000b00394018b4220mr5628302wmk.118.1651765494778; Thu, 05
 May 2022 08:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220426132121.RFC.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
In-Reply-To: <20220426132121.RFC.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 May 2022 08:44:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XViHtOoQH3fm4yoRcUAkLkf0Wf4zPXUH0Zq5_09tZmjw@mail.gmail.com>
Message-ID: <CAD=FV=XViHtOoQH3fm4yoRcUAkLkf0Wf4zPXUH0Zq5_09tZmjw@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/edid: drm_add_modes_noedid() should set lowest
 resolution as preferred
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ville,

On Tue, Apr 26, 2022 at 1:21 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> If we're unable to read the EDID for a display because it's corrupt /
> bogus / invalid then we'll add a set of standard modes for the
> display. When userspace looks at these modes it doesn't really have a
> good concept for which mode to pick and it'll likely pick the highest
> resolution one by default. That's probably not ideal because the modes
> were purely guesses on the part of the Linux kernel.
>
> Let's instead set 640x480 as the "preferred" mode when we have no EDID.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/gpu/drm/drm_edid.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Someone suggested that you might have an opinion on this patch and
another one I posted recently [1]. Do you have any thoughts on it?
Just to be clear: I'm hoping to land _both_ this patch and [1]. If you
don't have an opinion, that's OK too.

[1] https://lore.kernel.org/r/20220426114627.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid

-Doug

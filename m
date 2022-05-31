Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2687539869
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 23:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3D310E262;
	Tue, 31 May 2022 21:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1645310E262
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 21:06:50 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id f21so28945469ejh.11
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 14:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2D0n0MD9FVM5CduT1NCFZoyK1Wf+YfR32ZwltpKGpW0=;
 b=ZQT68xf2h4yPB1aO3z6MMCxjgrGQxzK6GsAwKC4AbtmM7jt7hPu9NP/5/38W/CoGs4
 /U426ZyODXRJ/hIK1zizXSQUiCeTA65NiXm2tba9pIlaxq1ArpOmj55sVibamQlHpil1
 HXArJ8lpnCJ5gJjSUw7JSWNWLGFhmor2Mb+W4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2D0n0MD9FVM5CduT1NCFZoyK1Wf+YfR32ZwltpKGpW0=;
 b=ApAUXujSL6Wc7GbpHWaV1BBm4iN0dNjM926XPIRPh9py6IpKOLs36iVdKuoHjeWwg2
 a9Ue7dwSqCVNNFH3clnWdcW3jLBtheVTlz6nRAsfzUvCmQ6ZB63dxh+miLu0d5ptzsnb
 Tvw0ZQCL3Z275cfda3jY1wd24V0TCI5BZtZDKLyAsGD6GD07B9Ud2KxiLLrDlWoy5wzk
 pEj5wB8fT1uPpaYFiWqEEvJ85KQWfVT+cy7lrFCGM2ZrlunbRFgd47i60uDeiiJQbnbo
 D9b3hGjWAp5mA69dczYyRLhWc5IsQwuD8kNaPCPjvvM7pUsdAiGk/UW4DMYsNP7Ah1q4
 ojAg==
X-Gm-Message-State: AOAM531AcDYUhZMsyjtPAJ+8e8bQYNOOJYIVQucLg1M7+05cnWfn7eGL
 oAmvOR05kY5jdydvn5fzTPGS6XXs+SUTunYG
X-Google-Smtp-Source: ABdhPJxu4LfS8R3yBK/Xa+27jLXvaBBQZqsmDf9kqZlenFN2daJfmwlbZrP7aQQicQ0+bOb8+WN8xA==
X-Received: by 2002:a17:907:3f98:b0:6fe:e28c:472c with SMTP id
 hr24-20020a1709073f9800b006fee28c472cmr40426860ejc.519.1654031208428; 
 Tue, 31 May 2022 14:06:48 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49]) by smtp.gmail.com with ESMTPSA id
 f20-20020a056402355400b0042aca5edba7sm9219717edd.57.2022.05.31.14.06.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 14:06:47 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id
 c5-20020a1c3505000000b0038e37907b5bso1942753wma.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 14:06:46 -0700 (PDT)
X-Received: by 2002:a05:600c:3d8e:b0:397:73e3:8c83 with SMTP id
 bi14-20020a05600c3d8e00b0039773e38c83mr25043368wmb.29.1654031205884; Tue, 31
 May 2022 14:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220510192944.2408515-1-dianders@chromium.org>
 <20220510122726.v3.3.Iba4b9bf6c7a1ee5ea2835ad7bd5eaf84d7688520@changeid>
 <20220521091751.opeiqbmc5c2okdq6@houat>
 <CAD=FV=Wea0LT5umK4Xg87cDikim+dSuyLndfydO3_DnTujZr9Q@mail.gmail.com>
In-Reply-To: <CAD=FV=Wea0LT5umK4Xg87cDikim+dSuyLndfydO3_DnTujZr9Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 31 May 2022 14:06:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XqJuPHxm7HYMvyHBL_zC-BBA_f0MBsZX-jHt7Pk9ngsQ@mail.gmail.com>
Message-ID: <CAD=FV=XqJuPHxm7HYMvyHBL_zC-BBA_f0MBsZX-jHt7Pk9ngsQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] drm/bridge: Add devm_drm_bridge_add()
To: Maxime Ripard <maxime@cerno.tech>
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
 Philip Chen <philipchen@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime,

On Mon, May 23, 2022 at 10:00 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Sat, May 21, 2022 at 2:17 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi,
> >
> > On Tue, May 10, 2022 at 12:29:43PM -0700, Douglas Anderson wrote:
> > > This adds a devm managed version of drm_bridge_add(). Like other
> > > "devm" function listed in drm_bridge.h, this function takes an
> > > explicit "dev" to use for the lifetime management. A few notes:
> > > * In general we have a "struct device" for bridges that makes a good
> > >   candidate for where the lifetime matches exactly what we want.
> > > * The "bridge->dev->dev" device appears to be the encoder
> > >   device. That's not the right device to use for lifetime management.
> > >
> > > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> > If we are to introduce more managed helpers, I think it'd be wiser to
> > introduce them as DRM-managed, and not device managed.
> >
> > Otherwise, you'll end up in a weird state when a device has been removed
> > but the DRM device is still around.
>
> I'm kinda confused. In this case there is no DRM device for the bridge
> and, as per my CL description, "bridge-dev->dev" appears to be the
> encoder device. I wasn't personally involved in discussions about it,
> but I was under the impression that this was expected / normal. Thus
> we can't make this DRM-managed.

Since I didn't hear a reply, I'll assume that my response addressed
your concerns. Assuming I get reviews for the other two patches in
this series I'll plan to land this with Dmitry's review.

-Doug

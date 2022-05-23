Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAA6531530
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 19:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD4B10E4DA;
	Mon, 23 May 2022 17:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E2510EBC1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 17:07:56 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id er5so19916221edb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 10:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+yqE1pGHx1x3KKc79e6Yq8sNIx1yXpNzstv/8bzqb5s=;
 b=ZjtsMPgQV6WFMaPsFE5wXrme9HyysqJfDxmCwYeAGbvKIHUWff1Cpyv4vRAIzb2+6g
 CaBM3u9mN7ChwiUoZn0x2jmbmh8Ids9Twb+q9Mx4bev++DIoBHEX+JPi/peV3/cHXpnt
 ki/dDbMZHLrt1JuRTfIjOmj46abGOccIRmJ+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+yqE1pGHx1x3KKc79e6Yq8sNIx1yXpNzstv/8bzqb5s=;
 b=Jy0zjLy8agRgDo8L6zSZcireBjAEgq5udttgqbHHBKTHHT6GnxoB8Cv8SbsdFyB8+q
 nAg64qn1CaOSGtVW/N371B8NGNwcQpQeFiSgQlURSteIqSIb44M133ncNSg90pU5vdpn
 xj88mxFoBa40mXrdByGDcCAeHkP3wZkJiBMK9MpK1d1TeDyTda6KbHmBBgy3ZKY7264x
 glGf0UpCvFfROjiKLJitEAnDP0S5rB8q2AocC0Yybv0HYnWGxdDjO5eHZVzCiVBsBUy1
 u1YridFbMS2vndz1TECRjcN/sP3XfWV3VTM99QqtfxnA90UR5AxldpSIoCyzifXeAC3d
 tk1g==
X-Gm-Message-State: AOAM531an2BKTzXXCzM6Bgq7IJnuEcWn72kpP3UUTNo3OU7PeSfT32hZ
 PhK9Vm5ZYHIQUnR5dp7MrqUuMH8X3fsHnlaKfMQ=
X-Google-Smtp-Source: ABdhPJyNGfO9oECYjn2uV00V4bDBvnWWlIf0+HtgTpRsE9AGZs9EjqIB0Yfs3K/zWb/QA0WNfUe5Dg==
X-Received: by 2002:aa7:d659:0:b0:42a:b0d5:a64e with SMTP id
 v25-20020aa7d659000000b0042ab0d5a64emr24991900edr.157.1653325674389; 
 Mon, 23 May 2022 10:07:54 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com.
 [209.85.218.45]) by smtp.gmail.com with ESMTPSA id
 15-20020a170906004f00b006f3ef214dd9sm5925864ejg.63.2022.05.23.10.07.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 10:07:54 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id ck4so25898769ejb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 10:07:53 -0700 (PDT)
X-Received: by 2002:a05:6000:1c03:b0:20e:5cac:1eb5 with SMTP id
 ba3-20020a0560001c0300b0020e5cac1eb5mr19994642wrb.422.1653325252721; Mon, 23
 May 2022 10:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220510192944.2408515-1-dianders@chromium.org>
 <20220510122726.v3.3.Iba4b9bf6c7a1ee5ea2835ad7bd5eaf84d7688520@changeid>
 <20220521091751.opeiqbmc5c2okdq6@houat>
In-Reply-To: <20220521091751.opeiqbmc5c2okdq6@houat>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 23 May 2022 10:00:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wea0LT5umK4Xg87cDikim+dSuyLndfydO3_DnTujZr9Q@mail.gmail.com>
Message-ID: <CAD=FV=Wea0LT5umK4Xg87cDikim+dSuyLndfydO3_DnTujZr9Q@mail.gmail.com>
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

Hi,

On Sat, May 21, 2022 at 2:17 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Tue, May 10, 2022 at 12:29:43PM -0700, Douglas Anderson wrote:
> > This adds a devm managed version of drm_bridge_add(). Like other
> > "devm" function listed in drm_bridge.h, this function takes an
> > explicit "dev" to use for the lifetime management. A few notes:
> > * In general we have a "struct device" for bridges that makes a good
> >   candidate for where the lifetime matches exactly what we want.
> > * The "bridge->dev->dev" device appears to be the encoder
> >   device. That's not the right device to use for lifetime management.
> >
> > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> If we are to introduce more managed helpers, I think it'd be wiser to
> introduce them as DRM-managed, and not device managed.
>
> Otherwise, you'll end up in a weird state when a device has been removed
> but the DRM device is still around.

I'm kinda confused. In this case there is no DRM device for the bridge
and, as per my CL description, "bridge-dev->dev" appears to be the
encoder device. I wasn't personally involved in discussions about it,
but I was under the impression that this was expected / normal. Thus
we can't make this DRM-managed.

-Doug

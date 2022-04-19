Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EDF506F86
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01D710EEB4;
	Tue, 19 Apr 2022 13:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDED10EF10
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:56:46 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 u5-20020a17090a6a8500b001d0b95031ebso1945208pjj.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 06:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rw5QjY021RyzTeQ4xpVG99hTPF+Ij7oZl3AemnBjCL8=;
 b=KKbhPDuGJRNq+DSB9QxKIKwy8Tbd6ZArY094PBzD0N6dhwyeuB5UYs1cnDu9zNtHdD
 lgVXMlIhfl9h8fIW5SONAlLGncVvHUerMBgd+XthiBeXtwyG/PYlHIUCZoPW4xLuY/M9
 /XBtqGUMjQ/poMaTuf5nPSxu1y1M0NVcE1IFw4sINmE6FPN5wte3AWBMiIJLwmIESjeY
 ghnam4GhIHcgxzlMHO5ais+I1k6ySIPePgiIIkTIF/Aawv1LLiKbQMasGbq022GUtPNb
 uXPN/3tvtINHCvtKCvHmrKGcgysOkCwuEH1uhwzOuWrGtrC8ngqQzJXDQM2YjpI71e5D
 C4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rw5QjY021RyzTeQ4xpVG99hTPF+Ij7oZl3AemnBjCL8=;
 b=AYL5EUq3N7cAaZ2xuun7Bd2FtJ7AUAW3yQ4WtzPEryGoBdGlpDQ0JVYkaMXuQfDq73
 DdSvx/7aMDM6cnCOgzRxOvZArVRjGw2plBTP6DakT8KdEDjr0velqEWoueHpVESRdu5Q
 QyLV6UPqNhHlVuaZN/C+6Zn4WshXdsAsWkO9LAx1tD8cYbKaTr9/fXg/DW0dKKfCv71S
 luByAOEt4EYguMWpEpGjrm0oYAde35o/u76vHBOrKS75pjX6TIFC7nRKTOueh1TBmOYO
 c3q3mCUcfHi+5npfHwi8yjzQSzGzEEtu4GmVwC7rXKFd8aEUm+M89rUoeAeyiSIoXcMX
 N16Q==
X-Gm-Message-State: AOAM530xymz0LDr84joJ2QxlW6bW+YHtk84m1JRwzUDiNvwfi35M49KT
 V7Ca89nLFCw0OZXyC3sSZqW1AUgygmWdAEwbAt0b5w==
X-Google-Smtp-Source: ABdhPJwBanz3ZRElr/JD62R6VOJBk6pj27yLywloqYKldOS4kZbt7T1PXjjtGvH7meviG4zpYbv4lcXrNzqFbbvW9HA=
X-Received: by 2002:a17:90b:3e84:b0:1d2:c015:2182 with SMTP id
 rj4-20020a17090b3e8400b001d2c0152182mr6322697pjb.232.1650376606210; Tue, 19
 Apr 2022 06:56:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220414090003.1806535-1-hsinyi@chromium.org>
 <20220419022932.GA629745@anxtwsw-Precision-3640-Tower>
In-Reply-To: <20220419022932.GA629745@anxtwsw-Precision-3640-Tower>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 19 Apr 2022 15:56:35 +0200
Message-ID: <CAG3jFyv5Sv6Kr1Xad=gE6rd4=9t-0Yqz090pR26WOUrf3sqvMA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Fill in empty ELD when no connector
To: Xin Ji <xji@analogixsemi.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Apr 2022 at 04:29, Xin Ji <xji@analogixsemi.com> wrote:
>
> On Thu, Apr 14, 2022 at 05:00:04PM +0800, Hsin-Yi Wang wrote:
> > Speaker may share I2S with DP and .get_eld callback will be called when
> > speaker is playing. When HDMI wans't connected, the connector will be
> > null. Instead of return an error, fill in empty ELD.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 6516f9570b86..f2bc30c98c77 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -1932,14 +1932,14 @@ static int anx7625_audio_get_eld(struct device *dev, void *data,
> >       struct anx7625_data *ctx = dev_get_drvdata(dev);
> >
> >       if (!ctx->connector) {
> > -             dev_err(dev, "connector not initial\n");
> > -             return -EINVAL;
> > +             /* Pass en empty ELD if connector not available */
> > +             memset(buf, 0, len);
> > +     } else {
> > +             dev_dbg(dev, "audio copy eld\n");
> > +             memcpy(buf, ctx->connector->eld,
> > +                    min(sizeof(ctx->connector->eld), len));
> >       }
> >
> > -     dev_dbg(dev, "audio copy eld\n");
> > -     memcpy(buf, ctx->connector->eld,
> > -            min(sizeof(ctx->connector->eld), len));
> > -
> >       return 0;
> Hi Hsin-Yi, it's OK for me.
> Reviewed-by: Xin Ji <xji@analogixsemi.com>

Applied to drm-misc-next

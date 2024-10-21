Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3C79A5FAD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 11:06:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF5010E45B;
	Mon, 21 Oct 2024 09:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n/2NbnPe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B925C10E456
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 09:06:53 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e2974743675so3700063276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 02:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729501613; x=1730106413; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jA3p085WBVZjxthmW00sO8DEVEBHgAHr/aWoPpnBk54=;
 b=n/2NbnPeUDl1YmNA3O5gm66rK/9IwGzz64i88UEi7f2J2/S6ut3gaNXryZtRbU8iCb
 1/0JwuVIHQmlmvrMqGncZTPh2DehWjNIUROBJSzlv1zdE8Hlbq1N6vxw1mlNn9xPgjgs
 7avPVgUijzqyDmxiXGRFqVFT1sz8D8LEfuoWxPhvcoTpwfSKbfkV/QRcxikpVkKrMvNV
 fnQFNtZav2b78d+pphuyC+vc1QFVktbMeaVoOr9Yg1rfbD78XbDW3W01qsSet+dXsNlg
 exw5uFX847WQfZaboK5tVF64ltsOS0ALF+hqlwv2sxwMFKprVuzogyXMVA2ndFHA2tV/
 Qe9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729501613; x=1730106413;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jA3p085WBVZjxthmW00sO8DEVEBHgAHr/aWoPpnBk54=;
 b=UBGA/OI+yPMC2yVP69bBP2z5LxrgX9nfqdFDei8qoAA/XDHx+bT9pjf1l9Bx/It+qA
 H1o2hpatU8MvS62MqFaev37y/UF7Jth6Y4WbVSuOxOyibaiTCRAltMk5axgb734hiOhp
 I1ViDpRlWdnHG3rlM2onJV44thnXB5UQozpf8/BE0paVHD6winWbXVcW7TnEqP0CUxd5
 YsZYz2ryHOIuaSESh4A2tOXV0EnSQHFORp1sxK0R1ORa6vX0CjN9e2e4A+rZDpx30y/b
 9Fh11XAuz0/aGQCRHSSuNZvc3h/1iTDVoQS5eqZ1/FmJ52fqXZJ82uvH0ML36HCuJRUm
 z70A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc0OdKG3rx46ne9rzzOBEApCR5FEa956WbsIFm600RdKlzS+kId/8nDGZcROD1ysR14hLBGkCgeDA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxD61AQblys/Sz5zerNQ/SCjXHFy8CtKVKAs2KiPCXhE878HRN
 PFbuT620DVyg/uHUMgYkd4VUK5lphGQUQLoTQdarFTSj0j1wlCSQ+CcBRf6ISeX48QqZajM9BSf
 RX0Nch/WT18wzgnJqME7cY/Zmw7/1BCexQX0exw==
X-Google-Smtp-Source: AGHT+IEaP9MJaux+Mvm9jAqxzMdqSn1f+GPVXkxv1I5i5R13Oo9mtvtrHTONlbQt6H8kuW3J8xABR0qDJyPjxkF3F48=
X-Received: by 2002:a05:690c:610a:b0:6e3:36fd:d985 with SMTP id
 00721157ae682-6e5bfc8926emr109528627b3.23.1729501612759; Mon, 21 Oct 2024
 02:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
 <20241019-bridge-yuv420-v1-3-d74efac9e4e6@linaro.org>
 <28fb5aed-0387-4c16-96fb-c2c23ae315b0@linaro.org>
In-Reply-To: <28fb5aed-0387-4c16-96fb-c2c23ae315b0@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Oct 2024 12:06:46 +0300
Message-ID: <CAA8EJprfpKqJBvrS_dLKy40LHOaL4XVSpmXMGP__z1jsOjZ7Ag@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/bridge: display-connector: allow YCbCr 420 for
 HDMI and DP
To: neil.armstrong@linaro.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
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

On Mon, 21 Oct 2024 at 10:29, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 18/10/2024 23:49, Dmitry Baryshkov wrote:
> > Allow YCbCr 420 output for HDMI and DisplayPort connectors. Other
> > bridges in the chain still might limit YCbCr 420 support on the
> > corresponding connector.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/bridge/display-connector.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
> > index ab8e00baf3f1..aab9ce7be94c 100644
> > --- a/drivers/gpu/drm/bridge/display-connector.c
> > +++ b/drivers/gpu/drm/bridge/display-connector.c
> > @@ -270,6 +270,10 @@ static int display_connector_probe(struct platform_device *pdev)
> >       /* All the supported connector types support interlaced modes. */
> >       conn->bridge.interlace_allowed = true;
> >
> > +     if (type == DRM_MODE_CONNECTOR_HDMIA ||
> > +         type == DRM_MODE_CONNECTOR_DisplayPort)
> > +             conn->bridge.ycbcr_420_allowed = true;
> > +
> >       /* Get the optional connector label. */
> >       of_property_read_string(pdev->dev.of_node, "label", &label);
> >
> >
>
> I think we should make sure all HDMI bridges can filter out 420 before
> landing this, no ?

No, it's the other way around: if one of the bridges in a chain
doesn't set 420_allowed, then 420_allowed won't be set for the
connector, disallowing YCbCr 420 modes.
Before this patchset the bridge / platform drivers had to manually set
the flag on the created connector (see dw-hdmi + meson-encoder-hdmi or
msm/dp).

-- 
With best wishes
Dmitry

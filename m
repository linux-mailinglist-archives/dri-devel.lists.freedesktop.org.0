Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7B8878610
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 18:10:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2551D112BA5;
	Mon, 11 Mar 2024 17:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FHGlHYhB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61859112BA6
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 17:10:07 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dcc71031680so2886267276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 10:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710177006; x=1710781806; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZIOt5ylsa65gbubxlHlA5pNSze10toj9s/4bkxpYxRc=;
 b=FHGlHYhBU6jgB6GFv+iMLJAd6ZdDPobKFVe8xrSjPqpD9gK1MvJOqbrG5Fuh7N+w5k
 79cM8/Gdz3V3eWlRD04XT0eJPEB2hkM72bW0KBtwv8CREQFyR+pnN0Iqh1AXaa2oBGJS
 5QlWpdc1AbSXziiQZDSE9KaP6vlfoUJamsyqzywmCMKqWy0Rjll1T430v7Ui/N8LgtRi
 XxC9+8w2hKIbNgwfuNkopFA+eJ4yWOTxxlkXJHqthEOFEPdirBDuJi0FjfVrrp44HtXW
 4d9BVcjTnNYmtG7oa4A8OvOpyVHYSnG7A1RYPfu5v3yhhD0kQNL23I15ILCeSZ9myOIw
 TmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710177006; x=1710781806;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZIOt5ylsa65gbubxlHlA5pNSze10toj9s/4bkxpYxRc=;
 b=piwlNsd72NdxNmTtAV9ybyLeJ3msSts+TZkHW40KQdFsdbKvGkxPhASMOKE/09OJsh
 dOIOepCYqcg3ihX0URmscsxUoinWoqYkC82qJnZo7Ml8xrVOvTL41C8cipFgzsbPjnb/
 2ilwO15w7IRBz9cyGUQnTiv5M9l0bb3w9JXvwwrXuv8M6M6M4mBXZqBH/Hi+4VXyzMn9
 N3zmGC7dfivgZhl9J1qWf/wOPlV9HbXkYxC3ii1olWjuSwlazzV6g8fjVEZPRN01RWf8
 nhTs+8YVw27D4tBwCAEvsFsoscybzLGlQSMOR8ReXKZvjfwR1l53/Gs2RLHMRh4k60tV
 NcOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQgccLWLZOc3DgW+8ignH5+etJ0/HamD0waYKPKqKoZws6lYHNuOXrk9R3+CiQTB5g7t3Xi1D+IEeJEQa1sTsBUcZanNvkxAAG4jopCuTb
X-Gm-Message-State: AOJu0YzTMd3QTab4ZF+qIYLb9DbPxvLSuRAN7QQLFuX06LwlZeOcm6O6
 DHw7AI0FqNTr9b2/tcHTB16ZeZkOM1pxV/BQ0rxnGtJjWA93d8adD1cK/LZQ0ZYAn7zlYWQcIr8
 KJmjuNlv0O+5jSDmDjHXeSLupbeptOLBNAXmLsA==
X-Google-Smtp-Source: AGHT+IGhYwlGmJoM+ibOnMZbeqRf64uf0hwVNVKwk8rPtXO/AmgfcXTSkmS0XFzBj3JXNTymf52mNnPhvyLn5m4rZAI=
X-Received: by 2002:a5b:644:0:b0:dc6:a223:bb3b with SMTP id
 o4-20020a5b0644000000b00dc6a223bb3bmr4902864ybq.46.1710177006272; Mon, 11 Mar
 2024 10:10:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
 <20240309-bridge-hdmi-connector-v2-5-1380bea3ee70@linaro.org>
 <20240311-divergent-friendly-python-2c7d5d@houat>
 <CAA8EJpo-+qypK4gLrQGcCYi-AVtVzuCjh4HgJ6kRNsMTtNKKMA@mail.gmail.com>
 <20240311-offbeat-pogona-of-masquerade-3f40b6@houat>
In-Reply-To: <20240311-offbeat-pogona-of-masquerade-3f40b6@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 19:12:45 +0200
Message-ID: <CAA8EJpr9NRA5VgyaWmacWjhq0=xYBthzw=FNBsN+byWfYfzdDw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 5/5] drm/msm/hdmi: make use of the
 drm_connector_hdmi framework
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
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

On Mon, 11 Mar 2024 at 19:06, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Mon, Mar 11, 2024 at 05:55:36PM +0200, Dmitry Baryshkov wrote:
> > On Mon, 11 Mar 2024 at 17:46, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > Hi,
> > >
> > > On Sat, Mar 09, 2024 at 12:31:32PM +0200, Dmitry Baryshkov wrote:
> > > > Setup the HDMI connector on the MSM HDMI outputs. Make use of
> > > > atomic_check hook and of the provided Infoframe infrastructure.
> > > >
> > > > Note: for now only AVI Infoframes are enabled. Audio Infoframes are
> > > > currenly handled separately. This will be fixed for the final version.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
> > > I had a look at the driver, and it looks like mode_set and mode_valid
> > > could use the connector_state tmds_char_rate instead of pixclock and
> > > drm_connector_hdmi_compute_mode_clock respectively instead of
> > > calculating it by themselves.
> >
> > Ack, I'll take a look.b
> >
> > >
> > > We can probably remove hdmi->pixclock entirely if we manage to pass the
> > > connector state to msm_hdmi_power_on.
> >
> > I'd like to defer this for a moment, I have a pending series moving
> > MSM HDMI PHY drivers to generic PHY subsystem. However that patchset
> > reworks the way the PHY is setup, so it doesn't make sense to rework
> > msm_hdmi_power_on().
> >
> > >
> > > And that's unrelated to this series, but we can also remove
> > > hdmi->hdmi_mode for drm_display_info.is_hdmi.
> >
> > Yes, that's the plan, once I rework the audio infoframe handling.
>
> Sure, if it makes more sense to defer it for now, then let's postpone it
> :)

I hope to fix this one for v3. Audio InfoFrame should be converted too.

-- 
With best wishes
Dmitry

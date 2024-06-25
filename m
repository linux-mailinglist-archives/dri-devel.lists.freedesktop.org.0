Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC2A915ED2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 08:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5AC10E2B7;
	Tue, 25 Jun 2024 06:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HBmvyyzK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43AF910E2B7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 06:21:39 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-6454660553eso16641797b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 23:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719296498; x=1719901298; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=E8h+QAt+AnCIi8f4bWuVBQN+cusYRxI2Lf5DdexkiOQ=;
 b=HBmvyyzK4s2wYREQk8ztuuVWDhj2lve8IxcxL4A+nQ8ZRlTXbnU+Rta6F1r18uHn+N
 aRVRr8uaZLoM0AtpMGfgm/FIJjPBMTdqyKxa8WCumRJRQkMaolRNX8T1NzjRKFQ0UY6T
 4sv+XYJ1Q9AZEk1daZAyyKPd4SRjye6z1V/9gC7BIDUDsYR3TIgwYpoJ7cjKeld4kK5J
 t2MsFndhyIqnFhnhz0shjfw5OGqbPqQqnKAdJ9lbAJS7ysDLljy4DQgXGIsixor22ghY
 G5nthRhNlY5B4SBOCduvQbw9gxgLvntsIPZyyeWPdrd8BhvHxdWr5HPDeu7FiNSW63Jv
 W2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719296498; x=1719901298;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E8h+QAt+AnCIi8f4bWuVBQN+cusYRxI2Lf5DdexkiOQ=;
 b=q+VSe5ymCE35Odn93f8HxCRF36mZekmFZNrVubLjMb4RXuAAYEfnyf4Nhzm7TpXSFi
 5h8Ub3YtJ7rgCxEA6/yXj4x9CreJrqYiSZ7yphXDAggL1FJtH9Bx0wMAACSj8qCZzBnp
 fc7vUNk+hu5UA3IQ54nkc5CEwk7EDBQyx+8DstZyEa5Z/XzcTlDoOYRMbfpQf+GbAzUY
 8OfBvIJXMvbrq/+qGfQ59f9VbuDWP5B3kfDIstnLCazJFSkcSxopnIL7BBYtdnCMymOd
 3BQ7u3fqZr6rS78nSMube8Jm2DDjn9meuKHIwSrZnMcMrP9vXIKyAb5B0KNo1n4ylGcq
 sdwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA7ZFxVHx5leFHpF5pRvP9sFW79Y+id+k8Ri+6x4Y9/olAXsPKE7depWlmk5W+BtT2WOy5cZ+hfviPgEbsG7/NsYiEgiSSMomNwbvZrk86
X-Gm-Message-State: AOJu0YwrJD3Gi13cruXzpweEtJBCjbwSeh1fFA+VA+l8ZD/KxE7f7AOe
 8f/Fi2DaO67mEtZ4dvMBd65SMNnTzyffx+fkFTNmfdLx4D1Zv8bEKsJJ6D/eQwLBLpd6HafMTO/
 Pbb7RBsujyE+jAF0tT6Z5pxq0obMRisUj4/rkpQ==
X-Google-Smtp-Source: AGHT+IE+hPsnqRrxvUEK/lDnk62xZtQsZKqDpaowdgDDlT6ocbFhNfJnHF1nQyY0YgiVL/7XWxu0RPc4/5enaupC53s=
X-Received: by 2002:a81:8547:0:b0:631:8274:1611 with SMTP id
 00721157ae682-6433dd74338mr64895967b3.20.1719296498073; Mon, 24 Jun 2024
 23:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240623-drm-bridge-connector-fix-hdmi-reset-v2-0-8590d44912ce@linaro.org>
 <20240623-drm-bridge-connector-fix-hdmi-reset-v2-2-8590d44912ce@linaro.org>
 <99ff549c-f5c4-dc9c-42f3-396dc3d29d6b@quicinc.com>
 <CAA8EJppcH-z275m6xDQaigsxmVhnfJkLVsq68GHLFoAq_p_2GA@mail.gmail.com>
 <30fa4e53-5a03-4030-2be5-f383a1c60077@quicinc.com>
In-Reply-To: <30fa4e53-5a03-4030-2be5-f383a1c60077@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 09:21:27 +0300
Message-ID: <CAA8EJpo_dBDqLUVH-SkufhFchu64rhC+vkhVBFdt++E4pdCrQg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/connector: automatically set immutable flag
 for max_bpc property
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Petri Latvala <adrinael@adrinael.net>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Tue, 25 Jun 2024 at 01:56, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/24/2024 3:46 PM, Dmitry Baryshkov wrote:
> > On Tue, 25 Jun 2024 at 01:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> + IGT dev
> >>
> >> On 6/22/2024 10:40 PM, Dmitry Baryshkov wrote:
> >>> With the introduction of the HDMI Connector framework the driver might
> >>> end up creating the max_bpc property with min = max = 8. IGT insists
> >>> that such properties carry the 'immutable' flag. Automatically set the
> >>> flag if the driver asks for the max_bpc property with min == max.
> >>>
> >>
> >> This change does not look right to me.
> >>
> >> I wonder why we need this check because DRM_MODE_PROP_IMMUTABLE means
> >> that as per the doc, userspace cannot change the property.
> >>
> >>            * DRM_MODE_PROP_IMMUTABLE
> >>            *     Set for properties whose values cannot be changed by
> >>            *     userspace. The kernel is allowed to update the value of
> >> these
> >>            *     properties. This is generally used to expose probe state to
> >>            *     userspace, e.g. the EDID, or the connector path property
> >> on DP
> >>            *     MST sinks. Kernel can update the value of an immutable
> >> property
> >>            *     by calling drm_object_property_set_value().
> >>            */
> >>
> >> Here we are allowing userspace to change max_bpc
> >>
> >>
> >> drm_atomic_connector_set_property()
> >> {
> >>          **********
> >>
> >>           } else if (property == connector->max_bpc_property) {
> >>                   state->max_requested_bpc = val;
> >>
> >>          **********
> >> }
> >>
> >> I believe you are referring to this IGT check right?
> >>
> >> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_properties.c#L428
> >
> > Yes
> >
> >>
> >> I think we should fix IGT in this case unless there is some reason we
> >> are missing. Because just because it has the same min and max does not
> >> mean its immutable by the doc of the IMMUTABLE flag.
> >
> > Well, having the same min and max means that it is impossible to
> > change the property. So the property is immutable, but doesn't have
> > the flag.
> >
>
> True, then does DRM_MODE_PROP_IMMUTABLE need a doc update too indicating
> that even if the min and max is same, property will be interpreted as
> immutable.

Granted that I'm only doing it for max_bpc property I don't think so.

>
> >>
> >>
> >>> Fixes: aadb3e16b8f3 ("drm/connector: hdmi: Add output BPC to the connector state")
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/drm_connector.c | 7 ++++++-
> >>>    1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry

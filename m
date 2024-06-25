Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D81915FED
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 09:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F2810E2D7;
	Tue, 25 Jun 2024 07:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OYYLYNEH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD1110E4E7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 07:23:26 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e02bda4aba3so5338484276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 00:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719300206; x=1719905006; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4U4avMdImgQftnzL6jlWSke5cZt6SovRLmUKq0CgZWo=;
 b=OYYLYNEHcOqZeYjWbZzFfPUS2g1PdrnQ/ixS6ilnJ6f5AgRNjn+LOWESvxjHh+moTK
 Em0gQbpp5AeVDwzQfc34DIStefJR/PccIV1jeNc3MMo6aSlf5DSOSPCSEVF+tnHcBlts
 E+pfSomljPboe+EHMon5TvPLproBxrniTbFaM1Nlz0nq/0vT2V6yG4w5lDLRk96msSdA
 yJPT1Lmh7E0N6ngZo9b0qzzopjMfbhbnsJIO0RTlPCLISUUlydS5BGh7sZ1I/0BE/Lga
 N5H1/Wl2P4sl7jCNcMH2Y07Wn/pcdbdvfPSe3liYdlTIq9SSurN46T7b6YHSEeKGKQtH
 O+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719300206; x=1719905006;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4U4avMdImgQftnzL6jlWSke5cZt6SovRLmUKq0CgZWo=;
 b=kvFVLlI+9DdVqWAdk2ygW4xHnaZEMjyT6aQOmB2Dq+E1Bvsn2eyV50v5kNhpKZTiSO
 DX89Q1c27h2/6fgk0ixjeqFw/NmEB4M9hekRHut9ok7D+aR8OQYVS29QrT0COYmO+SI3
 ta0KzCedhWjLcg8rCcRx7IwXOdrQ1EslOiWsdXvv4OZ09P+KMmq/9noafhFQo6HYi+78
 SEVycHlxDU9txSGjCGpyWhQ949bTZQgNLF1dzz34HaVCtPbkQCbF/fwmHHmzJireUXKm
 wU/W843Fylixn+NV6GIeaboWBb7in3jTwaHnrluca+YWNbIOc9QDcnJxgLhkkExfDL0w
 msxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW46zvsCiqz+3DQPA/IcMex9ArEJVAiv9bCyIydCy0wqq5+oajExRmUflUwbv1nDJlvrgEZ4izAeZ0jj96w55ZSNM7nHKp4SW1iJtpWujaQ
X-Gm-Message-State: AOJu0YyVZbfxkdU59IPIf4Y+Esp3vwadwW3bQb2vgPpZ6rA1HPGWjXQj
 FnFHroVt73hnKCusN/ZTJr4V+9+2AZwm6E6XUI/yLLh8bat3I08XjGQfLg+Ijh6ULjLFmFhCifj
 IOkFU6WYoHTcLzRUSVd1pQEDbR61Qs+zjPcGOIg==
X-Google-Smtp-Source: AGHT+IEM0RHFhWq6hLIJX30Wlevk9s3pvCQZ4Q33iQ5XXrRyVvTax2Z6ZQ4ZcmC2TGM9LH8eWtH9I7nZW5r9pJKclN4=
X-Received: by 2002:a25:bd7:0:b0:e02:b548:1f06 with SMTP id
 3f1490d57ef6-e0303f52cb0mr6173827276.22.1719300205907; Tue, 25 Jun 2024
 00:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240623-drm-bridge-connector-fix-hdmi-reset-v2-0-8590d44912ce@linaro.org>
 <20240623-drm-bridge-connector-fix-hdmi-reset-v2-2-8590d44912ce@linaro.org>
 <99ff549c-f5c4-dc9c-42f3-396dc3d29d6b@quicinc.com>
 <CAA8EJppcH-z275m6xDQaigsxmVhnfJkLVsq68GHLFoAq_p_2GA@mail.gmail.com>
 <30fa4e53-5a03-4030-2be5-f383a1c60077@quicinc.com>
 <CAA8EJpo_dBDqLUVH-SkufhFchu64rhC+vkhVBFdt++E4pdCrQg@mail.gmail.com>
 <20240625-yellow-shrimp-of-genius-17c662@houat>
In-Reply-To: <20240625-yellow-shrimp-of-genius-17c662@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 10:23:14 +0300
Message-ID: <CAA8EJpr_kn=x080KLGfwsLi3PnnNhTjJhvL=hiRNLBD=WqSuZQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/connector: automatically set immutable flag
 for max_bpc property
To: Maxime Ripard <mripard@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
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

On Tue, 25 Jun 2024 at 10:19, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Tue, Jun 25, 2024 at 09:21:27AM GMT, Dmitry Baryshkov wrote:
> > On Tue, 25 Jun 2024 at 01:56, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > >
> > >
> > >
> > > On 6/24/2024 3:46 PM, Dmitry Baryshkov wrote:
> > > > On Tue, 25 Jun 2024 at 01:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > >>
> > > >> + IGT dev
> > > >>
> > > >> On 6/22/2024 10:40 PM, Dmitry Baryshkov wrote:
> > > >>> With the introduction of the HDMI Connector framework the driver might
> > > >>> end up creating the max_bpc property with min = max = 8. IGT insists
> > > >>> that such properties carry the 'immutable' flag. Automatically set the
> > > >>> flag if the driver asks for the max_bpc property with min == max.
> > > >>>
> > > >>
> > > >> This change does not look right to me.
> > > >>
> > > >> I wonder why we need this check because DRM_MODE_PROP_IMMUTABLE means
> > > >> that as per the doc, userspace cannot change the property.
> > > >>
> > > >>            * DRM_MODE_PROP_IMMUTABLE
> > > >>            *     Set for properties whose values cannot be changed by
> > > >>            *     userspace. The kernel is allowed to update the value of
> > > >> these
> > > >>            *     properties. This is generally used to expose probe state to
> > > >>            *     userspace, e.g. the EDID, or the connector path property
> > > >> on DP
> > > >>            *     MST sinks. Kernel can update the value of an immutable
> > > >> property
> > > >>            *     by calling drm_object_property_set_value().
> > > >>            */
> > > >>
> > > >> Here we are allowing userspace to change max_bpc
> > > >>
> > > >>
> > > >> drm_atomic_connector_set_property()
> > > >> {
> > > >>          **********
> > > >>
> > > >>           } else if (property == connector->max_bpc_property) {
> > > >>                   state->max_requested_bpc = val;
> > > >>
> > > >>          **********
> > > >> }
> > > >>
> > > >> I believe you are referring to this IGT check right?
> > > >>
> > > >> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_properties.c#L428
> > > >
> > > > Yes
> > > >
> > > >>
> > > >> I think we should fix IGT in this case unless there is some reason we
> > > >> are missing. Because just because it has the same min and max does not
> > > >> mean its immutable by the doc of the IMMUTABLE flag.
> > > >
> > > > Well, having the same min and max means that it is impossible to
> > > > change the property. So the property is immutable, but doesn't have
> > > > the flag.
> > > >
> > >
> > > True, then does DRM_MODE_PROP_IMMUTABLE need a doc update too indicating
> > > that even if the min and max is same, property will be interpreted as
> > > immutable.
> >
> > Granted that I'm only doing it for max_bpc property I don't think so.
>
> Yeah, I have to agree with Abhinav here, it does look fishy to me too,
> even more so that it's only ever "documented" through an igt routine
> that has never documented why we want that.
>
> I'm fine with the change if it's indeed what we expect, and it might
> very well be, but I'd like to clear that up and document it first.

Should I also move the setting of the IMMUTABLE flag to a more generic code?

-- 
With best wishes
Dmitry

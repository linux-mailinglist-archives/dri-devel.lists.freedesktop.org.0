Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E80D916A65
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 16:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5664410E681;
	Tue, 25 Jun 2024 14:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="k5FZh0WJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C64C10E67F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 14:31:28 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52cd9f9505cso4583642e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 07:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719325886; x=1719930686; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=terD6+QvpMZ2X6sUQUwDmG2WaJEp4OJC722UlqzDSBk=;
 b=k5FZh0WJce3uXXW4BDLqAgD1WdHqsdZjtBkhlUvRJHTfSvFADaKnNDM21of2ugdaBK
 q9m4HImdtkKhd8RJ+vbiuKeXCavN11ZBRmDFzsFEUFlKAT0C4NACZVmkNrizfJIlzN9y
 sJRy00Hv9GSpZiRj3mb3g/bVe3ONj00m18eJJjGT1CFIytYoTPUxT8AqRWlLqd1oD9BX
 sudD+DTOrB1CuUqOKvSAKdWUofAYP9BD90qMu/4N0tCid8SvnZO3vtsZ30AavgRqM29+
 FBQv2m4OAU1nVAJE2K0VyK+tt7P0IyyJqa5AvIUgGSPYlYLAplKCgs4nsAZJ71VvrY/3
 MZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719325886; x=1719930686;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=terD6+QvpMZ2X6sUQUwDmG2WaJEp4OJC722UlqzDSBk=;
 b=Uod6bBNyRg5uGJ7HWFuVBMSB9s0C9uhfRig+fSmTQZyxPMRkkE1Wzzel9V0CjlA0o/
 oH6IQaMa4lj+W57tEyiqSoU4/dZQPsQsyUIUZG8tFOor3obQzS3moRppl7UxYVR9BOaX
 Uth6JOAz7DVtEjQdc7I9jEA4lGTar+T0WbEzazCjJ6GY8hMUakTqakAFb4giM45TkAzn
 A8HPFfvvy+U94CR9bnpb0QulpRPGy5TLrGIZfsNcugNdLXxKVLQndZctj8afyzaLc9xt
 /nm3PRb37mqZ1oH/w4mQL6AJn65815Lbr3xJSbwkyR/v7nfp4KSsCzPcK6bV0+bK1mb5
 ZGCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCd8CrSFKkZ/eLzmpV8nf/vT09DMuqObMU/CzqBjTdj89Z1Rn+yf/QlEP5ZdGIGQBVaQDokSz0tsbOgJsPG594t1nBW15WledDqsXsb8r3
X-Gm-Message-State: AOJu0YwcEJ7F7jkfCMqDfXHI+yGuk6qPCmEyj723Yv1x2+LbaAL+Jprx
 2t1/bHHSTqbIfAUqaOE2PFwemFRWXoRItQc6rZtPnzOK0dc4mBUiWMsw7mrQfyg=
X-Google-Smtp-Source: AGHT+IEGzmjKZJbYhPPc3fbe7PHSu8pPNkw01sUFTND10FididG1OaZlj/O83Pz/ya65Uve+U0qYSQ==
X-Received: by 2002:a19:6452:0:b0:52c:7fc7:f40d with SMTP id
 2adb3069b0e04-52cdf7f108bmr4688866e87.21.1719325886353; 
 Tue, 25 Jun 2024 07:31:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63be24dsm1250303e87.95.2024.06.25.07.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 07:31:25 -0700 (PDT)
Date: Tue, 25 Jun 2024 17:31:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, 
 Petri Latvala <adrinael@adrinael.net>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/connector: automatically set immutable flag
 for max_bpc property
Message-ID: <qwcinsvam4xydeytbmpnbhssywyuiblri4pknuocec7ze6622f@yakhawuucf7v>
References: <20240623-drm-bridge-connector-fix-hdmi-reset-v2-0-8590d44912ce@linaro.org>
 <20240623-drm-bridge-connector-fix-hdmi-reset-v2-2-8590d44912ce@linaro.org>
 <99ff549c-f5c4-dc9c-42f3-396dc3d29d6b@quicinc.com>
 <CAA8EJppcH-z275m6xDQaigsxmVhnfJkLVsq68GHLFoAq_p_2GA@mail.gmail.com>
 <30fa4e53-5a03-4030-2be5-f383a1c60077@quicinc.com>
 <CAA8EJpo_dBDqLUVH-SkufhFchu64rhC+vkhVBFdt++E4pdCrQg@mail.gmail.com>
 <20240625-yellow-shrimp-of-genius-17c662@houat>
 <CAA8EJpr_kn=x080KLGfwsLi3PnnNhTjJhvL=hiRNLBD=WqSuZQ@mail.gmail.com>
 <20240625-enlightened-optimistic-fossa-fdd128@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625-enlightened-optimistic-fossa-fdd128@houat>
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

On Tue, Jun 25, 2024 at 03:58:25PM GMT, Maxime Ripard wrote:
> On Tue, Jun 25, 2024 at 10:23:14AM GMT, Dmitry Baryshkov wrote:
> > On Tue, 25 Jun 2024 at 10:19, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > Hi,
> > >
> > > On Tue, Jun 25, 2024 at 09:21:27AM GMT, Dmitry Baryshkov wrote:
> > > > On Tue, 25 Jun 2024 at 01:56, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > > >
> > > > >
> > > > >
> > > > > On 6/24/2024 3:46 PM, Dmitry Baryshkov wrote:
> > > > > > On Tue, 25 Jun 2024 at 01:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > > > >>
> > > > > >> + IGT dev
> > > > > >>
> > > > > >> On 6/22/2024 10:40 PM, Dmitry Baryshkov wrote:
> > > > > >>> With the introduction of the HDMI Connector framework the driver might
> > > > > >>> end up creating the max_bpc property with min = max = 8. IGT insists
> > > > > >>> that such properties carry the 'immutable' flag. Automatically set the
> > > > > >>> flag if the driver asks for the max_bpc property with min == max.
> > > > > >>>
> > > > > >>
> > > > > >> This change does not look right to me.
> > > > > >>
> > > > > >> I wonder why we need this check because DRM_MODE_PROP_IMMUTABLE means
> > > > > >> that as per the doc, userspace cannot change the property.
> > > > > >>
> > > > > >>            * DRM_MODE_PROP_IMMUTABLE
> > > > > >>            *     Set for properties whose values cannot be changed by
> > > > > >>            *     userspace. The kernel is allowed to update the value of
> > > > > >> these
> > > > > >>            *     properties. This is generally used to expose probe state to
> > > > > >>            *     userspace, e.g. the EDID, or the connector path property
> > > > > >> on DP
> > > > > >>            *     MST sinks. Kernel can update the value of an immutable
> > > > > >> property
> > > > > >>            *     by calling drm_object_property_set_value().
> > > > > >>            */
> > > > > >>
> > > > > >> Here we are allowing userspace to change max_bpc
> > > > > >>
> > > > > >>
> > > > > >> drm_atomic_connector_set_property()
> > > > > >> {
> > > > > >>          **********
> > > > > >>
> > > > > >>           } else if (property == connector->max_bpc_property) {
> > > > > >>                   state->max_requested_bpc = val;
> > > > > >>
> > > > > >>          **********
> > > > > >> }
> > > > > >>
> > > > > >> I believe you are referring to this IGT check right?
> > > > > >>
> > > > > >> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_properties.c#L428
> > > > > >
> > > > > > Yes
> > > > > >
> > > > > >>
> > > > > >> I think we should fix IGT in this case unless there is some reason we
> > > > > >> are missing. Because just because it has the same min and max does not
> > > > > >> mean its immutable by the doc of the IMMUTABLE flag.
> > > > > >
> > > > > > Well, having the same min and max means that it is impossible to
> > > > > > change the property. So the property is immutable, but doesn't have
> > > > > > the flag.
> > > > > >
> > > > >
> > > > > True, then does DRM_MODE_PROP_IMMUTABLE need a doc update too indicating
> > > > > that even if the min and max is same, property will be interpreted as
> > > > > immutable.
> > > >
> > > > Granted that I'm only doing it for max_bpc property I don't think so.
> > >
> > > Yeah, I have to agree with Abhinav here, it does look fishy to me too,
> > > even more so that it's only ever "documented" through an igt routine
> > > that has never documented why we want that.
> > >
> > > I'm fine with the change if it's indeed what we expect, and it might
> > > very well be, but I'd like to clear that up and document it first.
> > 
> > Should I also move the setting of the IMMUTABLE flag to a more generic code?
> 
> Possibly, but I guess that will depend on the outcome of that discussion

Agreed, I'll post it later today. Could you please ack or comment the first patch?

-- 
With best wishes
Dmitry

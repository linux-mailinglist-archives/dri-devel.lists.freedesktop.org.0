Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF9A911471
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 23:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833D110E157;
	Thu, 20 Jun 2024 21:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="D/YD5GBu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E23910E157
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 21:24:23 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ebeefb9a7fso15396831fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 14:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718918662; x=1719523462; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mFyki6Li5WwqMNFDu+p0N+C8j4Ogo1hQX4orW8yQhio=;
 b=D/YD5GBugEMmaYZYvDq9st9B0Z5elRm6mM+KQUJp+Bu0Z9HaZJOYbpIAoqqlXACHWX
 hOZkdhvPbMFFSLhd9M3ZoqTOnZfQu5WHKIVl9HGJi+3tdWrApMAHSXKoMHvXSFONyxwb
 FD8MxQggN2GQXgOMHzUpuPfwwTnYWxeS0jBHcylODogZQlbBvhhffWmFuRRMECMTDnV/
 6h5diqFMb+/kCIjkX31KeFvA25zr11NOKOp6W8cYLEr7mG5bcZjzqOGW+ZVlzxKJLsX/
 LzKe7t0VGHXZvO8INo8q5v5b69PFm5oHUX7KiQab87mdfikKo7R96RCb2384EtmM8ncW
 nsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718918662; x=1719523462;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mFyki6Li5WwqMNFDu+p0N+C8j4Ogo1hQX4orW8yQhio=;
 b=uuzAdQbnnSfPYcwUXuev989LLBiqkI8yJuu3SPfAzx7GWEGfRbH/u6mW61ucrsemX2
 JO0iDNvfCx2Cua4MYtl3RA+7LhddanQ0Z8OQSsi5rx84aIJIWVbC7U2EVVsqPkmul2Ru
 g2tD4NbgJKfWNYwT5Q3gyi9m3kqDa/vsoZ2eAOx/eRSTRP0I+J/W96HLQZs84+GGDXw7
 YaNqoGqDxpqle59qXptEQ+O6d8HDVB93xYwQX4V/GPKeVDfKYX8/IzGpDuXWDMQ+0JFI
 jHpEw+eVFq4bVen68guN7DpZeNtJMXok4ZL5BM7c3iMYe6Opn6PuEPcEH1Zm/8kKm0Ya
 S3Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxj3GCzxFKWWv1pKxyktrK0lxBagNP6CYKOyjpGsRLY3O+mBBFMcXcdE6hmMPE2uXRg0lP930VE6eZcdu3+Mj3vduXUzVUZTSQQRQCS/4c
X-Gm-Message-State: AOJu0YzVs3dI8+yfs/2lOwfLhn23jQ8C8mFBHcYAMtGyIbgrrZ/bPK0m
 ht/exvOskXMq1bW6BOymS+poeQyA3zkmo+HXSCbi7sejjhQBfTc1dWt1I1EZj6c=
X-Google-Smtp-Source: AGHT+IGdvA2DIoY5t70jMsOWedO2yArpk+phlv8FZmQtgjRbT12WJ2FeYFzLVCDHpnmOy3D7V2RrEw==
X-Received: by 2002:a2e:97d1:0:b0:2ec:4890:3750 with SMTP id
 38308e7fff4ca-2ec4890390emr18300431fa.39.1718918661577; 
 Thu, 20 Jun 2024 14:24:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec4d758170sm271791fa.89.2024.06.20.14.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 14:24:21 -0700 (PDT)
Date: Fri, 21 Jun 2024 00:24:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/9] drm/msm/hdmi: turn mode_set into atomic_enable
Message-ID: <il2bg6bsu4nu4lpztzwo2rfonttiy64grxcsn7n4uybn3eui77@jxyzd744ksva>
References: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
 <20240607-bridge-hdmi-connector-v5-5-ab384e6021af@linaro.org>
 <f34c4210-fd59-9d27-0987-3345631c9e35@quicinc.com>
 <xymopystyfjj3hpqes3uiw2g3dqynxzvz23snrbfzf2judgxnt@j4nmpcbuy7a4>
 <6d416e1a-1069-8355-e9f3-d2732df081a3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d416e1a-1069-8355-e9f3-d2732df081a3@quicinc.com>
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

On Thu, Jun 20, 2024 at 01:49:33PM GMT, Abhinav Kumar wrote:
> 
> 
> On 6/20/2024 1:32 PM, Dmitry Baryshkov wrote:
> > On Thu, Jun 20, 2024 at 01:27:15PM GMT, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 6/7/2024 6:23 AM, Dmitry Baryshkov wrote:
> > > > The mode_set callback is deprecated, it doesn't get the
> > > > drm_bridge_state, just mode-related argumetns. Turn it into the
> > > > atomic_enable callback as suggested by the documentation.
> > > > 
> > > 
> > > mode_set is deprecated but atomic_mode_set is not.
> > 
> > There is no atomic_mode_set() in drm_bridge_funcs. Also:
> > 
> 
> Please excuse me. I thought since encoder has atomic_mode_set(), bridge has
> one too.
> 
> > * This is deprecated, do not use!
> > * New drivers shall set their mode in the
> > * &drm_bridge_funcs.atomic_enable operation.
> > 
> 
> Yes I saw this note but it also says "new drivers" and not really enforcing
> migrating existing ones which are using modeset to atomic_enable.

Well, deprecated functions are supposed to be migrated.

> My concern is that today the timing engine setup happens in encoder's
> enable() and the hdmi's timing is programmed in mode_set().
> 
> Ideally, we should program hdmi's timing registers first before the
> encoder's timing.
> 
> Although timing engine is not enabled yet, till post_kickoff, this is
> changing the sequence.
> 
> If this really required for rest of this series?

No, it was just worth doing it as I was doing conversion to atomic_*
anyway. I can delay this patch for now.

Two questions:

1) Are you sure regarding the HDMI timing registers vs INTF order? I
observe the underrun issues while changing modes on db820c.

2) What should be the order between programming of the HDMI timing
engine and HDMI PHY?

What would be your opinion on moving HDMI timing programming to
atomic_pre_enable? (the exact place depends on the answer on the second
question).

> 
> > > 
> > > I would rather use atomic_mode_set because moving to atomic_enable() would
> > > be incorrect.
> > > 
> > > That would be called after encoder's enable and hence changes the sequence.
> > > That was not the intention of this patch.
> > > 
> > > NAK.
> > > 
> > > > Acked-by: Maxime Ripard <mripard@kernel.org>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >    drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 33 ++++++++++++++++++++++++++-------
> > > >    1 file changed, 26 insertions(+), 7 deletions(-)
> > 
> > 

-- 
With best wishes
Dmitry

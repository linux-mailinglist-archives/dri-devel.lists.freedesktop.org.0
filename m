Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1948D46EE
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 10:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8293F113576;
	Thu, 30 May 2024 08:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cizMk3oZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C138113576
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 08:20:39 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2e78fe9fc2bso6813041fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 01:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717057237; x=1717662037; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Z1Um35u1qvZuMCq7uXC40E27zn7y41HWRYxq0E1YCHA=;
 b=cizMk3oZ3hn+qJ5ACAQRv6BciFcx1plOeo05zfz9Qlvowe1uMqMmvr1zxzLAwo7KQQ
 0mD7Q3GYi9IEWuzhD9cfgyIZ1/FUh04ifzXorEbA/fkE7rXVpY7b0RYxXG6ESRG/M+mb
 K53paGToyD2mv8ybBXc1BFzAgF1DGxUxG7IW2e/7xp2RkN0PV0+crlliUxhoM+JXQN9E
 F4mlCTKh5Cuhl4MEEDwuKAam4pnQ2UQJwnM/pQs12zQzjt+8Im96RuuWwOHKHlFT3Bq6
 IW9w2owfRccyUIWu9SWQDn4nFvnvpyxscqQVRSUJ4p/anat19iKE8FCHpVqER5Glqgkn
 SHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717057237; x=1717662037;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z1Um35u1qvZuMCq7uXC40E27zn7y41HWRYxq0E1YCHA=;
 b=DFDvlhY5YJdXV/LvbGPHjU+FMrRWSRn13lqdxu+74Pqjm+KYxOJsZ6aQydAvAuPbdS
 XEIFpcs1Cr2hHTNQA0MxLPcA/8BJu1BRrmjbAv26TGlv8IwOPQDB1xKKcl2xcPHVMP+K
 +6W7jpsnBSR1LG7vLMZX8fXq483sygFo0aWJjUKatFmSj7mwnppK06g9Mu0Il5oUYDKa
 Bpd2aIbw9mPQD9ws9GqVmnW5VprAwWz5YxBSF6Zk7p/luHQrzLAFob7/eENbvMCMJ6uV
 e6AvYsIjkeJ++gHjsmdyPi3R3Hl5FsQf6PkQwLVOXONNIJWuBrzbYQnAd0+BbkuYu6YD
 MqSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWM5zsBSFcmphu+o7iv/SopFpAdsnFVBKCxNW0+l3bxbsoctLm5CvTcsIn3EzATeQQlblPXDOSJOUDW+QsSySgQGi2o7OCgD9eckg6zB0TG
X-Gm-Message-State: AOJu0YyYEJgsCFaaCJcmb/AnEubWMQrNTv2tE+hBGeZV2hfQ1i5nTikL
 UH1aPZHX3hxRDH2X56vrT4BNYzYVTc7Ls33qs4vBQ6Ygu9QCYTpiZdBRIltDQlE=
X-Google-Smtp-Source: AGHT+IG3/pKyXe6kjvzBTBZ+kW9if7vnYQBxUVROYSW9nUw+zsQXQ7KKovh+kC7NueTuWgD/hjgJPA==
X-Received: by 2002:a2e:b60c:0:b0:2ea:83fb:3e1f with SMTP id
 38308e7fff4ca-2ea848844demr7697071fa.37.1717057237335; 
 Thu, 30 May 2024 01:20:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ea847fbb25sm1282741fa.118.2024.05.30.01.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 01:20:36 -0700 (PDT)
Date: Thu, 30 May 2024 11:20:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ricard Wanderlof <ricardw@axis.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel@axis.com
Subject: Re: [PATCH] drm: bridge: adv7511: Accept audio sample widths of 32
 bits via I2S
Message-ID: <777om4a55azemxmnjnzjeuymtaeg7fvygijnl6uiyfruey63i7@anpkpyotbbhd>
References: <91472c14-3aeb-766a-1716-8219af6e8782@axis.com>
 <m7sghjgqtm45yjkpzrekeab7doojagxjts7vmw23a3tqtjltdj@v2oencka3uer>
 <adac6043-19f1-e965-e9eb-f3f1eaa6e067@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adac6043-19f1-e965-e9eb-f3f1eaa6e067@axis.com>
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

On Thu, May 30, 2024 at 09:17:03AM +0200, Ricard Wanderlof wrote:
> 
> On Tue, 28 May 2024, Dmitry Baryshkov wrote:
> 
> > On Tue, May 28, 2024 at 12:04:49PM +0200, Ricard Wanderlof wrote:
> > > 
> > > Even though data is truncated to 24 bits, the I2S interface does
> > > accept 32 bit data (the slot widths according to the data sheet
> > > can be 16 or 32 bits) so let the hw_params callback reflect this,
> > > even if the lowest 8 bits are not used when 32 bits are specified.
> > ...
> > > ---
> > >  drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 11 +++++++----
> > >  1 file changed, 7 insertions(+), 4 deletions(-)
> > > 
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > What about:
> > 
> > Fixes: ae053fa234f4 ("drm: bridge: adv7511: Support I2S IEC958 encoded PCM format")
> > 
> > ?
> 
> IMHO, commit ae053fa234f4 doesn't break anything, so there's nothing to be 
> fixed. It adds S/PDIF support, which uses a 32 bit format, but the 32 bit 
> format was not supported at all prior to that commit.

Agreed, let's keep it out of the question.

> 
> I don't really have a problem adding the Fixes tag if you think it's 
> useful, but it doesn't seem quite right to me.
> 
> /Ricard
> -- 
> Ricard Wolf Wanderlof                           ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden            www.axis.com
> Phone +46 46 272 2016                           Fax +46 46 13 61 30

-- 
With best wishes
Dmitry

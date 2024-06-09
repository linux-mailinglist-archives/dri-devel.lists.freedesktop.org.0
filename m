Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8E790182F
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2024 22:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BCB10E2A9;
	Sun,  9 Jun 2024 20:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ieUzWqgr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6060710E2A9
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jun 2024 20:59:06 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4217990f997so12233815e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Jun 2024 13:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717966744; x=1718571544; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=S/4EBuqn92sFzanqVMeYwTClL1PJfXX0U+C7af6lxxE=;
 b=ieUzWqgrErCROfLBSc0z0CexW75Pog5b0f41JChwKaPi4ls1CW2wLccFZwcdi3ksgF
 YyPSSJFXAJp2NdJpEd8/yDzYHKOuuPJsuXamg0JUcF0EgTp2MmWnTIps22L3Rw6yiV2/
 lOSzqpb0BJLgXwOGfxVFoiklngEPaf244SirwS2Kggi47LweGf0P8C0ni52rgPJazLU7
 ZwQJhV+Nh6d84Xc+Su2Zxg/ti5RN2odj29K+nLrwNZHtXFT4sN4Apn68f+8Trtl7fVTI
 WI7QjlbKoLvhqkYTu95DQVViUIOQ/7bt5KLcU7Umsq8z5EDGmyxsGQGLxwq2kc5jYZdf
 JC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717966744; x=1718571544;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S/4EBuqn92sFzanqVMeYwTClL1PJfXX0U+C7af6lxxE=;
 b=OZ4LieQeBs3RZhjhzWZGXP6pTdRD2xtZtiMObhsri+QZ+yBpg8J14F3ZpUQuhvpWJn
 9M8dZie54oF638aBxw9n/dye5qxzWX1pP6ctdvA5aZADCsdR58poMkaDgbFuZEUyxzD0
 bG6froiH1K4wIcpxhdDxXOfD4oS0dCU0ohgqQvAQzq4THRxBRIZT4kWgh2yzzrTL1vPB
 2QrGiYrYyGOSIRD6iU9752Y/pAP++o3kUSREFRzjfhXNC3z+TseOdP13eDqZiWR8/P2V
 dzZ1mN/pk+n1OGBqe428/w+Psan6E94tWzKYhMSz5g/m+uUPnpfaH59bjcLydYvcn2Uw
 2VPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAfBKCK9WkTPZ9WY7ElrqJBXb0R3NEWr4eo6zRtX7LSH/sv5J34SoJvjfRu5iONdHX7BzPTSAqvtBaZL+/5suH95bgTbnt0TFdArLkSzK8
X-Gm-Message-State: AOJu0YyO1gZCsi63FrwXIk3D9AwR7gx3DZm4IFf8Wzb/PP5yL6yv7h8w
 6HZqbx0DPn5Goa5b7VOEAm5NHxQXZEFnatpAGIlUBUAC3NBU6U2/E38wvCrAhbQ=
X-Google-Smtp-Source: AGHT+IEEO/PHTW8AqU1APaxSs65MvnQM7xM/9DOK9VOy1PLDH9qtbNk2AlRHMSQ2/X/MVbgwKv4E1g==
X-Received: by 2002:a05:600c:35c8:b0:421:819c:5d84 with SMTP id
 5b1f17b1804b1-421819c5f0bmr19950585e9.10.1717966744343; 
 Sun, 09 Jun 2024 13:59:04 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5d6985csm9336089f8f.60.2024.06.09.13.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jun 2024 13:59:03 -0700 (PDT)
Date: Sun, 9 Jun 2024 23:59:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Allen Chen <allen.chen@ite.com.tw>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Hermes Wu <hermes.wu@ite.com.tw>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: it6505: Fix potential NULL dereference
Message-ID: <85dd2c45-df99-4270-abeb-a3633afb9d6a@moroto.mountain>
References: <5e6e8882-478a-46c0-9119-b643d524cc0c@moroto.mountain>
 <vk76z5x3al6rrzb3n2misu6br4fbmc4kj3agyo4ry5fz7ajsm6@dfpq5yzuolvm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vk76z5x3al6rrzb3n2misu6br4fbmc4kj3agyo4ry5fz7ajsm6@dfpq5yzuolvm>
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

On Sun, Jun 09, 2024 at 10:38:39PM +0300, Dmitry Baryshkov wrote:
> On Sat, Jun 08, 2024 at 05:21:08PM +0300, Dan Carpenter wrote:
> > Smatch complains correctly that the NULL checking isn't consistent:
> > 
> >     drivers/gpu/drm/bridge/ite-it6505.c:2583 it6505_poweron()
> >     error: we previously assumed 'pdata->pwr18' could be null
> >     (see line 2569)
> > 
> > Add a NULL check to prevent a NULL dereference on the error path.
> > 
> > Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/gpu/drm/bridge/ite-it6505.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> > index 3f68c82888c2..4f01fadaec0f 100644
> > --- a/drivers/gpu/drm/bridge/ite-it6505.c
> > +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> > @@ -2580,7 +2580,8 @@ static int it6505_poweron(struct it6505 *it6505)
> >  		usleep_range(1000, 2000);
> >  		err = regulator_enable(pdata->ovdd);
> >  		if (err) {
> > -			regulator_disable(pdata->pwr18);
> > +			if (pdata->pwr18)
> > +				regulator_disable(pdata->pwr18);
> 
> Wait... I wat too quick to R-B it. The driver uses devm_regulator_get(),
> which always returns non-NULL result. So all `if (pdata->pwr18)` and
> `if (pdata->ovdd)` checks in the driver are useless. Could you please
> send a patch, removing them?
> 

Sure.  Will do.

regards,
dan carpenter


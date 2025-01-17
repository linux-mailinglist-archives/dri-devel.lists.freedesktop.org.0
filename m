Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4C7A14897
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 04:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4624810E23E;
	Fri, 17 Jan 2025 03:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aXxDYrNh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E972710E23E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 03:45:02 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5401c52000fso1668713e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 19:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737085441; x=1737690241; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=i4+rc7zr12NkY8+R4W4XzHgtWfwIjKXfUvC4zjsYnME=;
 b=aXxDYrNhTOTfOzKPwMcPD9ZzD6TfxbNN1wSLZjwcDg3wCByk4c03eTvmFIUgGQ2IO4
 xKBAVd9bUR3iNebI5IOnBjintq9XjD42oMXdsq2pQR8mPfMtt4nTOuJyTjm/2UZ4PgG6
 pMHOl4oC3ferSu6hZeF0+5ool0UKvlUoj/08lTC7ECXkeBSMvCXQV+ZsajBsVv02mz0L
 TZDcwOhDj+oLDn26SDhGF4higsAW9z/y2SC/oDARHa+T4RH3fHj8uVXc8CjnYSvK8R50
 2pwVJx5J2pWV654Offz9sCseISIDRF3RoJa9EtQFIIz3dpQwzAqcn2azvdvh/LBj0IhT
 N7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737085441; x=1737690241;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i4+rc7zr12NkY8+R4W4XzHgtWfwIjKXfUvC4zjsYnME=;
 b=NDw2Sqz8h1E8DgIZe3emr9XSbvRA7xT5dZuC6wwhKJ+7Re+w6VEqnQQQ9itwDTBqlU
 5x11Jb/P3ABZIzDur7fmzjgAek5oOFOaLYtJx3VHJ1WG5UzeclYDW67x6fxyHjYh0q+Q
 IapBabhm8XH4f4MhDRlbOKIlSi6i8mLD1Uog3deR6qfC1TYnauifdF/R7vwTd1JWhADp
 re+WkXyg85pA3NeltBPNiyh6C3S/q0UPF4EHnNqXpaThirQVU69+Ua2SsG97bk/R/1tv
 o6Ex5C4oA9rcy4pK3/fj1lSxx8gliMYahRlHgzoj9a3nXoTduRIYBPWR6wqY6250Tmzk
 M47w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoyJxXHvwm0sDq5a8opC3wlat4/8okmzMlmbLb7GtGcRcBhoXwocTWZ362XrCLLyCmNxV7aX2SjyU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLHQLm5JWrC4MMZwDvX42oh6e8k5bdxis3HRZWB/JZiKqruY6s
 DJGmuMHlKY14uFnj09UOZ/+r5G/ONJ13ucRkPN7f64vxEc7cQmOp2edMBA22rA0=
X-Gm-Gg: ASbGncud6/KrD2KbwC1RIkI4ZLTlh4lvpUxORtNakZaC9fGSarT7IQdQ94Ip3F3Z1CK
 Tlwx0GWos5drJUTRJstmJ4D42DicvRPJ46qKZ2gCauNOe5zYs4SIU0BBNieaO6flZPGue+YVHSO
 P+09uxcBZccbm0DLPqN8l4D8CZpwq21jN62qlwGk4Rl9gaKskzq/EBY2WUyn/m8ANJxDyOnwDo3
 7g/+pGZ8BilFIMPY3at0X1kSnx0mI8e8eFki4WOdwoRm/4fYCrKqGCLFgE5o1PkPuyXifhBOrgk
 gSRbKEaxpBOm1oi4Ol260buVvzvgshzLeY6P
X-Google-Smtp-Source: AGHT+IGz5ay7LtZ6+rSD2XP9rxWv/jABbs6ebwXD/MzQJbyjd0oZnFaAjrC0FEJz70e5w3SHfSay0A==
X-Received: by 2002:a19:5518:0:b0:53f:231e:6fa2 with SMTP id
 2adb3069b0e04-5439c253a05mr197064e87.26.1737085441361; 
 Thu, 16 Jan 2025 19:44:01 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af78d57sm190046e87.232.2025.01.16.19.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 19:43:59 -0800 (PST)
Date: Fri, 17 Jan 2025 05:43:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>, 
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>,
 Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
Message-ID: <2alm7gds4k2lnbk36gjdw6yhzhpls3ce5baycdiv7lsigxsbzn@rhwdgnphwwp6>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
 <20250114-adpdrm-v4-2-e9b5260a39f1@gmail.com>
 <mu7qiybhj7tu5hauk7izfxqlookc3awpknhjk74zwpkbznei4m@kewap6vivzoa>
 <20250116-vivacious-congenial-nightingale-cb2f6d@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-vivacious-congenial-nightingale-cb2f6d@houat>
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

On Thu, Jan 16, 2025 at 05:01:03PM +0100, Maxime Ripard wrote:
> Hi Dmitry,
> 
> On Wed, Jan 15, 2025 at 12:21:39PM +0200, Dmitry Baryshkov wrote:
> > On Tue, Jan 14, 2025 at 10:38:53PM +0100, Sasha Finkelstein via B4 Relay wrote:
> > > +static int adp_dsi_host_attach(struct mipi_dsi_host *host,
> > > +			       struct mipi_dsi_device *dev)
> > > +{
> > > +	struct adp_mipi_drv_private *adp = mipi_to_adp(host);
> > > +	struct drm_bridge *next;
> > > +
> > > +	next = devm_drm_of_get_bridge(adp->dsi.dev, adp->dsi.dev->of_node, 1, 0);
> > 
> > select DRM_PANEL_BRIDGE for this API to be available.
> > Also there is an issue of lifetimes. The bridge will be destroyed only
> > when MIPI driver is unbound, however the panel can be attached and
> > detached several times.
> 
> Can you expand on that one a bit more? AFAIK, it's always been unsafe
> and we don't have a good mitigation at the moment, so it's unclear to me
> what change you want here.

I was thinking about using drmm_ here, as the DRM device is also created
and destroyed each time. But I might be mistaken here.

-- 
With best wishes
Dmitry

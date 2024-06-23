Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 825A2913E3C
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 22:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CF710E1C6;
	Sun, 23 Jun 2024 20:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TUycmvzG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA81610E180
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 20:54:39 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52cd9f9505cso2470985e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 13:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719176078; x=1719780878; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CQ6PtGCSFslWh1NWs4l9F/KIrbPK8P3SynMUjUqvTRk=;
 b=TUycmvzGUZ5rzm8yNCvEJxrJ8MmbIYHz8rFNMK+9Uvj1RGLZt8aOsc6Bh9/PLiiqRE
 ly3JBGTNc+eozEQB4f4gg743f5dyqR/Nm0YxTTtxhfWXBTPrgSvRqleb2KRul/4cfzUq
 Zmk3SFY+kKhrb7EtG8jrzf4kpxpIIBbcMr82xCfF53UtaNQOrzilDLuNoZSdXixccNuv
 JR+zYADyv3y1svAS8PHlzLY6RiwyJv43Imwl2B0r7ugDSL/Em8UnIy/44zT1hxU6AAFk
 p8Yyqffxg4IdDOc0JNx68A80NCct9WAwBxcRoHmf/+dDEO7b8NWuGSuJxJvyv4IYo58E
 jh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719176078; x=1719780878;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CQ6PtGCSFslWh1NWs4l9F/KIrbPK8P3SynMUjUqvTRk=;
 b=xIght/rJ1SIRwGFFlmOo851XLOnxmJnvnicR4dqtn8RrU1n2ozWxzsKEalZ9lviMxX
 6pkVhyQDBJBibeOgftXPFBtu0AcsOKiQEUV5hhObhD866ZqJ2W0OoNpgwuBOEimoDmXn
 2e2OFRM6eZL3M9Hg+Q8+E2DBmWyOHthUVTemMEPfWIJB8W3d7loAIid+roML0VuW9Uzp
 z4oSWdN9pDlSzlHB6mX83m1VAWOfkvPsP/8yXr6lma9JUH6lS3FJ1k+vem4f2Wyz7r+o
 bID0bsXZCIXB4XT5x/kB1PXW7+PrXe9AR6AQHyK+r6LAWh9CLPIiQFwgnxhCxY/pMTJD
 IS+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ39w4+ycDOMcdiivaooRhwMR+O3NSisGcANukXlz/dsJ6EWTutSr7WOJdETiIFbFESgalpU6C+C5RceBDWt9JpcAk0pGLh4TlZfrtU4mq
X-Gm-Message-State: AOJu0Yxyp4M0mvNkeIgxJ/ycvU4QxSli4f2XvbFIU0OXcAQzW4OEDJD6
 FItb/OlZvlarcUAvBkx51wN7HbixzoWvDsIlP1zwJnI3dXKw8ikVJbw+mU1B6aw=
X-Google-Smtp-Source: AGHT+IHcvQBzyPAeMdz+wbElXVCVQl+gsHiPe/J7kj0/xSGAFtwHdOhJ+qHCSmuAqniUaRWk/9TkJQ==
X-Received: by 2002:a19:f614:0:b0:52c:dbd9:45e7 with SMTP id
 2adb3069b0e04-52cdf826730mr2349608e87.57.1719176077718; 
 Sun, 23 Jun 2024 13:54:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63cb64csm845518e87.108.2024.06.23.13.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 13:54:37 -0700 (PDT)
Date: Sun, 23 Jun 2024 23:54:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, 
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>, 
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, 
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, 
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "robh@kernel.org" <robh@kernel.org>, 
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "hjc@rock-chips.com" <hjc@rock-chips.com>, "heiko@sntech.de" <heiko@sntech.de>,
 "andy.yan@rock-chips.com" <andy.yan@rock-chips.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>, 
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 Jack Zhu <jack.zhu@starfivetech.com>, 
 Shengyang Chen <shengyang.chen@starfivetech.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 06/10] drm/vs: add vs plane api
Message-ID: <2bo3yzeogfup2qfyeqrq2ini7g3evshteqpd5lxr6l5jupfo6w@tqwg2zuhlpph>
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
 <20240521105817.3301-7-keith.zhao@starfivetech.com>
 <gcwvgco3ixpwaalnaq5qzwcp3sq44dgphps7vlqm6zdozu6ci2@vfq4ovpxk25n>
 <NTZPR01MB1050934BBB12DC9DC8BD9740EECB2@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <NTZPR01MB1050934BBB12DC9DC8BD9740EECB2@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
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

On Sun, Jun 23, 2024 at 07:17:07AM GMT, Keith Zhao wrote:
> > 
> > On Tue, May 21, 2024 at 06:58:13PM +0800, keith wrote:
> > > add plane funs and helper funs
> > > add vs drm common struct and funs
> > >
> > > Signed-off-by: keith <keith.zhao@starfivetech.com>
> > > ---
> > >  drivers/gpu/drm/verisilicon/Makefile   |   3 +-
> > >  drivers/gpu/drm/verisilicon/vs_drv.h   |  93 +++++
> > >  drivers/gpu/drm/verisilicon/vs_plane.c | 487
> > > +++++++++++++++++++++++++  drivers/gpu/drm/verisilicon/vs_plane.h |
> > > 26 ++
> > >  4 files changed, 608 insertions(+), 1 deletion(-)  create mode 100644
> > > drivers/gpu/drm/verisilicon/vs_drv.h
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
> > >  create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h

> > > +
> > > +/*@pitch_alignment: buffer pitch alignment required by sub-devices.*/
> > 
> > Is that all the docs you want to add?
> It should delete the redundant parts which is unused,
> To make this patch clearer to review 

I'm sorry, I can't understand your comment.

> > 
> > > +struct vs_drm_device {
> > > +	struct drm_device base;
> > > +	unsigned int pitch_alignment;
> > > +	/* clocks */
> > > +	unsigned int clk_count;
> > > +	struct clk_bulk_data	*clks;
> > > +	struct reset_control	*rsts;
> > > +	struct vs_dc dc;
> > > +	int irq;
> > 
> > As usual, please drop unused fields and add them when required.
> 
> In principle, I try to split the patch independently according to this.
> In fact, there is still a lot of room for optimization
> The subsequent patches will maintain independence and remove redundant parts for decoupling

Yes, please.

-- 
With best wishes
Dmitry

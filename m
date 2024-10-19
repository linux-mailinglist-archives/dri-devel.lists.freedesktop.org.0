Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CF89A4EFB
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 17:12:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B4B10E190;
	Sat, 19 Oct 2024 15:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OknEDKth";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE47010E190
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 15:11:55 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-539e8586b53so3445379e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 08:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729350714; x=1729955514; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Nb/Hai4/ZFPWWuvb61BWUzY8KGM98YH4lS2Tuv7vwwU=;
 b=OknEDKthCST2nwwROvjL7eFwlSzewecGVMNS2k1fQmDHj6VcwD15Oph26ST1/+6qXK
 2ivyI4y/yHraXJgcnL05Hy0CYQWt9/P6j5vPP9FEz+UL12IjmAJ798uJEw8CSjycwMU4
 YcJXzLZ7z7yBl38gaG6ZUPfSCzWNLEX9vB/p3ZkhGEjfHX1P2D7L0H+ZPmfBfO/5qYqk
 66DUpPTYbjakQlhb7f9CYEzZy24vswQxhzCmWzm7k0azVNG/sbnQa0hs2BbRvsjCZYXF
 PRGoLfY/z7FPBUtoyprnKh9btSfLWz4UTQToJQDh6bp6h9XJEKpGBwlGgTVZDqNtCtB8
 oLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729350714; x=1729955514;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nb/Hai4/ZFPWWuvb61BWUzY8KGM98YH4lS2Tuv7vwwU=;
 b=FNP/I+g040NmKUc/g24TkxtsmLtsYmz10cWvSx4NIMYNelRYe9EfmF2F/85glJozUc
 RwAaYfViKTJjiNve6acTxvrTINJdSYV/XeY9DEivh8Z7olFvUeaRTnGgVvB2eUZCkQFC
 I/Gp6sgJLGqqPTybqrSYra2/JNnikIbBx60k90JnJxiqphuI4C3uAZ7aa/JR+v0NGYpL
 k0e5BpToO9YsMtcUpQuSROIPvs92vHk3Iki9ERQFhzUfGdkg/P8JmYFZFPzixvFou90t
 hmwb5atcsIzQ9rLfskQ2bbAUoZHvMxPmj+sr108d3DLO2A97BHdsVPoAHG8Y2DZZCXHu
 uhXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4G9GcKXtyi+BlS9f2Nf/hprmMjIDDzNqeKMGoJFDC8MYD1WhQkT0A8C2cWube8vd4TnOph9x3mto=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnGH0FTQtW+6ePbHXqEBY12ZkWH7z8PETwPvdl+Qyp8UvI7iwM
 kJ/T+6JYXxnNTGDb0olW9hr1z1jQ+IUm6B3Qg4daPjr3UrMWpXEMsAOlwygsjxA=
X-Google-Smtp-Source: AGHT+IEpTyjPk7DvbEShcUaeYyGDz9czzrSWTbsRLCmDec44UsUXygtFMkhSHXOFLJ9ciGGl8Iw11w==
X-Received: by 2002:a05:6512:23a5:b0:539:f922:bd3a with SMTP id
 2adb3069b0e04-53a0c7525aamr3223014e87.25.1729350713890; 
 Sat, 19 Oct 2024 08:11:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a15211a8fsm551733e87.261.2024.10.19.08.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2024 08:11:53 -0700 (PDT)
Date: Sat, 19 Oct 2024 18:11:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Steffen Dirkwinkel <lists@steffen.cc>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: xlnx: zynqmp_dpsub: also call
 drm_helper_hpd_irq_event
Message-ID: <yc43bbhfcc6nnrgxke2khkgcxxpt7mne2vmrggpkkc7gdwet4e@prpfb2wpgs66>
References: <20240923074803.10306-1-lists@steffen.cc>
 <20240924184335.GJ30551@pendragon.ideasonboard.com>
 <e4626c1d3b28613d1d219c735bcd8525be0f0d9e.camel@dirkwinkel.cc>
 <20240925163609.GD27666@pendragon.ideasonboard.com>
 <6cea659387e14f0436105053416a42c4729923b3.camel@dirkwinkel.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6cea659387e14f0436105053416a42c4729923b3.camel@dirkwinkel.cc>
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

On Wed, Oct 09, 2024 at 04:28:26PM +0200, Steffen Dirkwinkel wrote:
> Hi Laurent,
> 
> 
> On Wed, 2024-09-25 at 19:36 +0300, Laurent Pinchart wrote:
> > Hi Steffen,
> > 
> > On Wed, Sep 25, 2024 at 09:54:18AM +0200, Steffen Dirkwinkel wrote:
> > > On Tue, 2024-09-24 at 21:43 +0300, Laurent Pinchart wrote:
> > > > On Mon, Sep 23, 2024 at 09:48:03AM +0200, lists@steffen.cc wrote:
> > > > > From: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>
> > > > > 
> > > > > With hpd going through the bridge as of commit eb2d64bfcc17
> > > > > ("drm: xlnx: zynqmp_dpsub: Report HPD through the bridge")
> > > > > we don't get hotplug events in userspace on zynqmp hardware.
> > > > > Also sending hotplug events with drm_helper_hpd_irq_event
> > > > > works.
> > > > 
> > > > Why does the driver need to call both drm_helper_hpd_irq_event()
> > > > and
> > > > drm_bridge_hpd_notify() ? The latter should end up calling
> > > > drm_kms_helper_connector_hotplug_event(), which is the same
> > > > function
> > > > that drm_helper_hpd_irq_event() calls.
> > > 
> > > I don't know why we need drm_helper_hpd_irq_event.
> > > I'll try to trace what happens on hotplug.
> > 
> > Thank you. Let's try to find the best solution based on your
> > findings.
> 
> There's just nothing registering for hpd with
> "drm_bridge_connector_enable_hpd" or "drm_bridge_hpd_enable". I'm not
> sure what the correct way to implement this is. In
> "drivers/gpu/drm/bridge/ti-tfp410.c" the driver registers for the
> callback and calls "drm_helper_hpd_irq_event" in the callback. I guess
> we could also do that, but then we might as well call
> drm_helper_hpd_irq_event directly? Some other drivers just call both
> like I did here. (drivers/gpu/drm/mediatek/mtk_hdmi.c for example)
> For "drivers/gpu/drm/msm/hdmi/hdmi_bridge.c" I also can't find the hpd
> enable call and it just calls drm_bridge_hpd_notify.

The drm_bridge_connector handles enabling it for you when the driver
calls drm_kms_helper_poll_init() / drm_kms_helper_poll_enable(). It
seems zynqmp_kms calls drm_kms_helper_poll_init() too early, before
creating DP chain, so the HPD doesn't get enabled.

> 
> > 
> > > > > Fixes: eb2d64bfcc17 ("drm: xlnx: zynqmp_dpsub: Report HPD
> > > > > through
> > > > > the bridge")
> > > > > Signed-off-by: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xlnx/zynqmp_dp.c | 4 ++++
> > > > >  1 file changed, 4 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > > > b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > > > index 1846c4971fd8..cb823540a412 100644
> > > > > --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > > > +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > > > @@ -17,6 +17,7 @@
> > > > >  #include <drm/drm_fourcc.h>
> > > > >  #include <drm/drm_modes.h>
> > > > >  #include <drm/drm_of.h>
> > > > > +#include <drm/drm_probe_helper.h>
> > > > >  
> > > > >  #include <linux/clk.h>
> > > > >  #include <linux/delay.h>
> > > > > @@ -1614,6 +1615,9 @@ static void
> > > > > zynqmp_dp_hpd_work_func(struct
> > > > > work_struct *work)
> > > > >  					    hpd_work.work);
> > > > >  	enum drm_connector_status status;
> > > > >  
> > > > > +	if (dp->bridge.dev)
> > > > > +		drm_helper_hpd_irq_event(dp->bridge.dev);
> > > > > +
> > > > >  	status = zynqmp_dp_bridge_detect(&dp->bridge);
> > > > >  	drm_bridge_hpd_notify(&dp->bridge, status);
> > > > >  }
> > 
> 

-- 
With best wishes
Dmitry

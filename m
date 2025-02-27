Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 224B4A48326
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 16:38:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257B910EB0F;
	Thu, 27 Feb 2025 15:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OqOHFiaL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1EDE10E396
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 15:38:44 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-54298ec925bso1677397e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 07:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740670723; x=1741275523; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hmJa4nq3xcrEbO8I6gQ8yH2cvEg/RJVZoqiHM7UJBfs=;
 b=OqOHFiaL+em4x52oXeu7lgxh7fFGZBCddmzkO28LElsxWerdN/l+72vsUVHB70TriM
 VvEx+p5lM8PCYYtXUN4/oKEDlz/Jrrwo4cTLhqDPCom4BE9mbvbToC7JHYaMsEBjnkAL
 Pq1RX7slHX2lGBzRhd2SufCSOnn0FEFH4QkaRht6DIOrgsZ0Cd3hfk2fJTkbZqFnEm+G
 3wlEX3Piw/A/IgWKuYzUYy2DosrWp9kHUwdl/WQKa/Aa9bOuFOWF6yqwXFTYcJwy1f0h
 azmwSp2gpRW6BqMrqmabzr2M8DG/6HA2IXDhAu1/rTbjMUFc+XliDJbUNjxlJXQNG+WC
 KMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740670723; x=1741275523;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hmJa4nq3xcrEbO8I6gQ8yH2cvEg/RJVZoqiHM7UJBfs=;
 b=bozTAUF62axUVgj65unkZgJWVg+7D2dsZq+lZ5V8Sr15YAZLW0poSwzrKjGvhELIBq
 8uKym7O3GOrHg8Cl3oULsy14k9eH5LwsSXnZnFVvB1GIO+zkBW4xrz34amAhd2zDsnsh
 59FX/sjFVeZxS0uD7jLdst5JoQCiqofGMnDmHCDmLGMNEhZ2ouUUdw4jsHOnC+tn5wmk
 kx4FP5HzaJNtTx142AeTlVPg7JySqtP74RjR355lBkttoZMp3Jr0wBkhh96cTv7jeVUu
 cDOO1WOABRQyIRDPvOhf2GDV5wnQpQ4Kuzr5fDpLAWENCzdhDI9QgoWdbfffWBjevMwK
 CFyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyxB5IkHyOdJ31+BVLnvfUv39jPIAw+DbKn0loRlx4kYiVslVBiK/rh/LCMrCMFMdD28Yu1J6F5wM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmcDMB4pqSsir8r5QLtkmcMAqExgO3kZKtZN45qSIlinyLGPKv
 i/06uW9b6ObL968cTA5EvPZdObpRdpvm4l2wqBSzhP7A5ZTFJ2nCiGED9dKxg1g=
X-Gm-Gg: ASbGncsfGssv1QlRmHL2YG59pgCjnevwxVOfYwHRTVnffnprzhiOQuZ5cUkGK1v/9MX
 RpvGvSjFZPWRxZrMJtkSpxExC+lOoX6NWaxqjVssiaCW4fbYgkyGuTt5sZIIL9B/yGHiFvqdGw1
 5AAcqM4VDhT58Tse3ffWrdjj8Dsg++Na+0kKcHuzpKB58q3AdlMlwMl+bZzqq6SDyhGiy/ixkVf
 K7RmoS/xD57sUR07yJJBJYQojD8VbOBQR0rjs7iLocgyfI7q3PkvTJEUAwrnvhhU4FqmQQbxkcv
 hmrRuhP4y1jot2TZe0IW0vJ+ijU9AKrOjWywOyMdz0TQoBY2xnwhcAowvfg3w8xk4KmA0RVvA5/
 ajFQLXw==
X-Google-Smtp-Source: AGHT+IGLNuY/DiXj5lSnsG6IMOYZEwkpNVtYtEF8TL4nLURfU4/52wLS36QXQ1sPlbQ5r323ZGXWiw==
X-Received: by 2002:a05:6512:3f07:b0:545:a1a:556b with SMTP id
 2adb3069b0e04-5493c373156mr5089100e87.0.1740670723108; 
 Thu, 27 Feb 2025 07:38:43 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443cd443sm185769e87.253.2025.02.27.07.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 07:38:42 -0800 (PST)
Date: Thu, 27 Feb 2025 17:38:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 drm-dp 7/8] drm/hisilicon/hibmc: Enable this hot plug
 detect of irq feature
Message-ID: <4hicem4rbz5l7wnzaaz3krrl3euh2dmvlah2rb7errrdq5fann@44dvdxirkuzh>
References: <20250222025102.1519798-1-shiyongbang@huawei.com>
 <20250222025102.1519798-8-shiyongbang@huawei.com>
 <reqpxlbvlz5qssgy6gbjuou33h4zevo4xeztqbsr4keehplyhx@utv22a5ihohx>
 <eef68fc7-30f4-4246-a82e-4f90cd6a665d@huawei.com>
 <6jx5ldpidy2ycrqognfiv5ttqr5ia4dtbryta3kc2mkndrvvgo@qzuakucz765k>
 <6634386b-afc1-4e31-a2f4-9c1afed2d1d8@huawei.com>
 <CAA8EJpqHmhUxLE57XNeh-nVtSP7WvtBE=FiFWk9kqM_P+AC=0A@mail.gmail.com>
 <5af62fa9-e71b-412f-8640-502f03fcaa52@huawei.com>
 <vrsy4hao4qu3hlcbmjyfyibeearhhjgtik3e6o3v2eyzkatdve@kdb7cyvl45tu>
 <ade54ddd-79ea-4335-9058-c17e4525e83f@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ade54ddd-79ea-4335-9058-c17e4525e83f@huawei.com>
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

On Thu, Feb 27, 2025 at 09:46:10PM +0800, Yongbang Shi wrote:
> 
> > On Tue, Feb 25, 2025 at 09:57:17PM +0800, Yongbang Shi wrote:
> > > > On Mon, 24 Feb 2025 at 16:03, Yongbang Shi <shiyongbang@huawei.com> wrote:
> > > > > > On Sat, Feb 22, 2025 at 06:35:48PM +0800, Yongbang Shi wrote:
> > > > > > > > > +static int hibmc_dp_hpd_event(struct drm_client_dev *client)
> > > > > > > > > +{
> > > > > > > > > +  struct hibmc_dp *dp = container_of(client, struct hibmc_dp, client);
> > > > > > > > > +  struct hibmc_drm_private *priv = to_hibmc_drm_private(dp->drm_dev);
> > > > > > > > > +  struct drm_display_mode *mode = &priv->crtc.state->adjusted_mode;
> > > > > > > > > +  int ret;
> > > > > > > > > +
> > > > > > > > > +  if (dp->hpd_status) {
> > > > > > > > > +          hibmc_dp_hpd_cfg(&priv->dp);
> > > > > > > > > +          ret = hibmc_dp_prepare(dp, mode);
> > > > > > > > > +          if (ret)
> > > > > > > > > +                  return ret;
> > > > > > > > > +
> > > > > > > > > +          hibmc_dp_display_en(dp, true);
> > > > > > > > > +  } else {
> > > > > > > > > +          hibmc_dp_display_en(dp, false);
> > > > > > > > > +          hibmc_dp_reset_link(&priv->dp);
> > > > > > > > > +  }
> > > > > > > > If I understand this correctly, you are using a separate drm_client to
> > > > > > > > enable and disable the link & display. Why is it necessary? Existing
> > > > > > > > drm_clients and userspace compositors use drm framework, they should be
> > > > > > > > able to turn the display on and off as required.
> > > > > > > > 
> > > > > > > Thanks for your asking, there are cfg/reset process when the connector 's pluging in/out.
> > > > > > > We want to cfg DP registers again when the connector changes. Not only dp link training, but also cfg
> > > > > > > the different video modes into DP registers.
> > > > > > Why? The link training and mode programming should happen during
> > > > > > pre_enable / enable stage (legacy or atomic).
> > > > > Hi Dmitry,
> > > > > 
> > > > > Right, that's what I'm curious about. It won't call encoder enble/disable functions when I triggered HPD.
> > > > > And I'm sure the drm_connector_helper_hpd_irq_event() is called. So I add a drm_client for it.I
> > > > It should be userspace, who triggers the enable/disable (or it should
> > > > be the in-kernel fbdev / fbcon, which interface through the generic
> > > > drm_fbdev client).
> > > Right, I knew it. When I insmode my driver firstly (or restart display service), it will call disable, modeset and enable,
> > > by user, but it won't call when HPD triggered .
> > - Is HPD even properly delivered to userspace? What kind of compsitor
> >    are you using? Is .detect working properly and reporting a correct
> >    plug-in state?
> 
> Thanks for your answering. I'm not very good understanding about userspace in framework. In my opinion, when I call
> this drm_connector_helper_hpd_irq_event(), the HPD will deliver to userspace.
> I use Xorg, and the display service is GDM.
> The .detect is called and the getting modes info is correct.
> I find that it would only trigger(disable, modeset and enable), when I changed resolutions, restart display service and insmod driver.

You can go to the display settings in GDM. It would be interesting to
observe if it notes the second monitor or not. Last, but not least, you
can use a simple tool like 'xrandr' under your XOrg session to set the
display resolution.

-- 
With best wishes
Dmitry

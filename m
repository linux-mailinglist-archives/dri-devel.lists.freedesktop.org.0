Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60135A4D31B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 06:43:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8EF10E13C;
	Tue,  4 Mar 2025 05:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HpONk8nm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F1610E13C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 05:43:46 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5494bc4d796so4614485e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 21:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741067023; x=1741671823; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AKTXFIAdwYgvuh07rZ1NyeKtb1x4g4EP7f5OZK492cc=;
 b=HpONk8nmJdUBbTd2aHfErIVaMRvgZzrXTPOdrAMji6pu8cNvhEsu+Iff0yCZ0KqbZX
 pot/Ewb/g5nR0YCk+GNB/d8mq+afHueYvHOadPfbStavwx2FhbblWcQLZOpv2qVAqXqe
 MpIpPkerb4Lyh+ivQfP0Lpj6B1DTag5/9Mc2EVRqAjBm4KY3nIBFgu/GzEplGvdduKUh
 J5bWXcgE0Fm7lmb2sD9GvHG7GriKSkwH2XL0rIhKsPF05OHHrZIiD9d6NY1Lf6r1NVKv
 5ZlOEelmztJRZ0KvFemSYWRVByFQqlna+TDLnA53NhTDI6CTwQOv5OOVpb3uP1JjcL3H
 VqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741067023; x=1741671823;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AKTXFIAdwYgvuh07rZ1NyeKtb1x4g4EP7f5OZK492cc=;
 b=kvgzF0Rw0bRXrxjGLGNbl3lEMjdN2dyw6ciHhMFkbOjFRW7mtJh8yKAWJEQbJgUsFE
 Ws3qVXOTwolBxsBBhJRJhxCtz978FkmvuKnqB8rIJ9xDoUBWao30mDRnJqIOgcx6OIdY
 Zp8X45QYBHzGe3ZPWKTDzEnjS8RMzqzR/KrQXH42OQMxIRm2aLfq+qgrzGCGGqfp8x+p
 nkxY73z47xdOXCB7IEjtQMkZf1xbY82W2jcc8As3wYJV2U2M4u8XhTgZP6KQJkj+JZ3U
 h/VPynUMouYbyP8d5HuJysEXetL0tm5y7S+bkvPeO0bVyXZnf6J0QTdsBXjaIam5OcMg
 6iSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfkl14DZV4fy49e4MpMxHZqj3dIMbRFLWnaw7XNAQr2UlTQNrfA2JG8+ab4jXuBrRdWVBW1Y6mxBU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxxtO/ZGbdmcUb0QM8YXhqG+HtWecrf/fLpHj94Jm4ioSFuLNb
 MwH9MP7oF7WUXKK9evOZ8Eznyglqp82/n/ooxISdECCchQVMLfHvZw39twAmW6U=
X-Gm-Gg: ASbGncuYNJPKuBR4ihineXZcbCJtfTYjO3i0SjSg2dVBOBNCChIbJTpsGs3jtZsBc8m
 13JRsJxZbCSZRdgt/Ic7pUGj7jAyGtMS7EQSj3a18W6yuKELB4O4cN0z2m5NcSvspYNT8cK25u0
 lA2vUNqBQBaZ3lYwZ96aySBvset2NhWLeA97044JnUfniK+SLQIsHlI+buqKEsyZ0pNAVCjMPCc
 eQPvO4EyWQB0plRc/62HXCUM9T8RPSC19WQi8iGMFL3U1hLUj+7jxV0MOvwQ1buBtR/vNRpI1iu
 ax6IvivROUSIEjm/2aebcNjQi5ZExyQfGhQb03zWos6Xs3E2hhdpupdnR+gYSGDtptXTztTitbD
 3vOTQCOp46SZ03LQ5puErLzBm
X-Google-Smtp-Source: AGHT+IFl/XhxWgK5jjaVHGYT1do5OUCGy7ZZK0LuSUnLvpBu8eiZJ80JLtemF9/oM7QJHl7X6Sj2qQ==
X-Received: by 2002:a05:6512:3d19:b0:545:5d:a5e2 with SMTP id
 2adb3069b0e04-5494c129f56mr5433163e87.10.1741067023442; 
 Mon, 03 Mar 2025 21:43:43 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5494f5a7c23sm1203370e87.142.2025.03.03.21.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 21:43:42 -0800 (PST)
Date: Tue, 4 Mar 2025 07:43:39 +0200
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
Message-ID: <kdk7p6yhuvby2nyqriufj3jo7kkyxv4ml4awdhszkehv2r2om3@cvho3j27hmwx>
References: <vrsy4hao4qu3hlcbmjyfyibeearhhjgtik3e6o3v2eyzkatdve@kdb7cyvl45tu>
 <ade54ddd-79ea-4335-9058-c17e4525e83f@huawei.com>
 <4hicem4rbz5l7wnzaaz3krrl3euh2dmvlah2rb7errrdq5fann@44dvdxirkuzh>
 <6506e448-3851-436f-9354-42f9ef844d27@huawei.com>
 <njnz5hxumrvqrgsfq7zlunle3jgfan3be34ao5xtkmzczpi6af@waywds2ww6qw>
 <c87613aa-1d17-4a88-acce-269ea9eddc22@huawei.com>
 <CAA8EJpo71m_ae9siT7f4Tsfr0C4XeoraqPYPsPp0gz-N+oMOjw@mail.gmail.com>
 <6e54c88f-dfaf-462d-b66b-c237d19faec6@huawei.com>
 <zzi2h52xiernm32h7i7xtrlnjwaqc3n2tx33ypmhw6quoi5qyg@pilzj5zantii>
 <fce2e5e8-ba38-474d-891c-f8ab0de8d07e@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fce2e5e8-ba38-474d-891c-f8ab0de8d07e@huawei.com>
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

On Tue, Mar 04, 2025 at 10:23:14AM +0800, Yongbang Shi wrote:
> > On Mon, Mar 03, 2025 at 01:02:44PM +0800, Yongbang Shi wrote:
> > > > On Sat, 1 Mar 2025 at 11:54, Yongbang Shi <shiyongbang@huawei.com> wrote:
> > > > > > On Sat, Mar 01, 2025 at 04:45:40PM +0800, Yongbang Shi wrote:
> > > > > > > > On Thu, Feb 27, 2025 at 09:46:10PM +0800, Yongbang Shi wrote:
> > > > > > > > > > On Tue, Feb 25, 2025 at 09:57:17PM +0800, Yongbang Shi wrote:
> > > > > > > > > > > > On Mon, 24 Feb 2025 at 16:03, Yongbang Shi <shiyongbang@huawei.com> wrote:
> > > > > > > > > > > > > > On Sat, Feb 22, 2025 at 06:35:48PM +0800, Yongbang Shi wrote:
> > > > > > > > > > > > > > > > > +static int hibmc_dp_hpd_event(struct drm_client_dev *client)
> > > > > > > > > > > > > > > > > +{
> > > > > > > > > > > > > > > > > +  struct hibmc_dp *dp = container_of(client, struct hibmc_dp, client);
> > > > > > > > > > > > > > > > > +  struct hibmc_drm_private *priv = to_hibmc_drm_private(dp->drm_dev);
> > > > > > > > > > > > > > > > > +  struct drm_display_mode *mode = &priv->crtc.state->adjusted_mode;
> > > > > > > > > > > > > > > > > +  int ret;
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +  if (dp->hpd_status) {
> > > > > > > > > > > > > > > > > +          hibmc_dp_hpd_cfg(&priv->dp);
> > > > > > > > > > > > > > > > > +          ret = hibmc_dp_prepare(dp, mode);
> > > > > > > > > > > > > > > > > +          if (ret)
> > > > > > > > > > > > > > > > > +                  return ret;
> > > > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > > > +          hibmc_dp_display_en(dp, true);
> > > > > > > > > > > > > > > > > +  } else {
> > > > > > > > > > > > > > > > > +          hibmc_dp_display_en(dp, false);
> > > > > > > > > > > > > > > > > +          hibmc_dp_reset_link(&priv->dp);
> > > > > > > > > > > > > > > > > +  }
> > > > > > > > > > > > > > > > If I understand this correctly, you are using a separate drm_client to
> > > > > > > > > > > > > > > > enable and disable the link & display. Why is it necessary? Existing
> > > > > > > > > > > > > > > > drm_clients and userspace compositors use drm framework, they should be
> > > > > > > > > > > > > > > > able to turn the display on and off as required.
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > Thanks for your asking, there are cfg/reset process when the connector 's pluging in/out.
> > > > > > > > > > > > > > > We want to cfg DP registers again when the connector changes. Not only dp link training, but also cfg
> > > > > > > > > > > > > > > the different video modes into DP registers.
> > > > > > > > > > > > > > Why? The link training and mode programming should happen during
> > > > > > > > > > > > > > pre_enable / enable stage (legacy or atomic).
> > > > > > > > > > > > > Hi Dmitry,
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Right, that's what I'm curious about. It won't call encoder enble/disable functions when I triggered HPD.
> > > > > > > > > > > > > And I'm sure the drm_connector_helper_hpd_irq_event() is called. So I add a drm_client for it.I
> > > > > > > > > > > > It should be userspace, who triggers the enable/disable (or it should
> > > > > > > > > > > > be the in-kernel fbdev / fbcon, which interface through the generic
> > > > > > > > > > > > drm_fbdev client).
> > > > > > > > > > > Right, I knew it. When I insmode my driver firstly (or restart display service), it will call disable, modeset and enable,
> > > > > > > > > > > by user, but it won't call when HPD triggered .
> > > > > > > > > > - Is HPD even properly delivered to userspace? What kind of compsitor
> > > > > > > > > >        are you using? Is .detect working properly and reporting a correct
> > > > > > > > > >        plug-in state?
> > > > > > > > > Thanks for your answering. I'm not very good understanding about userspace in framework. In my opinion, when I call
> > > > > > > > > this drm_connector_helper_hpd_irq_event(), the HPD will deliver to userspace.
> > > > > > > > > I use Xorg, and the display service is GDM.
> > > > > > > > > The .detect is called and the getting modes info is correct.
> > > > > > > > > I find that it would only trigger(disable, modeset and enable), when I changed resolutions, restart display service and insmod driver.
> > > > > > > > You can go to the display settings in GDM. It would be interesting to
> > > > > > > > observe if it notes the second monitor or not. Last, but not least, you
> > > > > > > > can use a simple tool like 'xrandr' under your XOrg session to set the
> > > > > > > > display resolution.
> > > > > > > Thank you for your advice!
> > > > > > > Right, there are DP and VGA two monitors. I tried to totally remove the vga connector in driver, the problem is gone.
> > > > > > > So do I need to clear the vga connector, if dp is plugged in?
> > > > > > Unless your hardware can not manage two outputs at the same time, no,
> > > > > > you don't have to. Just check how it behaves on x86 systems. Ideally
> > > > > > your driver should have the same behaviour.
> > > > > Our hardware cannot support two outputs with different timing, so I used the one crtc and one plane that DP and VGA share. And just add a new DP connector
> > > > > with a encoder, just like the previous VGA's code logic. But the HPD problem makes me feel confused, should I change the framwork structure to slove this problem?
> > > > I think registering a single CRTC is a correct way. Then it is logical
> > > > that there is no mode set on the DP when you connect it. The userspace
> > > > can not output any data. However if you disconnect VGA and connect DP
> > > > then it should become active and should output your desktop
> > > > environment.
> > > Okay, Thank you for your guidance. So I need to disconnect VGA when I get the HPD (plugged in) , then
> > > userapce will active and enanble DP, right?
> > Yes.
> 
> I'm sorry for that, just wanna make sure one more thing. I found if I only set the VGA connector's status to disconnected when HPD plugged in, it won't be active.

Huh? You should implement hibmc_connector_funcs.detect() or
.detect_ctx() to report VGA connector's status. Use
ast_vga_connector_helper_detect_ctx() as an inspiration.

> And If I add drm_cleanup_connector() for VGA, it work. So is this okay that I use this cleanup in HPD?

drm_connector_cleanup() should only be callsed if the connector is going
to be destroyed. You should not be callign that function.

> 
> 
> > > 
> > > > > And also, I will check whether this driver works good on the x86 server. Right now, I'm testing on arm64 server.
> > > > > 
> > > > > > > And also, I used xrandr to set modes after 'startx'. Changing resolutions works,
> > > > > > > but there are errs when set some low resolutions.
> > > > > > That's a separate topic, most likely related to timing or to some other
> > > > > > issues. You can fix that separately (but please do, switching modes
> > > > > > should work).
> > > > > Okay!
> > > > > 
> > > > > 

-- 
With best wishes
Dmitry

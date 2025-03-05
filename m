Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2811EA4F8C7
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 09:27:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A47410E14E;
	Wed,  5 Mar 2025 08:27:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="utOZB9T3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A6510E1BF
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 08:27:32 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e6119fc5e9bso758193276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 00:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741163251; x=1741768051; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8Bi2C4pewmcM5VJ8Iq8i6k/4osIHG8Rf8aqI4wTiT7Y=;
 b=utOZB9T3ZAEXjEIADr7kXcZDm9yLlrEhcVuCv/QPEMGDSbV7+rYY71M+gBoTmlKVf/
 iEO6P6HfTjZED/Iy5MmtuKcGC6W1CreBaTzkOoGWczpxUh3EVJxB/iMp7mF7KsV2YFfp
 6Jqt5IK6O5YxKhcfMLiv3dsAuNKTJHD4azl/WWla1yF1NPSwIpR40aK+u8qT2U2vVoGl
 yXJyh1ROGRtBCDVeES2Jzy9ZPNR4Pg0SXtuPHmXnGqOJYvJBInvPQNhXDOC58rMizrlR
 G2GT6745ENvCd/qJbmWuZg2hm+/L8S4KJh3xPn2+ERzDHWddFDB0n4fwt/9dVzRYZ7FI
 OZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741163251; x=1741768051;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Bi2C4pewmcM5VJ8Iq8i6k/4osIHG8Rf8aqI4wTiT7Y=;
 b=qoNH+f0K/Tczsh1bK3ZtUunSoCp4+cBYwQZ46B0mEZ7u7qIVm9ma5uZ/l8lCWKaV+7
 GGthJegWUAN0rzHF6br59zobjpqpfnZEptnoIErIkqNN2gENZRzGQncTGrcNivpK7KDi
 iprxB6RGViowTxDMuORks6E1auCBPxy+M5Fg82oZ2tQxwBt51ZL6Z1uucjsXSSH47o5Z
 8JP7lAqZKxKj7Nf2bA0eNVwEhzq81GU6vfcYj0fuMG0RuIShptH5C8WQAFn8pZvnKZdD
 O0i/5wGZCAV9ckQLStUrjdyx290BX3wTvEdzC87O5vbJPnpMm5V/DHHlUgDHsXW51B4u
 qWmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCViF5Lrhyfdg4pfOHd1/E9boQtjqcTN/Xs1S2p4/G2q6boYfX/e/8QbOuqbWv37ciQ3NtKrGKbyIo0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIlZjPUen3s+CKZW9LYSe1U2NrJEVH0rY08RwuKg2wu26gpx/E
 zi2WqGalkUCXtf49zPHswwYRTVHr+1YxxxkYbXX4fsrGXVVmLpu244LknphGDYqlEhmeFBHeFwP
 m8X3isfMt+AoHDO3xwmVwH7lvPT+dZEnRSa9SZA==
X-Gm-Gg: ASbGncuP6AnGTzw/Weg3Go6hdacqEHRDJCa7pmvKEU1nsPOS2wbDQQ4yRNRpjjPhDF8
 PDWHAQJceZCGnQY0Cybun9kBvptw9lVSIC5l5fY5wzi5bNLRJQ0w1jkCIvvA91lbn9w6nIccnVj
 wQDyLQvn88SWQTt9R4gOYT8d+Y
X-Google-Smtp-Source: AGHT+IHfHfrshSogOG0i4IcAYrvgOTnd8G9r2T28dussiCbapuii+jTnkJK5v4fmcr2pB+CEOqtZypPELtcFVBMou74=
X-Received: by 2002:a05:6902:2484:b0:e60:a241:84bb with SMTP id
 3f1490d57ef6-e611e1e53dbmr2915356276.26.1741163251412; Wed, 05 Mar 2025
 00:27:31 -0800 (PST)
MIME-Version: 1.0
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
 <kdk7p6yhuvby2nyqriufj3jo7kkyxv4ml4awdhszkehv2r2om3@cvho3j27hmwx>
 <3465ce51-a844-4c77-8e80-179d5ca279cc@huawei.com>
In-Reply-To: <3465ce51-a844-4c77-8e80-179d5ca279cc@huawei.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 5 Mar 2025 09:27:20 +0100
X-Gm-Features: AQ5f1JozWElSEoofiFEaVq2FjF0NOrV6b92xHl9Z_oztaKLwn8OJzFF9TMlLqaY
Message-ID: <CAA8EJprPAdsUS7FJCDmMnk7YZ7yM-=M15dEFcJhAg+CEezQSaQ@mail.gmail.com>
Subject: Re: [PATCH v3 drm-dp 7/8] drm/hisilicon/hibmc: Enable this hot plug
 detect of irq feature
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, 
 liangjian010@huawei.com, chenjianmin@huawei.com, lidongming5@huawei.com, 
 libaihan@huawei.com, shenjian15@huawei.com, shaojijie@huawei.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Wed, 5 Mar 2025 at 08:29, Yongbang Shi <shiyongbang@huawei.com> wrote:
>
>
> > On Tue, Mar 04, 2025 at 10:23:14AM +0800, Yongbang Shi wrote:
> >>> On Mon, Mar 03, 2025 at 01:02:44PM +0800, Yongbang Shi wrote:
> >>>>> On Sat, 1 Mar 2025 at 11:54, Yongbang Shi <shiyongbang@huawei.com> wrote:
> >>>>>>> On Sat, Mar 01, 2025 at 04:45:40PM +0800, Yongbang Shi wrote:
> >>>>>>>>> On Thu, Feb 27, 2025 at 09:46:10PM +0800, Yongbang Shi wrote:
> >>>>>>>>>>> On Tue, Feb 25, 2025 at 09:57:17PM +0800, Yongbang Shi wrote:
> >>>>>>>>>>>>> On Mon, 24 Feb 2025 at 16:03, Yongbang Shi <shiyongbang@huawei.com> wrote:
> >>>>>>>>>>>>>>> On Sat, Feb 22, 2025 at 06:35:48PM +0800, Yongbang Shi wrote:
> >>>>>>>>>>>>>>>>>> +static int hibmc_dp_hpd_event(struct drm_client_dev *client)
> >>>>>>>>>>>>>>>>>> +{
> >>>>>>>>>>>>>>>>>> +  struct hibmc_dp *dp = container_of(client, struct hibmc_dp, client);
> >>>>>>>>>>>>>>>>>> +  struct hibmc_drm_private *priv = to_hibmc_drm_private(dp->drm_dev);
> >>>>>>>>>>>>>>>>>> +  struct drm_display_mode *mode = &priv->crtc.state->adjusted_mode;
> >>>>>>>>>>>>>>>>>> +  int ret;
> >>>>>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>>>>> +  if (dp->hpd_status) {
> >>>>>>>>>>>>>>>>>> +          hibmc_dp_hpd_cfg(&priv->dp);
> >>>>>>>>>>>>>>>>>> +          ret = hibmc_dp_prepare(dp, mode);
> >>>>>>>>>>>>>>>>>> +          if (ret)
> >>>>>>>>>>>>>>>>>> +                  return ret;
> >>>>>>>>>>>>>>>>>> +
> >>>>>>>>>>>>>>>>>> +          hibmc_dp_display_en(dp, true);
> >>>>>>>>>>>>>>>>>> +  } else {
> >>>>>>>>>>>>>>>>>> +          hibmc_dp_display_en(dp, false);
> >>>>>>>>>>>>>>>>>> +          hibmc_dp_reset_link(&priv->dp);
> >>>>>>>>>>>>>>>>>> +  }
> >>>>>>>>>>>>>>>>> If I understand this correctly, you are using a separate drm_client to
> >>>>>>>>>>>>>>>>> enable and disable the link & display. Why is it necessary? Existing
> >>>>>>>>>>>>>>>>> drm_clients and userspace compositors use drm framework, they should be
> >>>>>>>>>>>>>>>>> able to turn the display on and off as required.
> >>>>>>>>>>>>>>>>>
> >>>>>>>>>>>>>>>> Thanks for your asking, there are cfg/reset process when the connector 's pluging in/out.
> >>>>>>>>>>>>>>>> We want to cfg DP registers again when the connector changes. Not only dp link training, but also cfg
> >>>>>>>>>>>>>>>> the different video modes into DP registers.
> >>>>>>>>>>>>>>> Why? The link training and mode programming should happen during
> >>>>>>>>>>>>>>> pre_enable / enable stage (legacy or atomic).
> >>>>>>>>>>>>>> Hi Dmitry,
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Right, that's what I'm curious about. It won't call encoder enble/disable functions when I triggered HPD.
> >>>>>>>>>>>>>> And I'm sure the drm_connector_helper_hpd_irq_event() is called. So I add a drm_client for it.I
> >>>>>>>>>>>>> It should be userspace, who triggers the enable/disable (or it should
> >>>>>>>>>>>>> be the in-kernel fbdev / fbcon, which interface through the generic
> >>>>>>>>>>>>> drm_fbdev client).
> >>>>>>>>>>>> Right, I knew it. When I insmode my driver firstly (or restart display service), it will call disable, modeset and enable,
> >>>>>>>>>>>> by user, but it won't call when HPD triggered .
> >>>>>>>>>>> - Is HPD even properly delivered to userspace? What kind of compsitor
> >>>>>>>>>>>         are you using? Is .detect working properly and reporting a correct
> >>>>>>>>>>>         plug-in state?
> >>>>>>>>>> Thanks for your answering. I'm not very good understanding about userspace in framework. In my opinion, when I call
> >>>>>>>>>> this drm_connector_helper_hpd_irq_event(), the HPD will deliver to userspace.
> >>>>>>>>>> I use Xorg, and the display service is GDM.
> >>>>>>>>>> The .detect is called and the getting modes info is correct.
> >>>>>>>>>> I find that it would only trigger(disable, modeset and enable), when I changed resolutions, restart display service and insmod driver.
> >>>>>>>>> You can go to the display settings in GDM. It would be interesting to
> >>>>>>>>> observe if it notes the second monitor or not. Last, but not least, you
> >>>>>>>>> can use a simple tool like 'xrandr' under your XOrg session to set the
> >>>>>>>>> display resolution.
> >>>>>>>> Thank you for your advice!
> >>>>>>>> Right, there are DP and VGA two monitors. I tried to totally remove the vga connector in driver, the problem is gone.
> >>>>>>>> So do I need to clear the vga connector, if dp is plugged in?
> >>>>>>> Unless your hardware can not manage two outputs at the same time, no,
> >>>>>>> you don't have to. Just check how it behaves on x86 systems. Ideally
> >>>>>>> your driver should have the same behaviour.
> >>>>>> Our hardware cannot support two outputs with different timing, so I used the one crtc and one plane that DP and VGA share. And just add a new DP connector
> >>>>>> with a encoder, just like the previous VGA's code logic. But the HPD problem makes me feel confused, should I change the framwork structure to slove this problem?
> >>>>> I think registering a single CRTC is a correct way. Then it is logical
> >>>>> that there is no mode set on the DP when you connect it. The userspace
> >>>>> can not output any data. However if you disconnect VGA and connect DP
> >>>>> then it should become active and should output your desktop
> >>>>> environment.
> >>>> Okay, Thank you for your guidance. So I need to disconnect VGA when I get the HPD (plugged in) , then
> >>>> userapce will active and enanble DP, right?
> >>> Yes.
> >> I'm sorry for that, just wanna make sure one more thing. I found if I only set the VGA connector's status to disconnected when HPD plugged in, it won't be active.
> > Huh? You should implement hibmc_connector_funcs.detect() or
> > .detect_ctx() to report VGA connector's status. Use
> > ast_vga_connector_helper_detect_ctx() as an inspiration.
>
> Okay, thanks for your correcting, I'll try to add drm_connector_helper_detect_from_ddc() in VGA's detect_ctx.
> And also, I wanna make sure that do I need to unplug the VGA monitor manually when I plug in DP, or just
> set the status of VGA connector to disconnected in interrupt handler.

If the HPD reports the status of the DP connector, why do you want to
change the status of the VGA connector?

>
>
> >> And If I add drm_cleanup_connector() for VGA, it work. So is this okay that I use this cleanup in HPD?
> > drm_connector_cleanup() should only be callsed if the connector is going
> > to be destroyed. You should not be callign that function.
> >
> >>
> >>>>>> And also, I will check whether this driver works good on the x86 server. Right now, I'm testing on arm64 server.
> >>>>>>
> >>>>>>>> And also, I used xrandr to set modes after 'startx'. Changing resolutions works,
> >>>>>>>> but there are errs when set some low resolutions.
> >>>>>>> That's a separate topic, most likely related to timing or to some other
> >>>>>>> issues. You can fix that separately (but please do, switching modes
> >>>>>>> should work).
> >>>>>> Okay!
> >>>>>>
> >>>>>>



-- 
With best wishes
Dmitry

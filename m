Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B278A4AACF
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 12:45:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8FB10E13B;
	Sat,  1 Mar 2025 11:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="c0E7i4px";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE3610E13B
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Mar 2025 11:45:41 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-e60c4412127so620358276.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Mar 2025 03:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740829541; x=1741434341; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wPdFtRIcEJljlyiH4UNQ0Wo6ovomIZEN33SfT6PWHDw=;
 b=c0E7i4pxER9/J58CDKoOGQvsJ2cCcSAr4a1mmcroOwi9A6YTCjOYHkXr8M4NuEVVkp
 LE32StUnzGAYr0by92jE4TudU+TEKyQ4qAroqtjeuFfWR+9sV/5cFGGkH4+JCdKof2TW
 /52CskGMrMMfdQ1OCX0U4cEwadJRI0zOGM9eA5dGXU6YeI9aVUSupMGWcfss2icjrtNE
 w8wqPda29HRxiaaRdQHPAU30/8Q6sLxkpxB0nnzjSKwRUxEVAiDmLJzLCYLaBN9eXY49
 D0GgZp9L4+6QtQCDm5PXag+BQ2+ImZo6mMwWjXHcdV8QvsDaBAtXbrbBR1XjbJiUfmJ7
 Xx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740829541; x=1741434341;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wPdFtRIcEJljlyiH4UNQ0Wo6ovomIZEN33SfT6PWHDw=;
 b=O+mtn5OLWejZ9vXbpP/u0OUSn13LY1slhNTlcRo7OXuiCHMoSXY1kl5Qotb61qHO1F
 QTWhuhKRqU9B1Lp5W2XikxVEYBse8kR0qe2/cUgCZ/G4aUpKviDT7wt3ObU75QDTNFP9
 f6HMyrgdOAmmp77XrHyraieC9RApY8iI2UMtIDy8eamLXNVezCP5EN9RCWC6X5jN52FU
 aPFcGn0cAaxijL3K97NpnMjoeUXJEgFHescXR+r0caF1oHrDuSAsgZ5g2G1ZEI4N5bpf
 1Gne4KyVAyat1DSud3AP1NyJUnBODbSvKV+MVxHl/xi7YaPEJa5TYsF0dOQEETvcsid2
 EUIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlTWYlkGoSHpaHTZhLyXpjGTI02YmbSMJ5Ru0MHZ7T3MePm0rfmB98hVccidjxsJicGCzYPWSXrGc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1bPXLcYk0Qe+eBsS01GKTC+LoflAOY2mdBKT5dhmFGVXlgI2s
 1IkvlqxjHoxOMWvMk1MnqzA8DWSKOXpZ0sylE9S2aUCBCW8h55YBX1sXvP8Thbb0jN9tFCkT0Lc
 Bvk9jDk2CajOEhGMpU4U8IfdFpvQY+tD+JSU2NA==
X-Gm-Gg: ASbGnct/t++xMBLWacQnHNDhvLX731/2D3kXb72xcHvGrWt9kfYzxjDiZwVn/PwxAIh
 ttuzGhZAD8uL7XFw6FbEX4mEqsDvak0eIRAlo40avBBtxOCUUK7XeH9ORWtELhXuoIyebUUGchv
 eVILh67bBShW5IVjQjt3JUzKLZYJwVf94mUBNaXQDL
X-Google-Smtp-Source: AGHT+IHgRqqiTqKK9xWzlnJl9nuXClN9+LmtvWVEfm6elxrtnetY9R0eCj0ZsKS6jravLjWFcCumIH9iOwPR7gur47c=
X-Received: by 2002:a05:6902:98e:b0:e57:346f:5b12 with SMTP id
 3f1490d57ef6-e60b2eacc43mr6998903276.18.1740829541019; Sat, 01 Mar 2025
 03:45:41 -0800 (PST)
MIME-Version: 1.0
References: <reqpxlbvlz5qssgy6gbjuou33h4zevo4xeztqbsr4keehplyhx@utv22a5ihohx>
 <eef68fc7-30f4-4246-a82e-4f90cd6a665d@huawei.com>
 <6jx5ldpidy2ycrqognfiv5ttqr5ia4dtbryta3kc2mkndrvvgo@qzuakucz765k>
 <6634386b-afc1-4e31-a2f4-9c1afed2d1d8@huawei.com>
 <CAA8EJpqHmhUxLE57XNeh-nVtSP7WvtBE=FiFWk9kqM_P+AC=0A@mail.gmail.com>
 <5af62fa9-e71b-412f-8640-502f03fcaa52@huawei.com>
 <vrsy4hao4qu3hlcbmjyfyibeearhhjgtik3e6o3v2eyzkatdve@kdb7cyvl45tu>
 <ade54ddd-79ea-4335-9058-c17e4525e83f@huawei.com>
 <4hicem4rbz5l7wnzaaz3krrl3euh2dmvlah2rb7errrdq5fann@44dvdxirkuzh>
 <6506e448-3851-436f-9354-42f9ef844d27@huawei.com>
 <njnz5hxumrvqrgsfq7zlunle3jgfan3be34ao5xtkmzczpi6af@waywds2ww6qw>
 <c87613aa-1d17-4a88-acce-269ea9eddc22@huawei.com>
In-Reply-To: <c87613aa-1d17-4a88-acce-269ea9eddc22@huawei.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 1 Mar 2025 13:45:30 +0200
X-Gm-Features: AQ5f1JovDIdMFleM78uUNt49Eq12cxxY-CMeDTA14F_begq8E4NvDwe6hIZMAW4
Message-ID: <CAA8EJpo71m_ae9siT7f4Tsfr0C4XeoraqPYPsPp0gz-N+oMOjw@mail.gmail.com>
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

On Sat, 1 Mar 2025 at 11:54, Yongbang Shi <shiyongbang@huawei.com> wrote:
>
>
> > On Sat, Mar 01, 2025 at 04:45:40PM +0800, Yongbang Shi wrote:
> >>> On Thu, Feb 27, 2025 at 09:46:10PM +0800, Yongbang Shi wrote:
> >>>>> On Tue, Feb 25, 2025 at 09:57:17PM +0800, Yongbang Shi wrote:
> >>>>>>> On Mon, 24 Feb 2025 at 16:03, Yongbang Shi <shiyongbang@huawei.com> wrote:
> >>>>>>>>> On Sat, Feb 22, 2025 at 06:35:48PM +0800, Yongbang Shi wrote:
> >>>>>>>>>>>> +static int hibmc_dp_hpd_event(struct drm_client_dev *client)
> >>>>>>>>>>>> +{
> >>>>>>>>>>>> +  struct hibmc_dp *dp = container_of(client, struct hibmc_dp, client);
> >>>>>>>>>>>> +  struct hibmc_drm_private *priv = to_hibmc_drm_private(dp->drm_dev);
> >>>>>>>>>>>> +  struct drm_display_mode *mode = &priv->crtc.state->adjusted_mode;
> >>>>>>>>>>>> +  int ret;
> >>>>>>>>>>>> +
> >>>>>>>>>>>> +  if (dp->hpd_status) {
> >>>>>>>>>>>> +          hibmc_dp_hpd_cfg(&priv->dp);
> >>>>>>>>>>>> +          ret = hibmc_dp_prepare(dp, mode);
> >>>>>>>>>>>> +          if (ret)
> >>>>>>>>>>>> +                  return ret;
> >>>>>>>>>>>> +
> >>>>>>>>>>>> +          hibmc_dp_display_en(dp, true);
> >>>>>>>>>>>> +  } else {
> >>>>>>>>>>>> +          hibmc_dp_display_en(dp, false);
> >>>>>>>>>>>> +          hibmc_dp_reset_link(&priv->dp);
> >>>>>>>>>>>> +  }
> >>>>>>>>>>> If I understand this correctly, you are using a separate drm_client to
> >>>>>>>>>>> enable and disable the link & display. Why is it necessary? Existing
> >>>>>>>>>>> drm_clients and userspace compositors use drm framework, they should be
> >>>>>>>>>>> able to turn the display on and off as required.
> >>>>>>>>>>>
> >>>>>>>>>> Thanks for your asking, there are cfg/reset process when the connector 's pluging in/out.
> >>>>>>>>>> We want to cfg DP registers again when the connector changes. Not only dp link training, but also cfg
> >>>>>>>>>> the different video modes into DP registers.
> >>>>>>>>> Why? The link training and mode programming should happen during
> >>>>>>>>> pre_enable / enable stage (legacy or atomic).
> >>>>>>>> Hi Dmitry,
> >>>>>>>>
> >>>>>>>> Right, that's what I'm curious about. It won't call encoder enble/disable functions when I triggered HPD.
> >>>>>>>> And I'm sure the drm_connector_helper_hpd_irq_event() is called. So I add a drm_client for it.I
> >>>>>>> It should be userspace, who triggers the enable/disable (or it should
> >>>>>>> be the in-kernel fbdev / fbcon, which interface through the generic
> >>>>>>> drm_fbdev client).
> >>>>>> Right, I knew it. When I insmode my driver firstly (or restart display service), it will call disable, modeset and enable,
> >>>>>> by user, but it won't call when HPD triggered .
> >>>>> - Is HPD even properly delivered to userspace? What kind of compsitor
> >>>>>      are you using? Is .detect working properly and reporting a correct
> >>>>>      plug-in state?
> >>>> Thanks for your answering. I'm not very good understanding about userspace in framework. In my opinion, when I call
> >>>> this drm_connector_helper_hpd_irq_event(), the HPD will deliver to userspace.
> >>>> I use Xorg, and the display service is GDM.
> >>>> The .detect is called and the getting modes info is correct.
> >>>> I find that it would only trigger(disable, modeset and enable), when I changed resolutions, restart display service and insmod driver.
> >>> You can go to the display settings in GDM. It would be interesting to
> >>> observe if it notes the second monitor or not. Last, but not least, you
> >>> can use a simple tool like 'xrandr' under your XOrg session to set the
> >>> display resolution.
> >> Thank you for your advice!
> >> Right, there are DP and VGA two monitors. I tried to totally remove the vga connector in driver, the problem is gone.
> >> So do I need to clear the vga connector, if dp is plugged in?
> > Unless your hardware can not manage two outputs at the same time, no,
> > you don't have to. Just check how it behaves on x86 systems. Ideally
> > your driver should have the same behaviour.
>
> Our hardware cannot support two outputs with different timing, so I used the one crtc and one plane that DP and VGA share. And just add a new DP connector
> with a encoder, just like the previous VGA's code logic. But the HPD problem makes me feel confused, should I change the framwork structure to slove this problem?

I think registering a single CRTC is a correct way. Then it is logical
that there is no mode set on the DP when you connect it. The userspace
can not output any data. However if you disconnect VGA and connect DP
then it should become active and should output your desktop
environment.

>
> And also, I will check whether this driver works good on the x86 server. Right now, I'm testing on arm64 server.
>
> >> And also, I used xrandr to set modes after 'startx'. Changing resolutions works,
> >> but there are errs when set some low resolutions.
> > That's a separate topic, most likely related to timing or to some other
> > issues. You can fix that separately (but please do, switching modes
> > should work).
>
> Okay!
>
>


-- 
With best wishes
Dmitry

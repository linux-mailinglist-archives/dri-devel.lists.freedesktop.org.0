Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D71A45601
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 07:51:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8621410E85D;
	Wed, 26 Feb 2025 06:51:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JQqOppUU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E1110E85D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 06:51:38 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30761be8fa7so60167331fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 22:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740552697; x=1741157497; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=z4ngxG7wZTi1m7uV7bTzUYJzMzdYxlg992vgIRw5xa4=;
 b=JQqOppUU7fGsFGEfLJSJDrvE9S0+PSZ4Nx7HV7HFZmb6KF6IDuEteojbqhX5XiNL6l
 p7G0KgD9FWOSFyKOX7d0ZKGzj5ka5xnmtwnXZSAWfuePKprCvDobnIUDgf6IFgrDtllG
 V0asNbBcqKc7WZpV38G0PltHd2MWUMMmUu2DUTwqqnXK7nzwozNLGc0BgidE+3Rt+KJa
 eCwHz+IXDEtMVNsOKTWyk2l/eXLFZxJSc7gbWtWJsmt7tEKKs/uIJQ4j10vomyz4HEPu
 bndoImUCLtGR6OosIX4t9Vrvs9XR06/SO1V29plHohi/QlJoPbzW2FpNoPHZYqdPUMY1
 ALJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740552697; x=1741157497;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z4ngxG7wZTi1m7uV7bTzUYJzMzdYxlg992vgIRw5xa4=;
 b=b4L6DTWffyEuSjuOT/q5YxibH9nhpX5DuLEzsu/3slBnN4IdoBZ1b6pFFxDG4L4APT
 cC0yKNf79TFOh0pppLqufNbjdm0X+VVf4P4E9wQgnthY/JrKYWj4r7W2NoiEddCDbcgg
 xImAtjHaqrG4z6BmggHOshEEA1cmbS5QM7YDGq45XIKPfAg5RwCFoj8dF74JN9vS3NSd
 8AryeqDNWj4+TQH3TgOWyY6RoBi/03jQ7iAR9qYeBDT08BFZEhLsIdnRaefBKec92zsD
 OyIMBR+DMA+MdkpdqddD5QnVI0KlcW0P4gU33i8yYPKWNT5TKRqmW6y+xUII588Mv1KG
 yxUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe5qPH6o2VkBqZG5KPOII9394aqjYcn9HIAJwORgiS6Gc4OmS3uEuEHZ7FJT4pBPShXLw9pi5gFz8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaWPpVrKS3ya9yr6ho1wvbHTEbrQYxH2cGBa77te9ML9zIGGvy
 aGaVeXJ+f9TNxO17tuFIeVQoa7yP9rvfN7RdgR6fcHpVODurz7HWvZRb5Rgeo5g=
X-Gm-Gg: ASbGnct5YWsJ9AFb9ZiDpHsnDo+LIpnaUgg+gwe+sqZF2KX9YvqBxq9aEbyJccf2uZ1
 Xa+LRRN5YO09PtOxZsMi29StGFEPRBff3lOJndNQUxz3qPHuD323szUHsOtU5FKOArbrYIFk4d1
 3zJSUvvIbJ90MaU3VHrpl3gFzAq3Hq2f+sD/SNPsUI+dwG8BJy2NoAxQCYrF9zXIpV263RLGF7/
 2IYI/nVDjUmdRQjTtajsu9ltkSI18FSxyQV4j2WFVLC0oRbUjahBxo71215PoBcXwTxGZuXxIIm
 xoNzGwTzHYuDnQGS0FCWP2332mp1qAPtnKkZIim6qexka/bGkV8agIOAVN9HMU6//RDMES/175i
 +1gaTAw==
X-Google-Smtp-Source: AGHT+IHhnecMpxf3ajGCWrSv09C+5qZ2BSxCoboF22wDMvMgPA47KnQQNxvM//BmYfumNsfXt/RUKg==
X-Received: by 2002:a2e:934e:0:b0:309:24c1:73e1 with SMTP id
 38308e7fff4ca-30b7915f761mr22083431fa.12.1740552696677; 
 Tue, 25 Feb 2025 22:51:36 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a819e0bebsm4067451fa.18.2025.02.25.22.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 22:51:36 -0800 (PST)
Date: Wed, 26 Feb 2025 08:51:33 +0200
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
Message-ID: <vrsy4hao4qu3hlcbmjyfyibeearhhjgtik3e6o3v2eyzkatdve@kdb7cyvl45tu>
References: <20250222025102.1519798-1-shiyongbang@huawei.com>
 <20250222025102.1519798-8-shiyongbang@huawei.com>
 <reqpxlbvlz5qssgy6gbjuou33h4zevo4xeztqbsr4keehplyhx@utv22a5ihohx>
 <eef68fc7-30f4-4246-a82e-4f90cd6a665d@huawei.com>
 <6jx5ldpidy2ycrqognfiv5ttqr5ia4dtbryta3kc2mkndrvvgo@qzuakucz765k>
 <6634386b-afc1-4e31-a2f4-9c1afed2d1d8@huawei.com>
 <CAA8EJpqHmhUxLE57XNeh-nVtSP7WvtBE=FiFWk9kqM_P+AC=0A@mail.gmail.com>
 <5af62fa9-e71b-412f-8640-502f03fcaa52@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5af62fa9-e71b-412f-8640-502f03fcaa52@huawei.com>
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

On Tue, Feb 25, 2025 at 09:57:17PM +0800, Yongbang Shi wrote:
> > On Mon, 24 Feb 2025 at 16:03, Yongbang Shi <shiyongbang@huawei.com> wrote:
> > > > On Sat, Feb 22, 2025 at 06:35:48PM +0800, Yongbang Shi wrote:
> > > > > > > +static int hibmc_dp_hpd_event(struct drm_client_dev *client)
> > > > > > > +{
> > > > > > > +  struct hibmc_dp *dp = container_of(client, struct hibmc_dp, client);
> > > > > > > +  struct hibmc_drm_private *priv = to_hibmc_drm_private(dp->drm_dev);
> > > > > > > +  struct drm_display_mode *mode = &priv->crtc.state->adjusted_mode;
> > > > > > > +  int ret;
> > > > > > > +
> > > > > > > +  if (dp->hpd_status) {
> > > > > > > +          hibmc_dp_hpd_cfg(&priv->dp);
> > > > > > > +          ret = hibmc_dp_prepare(dp, mode);
> > > > > > > +          if (ret)
> > > > > > > +                  return ret;
> > > > > > > +
> > > > > > > +          hibmc_dp_display_en(dp, true);
> > > > > > > +  } else {
> > > > > > > +          hibmc_dp_display_en(dp, false);
> > > > > > > +          hibmc_dp_reset_link(&priv->dp);
> > > > > > > +  }
> > > > > > If I understand this correctly, you are using a separate drm_client to
> > > > > > enable and disable the link & display. Why is it necessary? Existing
> > > > > > drm_clients and userspace compositors use drm framework, they should be
> > > > > > able to turn the display on and off as required.
> > > > > > 
> > > > > Thanks for your asking, there are cfg/reset process when the connector 's pluging in/out.
> > > > > We want to cfg DP registers again when the connector changes. Not only dp link training, but also cfg
> > > > > the different video modes into DP registers.
> > > > Why? The link training and mode programming should happen during
> > > > pre_enable / enable stage (legacy or atomic).
> > > Hi Dmitry,
> > > 
> > > Right, that's what I'm curious about. It won't call encoder enble/disable functions when I triggered HPD.
> > > And I'm sure the drm_connector_helper_hpd_irq_event() is called. So I add a drm_client for it.I
> > It should be userspace, who triggers the enable/disable (or it should
> > be the in-kernel fbdev / fbcon, which interface through the generic
> > drm_fbdev client).
> 
> Right, I knew it. When I insmode my driver firstly (or restart display service), it will call disable, modeset and enable,
> by user, but it won't call when HPD triggered .

- Is HPD even properly delivered to userspace? What kind of compsitor
  are you using? Is .detect working properly and reporting a correct
  plug-in state?

-- 
With best wishes
Dmitry

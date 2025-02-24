Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44459A42150
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:43:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF65910E483;
	Mon, 24 Feb 2025 13:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KRaQWkOG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D08F10E122
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 02:52:49 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5461cb12e39so3728324e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 18:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740365567; x=1740970367; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=N79cu7iC2Cqqnin+PLo4xCdrijtvr/2XsDeBhnAhIuo=;
 b=KRaQWkOGHRbe7zwgY9+CYNNZ9bWAJ1kKbp9Do+6UEy54FG0piPu2KxsbqLP3fDRXDA
 r2y22tIlxYA8yYJdOpZ5LaeWuvsnk1F97WyU496iZlvLQPmW6ZfKa6k3+p/fUoT5rL7M
 RmK+/puaPxvuRwKYwiuDILeLZigz6CsZYQwwOglJoHXTymiNFCKkP2mAMKnDhpD3o5wu
 ns8NkPUBUCgtS/z8m9SSyUSEowajeH0c/3Qs01XvJ0nCG7eEJ9vl+ciZKxK/3FdfYHhp
 36znjg9Yj/imgR4nYUgQxe1gUcnRbyBLLqYjjvxv6GnnYYK7ZLzc/rHflfEygjGd9L3+
 /QpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740365567; x=1740970367;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N79cu7iC2Cqqnin+PLo4xCdrijtvr/2XsDeBhnAhIuo=;
 b=dnUY9IOrDIu472hLyUtJN5b1No3wIh9qvmuAFt2pzlp/TtxtyqDcAXKAOw4nhcOIKU
 VDVJNIDdYb6aWDhG5tSsImREJsrH0rPqRNnuvrwbg3ZFOLys8zdJNrpLp6vIvo6AJT/c
 mRw+sWS4rwjhEcm2Y+ekaNqX/cQuStHuUBuORJl421eE/5lFz+T2R2MxqCYYUPEYdUNN
 idFKqYNq0+KWtrmUIqfnqnpiH6LBstAJ1ADBCF82ZIk3VxgXjwqe5i4WEwsK4xnXOc+6
 NCsPFSJcpmTvvuGKwsmPoC7asDjmI6bMA/GW751GWLbREAGFqVKMvPvvD3s0fltwpRwk
 PTgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqkv+Ic3v6tYPZ4zbuF1L+PkEx2zLVxVrYGHwtFnYBJ46hTniQ3IAxDN0OybNRO1iagUoK1mrdD6M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNORU5IZzO574POP99l/29JkOY0NzfcEbyPEihkMij6Z5db0DM
 2mf+4RJBJAwIc4q2DWfxRxpV5OtGmjYVoLxuB6I2+wujPgjrAycexdJDy/ZYntk=
X-Gm-Gg: ASbGncum4aY5Qsh+eVEeWSLF62o6E11V2myuGKqVukFWLon5hBImm3leR9634Q9z2oU
 A1fPJAacULAS2znoPGBCw9XXQKYEcJyM6BzLPEHzspundhtJsid07GR9ijH8q4Onhch9uYqrzzT
 j+MSFlCe2+q74L0TiqFfd7xtG+bGBFzryh2eU51y4uy0KhqmWrP4UYBRjE8N31BfLw7vrKmF8ZJ
 Ie3d6vFGXmt4LslBTSBR9j3TnDJgFku1MdCIZU4ChOtPE/2qainDEAZTNvaKTXbaSLcBBaJ12et
 SgeDyxnfPZzSg4dRLz4+AmmTLeywUrduT1DlblwUliuGbqeRSdgxLu6PnnF5/9tMeEVpHKhKwuW
 E8mPOcg==
X-Google-Smtp-Source: AGHT+IEa5Mf84ph5T/ZdHvdKMLIs5jH8HXd1tjLXSn92MqsxBCI728iU6GLsECzIInK2/X8Pt2Ep/A==
X-Received: by 2002:a05:6512:110d:b0:545:62c:4b13 with SMTP id
 2adb3069b0e04-54838f4c9efmr4290701e87.40.1740365567236; 
 Sun, 23 Feb 2025 18:52:47 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54839cd339dsm838172e87.203.2025.02.23.18.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 18:52:45 -0800 (PST)
Date: Mon, 24 Feb 2025 04:52:43 +0200
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
Message-ID: <6jx5ldpidy2ycrqognfiv5ttqr5ia4dtbryta3kc2mkndrvvgo@qzuakucz765k>
References: <20250222025102.1519798-1-shiyongbang@huawei.com>
 <20250222025102.1519798-8-shiyongbang@huawei.com>
 <reqpxlbvlz5qssgy6gbjuou33h4zevo4xeztqbsr4keehplyhx@utv22a5ihohx>
 <eef68fc7-30f4-4246-a82e-4f90cd6a665d@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eef68fc7-30f4-4246-a82e-4f90cd6a665d@huawei.com>
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

On Sat, Feb 22, 2025 at 06:35:48PM +0800, Yongbang Shi wrote:
> > > +static int hibmc_dp_hpd_event(struct drm_client_dev *client)
> > > +{
> > > +	struct hibmc_dp *dp = container_of(client, struct hibmc_dp, client);
> > > +	struct hibmc_drm_private *priv = to_hibmc_drm_private(dp->drm_dev);
> > > +	struct drm_display_mode *mode = &priv->crtc.state->adjusted_mode;
> > > +	int ret;
> > > +
> > > +	if (dp->hpd_status) {
> > > +		hibmc_dp_hpd_cfg(&priv->dp);
> > > +		ret = hibmc_dp_prepare(dp, mode);
> > > +		if (ret)
> > > +			return ret;
> > > +
> > > +		hibmc_dp_display_en(dp, true);
> > > +	} else {
> > > +		hibmc_dp_display_en(dp, false);
> > > +		hibmc_dp_reset_link(&priv->dp);
> > > +	}
> > If I understand this correctly, you are using a separate drm_client to
> > enable and disable the link & display. Why is it necessary? Existing
> > drm_clients and userspace compositors use drm framework, they should be
> > able to turn the display on and off as required.
> > 
> Thanks for your asking, there are cfg/reset process when the connector 's pluging in/out.
> We want to cfg DP registers again when the connector changes. Not only dp link training, but also cfg
> the different video modes into DP registers.

Why? The link training and mode programming should happen during
pre_enable / enable stage (legacy or atomic).

> 
> 

-- 
With best wishes
Dmitry

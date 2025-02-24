Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6C2A427A2
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 17:16:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BA610E103;
	Mon, 24 Feb 2025 16:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IhSFIeZf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5532B10E103
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 16:16:43 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-e53c9035003so3569677276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 08:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740413797; x=1741018597; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7nhvYBpaOQuzZc2PPxyd2t+tuXQyCwGXIxNVGnXYPsA=;
 b=IhSFIeZfYmEtGgs0VPkLu0Ob7E6HLBPBntnmi2M+nAe+ZozulK5g7kMOVp3VyrZaMo
 ryfCRPQlaL5fk7udi90hHnWYGlIkddBpEpwaz9swMmQZNzO2rMJVPnx/nmH2Fw5ynL/Y
 fm8qC9ZOpieP6ApYpxxNb8iln7BbO/scxL0DrmbOEpsQFMwh1blkOobUklyocr9WLta5
 P61pq7BZF+Pom3yIbf+2KST6GfelmehO4Ze+e2WU0pK3Lx5uFpG6ujfywWTnAayq5kOP
 k0mvY/XO8WPdzMnN3Xgi2ekEy+pThmMv5UCYNZfjvdgdGnBJjx72pPphX4Q8QcIAiSo8
 6fjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740413797; x=1741018597;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7nhvYBpaOQuzZc2PPxyd2t+tuXQyCwGXIxNVGnXYPsA=;
 b=bYd9nJNm/uiqHebTIuwyfwuvGwQ0k+wan6LMGg0Es5GBu5tMdDgGfg9q6xg9VrkpFR
 2oMguTVahMssicVD2yyb+1qqf1kUomxq6aARg4ck39csY3kFPqFYA26ui2ia/65m3Dcz
 7dsY2Zh3vJm+RDiN7LOuXmhmNN+pf6qtv8R1dJgeqHh0K3sH0HMAq4YKFrF8iJxcMJYP
 GCunhw5M02ICgj8/oQAKTLkjpOqwotVyk4asFg7GGf0wmOJc1VDN8qj4xDQJ6oWizoRb
 hwO4bvkiOOKaCJfHsZfXDMpAw1bjf2W63OIDqwyaRnBXZqO+c03QY0bvBpt+RU+bAt0K
 gqLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJcXuuWMC41x1I9DT2JTnXRmJ6ALi3zxpOVivpvp65x3cXooyzB8qa/amL3QvddY1nugT7GZ0ms1s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8Sbxi0xt31UHDX8sT7WVLX3W/RJUBx/LjDZuqnLlteZzI31SY
 Fs5IjhAYalymcSseDTmtZ+1+umYrcixSHknvn7LYMeJyzDeJBvUjGSJd3uhj7atkKCe2xdManAO
 VCmZ5+HaPQMNYp2lv2xWHRQWnXqIBVUPyTs38Jw==
X-Gm-Gg: ASbGncsiikoxfgV2qwcFWmZcgY72fb8Wp1KihGs/f9S5ek9PlbiPd2HUoCLHH4B/Tsx
 5fltZBHwQNY+kioSI8jRCDVu+ERTbz/P/DK80gk5wXJugmOpPPpN+61wxBAQLKOYPS6BF/JtIiG
 wvu3hRp+5HMtzy/D+QTB/7lxfQPSISOYf7TzLwF3pO
X-Google-Smtp-Source: AGHT+IERTbcHpTFjL8xCwXbbDdtb9v5bJZbheeag9xnvtXSUhwjOQHRlR9/ILy4dAvc8ziVN20n9Ds50jV3I6NnIhrk=
X-Received: by 2002:a05:6902:1147:b0:e5e:14d4:e630 with SMTP id
 3f1490d57ef6-e5e24668e26mr11373831276.39.1740413797228; Mon, 24 Feb 2025
 08:16:37 -0800 (PST)
MIME-Version: 1.0
References: <20250222025102.1519798-1-shiyongbang@huawei.com>
 <20250222025102.1519798-8-shiyongbang@huawei.com>
 <reqpxlbvlz5qssgy6gbjuou33h4zevo4xeztqbsr4keehplyhx@utv22a5ihohx>
 <eef68fc7-30f4-4246-a82e-4f90cd6a665d@huawei.com>
 <6jx5ldpidy2ycrqognfiv5ttqr5ia4dtbryta3kc2mkndrvvgo@qzuakucz765k>
 <6634386b-afc1-4e31-a2f4-9c1afed2d1d8@huawei.com>
In-Reply-To: <6634386b-afc1-4e31-a2f4-9c1afed2d1d8@huawei.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Feb 2025 18:16:24 +0200
X-Gm-Features: AWEUYZktbuXYXa96Q3xFxeJhj1PB3sx90DPGtIUB2gMqOztio-fCDvHDs3KOcks
Message-ID: <CAA8EJpqHmhUxLE57XNeh-nVtSP7WvtBE=FiFWk9kqM_P+AC=0A@mail.gmail.com>
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

On Mon, 24 Feb 2025 at 16:03, Yongbang Shi <shiyongbang@huawei.com> wrote:
>
> > On Sat, Feb 22, 2025 at 06:35:48PM +0800, Yongbang Shi wrote:
> >>>> +static int hibmc_dp_hpd_event(struct drm_client_dev *client)
> >>>> +{
> >>>> +  struct hibmc_dp *dp = container_of(client, struct hibmc_dp, client);
> >>>> +  struct hibmc_drm_private *priv = to_hibmc_drm_private(dp->drm_dev);
> >>>> +  struct drm_display_mode *mode = &priv->crtc.state->adjusted_mode;
> >>>> +  int ret;
> >>>> +
> >>>> +  if (dp->hpd_status) {
> >>>> +          hibmc_dp_hpd_cfg(&priv->dp);
> >>>> +          ret = hibmc_dp_prepare(dp, mode);
> >>>> +          if (ret)
> >>>> +                  return ret;
> >>>> +
> >>>> +          hibmc_dp_display_en(dp, true);
> >>>> +  } else {
> >>>> +          hibmc_dp_display_en(dp, false);
> >>>> +          hibmc_dp_reset_link(&priv->dp);
> >>>> +  }
> >>> If I understand this correctly, you are using a separate drm_client to
> >>> enable and disable the link & display. Why is it necessary? Existing
> >>> drm_clients and userspace compositors use drm framework, they should be
> >>> able to turn the display on and off as required.
> >>>
> >> Thanks for your asking, there are cfg/reset process when the connector 's pluging in/out.
> >> We want to cfg DP registers again when the connector changes. Not only dp link training, but also cfg
> >> the different video modes into DP registers.
> > Why? The link training and mode programming should happen during
> > pre_enable / enable stage (legacy or atomic).
>
> Hi Dmitry,
>
> Right, that's what I'm curious about. It won't call encoder enble/disable functions when I triggered HPD.
> And I'm sure the drm_connector_helper_hpd_irq_event() is called. So I add a drm_client for it.I

It should be userspace, who triggers the enable/disable (or it should
be the in-kernel fbdev / fbcon, which interface through the generic
drm_fbdev client).

-- 
With best wishes
Dmitry

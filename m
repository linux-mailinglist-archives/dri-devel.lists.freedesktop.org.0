Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B319B7EF1
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 16:48:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D67810E8DE;
	Thu, 31 Oct 2024 15:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="garY7Ysy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D69010E8DE
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 15:48:30 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-20bb39d97d1so9908935ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 08:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730389710; x=1730994510; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NjC3nMAIlVM1q3lt2DpIHub8eL6Pw0tLQHd/8IGv3WE=;
 b=garY7YsyBoYCmIz+IzUie+Aq+TuRchRiIMpTr0Qj6K8VomZlNEYaL2TPmujRDAQEhN
 sWx3gGoB8FFZX2cSF/5iTT2NCEwtKXP1fGE5CzHHB0/fkLJEGV8JD93vxyLE0jGCRBs0
 uca3W4wdd8VOO7chs3UQCxL3KcWccTW+YU10+NHP6xIWWuM2swoenWTEXggrjWZuIPrz
 GT8HH4GN4tcXC74Sl/239qHL442hHPO/Ry6dGxhWgs1GKKdg84qQ1dTJkYrjOqs1IMEH
 n+73nQ8W4g6HisxuxPRqlioIKhJDw5Zp3fbCxkdokO1x7fKJyBUT4VuFDHC2jt2AFqQn
 mD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730389710; x=1730994510;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NjC3nMAIlVM1q3lt2DpIHub8eL6Pw0tLQHd/8IGv3WE=;
 b=d8VNHxVGX2gBJrCEFuVT797Va/WdDXkeel9AfkMZhshs++3po0YVRvbo7uqfTLbrAu
 M5kqBiUMLevlXz922Ak/LBAS/CWpyRHebYRnd42Rz5wC5KpaP5ox/ZkwwRuxD1VFs2lP
 cQqukrAmzzM7K9u7HfY+e7MSf+zjvV6QCAEXxjt3W8vJRlfL20qXIt+GUAsFLJYzzYo8
 rElkKOZdeD+GPs8UCy1xTNXsUr+CdysZ6ISyAAE7ZAmDX3/h8sDU3wGWtkqiexBJEkmN
 ytv4x9qkxjL87sf7dZZDzfgh3Ku5LkwCYXKeJCn57DxYHBhZgoEpfIt3CGTN74bBl5eg
 vQAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBoyrmJTUuheJdqRcUsJ1Mi3XJiiLo8d/A7xUy94NUZM2XnVKtas3hiphVzrD+HTephKpnCcUpZ/4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWeY3Yt/PggbYqjvo1JttqtIBvr0ObhyuQB6JVNr3mIZBGqVaN
 V33gWK/tzAn8X31gDZxHZHuIu7o+aySLSR0Nj6Nz+LOyRfe+HTrINJ+tX4qPDZBAfrCN5ZpLGDY
 TG7vKPJqDmmeMQ8Bl6pofFXymBowAniQ3yty+ZQ==
X-Google-Smtp-Source: AGHT+IHSfDKRii2NwhyNl5yN1Hcn8F5/2hI6zBGdTVZhAkhVitVIhKYO47+S571JKu4USELXFc3aJNzy7hxcwlEDOmc=
X-Received: by 2002:a17:902:e54b:b0:20c:8b02:f9f7 with SMTP id
 d9443c01a7336-210f7711e6amr85424115ad.60.1730389709967; Thu, 31 Oct 2024
 08:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20241018-drm-aux-bridge-mark-of-node-reused-v2-1-aeed1b445c7d@linaro.org>
 <ZxYBa11Ig_HHQngV@hovoldconsulting.com>
In-Reply-To: <ZxYBa11Ig_HHQngV@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Oct 2024 17:48:24 +0200
Message-ID: <CAA8EJpopyzeVXMzZAiakEmJ9S=29FKt43AHypSYyOuo_NbSJbw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: Fix assignment of the of_node of the
 parent to aux bridge
To: Johan Hovold <johan@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
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

On Mon, 21 Oct 2024 at 10:23, Johan Hovold <johan@kernel.org> wrote:
>
> On Fri, Oct 18, 2024 at 03:49:34PM +0300, Abel Vesa wrote:
> > The assignment of the of_node to the aux bridge needs to mark the
> > of_node as reused as well, otherwise resource providers like pinctrl will
> > report a gpio as already requested by a different device when both pinconf
> > and gpios property are present.
>
> I don't think you need a gpio property for that to happen, right? And
> this causes probe to fail IIRC?

No, just having a pinctrl property in the bridge device is enough.
Without this fix when the aux subdevice is being bound to the driver,
the pinctrl_bind_pins() will attempt to bind pins, which are already
in use by the actual bridge device.

>
> > Fix that by using the device_set_of_node_from_dev() helper instead.
> >
> > Fixes: 6914968a0b52 ("drm/bridge: properly refcount DT nodes in aux bridge drivers")
>
> This is not the commit that introduced the issue.
>
> > Cc: stable@vger.kernel.org      # 6.8
>
> I assume there are no existing devicetrees that need this since then we
> would have heard about it sooner. Do we still need to backport it?
>
> When exactly are you hitting this?
>
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> > Changes in v2:
> > - Re-worded commit to be more explicit of what it fixes, as Johan suggested
> > - Used device_set_of_node_from_dev() helper, as per Johan's suggestion
> > - Added Fixes tag and cc'ed stable
> > - Link to v1: https://lore.kernel.org/r/20241017-drm-aux-bridge-mark-of-node-reused-v1-1-7cd5702bb4f2@linaro.org
>
> Patch itself looks good now.
>
> Johan



-- 
With best wishes
Dmitry

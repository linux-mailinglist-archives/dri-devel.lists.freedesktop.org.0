Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EF990BB2E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 21:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5CD10E4C9;
	Mon, 17 Jun 2024 19:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TgRGZnTh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9364F10E4C9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 19:34:51 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-dff02b8a956so4599713276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 12:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718652890; x=1719257690; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lTah/B+6o/9BifqLB2EY6X3bjK54colO4RjpfhkqoEY=;
 b=TgRGZnThafN5829vFwdKJetZ+M1wLedxKDqp4NbqIBq4fVSpe/68bUZojRkOqgqx7o
 YaZeN5ahOLJMZh7EhQCPVdWq98xKPp/rJDcClPLTGwWiArdGTzsV6w0bmon/CJvQyxQA
 tcPsafEPesyaio1suwtK1r3iJVJR26CJRJXejqo3paYCPMh87fROPKUigcSYCNCXdvgR
 Nztmr+dUi8Ce8HMDw2sdwXPV8X+7SU2VQGCTLXgTS1zN5I6HpS/mOstSTcw8fuJjqpZe
 U+bNO3L2EjzOPsSTGvANHxjTThmhxuYMBLOOzvwEf06kMw8nhRh+8ydT+pBYxHssZAdA
 uC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718652890; x=1719257690;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lTah/B+6o/9BifqLB2EY6X3bjK54colO4RjpfhkqoEY=;
 b=pzgUvaRxow4AU9oLg2/V6NSDEeMaqKGooUNZGb6PkXDx5pxVG39mBVCTNlb33u6FQH
 GaI6ay3J+RKgKbEmWOmBakiR1SOry7rJ3T4sIOwJ+/3pI2oKkjo7Bta5nlDTT6O8h9Ro
 GvDtiVGDys9zjDcFy43LrEmFnNirq6TTxymbKTh4x+XWHnGslXL1faKLtKIMLu15+/Pr
 yye9xEf+ZLG2KX1qyesDLWR/5to4+QxySEuN2VRdnEh5bqODTByaFG2JmTBcTIuXaa/m
 zPfY3+UaluIQprNNmBm98mTgvb1lXPzcLUs9G1/bhm4rztK0Ko0cshToyB75Lstdso93
 xvuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHSEpTSdoiQcKIX8+uhpr5ndX0e1ocHV0BGBwbNrHoNRHyU/uvC7ZE+CntdmZWyDCWgk9jUgxsu4UTrmiCpG3zBSR+UZMzdRKPKnlARwom
X-Gm-Message-State: AOJu0YxDV6VBGDa4YpwfQBnWsW4bZZNOz/kfTAizPanq2iHr/DAhSYHU
 dh1n2z1vQr2YwjnGAAkKJr7u+k25oDD3q//jQi5nIEnlkIiV+twdYs7opWhzChS3rSEEPySha4a
 X9E9pFbpbBhrqCEJ1xdeI3e06A7CoVHeA8ZJvEg==
X-Google-Smtp-Source: AGHT+IETQc6YgGmsfsXMKMUHNOkYN7aTQy9yPirXNwAulNuwGSkh6KBKg+P+Bnjk61peJb2wqP71cDS5gMSMhNkLmdA=
X-Received: by 2002:a25:d885:0:b0:dff:3ea5:c4a0 with SMTP id
 3f1490d57ef6-dff3ea5c6efmr3873797276.59.1718652890295; Mon, 17 Jun 2024
 12:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240617105311.1587489-1-a-bhatia1@ti.com>
 <20240617105311.1587489-3-a-bhatia1@ti.com>
 <fyxer3rl54uq7qemgjx7htykgsnwgg5ywda2d5f4fhzd6ksjfg@blvkbzdy6op5>
 <41fd6509-33fd-4e7f-9889-e7e9acd928d8@ti.com>
In-Reply-To: <41fd6509-33fd-4e7f-9889-e7e9acd928d8@ti.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 17 Jun 2024 22:34:37 +0300
Message-ID: <CAA8EJpqt5FVjP+MP6kf6KaMi_OtEXQ2FgoqVfJCxRuLGfMOkFg@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] drm/bridge: cdns-dsi: Fix the phy_initialized
 variable
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Jyri Sarha <jyri.sarha@iki.fi>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 DRI Development List <dri-devel@lists.freedesktop.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Dominik Haller <d.haller@phytec.de>, 
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <treding@nvidia.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Jai Luthra <j-luthra@ti.com>
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

On Mon, 17 Jun 2024 at 17:16, Aradhya Bhatia <a-bhatia1@ti.com> wrote:
>
> Hi Dmitry,
>
> Thanks for reviewing the patches!
>
> On 17/06/24 17:29, Dmitry Baryshkov wrote:
> > On Mon, Jun 17, 2024 at 04:23:03PM GMT, Aradhya Bhatia wrote:
> >> Update the Phy initialized state to "not initialized" when the driver
> >> (and the hardware by extension) gets suspended. This will allow the Phy
> >> to get initialized again after resume.
> >>
> >> Fixes: e19233955d9e ("drm/bridge: Add Cadence DSI driver")
> >> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> >> ---
> >>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> >> index b016f2ba06bb..42565e253b2d 100644
> >> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> >> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> >> @@ -1153,6 +1153,7 @@ static int __maybe_unused cdns_dsi_suspend(struct device *dev)
> >>      clk_disable_unprepare(dsi->dsi_p_clk);
> >>      reset_control_assert(dsi->dsi_p_rst);
> >>      dsi->link_initialized = false;
> >
> > Most likely you should also call phy_exit() here. And in _remove() too.
>
> I agree that phy_exit should be called here. But why in _remove()?
> Wouldn't having phy_exit in 2 places mess up the internal ref count?

If suspend() is going to be called in the teardown path, then it's
fine to have just one call here. Otherwise you might add one guarded
with if (phy_initialized) to _remove() too.

>
> >
> >> +    dsi->phy_initialized = false;
> >>      return 0;
> >>  }
> >>
> >> --
> >> 2.34.1
> >>
> >
> --
> Regards
> Aradhya



-- 
With best wishes
Dmitry

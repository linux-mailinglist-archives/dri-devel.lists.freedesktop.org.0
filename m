Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 554F886F70C
	for <lists+dri-devel@lfdr.de>; Sun,  3 Mar 2024 21:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04B310F3AB;
	Sun,  3 Mar 2024 20:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bF5Lyg8L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0A810F3AB
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Mar 2024 20:38:04 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-6098bf69909so15779517b3.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Mar 2024 12:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709498283; x=1710103083; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dTEJxntvNcBZ56iY+D/YvQDXi/WrmMk0Lilb5w4ab2I=;
 b=bF5Lyg8Ln9za6vw8CuP0WEcoxfblF1KGGUfHBXq0TYugk9cFundMefljkuAsZHr48u
 5prmxXHCB6z+OHme6v6cAX68yQEwjTcdkftqnEdvLgVsSNgzulHMn9x+LmPG6z7OYWOz
 X4QTG95b1vtBeRviEcpT5dhKZmK65BFRN61XTxKX5ajBT0XK+K2NORCKzxkQ4JvH4bgU
 pKownMzba1R8oGc/1XT3q/9M0C9F8+fv1EVrhabR5ldlU86hF+DhGMhF0XfIQPvizJAA
 SuBtWPVOESKhbhYsqCL0VvALbw4a+4Mt3OxmQqojyZgS6ENNCGn24+XW1DDIAh3INfkw
 xlhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709498283; x=1710103083;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dTEJxntvNcBZ56iY+D/YvQDXi/WrmMk0Lilb5w4ab2I=;
 b=j12QkLhthb+gRfY29FApfQ5pkD0878WPVb1ZhX7PwwLeMaOGXFg+K/0jd5zqWQKpqe
 AL/YL2QJdlRHeJGj0ClJjXiEOVF/gSHzLIKoKRsfJ8v8i+p/cp6knj7u7eCXKy6A1d2M
 yvnmazcrTuWDT0uQgfPQ95K1cpw2ksYVHI8z43shycjQPAs1FkDqzgNkP0N6fkDD/5ju
 N1OTaJ8rH/H4v2Xejg/XrGYmMfq87qG1SY/HKTqwCy3Iqbsfp8ykSid/U9u+mi3W5itS
 xPcxAfN9BqOSMiu3J2g2ssjwXP1lObva5glvT6EQUFsAzmcit/5rw8wT1SYB7fR0NYSr
 0N0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXapbAirZsvfza/z1FTkjhcL0Ue+fzE8ESaA+/yr2Ac/bdm/P651wxhotNiYFKI2axEHiJUhJU5yRPXkk8Rfx645N8fiQCU0IR1sqOk6dU0
X-Gm-Message-State: AOJu0Yyc5DpLSSl6v8deOrwnfSoopSvOvddWkIFcfDvHC/Trnugxb16A
 L90V9DPOPlva9Cs428CU6ZoMndxWzzIVFB/FFcjqK39wQK+Yl6wjQX2zWiITaCcMP6V3u7iVO6W
 OiVCLB2zkiN8MSly9FAb2/s+z5KBzCS7JPKF2Jw==
X-Google-Smtp-Source: AGHT+IFBO5gSa9X30AT+NFRPbWSXLFEUtICo9UN0O47OM1rGMJBVkS/RT7uCPfNYDTSDuVQFKmwjyXClyQjTFs/3AYQ=
X-Received: by 2002:a81:b34a:0:b0:609:456e:683b with SMTP id
 r71-20020a81b34a000000b00609456e683bmr5138328ywh.14.1709498283167; Sun, 03
 Mar 2024 12:38:03 -0800 (PST)
MIME-Version: 1.0
References: <20240111-drm-panel-bridge-fixup-v1-1-e06292f6f500@fairphone.com>
 <b1da07f9-7e15-4d83-bef3-d0ce157654bc@linaro.org>
 <CYGUWBAM3D62.35CPP5HGEYJ3Y@fairphone.com>
 <CZHGFD9QYM82.371U2DPG1AEGQ@fairphone.com>
In-Reply-To: <CZHGFD9QYM82.371U2DPG1AEGQ@fairphone.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 3 Mar 2024 22:37:52 +0200
Message-ID: <CAA8EJppZRABYGuoDc-6e6VMwtAo3LvEyDpsHdkHFckrR=q+0ig@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: neil.armstrong@linaro.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
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

On Thu, 29 Feb 2024 at 11:27, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> On Wed Jan 17, 2024 at 9:59 AM CET, Luca Weiss wrote:
> > On Mon Jan 15, 2024 at 9:43 AM CET, Neil Armstrong wrote:
> > > Hi Luca,
> > >
> > > On 11/01/2024 13:38, Luca Weiss wrote:
> > > > Since the kconfig symbol of DRM_PANEL_BRIDGE is only adding
> > > > bridge/panel.o to drm_kms_helper object, we need to select
> > > > DRM_KMS_HELPER to make sure the file is actually getting built.
> > > >
> > > > Otherwise with certain defconfigs e.g. devm_drm_of_get_bridge will not
> > > > be properly available:
> > > >
> > > >    aarch64-linux-gnu-ld: drivers/phy/qualcomm/phy-qcom-qmp-combo.o: in function `qmp_combo_bridge_attach':
> > > >    drivers/phy/qualcomm/phy-qcom-qmp-combo.c:3204:(.text+0x8f4): undefined reference to `devm_drm_of_get_bridge'
> > > >
> > > > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > > > ---
> > > > I can see "depends on DRM_KMS_HELPER" was removed with commit
> > > > 3c3384050d68 ("drm: Don't make DRM_PANEL_BRIDGE dependent on DRM_KMS_HELPERS")

Could you please make sure that the usecase described in the mentioned
commit message doesn't get broken by your change?

> > > >
> > > > I'm not too familiar with Kconfig but it feels more correct if
> > > > PHY_QCOM_QMP_COMBO selects DRM_PANEL_BRIDGE that that's enough; and it
> > > > doesn't also has to explicitly select DRM_KMS_HELPER because of how the
> > > > objects are built in the Makefile.
> > > >
> > > > Alternatively solution to this patch could be adjusting this line in
> > > > include/drm/drm_bridge.h:
> > > >
> > > >    -#if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL_BRIDGE)
> > > >    +#if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL_BRIDGE) && defined(CONFIG_DRM_KMS_HELPER)
> > > >     struct drm_bridge *devm_drm_of_get_bridge(struct device *dev, struct device_node *node,
> > > >                                              u32 port, u32 endpoint);
> > > >
> > > > .. and then selecting DRM_KMS_HELPER for PHY_QCOM_QMP_COMBO.
> > > >
> > > > But I think the solution in this patch is better. Let me know what you
> > > > think.
> > >
> > > I think this is no more the case after on linux-next:
> > > 35921910bbd0 phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
> > >
> > > But could you still check ?
> >
> > On next-20240117 the error happens in the aux-bridge file instead then.
> >
> > aarch64-linux-gnu-ld: drivers/gpu/drm/bridge/aux-bridge.o: in function `drm_aux_bridge_probe':
> > drivers/gpu/drm/bridge/aux-bridge.c:115:(.text+0xe0): undefined reference to `devm_drm_of_get_bridge'
> >
> > I'm attaching the defconfig with which I can reproduce this but it's
> > really just DRM_KMS_HELPER=n and PHY_QCOM_QMP_COMBO=y I believe.
>
> Hi Neil,
>
> Ping on this patch
>
> Regards
> Luca
>
> >
> > Regards
> > Luca
> >
> >
> > >
> > > Neil
> > >
> > > > ---
> > > >   drivers/gpu/drm/bridge/Kconfig | 1 +
> > > >   1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > > > index ac9ec5073619..ae782b427829 100644
> > > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > > @@ -8,6 +8,7 @@ config DRM_BRIDGE
> > > >   config DRM_PANEL_BRIDGE
> > > >           def_bool y
> > > >           depends on DRM_BRIDGE
> > > > + select DRM_KMS_HELPER
> > > >           select DRM_PANEL
> > > >           help
> > > >             DRM bridge wrapper of DRM panels
> > > >
> > > > ---
> > > > base-commit: b9c3a1fa6fb324e691a03cf124b79f4842e65d76
> > > > change-id: 20240111-drm-panel-bridge-fixup-5c2977fb969f
> > > >
> > > > Best regards,
>


-- 
With best wishes
Dmitry

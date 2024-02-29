Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AADB86C514
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 10:27:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E86A610E03E;
	Thu, 29 Feb 2024 09:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="yWkWtTwG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0FA010E03E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 09:27:35 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5654f700705so1053483a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 01:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1709198854; x=1709803654; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1n6ZCV67cur8e5mAju//0gzCRgXTlxNt1OqrWENqIVs=;
 b=yWkWtTwGU6g4isTckJ/K8atY6SLVLHMTVoZwyOAGM05JMLK1dNFJ13Qky1zySBeqkC
 FAtc1P3JAlcq3QahRLU4NHHMJgh4gGUqPTvLjYt5fMggkWl6jd85ag/4b3GDRiELzJg9
 HJqQJlGnqPcKeDqnGhXr/1PrExnKd4LGcujlwS7B4UGjKlfxxH3W6fH1Z80DpxTBqAdE
 shzeSYf47nGYI+/OJeDtjXK7RueIoXg2Nu50Ne1+hcaYNL7fTttvwE1608lUm9Tw7W4M
 9i3ZbgQ6wEJBOIiNDQfBqYZKpcN3WrGprM913/dy1L4tAi5wdelXIf9tubWq23J27S/5
 RNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709198854; x=1709803654;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1n6ZCV67cur8e5mAju//0gzCRgXTlxNt1OqrWENqIVs=;
 b=IrPIg0ZOBYzHsSRtiQ3DOQwa/7uNhP8NeZxRA9SJgQS57FoPKeMJKPfhEJSxIXTyaT
 jPg49qKfhTSOpJODfpVs9pvHVevW2NcFQTKXqlcAyFnTDaAGB5WtBScmDAH1iZowodqn
 bmJA5oZ+rPOyfQvjlQyduU/7S/drNfWPzFajKalU84oARpvnr/BFjX2UuJ0/x9+pSGQ1
 VL1Ki95o4C79udIYB5t3eo6DMmTKagy5mVRG7p2e6L87to4erR5NvgbP+c1yvn5hEtz3
 JdxmoOjmVy994B/NAAe7jel5Kbl4LIcDf+AmIKyP3aAP7EYVaTht7ikUZaQBEoBSnxX4
 z5rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT2JKahKPYhEsg8picuLkcW9SyBxyXXEe1SrcWRCZjylWQuUoT1IpM90mU26CRhUvUXR7/nqy/yvFdDXAEbeqnwbqVFZ3t5QN5tvcsMs6k
X-Gm-Message-State: AOJu0YwHaS2CD+wO48OINmww8XhlBuYCTOz/8/ZSYaZooIMXGHTjWdNN
 oHXa+BcKDNy1V56pFwL6SXhITCcghtzhmWoh0gCDGwRI2mzzi49Bv+6aaLH2KlQ=
X-Google-Smtp-Source: AGHT+IHQg7Xq8XAUxZCM3b/8E8wHu/qSRHC8mHdsKWekvtDdWPMBzGdgTylK0ht1WUfnSdjcGfBQAQ==
X-Received: by 2002:a05:6402:520c:b0:565:b4ca:72f3 with SMTP id
 s12-20020a056402520c00b00565b4ca72f3mr1476269edd.35.1709198853784; 
 Thu, 29 Feb 2024 01:27:33 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 c6-20020a056402100600b0056536eed484sm436406edu.35.2024.02.29.01.27.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 01:27:33 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Feb 2024 10:27:32 +0100
Message-Id: <CZHGFD9QYM82.371U2DPG1AEGQ@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, <neil.armstrong@linaro.org>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>
X-Mailer: aerc 0.15.2
References: <20240111-drm-panel-bridge-fixup-v1-1-e06292f6f500@fairphone.com>
 <b1da07f9-7e15-4d83-bef3-d0ce157654bc@linaro.org>
 <CYGUWBAM3D62.35CPP5HGEYJ3Y@fairphone.com>
In-Reply-To: <CYGUWBAM3D62.35CPP5HGEYJ3Y@fairphone.com>
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

On Wed Jan 17, 2024 at 9:59 AM CET, Luca Weiss wrote:
> On Mon Jan 15, 2024 at 9:43 AM CET, Neil Armstrong wrote:
> > Hi Luca,
> >
> > On 11/01/2024 13:38, Luca Weiss wrote:
> > > Since the kconfig symbol of DRM_PANEL_BRIDGE is only adding
> > > bridge/panel.o to drm_kms_helper object, we need to select
> > > DRM_KMS_HELPER to make sure the file is actually getting built.
> > >=20
> > > Otherwise with certain defconfigs e.g. devm_drm_of_get_bridge will no=
t
> > > be properly available:
> > >=20
> > >    aarch64-linux-gnu-ld: drivers/phy/qualcomm/phy-qcom-qmp-combo.o: i=
n function `qmp_combo_bridge_attach':
> > >    drivers/phy/qualcomm/phy-qcom-qmp-combo.c:3204:(.text+0x8f4): unde=
fined reference to `devm_drm_of_get_bridge'
> > >=20
> > > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > > ---
> > > I can see "depends on DRM_KMS_HELPER" was removed with commit
> > > 3c3384050d68 ("drm: Don't make DRM_PANEL_BRIDGE dependent on DRM_KMS_=
HELPERS")
> > >=20
> > > I'm not too familiar with Kconfig but it feels more correct if
> > > PHY_QCOM_QMP_COMBO selects DRM_PANEL_BRIDGE that that's enough; and i=
t
> > > doesn't also has to explicitly select DRM_KMS_HELPER because of how t=
he
> > > objects are built in the Makefile.
> > >=20
> > > Alternatively solution to this patch could be adjusting this line in
> > > include/drm/drm_bridge.h:
> > >=20
> > >    -#if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL_BRIDGE)
> > >    +#if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL_BRIDGE) && def=
ined(CONFIG_DRM_KMS_HELPER)
> > >     struct drm_bridge *devm_drm_of_get_bridge(struct device *dev, str=
uct device_node *node,
> > >                                              u32 port, u32 endpoint);
> > >=20
> > > .. and then selecting DRM_KMS_HELPER for PHY_QCOM_QMP_COMBO.
> > >=20
> > > But I think the solution in this patch is better. Let me know what yo=
u
> > > think.
> >
> > I think this is no more the case after on linux-next:
> > 35921910bbd0 phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
> >
> > But could you still check ?
>
> On next-20240117 the error happens in the aux-bridge file instead then.
>
> aarch64-linux-gnu-ld: drivers/gpu/drm/bridge/aux-bridge.o: in function `d=
rm_aux_bridge_probe':
> drivers/gpu/drm/bridge/aux-bridge.c:115:(.text+0xe0): undefined reference=
 to `devm_drm_of_get_bridge'
>
> I'm attaching the defconfig with which I can reproduce this but it's
> really just DRM_KMS_HELPER=3Dn and PHY_QCOM_QMP_COMBO=3Dy I believe.

Hi Neil,

Ping on this patch

Regards
Luca

>
> Regards
> Luca
>
>
> >
> > Neil
> >
> > > ---
> > >   drivers/gpu/drm/bridge/Kconfig | 1 +
> > >   1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/=
Kconfig
> > > index ac9ec5073619..ae782b427829 100644
> > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > @@ -8,6 +8,7 @@ config DRM_BRIDGE
> > >   config DRM_PANEL_BRIDGE
> > >   	def_bool y
> > >   	depends on DRM_BRIDGE
> > > +	select DRM_KMS_HELPER
> > >   	select DRM_PANEL
> > >   	help
> > >   	  DRM bridge wrapper of DRM panels
> > >=20
> > > ---
> > > base-commit: b9c3a1fa6fb324e691a03cf124b79f4842e65d76
> > > change-id: 20240111-drm-panel-bridge-fixup-5c2977fb969f
> > >=20
> > > Best regards,


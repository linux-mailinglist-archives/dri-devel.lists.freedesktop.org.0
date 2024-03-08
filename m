Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BD28760EE
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 10:29:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE9210F586;
	Fri,  8 Mar 2024 09:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="OMwNtvZX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E3610F586
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 09:29:45 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5682360e095so877351a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Mar 2024 01:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1709890183; x=1710494983; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xTJ56TsgHxx+ey5O16dDKClnhRLxsOWJSpToCms/BRE=;
 b=OMwNtvZXPK6GRFqqYLiz7c0Pmy5ovT/sbdVFtNzhkfYEa/ScRtKK6ShzM6Ltd/y5xZ
 GEiE5MlkC54Wz4dNIAR20OYx35V+bkCtxYDAEThBUoSbZzrGxETpX1SwB4Qrwarifqey
 0eotMmdHEnNWEUTJ+wHUBfSMjC29uYIaj+jPNn9/CEDeyEb5m7RxCWv32HbMLRKqg5Gg
 ULrY7m2KWiRWwP5mC2jOfSM81vUHbdvRvDuWHm63c8NMKP0qL5PDyLVscxLMzaUEJBVq
 UPDp6ETC+H0QkZsbmZr2FN+rhOpeRnvngu88cleSUnBs7gxF041TLTCWksji559UNHUN
 JG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709890183; x=1710494983;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xTJ56TsgHxx+ey5O16dDKClnhRLxsOWJSpToCms/BRE=;
 b=n4NKeQAeuDqHICov5Xit48KYHA/q0UTt1b5TrW6Ipu5MTHM2ExW8Ccpnpb+ogJCF05
 KMUopcMpSQXl25KmIpId2sqeIdl/I6DY9zGtlQAEFiW4J5muCZ7WirKDV1Zsf3CVc7O7
 HV/k76h6F8Tvd+0axDeiIMr/1hRQ4kKd3/6xJ06FifZ8jtC8kQT7+JwgJK6ao7V6PsAQ
 Cp9D1VCKK6btM2twL0DaiK+XOZ6u6JkL0vGaqLmdwZK9H1EFxXK4WCAbLndXEa5iZ8fK
 6oFGuR62LbChi7frAYNlp6M8onWNTdgo73fyBd0wUBIb/7jo98T2/pdvUndkYFOBLJGp
 6S9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwggsI6bCyLpxntTaksJXv6bHCRtexTI1Or6rCOteXW1VIJyfNjdxWa2n7yoOiDSSxmgSWAkmdnXRggIfsw04zk5Ah34DqDTCSLflULObY
X-Gm-Message-State: AOJu0Yx05iXYR7RZFkgWI8zo3+KOkr0Ll9m7apd3bkLr2rwViKsn8Jmz
 4cs8iii+ctVKYxKiSEKFgn0Bigf7KDAs4vpjUlYJIoeQSZ8PXJzsd/Oagjcz5gA=
X-Google-Smtp-Source: AGHT+IEVEG7pI97UFUoSKdm0T77oCm/IjNnF2X00bMMaoqhxQZtaQiQDnkm1z665OJP8Smo71pGd9A==
X-Received: by 2002:a17:906:b78c:b0:a44:44e0:868f with SMTP id
 dt12-20020a170906b78c00b00a4444e0868fmr12636544ejb.11.1709890183560; 
 Fri, 08 Mar 2024 01:29:43 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 p5-20020a1709060dc500b00a4537466591sm5611025eji.32.2024.03.08.01.29.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Mar 2024 01:29:43 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 Mar 2024 10:29:42 +0100
Message-Id: <CZO9HDL1N45S.1JIXM2QUFTQCS@fairphone.com>
Cc: <neil.armstrong@linaro.org>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
X-Mailer: aerc 0.15.2
References: <20240111-drm-panel-bridge-fixup-v1-1-e06292f6f500@fairphone.com>
 <b1da07f9-7e15-4d83-bef3-d0ce157654bc@linaro.org>
 <CYGUWBAM3D62.35CPP5HGEYJ3Y@fairphone.com>
 <CZHGFD9QYM82.371U2DPG1AEGQ@fairphone.com>
 <CAA8EJppZRABYGuoDc-6e6VMwtAo3LvEyDpsHdkHFckrR=q+0ig@mail.gmail.com>
In-Reply-To: <CAA8EJppZRABYGuoDc-6e6VMwtAo3LvEyDpsHdkHFckrR=q+0ig@mail.gmail.com>
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

On Sun Mar 3, 2024 at 9:37 PM CET, Dmitry Baryshkov wrote:
> On Thu, 29 Feb 2024 at 11:27, Luca Weiss <luca.weiss@fairphone.com> wrote=
:
> >
> > On Wed Jan 17, 2024 at 9:59 AM CET, Luca Weiss wrote:
> > > On Mon Jan 15, 2024 at 9:43 AM CET, Neil Armstrong wrote:
> > > > Hi Luca,
> > > >
> > > > On 11/01/2024 13:38, Luca Weiss wrote:
> > > > > Since the kconfig symbol of DRM_PANEL_BRIDGE is only adding
> > > > > bridge/panel.o to drm_kms_helper object, we need to select
> > > > > DRM_KMS_HELPER to make sure the file is actually getting built.
> > > > >
> > > > > Otherwise with certain defconfigs e.g. devm_drm_of_get_bridge wil=
l not
> > > > > be properly available:
> > > > >
> > > > >    aarch64-linux-gnu-ld: drivers/phy/qualcomm/phy-qcom-qmp-combo.=
o: in function `qmp_combo_bridge_attach':
> > > > >    drivers/phy/qualcomm/phy-qcom-qmp-combo.c:3204:(.text+0x8f4): =
undefined reference to `devm_drm_of_get_bridge'
> > > > >
> > > > > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > > > > ---
> > > > > I can see "depends on DRM_KMS_HELPER" was removed with commit
> > > > > 3c3384050d68 ("drm: Don't make DRM_PANEL_BRIDGE dependent on DRM_=
KMS_HELPERS")
>
> Could you please make sure that the usecase described in the mentioned
> commit message doesn't get broken by your change?

Hi Neil,

The problem fixed in that linked patch (3c3384050d68) is about fixing
undefined reference errors with specific .config setups - similar to
this patch.

Since we're only adding a 'select' and not removing anything I don't see
how it could cause new errors like that, and it does fix the one I'm
describing.

And also I checked again and I don't see any circular dependencies
(something that was also mentioned in the linked patch), so apart from
what I mentioned with that I'm not too familiar when 'select' should be
used and when 'depend' should be used, it's good from my perspective.

Regards
Luca

>
> > > > >
> > > > > I'm not too familiar with Kconfig but it feels more correct if
> > > > > PHY_QCOM_QMP_COMBO selects DRM_PANEL_BRIDGE that that's enough; a=
nd it
> > > > > doesn't also has to explicitly select DRM_KMS_HELPER because of h=
ow the
> > > > > objects are built in the Makefile.
> > > > >
> > > > > Alternatively solution to this patch could be adjusting this line=
 in
> > > > > include/drm/drm_bridge.h:
> > > > >
> > > > >    -#if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL_BRIDGE)
> > > > >    +#if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL_BRIDGE) &&=
 defined(CONFIG_DRM_KMS_HELPER)
> > > > >     struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,=
 struct device_node *node,
> > > > >                                              u32 port, u32 endpoi=
nt);
> > > > >
> > > > > .. and then selecting DRM_KMS_HELPER for PHY_QCOM_QMP_COMBO.
> > > > >
> > > > > But I think the solution in this patch is better. Let me know wha=
t you
> > > > > think.
> > > >
> > > > I think this is no more the case after on linux-next:
> > > > 35921910bbd0 phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
> > > >
> > > > But could you still check ?
> > >
> > > On next-20240117 the error happens in the aux-bridge file instead the=
n.
> > >
> > > aarch64-linux-gnu-ld: drivers/gpu/drm/bridge/aux-bridge.o: in functio=
n `drm_aux_bridge_probe':
> > > drivers/gpu/drm/bridge/aux-bridge.c:115:(.text+0xe0): undefined refer=
ence to `devm_drm_of_get_bridge'
> > >
> > > I'm attaching the defconfig with which I can reproduce this but it's
> > > really just DRM_KMS_HELPER=3Dn and PHY_QCOM_QMP_COMBO=3Dy I believe.
> >
> > Hi Neil,
> >
> > Ping on this patch
> >
> > Regards
> > Luca
> >
> > >
> > > Regards
> > > Luca
> > >
> > >
> > > >
> > > > Neil
> > > >
> > > > > ---
> > > > >   drivers/gpu/drm/bridge/Kconfig | 1 +
> > > > >   1 file changed, 1 insertion(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bri=
dge/Kconfig
> > > > > index ac9ec5073619..ae782b427829 100644
> > > > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > > > @@ -8,6 +8,7 @@ config DRM_BRIDGE
> > > > >   config DRM_PANEL_BRIDGE
> > > > >           def_bool y
> > > > >           depends on DRM_BRIDGE
> > > > > + select DRM_KMS_HELPER
> > > > >           select DRM_PANEL
> > > > >           help
> > > > >             DRM bridge wrapper of DRM panels
> > > > >
> > > > > ---
> > > > > base-commit: b9c3a1fa6fb324e691a03cf124b79f4842e65d76
> > > > > change-id: 20240111-drm-panel-bridge-fixup-5c2977fb969f
> > > > >
> > > > > Best regards,
> >


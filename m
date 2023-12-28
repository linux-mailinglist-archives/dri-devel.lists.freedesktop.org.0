Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 070F381F59A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Dec 2023 08:47:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9D310E086;
	Thu, 28 Dec 2023 07:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D658B10E086
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Dec 2023 07:47:00 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id
 a640c23a62f3a-a2768b78a9eso53862166b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Dec 2023 23:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1703749619; x=1704354419; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0RD//yf6UNgtamLmcyb9OZoesDiNqj4U6mxrWxzklYw=;
 b=GUl1ukeqqoNi5ZbPFPFDfQocubn6F7UYqB02fBQVFex8ihUpek6iZCFhL7ZXtpUdjb
 rYHjQlCI0QrzAvXUwUTekOsMkKpv26MOsL2eRVqwtX/4DY1wCosMNOR2kciUsqhbyAM4
 4PXCaWLwMbHyBzB7nI2ADy58TZtrPDO8NDNkuwf3BHLnChwfuWWzywjQw/T2zUIPEgPm
 mY2TXpAhzDI7n0ABrPjrVJb4UEffnwO91NG/E9wrcbaQMkdTnO2encJqeh+2odHgid0V
 ARGh6a1a+R87su9rX2Pln+nnu2Nye43l2JPZeQ5dU82ewYMo/Yac80TU0Q99I7lxgdOE
 iOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703749619; x=1704354419;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0RD//yf6UNgtamLmcyb9OZoesDiNqj4U6mxrWxzklYw=;
 b=ZnWeU7WPFRxhIx9GXDTfdU8bJ+czYV1btPmEGCxMj8wUZT6Lo8EzvbKqIsRvOb0vyJ
 a0FDcthNncyotzmwKBq1KEJgerkAfx8uzX/XdQAFoPkNq9ArbKDcHqDmXiLINOZq1SrP
 f0I3O+WRTyTrtBg66J0hJC/bGRb42wqpP2rDcsqFyTzgc8uASy3KjeCtRRtGrxpY7pdw
 slIUpuQaqHet8y3ZUkVmD2t4Aw84wwsqHDPsAtyIVkqHIfFlSusZzOpNfT9ietl5nuiq
 aeXSoDR70GJ2DBMeaJ83ALPQS0cIm0dD7eBze0HKKSxQ8/MsNYaEuTML9mjXnNhXms0I
 RH/w==
X-Gm-Message-State: AOJu0YzkvKlabu+k21LbT01PjWI+31WvpsVlJr4KH+UO3AOyf6zVI+v7
 V2K1dM8p32/6k4F6RU+yDqb9oDe07FDNMQ==
X-Google-Smtp-Source: AGHT+IFG6PF/vc7PF3AKEea+aRfz6koTBbAHUssv6AR3ZS0xsmEtyr7UmwCARfeI5FwgEs6qU+FfHg==
X-Received: by 2002:a17:907:9483:b0:a1e:5a8a:674a with SMTP id
 dm3-20020a170907948300b00a1e5a8a674amr13615605ejc.19.1703749619065; 
 Wed, 27 Dec 2023 23:46:59 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 v7-20020a17090651c700b00a2724560851sm1928937ejk.85.2023.12.27.23.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 23:46:58 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 Dec 2023 08:46:58 +0100
Message-Id: <CXZSU1D3YID7.6FE4TR15LF1V@fairphone.com>
Subject: Re: [PATCH] drm/panel/raydium-rm692e5: select
 CONFIG_DRM_DISPLAY_DP_HELPER
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <neil.armstrong@linaro.org>, "Arnd Bergmann" <arnd@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, "Konrad
 Dybcio" <konrad.dybcio@linaro.org>
X-Mailer: aerc 0.15.2
References: <20231023115619.3551348-1-arnd@kernel.org>
 <00e81457-9148-4ca1-8433-4b7cad0652b5@linaro.org>
In-Reply-To: <00e81457-9148-4ca1-8433-4b7cad0652b5@linaro.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon Oct 23, 2023 at 3:25 PM CEST, Neil Armstrong wrote:
> Hi,
>
> On 23/10/2023 13:55, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >=20
> > As with several other panel drivers, this fails to link without the DP
> > helper library:
> >=20
> > ld: drivers/gpu/drm/panel/panel-raydium-rm692e5.o: in function `rm692e5=
_prepare':
> > panel-raydium-rm692e5.c:(.text+0x11f4): undefined reference to `drm_dsc=
_pps_payload_pack'
> >=20
> > Select the same symbols that the others already use.
> >=20
> > Fixes: 988d0ff29ecf7 ("drm/panel: Add driver for BOE RM692E5 AMOLED pan=
el")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >   drivers/gpu/drm/panel/Kconfig | 2 ++
> >   1 file changed, 2 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kcon=
fig
> > index 99e14dc212ecb..a4ac4b47777fe 100644
> > --- a/drivers/gpu/drm/panel/Kconfig
> > +++ b/drivers/gpu/drm/panel/Kconfig
> > @@ -530,6 +530,8 @@ config DRM_PANEL_RAYDIUM_RM692E5
> >   	depends on OF
> >   	depends on DRM_MIPI_DSI
> >   	depends on BACKLIGHT_CLASS_DEVICE
> > +	select DRM_DISPLAY_DP_HELPER
> > +	select DRM_DISPLAY_HELPER
> >   	help
> >   	  Say Y here if you want to enable support for Raydium RM692E5-based
> >   	  display panels, such as the one found in the Fairphone 5 smartphon=
e.
>
> Will apply once drm-misc-next-fixes is synced with the last drm-misc-next=
 PR for v6.7.

Hi Neil,

I think this patch is still pending, I don't see it in linux-next.

It was also reported by a buildbot today
https://lore.kernel.org/lkml/202312281138.PHn1Js8S-lkp@intel.com/

Regards
Luca

>
> Neil


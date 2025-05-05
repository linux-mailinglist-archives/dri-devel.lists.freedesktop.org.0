Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D96AA9B01
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 19:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C5210E41D;
	Mon,  5 May 2025 17:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jJJ1yrrS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B154510E41D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 17:47:19 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso29251255e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 10:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746467238; x=1747072038; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=X2kc3Prodr52+tt+XwRWEYAo9atVWpR9h9AK5kJEn44=;
 b=jJJ1yrrSKw/2kqGjO+XsrvmVZqgTuH+1X48EAik1hBLbHm3/0JMlOBth8wp+CIXgG0
 DqT79ORpt9d8UrprTPXWYmUxKlopZuU8OfUm7oiQachKQltP44pa0DvzAomIdRhjW81z
 Tqmv12uDcyfZ4an+6JbEg7qIQT3tudvCaEaqQalrPBTBrTxenL6YQ0CkEFTcuTtvVN0v
 6LYvxfL0Gh+pyVbbn8r8SUm8r8T1kmW9nOeNS2FZBv++t7lPmpBUq5OdzqswqQSWp7rD
 gCc6Ha4Lm54+QVY+cS5MbT7tHGcGgKZ5rx7Ai9yNiuEoOk3wxp9pAuJIAK1xkXVlT10Y
 H+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746467238; x=1747072038;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X2kc3Prodr52+tt+XwRWEYAo9atVWpR9h9AK5kJEn44=;
 b=t/akn+YfjbaPyHWAmLWVLgXPiOWs2klaXybSo/4B7X3P9nDbcVqdQHHYO/yYIAFX7L
 1gCBXdXAHLSsZTvIYEJvBHRcfqpClz0Qm4w6pfIiwxKMnWXqievZgoEOh893EvXRY1Vt
 sZ82U63f6REY582PngVLloeMHVUpkwvePGFfEw+WcGjszEbkigVKPGN2CoP8FYuAAWxn
 Xha79A/aiEiECe3539je+2SX8tQ4qjWd8lBICOxjQUH8lZ92BT5AcPPVsFRnplgg/+pq
 CrruUBacV5kbZGV6zVi0C5JAdjpHaPmcUnQokruMcU1LKNMJb/5eqpNujjcS1JVYEne+
 58DQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPNXy8Aa+b6v6OKPAcOIEzbcKiuPCEnk4PqqSHKasw/x+EgAwALnjlqAiimSLgXpb0AsKk9ZNPOgs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQcrGH9go0wXjWkEpPoL1d/KZAX3bWU2C1OruBW7ahgV8jIy5X
 GmklQhb4xl+GezkS3dL3AA+NPwT4qvUVGqj9O/7BqHThc62PtO7u
X-Gm-Gg: ASbGncv05nbg3hs4its+6X/uNEKXlUqPlmdy07Pmmg2FOxAs2pB2aZQurGbSLpdN61Y
 3NbpoIULjR1LR1OQ8D19GUqxNW5sg+3SrDf1yKfV4M/9jdMLu/sRPdBitFqTy4p0RyWYo1hy8wW
 nkChtAmOBsSRTUqRFbZxfUMbUzMZNP8cyw0cLYV7t4YZ5zBoT+HV4aS5sUwmxfhI4D8EO/HMeHD
 dDu5F2dAK4OM8uuD4vD1RcP0t2hqUTOgs1r7xQ4Ewipdoan5H/s7nYdVab+ScC4BD3MmyIBrC1h
 Yt+xq4MLf2rkQ6rvwYLHtkFPfIYH1D+BcyhCtfqGb0ww+OzuDxkVvJOIFaCHFNGCKaIJQNPj065
 YdKmpYQTm
X-Google-Smtp-Source: AGHT+IFmCQpRtFn1Zjb+tUjdWu7qFe1M0ldfr4wRA07rwx1580YsSLKS19pVqFkxPfoHPZSQ9Ii0ug==
X-Received: by 2002:a05:600c:5010:b0:441:bf4e:89c8 with SMTP id
 5b1f17b1804b1-441c48b02e1mr79550235e9.3.1746467237971; 
 Mon, 05 May 2025 10:47:17 -0700 (PDT)
Received: from ?IPv6:2001:8a0:e602:d900:329e:4b86:b487:53d8?
 ([2001:8a0:e602:d900:329e:4b86:b487:53d8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b89d1548sm140647505e9.11.2025.05.05.10.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 10:47:17 -0700 (PDT)
Message-ID: <33ff9db89056a683e393de09c41d7c98bdbc045e.camel@gmail.com>
Subject: Re: [PATCH v1] drm/bridge: cdns-dsi: Replace deprecated
 UNIVERSAL_DEV_PM_OPS()
From: Vitor Soares <ivitro@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org, Aradhya
 Bhatia <aradhya.bhatia@linux.dev>,  Jayesh Choudhary <j-choudhary@ti.com>,
 stable@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>
Date: Mon, 05 May 2025 18:47:16 +0100
In-Reply-To: <a1cf67da-a0cb-46c5-b22b-10ecca8ab383@ideasonboard.com>
References: <20250428094048.1459620-1-ivitro@gmail.com>
 <fbde0659-78f3-46e4-98cf-d832f765a18b@ideasonboard.com>
 <ec35d40dcd06ddbcfc0409ffa01aaee22c601716.camel@gmail.com>
 <a1cf67da-a0cb-46c5-b22b-10ecca8ab383@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
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

On Mon, 2025-05-05 at 18:30 +0300, Tomi Valkeinen wrote:
> Hi,
>=20
> On 05/05/2025 17:45, Vitor Soares wrote:
> > On Tue, 2025-04-29 at 09:32 +0300, Tomi Valkeinen wrote:
> > > Hi,
> > >=20
> > > On 28/04/2025 12:40, Vitor Soares wrote:
> > > > From: Vitor Soares <vitor.soares@toradex.com>
> > > >=20
> > > > The deprecated UNIVERSAL_DEV_PM_OPS() macro uses the provided callb=
acks
> > > > for both runtime PM and system sleep. This causes the DSI clocks to=
 be
> > > > disabled twice: once during runtime suspend and again during system
> > > > suspend, resulting in a WARN message from the clock framework when
> > > > attempting to disable already-disabled clocks.
> > > >=20
> > > > [=C2=A0=C2=A0 84.384540] clk:231:5 already disabled
> > > > [=C2=A0=C2=A0 84.388314] WARNING: CPU: 2 PID: 531 at /drivers/clk/c=
lk.c:1181
> > > > clk_core_disable+0xa4/0xac
> > > > ...
> > > > [=C2=A0=C2=A0 84.579183] Call trace:
> > > > [=C2=A0=C2=A0 84.581624]=C2=A0 clk_core_disable+0xa4/0xac
> > > > [=C2=A0=C2=A0 84.585457]=C2=A0 clk_disable+0x30/0x4c
> > > > [=C2=A0=C2=A0 84.588857]=C2=A0 cdns_dsi_suspend+0x20/0x58 [cdns_dsi=
]
> > > > [=C2=A0=C2=A0 84.593651]=C2=A0 pm_generic_suspend+0x2c/0x44
> > > > [=C2=A0=C2=A0 84.597661]=C2=A0 ti_sci_pd_suspend+0xbc/0x15c
> > > > [=C2=A0=C2=A0 84.601670]=C2=A0 dpm_run_callback+0x8c/0x14c
> > > > [=C2=A0=C2=A0 84.605588]=C2=A0 __device_suspend+0x1a0/0x56c
> > > > [=C2=A0=C2=A0 84.609594]=C2=A0 dpm_suspend+0x17c/0x21c
> > > > [=C2=A0=C2=A0 84.613165]=C2=A0 dpm_suspend_start+0xa0/0xa8
> > > > [=C2=A0=C2=A0 84.617083]=C2=A0 suspend_devices_and_enter+0x12c/0x63=
4
> > > > [=C2=A0=C2=A0 84.621872]=C2=A0 pm_suspend+0x1fc/0x368
> > > >=20
> > > > To address this issue, replace UNIVERSAL_DEV_PM_OPS() with
> > > > DEFINE_RUNTIME_DEV_PM_OPS(), which avoids redundant suspend/resume =
calls
> > > > by checking if the device is already runtime suspended.
> > > >=20
> > > > Cc: <stable@vger.kernel.org> # 6.1.x
> > > > Fixes: e19233955d9e ("drm/bridge: Add Cadence DSI driver")
> > > > Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> > > > ---
> > > > =C2=A0=C2=A0 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 10 ++=
+++-----
> > > > =C2=A0=C2=A0 1 file changed, 5 insertions(+), 5 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> > > > b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> > > > index b022dd6e6b6e..62179e55e032 100644
> > > > --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> > > > +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
> > > > @@ -1258,7 +1258,7 @@ static const struct mipi_dsi_host_ops cdns_ds=
i_ops
> > > > =3D {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.transfer =3D=
 cdns_dsi_transfer,
> > > > =C2=A0=C2=A0 };
> > > > =C2=A0=C2=A0=20
> > > > -static int __maybe_unused cdns_dsi_resume(struct device *dev)
> > > > +static int cdns_dsi_resume(struct device *dev)
> > > > =C2=A0=C2=A0 {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct cdns_d=
si *dsi =3D dev_get_drvdata(dev);
> > > > =C2=A0=C2=A0=20
> > > > @@ -1269,7 +1269,7 @@ static int __maybe_unused cdns_dsi_resume(str=
uct
> > > > device *dev)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > > > =C2=A0=C2=A0 }
> > > > =C2=A0=C2=A0=20
> > > > -static int __maybe_unused cdns_dsi_suspend(struct device *dev)
> > > > +static int cdns_dsi_suspend(struct device *dev)
> > > > =C2=A0=C2=A0 {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct cdns_d=
si *dsi =3D dev_get_drvdata(dev);
> > > > =C2=A0=C2=A0=20
> > > > @@ -1279,8 +1279,8 @@ static int __maybe_unused cdns_dsi_suspend(st=
ruct
> > > > device *dev)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > > > =C2=A0=C2=A0 }
> > > > =C2=A0=C2=A0=20
> > > > -static UNIVERSAL_DEV_PM_OPS(cdns_dsi_pm_ops, cdns_dsi_suspend,
> > > > cdns_dsi_resume,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 NULL);
> > > > +static DEFINE_RUNTIME_DEV_PM_OPS(cdns_dsi_pm_ops, cdns_dsi_suspend=
,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cdns_dsi_resume, NULL);
> > >=20
> > > I'm not sure if this, or the UNIVERSAL_DEV_PM_OPS, is right here. Whe=
n
> > > the system is suspended, the bridge drivers will get a call to the
> > > *_disable() hook, which then disables the device. If the bridge drive=
r
> > > would additionally do something in its system suspend hook, it would
> > > conflict with normal disable path.
> > >=20
> > > I think bridges/panels should only deal with runtime PM.
> > >=20
> > > =C2=A0=C2=A0 Tomi
> > >=20
> >=20
> > In the proposed change, we make use of pm_runtime_force_suspend() durin=
g
> > system-wide suspend. If the device is already suspended, this call is a
> > no-op and disables runtime PM to prevent spurious wakeups during the
> > suspend period. Otherwise, it triggers the device=E2=80=99s runtime_sus=
pend()
> > callback.
> >=20
> > I briefly reviewed other bridge drivers, and those that implement runti=
me
> > PM appear to follow a similar approach, relying solely on runtime PM
> > callbacks and using pm_runtime_force_suspend()/resume() to handle
> > system-wide transitions.
>=20
> Yes, I see such a solution in some of the bridge and panel drivers. I'm=
=20
> probably missing something here, as I don't think it's correct.
>=20
> Why do we need to set the system suspend/resume hooks? What is the=20
> scenario where those will be called, and the=20
> pm_runtime_force_suspend()/resume() do something that's not already done=
=20
> via the normal DRM pipeline enable/disable?
>=20
> =C2=A0 Tomi
>=20

I'm not a DRM expert, but my understanding is that there might be edge case=
s
where the system suspend sequence occurs without the DRM core properly disa=
bling
the bridge =E2=80=94 for example, due to a bug or if the bridge is not boun=
d to an
active pipeline. In such cases, having suspend/resume callbacks ensures tha=
t the
device is still properly suspended and resumed.

Additionally, pm_runtime_force_suspend() disables runtime PM for the device
during system suspend, preventing unintended wakeups (e.g., via IRQs, delay=
ed
work, or sysfs access) until pm_runtime_force_resume() is invoked.

From my perspective, the use of pm_runtime_force_suspend() and
pm_runtime_force_resume() serves as a safety mechanism to guarantee a well-
defined and race-free state during system suspend.

Best regards,
Vitor Soares

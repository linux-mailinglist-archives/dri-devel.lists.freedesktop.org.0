Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FA8BDFAC7
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 18:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1011C892C8;
	Wed, 15 Oct 2025 16:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="b5xagB8x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82684892C8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 16:33:46 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-88ec598fa11so81109685a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 09:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1760546025; x=1761150825;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5TVB0JF51SZtYqzdiOCW6IylhkwcFhWMNKiMPXUv89E=;
 b=b5xagB8xqjo8h/uVNmp3eO2MWbdp0Mq9jF1Cb6xzDZ6FhJewtJfMFgQSGkVMVJXV2H
 ZKn35VxiG7aDaFdP5AX8JkEqaautdul65cgWlDpiH0j+712tbJ33INeKLOe+7K66thmk
 lHJ2CnKjRdABcO/bVQQdMWdICwU5OqHlLeJcpx6MIm3Q08/gmMijNl/dQ/DmeVIG+di7
 s9Uj/y+lHRms2wav2KqF6p+L1ECfy1yRLBFnqvo0LjLAAOddt9B7s0MLse9925qGoNNA
 3mFINCPGcLr/QWLQkXm3uzrMbIehcGX5YD4s/XXVFOyGoaJD5egj+qkufLBXJ4wuDTMP
 qDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760546025; x=1761150825;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5TVB0JF51SZtYqzdiOCW6IylhkwcFhWMNKiMPXUv89E=;
 b=U5J1JAAVIQvpfrE3PUTcHA6eZYR9nhGzBYyaAubsgRl54G5KWisstgKXvBorbYlpRh
 oYsdQaPA0RT0mIzvRTZfDOJgFxvUhuSyafv7y/PVUWgqnmN76rwOmMgmGnVBRrNrewof
 KsReDHJrbzeTrY43tGzfmffKaDYVSA79Cp4s2Ojxgwq169afhUiLT6E/qmp+jz672pRe
 F2aXr8QX7V12ScDHOC6nhK/y/I8wxv48ymwIsdsj00AYcsMJs8bxrydGmh7d9tVGV+p2
 pNXDB8Dyf2QQUrXxczxOQARrNmx1nMuwHzEk5875vX4xgbEstFTx1sD3NoGJhV8pXHSW
 kqlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV++6ARxeDB2jPUXYiFdg2kSEgnhDOIpXlyS1L8IahdBVuqy6oGtfuwOiBth6USpdPsN87OK/l2/zM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwV6FWD/jMRad5QREZRxD+w8TNqyHGB7SMTpQehXLwQ1p9hjH/v
 VwB40EwuXwiXvmndJ0Smq8styIqOePvv0erJ5P1w7ON/3yRjP5yWyRSMdd+O4cpLwL2J/ZUAJS4
 sWeS5bZbVQ7O/OgxikFBV4PegXu5IHbwchpOMszdZSw==
X-Gm-Gg: ASbGncvwmV9VtTNAXrIJlXcTu8Ve7UWznxbXZ4/cN6l9tHyeJwFmE5sAIbwA/MH1Q2P
 DX2y49s7l9SCSXbDpHItTheIuYdo0snU8R3Rap0DH48RAM1d6dAVPt3FDcdPy1kvjTIWpF9iurw
 0eGc4SMUXweqiV72RAjBNxqqQiaaiGOFqDANSHmGshXzR83xw6mytZM4X0Ps5ZhL+J5EtYfvz7t
 iNkUsbmDtFGfG4ErhNzl2A=
X-Google-Smtp-Source: AGHT+IEWLzmTAJuFvcRpHnhLL3oSxt5DVoapSEF3DOsu9jpTcS07RnjUwC01/MbeqWj+sQer43+GACQfNyCtsVTrhDM=
X-Received: by 2002:a05:620a:17a5:b0:827:937c:2c2e with SMTP id
 af79cd13be357-88f11537a62mr99337985a.30.1760546025481; Wed, 15 Oct 2025
 09:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
 <20250903-rk3588-hdmi-cec-v4-2-fa25163c4b08@collabora.com>
 <2753758.X9hSmTKtgW@diego>
In-Reply-To: <2753758.X9hSmTKtgW@diego>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 15 Oct 2025 17:33:34 +0100
X-Gm-Features: AS18NWCJkFE5KF2FTR_JnzlOKDLW2oUBf1S94gJ5rVRW2DgSbekEAuXHzCMSdZw
Message-ID: <CAPj87rPqNw8BH7FCEAQONZWxTY+eUAE9DeWVTyJoTbN7mv=RfA@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] drm/bridge: dw-hdmi-qp: Fixup timer base setup
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, 15 Oct 2025 at 16:44, Heiko St=C3=BCbner <heiko@sntech.de> wrote:
> Am Mittwoch, 3. September 2025, 20:51:00 Mitteleurop=C3=A4ische Sommerzei=
t schrieb Cristian Ciocaltea:
> > Currently the TIMER_BASE_CONFIG0 register gets initialized to a fixed
> > value as initially found in vendor driver code supporting the RK3588
> > SoC.  As a matter of fact the value matches the rate of the HDMI TX
> > reference clock, which is roughly 428.57 MHz.
> >
> > However, on RK3576 SoC that rate is slightly lower, i.e. 396.00 MHz, an=
d
> > the incorrect register configuration breaks CEC functionality.
> >
> > Set the timer base according to the actual reference clock rate that
> > shall be provided by the platform driver.  Otherwise fallback to the
> > vendor default.
> >
> > While at it, also drop the unnecessary empty lines in
> > dw_hdmi_qp_init_hw().
> >
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>
> This _does_ look ok to me, but as that touches the main bridge, could
> we get a 2nd set of eyes?

Sure can.

Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel

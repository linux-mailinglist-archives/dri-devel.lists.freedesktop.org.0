Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2D8BE32F7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 13:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8104010E06F;
	Thu, 16 Oct 2025 11:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=gus@collabora.com header.b="bREvLixJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D2410E06F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 11:51:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1760615509; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kbUQO9XOk4YmvZgzkU0biflnf9kHyUt7JA6W8uNi4aZt5RXXs9laCNE4mTAUgmFQxbY9CjZ4A4+v/dcN6iDrSR9DuL2RhXWe9V6EYBXkVCUwe3Gfm4nOiE+GEbLDE/mXhcCKshRceftQWjKRdI9n2hlp2WlGzYiWY/NI5WSHmmM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1760615509;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=yCzFxbn7GJVSCGZwCm5WpUYtn8vecoWWAu+Ddkx7Aoc=; 
 b=OZm2uPVUrcaAtJ7BALZXlKlLf+S1ZSzqLfCbjlLLiGFmE7aasX2Yzcdy++fiegpx5Xes+skEpsaOdofwN7CRf8kLdUshDAf4veDpPcTokkQUZkNNVmf6I6y17T8M/sGRsWLNmtEAHCGsyH5bdhINdCgDTauSn84scS2NWTtVX8c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=gus@collabora.com;
 dmarc=pass header.from=<gus@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760615509; 
 s=zohomail; d=collabora.com; i=gus@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=yCzFxbn7GJVSCGZwCm5WpUYtn8vecoWWAu+Ddkx7Aoc=;
 b=bREvLixJ7TS1jfVDhk/0b2WbKp/HbS/nHJbPgAohsKIrlKFOW3dOzGCGPDcwJ5Sg
 fy1YkekZzLwebvUiqg14IEkDJzvEbS3bynjEYylaVIaD8gUfnqx28rUrvOEoXyX/ALj
 RL8Nxt+KWW/HyF2d3ouk3XYIrTI2DQdFaTRcWJXY=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1760615506978686.2189466745768;
 Thu, 16 Oct 2025 04:51:46 -0700 (PDT)
Date: Thu, 16 Oct 2025 08:51:46 -0300
From: Gustavo Padovan <gus@collabora.com>
To: =?UTF-8?Q?=22Guido_G=C3=BCnther=22?= <agx@sigxcpu.org>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Jessica Zhang" <jessica.zhang@oss.qualcomm.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 "dri-devel" <dri-devel@lists.freedesktop.org>,
 "linux-kernel" <linux-kernel@vger.kernel.org>,
 "phone-devel" <phone-devel@vger.kernel.org>
Message-ID: <199ecdca3d9.3341649c978102.7928576754342044908@collabora.com>
In-Reply-To: <20251016-visionox-rm69299-bl-v1-1-d3b817ae5a26@sigxcpu.org>
References: <20251016-visionox-rm69299-bl-v1-1-d3b817ae5a26@sigxcpu.org>
Subject: Re: [PATCH] drm/panel: visionox-rm69299: Depend on
 BACKLIGHT_CLASS_DEVICE
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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

Hello,

---- On Thu, 16 Oct 2025 08:41:27 -0300 Guido G=C3=BCnther <agx@sigxcpu.org=
> wrote ---

 > We handle backlight so need that dependency.=20
 > =20
 > Fixes: 49802972d116 ("drm/panel: visionox-rm69299: Add backlight support=
")=20
 > Signed-off-by: Guido G=C3=BCnther <agx@sigxcpu.org>=20

Missing the KernelCI report tag:

Reported-by: kernelci.org bot <bot@kernelci.org>

 > ---=20
 >  drivers/gpu/drm/panel/Kconfig | 1 +=20
 >  1 file changed, 1 insertion(+)=20
 > =20
 > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconf=
ig=20
 > index 407c5f6a268b..59f5a31f3381 100644=20
 > --- a/drivers/gpu/drm/panel/Kconfig=20
 > +++ b/drivers/gpu/drm/panel/Kconfig=20
 > @@ -1112,6 +1112,7 @@ config DRM_PANEL_VISIONOX_RM69299=20
 >      tristate "Visionox RM69299"=20
 >      depends on OF=20
 >      depends on DRM_MIPI_DSI=20
 > +    depends on BACKLIGHT_CLASS_DEVICE=20
 >      help=20
 >        Say Y here if you want to enable support for Visionox=20
 >        RM69299  DSI Video Mode panel.=20
 > =20
 > ---=20
 > base-commit: 7ea30958b3054f5e488fa0b33c352723f7ab3a2a=20
 > change-id: 20251016-visionox-rm69299-bl-7e6a2e30626d=20
 > =20
 > Best regards,=20
 > --=20
 > Guido G=C3=BCnther <agx@sigxcpu.org>=20
 > =20
 >=20


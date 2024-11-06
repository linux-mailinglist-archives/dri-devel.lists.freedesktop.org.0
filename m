Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A399BE2FC
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 10:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2F310E21D;
	Wed,  6 Nov 2024 09:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UeGid5t2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDCC710E21D
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 09:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730886382; x=1762422382;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FCzq19ZQriPVyzh0sTZo3Dh2ni0fniF4xDpwOt2piiA=;
 b=UeGid5t2lEYvgCmPFJBrYwPH6cLjkNv2Zy4sCwRlihZ4fuGCDdGqu/us
 MZnxqDLV7J0GHfskmI/1Va7x/4ElkuNaIzqB+96B0waR6yVg24vrYE5hu
 0o97VAkv3dtjFT8nK9dfFaGDcgdixRpxFKHbIRp0VZdjEg4t8+Tthbdhx
 wub0lLARQB+nNoOItiudYoB+rZPH+8dyGCVEWEu5Zjz+GuAnPCTGycsLw
 g87Us3yRyURKlPxMmbDvFz0d2ySDthhbvd0P85SNmf4yxR2MtbOGkoaU0
 Oysl/niVPBKJNSjHBLeYNJT9x+LUFy9vPD+ES0COP+8ejod7F2ZnKJ9uX g==;
X-CSE-ConnectionGUID: giIonrqZTnuP0Epe3C27mw==
X-CSE-MsgGUID: UuWj3MU3QUGuP8Td07kIRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30788770"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="30788770"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 01:46:21 -0800
X-CSE-ConnectionGUID: k2/7LShbSDaGOr4szaPsBw==
X-CSE-MsgGUID: pcvQjkT9RbWo30mUfZPUFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="84847233"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 01:46:07 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
 by kekkonen.fi.intel.com (Postfix) with SMTP id 2169A11F9C3;
 Wed,  6 Nov 2024 11:46:05 +0200 (EET)
Date: Wed, 6 Nov 2024 09:46:05 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Liu Ying <victor.liu@nxp.com>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com,
 mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, hverkuil@xs4all.nl,
 tomi.valkeinen@ideasonboard.com, quic_bjorande@quicinc.com,
 geert+renesas@glider.be, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: (subset) [PATCH v5 00/13] Add ITE IT6263 LVDS to HDMI converter
 support
Message-ID: <Zys63S2xy-wdwQ8P@kekkonen.localdomain>
References: <20241104032806.611890-1-victor.liu@nxp.com>
 <173080602214.231309.12977765173766280536.b4-ty@linaro.org>
 <20241105-secret-seriema-of-anger-7acfdf@houat>
 <CD810D31-F9C5-499D-86CF-B94BEF82449A@linaro.org>
 <20241105-succinct-pygmy-dingo-4db79c@houat>
 <7C2A2BDC-07E8-4ED7-B65B-BD7E4E5DC53F@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7C2A2BDC-07E8-4ED7-B65B-BD7E4E5DC53F@linaro.org>
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

Hi Dmitry, others,

On Wed, Nov 06, 2024 at 09:20:12AM +0000, Dmitry Baryshkov wrote:
> On 5 November 2024 17:39:40 GMT, Maxime Ripard <mripard@kernel.org> wrote:
> >On Tue, Nov 05, 2024 at 05:33:21PM +0000, Dmitry Baryshkov wrote:
> >> On 5 November 2024 16:13:26 GMT, Maxime Ripard <mripard@kernel.org> wrote:
> >> >On Tue, Nov 05, 2024 at 01:28:48PM +0200, Dmitry Baryshkov wrote:
> >> >> On Mon, 04 Nov 2024 11:27:53 +0800, Liu Ying wrote:
> >> >> > This patch series aims to add ITE IT6263 LVDS to HDMI converter on
> >> >> > i.MX8MP EVK.  Combined with LVDS receiver and HDMI 1.4a transmitter,
> >> >> > the IT6263 supports LVDS input and HDMI 1.4 output by conversion
> >> >> > function.  IT6263 product link can be found at [1].
> >> >> > 
> >> >> > Patch 1 is a preparation patch to allow display mode of an existing
> >> >> > panel to pass the added mode validation logic in patch 3.
> >> >> > 
> >> >> > [...]
> >> >> 
> >> >> Applied to drm-misc-next, thanks!
> >> >> 
> >> >> [04/13] media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
> >> >>         commit: 5205b63099507a84458075c3ca7e648407e6c8cc
> >> >
> >> >Where's the immutable branch Laurent asked for?
> >> 
> >> The patch set has been picked up after getting an Ack from Sakari,
> >> before Laurent's email. I am sorry if I rushed it in.
> >
> >I mean, this was less than a day after you've asked that question
> >yourself. Waiting less than a day for a mail to be answered seems a bit
> >short, especially when there's no rush to merge these patches in the
> >first place.
> 
> Point noted. I should have been more patient. As a lame excuse I could point out that the patch has been up for review / comments for quite a while, etc, etc, but this is really lame. 

The patch had been around for a few weeks already, I don't see this having
been rushed in. It's a bit a matter of taste whether an immutable branch is
necessary here, I thought it wouldn't be. I can also ask for one in the
future in cases where there's even slightly more than an improbable
possibility of a merge conflict going forward: it won't hurt in any case to
have one.

-- 
Kind regards,

Sakari Ailus

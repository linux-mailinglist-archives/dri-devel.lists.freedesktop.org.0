Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 547D0A634D3
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 10:41:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E93A10E0A1;
	Sun, 16 Mar 2025 09:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XHD0azW+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (unknown [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5221510E0A1
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 09:41:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-131-203-nat.elisa-mobile.fi
 [85.76.131.203])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 626B26F3;
 Sun, 16 Mar 2025 10:39:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1742117965;
 bh=MH/Dtd1tZ5LmIe8eKGJ4IRY1JEP276qPbtH66K1CJbM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XHD0azW+FRvqY7ZnztVe/oK7SZsDKSmH7fec6xB/wO3wpAjTeWubnewRh+rWohqCQ
 8vw+Q09DJjykcR73DgnMgKJE+pjhhPRN1J2Kl9apB3JzRFw5YqOVoGJR5dxdWci3fJ
 NdJqVvCA39gsVWpWVSzjaThiXQIVGYTzZRW6sTjw=
Date: Sun, 16 Mar 2025 11:40:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-renesas-soc@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: make use of debugfs_init
 callback
Message-ID: <20250316094042.GB29719@pendragon.ideasonboard.com>
References: <20250315201651.7339-2-wsa+renesas@sang-engineering.com>
 <m46j43oj4twmpl7ild4ej4wjfuxjddtaqg4ilg5zi7dnnua3bo@oqd7uu5sr6lk>
 <Z9ZuMzPS8dmQWe8D@shikoro> <Z9Z5S7ES8d7mjTsJ@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z9Z5S7ES8d7mjTsJ@shikoro>
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

On Sun, Mar 16, 2025 at 08:10:03AM +0100, Wolfram Sang wrote:
> 
> > We don't have a practice yet. Keeping dev_name() was Doug's suggestion.
> > But I like your idea better, so I will change to it. Thank you for it!
> 
> Just to make sure: there can only be one bridge, right? Because the
> suggested name is not unique.

Bridges can be chained. It's highly unlikely that a chain would contain
multiple bridges of the same model, as that would be quite pointless,
but in theory it could happen.

-- 
Regards,

Laurent Pinchart

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE472ADDFC5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 01:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D466A10E08B;
	Tue, 17 Jun 2025 23:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CuZ62l5X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E92910E08B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 23:36:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C118C0B;
 Wed, 18 Jun 2025 01:36:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1750203387;
 bh=NbTMohnJ29DTX2DJnsv1NNMZmJYjYAXpl7R+I7B/mgw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CuZ62l5X4iTkjoNjpXqIb4XvdDlEun42BxyOHkXW5dNv7E15UKN5WzNM7e98gAIhh
 5356Dbii9VEM1I+rG5Q16XRjITXX80nI6ChywDhVZqEY7sxd2DdK6knyjBcrE6Nafx
 kWhcwGZwgFI9Ctt0vnaHDDyAjiBX5zaFvH3wB+Zg=
Date: Wed, 18 Jun 2025 02:36:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: dri-devel@lists.freedesktop.org, manikandan.m@microchip.com,
 dharma.b@microchip.com, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: bridge/microchip_lvds panel usage
Message-ID: <20250617233623.GB22102@pendragon.ideasonboard.com>
References: <CAN9Xe3RV9aZLJ3zV3zip5MQweGbBghdOFGohd6Qg-XjvFoGing@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAN9Xe3RV9aZLJ3zV3zip5MQweGbBghdOFGohd6Qg-XjvFoGing@mail.gmail.com>
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

On Tue, Jun 17, 2025 at 10:36:34AM -0500, Anusha Srivatsa wrote:
> Hey folks,
> 
> Can someone please explain why the driver looks for a panel here:
> https://elixir.bootlin.com/linux/v6.14.11/source/drivers/gpu/drm/bridge/
> microchip-lvds.c#L182 and doesnt use it or set it up anywhere?
> 
> I bumped into this while working on converting of_drm_find_panel() callers and
> the lvds->panel usage in this driver felt off. Am I missing something?

That doesn't seem needed.

By the way, please use plain text when posting to kernel mailing lists.

-- 
Regards,

Laurent Pinchart

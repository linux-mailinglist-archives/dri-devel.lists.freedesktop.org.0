Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD420361AE5
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 09:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBA96EB28;
	Fri, 16 Apr 2021 07:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079B06EB28
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:55:58 +0000 (UTC)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi
 [91.157.208.71])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4775A5A5;
 Fri, 16 Apr 2021 09:55:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1618559756;
 bh=+bDaegtHEBYbX+fu3MChiV4GjJPsWdC6eYbLMHjhSXo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=TUxL2uqXDdDHuDHclH7mHlsOC5nJp1vSYy+A/XgmgGf15mtVBq029xAuWTZKWO7/C
 tuDHzAw03sgi+/5aC/Em/VYz7agA2T8JWXKYRF7EpKqyJvA5bu3G3t8RCxWRdflvEj
 fZpUsW3kDEyGnyKWv9Q0qsUZCBb8tfaLavbhwXZI=
Subject: Re: [PATCHv2 2/6] drm/omapdrm/dss/hdmi4: switch to the connector
 bridge ops
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
References: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
 <20210302162403.983585-3-hverkuil-cisco@xs4all.nl>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <5a8dc63a-c711-2b99-0735-6427dc1a1a11@ideasonboard.com>
Date: Fri, 16 Apr 2021 10:55:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210302162403.983585-3-hverkuil-cisco@xs4all.nl>
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 Sekhar Nori <nsekhar@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/03/2021 18:23, Hans Verkuil wrote:
> Implement the new connector_attach/detach bridge ops. This makes it
> possible to associate a CEC adapter with a drm connector, which helps
> userspace determine which cec device node belongs to which drm connector.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>   drivers/gpu/drm/omapdrm/dss/hdmi4.c     | 27 +++++++++++++++++--------
>   drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c |  9 ++++++---
>   drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h |  7 ++++---
>   3 files changed, 29 insertions(+), 14 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

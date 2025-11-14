Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF289C5DE62
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 16:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C7A410EAB2;
	Fri, 14 Nov 2025 15:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="i9s/wnTa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com
 [91.218.175.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A022110EAAF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 15:35:17 +0000 (UTC)
Message-ID: <24a9a9a2-ba7c-4619-96dc-4355d850561b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1763134515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6HUebMiP/35FO6RcYY0B8DO/zm6sJXKATe5rmen/gPc=;
 b=i9s/wnTaP9tFTF8VtyQN0XH3s4GEZVrxuhAZBnM1urA/1O1tz50RsnPIzMIR2g4dzT0+j4
 IGK5PLb4/kPZ7NB9GEcPZ2LYPRKhzWLSdC4XjWM3pIzole1EiEjz0/DWuLS8XRkoQwn3U3
 B/kOyP+9g7GGyT6UT2XZy9O8dNLi3BE=
Date: Fri, 14 Nov 2025 10:35:10 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] drm: zynqmp: Make the video plane primary
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, Mike Looijmans <mike.looijmans@topic.nl>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maxime Ripard <mripard@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Simona Vetter <simona@ffwll.ch>, Michal Simek <michal.simek@amd.com>
References: <20251113203715.2768107-1-sean.anderson@linux.dev>
 <36048dd7-796f-495d-b715-d8f65a7c2f98@suse.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <36048dd7-796f-495d-b715-d8f65a7c2f98@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Hi Thomas,

On 11/14/25 02:42, Thomas Zimmermann wrote:
> Hi
> 
> Am 13.11.25 um 21:37 schrieb Sean Anderson:
>> The graphics plane does not support XRGB8888, which is the default mode
>> X uses for 24-bit color. Because of this, X must be set to use 16-bit
>> color, which has a measurable performance penalty. Make the video plane
>> the primary plane as it natively supports XRGB8888. An alternative
>> approach to add XRGB8888 to the graphics plane is discussed in [1], as
>> well as in patch 2.
> 
> Did you try to set drm_device.mode_config.preferred_depth = 16, like at [1]?  IIRC user space looks at this value to auto-detect the color format.

I have not tried that. But I would rather use 24-bit color for the performance boost.

--Sean


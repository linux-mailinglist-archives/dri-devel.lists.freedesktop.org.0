Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BD39D8847
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 15:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD8610E0C9;
	Mon, 25 Nov 2024 14:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="uQngW/k1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com
 [95.215.58.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3A510E013
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 14:42:30 +0000 (UTC)
Message-ID: <060d97f1-34e6-424d-9060-b657283e9739@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1732545748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3oXr1hU3SpCJH4VXUZuIfZ1cmp8m2c58mEk8Ky+EMYg=;
 b=uQngW/k10fEaYc1ATAOFujVAtxubSQeARsxeV6fhYM0D4AXGKAv632NbvzceVjxgTERMix
 4zocKl9oTKjnz41NW7pfSV0Zdc9tz3y2KH+raeiyhBGxosIS53GJlgYaQ2bB4e4AXjXzJd
 3DlwwCPCne7xD6WXe/eS2PvRHG4pVes=
Date: Mon, 25 Nov 2024 22:42:20 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2] drm/lsdc: Request PCI BAR
To: Philipp Stanner <pstanner@redhat.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241125140228.58492-2-pstanner@redhat.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20241125140228.58492-2-pstanner@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

Thanks. Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/lsdc: Request PCI BAR
       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/ca053ee3c6a7a877754e6f444ce5f520e3c0a856


On 2024/11/25 22:02, Philipp Stanner wrote:
> lsdc currently just ioremaps its PCI BAR with pcim_iomap(). Performing
> a region regquest additionally can make the driver more robust.

'regquest' ->'request'.

Please avoid typos next time, sound safer otherwise.

-- 
Best regards,
Sui


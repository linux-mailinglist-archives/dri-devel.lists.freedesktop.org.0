Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E676487F073
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 20:34:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6110D10E731;
	Mon, 18 Mar 2024 19:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="b72UF+Ss";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com
 [91.218.175.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D70010E731
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 19:34:04 +0000 (UTC)
Message-ID: <16b3f0df-8ef7-4751-b070-08d6bf6d018d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710790442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e1HMnOxPhD4me9emmK/Q1rV+zKXCe9e/nrVTpIXkcTY=;
 b=b72UF+SsjiDcswzYB02X2nKRwiagSYp2mAMdivIWG4HEoMPVvyZ2wIVmBNEK+gZJe0SHD+
 pwFsux0xJNWVPUF3dMxspCkrOmp2Ysbfz9MTafa1XrOfT9d5Yy4oh3ojCLOIvGzdQSgaYL
 iJSwCV1ou+6ZcZbxrjlIxZy2Wk86dGQ=
Date: Tue, 19 Mar 2024 03:33:53 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] drm: bridge: thc63lvd1024: Print error message when DT
 parsing fails
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20240318160601.2813-1-laurent.pinchart+renesas@ideasonboard.com>
 <78739dfe-c6ee-44bd-a2e6-2ced24ff15c1@linux.dev>
 <20240318180420.GP13682@pendragon.ideasonboard.com>
 <9d894bd2-c92e-4d08-8643-be88a203879c@linux.dev>
In-Reply-To: <9d894bd2-c92e-4d08-8643-be88a203879c@linux.dev>
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


On 2024/3/19 03:23, Sui Jingfeng wrote:
> 2) It should be exist at product level kernel. 


It should NOT be exist at product level kernel.

-- 
Best regards,
Sui


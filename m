Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 280098B7DD3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 18:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D782112D1B;
	Tue, 30 Apr 2024 16:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="VG+g27BU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com
 [91.218.175.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D3F112D1B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 16:54:23 +0000 (UTC)
Message-ID: <f811953a-ce63-40cd-9de3-ecd5e1c1727a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1714496059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B2dRrH9qKVGQoxOqBcj9HzqTG/K2CTzhuVPxDntmNss=;
 b=VG+g27BUebASR+hbkSLsh6v6EIge7sNujIkGIcECbi5+HIegi8Pj79UsDExA1YqfWYyaea
 nxCYLUL8kTG0y54CXgc4Kq2w+VT1yYUiT1RZQunRFa5+wVGLer5VSLZnwG8ZHUlW/FLrP7
 mlld3BCAtR3fptHhI9RITfab2p64ehg=
Date: Wed, 1 May 2024 00:54:08 +0800
MIME-Version: 1.0
Subject: Re: [v1,3/3] drm/panel: ili9341: Use predefined error codes
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg
 <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240425142706.2440113-4-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240425142706.2440113-4-andriy.shevchenko@linux.intel.com>
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


On 2024/4/25 22:26, Andy Shevchenko wrote:
> In one case the -1 is returned which is quite confusing code for
> the wrong device ID, in another the ret is returning instead of
> plain 0 that also confusing as readed may ask the possible meaning
> of positive codes, which are never the case there. Convert both
> to use explicit predefined error codes to make it clear what's going
> on there.
>
> Fixes: 5a04227326b0 ("drm/panel: Add ilitek ili9341 panel driver")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>


-- 
Best regards,
Sui


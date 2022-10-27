Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D8E60F190
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 09:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038A810E53A;
	Thu, 27 Oct 2022 07:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B559C10E55D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 07:52:51 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 959BF66028B1;
 Thu, 27 Oct 2022 08:52:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666857170;
 bh=2ckvdLsZ8CotfrVFln8EXVlUdBz1dfcyRH8Dif/TH+0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oYfBE5VlCAbNeG49FfqtEoqVJ/EPBcfsNFVyUtSE1McxVfgN2l5iel173ERd0TOTC
 GB+/79+Q1UJ9jb5EOAHEWcp8ok/Pp/NOxxLtkVNJ2frHhOA2U4L2GKGar57VRLsnwi
 8VrR+iXOiyBfsT7ak9dQpfcftvzGiibLAWo5/ex7hL4XcSQLzkDw1DXHE1Ju4SLkko
 dVhkKCp2osgH14MRsJEN+vGlz29pMF/X+pjC5RjRRr6kB0FgDQzd/0HI/U3QaEHVel
 JfduYRQiGkkSo6P0JJKNXwWII5P3eYOkfLmUp3d/D0HGxDWZrfcAagXEC85R7CJDlw
 +acdQwINniOPw==
Message-ID: <8e727fd0-cfa6-1b1f-e000-bd3ccd9e34d8@collabora.com>
Date: Thu, 27 Oct 2022 09:52:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] drm/bridge: it6505: Fix return value check for
 pm_runtime_get_sync
To: Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20221027032149.2739912-1-treapking@chromium.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221027032149.2739912-1-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 27/10/22 05:21, Pin-yen Lin ha scritto:
> `pm_runtime_get_sync` may return 1 on success. Fix the `if` statement
> here to make the code less confusing, even though additional calls to
> `it6505_poweron` doesn't break anything when it's already powered.
> 
> This was reported by Dan Carpenter <dan.carpenter@oracle.com> in
> https://lore.kernel.org/all/Y1fMCs6VnxbDcB41@kili/
> 
> Fixes: 10517777d302 ("drm/bridge: it6505: Adapt runtime power management framework")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



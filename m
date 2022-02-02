Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC9B4A6CED
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 09:31:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01C210E6F5;
	Wed,  2 Feb 2022 08:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B13910E61D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 08:29:23 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 68F5C8340A;
 Wed,  2 Feb 2022 09:29:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1643790562;
 bh=d5v0gKfMscX4I4jK0eoWnrxFofwCtFZy0vRPvpHGA4g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=j8L4/kLsJyWorS6HpKUY7YE5zPHvhPAcohnJn285YvQj/gVKhQoiNttZvKOqErLrJ
 J3wOaHW+uOs+27psVd0J0iytrAQ8JxLNSW+HpLDBx8WmSiilGtytse5pIKFrs+nPef
 Ao471YDATM84cruAXVWAbU7EOVBclnAiq+ciE5N5i4Q+mufN/UrE6xtRljVjsgI8Ak
 o2zqvo5zTPxVT5FJN3T8mDjagdwJ6rcSK4K6TUVTAACzIEoRtadam1wgdY3Ou/73pD
 Gq/5wrj4x4ddgTZorgpQilqpdZ8Y+0pFqySWNX/sEpwHAKlsFIYzuDZzNscQVY2XBP
 T1HDhMowZdbwA==
Message-ID: <af6895d0-8514-f151-2675-2454cd15deeb@denx.de>
Date: Wed, 2 Feb 2022 09:29:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 1/2] drm: mxsfb: Use dev_err_probe() helper
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Stefan Agner <stefan@agner.ch>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
References: <20220202081755.145716-1-alexander.stein@ew.tq-group.com>
 <20220202081755.145716-2-alexander.stein@ew.tq-group.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220202081755.145716-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/2/22 09:17, Alexander Stein wrote:
> Use the dev_err_probe() helper, instead of open-coding the same
> operation. This also adds a nice hint in
> /sys/kernel/debug/devices_deferred.
> 
> Reviewed-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>   drivers/gpu/drm/mxsfb/mxsfb_drv.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

V2: ... what changed ... ?

(probably nothing, since the patch still looks fine)

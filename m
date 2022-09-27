Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D27985ED4EB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 08:31:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246A610E288;
	Wed, 28 Sep 2022 06:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 553 seconds by postgrey-1.36 at gabe;
 Tue, 27 Sep 2022 18:03:13 UTC
Received: from mail.manjaro.org (mail.manjaro.org [IPv6:2a01:4f8:c0c:51f3::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D8010E044
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Sep 2022 18:03:13 +0000 (UTC)
Message-ID: <2430a203-f8e7-7d78-3e9e-9e1d9c6826c9@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1664301235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rlXUgXCriowHMoD+UbuC8uS7M0ukzwfVFCBxHU+1p7U=;
 b=xzFTW0vI6JFzJH/lQ5QyYcY0LOV+svwCyzJ3f9A7EvU8qat067mYCxMkjEt58GJ1fKDA33
 u/chyZS/CLoKLuf+fAOIocu4ijMOtPxjoDAwU4gi7ZsbhZsw4DAKYvziPglkjYBRa7JJxH
 0IbrHswHBsaUd5uN6n2Fzentz1MfY6bnhznYHzyd3rcFYgkGaVz/W6UYuQGSFMKeoB7kKy
 4TUAGROoMcDY96oaueh8QLRV7yH0IxMEV8JXsM6llELKBzE3kh9+wfnVL39BBqgV6oft4A
 T3YQUp4vpJ7cz0nKceN5dA5ykLsKZjvAQ6AMT3tLQI8rP0F3mSzthEOnd6HMkA==
Date: Tue, 27 Sep 2022 19:53:54 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] drm/rockchip: dw_hdmi: Add 4k@30 support
Content-Language: da-DK
To: Michael Riesch <michael.riesch@wolfvision.net>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220926080435.259617-1-s.hauer@pengutronix.de>
 <cf2285dc-d732-0c6d-83bc-022f23f29524@wolfvision.net>
From: Dan Johansen <strit@manjaro.org>
Organization: Manjaro ARM
In-Reply-To: <cf2285dc-d732-0c6d-83bc-022f23f29524@wolfvision.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=strit@manjaro.org smtp.mailfrom=strit@manjaro.org
X-Mailman-Approved-At: Wed, 28 Sep 2022 06:30:59 +0000
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
Cc: linux-rockchip@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 Sandy Huang <hjc@rock-chips.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Den 26.09.2022 kl. 12.30 skrev Michael Riesch:
> Hi Sascha,
>
> On 9/26/22 10:04, Sascha Hauer wrote:
>> This series adds support for 4k@30 to the rockchip HDMI controller. This
>> has been tested on a rk3568 rock3a board. It should be possible to add
>> 4k@60 support the same way, but it doesn't work for me, so let's add
>> 4k@30 as a first step.
>> 														     Sascha
>>
>> Changes since v1:
>> - Allow non standard clock rates only on Synopsys phy as suggested by
>>    Robin Murphy
>>
>> Sascha Hauer (2):
>>    drm/rockchip: dw_hdmi: relax mode_valid hook
>>    drm/rockchip: dw_hdmi: Add support for 4k@30 resolution
>>
>>   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 34 ++++++++++++++++-----
>>   1 file changed, 27 insertions(+), 7 deletions(-)
> Thanks for the v2! On a RK3568 EVB1 with a HP 27f 4k monitor
>
> Tested-by: Michael Riesch <michael.riesch@wolfvision.net>

Sadly this still doesn't give my display out on my 2k monitor. Not even 
just 1080p picture like the old current implementation does.

>
> Best regards,
> Michael
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
-- 
Kind regards
*Dan Johansen*
Project lead of the *Manjaro ARM* project
Manjaro-ARM <https://manjaro.org>

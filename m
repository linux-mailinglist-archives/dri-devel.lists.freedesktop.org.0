Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F48328FB1
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 20:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DA46E884;
	Mon,  1 Mar 2021 19:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C8C6E884
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 19:59:13 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F7EC41;
 Mon,  1 Mar 2021 20:59:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1614628750;
 bh=+xpEBvGF24vfZJH5haIsag+UO5gM5Ra/P4CnH6fumDo=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=kVjOjnN8LBf8qs6NkAFmFj3lOCR/tWxnaox0RRVO2AJ7hHSeNa0kXjJdvqRZ6Y2rD
 V0AboUCtYLoOuik/aBs7W7Y8Fn5Yp43/WnKwp8wd96P8dIW5Q1GvCDwDbobPAtALvj
 RK6D9COK8JvMJ+krWgGHxf00tTX+cGYJC9gXmRBc=
Subject: Re: rcar_du_kms.c:781:24: error: passing argument 1 of
 '__drmm_add_action' from incompatible pointer type
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <CA+G9fYvApAT=vx_XxhbMZ=rS8ShhYkSKa0JsHC8k0dFn5xwU=Q@mail.gmail.com>
 <YD032bZZ/y2Mh0ab@kroah.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <e1a646ac-7e12-478b-d2d1-d7049e6a949e@ideasonboard.com>
Date: Mon, 1 Mar 2021 19:59:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YD032bZZ/y2Mh0ab@kroah.com>
Content-Language: en-GB
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Cc: Sasha Levin <sashal@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, lkft-triage@lists.linaro.org,
 linux-stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/03/2021 18:52, Greg Kroah-Hartman wrote:
> On Mon, Mar 01, 2021 at 11:11:26PM +0530, Naresh Kamboju wrote:
>> On stable rc 5.11 the x86_64 build failed due to below errors/warnings.
>>
>> drivers/gpu/drm/rcar-du/rcar_du_kms.c: In function 'rcar_du_modeset_cleanup':
>> drivers/gpu/drm/rcar-du/rcar_du_kms.c:754:32: error: implicit
>> declaration of function 'to_rcar_du_device'; did you mean
>> 'to_rtc_device'? [-Werror=implicit-function-declaration]
>>   struct rcar_du_device *rcdu = to_rcar_du_device(dev);
>>                                 ^~~~~~~~~~~~~~~~~
>>                                 to_rtc_device
>> drivers/gpu/drm/rcar-du/rcar_du_kms.c:754:32: warning: initialization
>> makes pointer from integer without a cast [-Wint-conversion]
>> In file included from drivers/gpu/drm/rcar-du/rcar_du_kms.c:17:0:
>> drivers/gpu/drm/rcar-du/rcar_du_kms.c: In function 'rcar_du_modeset_init':
>> drivers/gpu/drm/rcar-du/rcar_du_kms.c:781:24: error: passing argument
>> 1 of '__drmm_add_action' from incompatible pointer type
>> [-Werror=incompatible-pointer-types]
>>   ret = drmm_add_action(&rcdu->ddev, rcar_du_modeset_cleanup, NULL);
>>                         ^
>> include/drm/drm_managed.h:25:20: note: in definition of macro 'drmm_add_action'
>>   __drmm_add_action(dev, action, data, #action)
>>                     ^~~
>> include/drm/drm_managed.h:27:18: note: expected 'struct drm_device *'
>> but argument is of type 'struct drm_device **'
>>  int __must_check __drmm_add_action(struct drm_device *dev,
>>                   ^~~~~~~~~~~~~~~~~
>> cc1: some warnings being treated as errors
>>
>> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> 
> Very odd, my builds here didn't trigger that, sorry.  I'll go drop the
> offending patch...

Hrm, I believe this should have been fixed by:

https://lore.kernel.org/dri-devel/20210113170253.443820-1-kieran.bingham+renesas@ideasonboard.com/

But it doesn't seem to have made it upstream yet.

I've pinged the patch today, but that won't help stable trees until it
lands.
--
Kieran
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

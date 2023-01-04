Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD8F65CF3F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 10:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7942610E4F8;
	Wed,  4 Jan 2023 09:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A38310E4F8
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 09:11:54 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Nn3kr6Qqnz9sb8;
 Wed,  4 Jan 2023 10:11:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1672823508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y/YMNvlcuDVXZXXgwshuHizP1Psn5PFmk1rFDbqkr0o=;
 b=afo5rT8vBw3yeiARt4TG4K3miBUH7fiOKNabUg2jYJuK9nBMnsdESSezJy8IDKjHIKIVQf
 I+0LgMLJogCAyLMWLu+bAnOzFpbyZF07mS/SjjHmSSv3qrsxqryMBPLRjHkcuMdEFA1EsR
 bfKCBq71E6RAFPlEvQcDZkLsp3Z+uxqzTR3Fxm7YL4Qi/wNB/ScV2FH0BOS+nzTyvzjwZY
 fIQgrF0CDubfq/DT/CYjSWg/fQRDxSOHKfI4URxTQN0YJYuR+ZMxYjhESHKqHa7jOfvOJp
 sgtVKryr7YN79Hbtw8ueWh+9jsqVTg4qVlUcHTlHzFmk0fmjaWWNPUW3/kyesA==
Message-ID: <9ff68af1-63f6-1a95-6380-d0d8503fe511@mailbox.org>
Date: Wed, 4 Jan 2023 10:11:46 +0100
MIME-Version: 1.0
Subject: Re: renesas/master bisection:
 igt-kms-rockchip.kms_vblank.pipe-A-wait-forked on rk3399-gru-kevin
Content-Language: en-CA
To: Brian Norris <briannorris@chromium.org>
References: <6398848e.170a0220.f8e8e.d44f@mx.google.com>
 <Y5itf0+yNIQa6fU4@sirena.org.uk> <Y5qOwmqIIp+2qWOy@google.com>
 <Y6OCg9BPnJvimQLT@google.com>
 <a62cd71c-f025-739a-4822-58ff8fa78cbd@mailbox.org>
 <Y7TgXA+bnkPm4y/6@google.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <Y7TgXA+bnkPm4y/6@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: hmsgu73cckecf7er31jwhdesycgnb9c1
X-MBO-RS-ID: a481b6749b27126c508
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, kernelci-results@groups.io,
 bot@kernelci.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Robert Foss <robert.foss@linaro.org>, Mark Brown <broonie@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, gtucker@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/4/23 03:11, Brian Norris wrote:
> On Tue, Jan 03, 2023 at 07:04:00PM +0100, Michel Dänzer wrote:
>> On 12/21/22 23:02, Brian Norris wrote:
> 
>>> 3. leave vblank enabled even in the presence of PSR
> 
> I'm leaning toward this.

If this means vblank interrupts will arrive as expected even while in PSR, that may be the ideal solution indeed.


>> 5. Go/stay out of PSR while vblank interrupts are enabled (probably want to make sure vblankoffdelay is set up such that vblank interrupts are disabled ASAP)
> 
> That seems not extremely nice, to waste power. Based on the earlier
> downstream implementation (which left vblank interrupts enabled), I'd
> wager there's a much larger power win from PSR (on the display-transport
> and memory-bandwidth costs), relative to the power cost of vblank
> interrupts.
> 
> Also, messing with vblankoffdelay sounds likely to trigger the races
> mentioned in the drm_vblank.c kerneldoc.

Not sure how likely that is, quite a few drivers are setting dev->vblank_disable_immediate = true.

With that, vblank interrupts should generally be enabled only while there are screen updates as well[0], in which case PSR shouldn't be possible anyway.

[0] There may be user space which uses the vblank ioctls even while there are no screen updates though, which would prevent PSR in this case.


>>> [1] Or is it? I don't really know the DRM_IOCTL_WAIT_VBLANK ABI
>>>     contract in the presence of PSR, but I believe the upstream PSR
>>>     support has always worked this way. I could imagine
>>>     DRM_IOCTL_WAIT_VBLANK users might not love seeing EINVAL here
>>>     though.
>>
>> Yeah, that's pretty likely to cause issues with existing real-world user space.
> 
> OK. Any hints as to what kind of user space uses this?

I don't have any specific example, just thinking about how user space could respond to the vblank ioctls returning an error, and it would seem to be generally either of:

* Just run non-throttled, which might negate any energy savings from PSR
* Fail to work altogether


> I'm in part simply curious, but I'm also wondering what the
> error-handling and reliability (e.g., what if vblanks don't come?)
> expectations might be in practice.

If vblank events never come, user space might freeze.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer


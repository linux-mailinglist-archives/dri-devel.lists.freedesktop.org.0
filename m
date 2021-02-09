Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE9C314AED
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 09:56:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3DC8951E;
	Tue,  9 Feb 2021 08:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1871 seconds by postgrey-1.36 at gabe;
 Tue, 09 Feb 2021 08:30:05 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B9C894C1
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 08:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Fxdm02vMDANFITPepmem+ipILVHOG5tGKEVvchxGCqQ=; b=0p8FKw8dQeSWWBt2I1luC0LLOJ
 Ywm0Z6RM85QbVQKOEC9f0it5H7EB6fTRTRpPA3hgnBVjN6hfX6X+Z5E4OvD4mhdmXfLy1KVHBaGHT
 92SxPRzDKEgOWyhOAVlWTPCkhvTyZrix6I+EYg31mRbLq65GOP8xQzs8Pubtw6LBvPY4Lz+pXkZrI
 nSTfOgoID12jL9n7SnN922vK2lhXlo2A3moT7O+0ygsBlhLjxdyeZ9H9iab+98AvyLraDx7VkjkEH
 FdpUrjrfW8Cw58Nw+7/2qazUh29I9Jb+2hdyORUUsXh1yH2Zi29BnuWB80i8e3a13aOQgZmmKih03
 K97cRbew==;
Received: from webng-gw.kapsi.fi ([91.232.154.200] helo=roundcube.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <jyri.sarha@iki.fi>)
 id 1l9Nv5-0002ox-HL; Tue, 09 Feb 2021 09:58:47 +0200
MIME-Version: 1.0
Date: Tue, 09 Feb 2021 09:58:45 +0200
From: Jyri Sarha <jyri.sarha@iki.fi>
To: "quanyang.wang" <quanyang.wang@windriver.com>
Subject: Re: [PATCH] drm/tilcdc: send vblank event when disabling crtc
In-Reply-To: <40037f81-2444-1fe0-f5da-194f2a3d3f22@windriver.com>
References: <20210129055831.1702862-1-quanyang.wang@windriver.com>
 <1c6bd553-ee27-c93b-59e6-8d3c8368213a@ideasonboard.com>
 <40037f81-2444-1fe0-f5da-194f2a3d3f22@windriver.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <d38abc6d22590f0eea1aa7aae3ff754f@iki.fi>
X-Sender: jyri.sarha@iki.fi
X-SA-Exim-Connect-IP: 91.232.154.200
X-SA-Exim-Mail-From: jyri.sarha@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-02-09 5:09, quanyang.wang wrote:
> Ping.
> 

Could you resend the original patch (I have not received it) so I can 
easily test and merge it?

I'll find some time to do it soon.

Best regards,
Jyri

> On 1/29/21 3:58 PM, Tomi Valkeinen wrote:
>> Dropped the @ti.com addresses and added the new ones.
>> 
>>   Tomi
>> 
>> On 29/01/2021 07:58, quanyang.wang@windriver.com wrote:
>>> From: Quanyang Wang <quanyang.wang@windriver.com>
>>> 
>>> When run xrandr to change resolution on Beaglebone Black board, it 
>>> will
>>> print the error information:
>>> 
>>> root@beaglebone:~# xrandr -display :0 --output HDMI-1 --mode 720x400
>>> [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
>>> [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:32:tilcdc 
>>> crtc] commit wait timed out
>>> [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
>>> [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* 
>>> [CONNECTOR:34:HDMI-A-1] commit wait timed out
>>> [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
>>> [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* 
>>> [PLANE:31:plane-0] commit wait timed out
>>> tilcdc 4830e000.lcdc: already pending page flip!
>>> 
>>> This is because there is operation sequence as below:
>>> 
>>> drm_atomic_connector_commit_dpms(mode is DRM_MODE_DPMS_OFF):
>>>      ...
>>>      drm_atomic_helper_setup_commit <- 
>>> init_completion(commit_A->flip_done)
>>>      drm_atomic_helper_commit_tail
>>>          tilcdc_crtc_atomic_disable
>>>          tilcdc_plane_atomic_update <- drm_crtc_send_vblank_event in 
>>> tilcdc_crtc_irq
>>>                                        is skipped since 
>>> tilcdc_crtc->enabled is 0
>>>          tilcdc_crtc_atomic_flush   <- drm_crtc_send_vblank_event is 
>>> skipped since
>>>                                        crtc->state->event is set to 
>>> be NULL in
>>>                                        tilcdc_plane_atomic_update
>>> drm_mode_setcrtc:
>>>      ...
>>>      drm_atomic_helper_setup_commit <- 
>>> init_completion(commit_B->flip_done)
>>>      drm_atomic_helper_wait_for_dependencies
>>>          drm_crtc_commit_wait   <- wait for commit_A->flip_done 
>>> completing
>>> 
>>> Just as shown above, the steps which could complete 
>>> commit_A->flip_done
>>> are all skipped and commit_A->flip_done will never be completed. This 
>>> will
>>> result a time-out ERROR when drm_crtc_commit_wait check the 
>>> commit_A->flip_done.
>>> So add drm_crtc_send_vblank_event in tilcdc_crtc_atomic_disable to
>>> complete commit_A->flip_done.
>>> 
>>> Fixes: cb345decb4d2 ("drm/tilcdc: Use standard 
>>> drm_atomic_helper_commit")
>>> Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
>>> ---
>>>   drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>> 
>>> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c 
>>> b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
>>> index 30213708fc99..d99afd19ca08 100644
>>> --- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
>>> +++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
>>> @@ -515,6 +515,15 @@ static void tilcdc_crtc_off(struct drm_crtc 
>>> *crtc, bool shutdown)
>>>     	drm_crtc_vblank_off(crtc);
>>>   +	spin_lock_irq(&crtc->dev->event_lock);
>>> +
>>> +	if (crtc->state->event) {
>>> +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
>>> +		crtc->state->event = NULL;
>>> +	}
>>> +
>>> +	spin_unlock_irq(&crtc->dev->event_lock);
>>> +
>>>   	tilcdc_crtc_disable_irqs(dev);
>>>     	pm_runtime_put_sync(dev->dev);
>>> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

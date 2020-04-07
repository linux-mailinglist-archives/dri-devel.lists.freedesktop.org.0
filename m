Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C832C1A0476
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 03:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9605C6E509;
	Tue,  7 Apr 2020 01:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914F46E509
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 01:23:52 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1586222636; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=zdX68qj/o0fSAH+5oQViA8gUPvw2DqLvpBIUgqP4Kj4=;
 b=srJwpq+Fddw7LXnL2PTxZhAbjV3VrIeJp1Sjp8/Qh6oa1xgZn9UuWdJz6JCQT8Ghe5z6yRO+
 8SbXcvjC9rpQ4NtIsgQlGgUX2Hn0FyD70hY3CQj4lZTYsrnfhOqU7o88WMis2Nvg72Ib+gSl
 QTx9kaLDTe6dvsL4d4xGW+wT2Pc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8bd61e.7f94f38586f8-smtp-out-n01;
 Tue, 07 Apr 2020 01:23:42 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7AADFC44792; Tue,  7 Apr 2020 01:23:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C2238C433F2;
 Tue,  7 Apr 2020 01:23:39 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 06 Apr 2020 18:23:39 -0700
From: abhinavk@codeaurora.org
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2 03/17] drm: Nuke mode->vrefresh
In-Reply-To: <87tv1xko9l.fsf@intel.com>
References: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
 <20200403204008.14864-4-ville.syrjala@linux.intel.com>
 <5d677ff317089267407609a1faa64b13@codeaurora.org> <87tv1xko9l.fsf@intel.com>
Message-ID: <db6db406ab0c1378fdac427d9112cf97@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, nouveau@lists.freedesktop.org,
 =?UTF-8?Q?Gu?= =?UTF-8?Q?ido_G=C3=BCnther?= <agx@sigxcpu.org>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, aravindh@quicinc.com,
 Emil Velikov <emil.velikov@collabora.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 pdhaval@quicinc.com, Ben Skeggs <bskeggs@redhat.com>,
 Jonas Karlman <jonas@kwiboo.se>, intel-gfx@lists.freedesktop.org,
 nganji@quicinc.com, linux-amlogic@lists.infradead.org,
 Vincent Abriou <vincent.abriou@st.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Purism Kernel Team <kernel@puri.sm>,
 jeykumar@quicinc.com, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Icenowy Zheng <icenowy@aosc.io>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani

On 2020-04-06 01:32, Jani Nikula wrote:
> On Fri, 03 Apr 2020, abhinavk@codeaurora.org wrote:
>> On 2020-04-03 13:39, Ville Syrjala wrote:
>>> diff --git a/drivers/gpu/drm/drm_modes.c 
>>> b/drivers/gpu/drm/drm_modes.c
>>> index fec1c33b3045..e3d5f011f7bd 100644
>>> --- a/drivers/gpu/drm/drm_modes.c
>>> +++ b/drivers/gpu/drm/drm_modes.c
>>> @@ -759,9 +759,7 @@ int drm_mode_vrefresh(const struct 
>>> drm_display_mode
>>> *mode)
>>>  {
>>>  	int refresh = 0;
>>> 
>>> -	if (mode->vrefresh > 0)
>>> -		refresh = mode->vrefresh;
>> 
>> The mode->vrefresh has been replaced with calling this API in all its
>> usages.
>> However in this API, the above if statement was returning the vrefresh
>> if it was already
>> set. mode->clock is holding the pixel clock . So this will not cause 
>> any
>> issues in non-compressed cases.
>> In case of compression like DSC, the pixel
>> clock will be different based on the compression ratio hence the
>> mode->clock will change but fps will not.
>> So we did have usages in our downstream driver where we would use this
>> API and the refresh rate
>> returned will be the mode->vrefresh which did not change but after 
>> this
>> change for those cases it will end up returning the refresh rate
>> calculated using mode->clock which will result in a different value 
>> now.
>> So is the recommendation that even in the case of compression
>> mode->clock should always hold
>> uncompressed pixel clock value because with this part of the change we
>> will now get a different value when we call this API.
> 
> Yes. The mode remains the same regardless of compression, and
> compression is just an implementation detail of the transport.
> 
> You may need to maintain separate "physical port clock" and "logical
> port clock" for DSC, where the latter is a function of the former and
> the DSC parameters. And then you can see if your logical port clock
> provides enough bandwidth for your mode. But this is up to your driver
> and encoder implementation.
> 
> BR,
> Jani.

Thanks for the information. We will make changes to our driver to 
accommodate the changes in the
drm_mode_vrefresh API.

Thanks

Abhinav
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C81968F78
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 00:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E98110E072;
	Mon,  2 Sep 2024 22:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=cristian.ciocaltea@collabora.com header.b="fECWOFVL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D6610E072
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 22:15:01 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1725315292; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=SQpuusukbpN6JVHx9Vp3GmqH3RMB9VT4zhStc/T0Kjuf6/jpeY8F3w/YP4rjHG9NBe2Xk3AxtYQzLx7ctSBrvWS3lMoZvZFZjkgBZeOWv/Ok2eVfWI7gU3awl/jaWcWjbjKUzTgtKfRpE6kxA4n5CqQIgyX5rCCjMoxVpCGTvTA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1725315292;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=QDNIvKtrO8pIYCbZxhaqDHVt24NXNrWagRGRYHJHozM=; 
 b=BwlnaS+p845Tv3Ms99pwrryj6c//3S95iWRU+qHu31RkWOb1TOOLYXul4jBsVCecT4EugEOJUQkDkt4b9FRNbvvxcx2Mf3IdlzeVHbADl4eVxC4W8RI/E1zWTo3fTfV39J3iB9f6xEcNyZbUAvumPhP0fn/6pcR5E7j70lfGyfo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=cristian.ciocaltea@collabora.com;
 dmarc=pass header.from=<cristian.ciocaltea@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725315292; 
 s=zohomail; d=collabora.com; i=cristian.ciocaltea@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=QDNIvKtrO8pIYCbZxhaqDHVt24NXNrWagRGRYHJHozM=;
 b=fECWOFVLFmmzV1WR2D/aPVwqiIbnjZi+FsoTTLknC2nX6xgeTVWzxj+2g0Mg0qJO
 kAFC0WfOX+FroleSd1Fa0P/pi4LJ0wW2vlAn+Yg6yl52BJfW2LGAqOPVyigvW5REgLv
 g1TEx9waorek+ZWIuX7hpi/l0505b5e4suDsIQPQ=
Received: by mx.zohomail.com with SMTPS id 1725315290251290.71260809194837;
 Mon, 2 Sep 2024 15:14:50 -0700 (PDT)
Message-ID: <eb9f2d20-9b51-45e1-bf32-504267747f06@collabora.com>
Date: Tue, 3 Sep 2024 01:14:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] dt-bindings: display: rockchip: Add schema for
 RK3588 HDMI TX Controller
To: Shimrra Shai <shimrrashai@gmail.com>
Cc: Laurent.pinchart@ideasonboard.com, aarnoud@me.com, airlied@gmail.com,
 andrzej.hajda@intel.com, andy.yan@rock-chips.com, conor+dt@kernel.org,
 daniel@ffwll.ch, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, heiko@sntech.de, hjc@rock-chips.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, kernel@collabora.com,
 krzk+dt@kernel.org, krzk@kernel.org, ldearquer@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, maarten.lankhorst@linux.intel.com,
 markyao0591@gmail.com, mripard@kernel.org, neil.armstrong@linaro.org,
 rfoss@kernel.org, robh@kernel.org, s.hauer@pengutronix.de,
 tzimmermann@suse.de
References: <5ea24ad3-7faa-4a59-ba10-d43b32b3b40e@collabora.com>
 <20240902010948.3654-1-shimrrashai@gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20240902010948.3654-1-shimrrashai@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 9/2/24 4:09 AM, Shimrra Shai wrote:
> Cristian Ciocaltea wrote:
>> On 8/31/24 9:13 AM, Krzysztof Kozlowski wrote:
>>>
>>> Please define all clocks.
>>
>> The other clocks are defined in the common binding, should we reiterate
>> them?
> 
> I would suggest yes, they should be reduplicated, if only to maintain
> consistency with all the other docs. A grep through the bridge docs
> shows that there are virtually none which use a "{}" placeholder like
> this. 

Are you sure about that?  This is precisely the approach followed by the
upstream DW HDMI TX controller binding [1].  Moreover, I've already pointed this
out in [2].

> While it seems kind of like one might worry about "don't
> repeat yourself" syndrome, keep in mind this is not code, but human-
> used documentation. Having all the information available at a glance
> would seem to be the most convenient to the end (developer) user, so
> they aren't having to toggle between two separate files. 

I think that's pretty subjective to be stated as a general rule, e.g. I don't
have any problem toggling between multiple files as I regularly keep over 50
files opened in my IDE.  Personally, I'd always go for the slightly less 
readable approach if I can avoid duplicating content.

I'd suggest to follow the whole thread [2], as this topic has been already
discussed.

> Of course
> there may be some questions regarding docs becoming out of sync, but
> *ideally* we don't want to break backward compatibility with device
> trees (esp. given how I am imagining firmware integration to work on
> these platforms, as the RK3588 is at at least low-end desktop-grade
> performance and UEFI packages have already been built for it), though
> of course that doesn't mean adding new options is off the table.
> 
> (FWIW, this is what I did in my now-withdrawn-at-your-request
> re-submission; I reduplicated the bindings as it seemed that's what
> others here were pushing for and thus that felt like the quickest way
> to get this important driver approved.)

This is not really a blocker for the series.  Please remember to be patient
while involved (one way or another) in the upstreaming process, as maintainers
need time to review *all* the patches.  This might be very important for you,
but there are, usually, tons of other way more important things the maintainers
need to handle in parallel.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml#n46
[2] https://lore.kernel.org/lkml/ec84bc0b-c4c2-4735-9f34-52bc3a852aaf@collabora.com/


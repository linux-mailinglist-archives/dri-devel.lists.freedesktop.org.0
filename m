Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E7A1F84D1
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 21:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888F06E444;
	Sat, 13 Jun 2020 19:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1363 seconds by postgrey-1.36 at gabe;
 Sat, 13 Jun 2020 19:10:34 UTC
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1E16E198;
 Sat, 13 Jun 2020 19:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X/jO/oOi/i194CqdSyPFOeD03ocsEI+CR9RGjelX7xY=; b=t1kxOxXawhjaLcxCmcY8hLnACp
 F1b/P7XS1botfvRcieE2eXRSlD/fR0LaGVjWkNcN6Q2dzPLMY9Y1Z6Wss2c8W2HXxaP9v0SeBHOZL
 ndNOGKlGE7n0ypom9LbWyKkJzps9GmRj0wSRrV+8nc5dyNNxx/KqiXmyl966IkY4aosMx+bXHqhKl
 8etQynPyVsROMw/HTrtBTU4+uDQUD0yWT2w1CjrrleOcstKaBLjurimaG7kObfyvLObWh+oZfuNyE
 8GMYhhLCClZ95KOF8De+ijdjKNp8jjSziMYIR//hhZlHppaw+v8e8JJ56ladSxXsntPzKuIMI0fxh
 3mnnUl/g==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:47290 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <david@lechnology.com>)
 id 1jkBBz-0005W8-Fz; Sat, 13 Jun 2020 14:47:47 -0400
Subject: Re: [PATCH 7/8] drm/mipi-dbi: Remove ->enabled
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200612160056.2082681-1-daniel.vetter@ffwll.ch>
 <20200612160056.2082681-7-daniel.vetter@ffwll.ch>
From: David Lechner <david@lechnology.com>
Message-ID: <eb6ffd18-8f2d-3d48-a72e-44bf4e1c8512@lechnology.com>
Date: Sat, 13 Jun 2020 13:47:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200612160056.2082681-7-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/12/20 11:00 AM, Daniel Vetter wrote:
> The atomic helpers try really hard to not lose track of things,
> duplicating enabled tracking in the driver is at best confusing.
> Double-enabling or disabling is a bug in atomic helpers.
> 
> In the fb_dirty function we can just assume that the fb always exists,
> simple display pipe helpers guarantee that the crtc is only enabled
> together with the output, so we always have a primary plane around.
> 
> Now in the update function we need to be a notch more careful, since
> that can also get called when the crtc is off. And we don't want to
> upload frames when that's the case, so filter that out too.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Lechner <david@lechnology.com>
> ---

Acked-by: David Lechner <david@lechnology.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

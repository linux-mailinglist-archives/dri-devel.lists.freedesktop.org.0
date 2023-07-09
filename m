Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7EC74C684
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jul 2023 19:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC38B10E113;
	Sun,  9 Jul 2023 17:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:405::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DFD10E113
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jul 2023 17:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Ggd/lz7LWxjEBLYEQntzh6HaPidJbmeC4Mam2YcQ7N8=;
 b=m8zH2rvokghm9znNhoTX5LaIlpE00fNTjuog77vyzXCHT9M2hEVmKV3ofCwlMelMZa4BjW/AYFy+t
 7t+R7O8jknIrQQH2qX6JnSszdT/Td+UtdYnzixYadUcMyj+gVmEkdobjtvYGxqYhsVpvicIcJwPUGg
 8rYvTcMrtvjE7wukQdjHGoSZzFjZge98R5wN9Vpd3EX3voTk+ZfYjddr5nN7bKf+ECxPJ28Amghac6
 c5751BHUmgAh22/c5WzbZffGGVyFTaBt/S4VtyX+Eu5pjXD5xrM9+jNUe+HNMXzjX9fWKGTWsRvhxQ
 xN2LgWtVZOPAg8LLPMC4a8wDaUX4mGw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Ggd/lz7LWxjEBLYEQntzh6HaPidJbmeC4Mam2YcQ7N8=;
 b=MB5VSdY2aOj7eh78R8UefQykYykzD0OrgsepVKj1npEmOayv+bwinuh8q4iKJHf4FePhMErZWVEuB
 N/j34q2Bw==
X-HalOne-ID: e49b0d8a-1e7b-11ee-a1b1-6f01c1d0a443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay6 (Halon) with ESMTPSA
 id e49b0d8a-1e7b-11ee-a1b1-6f01c1d0a443;
 Sun, 09 Jul 2023 17:13:18 +0000 (UTC)
Date: Sun, 9 Jul 2023 19:13:17 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm/panel: simple: Drop prepared_time
Message-ID: <20230709171317.GA707615@ravnborg.org>
References: <20230709162253.464299-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230709162253.464299-1-marex@denx.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 09, 2023 at 06:22:53PM +0200, Marek Vasut wrote:
> This has been superseded by RPM in commit
> 3235b0f20a0a ("drm/panel: panel-simple: Use runtime pm to avoid excessive unprepare / prepare")
> and the last user of the non-RPM case has been dropped in commit
> b6d5ffce11dd ("drm/panel-simple: Non-eDP panels don't need "HPD" handling")
> whatever is left in this driver is just assigned and never used.
> Drop the remaining parts.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: dri-devel@lists.freedesktop.org

Thanks,
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

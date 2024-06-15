Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAA1909A13
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 23:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD56310E15B;
	Sat, 15 Jun 2024 21:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="UVn4OWKj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [167.172.40.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FAB810E15B
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 21:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1718488674;
 bh=CV/mgUWgMh4+uV6CKW6yanETiH58y91gnPr01uQkQ8k=;
 b=UVn4OWKjypaU+NM3VrcShJnaPz42ArY3uHbpDfMAjfG72ySTdUU4EwLn7Nwl6CvqsbpDTOTF9
 3di3dl/H60nAr7nF3epMiJHFdZnQbLfx0iktuRcvF+4IWiy5zB+ETUEV2sa9co4tPXKKc7qv8d6
 02vEGhoumsScvcvjHxCh6qwv1p62OpQ62vUAm/lq4fwlZ9j5xVCdBXa5wkezHBI/9IG8seUXm2R
 3Tci24wzeOJb3huCJhy6DnZVFPXY/A41L/P0BVjHXqZYZowLc6NPq34DVu8v/60siHgCAJze5eP
 6Zb9TAGw3V4c9YVtqD9Y/VpLGYTV5Qh+wo8eHLJpz8BQ==
Message-ID: <ff18a3dd-3e39-4dfd-8e0f-6401b3df531c@kwiboo.se>
Date: Sat, 15 Jun 2024 23:57:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] drm/rockchip: dw_hdmi: Add max_tmds_clock validation
To: Diederik de Haas <didi.debian@cknow.org>
Cc: dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 "=?UTF-8?Q?Heiko_St=C3=BCbner?=" <heiko@sntech.de>, Andy Yan
 <andy.yan@rock-chips.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240615170417.3134517-1-jonas@kwiboo.se>
 <20240615170417.3134517-7-jonas@kwiboo.se> <2357044.LC0K3s5jzQ@bagend>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <2357044.LC0K3s5jzQ@bagend>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 167.172.40.54
X-ForwardEmail-ID: 666e0e5eb23880544d1f8be8
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

Hi Diederik,

On 2024-06-15 23:53, Diederik de Haas wrote:
> On Saturday, 15 June 2024 19:03:57 CEST Jonas Karlman wrote:
>> The rate limit for RK3288, RK3399 and RK3568 is based on current mpll
>> table. The rate limit for RK3228 and RK3228 is based on the
>> inno-hdmi-phy pre-pll table.
> 
> I see RK3228 mentioned twice; I guess the second should be RK3328?

You are correct, a copy/paste error, thanks and I will fix in v2.

Regards,
Jonas

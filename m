Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F05D93ADE68
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jun 2021 14:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3F26E10D;
	Sun, 20 Jun 2021 12:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B03E6E10D
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jun 2021 12:56:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B284610CA;
 Sun, 20 Jun 2021 12:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624193812;
 bh=bWaVnm+peFovnHMu18RwWDuf3L6KT66p404kqB1aQyk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TPScjPmNxSr2YT2IvEKemKWAPgTymLvW3gbEPh9aW2ZDQXmS+k82sz2zrDcuaytnb
 rBC/doh50rFtdR/0+XtqFzla7SsRmcePwtR4NVQiVI2wRrwkuwWUk0kIDbZt05YO5F
 otWCj7/ZGl/i6yRPLueJR+I51Oeuxgq56ZCmvVnERBu1Jeagwv1QgR34hXDqEOxNdu
 O6iNJDRiTJWoEmz1aHW0prY2qr0OlRq0QNb1oovA/uTymM1/lcCzexFgLxMUnazULL
 cu779WiBhiZevR4pqBAFkWuaRwMKt4gDM2Qvxf18HUJcdLDB2FZzz4Jp24gFzRAGSJ
 PJxgmE5aJyK0w==
Date: Sun, 20 Jun 2021 08:56:51 -0400
From: Sasha Levin <sashal@kernel.org>
To: Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH AUTOSEL 5.4 07/15] drm/sun4i: dw-hdmi: Make HDMI PHY into
 a platform device
Message-ID: <YM87E3tYj+awywpN@sashalap>
References: <20210615154948.62711-1-sashal@kernel.org>
 <20210615154948.62711-7-sashal@kernel.org>
 <CAGETcx95bOAHiOm0MHqFWSbc8ONBPEzXbDyP82pO4B5o2QOX1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAGETcx95bOAHiOm0MHqFWSbc8ONBPEzXbDyP82pO4B5o2QOX1A@mail.gmail.com>
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
Cc: Ondrej Jirman <megous@megous.com>, Andre Przywara <andre.przywara@arm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, stable <stable@vger.kernel.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 15, 2021 at 09:26:16AM -0700, Saravana Kannan wrote:
>On Tue, Jun 15, 2021 at 8:50 AM Sasha Levin <sashal@kernel.org> wrote:
>>
>> From: Saravana Kannan <saravanak@google.com>
>>
>> [ Upstream commit 9bf3797796f570b34438235a6a537df85832bdad ]
>>
>> On sunxi boards that use HDMI output, HDMI device probe keeps being
>> avoided indefinitely with these repeated messages in dmesg:
>>
>>   platform 1ee0000.hdmi: probe deferral - supplier 1ef0000.hdmi-phy
>>     not ready
>>
>> There's a fwnode_link being created with fw_devlink=on between hdmi
>> and hdmi-phy nodes, because both nodes have 'compatible' property set.
>>
>> Fw_devlink code assumes that nodes that have compatible property
>> set will also have a device associated with them by some driver
>> eventually. This is not the case with the current sun8i-hdmi
>> driver.
>>
>
>fw_devlink isn't present in 5.4 or earlier. So technically this patch
>isn't needed.

I'll drop it from <=5.4, thanks!

-- 
Thanks,
Sasha

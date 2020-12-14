Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4714E2D97D6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 13:06:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4456E8B9;
	Mon, 14 Dec 2020 12:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 634F96E8B9
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 12:06:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9853630E;
 Mon, 14 Dec 2020 04:06:24 -0800 (PST)
Received: from [10.57.33.60] (unknown [10.57.33.60])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4D6D3F66B;
 Mon, 14 Dec 2020 04:06:22 -0800 (PST)
Subject: Re: [PATCH v3] drm: rockchip: hdmi: enable higher resolutions than FHD
To: Vicente Bergas <vicencb@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>, crj <algea.cao@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
References: <20201201160613.1419-1-vicencb@gmail.com>
 <CAAMcf8B9HNkZie6nbkBugcteJOLUhWhHVhjKxkH1sPrTU4k+xw@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <b57e53c4-16f1-a4a7-ee29-eeb7dc37a8d2@arm.com>
Date: Mon, 14 Dec 2020 12:06:09 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAAMcf8B9HNkZie6nbkBugcteJOLUhWhHVhjKxkH1sPrTU4k+xw@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-12-14 11:03, Vicente Bergas wrote:
> On Tue, Dec 1, 2020 at 5:06 PM Vicente Bergas <vicencb@gmail.com> wrote:
>> This patch enables a QHD HDMI monitor to work at native resolution.
> 
> Please, anybody?

Has anyone been able to validate this on other SoCs? I guess that's 
still the main concern - empirically I've found that clock rates that 
work perfectly on RK3399 can be glitchy on RK3288 to the point of being 
barely usable, and can result in no display at all on chips not using 
the Synopsys phy, like RK3328, where the HDMI driver considers the mode 
valid but later the phy driver is unable to match it.

I don't have access to a QHD display to test this myself; I've only 
played around with weirder 4:3, 5:4 and 16:10 modes on PC monitors.

Robin.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

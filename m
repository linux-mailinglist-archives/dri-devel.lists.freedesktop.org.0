Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ED19E0958
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 18:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A45610E7CA;
	Mon,  2 Dec 2024 17:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.steuer-voss.de (mail.steuer-voss.de [85.183.69.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6D210E7CA
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 17:03:21 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.steuer-voss.de
Received: from mail.steuer-voss.de (localhost [127.0.0.1])
 by mail.steuer-voss.de (Postfix) with ESMTP id AA1BB2D2;
 Mon,  2 Dec 2024 18:03:16 +0100 (CET)
MIME-Version: 1.0
Date: Mon, 02 Dec 2024 18:03:16 +0100
From: Nikolaus Voss <nv@vosn.de>
To: Marek Vasut <marex@denx.de>
Cc: Liu Ying <victor.liu@oss.nxp.com>, Alexander Stein
 <alexander.stein@ew.tq-group.com>, Liu Ying <victor.liu@nxp.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Fabio Estevam <festevam@denx.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Miquel Raynal
 <miquel.raynal@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nikolaus.voss@haag-streit.com
Subject: Re: [PATCH] drm: bridge: fsl-ldb: fixup mode on freq mismatch
In-Reply-To: <50ee0207-b37a-4a6a-83fe-32a7a43645ce@denx.de>
References: <20241126172610.AD8B51622C@mail.steuer-voss.de>
 <1f0a307a-666f-4647-9f73-e9bddd6c7eff@oss.nxp.com>
 <50ee0207-b37a-4a6a-83fe-32a7a43645ce@denx.de>
User-Agent: Roundcube Webmail/1.5.0
Message-ID: <9cc55af202690bad0616bee76430133d@vosn.de>
X-Sender: nv@vosn.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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

On 02.12.2024 13:56, Marek Vasut wrote:
> On 12/2/24 7:32 AM, Liu Ying wrote:
>> On 11/27/2024, Nikolaus Voss wrote:
>>> LDB clock has to be a fixed multiple of the pixel clock.
>>> As LDB and pixel clock are derived from different clock sources
>>> (at least on imx8mp), this constraint cannot be satisfied for
>>> any pixel clock, which leads to flickering and incomplete
>>> lines on the attached display.
>>> 
>>> To overcome this, check this condition in mode_fixup() and
>>> adapt the pixel clock accordingly.
>>> 
>>> Cc: <stable@vger.kernel.org>
>> 
>> It looks like stable is not effectively Cc'ed.
>> Need a Fixes tag?
> Isn't this fix effectively superseded by series
> 
> [PATCH 0/5] clk: Fix simple video pipelines on i.MX8
> 
> ?

Maybe. I wasn't aware of the series. Looking at it, the change is
rather complex and not suitable for the stable series.

My intention was to get a simple fix which doesn't potentially
break anything. It wouldn't even break the patch series you mentioned.

-- 
Nikolaus Voss

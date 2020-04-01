Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB1219ABEB
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 14:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50496E09A;
	Wed,  1 Apr 2020 12:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9986E09A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 12:43:47 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 031ChTK6066990;
 Wed, 1 Apr 2020 07:43:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1585745010;
 bh=fA6Bmj6h2m2Ti5a8juJ0Xq7WDf2xLfwNzSplXtG+cKQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=fP0OYjbvgpKZTmNEQFa5ejyNzl6qwK23fLf8YZQGS63C8+AomvHM2c+Io/1GGQUz3
 Yps+vt1q1TZ99YeOWXviqHWZsohWmftsZOxVtiaRSrHbEGAFOwezx4QqG/0cDULlPl
 1k170Y+OVCvHx4Wm3Quh62tl7Umrr4f+YLYUvotk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 031ChTKX083499
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 1 Apr 2020 07:43:29 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 1 Apr
 2020 07:43:29 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 1 Apr 2020 07:43:29 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 031ChRjD010837;
 Wed, 1 Apr 2020 07:43:27 -0500
Subject: Re: [PATCHv2 00/56] drm/omap: Convert DSI code to use drm_mipi_dsi
 and drm_panel
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <32b73b0a-a5f6-e311-b2d5-95e333f039a4@ti.com>
 <20200325130358.GE19171@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <928b0af8-a9bd-0d13-afdf-ec17366330b9@ti.com>
Date: Wed, 1 Apr 2020 15:43:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200325130358.GE19171@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 linux-omap@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/03/2020 15:03, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Wed, Mar 25, 2020 at 02:47:48PM +0200, Tomi Valkeinen wrote:
>> On 25/02/2020 01:20, Sebastian Reichel wrote:
>>> This updates the existing omapdrm DSI code, so that it uses
>>> common drm_mipi_dsi API and drm_panel.
>>>
>>> The patchset has been tested with Droid 4 using Linux console, X.org and
>>> Weston. The patchset is based on Laurent Pinchartl's patch series [0]
>>> and removes the last custom panel driver, so quite a few cleanups on the
>>> omapdrm codebase were possible.
>>
>> This is a big series, and I suggest to keep the cleanups to minimum.
>> Things can be cleaned up afterwards after the functional parts of this
>> series have been merged.
> 
> There are a few cleanups at the bottom of the series that could be
> merged without waiting for the rest though :-)

Yep. So, Sebastian, if there are patches that can be applied independently of this series, can you 
send those separately or move them to the beginning of the series.

There was also the change to include/drm/drm_mipi_dsi.h which is outside the OMAP context. Maybe 
send that separately to the relevant maintainers. Or at least cc them, as now it's kind of hidden 
between all the omap changes.

And I need to try to wake up one of my boards with a DSI video mode display for testing...

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

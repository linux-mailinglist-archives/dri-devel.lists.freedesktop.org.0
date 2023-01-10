Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A87C666560A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 09:27:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14C810E4D1;
	Wed, 11 Jan 2023 08:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8AF910E5CC
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 14:25:42 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86CCA51E;
 Tue, 10 Jan 2023 15:25:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1673360741;
 bh=uHpoZuFH8hVrbocw6FPuOUidjWHwMDLuOh8dNnA2/Cs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bV8kHKVLX8M27eBkDviIKl9wyQQBIi1c3t/3mf+nMI9kxsIjzMzjrOBI40mjZaj+D
 1eVMg/XNWSsVR37L4uLLAZG5EJtdi3Vvhm05i0XGSf6Qj78qv5yskHtPqeh8eiqM+Z
 Dtqooc4zKNGznFKHDB0fk5QOms4R46xuGJspqVIw=
Message-ID: <479e1dca-8d9c-cc75-75d9-3148ccc54f68@ideasonboard.com>
Date: Tue, 10 Jan 2023 16:25:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 0/7] media/drm: renesas: Add new pixel formats
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20221221092448.741294-1-tomi.valkeinen+renesas@ideasonboard.com>
 <Y6m2AqlDdmcgCk8F@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y6m2AqlDdmcgCk8F@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 11 Jan 2023 08:27:49 +0000
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Nicolas Dufresne <nicolas@ndufresne.ca>,
 linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/12/2022 16:56, Laurent Pinchart wrote:
> Hi Tomi,
> 
> (CC'ing Daniel and Dave)
> 
> On Wed, Dec 21, 2022 at 11:24:41AM +0200, Tomi Valkeinen wrote:
>> From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>
>> Hi,
>>
>> These add new pixel formats for Renesas V3U and V4H SoCs.
>>
>> As the display pipeline is split between DRM and V4L2 components, this
>> series touches both subsystems. I'm sending all these together to
>> simplify review. If needed, I can later split this to V4L2 and DRM
>> parts, of which the V4L2 part needs to be merged first.
> 
> As the changes on the DRM side are small and shouldn't conflict with
> anything else queued for v6.3, it would be easier to merge the whole
> series through the media tree. Daniel, Dave, would you be OK with that ?
> If so, could you please ack patches 6/7 and 7/7 ?

Note that these patches depend on the two DRM driver patches in "[PATCH 
v5 0/7] Renesas V4H DSI & DP output support", which are not very small 
(but still not big).

I don't think there's a compile-time dependency between the DRM and V4L2 
parts, but there's a functional side dependency, so it would be nice to 
merge these via a single tree. I can't say if DRM or V4L2 tree is 
easier, but I don't expect conflicts either way.

  Tomi


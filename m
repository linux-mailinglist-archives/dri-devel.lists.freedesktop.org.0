Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEE51314F4
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 16:36:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB06189CD8;
	Mon,  6 Jan 2020 15:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D909589CD8
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 15:36:48 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 149BE804F9;
 Mon,  6 Jan 2020 16:36:45 +0100 (CET)
Date: Mon, 6 Jan 2020 16:36:43 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Subject: Re: [PATCH v2 0/6] update hwdw for gc400
Message-ID: <20200106153643.GA8535@ravnborg.org>
References: <20200106151655.311413-1-christian.gmeiner@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200106151655.311413-1-christian.gmeiner@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8
 a=eDDQxHsoJXqcITB9VNUA:9 a=7Zwj6sZBwVKJAoWSPKxL6X1jA+E=:19
 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
 Russell King <linux+etnaviv@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian

On Mon, Jan 06, 2020 at 04:16:45PM +0100, Christian Gmeiner wrote:
> This patch series extends the hwdb for an entry for the gc400 found
> in the ST STM32 SoC. With this patches we report the same limits and
> features for this GPU as the galcore kernel driver does.

For future patches can you please incldue a small changelog
within each patch.

Something like

v2:
  - Drop redundant newlines (Lucas)

This serves several purposes:
- It explains what was changed since last version
- It allow the reader to focus on changed parts
- It attributes who requested a specific change
- It gives a good idea of the history of a patch

In the DRM sub-subsystem the idea is that if it is written it
should be visible in git too. So include the changelog part in the
normal commit-message.

	Sam

> 
> Christian Gmeiner (6):
>   drm/etnaviv: update hardware headers from rnndb
>   drm/etnaviv: determine product, customer and eco id
>   drm/etnaviv: show identity information in debugfs
>   drm/etnaviv: update gc7000 chip identity entry
>   drm/etnaviv: update hwdb selection logic
>   drm/etnaviv: add hwdb entry for gc400 found in STM32
> 
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c  | 18 ++++++++++-
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h  |  6 ++--
>  drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 42 +++++++++++++++++++++++++-
>  drivers/gpu/drm/etnaviv/state_hi.xml.h | 29 +++++++++++-------
>  4 files changed, 79 insertions(+), 16 deletions(-)
> 
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

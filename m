Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1E13B36FE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 21:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7975D6ECBE;
	Thu, 24 Jun 2021 19:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB90C6ECBE
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 19:27:51 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 4d318a88-d522-11eb-960d-0050568c148b;
 Thu, 24 Jun 2021 19:28:06 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id C9765194B06;
 Thu, 24 Jun 2021 21:27:53 +0200 (CEST)
Date: Thu, 24 Jun 2021 21:27:47 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 0/2] R-Car DU: Add DSI encoder driver for V3U
Message-ID: <YNTcswi4nmq/TfPz@ravnborg.org>
References: <20210623135639.17125-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210623135639.17125-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,
On Wed, Jun 23, 2021 at 04:56:37PM +0300, Laurent Pinchart wrote:
> Hello,
> 
> This patch series adds a driver for the DSI encoder found in the R-Car
> V3U SoC, which is the first SoC in the family that supports DSI.
> 
> The driver is based on an implementation from the BSP written by Luu
> Hoai, with lots of further rework. If anyone is interested in the
> history, a broken down v1 is available from [1].
> 
> The driver has been successfully tested on the Falcon board, which
> connects an SN65DSI86 to the output of the DSI encoder. Further patches
> are needed for the ti-sn65dsi86 driver to enable usage in plain DP
> (non-eDP) mode, as the Falcon board has a mini-DP connector wired to the
> output of the SN65DSI86. This is work in progress (see [2]).
> 
> [1] https://lore.kernel.org/linux-renesas-soc/189c7a07-29cd-39f4-1dec-56aa94c11fba@ideasonboard.com/T/#mafbe130386cbc8326f85cad46860813516ef4a80
> [2] https://lore.kernel.org/linux-renesas-soc/20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com/
> 
> LUU HOAI (1):
>   drm: rcar-du: Add R-Car DSI driver
> 
> Laurent Pinchart (1):
>   dt-bindings: display: bridge: Add binding for R-Car MIPI DSI/CSI-2 TX

I have browsed both patches. Both looks good:

Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

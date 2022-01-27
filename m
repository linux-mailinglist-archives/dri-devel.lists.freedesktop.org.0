Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCB149DB0D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 07:56:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6332E10E216;
	Thu, 27 Jan 2022 06:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFEA210E216;
 Thu, 27 Jan 2022 06:56:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E84596195B;
 Thu, 27 Jan 2022 06:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F01C340E4;
 Thu, 27 Jan 2022 06:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1643266574;
 bh=Bk/ODDsDukInU2AbtJrdGihYhKViotZzVIRZSDiAAZQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a2ULnNAWI/jgz5yl4AbaijDYmReI+YvOOHvJ9bILRbSw79Kdiquxyni1VMUpSii43
 5Ba58KaDGsuBRVxdGfhw9BgDItq/OCdIWCu4Vg1F7olfy8Cyuz6dNJ1LpW5uqOzkVt
 FmyBtUkiymestYCsswyzCXqrCvp3d7Lv4It48uC4=
Date: Thu, 27 Jan 2022 07:56:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: tangmeng <tangmeng@uniontech.com>
Subject: Re: [PATCH] drivers: Fix typo in comment
Message-ID: <YfJCBZuc9mOZkIVJ@kroah.com>
References: <20220127065156.22372-1-tangmeng@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220127065156.22372-1-tangmeng@uniontech.com>
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
Cc: Peter.Chen@nxp.com, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, jsarha@ti.com, tomi.valkeinen@ti.com,
 linux@dominikbrodowski.net, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 27, 2022 at 02:51:56PM +0800, tangmeng wrote:
> Replace disbale with disable and replace unavaibale with unavailable.
> 
> Signed-off-by: tangmeng <tangmeng@uniontech.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c | 2 +-
>  drivers/gpu/drm/tilcdc/tilcdc_crtc.c  | 2 +-
>  drivers/pcmcia/rsrc_nonstatic.c       | 2 +-
>  drivers/usb/chipidea/udc.c            | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

This needs to be broken up per-subsystem, thanks.

greg k-h

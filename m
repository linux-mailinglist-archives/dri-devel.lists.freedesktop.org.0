Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1AE3B95C1
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 19:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2CE6E090;
	Thu,  1 Jul 2021 17:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5086E090
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jul 2021 17:58:34 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id f31df702-da95-11eb-8d1a-0050568cd888;
 Thu, 01 Jul 2021 17:58:32 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id DEDCD194B25;
 Thu,  1 Jul 2021 19:58:35 +0200 (CEST)
Date: Thu, 1 Jul 2021 19:58:29 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/4] mgag200: Various cleanups
Message-ID: <YN4CRegcRH0B1iQF@ravnborg.org>
References: <20210701124316.20818-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210701124316.20818-1-tzimmermann@suse.de>
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, Jul 01, 2021 at 02:43:12PM +0200, Thomas Zimmermann wrote:
> Cleanup several nits in the driver's init code. Also move constant
> data into the RO data segment. No functional changes.
> 
> Tested on mgag200 HW.
> 
> Thomas Zimmermann (4):
>   drm/mgag200: Don't pass flags to drm_dev_register()
>   drm/mgag200: Inline mgag200_device_init()
This patch drop a redundant error message too - it had helped me if the
changelog had said so but whatever.

>   drm/mgag200: Extract device type and flags in mgag200_pci_probe()
>   drm/mgag200: Constify LUT for programming bpp

Full serie is:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

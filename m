Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF09F3E3488
	for <lists+dri-devel@lfdr.de>; Sat,  7 Aug 2021 11:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6204C6E02F;
	Sat,  7 Aug 2021 09:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7EB6E02F
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Aug 2021 09:57:03 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id da9e078d-f765-11eb-8d1a-0050568cd888;
 Sat, 07 Aug 2021 09:57:19 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 04CDF194B7A;
 Sat,  7 Aug 2021 11:57:28 +0200 (CEST)
Date: Sat, 7 Aug 2021 11:56:59 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: lichenyang <lichenyang@loongson.cn>
Cc: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, devel@linuxdriverproject.org,
 Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH v4 3/3] drm/loongson: Add interrupt driver for LS7A
Message-ID: <YQ5Y650wDABR5TAV@ravnborg.org>
References: <20210730094148.620768-1-lichenyang@loongson.cn>
 <20210730094148.620768-3-lichenyang@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210730094148.620768-3-lichenyang@loongson.cn>
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

Hi lichenyang,

On Fri, Jul 30, 2021 at 05:41:48PM +0800, lichenyang wrote:
> Add LS7A DC vsync interrupt enable and close function, and
> register irq_handler function interface.
> Add vbrank event processing flow.
s/vbrank/vblank/

> 
> v4:
> - Replace drm_irq_install with devm_request_irq.
> - Delete the irq_ hooks in drm_driver.
> 
> v3:
> - Improve code readability.
> - Use the to_pci_dev function to get pci_dev.
> 
> v2:
> - Added error handling in the loongson_drm_load function.
> 
> Signed-off-by: lichenyang <lichenyang@loongson.cn>

Patch looks good,
Acked-by: Sam Ravnborg <sam@ravnborg.org>

But then I am not to fluent in the vblank stuff, so I hope someone else
takes a look too.

	Sam

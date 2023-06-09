Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C05E67297A5
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 12:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F4610E686;
	Fri,  9 Jun 2023 10:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9786910E686
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 10:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686308300; x=1717844300;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Y/9a0qn7tpNUqjJyOxwy7IcW0I8NcZIt00i1UFzCLaQ=;
 b=XSSE/NMqJa23BTHYfCv3HwiWSaRHGfp0iwffXWK4cYB6SCP8ANxKXYEb
 whMlyFAFXtB1cXYP/+66vwe2Pc6hl8ycBmH0pA+7WZC3VZASruKRVy/vL
 zGbivmMURZzQyBe0kflOQtPVuMohptsZKzE+OFWz0lSTb0Zg4Br2YiHIl
 /3J5K3ZQnHvXjXJq1AhzdANDaHMQV15CVJ1j0tydKrhPczPjubiymdzzn
 ceOwL8LW4w/0yWQjQqSc6INdjuv8pONTdhwZPMwQeW11mgNgbRSw4bAEk
 0FEimZ3KGBFYqrhFAk22Rcm6PDQgcTmDVyEv3FnZaeL10XauUE7HtDXXQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="385930418"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="385930418"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 03:58:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="660730640"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="660730640"
Received: from skolhe-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.58.254])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 03:58:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Bjorn Helgaas
 <bhelgaas@google.com>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 4/4] PCI/VGA: Replace full MIT license text with SPDX
 identifier
In-Reply-To: <20230609103321.629192-4-suijingfeng@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230609103321.629192-1-suijingfeng@loongson.cn>
 <20230609103321.629192-4-suijingfeng@loongson.cn>
Date: Fri, 09 Jun 2023 13:58:12 +0300
Message-ID: <87cz24rjgb.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 09 Jun 2023, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
> Per Documentation/process/license-rules.rst, the SPDX MIT identifier is
> equivalent to including the entire MIT license text from
> LICENSES/preferred/MIT.
>
> Replace the MIT license text with the equivalent SPDX identifier.
>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  include/linux/vgaarb.h | 30 +-----------------------------
>  1 file changed, 1 insertion(+), 29 deletions(-)
>
> diff --git a/include/linux/vgaarb.h b/include/linux/vgaarb.h
> index 6d5465f8c3f2..341245205e1c 100644
> --- a/include/linux/vgaarb.h
> +++ b/include/linux/vgaarb.h
> @@ -1,32 +1,4 @@
> -/*
> - * The VGA aribiter manages VGA space routing and VGA resource decode to
> - * allow multiple VGA devices to be used in a system in a safe way.

Why is this being removed?

> - *
> - * (C) Copyright 2005 Benjamin Herrenschmidt <benh@kernel.crashing.org>
> - * (C) Copyright 2007 Paulo R. Zanoni <przanoni@gmail.com>
> - * (C) Copyright 2007, 2009 Tiago Vignatti <vignatti@freedesktop.org>

Replacing the license text with SPDX is fine, removing copyright notices
is not.

BR,
Jani.

> - *
> - * Permission is hereby granted, free of charge, to any person obtaining a
> - * copy of this software and associated documentation files (the "Software"),
> - * to deal in the Software without restriction, including without limitation
> - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice (including the next
> - * paragraph) shall be included in all copies or substantial portions of the
> - * Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> - * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> - * DEALINGS
> - * IN THE SOFTWARE.
> - *
> - */
> +/* SPDX-License-Identifier: MIT */
>  
>  #ifndef LINUX_VGA_H
>  #define LINUX_VGA_H

-- 
Jani Nikula, Intel Open Source Graphics Center

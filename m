Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8602C7AFED8
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 10:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D8A10E4AC;
	Wed, 27 Sep 2023 08:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DB510E4AC;
 Wed, 27 Sep 2023 08:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695804278; x=1727340278;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nCQHU0j5T6TTt7CzuiGsPXGRGtfBx6X+3EombfgcTVU=;
 b=dp04qpfln/2J6ev8s8+mu+78AtfQmw1qjVTftYb/qakpmJ045Jig3u5J
 nFbx2WJPv6yAb6I0Z8SO4+jrKGeUAgXybxbkHv3UFglk5coFwRJc28SSP
 RhByAsiqTahFwP0XCHC4uOUevjQTgbdHgucnQQgym31Svgv1pIiPe15Sp
 /dtxKRC0NPWvROOQfGTsaWXWJ6GqN5BJDlvCPLWe20wCf6dxaEuW3lAmK
 7POQfGa1h16P8Y+XBttCxGIv1AkP5gs58DxQHnfyd9gc5mBbeVBBpSC3K
 KY1G7q5C2w+w6Z4hfXQrD6BvsDKDvxFDPAB+oweXBH3goCw75I1HfC+FY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="448261892"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="448261892"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 01:44:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="698784369"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="698784369"
Received: from yeehernc-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.214.173.104])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 01:44:33 -0700
Date: Wed, 27 Sep 2023 10:44:27 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v3] drm/i915/mtl: Skip MCR ops for ring fault register
Message-ID: <ZRPra9PcF/JZOIo8@ashyti-mobl2.lan>
References: <20230927082430.4609-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927082430.4609-1-nirmoy.das@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 andi.shyti@linux.intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

On Wed, Sep 27, 2023 at 10:24:30AM +0200, Nirmoy Das wrote:
> On MTL GEN12_RING_FAULT_REG is not replicated so don't
> do mcr based operation for this register.
> 
> v2: use MEDIA_VER() instead of GRAPHICS_VER()(Matt).
> v3: s/"MEDIA_VER(i915) == 13"/"MEDIA_VER(i915) >= 13"(Matt)
>     improve comment.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D3C6E77F2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 13:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA6710E93C;
	Wed, 19 Apr 2023 11:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1447C10E937;
 Wed, 19 Apr 2023 11:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681902146; x=1713438146;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Gk8sVFnvzFvviA4MZfU8j7e57ep+Jn1XInNzYGxHYKk=;
 b=fwDTsdN3CY+l9iF2rXXGStNuSd4/pq/mZPo3FHAgR7+xbbSeT+H+pUYi
 Z9p2IQpWHtvvefFtk/LWahOQoab8ffiVC4+8WWs+SOI62UQ5YShS230AZ
 tw/u59ubVyc9YJaYm9gPaq1AvYc3XBvD5mA+XI+Gj5YoWGn1bPTaMPOhh
 kRz7QFKt2wPvXsRwSm6wWWOmHttDbtm5edPIe42zBdh4VSLkV3HaVSFwE
 cL2miT7TlD0U05UPr1++EZvITZZFSk+YJ91E33t8LyUSASr97DQZERnF1
 E9Mg5RgNQXd1Ic7/0Ne94SyNBCLe5DO5zl58qH0KfwP8WN21vjx/vSbwP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="344165210"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="344165210"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 04:02:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="760708967"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="760708967"
Received: from crijnder-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.35.137])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 04:02:17 -0700
Date: Wed, 19 Apr 2023 13:02:14 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: fei.yang@intel.com
Subject: Re: [Intel-gfx] [PATCH 3/8] drm/i915/mtl: Add PTE encode function
Message-ID: <ZD/KNrgSafGDHhO5@ashyti-mobl2.lan>
References: <20230417062503.1884465-1-fei.yang@intel.com>
 <20230417062503.1884465-4-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417062503.1884465-4-fei.yang@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fei,

On Sun, Apr 16, 2023 at 11:24:58PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> PTE encode functions are platform dependent. This patch implements
> PTE functions for MTL, and ensures the correct PTE encode function
> is used by calling pte_encode function pointer instead of the
> hardcoded gen8 version of PTE encode.
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi

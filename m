Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F077C53B5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 14:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4293910E775;
	Wed, 11 Oct 2023 12:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD27D10E775;
 Wed, 11 Oct 2023 12:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697026977; x=1728562977;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ukyM1nyUD8h4FqTTfVPlu/qrLCSFGeo5UO8ELRbaF1c=;
 b=grMj+BQtwqdIE8ZDCdphk44qSQpgVJiuuaSdPqm1TS8pkY5Mcngl/dNB
 stlOT89o9ODypJBnTfdCBXDC4JB6gp9XamP0aDcIscqF8VGZ+u9YTNDWN
 VqK2y1OWgQ+Oe/7jyFIOyGBecjJXiyBepI9gtt6uW4M9YDg4tBvjFz1Mi
 CbW2y3XsEM54PviF1cJY9nVu3baVAQWwAYrDilsqc9P4sZmsVv0pNNtmz
 kPdgrvODx5vjbSXc9h7lcCd0PDMYoqRx9fjrd1DFiwfpAfpLWWoW7zdgw
 Avk0a+Tl1KxMI5PnvSge+9MGHdQIxnP+xaVlmnkZP7lwELOvGuWhufOdi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="448846900"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="448846900"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:22:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="897610432"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="897610432"
Received: from lyemeeki-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.214.156.206])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:20:59 -0700
Date: Wed, 11 Oct 2023 14:22:39 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/i915: Prevent potential UAF in engine_init_common
Message-ID: <ZSaTj8aUqhOiTcmm@ashyti-mobl2.lan>
References: <20231011115451.12521-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011115451.12521-1-nirmoy.das@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Oak Zeng <oak.zeng@intel.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

On Wed, Oct 11, 2023 at 01:54:51PM +0200, Nirmoy Das wrote:
> If measure_breadcrumb_dw() returns an error and bce isn't created,
> this commit ensures that intel_engine_destroy_pinned_context()
> is not called with a NULL bce.
> 
> Fixes: b35274993680 ("drm/i915: Create a kernel context for GGTT updates")
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi

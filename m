Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E26825159
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 10:59:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB13710E5B1;
	Fri,  5 Jan 2024 09:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C68E10E5AA;
 Fri,  5 Jan 2024 09:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704448771; x=1735984771;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HjlX34w1V2FslTv+Mta2kyK6064Code/Qs0orxc14mA=;
 b=lma+e8DE1kMyb3Ns26Q5kdeVMej9Bpgm7HV0u3ovEd+xnvBEFajE7YWb
 tChtep7f6ohSe8ABLEDD0i5iGJk6AsY11zMcgUeBYHJWSp/UR9rS1dNzO
 mKN7fO/g6wKHMPeLspkVkDaOdjXQEN6tDmW4Nmaup4v8AOeW0AQsuD6Fi
 Xrjhi1UMDhlBCSdxAyJjOEPkXrJ83TwlNwC2Q5ZQjOs/dpZG4iJThizZy
 OuddzZYrSkEdNGoog0iWm11nXBDi1W0cfOw4DgH6/wBs5wm64EJ+f0462
 gVSduTr1+mrBK/XJiR/azBqN3FroQw7HgdH6OwAbEOWRZWpYLp9pa1p9X w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4845605"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="4845605"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 01:59:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="871200923"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="871200923"
Received: from ftrahe-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.36.116])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 01:59:28 -0800
Date: Fri, 5 Jan 2024 10:59:23 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 1/3] drm/nouveau: include drm/drm_edid.h only where needed
Message-ID: <ZZfS-7VhgdcFV7bm@ashyti-mobl2.lan>
References: <20240104201632.1100753-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104201632.1100753-1-jani.nikula@intel.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

On Thu, Jan 04, 2024 at 10:16:30PM +0200, Jani Nikula wrote:
> Including drm_edid.h from nouveau_connector.h causes the rebuild of 15
> files when drm_edid.h is modified, while there are only a few files that
> actually need to include drm_edid.h.
> 
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi

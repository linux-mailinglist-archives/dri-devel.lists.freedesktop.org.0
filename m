Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3089D6D7C04
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 13:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F3210E081;
	Wed,  5 Apr 2023 11:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A5E10E063;
 Wed,  5 Apr 2023 11:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680695656; x=1712231656;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=v/UAYt6FgclzXPn6Zci7OWqTRMzuEHiCE/B94BvYIe0=;
 b=BwvXKDSbWdbJM85kCzV/XPZ6r2LqhCG27IJplJwHPZyd8x0yfQapa85j
 DTb+Yxi1FkhjGAjofoo4eRNzavDVovpKc8kV8io5+9K/+S/k6uq50K+bV
 TJovO5X2YXZv8i3q6owZEMhv5E4Qayo7B2sAesbY4tYlEridrm2BmHq2n
 +MS5BYQ/qGfC9UTB8A4MI1noUYRI8OB0HRnuvrobWc/0S/H3+2VBYqS3a
 R+MA7UuWwMowOPBiYq4fR0SD2l0+T4+2xfmQgo3fwptqv2bYFlfa4rrLG
 NqBljPNmVcD5zbUsauzaRma3LTXBqiWBq0ybEPBAvER3CPIf/QOIuOOjP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="331032103"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="331032103"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 04:54:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="776030352"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="776030352"
Received: from amadden-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.53.144])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 04:54:12 -0700
Date: Wed, 5 Apr 2023 13:53:45 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
Subject: Re: [PATCH 1/5] drm/i915/ttm: Add I915_BO_PREALLOC
Message-ID: <ZC1hSRRKyU92kQ86@ashyti-mobl2.lan>
References: <20230404143100.10452-1-nirmoy.das@intel.com>
 <ZCxO9WeZHvINgMP8@ashyti-mobl2.lan>
 <6131a80c-a23c-ee17-3144-327b66f636bf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6131a80c-a23c-ee17-3144-327b66f636bf@linux.intel.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

> > > Add a mechanism to keep existing data when creating
> > > a ttm object with I915_BO_ALLOC_USER flag.
> > why do we need this mechanism? What was the logic behind? These
> > are all questions people might have when checking this commit.
> > Please be a bit more explicative.
> 
> 
> Agree, the commit message is bit short. I will add more content in next
> revision.

you don't need to send a new version just for this commit log.

You could just propose a new commit log in the reply and if it's
OK, add it before pushing it.

As you wish.

Andi

> > 
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> > > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > Cc: Imre Deak <imre.deak@intel.com>
> > > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> 
> Thanks,
> 
> Nirmoy
> 
> > 
> > Thanks,
> > Andi

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFA53D1A56
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 01:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1D96E21C;
	Wed, 21 Jul 2021 23:17:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB6F6E201;
 Wed, 21 Jul 2021 23:17:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="297094683"
X-IronPort-AV: E=Sophos;i="5.84,259,1620716400"; d="scan'208";a="297094683"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 16:17:24 -0700
X-IronPort-AV: E=Sophos;i="5.84,259,1620716400"; d="scan'208";a="415707564"
Received: from vaganesh-mobl2.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.84.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 16:17:23 -0700
Date: Wed, 21 Jul 2021 16:17:22 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 2/4] drm/i915/gt: nuke unused legacy engine hw_id
Message-ID: <20210721231722.h7nsmh6qz5u5khp5@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210720232014.3302645-1-lucas.demarchi@intel.com>
 <20210720232014.3302645-3-lucas.demarchi@intel.com>
 <20210721224722.GM4174536@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210721224722.GM4174536@mdroper-desk1.amr.corp.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>, dri-devel@lists.freedesktop.org,
 John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 03:47:22PM -0700, Matt Roper wrote:
>On Tue, Jul 20, 2021 at 04:20:12PM -0700, Lucas De Marchi wrote:
>> The engine hw_id is only used by RING_FAULT_REG(), which is not used
>> since GRAPHICS_VER == 8. We tend to keep adding new defines just to be
>> consistent, but let's try to remove them and let them defined to 0 when
>> not used.
>
>s/when not used/for engines that only exist on gen8+ platforms/
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>
>For historical reference, we did use hw_id on gen8+ platforms too until
>relatively recently --- it was used to set the engine's guc_id as well
>up until:
>
>        commit c784e5249e773689e38d2bc1749f08b986621a26
>        Author: John Harrison <John.C.Harrison@Intel.com>
>        Date:   Wed Oct 28 07:58:24 2020 -0700
>
>            drm/i915/guc: Update to use firmware v49.0.1

thanks for digging this, I will add that to the commit message as well.

Lucas De Marchi

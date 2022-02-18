Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB504BC27B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 23:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268BD10E11F;
	Fri, 18 Feb 2022 22:15:30 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21C210E11F;
 Fri, 18 Feb 2022 22:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645222528; x=1676758528;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eEHJpMfd/KtHlAJYGq8E687leIBrBd8vMRQ0v1dUsRM=;
 b=HHJocxYe+R4OtWXUpTsn4RWB7oyfop+W+NpZkbt3BL2n1iRhvsUdzp8v
 5VohwE5K+VW8UwFsbLWIiYYrXt5ov48vYBy77a9mnOGph27lz0HpjQi5Z
 GDEz46d2nWV0n+ImqKfvbv1l8PUc0pBv+pvLvUCJUmeHB7SGtYNl4UHmj
 klMViiK8jJhWpcV5qr6ioo5GFYMZdOA3hfsyRViK9b10FtMeEUMQVnzkX
 tUsiD8hFI1c/I9A2ceojuNlcyQ7xWlTMHJpIO8sStFVJsOLS4fIMfHJf2
 EMD8PKndRiTbDxPD6Nthf7BCjSfcF3fl7dLJo6qCeKyU8zeDXx2ujyDIh Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="234775419"
X-IronPort-AV: E=Sophos;i="5.88,380,1635231600"; d="scan'208";a="234775419"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 14:15:28 -0800
X-IronPort-AV: E=Sophos;i="5.88,380,1635231600"; d="scan'208";a="637903479"
Received: from svaddara-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.147.37])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 14:15:28 -0800
Date: Fri, 18 Feb 2022 14:15:29 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John.C.Harrison@intel.com
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/dg2: Define GuC firmware version
 for DG2
Message-ID: <20220218221529.2l5b5atwoxvw4odj@ldmartin-desk2>
References: <20220207203642.1875208-1-John.C.Harrison@Intel.com>
 <20220209071457.unbti4cfab4yqwig@ldmartin-desk2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220209071457.unbti4cfab4yqwig@ldmartin-desk2>
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
Cc: Intel-GFX@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Tomasz Mistat <tomasz.mistat@intel.com>, DRI-Devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Daniele, +Rodrigo

On Tue, Feb 08, 2022 at 11:14:57PM -0800, Lucas De Marchi wrote:
>On Mon, Feb 07, 2022 at 12:36:42PM -0800, John.C.Harrison@Intel.com wrote:
>>From: John Harrison <John.C.Harrison@Intel.com>
>>
>>First release of GuC for DG2.
>>
>>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>CC: Tomasz Mistat <tomasz.mistat@intel.com>
>>CC: Ramalingam C <ramalingam.c@intel.com>
>>CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

I rebased topic/core-for-CI on v5.17-rc4 that is where drm/drm-next is
based at and applied this patch there. Even after the rebase there was a
small conflict that I fixed up.

As talked with Daniele, we decided to merge this in the topic branch so
we can enable CI first and don't risk needing 2 versions sent to
linux-firmware if something doesn't work.

However I think we can't leave this patch there for a long time,
otherwise it will cause conflicts for things merging in
drm-intel-gt-next soon.

Daniele, while merging this I forgot to add the r-b you gave in the
other email thread, sorry. We can add it when this goes to the normal
non-topic branch.

thanks
Lucas De Marchi

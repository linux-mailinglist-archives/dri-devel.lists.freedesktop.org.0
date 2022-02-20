Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6384BCD7E
	for <lists+dri-devel@lfdr.de>; Sun, 20 Feb 2022 11:18:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5439210F9EC;
	Sun, 20 Feb 2022 10:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8053310F9EB;
 Sun, 20 Feb 2022 10:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645352316; x=1676888316;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/g8/eppV3DbILu3LGgiF4TLBIfB493/4+HVvDxhyXXk=;
 b=CBl4yYG5rx5+5EWIXtG8OOpNYMKX/d5bYIPO7L7bAyQZtxBC4TMgfkZb
 JGD0CQzS1C55npyLr56DbABldXsR9MTyADrJOdVU6GrssYKxPS6107uvG
 uO2MHIpXXgEx/P1Q3BXUiVVMSlZz42lLieWUy4DZ3a3IQkG5SdTmGLaP/
 0g+sxwDMVdTnp6+cuhEpv4e7JSF2GOWW5dmihZmBcrcBQdP0CKDgh46go
 QbE+BfyDUAIc84UlP80a2r2pL1S9RYoL25VnNJwCe6vjoovbJfAC6bJh5
 W5esXzzu+DZUBgHJhlc1e44NvEjSjuzCIlmkCT61WbLnheEyRm7iK5goo Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10263"; a="231331096"
X-IronPort-AV: E=Sophos;i="5.88,383,1635231600"; d="scan'208";a="231331096"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2022 02:18:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,383,1635231600"; d="scan'208";a="507282588"
Received: from josefseb-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.135.109])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2022 02:18:35 -0800
Date: Sun, 20 Feb 2022 02:18:40 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [Intel-gfx] [PATCH 00/15] drm/i915: Enable DG2
Message-ID: <20220220101840.ygf3s357y372v3fl@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220218184752.7524-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220218184752.7524-1-ramalingam.c@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 19, 2022 at 12:17:37AM +0530, Ramalingam C wrote:
>Enabling the Dg2 on drm/i915.
>
>This series adds support for 64k pagesize and documents the uapi
>impacts. And also adds basic flat-ccs enabling patches to
>support the local memory initialization and object creation. Kdoc is
>added to document the Flat-ccs support.
>
>Flat-ccs modifiers will be enabled in upcoming patches.
>
>Note:
>This is subset of https://patchwork.freedesktop.org/series/95686/ The
>remaining patches of the series will be pursued in subsequent series.
>
>And few patches are reviewed at and pulled from many series like
>https://patchwork.freedesktop.org/series/99119/
>https://patchwork.freedesktop.org/series/100373/
>https://patchwork.freedesktop.org/series/97544/
>

Patches 1-4 had already being applied from their own patch series.
Patch 15 still needs some changes

All the other patches were applied to drm-intel-gt-next.

thanks
Lucas De Marchi

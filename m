Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA19D479FEA
	for <lists+dri-devel@lfdr.de>; Sun, 19 Dec 2021 09:42:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4D711B667;
	Sun, 19 Dec 2021 08:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FFE11B667;
 Sun, 19 Dec 2021 08:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639903357; x=1671439357;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QcniZkywUltwlY2LA+p7cB0CdQbhL86PAAPvLmfXaxU=;
 b=FLAGCY1/262npYkJI9JJ0+Fo8rsR+hcqj6fhjzxNiKyB6bNy9s5laMHC
 fqBoYjhYauRxG7W+MoTWcCeSXFbGLCTVdFXIk3W7ucYSBOaJxr5l0fGaG
 SzOgkQ/BZxrG+GIIK3yCCjsYZZGQCdGMqSql2P6lwYfQ3v3LCAyIjkFrw
 o59KMrkMrExwdi2DjmCiv0/h1ZElBZL4FpECqTFJH7tVlPQdUOEpHrkkr
 5OWAyuX94wEFaUXt4or2AtWZipsrJPeJQ6rdA/q6u04RplzVcMKcMkMhV
 MNftWDdKurxdm7emuDtAo+HCLC+J1jCEYiPPNWFuSMAqvfvBFLpO5Z5tt w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10202"; a="239945835"
X-IronPort-AV: E=Sophos;i="5.88,217,1635231600"; d="scan'208";a="239945835"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 00:42:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,217,1635231600"; d="scan'208";a="546870384"
Received: from prgreen-mobl2.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.252.135.91])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 00:42:36 -0800
Date: Sun, 19 Dec 2021 00:42:44 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/i915: Fix possible uninitialized variable in
 parallel extension
Message-ID: <20211219084244.bzzouy3ud2xjtp5l@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20211219001909.24348-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20211219001909.24348-1-matthew.brost@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 john.c.harrison@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 18, 2021 at 04:19:09PM -0800, Matthew Brost wrote:
>'prev_engine' was declared inside the output loop and checked in the
>inner after at least 1 pass of either loop. The variable should be
>declared outside both loops as it needs to be persistent across the
>entire loop structure.
>
>Fixes: e5e32171a2cf ("drm/i915/guc: Connect UAPI to GuC multi-lrc interface")
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

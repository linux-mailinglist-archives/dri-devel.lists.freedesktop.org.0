Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DCF4AEAD6
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 08:15:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73B210E34C;
	Wed,  9 Feb 2022 07:15:00 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9371210E340;
 Wed,  9 Feb 2022 07:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644390898; x=1675926898;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZXRuCtd0pVY9vho1qcqpnEbUr8RIpQRwT7CoPLWRbYY=;
 b=bRPeREx8b/i87p4WsxbVfY2u20alovpDkGdFP28QeqFD151Ad40jssvJ
 u//hiQ/Vfasv4pmxDLnI7LQmVRwqQ58lF6so6p0y1CvgknFlf4OnOEF6W
 3KaSl/w9MaQYtR/w/1iAmKXiO7dflw1LIB+Li5Hg327D1JJbAkPpNLKmQ
 nw6wBdleQQ89MCmWNkoo3ulop+JOsqVYJ9Hhj1eSNSoHyXZsEcMDi8o5X
 wYm1dcJ/M+aOJYTqllB83Swnd6nOXJcqm3M9V8nKSkgRkCJ1Hlz/t9mwP
 dFnTacG3Na7kOOJIZ/VaibopBqlIbIotZL/DBDcQP5lNzGg1kEU8w0xC1 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="249348417"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="249348417"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 23:14:58 -0800
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="701158026"
Received: from ymtarple-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.231.100])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 23:14:57 -0800
Date: Tue, 8 Feb 2022 23:14:57 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John.C.Harrison@intel.com
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/dg2: Define GuC firmware version
 for DG2
Message-ID: <20220209071457.unbti4cfab4yqwig@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220207203642.1875208-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220207203642.1875208-1-John.C.Harrison@Intel.com>
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
Cc: Intel-GFX@lists.freedesktop.org, Tomasz Mistat <tomasz.mistat@intel.com>,
 DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 07, 2022 at 12:36:42PM -0800, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>First release of GuC for DG2.
>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>CC: Tomasz Mistat <tomasz.mistat@intel.com>
>CC: Ramalingam C <ramalingam.c@intel.com>
>CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>index ba4f0970749b..efe0a6dcf9f7 100644
>--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>@@ -50,6 +50,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>  * firmware as TGL.
>  */
> #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
>+	fw_def(DG2,          0, guc_def(dg2,  69, 0, 3)) \
> 	fw_def(ALDERLAKE_P,  0, guc_def(adlp, 69, 0, 3)) \
> 	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  69, 0, 3)) \
> 	fw_def(DG1,          0, guc_def(dg1,  69, 0, 3)) \
>-- 
>2.25.1
>

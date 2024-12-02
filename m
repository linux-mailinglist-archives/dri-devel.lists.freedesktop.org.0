Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CDC9E024F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 13:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A90310E71A;
	Mon,  2 Dec 2024 12:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vn7XudYx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B95F10E233;
 Mon,  2 Dec 2024 12:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733143071; x=1764679071;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ARKLpIAay3bQuxA4zbv+Arha7ipdlCnvbxj0E1vNXQc=;
 b=Vn7XudYxH5T/x9VuLd8IfLPdybc2f086sGMPBWb53TYJCMYdo1wdvo+/
 LFbyrTfQfb7FXBivRiP4VzIx+l4wwBrv/qPZp3L5C8fzG/ekJOrix9dFz
 xSfF3zqtHHRnmx6bEzZ/UP9ip1Uvne5VlWT5DmUOpjRVAc3SbKP123v7J
 vTmCvJBga9Mnzv9pKvjinqrR7P6T7kxkiVeOw1CtACbYS+mcLJnsjg4yw
 2XXVmEL7ArbPBl06GlbyNuU24tne/8wehjNvOOKuLmK4jBOVkodsQZ7DH
 wA/3muIUvQ++rqYaVTuCWmvFl+vT+u1cNWQ+UP6shWInI3VKK1jK47VS+ w==;
X-CSE-ConnectionGUID: Xkc2nB8+SyOWreQkiqnQDg==
X-CSE-MsgGUID: frNr9R8RR0eNA6fhHKIbLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="32659344"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="32659344"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 04:37:51 -0800
X-CSE-ConnectionGUID: C64NirJMT9O8X0ECcriAUA==
X-CSE-MsgGUID: /2R3qX93TmC04yilOlu4Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="97525259"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.72])
 ([10.245.246.72])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 04:37:49 -0800
Message-ID: <45e985a890164b388ed4c2f431f51a49b79d24f3.camel@linux.intel.com>
Subject: Re: [PATCH v2 27/29] drm/xe: Add modparam for SVM notifier size
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Mon, 02 Dec 2024 13:37:46 +0100
In-Reply-To: <20241016032518.539495-28-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-28-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
> Useful to experiment with notifier size and how it affects
> performance.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_module.h | 1 +
> =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0 | 5 +++--
> =C2=A02 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_module.h
> b/drivers/gpu/drm/xe/xe_module.h
> index 161a5e6f717f..5a3bfea8b7b4 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -22,6 +22,7 @@ struct xe_modparam {
> =C2=A0	unsigned int max_vfs;
> =C2=A0#endif
> =C2=A0	int wedged_mode;
> +	u32 svm_notifier_size;

Hmm. Shouldn't this be assigned and documented somewhere?

Thanks,
Thomas



> =C2=A0};
> =C2=A0
> =C2=A0extern struct xe_modparam xe_modparam;
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index acf2a3750f38..16e34aaead79 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -8,6 +8,7 @@
> =C2=A0#include "xe_bo.h"
> =C2=A0#include "xe_gt_tlb_invalidation.h"
> =C2=A0#include "xe_migrate.h"
> +#include "xe_module.h"
> =C2=A0#include "xe_pt.h"
> =C2=A0#include "xe_svm.h"
> =C2=A0#include "xe_ttm_vram_mgr.h"
> @@ -573,8 +574,8 @@ int xe_svm_init(struct xe_vm *vm)
> =C2=A0
> =C2=A0	return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe-
> >drm,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current->mm, xe_svm_devm_ow=
ner(vm-
> >xe), 0,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm->size, SZ_512M, &gpusvm_ops,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fault_chunk_sizes,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm->size,
> xe_modparam.svm_notifier_size * SZ_1M,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gpusvm_ops, fault_chunk_sizes,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(fault_chunk_size=
s));
> =C2=A0}
> =C2=A0


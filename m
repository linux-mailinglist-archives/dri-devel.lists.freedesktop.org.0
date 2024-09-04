Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF2496B497
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 10:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7001210E6CA;
	Wed,  4 Sep 2024 08:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yt9sv7Z/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600F310E6C7
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 08:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725438784; x=1756974784;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=iOYAUBD2y9gZQIMZdJ5vEofNuQHzdvaQcEvsA5fGL84=;
 b=Yt9sv7Z/mG1/mCr6oImf352Ywe/75yDTI7S4i/p6kk8MPSBVGZCNtPuL
 lDpg3L35KkklRqhgf/kwwt8c9KGyNdoBFVLILpM+bqIu7iUj1ti0dnBTo
 FOyYJ+naj2E2rLntE5hpKZiByLWq0Zu5kzF4ceuPepozhaSEhUeFMJq5t
 /fyiARmCVmFhPnu2jE7EqBMs4MxWHfi/o1oTWD8SN3JPdiPbjJ1GkMD24
 Yp6zkLdEdzoqvKzLgio2gEBaCA3t6YFjpnhDF1a+lpuX9HZWE9TKt86cf
 GbfCbgJ+S0+/Q9PQ4vCjAy+fo5uDdmZsaat6YiDV1Bp3VRmU/tXXqgBuk g==;
X-CSE-ConnectionGUID: h6KCjUTSRQG0zzNKxJQ/yw==
X-CSE-MsgGUID: M1S0+lWmQPOiqLWEdCEpJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24226261"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="24226261"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 01:33:00 -0700
X-CSE-ConnectionGUID: v/OvOs6GT4yHY26LKZRu9A==
X-CSE-MsgGUID: 6O/Qx3SjTZCqyoNfIkZdnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="65020818"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.18])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 01:32:58 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?=
 <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: 'Daniel Vetter' <daniel.vetter@intel.com>
Subject: RE: [PATCH 0/6] drm: conversions to struct drm_edid
In-Reply-To: <0f9201dafe71$26575c70$73061550$@samsung.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1724348429.git.jani.nikula@intel.com>
 <CGME20240829114451epcas1p210a2b23c559da109b9186cf71e3b998b@epcas1p2.samsung.com>
 <87ttf3wo2e.fsf@intel.com> <0f9201dafe71$26575c70$73061550$@samsung.com>
Date: Wed, 04 Sep 2024 11:32:41 +0300
Message-ID: <8734mfu8d2.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 04 Sep 2024, =EB=8C=80=EC=9D=B8=EA=B8=B0/Tizen Platform Lab(SR)/=EC=
=82=BC=EC=84=B1=EC=A0=84=EC=9E=90	<inki.dae@samsung.com> wrote:
>> >   drm/exynos: hdmi: use display_info for printing display dimensions
>> >   drm/exynos: hdmi: convert to struct drm_edid
>>=20
>> I'll wait for Inki to check these.
>
> You could push them to drm-misc-next.
>
> Acked-by : Inki Dae <inki.dae@samsung.com>

Thanks, pushed.

BR,
Jani.


--=20
Jani Nikula, Intel

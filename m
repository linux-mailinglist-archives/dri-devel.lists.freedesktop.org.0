Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 452A9A2C0B2
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 11:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B85310EAA8;
	Fri,  7 Feb 2025 10:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KXvtn0zJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0510210EA9E;
 Fri,  7 Feb 2025 10:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738924622; x=1770460622;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=0I3afZAbatYGQAZDOAU3nrQPHfoBlMWH0a+5Xt59WFM=;
 b=KXvtn0zJ8QvTlna0J8Tvc54GBrChbMTKR1sOquJFO4YLh+4vCudSZAP+
 gyp2SNIEuaUnRM1asSuJfmkWBGLqcaC7WzUCBzDCsMXInIEg6ZVDoDU0H
 gVGN3l8v0Ke/BtHg2Ic0BaeoVjlVE3zT2x3BNMCQG4pm2/bt8Rz8bR54Y
 QfqHDHRYkHcweTZrA66je87JvkASgQxQnM6SDImTGeLlXm6Xw34EQecKR
 8HGxrZWxb1g9BzosLwXHy+NeKjcRXe2NrLGX7WRDlGHZUiXAoM1carOmM
 jzd/GTTIROocW8Eaeuls1Vl61SbEMvCMw0jQzTbN/SIm9cwBpFHBvcIQz Q==;
X-CSE-ConnectionGUID: U8FXgDFbRbyOgShaSoUmBA==
X-CSE-MsgGUID: l7x87cX4QFmq7uYZwygthw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="57097825"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="57097825"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 02:37:00 -0800
X-CSE-ConnectionGUID: Xcq3ceB6TdC9lvOrvZZXeA==
X-CSE-MsgGUID: FgwAKu+QRIWqFXWGV4Yo0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="111413219"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.108])
 ([10.245.246.108])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 02:36:57 -0800
Message-ID: <b5f266dbc938ad38afa382a253d854ec213aee15.camel@linux.intel.com>
Subject: Re: [PATCH v4 13/33] drm/gpuvm: Add DRM_GPUVA_OP_DRIVER
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Fri, 07 Feb 2025 11:36:55 +0100
In-Reply-To: <20250129195212.745731-14-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-14-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Wed, 2025-01-29 at 11:51 -0800, Matthew Brost wrote:
> Add DRM_GPUVA_OP_DRIVER which allows driver to define their own gpuvm
> ops. Useful for driver created ops which can be passed into the bind
> software pipeline.
>=20
> v3:
> =C2=A0- s/DRM_GPUVA_OP_USER/DRM_GPUVA_OP_DRIVER (Thomas)
> =C2=A0- Better commit message (Thomas)
>=20
> Cc: Danilo Krummrich <dakr@redhat.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0include/drm/drm_gpuvm.h | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 00d4e43b76b6..2a9629377633 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -812,6 +812,11 @@ enum drm_gpuva_op_type {
> =C2=A0	 * @DRM_GPUVA_OP_PREFETCH: the prefetch op type
> =C2=A0	 */
> =C2=A0	DRM_GPUVA_OP_PREFETCH,
> +
> +	/**
> +	 * @DRM_GPUVA_OP_DRIVER: the driver defined op type
> +	 */
> +	DRM_GPUVA_OP_DRIVER,
> =C2=A0};
> =C2=A0
> =C2=A0/**


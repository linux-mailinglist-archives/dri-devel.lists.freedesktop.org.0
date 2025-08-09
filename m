Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ED5B1F3BC
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 11:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A74910E084;
	Sat,  9 Aug 2025 09:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HXYCwUuy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2411C10E084
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Aug 2025 09:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754731728; x=1786267728;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aAkYusCaRID1AGjneUrwfZLfgkYTPmgKmEgIlHNYs3k=;
 b=HXYCwUuyakCrKGDUnH2zvrHt+gcYJmRYvQseFVye5fQrTRLqzAOsz/Nr
 Dv8ggZ7hroTOM789W50I42pf7ZO6U1/SZPDG08B/2jRYj9Kwdrx3JpcFi
 fGDOClaJXDw1f0ZL8yKrGndgJTMc5qrWNcLg+XgHN6ZBYSlEqCoshi2LL
 TDP/qGmFUd2hL+e/wfQDthPMEv4Xhu3/ZevEP6t7Z4aaVNPhPdvqoGww0
 GW4pqiT6TTsw/TXGOABArXB5NL/uxV0ZTDwHust2tM/+NHtgSgQgLET/7
 ROsWbp7VMt/A5IhMRr3mXxd6GOTEC40ZToA9wCeAYDwhSrvW5ob3DYomt g==;
X-CSE-ConnectionGUID: 9U1e3U+GSzG4df//VQdcHw==
X-CSE-MsgGUID: PgSCy1oOSqC4cooTDdB9Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="56268032"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="56268032"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2025 02:28:47 -0700
X-CSE-ConnectionGUID: ct/GOhFeS4WM8Q3jwJvV5g==
X-CSE-MsgGUID: r1Z2fTKrRYGh6+MJP569fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="165923653"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.244.28])
 ([10.245.244.28])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2025 02:28:45 -0700
Message-ID: <d5b4ebb766d945556fd8b48541b713548265361a.camel@linux.intel.com>
Subject: Re: [PATCH] MAINTAINERS: entry for DRM GPUVM
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Danilo Krummrich <dakr@kernel.org>, boris.brezillon@collabora.com, 
 matthew.brost@intel.com, aliceryhl@google.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, 	airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org
Date: Sat, 09 Aug 2025 11:28:43 +0200
In-Reply-To: <20250808092432.461250-1-dakr@kernel.org>
References: <20250808092432.461250-1-dakr@kernel.org>
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

On Fri, 2025-08-08 at 11:20 +0200, Danilo Krummrich wrote:
> GPUVM deserves a bit more coordination, also given the upcoming Rust
> work for GPUVM, hence add a dedicated maintainers entry for DRM
> GPUVM.
>=20
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> @Boris: I think it'd be good to add you as well, but haven't heard
> back from you
> so far, hence I did not add you to the entry for now.
> ---
> =C2=A0MAINTAINERS | 11 +++++++++++
> =C2=A01 file changed, 11 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bd62ad58a47f..ea42a43851cf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8426,6 +8426,17 @@ T:	git
> https://gitlab.freedesktop.org/drm/misc/kernel.git
> =C2=A0F:	drivers/gpu/drm/scheduler/
> =C2=A0F:	include/drm/gpu_scheduler.h
> =C2=A0
> +DRM GPUVM
> +M:	Danilo Krummrich <dakr@kernel.org>
> +R:	Matthew Brost <matthew.brost@intel.com>
> +R:	Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

Acked-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> +R:	Alice Ryhl <aliceryhl@google.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	drivers/gpu/drm/drm_gpuvm.c
> +F:	include/drm/drm_gpuvm.h
> +
> =C2=A0DRM LOG
> =C2=A0M:	Jocelyn Falempe <jfalempe@redhat.com>
> =C2=A0M:	Javier Martinez Canillas <javierm@redhat.com>


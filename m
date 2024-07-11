Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D05C92F11E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 23:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB4410EBA9;
	Thu, 11 Jul 2024 21:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TzLJyBOx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0664B10EBA5;
 Thu, 11 Jul 2024 21:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720733347; x=1752269347;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=CP5MsGA9/Ak0PCIPSgg4gXnBcWgkr+xpoNSkRjEQMTg=;
 b=TzLJyBOxJrF54dvYI+3kOSA8NpyBLJHOYb7IiaLP5CJJQ5Lv+npGfx8o
 +rwjCeqRKkrOOcFVwBzpaPzBUwaHHypiaFsFBoMHmCuqqzEkIMFGVOS+o
 +ELM3ViAFkMFMd+7m+KjvP15gFNkoJ2M7hxdUbyRLQF/U1MK0jcaGqW6J
 vXo2Udrh2HqIwWVQZ0txwLzDkaNycILNoVarvqHbe/B0ZVctzqvauKAVo
 y4vrrJg8SzRNr/ZTYZDG/RPd1SGpWILQS4ycQSogC1GVN0M1CXgBIyp4y
 kzNJ4cMvJgr+J99g0/+uS9i99+36OMl28a02cOIv64ziDX6zjUpz5JVn5 A==;
X-CSE-ConnectionGUID: gJFaj6odSpiftSUeaaWs5g==
X-CSE-MsgGUID: K+U7BVrzRaO4HWfuyiNwrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="29561514"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="29561514"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 14:29:06 -0700
X-CSE-ConnectionGUID: yZhW1Vr+QPeF53Wp/Xyghw==
X-CSE-MsgGUID: PDrvg3+NQEuuPlBOZPH8NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="49355015"
Received: from unknown (HELO localhost) ([10.124.221.148])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 14:29:05 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Zo_3ustogPDVKZwu@intel.com>
References: <Zo_3ustogPDVKZwu@intel.com>
Subject: Re: [PULL] drm-xe-next-fixes v2
From: Jordan Justen <jordan.l.justen@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?utf-8?q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Thu, 11 Jul 2024 14:29:04 -0700
Message-ID: <172073334417.323134.379928595741854448@jljusten-skl>
User-Agent: alot/0.10
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

On 2024-07-11 08:18:18, Rodrigo Vivi wrote:
> Hi Dave and Sima,
>=20
> This is a v2 of https://lore.kernel.org/intel-xe/Zo2sO4t32dxqy6Q7@intel.c=
om/
>=20
> v2 - Removed Thomas' write-back caching mode patch since Lucas will propa=
gete
> that through drm-xe-fixes towards 6.10. So we remove the amount of patch
> duplication.
>=20
> Again, it is important to highlight the uapi rename present in this
> pull-request.
> Mesa is aligned and waiting to merge their side:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30027
>=20
> Since this uapi was recently merged, after we get both sides propagate
> there won't be any kernel or mesa releases with the old bad naming.
> So we should be good.

This looks to be a simple rename, and it appears that the binary
interface is functionally the same. So, even if there was a Mesa
release using the old header, it should function fine with the
interface to the kernel regardless of which header the kernel used.

If the binary interface had changed, I'm not sure an argument of "no
kernel or Mesa releases have happened" would be a good way to justify
such a change. Luckily that is not the case here anyway.

-Jordan

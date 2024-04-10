Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2713A89EFC0
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 12:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0382C10EA1D;
	Wed, 10 Apr 2024 10:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bPQQB1Lr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F47210E72A;
 Wed, 10 Apr 2024 10:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712744639; x=1744280639;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=JYYbL0DuJf42BX5Laumm0n1+OLwM4n1W9nrIVEKFKnU=;
 b=bPQQB1LrDPr/c8R9E57CJuMqbjrs1RP0zvdNsLyn5NzBJbsbrFHgg+YC
 fY+8SZAn+l6mDOldHc9WCa1IneCvFeonplHHZJGa9eoq6zH3uTfGw59zz
 YCSFAud+/8naKJ+GwJip95LYlQZDGSCWrzszco75PhlMpkN2X+MbL5AJH
 GCTAe6OyA1y9P+KlPExL1bUZi5O5DoJfgW1sUb6XDHzSXF2KCx/GkC76t
 GyINiC8e4bBOD6hfg7qyZxmOnZvyCz3Z+CnsA/8ncIG2iJdXHva1TFkT7
 l8+PLd5t8kOOgDKdrsaLIXR45StiB1fEnQv6zusDt2DjDxI7ejsn7GWBw Q==;
X-CSE-ConnectionGUID: Dq9LxVU0QKOJ+NueBM3Eyw==
X-CSE-MsgGUID: 18M7TKRoTEyv+duC/1YsxA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19525899"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="19525899"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:23:58 -0700
X-CSE-ConnectionGUID: n8RHCpHWREefHjp6j8kQ2Q==
X-CSE-MsgGUID: kzogPLSPQ7+MPZFCoNDFyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="51738402"
Received: from oakasatk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:23:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Dave
 Airlie <airlied@gmail.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 06/10] drm: move i915_drm.h under include/drm/intel
In-Reply-To: <c60a185e-2bc5-10b4-3770-adf811763ace@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1712743191.git.jani.nikula@intel.com>
 <63e199dec91cc2e717d81ab00e28f68b9bec8461.1712743191.git.jani.nikula@intel.com>
 <c60a185e-2bc5-10b4-3770-adf811763ace@linux.intel.com>
Date: Wed, 10 Apr 2024 13:23:51 +0300
Message-ID: <8734rt8qiw.fsf@intel.com>
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

On Wed, 10 Apr 2024, Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> wro=
te:
> Could you please also address the comment in=20
> drivers/gpu/drm/i915/intel_pci_config.h.

Ack.

--=20
Jani Nikula, Intel

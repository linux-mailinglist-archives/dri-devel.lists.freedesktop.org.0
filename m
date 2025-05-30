Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3834AC9704
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 23:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0853C10E0EB;
	Fri, 30 May 2025 21:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OT3HMOJq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FC110E0EB;
 Fri, 30 May 2025 21:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748640595; x=1780176595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qxI1nPBFXlDWYIyS/HG4wTUjFN4qu9niquR33w+8UDA=;
 b=OT3HMOJqel1tH/BMbKlHTmWsPLXzAXgKVakt0ta5nR7/t+L6uGruR8yL
 Wu8yD5A/492lNoQ/a8xPtwPdOTA48jhlXoR00/SWdzzMlRMVs+GFoQPN2
 L25J+X6/0zoYGSJPjhh3Ce7eIJoF5BwuvsrNKdrRPVkd4/0dKtYqGRGbp
 3vRMwNks5FPOHAn/9fC+9OD5OvfIf86enSauVMA8TUrQu3SrlrFJmSpsE
 Rl//s5NT6w7FnMsYgTuPfVACyFojouQ5UH5gNAsIEmJuQaAairEOY/zxP
 JLnQWk4/gGLfD+GUjA+2n45KsbwX25YQWbU5u/8crDCRxsDeG3cVmv1LX g==;
X-CSE-ConnectionGUID: h04vPi1STg+2wk3HEQWBSQ==
X-CSE-MsgGUID: uhukJ2UwSg6BbhCeMGMJpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50622406"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="50622406"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 14:29:42 -0700
X-CSE-ConnectionGUID: 2iHv+MqoRDG4W5BLYO86MA==
X-CSE-MsgGUID: H0fLElL3Rg+i1miU9qGqgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="144626145"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 14:29:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Imre Deak <imre.deak@intel.com>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency
Date: Fri, 30 May 2025 14:29:26 -0700
Message-ID: <174864052958.2498160.13310755033812764996.b4-ty@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250529172355.2395634-2-lucas.demarchi@intel.com>
References: <20250529172355.2395634-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Thu, 29 May 2025 10:23:56 -0700, Lucas De Marchi wrote:
> The XE driver can be built with or without VSEC support, but fails to link as
> built-in if vsec is in a loadable module:
> 
> x86_64-linux-ld: vmlinux.o: in function `xe_vsec_init':
> (.text+0x1e83e16): undefined reference to `intel_vsec_register'
> 
> The normal fix for this is to add a 'depends on INTEL_VSEC || !INTEL_VSEC',
> forcing XE to be a loadable module as well, but that causes a circular
> dependency:
> 
> [...]

Applied to drm-xe-next, thanks!

[1/1] drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency
      commit: e4931f8be347ec5f19df4d6d33aea37145378c42

Best regards,
-- 
Lucas De Marchi


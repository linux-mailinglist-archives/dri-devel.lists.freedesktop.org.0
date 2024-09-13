Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8847F977ECC
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 13:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC8F10ECE6;
	Fri, 13 Sep 2024 11:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IHZtZyfu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DEF110ECE6;
 Fri, 13 Sep 2024 11:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726227999; x=1757763999;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=NQ/XJKJw6VX45lIP74vRkm0sZw3EkjwPKBoaKwcXGbk=;
 b=IHZtZyfuWOv25ssW2g1zdryk0ocuuTvrmGa7GsYzDTYxw5xp4d1L2PRE
 r9NeBwdGtFgBhV670Sp8vwftWQB+birGUKTvJGt9c+b/o1oF4HVKx+8l0
 ASqdgK4C5P96Rs2CPKtD3L0LcGIXxc9eCh2CIa3T8nF35qzGIrNWNRToF
 KbEUTpVgMyq2Wr/7FEFbxrssxWTLjyNS4nSUm+CQ0MNdUtc5/N1dYlOEs
 KrlDEj7Lyj1EAXCr+dhxfZ4cbnzGnbwjTEjVLAk5kPn40TDUAykzzQnwO
 mUw5vSOJ/79MAU2yhj8u2lTMyUzf9htXLTZRnyvNNKegqIkPmkM9GjNw9 A==;
X-CSE-ConnectionGUID: xaxdNxCQQoSiHgQ7Kwt3iA==
X-CSE-MsgGUID: 3+8+MG5vSoW40vKzmB/6eQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25275803"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="25275803"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 04:46:38 -0700
X-CSE-ConnectionGUID: +sAzAMUnSpmydYwkCLSUFw==
X-CSE-MsgGUID: LQx44PnISGiHgYZudo4heA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="73024591"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.64])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 04:46:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, Nathan
 Chancellor <nathan@kernel.org>, Edmund Dea <edmund.j.dea@intel.com>
Subject: RE: [PATCH 3/8] drm/kmb: annotate
 set_test_mode_src_osc_freq_target_{low,hi}_bits() with __maybe_unused
In-Reply-To: <DS0PR11MB7903E49100A373DBE8085B608C9A2@DS0PR11MB7903.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1725962479.git.jani.nikula@intel.com>
 <29a83771edd9b85032095ed3ecc1e91a77229b90.1725962479.git.jani.nikula@intel.com>
 <DS0PR11MB7903E49100A373DBE8085B608C9A2@DS0PR11MB7903.namprd11.prod.outlook.com>
Date: Fri, 13 Sep 2024 14:46:31 +0300
Message-ID: <87ed5nepyg.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 10 Sep 2024, "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com> wrote:
> Thanks for the patch.
>
> Acked-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>

Thanks, pushed to drm-misc-next.

BR,
Jani.

-- 
Jani Nikula, Intel

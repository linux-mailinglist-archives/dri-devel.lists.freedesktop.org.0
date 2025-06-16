Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C30EADBBC0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 23:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A7B10E458;
	Mon, 16 Jun 2025 21:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cdb00pDS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D453010E456;
 Mon, 16 Jun 2025 21:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750108335; x=1781644335;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5+56n6iCGah+J5J1THxardWdkQW5y0Q6m7CqUjvqo4Q=;
 b=cdb00pDSe/sWfhANOnUz2gLEGpfsxOa8HjPXsBDUWWJUvdIDFGPVpxxW
 kbYqjSAvdLM7FBKXDGf/Db8nbQApYLLjkwIEHqCpopHNUCFgGJNvF9/eO
 rVrdm+QO4rxJLaNqm+GlULYZiwhsvEfe19JqH4ky2iO2j0v65clo9EiOt
 SYqgVQ5iX86AksiMwW3AD0Xo7KeELZ2yeCzwLwgFpMhQ2mZl5sTcaYFBM
 GJrpDsWRvUlPexqNqxiB4fWxm9MNIGlHAKmOG2LY9VONAN+yoCNKpOOgM
 iDms61dzgyKdbgWxQZXdUqrJFolfUTdkkWmV/z5nZOC32NGWWuOspqtiw g==;
X-CSE-ConnectionGUID: Cs2shbOjQTain90ghLcFnQ==
X-CSE-MsgGUID: kIwgpbbES3KopGwCLVMsyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52357121"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="52357121"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 14:12:14 -0700
X-CSE-ConnectionGUID: yIGwPChFQzy2fynZrtEXhw==
X-CSE-MsgGUID: jJxt0nnSS2qCBr/kKYidkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="185836499"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 14:12:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH] drm/xe: Fix kconfig prompt
Date: Mon, 16 Jun 2025 14:12:05 -0700
Message-ID: <175010586980.793159.14564871191427223017.b4-ty@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611-xe-kconfig-help-v1-1-8bcc6b47d11a@intel.com>
References: <20250611-xe-kconfig-help-v1-1-8bcc6b47d11a@intel.com>
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


On Wed, 11 Jun 2025 12:38:37 -0700, Lucas De Marchi wrote:
> The xe driver is the official driver for Intel Xe2 and later, while
> maintaining experimental support for earlier GPUs. Reword the help
> message accordingly.
> 
> 

Applied to drm-xe-next, thanks!

[1/1] drm/xe: Fix kconfig prompt
      commit: 1488a3089de3d0bcdc9532da7ce04cf0af9d7dd0

Best regards,
-- 
Lucas De Marchi


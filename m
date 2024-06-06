Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 167618FF583
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 21:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96EC310E1EB;
	Thu,  6 Jun 2024 19:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C75ANUD6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C941010E1B3;
 Thu,  6 Jun 2024 19:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717703784; x=1749239784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f2w1loseXdiTImA/ZCEopk9Jyuox9r4UfAp6Q3PqsFg=;
 b=C75ANUD6JiVCAs0ZQz6eKNF+aXBeib5E/7o+EVQ5XW41AU8eGaMs06uk
 j0sb60kGkZ9TqxN+Aefda1+d258LnQyq6FXswB7qaQcGjfZ9I/8SCUWH3
 7ULgq15INz78syj6PZ+KJ564St9JaUQYwuMUCT9VYziqHs4OVRrRjWuPZ
 tspZ3lh0h+Mf9A4FcjS0uEKPkGoi1dHDhe4OqEDHX2Wx+UarjVF0NB/KI
 683ftpZCCZEOe/egVko7d5wwz3k436KvVnUXoy56b/xXc+aaBe3gVA3lf
 TS/yAoxIspFMr4vDQHlMnbOn4P9PEJfynEpbudK56Zn1Qnxg2maaXtYDz A==;
X-CSE-ConnectionGUID: qI/+xqneQNWbGs9r+y25VQ==
X-CSE-MsgGUID: 1mBKx8FJSs2bsCeVCoUbSQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14284389"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="14284389"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 12:56:23 -0700
X-CSE-ConnectionGUID: jBPCrAyBR0KvMrVQ0aC2IQ==
X-CSE-MsgGUID: gGNvP3QdS36kVqXiWATEBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="37997796"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 12:56:23 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: Update Xe driver maintainers
Date: Thu,  6 Jun 2024 12:56:26 -0700
Message-ID: <171770371979.1979476.15412903037643543401.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240602190959.2981-1-thomas.hellstrom@linux.intel.com>
References: <20240602190959.2981-1-thomas.hellstrom@linux.intel.com>
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


On Sun, 02 Jun 2024 21:09:59 +0200, Thomas Hellström wrote:
> Add Rodrigo Vivi as an Xe driver maintainer.
> 
> v2:
> - Cc also Lucas De Marchi (Rodrigo vivi)
> - Remove a blank line in commit the commit message (Lucas De Marchi)
> 
> 
> [...]

Applied to drm-xe-fixes, thanks!

[1/1] MAINTAINERS: Update Xe driver maintainers
      commit: a9f9b30e1748252d158f78a0c0affdc949671dd1

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>

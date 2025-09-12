Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66403B552DF
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 17:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A5710E1D4;
	Fri, 12 Sep 2025 15:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mVK6ClYu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D2010E1D4;
 Fri, 12 Sep 2025 15:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757690062; x=1789226062;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a9qe+LHbirqabfrM9Gs5eq5bRTpFJpYES9tyi0moB+g=;
 b=mVK6ClYuzTpp6lbJY5Xf7VW0oNWPVn+jgBfpAINl+Q96h/heX5GB/KpI
 46+RCffiD25C+iLH93pF4s+AoztAPaxTxKhk7JrFg/8eyyl7+RoA5fhdJ
 K7wlr9xPsfmEmk0QWSsCOzd46EUdeSKy9Hic4yifrbQcxoQPupOvYjanx
 qmiD8eKqURCbQCR34ZQryvnZHAE2RVjtijATXY2T8GZiUImVSdlBA8kSJ
 mCoviKdOAwxSZqdP/G7EnzgNrYiM4taXaOKwdk6u7TsepXYMH36/GshW2
 zoCUZApCj8U9A5gS07e+Fh5h5oNtuST1aXArn4te6acoY/wC7dvDvDMIa g==;
X-CSE-ConnectionGUID: VXXxSazCQ3OtMldSDlPsQQ==
X-CSE-MsgGUID: XiKn7bQBSaiYoR+qnEp6VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="70719828"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="70719828"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 08:14:22 -0700
X-CSE-ConnectionGUID: 0sOzI8UDR8ijMYgneqEsiw==
X-CSE-MsgGUID: OxMbseyeQzeTAjrjbM7eEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="204980852"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 08:14:21 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Colin Ian King <colin.i.king@gmail.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/xe/guc: Fix spelling mistake "sheduling" ->
 "scheduling"
Date: Fri, 12 Sep 2025 08:14:05 -0700
Message-ID: <175769001571.553956.3595518895596464821.b4-ty@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250912074330.1275279-1-colin.i.king@gmail.com>
References: <20250912074330.1275279-1-colin.i.king@gmail.com>
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

On Fri, 12 Sep 2025 08:43:30 +0100, Colin Ian King wrote:
> There is a spelling mistake in a xe_gt_err error message. Fix it.
> 
> 

Merged to drm-xe-next, thanks!

[1/1] drm/xe/guc: Fix spelling mistake "sheduling" -> "scheduling"
      commit: 9e0b0fd5311ef68638abcd05306233b367c6b407

--
Lucas De Marchi

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A54118B3806
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 15:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C011123C5;
	Fri, 26 Apr 2024 13:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oBngwwrd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D091B1123C1;
 Fri, 26 Apr 2024 13:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714137092; x=1745673092;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/UFE2tDaNmf2j4moyUP8Rwbzpwd1yZuB0QRkfQ1nl7Y=;
 b=oBngwwrdkbaj+e35pOgN1cBd3NHWHua1FApE5/nmscP1WCwuXEOKOPTU
 Yix3ZlhcNoFnWEfTslou4O1EgIYZnh5jAE8Bo5qoECi/K64VLPjMgrr2q
 IVns8iBuab89bkP27H2Xt6K/USWceLfyAM18h4v8P6mfyZdoOCsb6qGyI
 x/ledXLGX4GK7D5e0iWXq6Vt3WWERy3aPt8TqNlj9axhwqjrRyT19B1of
 Wz1DY0eLMDKjiH9DolrGUYT/S2s7lEH9Lks05bHM8NpEdwjfl3+o/x6c6
 293nmySbJbTrrQqj1Zp6gERNWXu3N918i3qL2z8tyjGGGFV/HfadvooPg g==;
X-CSE-ConnectionGUID: 3jIJ8fFXTpOK02+8fpVa9A==
X-CSE-MsgGUID: fYTaSjsxQQCeaLNTCfa1Ow==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9796899"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9796899"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 06:11:32 -0700
X-CSE-ConnectionGUID: 7DirwTB3QyG176RdgkR2Sw==
X-CSE-MsgGUID: P+xVloUzRFyKGYA33/EkLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="25416985"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 06:11:30 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Colin Ian King <colin.i.king@gmail.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/xe: Fix spelling mistake "forcebly" ->
 "forcibly"
Date: Fri, 26 Apr 2024 06:11:51 -0700
Message-ID: <171413710466.3189116.492328462949220625.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240426094904.816033-1-colin.i.king@gmail.com>
References: <20240426094904.816033-1-colin.i.king@gmail.com>
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


On Fri, 26 Apr 2024 10:49:04 +0100, Colin Ian King wrote:
> There is a spelling mistake in a drm_dbg message. Fix it.
> 
> 

Applied, thanks!

[1/1] drm/xe: Fix spelling mistake "forcebly" -> "forcibly"
      (no commit info)

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>

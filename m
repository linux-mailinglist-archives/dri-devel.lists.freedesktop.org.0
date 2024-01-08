Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7F78275E3
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 17:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC3010E275;
	Mon,  8 Jan 2024 16:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2197010E24D;
 Mon,  8 Jan 2024 16:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704733113; x=1736269113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A8ikZedLxsY2xkH4LOd0AXUF915DXBEZW85jWrbwwQw=;
 b=cfMJjyP65VZaB7DQ8lWs5DDDywD2jEtVDxpgbhHD1tAFKwvTIyNfdoMM
 sPj3BWqvl3k0FoYWH9d96YOao+4Oex2yvn+7NYyyDb5nNFNbaf+adBMbx
 P6HkSC4VhN2zOsBTwLzy6E43xBB9CSlcHrAbVMX5vWHjeZ9qiY0sLLmfV
 cR9Pc4tQb2Y+nq0yeEWSe1wKJd2gfJaoWMCX7aPZ6DU5oJ4aYTVtGqiR+
 Ugzp5AaC4qkYoRzejQbVFAvud+9EhkvcCFZAnk4mGsesdTnBIGwMn0zdo
 aO/8EYvj6hAza27dPkD3aSF0SvqF0dlDlbyan8M1amty30nVZOdIX3heT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="11428571"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; d="scan'208";a="11428571"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 08:58:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="784918170"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; d="scan'208";a="784918170"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 08:58:32 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Colin Ian King <colin.i.king@gmail.com>
Subject: Re: [PATCH][next] drm/xe: Fix spelling mistake "gueue" -> "queue"
Date: Mon,  8 Jan 2024 08:57:58 -0800
Message-Id: <170473304994.868225.37284185827378036.b4-ty@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240102092014.3347566-1-colin.i.king@gmail.com>
References: <20240102092014.3347566-1-colin.i.king@gmail.com>
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
Cc: kernel-janitors@vger.kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 02 Jan 2024 09:20:14 +0000, Colin Ian King wrote:
> There is a spelling mistake in a drm_info message. Fix it.
> 
> 

Applied to drm-xe-next branch, thanks!

[1/1] drm/xe: Fix spelling mistake "gueue" -> "queue"
      commit: a3e6b7b90ce1ff725d7585cbd2c9279e6e39b914

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DA96DF7F7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 16:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CDED10E80B;
	Wed, 12 Apr 2023 14:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA28510E80B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 14:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681308348; x=1712844348;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hN0Jiq8CDxzQKhPLeSv0y2X2Dz6dEPHF/ZbEy1MipLo=;
 b=oDqQsSxL20fa55HGdmCw1AZZf4WBF/cBcYy66JA137HrgojIfkGuOC4/
 YgbLVoakHJkgB5w59KsTIMHeLQ0ZF5VakkG0hmyAH/ZPWIXp1QlMRVdKf
 iEey+GnYDi0TDreLnwcJKKOjXkP4a7MLu3WKZgj29Z9qlcmueVLTgJYyJ
 moSnQHQ25BHXyZ8xIGPa/SUMSh53LecnrKAUWZFvQmM5NlF33G+Kz6OMP
 VFpnwG+x18FH/oDRepJW3C6wFDLvpze9zsXqlTQNIHyt95v/WqNrO7252
 B2ku6MQatbsk03iFkGxB297VqXP/DElSvwTWZXX52Zpy/c1kNk8Sk26mD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="346581255"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="346581255"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:05:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="812998229"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="812998229"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 07:05:44 -0700
Date: Wed, 12 Apr 2023 16:05:42 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] Revert "accel/qaic: Add mhi_qaic_cntl"
Message-ID: <20230412140542.GA3141290@linux.intel.com>
References: <1681307864-3782-1-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1681307864-3782-1-git-send-email-quic_jhugo@quicinc.com>
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
Cc: sfr@canb.auug.org.au, mani@kernel.org, greg@kroah.com, ogabbay@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_pkanojiy@quicinc.com, linux-next@vger.kernel.org,
 jacek.lawrynowicz@linux.intel.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 07:57:44AM -0600, Jeffrey Hugo wrote:
> This reverts commit 566fc96198b4bb07ca6806386956669881225271.
> 
> This exposes a userspace API that is still under debate.  Revert the
> change before the uAPI gets exposed to avoid making a mistake.  QAIC is
> otherwise still functional.
> 
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAFA6C79D3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 09:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 898C910E515;
	Fri, 24 Mar 2023 08:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 230FB10E515
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 08:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679646703; x=1711182703;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0oGz38xrrr68DGXqilUJiebZ58q5HkQmcaeO9mdIcCw=;
 b=QgkJAfBg0pUm8i1G6DXZq1cobVvy3+F8+YLmkEdTKz04rynE1V8o3FWI
 RFTObb1irQaAvNDGCi9rySav7Atd7pMPctWla+34BNOBKkuYbRP1l11z9
 5XrOVhqmV/sLWFzy7iG9txAe6PfnmPtAZwNZmB3w00JCt2pQ0TuhxPgSs
 YULcwyfbotQ0EnNydi/+iX4CspXqrQgyxTikAsGKE/XSO3T/zx88nmq21
 uCbnFZ+TVFbLaggblgSmKbCjcC+8CzlRWeFL/iUKY9qmJMwnbV2l22Gdw
 SM7tbpD95nH/xE/fkXk7o5R2NdYFaqA+d1kto8pq+aIz9GG2DFFRCXEau g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="404644248"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="404644248"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 01:31:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="747070551"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="747070551"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 01:31:22 -0700
Date: Fri, 24 Mar 2023 09:31:20 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 5/6] accel/habanalabs: remove duplicated disable pci msg
Message-ID: <20230324083120.GJ2130371@linux.intel.com>
References: <20230323113525.959176-1-ogabbay@kernel.org>
 <20230323113525.959176-5-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323113525.959176-5-ogabbay@kernel.org>
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
Cc: Tal Cohen <talcohen@habana.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 23, 2023 at 01:35:24PM +0200, Oded Gabbay wrote:
> From: Tal Cohen <talcohen@habana.ai>
> 
> The disable pci message is sent in reset device. It informs the FW not
> to raise more EQs. The Driver may ignore received EQs, when the device
> is in disabled mode.
> The duplication happens when hard reset is scheduled during compute
> reset and also performs 'escalate_reset_flow'.
> 
> Signed-off-by: Tal Cohen <talcohen@habana.ai>
> Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

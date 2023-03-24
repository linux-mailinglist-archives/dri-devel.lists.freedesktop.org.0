Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB586C79C5
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 09:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D41F10E52B;
	Fri, 24 Mar 2023 08:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442EE10E52B
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 08:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679646526; x=1711182526;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AfCe1YxLe4m+/DkUt49CDT59A+JjTwnkyvMkx0Tnqhg=;
 b=cBfkKs/TJDRFaFBRSnXusJlPPCKhi07DmiAdagD9NotRre+GY1k+SyXN
 4RwEybmRoJUr/bO6sZ1P1MZkWZ0WT40xt0T4tEu5M2IzEt2/hmriVgkmZ
 S8493tCeGGZ96c7PPWL15h42f3n2dxeTFy6LM4fUXY/D3ByJvNSwZSipX
 6NOuEZcQtCo66whE2QMs+Bd3YB9oFaI0+f7jKtQmDmSVG8G7kGAmNkIfY
 Re5cuJ90GIgcM9Dfzh3kPysdqOOkgX7C/oYrqAjmiZ9YGJGS2GC/gca8D
 TK3d8/Eggp8uYRje3QeeOha/CoA0CA8xV+dU4mP0dXzOJZ2KjkWOVn28T Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="339752518"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="339752518"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 01:28:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="793364608"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="793364608"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 01:28:44 -0700
Date: Fri, 24 Mar 2023 09:28:43 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 4/6] accel/habanalabs: change COMMS warning messages to
 error level
Message-ID: <20230324082843.GI2130371@linux.intel.com>
References: <20230323113525.959176-1-ogabbay@kernel.org>
 <20230323113525.959176-4-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323113525.959176-4-ogabbay@kernel.org>
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
Cc: Koby Elbaz <kelbaz@habana.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 23, 2023 at 01:35:23PM +0200, Oded Gabbay wrote:
> From: Koby Elbaz <kelbaz@habana.ai>
> 
> COMMS protocol is used for LKD <--> FW communication, and any
> communication failure between the two might turn out to be
> destructive, hence, it should be well emphasized.
> 
> Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
> Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>


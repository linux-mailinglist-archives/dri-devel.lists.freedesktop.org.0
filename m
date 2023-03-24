Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3A16C79C1
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 09:28:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C6910E520;
	Fri, 24 Mar 2023 08:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A7110E52B
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 08:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679646496; x=1711182496;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LyQysnvtWWer+pzZn2fPTbdXpBZIkHtU+BR8nobObo4=;
 b=eBv4lGJDUwcjfKRcmqRUoKWB6ViyEDjCeVEeDWGISltzlBrclbuvF/3n
 tRPV7/VRNP4SB9J3LoTZaHgbKNCMcaKjkRh4w/cvo8S0RQBr0MWcAXnsM
 V6O08G7oziNEZMuT9hh7nLBTo5Wf9L5YtpbAVDqDkMAIkduRKPG2Gc4c6
 qWh15tJP3WJWYquqTW7WHL1zx27vnncNpbRrXttKHBi0DJ9JTOCTUQ4Pm
 CHUl3A2CmYkn8VeRXrWCc0kAD6/XWc59wXvfRHSb1nmNSfqUptvSYK3Bd
 Qo6oQ659FcatFE9fJZk8Bp1+0mpk+7DqyqWWnAdcN3A+lAZE5I5Vx80oD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="402310627"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="402310627"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 01:28:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="682605517"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="682605517"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 01:28:15 -0700
Date: Fri, 24 Mar 2023 09:28:13 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 3/6] accel/habanalabs: check return value of
 add_va_block_locked
Message-ID: <20230324082813.GH2130371@linux.intel.com>
References: <20230323113525.959176-1-ogabbay@kernel.org>
 <20230323113525.959176-3-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323113525.959176-3-ogabbay@kernel.org>
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 23, 2023 at 01:35:22PM +0200, Oded Gabbay wrote:
> From: Dafna Hirschfeld <dhirschfeld@habana.ai>
> 
> since the function might fail and we should propagate the failure.
> 
> Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
> Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 866526C7991
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 09:19:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD41B10E527;
	Fri, 24 Mar 2023 08:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7567C10E527
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 08:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679645978; x=1711181978;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dvQB2se9dY5+meaGYTaOs18ejbMxgVaKJDPta2WdexE=;
 b=Q07ZPj8XyyN6W3RNHChpfT1zenme3/aXJ9KzmitydAuAL0ZGOt6zOqg3
 EwGc38hHf+s3vqfNBDQes2OctPtzWvtN1ZbcoYQIbNirl2uWD+bUnFyLq
 vDkZ0SCesLNcfV4uhAnFIZX9kKV0kad/159Ba9NZ/McGnlNZQxAHSXzu6
 Od/p2wZezIcVxG2fu2t+SBPNknpT2ls9oK/Tt0NZ59QqEp5zZzj6D+Hva
 31BED5tjlW//2z1VZul21NTNKNyqY4aXF8TaVNXBsKD88/RCqOpmGehn6
 3ksefBaPpdgA2MuqoYkqf8eJybtAv8O5KgbhfJpdVXtByKFQtMzMtPxWn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="320116994"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="320116994"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 01:19:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="826168212"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="826168212"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 01:19:37 -0700
Date: Fri, 24 Mar 2023 09:19:35 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 2/6] accel/habanalabs: print event type when device is
 disabled
Message-ID: <20230324081935.GG2130371@linux.intel.com>
References: <20230323113525.959176-1-ogabbay@kernel.org>
 <20230323113525.959176-2-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323113525.959176-2-ogabbay@kernel.org>
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

On Thu, Mar 23, 2023 at 01:35:21PM +0200, Oded Gabbay wrote:
> From: Tal Cohen <talcohen@habana.ai>
> 
> When the device is in disabled state, the driver isn't suppose to
> receive any events from FW. Printing the event type, as part of the
> message that was already printed, shall help to get more info if this
> unexpected message is received.
> 
> Signed-off-by: Tal Cohen <talcohen@habana.ai>
> Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

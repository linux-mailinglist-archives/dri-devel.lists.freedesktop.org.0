Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A1969A7EB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 10:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BFF10E1BD;
	Fri, 17 Feb 2023 09:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D93B10E1BD
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 09:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676625193; x=1708161193;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cHTsZVVdVj+0TDZz/ywFtBNXduJUWSRa2xNnchMnRh0=;
 b=VZd8tTn/jWmmhe2YxDVkF0ZnsrpDEArujTcqWnZtPinp6t+2h27CzzIK
 CI8kRHUAXw5bClNDyXuvIPj31oa/06Hjxczf5k3gjpLSrl+ISEm1QP51v
 LFcjB9q9lWcCHjiMwTWxUSkuShAgd3hebMK7vpFZjQoeUS6Loh2igwZ6x
 wknol+RocOusO7N/5gpyCVC721M/nXxQlL+ptC7ekk6maEt8aTd5WUWwg
 S1Y1+Zs9yhR7kzWTJikNxANUqFLZ1HIHrthvcY/79GyzPiRnEc++V3bRB
 CDluTXlxRdYoD7TQ/Jwadon1n9qgDtV/2Y1zY1GWMnM63rTJShtq+lWMB Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="311580246"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="311580246"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 01:13:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="813311200"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="813311200"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 01:13:11 -0800
Date: Fri, 17 Feb 2023 10:13:09 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] habanalabs: make some functions static
Message-ID: <20230217091309.GA2870547@linux.intel.com>
References: <20230217062626.63213-1-jiapeng.chong@linux.alibaba.com>
 <20230217084814.GA2862577@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230217084814.GA2862577@linux.intel.com>
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
Cc: ogabbay@kernel.org, Abaci Robot <abaci@linux.alibaba.com>,
 osharabi@habana.ai, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 17, 2023 at 09:48:14AM +0100, Stanislaw Gruszka wrote:
> On Fri, Feb 17, 2023 at 02:26:26PM +0800, Jiapeng Chong wrote:
> > These functions are not used outside the file device.c, so the
> > modification is defined as static.
> > 
> > drivers/accel/habanalabs/common/device.c:2641:6: warning: no previous prototype for ‘hl_capture_fw_err’.
> > drivers/accel/habanalabs/common/device.c:2619:6: warning: no previous prototype for ‘hl_capture_hw_err’.
> > 
> > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4098
> > Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
>
> Regards
> Stanislaw

Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

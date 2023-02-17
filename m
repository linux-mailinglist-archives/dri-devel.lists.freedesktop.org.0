Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAE369A759
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 09:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A7C10EF29;
	Fri, 17 Feb 2023 08:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698C010EF29
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 08:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676623699; x=1708159699;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Mjzby5r/hrGpRXb0OnvsVYevCw+FhWz3tU0R6v4D+CE=;
 b=OTrYVcAJ9t5wEUQZqzENSkNKxAEC/cRV0sP5hw8KdzdzwMCOaJmZ1Z9L
 U3t+HmlxmVzxEpf/X4eWqXEN0ND2E+ugj+hoHFqRaOmWyt2Wv6FEl2BDU
 8NamgbsBEXa5GLN3Si50M24CPiWJcdwgeSFQWGnL0bTJADRx4JVA0Aj5+
 dEYftPV/118/vXFDaXxB1oxpF1/wnGEev8sil69Q0SzSka/uyqH3PU3FY
 8hVcgehZ2ZLhtHYD54lwrkGICtoDli8+Ak/twRsPTLfVM9iTpxixnH5Si
 HNh1MVgSPZpdyrWsEUi79lwiNI8oshGVjkLe5YG7r/w7S2YWDmGjKAykE g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="334143037"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="334143037"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 00:48:18 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="648007318"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="648007318"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 00:48:16 -0800
Date: Fri, 17 Feb 2023 09:48:14 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] habanalabs: make some functions static
Message-ID: <20230217084814.GA2862577@linux.intel.com>
References: <20230217062626.63213-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230217062626.63213-1-jiapeng.chong@linux.alibaba.com>
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

On Fri, Feb 17, 2023 at 02:26:26PM +0800, Jiapeng Chong wrote:
> These functions are not used outside the file device.c, so the
> modification is defined as static.
> 
> drivers/accel/habanalabs/common/device.c:2641:6: warning: no previous prototype for ‘hl_capture_fw_err’.
> drivers/accel/habanalabs/common/device.c:2619:6: warning: no previous prototype for ‘hl_capture_hw_err’.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4098
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Regards
Stanislaw

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FF97D22E0
	for <lists+dri-devel@lfdr.de>; Sun, 22 Oct 2023 13:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2113F10E0B0;
	Sun, 22 Oct 2023 11:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3828910E0B0
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Oct 2023 11:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697973605; x=1729509605;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZV5m5CS5hxdG/7f2asALECDbdAeb7WxlldaO5lAsY3c=;
 b=eAvA6No1x4riq7MmYQbOoznUye0ph8LHggFNPvZdJlGUwyEwapZyHV60
 mA5GJqVIbWHszb+5rU3lvDNRrU+WS7Da79/XZr4iGv3F/6cJ/436V/+De
 hlFVKvzH+JStEn67204C4cfgC3gdzZGBhZFr5BhMS+GfnIPBypaK/RVfT
 ehQYqowF3wXKejFz2G5ic77ranKgisMNnNZU6BzqeOJdYhY4/mQ0nL64d
 4VW5cC2zzxqpqLz0CZ5tq/81nPuKavbi79usJoys+O+LCLeJ1Sscpnlpv
 N5yYRWDOTlIcP47d8tCsTvqatUcJFbWDs2KStoBAt8gjVKQg3P3HsK+m5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="8256678"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="8256678"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2023 04:20:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="1089193319"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; d="scan'208";a="1089193319"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2023 04:20:02 -0700
Date: Sun, 22 Oct 2023 13:20:00 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v2 2/2] accel/qaic: Support MHI QAIC_TIMESYNC channel
Message-ID: <20231022112000.GC704032@linux.intel.com>
References: <20231016170114.5446-1-quic_jhugo@quicinc.com>
 <20231016170114.5446-3-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016170114.5446-3-quic_jhugo@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, ogabbay@kernel.org,
 dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 16, 2023 at 11:01:14AM -0600, Jeffrey Hugo wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Use QAIC_TIMESYNC MHI channel to send UTC time to device in SBL
> environment. Remove support for QAIC_TIMESYNC MHI channel in AMSS
> environment as it is not used in that environment.
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

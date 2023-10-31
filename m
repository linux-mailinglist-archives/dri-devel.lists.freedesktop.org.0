Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D85307DD132
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 17:07:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1FB10E560;
	Tue, 31 Oct 2023 16:07:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192F010E55F
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 16:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698768435; x=1730304435;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ygmKS1OPVIeyysZooGEWizh82kiu2HceECE2jK4lM2o=;
 b=QPXZnI4chw6yDFbgFxn9At1WF1XDkQTZ60OJUAG7jGnH3z+cjNbPUqHo
 0o271V81Vti72jUnElj7AsyyOBylwN95Vr7ZSlkVvIF/CRYUNED21g6DG
 6ANMQ5x3s/olQB4KRxT4DFb4PUdV2ypb66S/7erIclGGOxkTG2Dr0i3HH
 pBQ3qcC3Khmhookx3j6FL3shAsSGJzAVvSrmejWRMgDvq7UjXhnCE2pAT
 +aohvRHsk57cZ5D0WEWIi/cgBJHjRycZkZ8+f4Jr0oEca8i8cgeL0PhUT
 38t+yIDLPqK59vdnnw/7Bgv7h031BfVKByvASPqCNKCpLONGpN6AVzRpe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="368525008"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="368525008"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 09:06:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="795618394"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="795618394"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.34.156])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 09:06:38 -0700
Date: Tue, 31 Oct 2023 17:06:36 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/8] accel/ivpu: Update for -next 2023-10-28
Message-ID: <ZUEmDCsQAENUYPu/@linux.intel.com>
References: <20231028155936.1183342-1-stanislaw.gruszka@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231028155936.1183342-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 28, 2023 at 05:59:28PM +0200, Stanislaw Gruszka wrote:
> Various driver updates:
>  - MMU page tables handling optimizations
>  - Rebrand to NPU
>  - FW profiling frequency knob
>  - job done thread suspend handling
> 
> This is based on top of previous update:
> https://lore.kernel.org/dri-devel/20231028133415.1169975-1-stanislaw.gruszka@linux.intel.com/

Applied to drm-misc-next

Regards
Stanislaw

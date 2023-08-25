Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D80C4788E05
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 19:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E5010E25C;
	Fri, 25 Aug 2023 17:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446D410E25C
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 17:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692985838; x=1724521838;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=MNxhxZVgxztKuNKuvsL0AzLilS4KbqaTek8IWrU+J20=;
 b=OvoPS8/+ZeTLRTgpAGqArposstMK+bCHSFrLMvj7R3FJZKZewPcE6Fyt
 zlDsnQPAA9Zb5D5ALlPI7s+0m5I8h0YhdcLJHQ2L4idwZmrTW9U94XGon
 gEV5xDfxjRqpXyz1wv3j5Nw+zPERC51yV6a7HDtG4oQ396iqh+NfYBDLt
 /upZYIS4Vpry8Aeb6XDUv9ZYhhkOc5mmimrD7BIDWDg2cJPIKf/jU+A77
 tyKkq9kUb6MxySi5HJfpXc5nyTMaO0Q7P9apZF/XWdHQkQchDk/de666A
 VfX69iXCfQVHDoQZsROSw9BYgDFcYylp092u589Tcq32bPdh7sEPUaSTJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="378547675"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; d="scan'208";a="378547675"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 10:50:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="807617356"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; d="scan'208";a="807617356"
Received: from semenova-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.46.222])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 10:50:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Helen Mae Koike Fornazier <helen.koike@collabora.com>
Subject: Re: [PATCH 2/6] drm: ci: Force  db410c to host mode
In-Reply-To: <29c7-64e8b600-1-6afffd8@162524228>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <29c7-64e8b600-1-6afffd8@162524228>
Date: Fri, 25 Aug 2023 20:50:26 +0300
Message-ID: <87msyf2eql.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: emma@anholt.net, linux-doc@vger.kernel.org,
 Vignesh Raman <vignesh.raman@collabora.com>, dri-devel@lists.freedesktop.org,
 jbrunet@baylibre.com, robdclark@google.com, corbet@lwn.net,
 khilman@baylibre.com, sergi.blanch.torne@collabora.com,
 david.heidelberg@collabora.com, linux-rockchip@lists.infradead.org,
 daniels@collabora.com, martin.blumenstingl@googlemail.com, mripard@kernel.org,
 anholt@google.com, linux-mediatek@lists.infradead.org,
 robclark@freedesktop.org, matthias.bgg@gmail.com,
 linux-amlogic@lists.infradead.org, gustavo.padovan@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 neil.armstrong@linaro.org, guilherme.gallo@collabora.com,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 25 Aug 2023, "Helen Mae Koike Fornazier" <helen.koike@collabora.com> wrote:
> I'm not sure I get what do you call out-of-tree builds.

Using 'make O=dir' (see make help) to separate source and and output
directories.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center

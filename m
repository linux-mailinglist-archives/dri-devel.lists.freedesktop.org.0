Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E46552BCF
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 09:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248EA10F515;
	Tue, 21 Jun 2022 07:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC99E10F45D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 09:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655718679; x=1687254679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wKG3yHDY3jxND3pnewROmPbZC+Yuv0XTwko/EEp6Uag=;
 b=FtPrEcLNSQO8HcIQzydK9ywNTRJuuWzJZbtaskBkbEp1bCppp0u6GusL
 djAHmpEksgroAC3KB9bC4DSig74S1SRvP3vPbcac7ExNo5ZoJcqACrum3
 rehYJj8CVLhzxBBdVw85Z5GNdAc+dyE8F52xl8H/NceFijZr4H16qEALR
 43d9DkQyWEPRSLcPY+Xw54WJs3qCn5fe1Azvw2/OiCU5jCMGfy48ZGQM1
 +kX9IaDNam21B1oEBNuM4m9KSRUOh+h0tbyWs4+ZDG5AFQTiwTz+ygaYb
 41UUtE6LpXSbRqspHzdZcn5x4NdsAaECPcMHuIfcHXqDrkqR0Q+r9vzDy g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="259676001"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="259676001"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 02:51:19 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="833039096"
Received: from gna-nuc-dev34.igk.intel.com ([10.102.80.34])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 02:51:16 -0700
From: maciej.kwapulinski@linux.intel.com
To: gregkh@linuxfoundation.org
Subject: Re: [PATCH v3 00/14] Driver of Intel(R) Gaussian & Neural Accelerator
Date: Mon, 20 Jun 2022 11:49:07 +0200
Message-Id: <20220620094907.4101274-1-maciej.kwapulinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <85a6nq45uh.fsf@linux.intel.com>
References: <85a6nq45uh.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 21 Jun 2022 07:24:08 +0000
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
Cc: arnd@arndb.de, corbet@lwn.net, guy.zadicario@intel.com,
 dragan.cvetic@xilinx.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 maciej.kwapulinski@linux.intel.com, andy.shevchenko@gmail.com,
 derek.kiernan@xilinx.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 16 Jun 2021 09:38:14 +0200, Maciej Kwapulinski wrote:
> after consulting, we will try to share api and some kernel code
> between the two drivers.

We prepared a prototype work based on Daniel Vetter’s invitation to
evaluate DRM framework as prospective fit.

Early results look quite promising. Effective leverage of DRM framework for
non GPU driver has been achieved. GNA driver source code turned out to have
been simplified by offloading some areas (device management + memory
regions management).

As a result, GNA driver source code size has been reduced by 15% (420
lines). DRM Framework complexity has not been an issue so far.
 
Plan for next step is to publish code to dri-devel ML.
Please share your thoughts.
 
Regards,
Maciej

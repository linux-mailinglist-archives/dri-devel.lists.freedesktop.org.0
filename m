Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2F67D0B1B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 11:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C73B510E595;
	Fri, 20 Oct 2023 09:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDF610E58D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 09:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697792878; x=1729328878;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6Fo7P9SabarNMDvAtym6whJdq1TKNFcIppH/+OETBG8=;
 b=mNh3omRKG8iodY7d2FAd+YOGYR2ohw25M8/Jfr0UlaViKj8Yl1HUupbm
 Bn/9b/o+796QKRKRuxXjJx8qPDLHnA4v8I4X4NUyTnIc41On0ruBTAZH+
 60OCNIvwuDPzlzcjXHkc2ihxev/YdZq2WAyMOEWfEMOOb5b5WHPXba8J3
 2Q7LgDV7vek5CZtzAL2H+GuucqTSLgGaJvZfrfzZMffdlfNpnaESq0uWQ
 ScKfg1q1MWJuT1cjMaQaLVh2EAIU+fI09Av0M44lFFvazC5yY8oYiW1qz
 qmEtEA6L/VBGBf4uVKfHr1AQkldBNFFmjo42dt8rgnq+MH1OQ+FcvTzOZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="450688010"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="450688010"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 02:07:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="873839479"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="873839479"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 02:07:56 -0700
Date: Fri, 20 Oct 2023 11:07:54 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Deepak R Varma <drv@mailo.com>
Subject: Re: ivpu TODO list items
Message-ID: <20231020090754.GA563066@linux.intel.com>
References: <ZSjwuyCOL9Vb9+yb@runicha.com> <ZS68dysac34rA32D@runicha.com>
 <20231018075053.GB525429@linux.intel.com>
 <ZTATkznuHyX4rUit@runicha.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTATkznuHyX4rUit@runicha.com>
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 18, 2023 at 10:49:15PM +0530, Deepak R Varma wrote:
> > > > 2. Is it absolutely necessary for me to have a specialized hardware to test my
> > > > patches? Is it limited to the 14thGen or above CPU or do I need more than that?
> > Yes, I don't think someone can work on ivpu without hardware.
> 
> Okay. Could you suggest what would be the minimum hardware required to explore
> this driver?

As you wrote, you need to have 14th gen Intel CPU i.e. Meteor Lake.
Only this ... or as much as this.

Regards
Stanislaw

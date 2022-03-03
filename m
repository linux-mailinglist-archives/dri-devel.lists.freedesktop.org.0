Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 874E74CBBBD
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 11:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A175210E447;
	Thu,  3 Mar 2022 10:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458A410E28B;
 Thu,  3 Mar 2022 10:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646304781; x=1677840781;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=D40U7XInYKADewIDdlf0msb/ovYhV3CoJ6MBY06XOGE=;
 b=bRdrqQ+u0dvRff1NH6jXcMt8qHyf47TZx2NQR/axLMPN6C+uGXBCJPFS
 ggOtPbw2m6yOmtFffh7vIyhI/0ih6qKTa6f5lLywLGL/OO4Y2SRvCrRmL
 ix2u73eHktYhRweRmUg/EMGvCbpQ+hrZbDzpXZbS4LHlJUvN8uiPweLg4
 YxQiqPGT5iayfxedvV0OdsYzMDik2hLwaVSmT0HC3cm1e1pqBPzl/yQnZ
 444uiKlJes+JPdRBgr/QQTfWB6c0Iv4Y/7aRtpREh6nNt1N5sxU6/C6vt
 prLzbZ2EUql5F1FyKuqpcDWfUG9O4USNejuqTb2tqfXVriW6l5Y8sWTmB A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="237153053"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="237153053"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 02:53:00 -0800
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="551704461"
Received: from ajafari-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.255.36.250])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 02:53:00 -0800
Date: Thu, 3 Mar 2022 05:52:57 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: Mandatory Test Suite for KMS Drivers?
Message-ID: <YiCeCeNobS2FCiQB@intel.com>
References: <20220303090507.grenwdro7u4fzmoe@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303090507.grenwdro7u4fzmoe@houat>
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
Cc: igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 03, 2022 at 10:05:07AM +0100, Maxime Ripard wrote:
> Hi,
> 
> Back at XDC we floated the idea of creating a test suite for IGT that we
> expect any KMS driver to pass, similar to what v4l2-compliance and
> cec-compliance provide for v4l2 and CEC respectively.
> 
> I was looking at the list of tests, and it's fairly massive, so it's not
> clear to me what tests we could start this suite with. I can only assume
> all the KMS (but the chamelium ones) and fbdev related ones would be a
> good start?
> 
> What do you think?

I believe we should start with the group of the tests that we know that
are reliably passing today on most of the platforms and then increase
the list as the tests and drivers become more reliable.

For instance, many of these would be candidate to be filtered out for now
https://intel-gfx-ci.01.org/tree/drm-next/index.html?testfilter=kms

compared to the whole view of kms tests:
https://intel-gfx-ci.01.org/tree/drm-next/shards-all.html?testfilter=kms

Thanks,
Rodrigo.

> Maxime



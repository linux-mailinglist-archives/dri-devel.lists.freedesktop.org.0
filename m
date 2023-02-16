Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AED169979E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 15:39:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E9F10EDA4;
	Thu, 16 Feb 2023 14:39:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2364310EDA4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 14:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676558360; x=1708094360;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nY9Y/iVReZlGwfd9CHu6l/1mFNQ/oreXS8zJ2ftrgD8=;
 b=HduCnkYGGgsYsFDxgDd2Rfcn/fdobE5UyoqXf7IabGZmFYNaZvy6/8Ce
 nxV5bPE2wHAo0WzyPQbD2cWsQBH1naKCPTDV3CFZxUWHe7hyFCRG6u2XG
 yeDA2p45gTIqGMZ3/95dLSSmQG+RgmvFHNFvIXRc9/fTUvo9gLx3t0blE
 HiSWT5/VmJBdEjxnWqOkK3/5kaDrvLmtoERzyGMU/r+hZ1DubWTL1hl52
 nHRwZttAtVpDJY3hyl//JxqmGK+XEE+QiWU4qXjwVVw+F2SidgFXq+9kc
 xXAEiL5BlK4bMe8B/9w8+mImeHuV0jLa6ND7fbSpxjs1wPOcn5ZUfiztT A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="417950809"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="417950809"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 06:39:14 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="794036793"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="794036793"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 06:39:11 -0800
Date: Thu, 16 Feb 2023 15:39:09 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 19/27] habanalabs: capture interrupt timestamp in handler
Message-ID: <20230216143909.GH2849548@linux.intel.com>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
 <20230212204454.2938561-19-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230212204454.2938561-19-ogabbay@kernel.org>
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
Cc: Ofir Bitton <obitton@habana.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 12, 2023 at 10:44:46PM +0200, Oded Gabbay wrote:
> From: Ofir Bitton <obitton@habana.ai>
> 
> In order for interrupt timestamp to be more accurate we should
> capture it during the interrupt handling rather than in threaded
> irq context.

Why this is important to have this timestamp more accurate ? 
What actually 'more accurate' mean in this context ?

Regards
Stanislaw


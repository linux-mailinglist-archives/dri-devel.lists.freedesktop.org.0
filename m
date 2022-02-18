Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD4A4BBF84
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 19:30:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9520810E64E;
	Fri, 18 Feb 2022 18:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1E210E121;
 Fri, 18 Feb 2022 18:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645209025; x=1676745025;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8Z3QXFvu52gPtOV69W23hyphfpO7X4Ny4woK8zYxaEI=;
 b=fm1VfhZai4vgMwh5nKxHb1j4YusfZWPoKSWps61A9Rz60RNsk2Lo/Q+i
 RXmoqRpEOTVC0zWHGWvZdCDfnEusGbctZTj4c3jRHLprTYbx926YcR3Bs
 qMsXPoUM97FGTcHoIF6/aHSph41VPfb4f8V5yIdTlBLj6SqsKqSmawdwF
 EJ/VWLP6Zmc1HbOcLu3kJVcVuJgY5j8RFeYTm6rPIYTrkmHS9/bXduDJ9
 IYYXjf7zqYkNfDL/hwLYmuUw/PDTHLZiOzBXZ1oAJaoLC8t28YpJaHk19
 ps3rSP9BSanjt37k0Dh8+m341icpoQSvt7bwsz9y9WfouMvSDjT8L3Bpp A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="314448757"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="314448757"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 10:30:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="531013578"
Received: from svaddara-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.147.37])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 10:30:13 -0800
Date: Fri, 18 Feb 2022 10:30:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/doc: remove rfc section for dg1
Message-ID: <20220218183014.bhrncxii4tbkmdnn@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220218112242.2117968-1-matthew.auld@intel.com>
 <20220218112242.2117968-2-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220218112242.2117968-2-matthew.auld@intel.com>
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
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Kenneth Graunke <kenneth@whitecape.org>,
 mesa-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 18, 2022 at 11:22:41AM +0000, Matthew Auld wrote:
>We already completed the steps for this.
>
>Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>Cc: Jon Bloomfield <jon.bloomfield@intel.com>
>Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>Cc: Jordan Justen <jordan.l.justen@intel.com>
>Cc: Kenneth Graunke <kenneth@whitecape.org>
>Cc: mesa-dev@lists.freedesktop.org

I was indeed wondering why that was still there and why we were going a
similar route with DG2, but this time adding it after the plan completed.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

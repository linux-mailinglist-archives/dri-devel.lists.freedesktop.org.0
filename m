Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E290727733
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 08:21:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB40310E397;
	Thu,  8 Jun 2023 06:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CEF10E397
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 06:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686205299; x=1717741299;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=loyw64qmjnoZPd84sIxSvUz3YLQGXNbVKxKcZ4P14Nc=;
 b=EVcNTirnFN59XMp86nwQ6ppJI4OXwK81dbPEQPnOx0pZ3O6Te76CmZhT
 E03FkiH1DiRPyxJW0Z9Hpgifzz+oH4i5xAFJ2yDa7KcOa6JzKXkpnlDio
 sToiriuT2H9I9e7nXTrUrIZbLfo3tLvWVYjVzJ8zIGKeH/RXiwd+bSlpt
 FKT2tnvel4z2XdEjxfyL9eXk2A6FAMt6xrcwtMbf4RmIGBBhqmYCJajGh
 Zmqx9kJNhGThUfFGPmeEQhkgOHDonYnQKHKd6rRtuUMrtGiEWC8yaa4ON
 dAnUyR7kVThCPwYULng0Vc/v7kuGP0MNBgs5aYu/jS2VWJsRAsFquxgrq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="360556465"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="360556465"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 23:21:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="884066373"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="884066373"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 23:21:36 -0700
Date: Thu, 8 Jun 2023 08:21:33 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 2/2] accel/ivpu: Do not use mutex_lock_interruptible
Message-ID: <20230608062133.GF324119@linux.intel.com>
References: <20230525103818.877590-1-stanislaw.gruszka@linux.intel.com>
 <20230525103818.877590-2-stanislaw.gruszka@linux.intel.com>
 <66ccf028-48df-0493-6510-19bd635210a5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66ccf028-48df-0493-6510-19bd635210a5@quicinc.com>
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
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 02, 2023 at 11:30:31AM -0600, Jeffrey Hugo wrote:
> On 5/25/2023 4:38 AM, Stanislaw Gruszka wrote:
> > If we get signal when waiting for the mmu->lock we do not invalidate
> > current MMU configuration what might result on undefined behavior.
> 
> "that might result in"
Fixed this and applied 2 patches to drm-misc-fixes

Thanks
Stanislaw


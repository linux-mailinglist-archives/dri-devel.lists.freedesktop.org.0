Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4136E0B38
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 12:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C2B10EAAF;
	Thu, 13 Apr 2023 10:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F1510EAAF
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 10:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681380927; x=1712916927;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=tutThUfJ4Tf8gx0JF/9tixyB5xXnZ9PzWxT0W+scGco=;
 b=A5Md89pdlRfSumpMj6SLd8uxCUXeHOjBbsTixeRNa6Mx28wX1VaNPQgD
 VFgU4iH+hE8W/OoEWpC+yeKALKIenICTtumu1G24TqTa2sQr+8aUuB/bF
 Spqtk0JlNObXb3gnno3VUZa5LcOI5Gps1k0Y7U9tK6U2ypyBBRhc8gM6f
 RdOBv+JT7h4SKaDsrXwnrjfO9RMHdD7DAUuqOq0cDGHbITn+kyU5Lvyhs
 fL1P8ZhRj30IZC9IKCbCpFGKXUpBgtSYcW7IFD6xXJZZpufD9/xLNZLOO
 PpnshsbHyx0sl4HvKCGC1yhzWRYBHlLKD7lseu9hkspyzXUydKVtq4nEv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="346828430"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; d="scan'208";a="346828430"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 03:15:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="721997301"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; d="scan'208";a="721997301"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.133.150])
 ([10.249.133.150])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 03:15:22 -0700
Message-ID: <d39db860-7b13-2075-2bea-8eb83764b9d4@linux.intel.com>
Date: Thu, 13 Apr 2023 12:15:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] Revert "accel/qaic: Add mhi_qaic_cntl"
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, sfr@canb.auug.org.au,
 mani@kernel.org, greg@kroah.com, ogabbay@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_pkanojiy@quicinc.com, linux-next@vger.kernel.org, airlied@redhat.com
References: <1681307864-3782-1-git-send-email-quic_jhugo@quicinc.com>
 <20230412140542.GA3141290@linux.intel.com>
 <ZDfCGXPCFkb20jNW@phenom.ffwll.local>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <ZDfCGXPCFkb20jNW@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, 

On 13.04.2023 10:49, Daniel Vetter wrote:
> On Wed, Apr 12, 2023 at 04:05:42PM +0200, Stanislaw Gruszka wrote:
>> On Wed, Apr 12, 2023 at 07:57:44AM -0600, Jeffrey Hugo wrote:
>>> This reverts commit 566fc96198b4bb07ca6806386956669881225271.
>>>
>>> This exposes a userspace API that is still under debate.  Revert the
>>> change before the uAPI gets exposed to avoid making a mistake.  QAIC is
>>> otherwise still functional.
>>>
>>> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
>>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>>> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> 
> I think Ack from Oded would be good (but iirc there's some holidays going
> on), but I guess Greg's is good enough. Can you pls push this to
> drm-misc-next-fixes (it's open now for merge window fixes) since Jeff
> isn't set up yet?
> 

I've pushed this revert to drm-misc-next-fixes.

Regards,
Jacek

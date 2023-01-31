Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6637A682D01
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 13:52:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA0310E34A;
	Tue, 31 Jan 2023 12:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9746F10E34A
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 12:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675169517; x=1706705517;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6bmhDvv4ZeGdpWzIo7dtVDn5+MD2AlT6GxJia3cLkPg=;
 b=DYtu8vz0y3za3YR8N9DhvYisZVxsGLrfFS6sz7l/9aJv/254E/7aVmoZ
 331djcmbob0yDAHOYTn512xpA+c3SUgoq8BTbd+wez9W2VIrLeOv+Bnlk
 Vnt6wjgP7k6gbmSD94pIYTHrjdgZ/iWB2BhZEQ19sXj0R/4HtL9QZ+rj+
 0gXKhrqdoiTfSZU4M7XfziShyCzyHGjIIDSPEGPFBkP2JGV3xvzFClI7F
 aOKs0DfwkTqyp1Nmg+nO/AfB/IzZpRj37OGHZDhTXGra4hN23N1yRC7bk
 sApu0/MiD3PSvANcGnCHXyJh29HuHSYZ3AO6nua9bam3ZNRoqsmL+6KRo w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="311451348"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="311451348"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 04:51:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="666490940"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="666490940"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.237.142.112])
 ([10.237.142.112])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 04:51:39 -0800
Message-ID: <864f6835-ceff-a124-2631-70203d8461e1@linux.intel.com>
Date: Tue, 31 Jan 2023 13:51:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drivers: Restore alignment and newline in Makefile
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20230124104145.3962497-1-geert+renesas@glider.be>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230124104145.3962497-1-geert+renesas@glider.be>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next.
Thanks.

On 24.01.2023 11:41, Geert Uytterhoeven wrote:
> The introduction of drivers/accel/ broke alignment, and removed the
> newline at the end of the file.  Fix all of that.
> 
> Fixes: 35b137630f08d913 ("accel/ivpu: Introduce a new DRM driver for Intel VPU")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/Makefile b/drivers/Makefile
> index f0972e2226c97cb5..9ea6eb3b5d7b7f17 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -189,4 +189,4 @@ obj-$(CONFIG_COUNTER)		+= counter/
>  obj-$(CONFIG_MOST)		+= most/
>  obj-$(CONFIG_PECI)		+= peci/
>  obj-$(CONFIG_HTE)		+= hte/
> -obj-$(CONFIG_DRM_ACCEL)	+= accel/
> \ No newline at end of file
> +obj-$(CONFIG_DRM_ACCEL)		+= accel/

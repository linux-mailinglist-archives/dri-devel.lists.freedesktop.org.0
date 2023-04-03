Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 731376D3D25
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 08:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF84E10E121;
	Mon,  3 Apr 2023 06:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21B310E135
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 06:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680502413; x=1712038413;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5HdysPMR88WxOEdFDN9rD17KnwyveKWVs6tb4q6VmpY=;
 b=G0SfUoQqeGbI4ZefccTRi74Zi3DqRUIrLLLKdIPBuSKsFkGu7p7Ousyj
 EQDUVYFqBCbWAM0Ii4xo4T+/RNeua/kJVXA9OUOfsUsIn7BJ0KldYdIKF
 jXlwtCNsiY6kRgWWXtnFElpu2kGpiy5EcLt1Y/eQlGkxl8B48t6bCF63j
 uuCQVmUUbqbtwSb28ESyefrngF5SFpCCa6W5hps6wAFI2M2y7nhCZD6as
 jBuAlNcxc+mLqGHCxnbiJxvfDek/HdaU4iMrJPWXWILIA0kAMvY08mVGF
 ZMfNnolZxYkAtjLaNTmkHmBQnR5WBvoFU+1R+cFRqF5mQ2NJuvtql09TH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="330389887"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="330389887"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2023 23:13:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="685844364"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="685844364"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2023 23:13:31 -0700
Date: Mon, 3 Apr 2023 08:13:29 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH] accel/habanalabs/uapi: new Gaudi2 server type
Message-ID: <20230403061329.GA2805838@linux.intel.com>
References: <20230330093234.1605251-1-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330093234.1605251-1-ogabbay@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 30, 2023 at 12:32:34PM +0300, Oded Gabbay wrote:
> Add definition of a new Gaudi2 server type. This represents
> the connectivity between the cards in that server type.
> 
> Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

> ---
>  include/uapi/drm/habanalabs_accel.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/drm/habanalabs_accel.h b/include/uapi/drm/habanalabs_accel.h
> index c139aab17c8a..d9ef1b151d04 100644
> --- a/include/uapi/drm/habanalabs_accel.h
> +++ b/include/uapi/drm/habanalabs_accel.h
> @@ -708,7 +708,8 @@ enum hl_server_type {
>  	HL_SERVER_GAUDI_HLS1H = 2,
>  	HL_SERVER_GAUDI_TYPE1 = 3,
>  	HL_SERVER_GAUDI_TYPE2 = 4,
> -	HL_SERVER_GAUDI2_HLS2 = 5
> +	HL_SERVER_GAUDI2_HLS2 = 5,
> +	HL_SERVER_GAUDI2_TYPE1 = 7
>  };
>  
>  /*
> -- 
> 2.40.0
> 

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 732A59EB0E3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 13:34:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA4510E3A7;
	Tue, 10 Dec 2024 12:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pw4l2pqT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECB410E3A7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 12:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733834072; x=1765370072;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DcpGbcGoWnPprsTcfihBEHsSBixVyfT8bKiR2w9j6Q8=;
 b=Pw4l2pqT5iKLkHwLsc8jJMUFK08UwVZKO8n7IPwAmapiTLpR9ufYWfuX
 GwdxS9CfD6MBQXA5rzX3dAcONe7Jw8UOFn/njB1iOcIGVN7gvonCqXj+F
 LCmu0k7ew4gPe7Blb5Zn8c396Vu7vh5KSwLx/CtKecVz5OfFmV7An3DmD
 fBOhX15zp785uzHiiN/WpRMCYeRiekkrtyLoW4XZ25MiZhMJCmXBW/UkC
 W9IYQanxtAz6spEnZTbLyYEcfX7v5zIwC3R4qSjHJFMDIMytlnPT7/yIZ
 ES/2URZVq+qA7dD55HJzq0BFCN7kYZCgoXvPjMwjC0MjD5EzmlvzXYyUi Q==;
X-CSE-ConnectionGUID: 8S97S8NIQ/yGdgA0DZ//QQ==
X-CSE-MsgGUID: zx+T3QjCQyiq6PAE2x9e6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="51700721"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="51700721"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 04:34:32 -0800
X-CSE-ConnectionGUID: LuJ5hUX+SyKiuCLVIXNf5w==
X-CSE-MsgGUID: 72/IcMkgRnyoV2KyeCwvBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="95601150"
Received: from unknown (HELO [10.217.160.151]) ([10.217.160.151])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 04:34:30 -0800
Message-ID: <b210c30a-21f5-417b-aac8-f54f9c302096@linux.intel.com>
Date: Tue, 10 Dec 2024 13:34:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix typo for struct
 qaic_manage_trans_passthrough
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, quic_yabdulra@quicinc.com,
 quic_carlv@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20241129202845.3579306-1-quic_jhugo@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241129202845.3579306-1-quic_jhugo@quicinc.com>
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

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 11/29/2024 9:28 PM, Jeffrey Hugo wrote:
> The documentation header for struct qaic_manage_trans_passthrough has a
> typo - "t" is missing in "transaction".
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  include/uapi/drm/qaic_accel.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/drm/qaic_accel.h b/include/uapi/drm/qaic_accel.h
> index d3ca876a08e9..c92d0309d583 100644
> --- a/include/uapi/drm/qaic_accel.h
> +++ b/include/uapi/drm/qaic_accel.h
> @@ -64,7 +64,7 @@ struct qaic_manage_trans_hdr {
>  /**
>   * struct qaic_manage_trans_passthrough - Defines a passthrough transaction.
>   * @hdr: In. Header to identify this transaction.
> - * @data: In. Payload of this ransaction. Opaque to the driver. Userspace must
> + * @data: In. Payload of this transaction. Opaque to the driver. Userspace must
>   *	  encode in little endian and align/pad to 64-bit.
>   */
>  struct qaic_manage_trans_passthrough {


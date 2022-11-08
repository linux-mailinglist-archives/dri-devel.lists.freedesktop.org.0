Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 880AD620CAA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 10:50:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846D410E3BB;
	Tue,  8 Nov 2022 09:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFDA10E0E8;
 Tue,  8 Nov 2022 09:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667900992; x=1699436992;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iC+onxNy7KNgKEzOFYTssykgkV5jyGSsB6F/1ba4UZ0=;
 b=l4X+QIOJ8GGfjvKCYGFQszVm2p/BJfMhOjPNXOpdjZadXiuGa1dztCcg
 70lEAh3LLeekidm2M6d0RlLQJA7cUKOWB7OOrw79TwBDqo6xSZGU4NmUr
 j1KEqNpA5C/mnF7TeFTE26pVZktCk5Ia03t4U2dCwin0JqvQpTqOzJ2Hn
 uLeAU4/RfDCBp0EQ5H8VyT0bH6+GSKKLstGACEEcZni6ChzwZR1IRjV9Y
 kKZgOBbwL4DF61afzpgGHnnNruMjtwBppfrHKVP/Fr9whqlnVOvgvuX9M
 VTL4xz0jriLJ8iV8dZmTojJT3ppdhbVDKTNTE4Wvl/feqhYAyEdmUs/QX g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="337381192"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="337381192"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 01:49:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="811182308"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="811182308"
Received: from shylandx-mobl2.ger.corp.intel.com (HELO [10.213.210.50])
 ([10.213.210.50])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 01:49:46 -0800
Message-ID: <ee6f2ae9-9420-1c91-a029-644cb8ac85e0@linux.intel.com>
Date: Tue, 8 Nov 2022 09:49:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 1/3] Documentation/gpu: Fix section in the wrong scope
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-doc@vger.kernel.org
References: <20221107173209.2219571-1-lucas.demarchi@intel.com>
 <20221107173209.2219571-2-lucas.demarchi@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20221107173209.2219571-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 07/11/2022 17:32, Lucas De Marchi wrote:
> That section should still be inside "DRM client usage stats" rather than
> as a sibling.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   Documentation/gpu/drm-usage-stats.rst | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index 92c5117368d7..b46327356e80 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -126,7 +126,6 @@ percentage utilization of the engine, whereas drm-engine-<str> only reflects
>   time active without considering what frequency the engine is operating as a
>   percentage of it's maximum frequency.
>   
> -===============================
>   Driver specific implementations
>   ===============================
>   

Oops - yep.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

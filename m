Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B045AB0627F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 17:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5686E10E5F0;
	Tue, 15 Jul 2025 15:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q0ndQ6mS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE2510E5ED;
 Tue, 15 Jul 2025 15:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752592315; x=1784128315;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GT9YCMpmO/oGbAXwtofhY5F7e46WJk2TBT21YGNxioQ=;
 b=Q0ndQ6mSMIuQOLDINHH5prIeJmLF8CE1RMrncLNEZorDHJMwsB5k2UGx
 ppy5y8Te1J+hDDTGm8OhLFziwgLr1iNJFK+4t08kEsswbgKeCnEcRvTmk
 DmksVl3dM1rgQhFw3QaO9pnJpQ0IOagiK4OwOcI055ZxtCEU584dPq6E7
 wd49OylARGVDaBVphLwWGdUq47vqHJaXlQS67P679iR8OLKVIk+9eNu8H
 tKdx2ymhVp59Iby8RtNlHBX4zMPd+ozL4GHwhLzVUeT3AY+N6raphXxnr
 vmqJpAFZ8GOyMenp5cTFEeQPdptb2Ih9ThG/1KmkqIx9z6QwctcuJEnPa g==;
X-CSE-ConnectionGUID: OThKHnYcRTaw7+acbSZRGA==
X-CSE-MsgGUID: X9QJmPwgQ9CJpXRCODeSpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54907817"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="54907817"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 08:09:24 -0700
X-CSE-ConnectionGUID: kRlxMx3/SPu8BGSVLj+Ezg==
X-CSE-MsgGUID: VgyJUB25RxeWdk6pmX7cWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="157354678"
Received: from tcingleb-desk1.amr.corp.intel.com (HELO [10.125.111.148])
 ([10.125.111.148])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 08:09:19 -0700
Message-ID: <841e6d14-e3cc-4c23-9256-96f0c4e2d761@intel.com>
Date: Tue, 15 Jul 2025 08:09:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] cxl: mce: Fix typo "notifer"
To: WangYuli <wangyuli@uniontech.com>
Cc: airlied@gmail.com, akpm@linux-foundation.org, alison.schofield@intel.com, 
 andrew+netdev@lunn.ch, andriy.shevchenko@linux.intel.com,
 arend.vanspriel@broadcom.com, bp@alien8.de,
 brcm80211-dev-list.pdl@broadcom.com, brcm80211@lists.linux.dev,
 colin.i.king@gmail.com, cvam0000@gmail.com, dan.j.williams@intel.com,
 dave.hansen@linux.intel.com, dave@stgolabs.net, davem@davemloft.net,
 dri-devel@lists.freedesktop.org, edumazet@google.com,
 gregkh@linuxfoundation.org, guanwentao@uniontech.com, hpa@zytor.com,
 ilpo.jarvinen@linux.intel.com, intel-xe@lists.freedesktop.org,
 ira.weiny@intel.com, j@jannau.net, jeff.johnson@oss.qualcomm.com,
 jgross@suse.com, jirislaby@kernel.org, johannes.berg@intel.com,
 jonathan.cameron@huawei.com, kuba@kernel.org, kvalo@kernel.org,
 kvm@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux@treblig.org, lucas.demarchi@intel.com,
 marcin.s.wojtas@gmail.com, ming.li@zohomail.com, mingo@kernel.org,
 mingo@redhat.com, netdev@vger.kernel.org, niecheng1@uniontech.com,
 oleksandr_tyshchenko@epam.com, pabeni@redhat.com, pbonzini@redhat.com,
 quic_ramess@quicinc.com, ragazenta@gmail.com, rodrigo.vivi@intel.com,
 seanjc@google.com, shenlichuan@vivo.com, simona@ffwll.ch,
 sstabellini@kernel.org, tglx@linutronix.de,
 thomas.hellstrom@linux.intel.com, vishal.l.verma@intel.com, x86@kernel.org,
 xen-devel@lists.xenproject.org, yujiaoliang@vivo.com, zhanjun@uniontech.com
References: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
 <65FC7B96ECBDB052+20250715134407.540483-2-wangyuli@uniontech.com>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <65FC7B96ECBDB052+20250715134407.540483-2-wangyuli@uniontech.com>
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



On 7/15/25 6:44 AM, WangYuli wrote:
> According to the context, "mce_notifer" should be "mce_notifier".
> 
> Link: https://lore.kernel.org/all/B3C019B63C93846F+20250715071245.398846-1-wangyuli@uniontech.com/
> Fixes: 516e5bd0b6bf ("cxl: Add mce notifier to emit aliased address for extended linear cache")
> Signed-off-by: WangYuli <wangyuli@uniontech.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> ---
>  drivers/cxl/core/mce.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cxl/core/mce.h b/drivers/cxl/core/mce.h
> index ace73424eeb6..ca272e8db6c7 100644
> --- a/drivers/cxl/core/mce.h
> +++ b/drivers/cxl/core/mce.h
> @@ -7,7 +7,7 @@
>  
>  #ifdef CONFIG_CXL_MCE
>  int devm_cxl_register_mce_notifier(struct device *dev,
> -				   struct notifier_block *mce_notifer);
> +				   struct notifier_block *mce_notifier);
>  #else
>  static inline int
>  devm_cxl_register_mce_notifier(struct device *dev,


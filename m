Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E19C58530
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 16:22:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202EF10E85F;
	Thu, 13 Nov 2025 15:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I33aUeZX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDD610E85F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 15:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763047369; x=1794583369;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1S/lEwwEIAoQIgeK0eXkfIk1Dc14TBtOKqQwEW2+8TM=;
 b=I33aUeZXnWk5Ucdmz6Ohk3a4wcjGvIpqU5NJKN3nudXid41mcnm+mWy8
 Dtaa8DQik6fQPojJ/8Wkn/P8oODU9zPnc9xSePkm86RxZzrhzjGgx7ySC
 EDSPMUWest0wlJ5/8ToubRgrdGMuLeYjIBrj1DMbY7adtJGsRzOUsBqHC
 vN5CXqAmxPRkz6eoI21qAMET2ZlaiUgWC9z9PIbq0n7wWN/KwoH0bBLic
 MeMJYwCsdgIAXQrLF4eKZNVI9FEtc3H31xecgil7n/O1VfeYYTuIbHmu1
 fDJJsZFw071WSJdpYf2QFhbcTK4SksA+upNPyvwqHfArn0GIHHksePc9t g==;
X-CSE-ConnectionGUID: PdXpq98aQuulu8uuj3VuVw==
X-CSE-MsgGUID: q3oly0L6Ql+zuZXYXybB4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65169089"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="65169089"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 07:22:49 -0800
X-CSE-ConnectionGUID: knFBjVgZSa62bHP2w4ADJA==
X-CSE-MsgGUID: a61Gpr/lQdu4hnM0S+m4Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="193964618"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.246.18.39])
 ([10.246.18.39])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 07:22:48 -0800
Message-ID: <3ee3c7a6-65cc-4d67-9a4d-5b9b09e7908e@linux.intel.com>
Date: Thu, 13 Nov 2025 16:22:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/amdxdna: Clear mailbox interrupt register during
 channel creation
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com,
 mario.limonciello@amd.com
References: <20251107181115.1293158-1-lizhi.hou@amd.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <20251107181115.1293158-1-lizhi.hou@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

On 11/7/2025 7:11 PM, Lizhi Hou wrote:
> The mailbox interrupt register is not always cleared when a mailbox channel
> is created. This can leave stale interrupt states from previous operations.
>
> Fix this by explicitly clearing the interrupt register in the mailbox
> channel creation function.
>
> Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/amdxdna_mailbox.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
> index 24258dcc18eb..858df97cd3fb 100644
> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
> @@ -516,6 +516,7 @@ xdna_mailbox_create_channel(struct mailbox *mb,
>   	}
>   
>   	mb_chann->bad_state = false;
> +	mailbox_reg_write(mb_chann, mb_chann->iohub_int_addr, 0);
>   
>   	MB_DBG(mb_chann, "Mailbox channel created (irq: %d)", mb_chann->msix_irq);
>   	return mb_chann;

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3144982AB3C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 10:49:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7F610E88A;
	Thu, 11 Jan 2024 09:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C20A10E88A
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 09:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704966595; x=1736502595;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=tAsm8yoR5IypZ9Vanz2h/n8ymc/BnOwePGQki51WXUc=;
 b=KWJtZKlg7zh211C3r0cb5S53aJq00b+AMr5LVrOIiuJxbKbC6pXMVHQF
 LFYMED7kFT4QNAWzIswGvIGrn+Mph/n88AQH4W4rLN0n1eE/gxxVRCmmm
 fVYuclhITssCmsQyhMhlQ88Id1gkLnlhcjvuAxArhMe49XSG9uCyyBQ+B
 KfbzbMlKhcSz0LLMuetRLf1yk9oAPONLNYla8QzOw2pwahOFu6m9kJjke
 79gRFwyqKDd2mjz4AfRhR+jKCGf3Rn12brbK97qKSovcS64fB25Nwg1FF
 i81Gspn/W3Q2GdAymy2Suo5jkiTRznDT9W/lO35wgf1uadCoqIikt88u+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="12284068"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="12284068"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 01:49:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="1113781983"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; d="scan'208";a="1113781983"
Received: from gaertgee-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.206])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2024 01:49:51 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: GuoHua Chen <chenguohua_716@163.com>, tzimmermann@suse.de,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, daniel@ffwll.ch,
 mripard@kernel.org, patrik.r.jakobsson@gmail.com
Subject: Re: [PATCH] gma500: Clean up errors in psb_intel_sdvo_regs.h
In-Reply-To: <20240111070720.9602-1-chenguohua_716@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240111070720.9602-1-chenguohua_716@163.com>
Date: Thu, 11 Jan 2024 11:49:48 +0200
Message-ID: <87edeourlv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 GuoHua Chen <chenguohua_716@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 11 Jan 2024, GuoHua Chen <chenguohua_716@163.com> wrote:
> Fix the following errors reported by checkpatch:
>
> ERROR: space required after that close brace '}'
>
> Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
> ---
>  drivers/gpu/drm/gma500/psb_intel_sdvo_regs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo_regs.h b/drivers/gpu/drm/gma500/psb_intel_sdvo_regs.h
> index 600e79744d68..e358a6b1bcce 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_sdvo_regs.h
> +++ b/drivers/gpu/drm/gma500/psb_intel_sdvo_regs.h
> @@ -666,7 +666,7 @@ struct psb_intel_sdvo_enhancement_limits_reply {
>  #define SDVO_CMD_SET_TV_LUMA_FILTER			0x79
>  struct psb_intel_sdvo_enhancements_arg {
>      u16 value;
> -}__attribute__((packed));
> +} __attribute__((packed));

__packed is preferred over __attribute__((packed)) anyway...

BR,
Jani.



>  
>  #define SDVO_CMD_GET_DOT_CRAWL				0x70
>  #define SDVO_CMD_SET_DOT_CRAWL				0x71

-- 
Jani Nikula, Intel

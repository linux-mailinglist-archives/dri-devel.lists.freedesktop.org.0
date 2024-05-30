Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7BC8D50D1
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 19:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D02112CBA;
	Thu, 30 May 2024 17:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mAeiNqSa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409F61129CA;
 Thu, 30 May 2024 17:17:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 993E562886;
 Thu, 30 May 2024 17:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A393EC2BBFC;
 Thu, 30 May 2024 17:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717089430;
 bh=iZR6IHmeSBh9bdyLMQRmhd+tC//9mar20EMaEAByleM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mAeiNqSaitwlpWJx2sMROMuiVppMSzVmQNnQscNcH6VAD15OKWh3S0t/nHo5zoIHt
 qI4TWmysJM/fqEjNgUDtujYaeoNFppY3o1vK8iqGo3obrS4Zqa+uTTlwUSmzRLiLx9
 X19po4tRjjqgkBjwJ15EzbuvS7EMCCxPED0AXb+1uOnwOPzlvYV5fAXFMPfw+qy3Ak
 oIjzWpLbzh73Ts1JsBwReCgKEs0AGZAflNTAnTIldga/avQZYuktbMFZGRuEiApKrL
 YI8xbY3Shm8tzTghbP3hOAbp3p1aPyYOaavBn/OVQ0Sa9fj25bBOWUblB+7N5JrbfG
 gzKm7P45D3UYA==
Date: Thu, 30 May 2024 20:17:04 +0300
From: Zhi Wang <zhiwang@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/edid: make drm_edid_block_valid() static
Message-ID: <20240530201704.0000492c.zhiwang@kernel.org>
In-Reply-To: <20240530124352.362736-2-jani.nikula@intel.com>
References: <20240530124352.362736-1-jani.nikula@intel.com>
 <20240530124352.362736-2-jani.nikula@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Thu, 30 May 2024 15:43:52 +0300
Jani Nikula <jani.nikula@intel.com> wrote:

> drm_edid_block_valid() is no longer used outside of drm_edid.c. Make
> it static.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> Cc: Zhi Wang <zhi.wang.linux@gmail.com>
> Cc: intel-gvt-dev@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/drm_edid.c | 17 ++++-------------
>  include/drm/drm_edid.h     |  2 --
>  2 files changed, 4 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index f68a41eeb1fa..13b3fd351b16 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1966,22 +1966,14 @@ static void edid_block_dump(const char
> *level, const void *block, int block_num) block, EDID_LENGTH, false);
>  }
>  
> -/**
> - * drm_edid_block_valid - Sanity check the EDID block (base or
> extension)
> - * @_block: pointer to raw EDID block
> - * @block_num: type of block to validate (0 for base, extension
> otherwise)
> - * @print_bad_edid: if true, dump bad EDID blocks to the console
> - * @edid_corrupt: if true, the header or checksum is invalid
> - *
> +/*
>   * Validate a base or extension EDID block and optionally dump bad
> blocks to
>   * the console.
> - *
> - * Return: True if the block is valid, false otherwise.
>   */
> -bool drm_edid_block_valid(u8 *_block, int block_num, bool
> print_bad_edid,
> -			  bool *edid_corrupt)
> +static bool drm_edid_block_valid(void *_block, int block_num, bool
> print_bad_edid,
> +				 bool *edid_corrupt)
>  {
> -	struct edid *block = (struct edid *)_block;
> +	struct edid *block = _block;
>  	enum edid_block_status status;
>  	bool is_base_block = block_num == 0;
>  	bool valid;
> @@ -2024,7 +2016,6 @@ bool drm_edid_block_valid(u8 *_block, int
> block_num, bool print_bad_edid, 
>  	return valid;
>  }
> -EXPORT_SYMBOL(drm_edid_block_valid);
>  
>  /**
>   * drm_edid_is_valid - sanity check EDID data
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 6bdfa254a1c1..eaac5e665892 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -440,8 +440,6 @@ int drm_add_modes_noedid(struct drm_connector
> *connector, int hdisplay, int vdisplay);
>  
>  int drm_edid_header_is_valid(const void *edid);
> -bool drm_edid_block_valid(u8 *raw_edid, int block, bool
> print_bad_edid,
> -			  bool *edid_corrupt);
>  bool drm_edid_is_valid(struct edid *edid);
>  void drm_edid_get_monitor_name(const struct edid *edid, char *name,
>  			       int buflen);

Acked-by: Zhi Wang <zhiwang@kernel.rog>

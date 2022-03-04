Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7024CDA80
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 18:31:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183ED10F951;
	Fri,  4 Mar 2022 17:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 347 seconds by postgrey-1.36 at gabe;
 Fri, 04 Mar 2022 17:31:17 UTC
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39BE10F951;
 Fri,  4 Mar 2022 17:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id D22E7408A9;
 Fri,  4 Mar 2022 18:25:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.11
X-Spam-Level: 
X-Spam-Status: No, score=-2.11 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c3Vjh5jF4ANB; Fri,  4 Mar 2022 18:25:27 +0100 (CET)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 8D68740657;
 Fri,  4 Mar 2022 18:25:27 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="gCXtasJd";
 dkim-atps=neutral
Received: from [192.168.0.209] (unknown [192.55.54.50])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 638F63602D9;
 Fri,  4 Mar 2022 18:25:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1646414727; bh=mR4aNrIzdnBiHfLDuZWLgPKjbJzB0irlhj9gZaGh+dY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gCXtasJdhkNe7J5/0mugiM2UyL+maeUWcFnTJ0LuZLQ+aabLZu/a28SHpfnNfU7az
 EBqQGqbqLoZSA0N2FAfyx30cmJ6CRV39Xmf7d8ht4OgpsBTy1BJ67xbIXca21SsZiF
 +jDmorJ13tQj+jIxcQx+sm7Psr/ewOpwTh04AP0o=
Message-ID: <bcc30997-a759-ca1b-c3d5-38b7de856146@shipmail.org>
Date: Fri, 4 Mar 2022 18:25:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gtt: reduce overzealous alignment
 constraints for GGTT
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220303100229.839282-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20220303100229.839282-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/3/22 11:02, Matthew Auld wrote:
> Currently this will enforce both 2M alignment and padding for any LMEM
> pages inserted into the GGTT. However, this was only meant to be applied
> to the compact-pt layout with the ppGTT. For the GGTT we can reduce the
> alignment and padding to 64K.
>
> Bspec: 45015
> Fixes: 87bd701ee268 ("drm/i915: enforce min GTT alignment for discrete cards")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Robert Beckett <bob.beckett@collabora.com>
> Cc: Ramalingam C <ramalingam.c@intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/i915/gt/intel_gtt.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index 4bcdfcab3642..a5f5b2dda332 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -234,7 +234,8 @@ void i915_address_space_init(struct i915_address_space *vm, int subclass)
>   	memset64(vm->min_alignment, I915_GTT_MIN_ALIGNMENT,
>   		 ARRAY_SIZE(vm->min_alignment));
>   
> -	if (HAS_64K_PAGES(vm->i915) && NEEDS_COMPACT_PT(vm->i915)) {
> +	if (HAS_64K_PAGES(vm->i915) && NEEDS_COMPACT_PT(vm->i915) &&
> +	    subclass == VM_CLASS_PPGTT) {
>   		vm->min_alignment[INTEL_MEMORY_LOCAL] = I915_GTT_PAGE_SIZE_2M;
>   		vm->min_alignment[INTEL_MEMORY_STOLEN_LOCAL] = I915_GTT_PAGE_SIZE_2M;
>   	} else if (HAS_64K_PAGES(vm->i915)) {

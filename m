Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4729C321A22
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 15:21:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697A56E514;
	Mon, 22 Feb 2021 14:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8A66E524;
 Mon, 22 Feb 2021 14:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=h/4fTKGARCgog3SkiMpNKyKBIuxHr1/DvbKuL0vuoYU=; b=Z4+PNRDCFs1sEkUQjnEYSLkZMO
 os8dzNXxUuQqlADj2cgJOcOB3SBs0qlI9yj1t3Iguvt90UEq2R/s61LV20nTIO2d4Oj/dwRUrIlrY
 cdliADum2gRiZgKeFjObqhec7Jq/Vdmi8tdmuVSBfSQqR24wUHq3jJypzEjaE0d+4Uvzcl8AJ0vQs
 bJqXs5a61NAGGqur8COSILqkXr0u/hJRcmGiTtBnkXQQWSdSvOZ1364zFoC/H5hTjDKpwd2UcrUpE
 EFFuAKf7m+b3AH/p8VZ3NJhqodI1iQ/J5z090NmR+Kw609+xfhQef6bjetc4FN1J5MoQ2jvbvya7k
 GG5Tn6rw==;
Received: from [2601:1c0:6280:3f0::d05b]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEC5n-00064O-3q; Mon, 22 Feb 2021 14:21:43 +0000
Subject: Re: [PATCH] drivers: gnu: drm: i915: gvt: Fixed couple of spellings
 in the file gtt.c
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, jani.nikula@linux.intel.com,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210222081838.30328-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c4d15313-78a6-a7c8-97c9-8291600f6264@infradead.org>
Date: Mon, 22 Feb 2021 06:21:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222081838.30328-1-unixbhaskar@gmail.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/22/21 12:18 AM, Bhaskar Chowdhury wrote:
> 
> s/negtive/negative/
> s/possilbe/possible/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  drivers/gpu/drm/i915/gvt/gtt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
> index 897c007ea96a..dc5834bf4de2 100644
> --- a/drivers/gpu/drm/i915/gvt/gtt.c
> +++ b/drivers/gpu/drm/i915/gvt/gtt.c
> @@ -1159,8 +1159,8 @@ static inline void ppgtt_generate_shadow_entry(struct intel_gvt_gtt_entry *se,
>   * @vgpu: target vgpu
>   * @entry: target pfn's gtt entry
>   *
> - * Return 1 if 2MB huge gtt shadowing is possilbe, 0 if miscondition,
> - * negtive if found err.
> + * Return 1 if 2MB huge gtt shadowing is possible, 0 if miscondition,
> + * negative if found err.
>   */
>  static int is_2MB_gtt_possible(struct intel_vgpu *vgpu,
>  	struct intel_gvt_gtt_entry *entry)
> --


-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

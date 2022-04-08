Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 864BB4F9148
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 11:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC62B10F0C3;
	Fri,  8 Apr 2022 09:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BA810F0A7;
 Fri,  8 Apr 2022 09:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 0B97E40D51;
 Fri,  8 Apr 2022 11:02:44 +0200 (CEST)
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
 with ESMTP id pMPm-3t16hHJ; Fri,  8 Apr 2022 11:02:43 +0200 (CEST)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 9D9EE40D20;
 Fri,  8 Apr 2022 11:02:42 +0200 (CEST)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="fk86e+ef";
 dkim-atps=neutral
Received: from [192.168.0.209] (unknown [192.55.55.53])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 71BC03602A5;
 Fri,  8 Apr 2022 11:02:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1649408562; bh=UUuMEs4VsOBehZaS7GrRfIZ0eMYxrkWN1hHJ3IerjkY=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=fk86e+ef22Tv1rJuICqUd/um8c74uM7nqMGczAbQqjkQf1v22ZoWU2Qoc0oIidamg
 ropfbPuxT9y3SMgBKkZK40+51swdozujwAOrYL6vDIQkVFEALrUo4MDmRMBP83ALn3
 imItfm29MVhjbD+LVWx9u4IVoOTMzdymk4wP8upw=
Message-ID: <23680693-2c9a-a980-919f-2bcc036f8cab@shipmail.org>
Date: Fri, 8 Apr 2022 11:02:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH v9 4/9] drm/i915/gt: Pass the -EINVAL when
 emit_pte doesn't update any PTE
Content-Language: en-US
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20220405150840.29351-1-ramalingam.c@intel.com>
 <20220405150840.29351-5-ramalingam.c@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20220405150840.29351-5-ramalingam.c@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/5/22 17:08, Ramalingam C wrote:
> When emit_pte doesn't update any PTE with return value as 0, interpret
> it as -EINVAL.
>
> v2:
>    Add missing goto [Thomas]
>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_migrate.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> index e0f1c727662e..6378d4450e1a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -577,7 +577,11 @@ intel_context_migrate_copy(struct intel_context *ce,
>   
>   		len = emit_pte(rq, &it_src, src_cache_level, src_is_lmem,
>   			       src_offset, CHUNK_SZ);

     if (len <= 0) {

         err = len ? len : -EINVAL;

         goto out_rq;

} ?

Up to you.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>



> -		if (len <= 0) {
> +		if (!len) {
> +			err = -EINVAL;
> +			goto out_rq;
> +		}
> +		if (len < 0) {
>   			err = len;
>   			goto out_rq;
>   		}

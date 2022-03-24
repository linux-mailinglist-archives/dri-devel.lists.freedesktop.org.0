Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AC34E66DF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 17:20:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3D710E8E8;
	Thu, 24 Mar 2022 16:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7372F10E8E8;
 Thu, 24 Mar 2022 16:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id A79853F66C;
 Thu, 24 Mar 2022 17:20:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.111
X-Spam-Level: 
X-Spam-Status: No, score=-2.111 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Authentication-Results: ste-pvt-msa1.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NQynLqPn4r-M; Thu, 24 Mar 2022 17:20:35 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id C808E3F641;
 Thu, 24 Mar 2022 17:20:34 +0100 (CET)
Received: from [192.168.0.209] (unknown [192.55.54.50])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 3E9EA362508;
 Thu, 24 Mar 2022 17:20:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1648138834; bh=PL/H/Cg6o+NjjCjYhpKoz5addjaflYuhMbacEi+EPlM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OlrSMpsPvwjFeC32UGS28apFDPbxVmeKgGYj7gSkfm1hu8MY8nnoDwZE0wnrpilTV
 wdklCKyLn1qVC7u3VfykH7pLePpEOSNVm0O0wK6vRFLmxhBes3Ry0Gckf7EYpBQd8Y
 H/BbUf4+l7ElHCcvIOn7saYpYrZmJUjSTvgT4ovI=
Message-ID: <6eebe04c-da24-600d-1c46-8ae341d7a061@shipmail.org>
Date: Thu, 24 Mar 2022 17:20:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH v5 6/9] drm/i915/gt: offset handling for
 multiple copy engines
Content-Language: en-US
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20220321224459.12223-1-ramalingam.c@intel.com>
 <20220321224459.12223-7-ramalingam.c@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20220321224459.12223-7-ramalingam.c@intel.com>
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/21/22 23:44, Ramalingam C wrote:
> Handle the src and dst chunk offsets for different instances of the copy
> engines.
>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_migrate.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> index 39a5f8ae664d..5f6341f91622 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -614,6 +614,9 @@ static int emit_copy(struct i915_request *rq,
>   	u32 instance = rq->engine->instance;
>   	u32 *cs;
>   
> +	src_offset += (u64)rq->engine->instance << 32;
> +	dst_offset += (u64)rq->engine->instance << 32;
> +

Again, these are nops since the offsets are 32-bit.

Also the instance selection is already handled in the functon, so I 
think this patch can be dropped.


>   	cs = intel_ring_begin(rq, ver >= 8 ? 10 : 6);
>   	if (IS_ERR(cs))
>   		return PTR_ERR(cs);

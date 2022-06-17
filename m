Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A8754F7B1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 14:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E138910F858;
	Fri, 17 Jun 2022 12:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 539 seconds by postgrey-1.36 at gabe;
 Fri, 17 Jun 2022 12:37:45 UTC
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C600310F858
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 12:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id ED5993F4DA;
 Fri, 17 Jun 2022 14:28:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.337
X-Spam-Level: 
X-Spam-Status: No, score=-3.337 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.228,
 T_SCC_BODY_TEXT_LINE=-0.01, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2qq76ym5NGOj; Fri, 17 Jun 2022 14:28:42 +0200 (CEST)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 5535F3F4AA;
 Fri, 17 Jun 2022 14:28:38 +0200 (CEST)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="L0ExsEU6";
 dkim-atps=neutral
Received: from [192.168.0.209] (unknown [192.198.151.53])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 43BCF36016C;
 Fri, 17 Jun 2022 14:28:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1655468917; bh=pkvt4dL4jw2qqvp5gx6kTLQqbPCJTYjQvOkaDj1Wmt8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=L0ExsEU6XAPo5//+i6mDN++zaPDkp8c5GUPHFmlnym85W/oOMtccjY8tRRPZAhFYR
 RxhyCuLkP1LQAkxYC79OV6DUnNPos0umjpxqemIqKaFo4xwjae7YTWV1PRwGq/7QTM
 IkWajWrcS0QLklZ9u+qIco1UEHQC1zsrLJeQXdos=
Message-ID: <edf3956e-ed30-0716-c6ae-eac7aaadd7df@shipmail.org>
Date: Fri, 17 Jun 2022 14:28:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [Intel-gfx] [PATCH 08/10] drm/i915/uapi: disable capturing
 objects on recoverable contexts
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220525184337.491763-1-matthew.auld@intel.com>
 <20220525184337.491763-9-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20220525184337.491763-9-matthew.auld@intel.com>
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
 Kenneth Graunke <kenneth@whitecape.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/25/22 20:43, Matthew Auld wrote:
> A non-recoverable context must be used if the user wants proper error
> capture on discrete platforms. In the future the kernel may want to blit
> the contents of some objects when later doing the capture stage.
>
> Testcase: igt@gem_exec_capture@capture-recoverable-discrete
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index b279588c0672..e27ccfa50dc3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -1961,7 +1961,7 @@ eb_find_first_request_added(struct i915_execbuffer *eb)
>   #if IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR)
>   
>   /* Stage with GFP_KERNEL allocations before we enter the signaling critical path */
> -static void eb_capture_stage(struct i915_execbuffer *eb)
> +static int eb_capture_stage(struct i915_execbuffer *eb)
>   {
>   	const unsigned int count = eb->buffer_count;
>   	unsigned int i = count, j;
> @@ -1974,6 +1974,10 @@ static void eb_capture_stage(struct i915_execbuffer *eb)
>   		if (!(flags & EXEC_OBJECT_CAPTURE))
>   			continue;
>   
> +		if (i915_gem_context_is_recoverable(eb->gem_context) &&
> +		    IS_DGFX(eb->i915))
> +			return -EINVAL;
> +

We should also require this for future integrated, for capture buffer 
memory allocation purposes.

Otherwise Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>



Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C284F9847
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 16:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4DF10E530;
	Fri,  8 Apr 2022 14:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C4D10E530;
 Fri,  8 Apr 2022 14:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 510613F58C;
 Fri,  8 Apr 2022 16:38:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.11
X-Spam-Level: 
X-Spam-Status: No, score=-2.11 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: pio-pvt-msa1.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pwaE3x6e6LB3; Fri,  8 Apr 2022 16:38:16 +0200 (CEST)
Received: by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id C2E013F3EA;
 Fri,  8 Apr 2022 16:38:14 +0200 (CEST)
Received: from [192.168.0.209] (fmdmzpr02-ext.fm.intel.com [192.55.54.37])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 8F3EF3625D5;
 Fri,  8 Apr 2022 16:38:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1649428694; bh=acgujF9g/fvpJaIIKVU7S+rhUEDdArhXjT/Aen83efI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KNp4RBHM03YN12XkgMGlKhCiCs5zarQLd+XUQRKuVIQ1yN/FiLWs6l0sNEpksuTQj
 W+aRJWbLGOvlSVwppTj9B+h5zh1jO+7x98S4TIJAKe8nM+Ob1d10zTWH/LSb3k6OP3
 38YDDZ4VZawieba3DguwCbvVvBFYtVccERFkAVXU=
Message-ID: <9f865b14-817f-153e-0bfb-38ca76c25dbd@shipmail.org>
Date: Fri, 8 Apr 2022 16:38:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH 2/4] drm/i915/selftests: Check for incomplete
 LRI from the context image
Content-Language: en-US
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20220314182005.17071-1-ramalingam.c@intel.com>
 <20220314182005.17071-3-ramalingam.c@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20220314182005.17071-3-ramalingam.c@intel.com>
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/14/22 19:20, Ramalingam C wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
>
> In order to keep the context image parser simple, we assume that all
> commands follow a similar format. A few, especially not MI commands on
> the render engines, have fixed lengths not encoded in a length field.
> This caused us to incorrectly skip over 3D state commands, and start
> interpretting context data as instructions. Eventually, as Daniele

interpreting


> discovered, this would lead us to find addition LRI as part of the data
> and mistakenly add invalid LRI commands to the context probes.
>
> Stop parsing after we see the first !MI command, as we know we will have
> seen all the context registers by that point. (Mostly true for all gen so far,
> though the render context does have LRI after the first page that we
> have been ignoring so far. It would be useful to extract those as well
> so that we have the full list of user accesisble registers.)
accessible
>
> Similarly, emit a warning if we do try to emit an invalid zero-length
> LRI.
>
> Reported-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>

Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>




> ---
>   drivers/gpu/drm/i915/gt/selftest_lrc.c | 61 +++++++++++++++++++++++---
>   1 file changed, 54 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> index 13f57c7c4224..0a8ed4246082 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> @@ -27,6 +27,9 @@
>   #define NUM_GPR 16
>   #define NUM_GPR_DW (NUM_GPR * 2) /* each GPR is 2 dwords */
>   
> +#define LRI_HEADER MI_INSTR(0x22, 0)
> +#define LRI_LENGTH_MASK GENMASK(7, 0)
> +
>   static struct i915_vma *create_scratch(struct intel_gt *gt)
>   {
>   	return __vm_create_scratch_for_read_pinned(&gt->ggtt->vm, PAGE_SIZE);
> @@ -180,7 +183,7 @@ static int live_lrc_layout(void *arg)
>   				continue;
>   			}
>   
> -			if ((lri & GENMASK(31, 23)) != MI_INSTR(0x22, 0)) {
> +			if ((lri & GENMASK(31, 23)) != LRI_HEADER) {
>   				pr_err("%s: Expected LRI command at dword %d, found %08x\n",
>   				       engine->name, dw, lri);
>   				err = -EINVAL;
> @@ -945,18 +948,40 @@ store_context(struct intel_context *ce, struct i915_vma *scratch)
>   	hw = defaults;
>   	hw += LRC_STATE_OFFSET / sizeof(*hw);
>   	do {
> -		u32 len = hw[dw] & 0x7f;
> +		u32 len = hw[dw] & LRI_LENGTH_MASK;
> +
> +		/*
> +		 * Keep it simple, skip parsing complex commands
> +		 *
> +		 * At present, there are no more MI_LOAD_REGISTER_IMM
> +		 * commands after the first 3D state command. Rather
> +		 * than include a table (see i915_cmd_parser.c) of all
> +		 * the possible commands and their instruction lengths
> +		 * (or mask for variable length instructions), assume
> +		 * we have gathered the complete list of registers and
> +		 * bail out.
> +		 */
> +		if ((hw[dw] >> INSTR_CLIENT_SHIFT) != INSTR_MI_CLIENT)
> +			break;
>   
>   		if (hw[dw] == 0) {
>   			dw++;
>   			continue;
>   		}
>   
> -		if ((hw[dw] & GENMASK(31, 23)) != MI_INSTR(0x22, 0)) {
> +		if ((hw[dw] & GENMASK(31, 23)) != LRI_HEADER) {
> +			/* Assume all other MI commands match LRI length mask */
>   			dw += len + 2;
>   			continue;
>   		}
>   
> +		if (!len) {
> +			pr_err("%s: invalid LRI found in context image\n",
> +			       ce->engine->name);
> +			igt_hexdump(defaults, PAGE_SIZE);
> +			break;
> +		}
> +
>   		dw++;
>   		len = (len + 1) / 2;
>   		while (len--) {
> @@ -1108,18 +1133,29 @@ static struct i915_vma *load_context(struct intel_context *ce, u32 poison)
>   	hw = defaults;
>   	hw += LRC_STATE_OFFSET / sizeof(*hw);
>   	do {
> -		u32 len = hw[dw] & 0x7f;
> +		u32 len = hw[dw] & LRI_LENGTH_MASK;
> +
> +		/* For simplicity, break parsing at the first complex command */
> +		if ((hw[dw] >> INSTR_CLIENT_SHIFT) != INSTR_MI_CLIENT)
> +			break;
>   
>   		if (hw[dw] == 0) {
>   			dw++;
>   			continue;
>   		}
>   
> -		if ((hw[dw] & GENMASK(31, 23)) != MI_INSTR(0x22, 0)) {
> +		if ((hw[dw] & GENMASK(31, 23)) != LRI_HEADER) {
>   			dw += len + 2;
>   			continue;
>   		}
>   
> +		if (!len) {
> +			pr_err("%s: invalid LRI found in context image\n",
> +			       ce->engine->name);
> +			igt_hexdump(defaults, PAGE_SIZE);
> +			break;
> +		}
> +
>   		dw++;
>   		len = (len + 1) / 2;
>   		*cs++ = MI_LOAD_REGISTER_IMM(len);
> @@ -1248,18 +1284,29 @@ static int compare_isolation(struct intel_engine_cs *engine,
>   	hw = defaults;
>   	hw += LRC_STATE_OFFSET / sizeof(*hw);
>   	do {
> -		u32 len = hw[dw] & 0x7f;
> +		u32 len = hw[dw] & LRI_LENGTH_MASK;
> +
> +		/* For simplicity, break parsing at the first complex command */
> +		if ((hw[dw] >> INSTR_CLIENT_SHIFT) != INSTR_MI_CLIENT)
> +			break;
>   
>   		if (hw[dw] == 0) {
>   			dw++;
>   			continue;
>   		}
>   
> -		if ((hw[dw] & GENMASK(31, 23)) != MI_INSTR(0x22, 0)) {
> +		if ((hw[dw] & GENMASK(31, 23)) != LRI_HEADER) {
>   			dw += len + 2;
>   			continue;
>   		}
>   
> +		if (!len) {
> +			pr_err("%s: invalid LRI found in context image\n",
> +			       engine->name);
> +			igt_hexdump(defaults, PAGE_SIZE);
> +			break;
> +		}
> +
>   		dw++;
>   		len = (len + 1) / 2;
>   		while (len--) {

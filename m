Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B4675EE3D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 10:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C7110E28B;
	Mon, 24 Jul 2023 08:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D870110E079;
 Mon, 24 Jul 2023 08:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690188484; x=1721724484;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=z6WKrPOqccks9UznrP+SieFzma314ZrErRubJ8aZa4M=;
 b=eiiLMoygtMOD6xkuZTNT6EdxWCEUoinHM3hnTog674PZJBfVCZ6Tvz5O
 x14Irxjt4sew6n2kclLDVgjmWMv1VscM1P5A7WKPEP+14QxIxJDN4sJ/w
 Kp1/724BX4MOhdp9L+EF6xrNC+xtDkgh/JtiaJu8lVtD8WA71a0NSoVe4
 EiKrLWUOCul7raPxLHZlqzCnkuxA7/QerYzToFlcPve3H3sqPf0A1pyY+
 QFXnddQQwhvZop0HDpbozUn3q4YQ/nnRwFhLqKM7JoCJ88m8zk62Vz/WI
 /Dc1wKdtd56olYE37QApWHBt6//7n0KnaLj+GOPC7MQ+xhGuzFbreT+fS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="370987325"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
 d="scan'208,217";a="370987325"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 01:48:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="972186313"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
 d="scan'208,217";a="972186313"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.58.138])
 ([10.252.58.138])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 01:47:59 -0700
Content-Type: multipart/alternative;
 boundary="------------0TcQzCjP5LPb49uCYPIo1bTL"
Message-ID: <258e5c3a-a668-1178-00b1-ae197a35c79e@linux.intel.com>
Date: Mon, 24 Jul 2023 10:47:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Intel-gfx] [PATCH v8 5/9] drm/i915/gt: Enable the CCS_FLUSH bit
 in the pipe control
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
References: <20230721161514.818895-1-andi.shyti@linux.intel.com>
 <20230721161514.818895-6-andi.shyti@linux.intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20230721161514.818895-6-andi.shyti@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-evel <dri-devel@lists.freedesktop.org>,
 linux-stable <stable@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------0TcQzCjP5LPb49uCYPIo1bTL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/21/2023 6:15 PM, Andi Shyti wrote:
> Enable the CCS_FLUSH bit 13 in the control pipe for render and
> compute engines in platforms starting from Meteor Lake (BSPEC
> 43904 and 47112).
>
> Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
> Signed-off-by: Andi Shyti<andi.shyti@linux.intel.com>
> Cc: Jonathan Cavitt<jonathan.cavitt@intel.com>
> Cc: Nirmoy Das<nirmoy.das@intel.com>
> Cc:<stable@vger.kernel.org>  # v5.8+

|Reviewed-by: Nirmoy Das <nirmoy.das@intel.com> |

> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 7 +++++++
>   drivers/gpu/drm/i915/gt/intel_gpu_commands.h | 1 +
>   2 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 5d2175e918dd2..139a7e69f5c4d 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -230,6 +230,13 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>   
>   		bit_group_0 |= PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
>   
> +		/*
> +		 * When required, in MTL and beyond platforms we
> +		 * need to set the CCS_FLUSH bit in the pipe control
> +		 */
> +		if (GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
> +			bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
> +
>   		bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
>   		bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
>   		bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
> diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> index 5d143e2a8db03..5df7cce23197c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> @@ -299,6 +299,7 @@
>   #define   PIPE_CONTROL_QW_WRITE				(1<<14)
>   #define   PIPE_CONTROL_POST_SYNC_OP_MASK                (3<<14)
>   #define   PIPE_CONTROL_DEPTH_STALL			(1<<13)
> +#define   PIPE_CONTROL_CCS_FLUSH			(1<<13) /* MTL+ */
>   #define   PIPE_CONTROL_WRITE_FLUSH			(1<<12)
>   #define   PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH	(1<<12) /* gen6+ */
>   #define   PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE	(1<<11) /* MBZ on ILK */
--------------0TcQzCjP5LPb49uCYPIo1bTL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/21/2023 6:15 PM, Andi Shyti wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230721161514.818895-6-andi.shyti@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">Enable the CCS_FLUSH bit 13 in the control pipe for render and
compute engines in platforms starting from Meteor Lake (BSPEC
43904 and 47112).

Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
Signed-off-by: Andi Shyti <a class="moz-txt-link-rfc2396E" href="mailto:andi.shyti@linux.intel.com">&lt;andi.shyti@linux.intel.com&gt;</a>
Cc: Jonathan Cavitt <a class="moz-txt-link-rfc2396E" href="mailto:jonathan.cavitt@intel.com">&lt;jonathan.cavitt@intel.com&gt;</a>
Cc: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
Cc: <a class="moz-txt-link-rfc2396E" href="mailto:stable@vger.kernel.org">&lt;stable@vger.kernel.org&gt;</a> # v5.8+</pre>
    </blockquote>
    <br>
    <pre class="moz-quote-pre" wrap=""><code style="padding: 0px; tab-size: 8;" class="hljs diff language-diff"><span class="hljs-addition">Reviewed-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
</span></code></pre>
    <blockquote type="cite"
      cite="mid:20230721161514.818895-6-andi.shyti@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 7 +++++++
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 5d2175e918dd2..139a7e69f5c4d 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -230,6 +230,13 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 
 		bit_group_0 |= PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
 
+		/*
+		 * When required, in MTL and beyond platforms we
+		 * need to set the CCS_FLUSH bit in the pipe control
+		 */
+		if (GRAPHICS_VER_FULL(rq-&gt;i915) &gt;= IP_VER(12, 70))
+			bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
+
 		bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
 		bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
 		bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
index 5d143e2a8db03..5df7cce23197c 100644
--- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
+++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
@@ -299,6 +299,7 @@
 #define   PIPE_CONTROL_QW_WRITE				(1&lt;&lt;14)
 #define   PIPE_CONTROL_POST_SYNC_OP_MASK                (3&lt;&lt;14)
 #define   PIPE_CONTROL_DEPTH_STALL			(1&lt;&lt;13)
+#define   PIPE_CONTROL_CCS_FLUSH			(1&lt;&lt;13) /* MTL+ */
 #define   PIPE_CONTROL_WRITE_FLUSH			(1&lt;&lt;12)
 #define   PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH	(1&lt;&lt;12) /* gen6+ */
 #define   PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE	(1&lt;&lt;11) /* MBZ on ILK */
</pre>
    </blockquote>
  </body>
</html>

--------------0TcQzCjP5LPb49uCYPIo1bTL--

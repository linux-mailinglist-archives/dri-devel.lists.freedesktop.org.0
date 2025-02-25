Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AF2A44207
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 15:12:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDDE510E6CD;
	Tue, 25 Feb 2025 14:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Ae/FFGPo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D115D10E6C8;
 Tue, 25 Feb 2025 14:12:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E59EC44286;
 Tue, 25 Feb 2025 14:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740492736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DdeMLdXkHBUeXTddiqc7hjBCnQBZoAaBduGvaRwy1Nk=;
 b=Ae/FFGPo+WAWEWCU6/8Muxaw5CPsCr17TL0QFsZmskyIpDdTzFpqUhoUTfkkPK4Thjpu2S
 E1JQx651mjmQ58UxoAPhcEMcLKcnWe/N4FRg4XpKYohAuD79kuqSpP5Ci4DOEE50ROiOY1
 apjG5SoKJ7mD/21TX+B/4aeX9gMWDj9Q4h1xar6QohKfyIfHIrME+CVVXE0/fPhU2GBm0x
 L+6L11XafBAbEFEqXUOu9mH0P+h3C3iUOQQd2syd/4Ds7gI9AlnRa6i+DUbsX5DNbkGM6Y
 x/jLghFO27Dpuo+pQ7QnxvNVRw+qjVCR0pNADZoU1QkdZzkpMmVKkTiYfj7d2A==
Date: Tue, 25 Feb 2025 15:12:13 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH 12/63] dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
Message-ID: <c2af2a43-e427-4949-97e0-79029d30a804@bootlin.com>
Mail-Followup-To: Jim Cromie <jim.cromie@gmail.com>,
 linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org,
 intel-gfx-trybot@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
References: <20250125064619.8305-1-jim.cromie@gmail.com>
 <20250125064619.8305-13-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250125064619.8305-13-jim.cromie@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudeiffduffeivdejgfejheeuudekkedvjeeuffegfefghfffkeelgffgieevudejnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohhuihhsqdgthhgruhhvvghtqdhlrghpthhophdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopehjihhmrdgtrhhomhhivgesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjsggrrhhonhesrghkrghmrghirdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnr
 dhorhhgpdhrtghpthhtohepuhhkrghsiigssegthhhrohhmihhumhdrohhrghdprhgtphhtthhopehinhhtvghlqdhgfhigqdhtrhihsghotheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheprghmugdqghhfgieslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrgh
X-GND-Sasl: louis.chauvet@bootlin.com
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



Le 25/01/2025 à 07:45, Jim Cromie a écrit :
> old_bits arg is currently a pointer to the input bits, but this could
> allow inadvertent changes to the input by the fn.  Disallow this.
> And constify new_bits while here.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   lib/dynamic_debug.c | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> index a3849ac3be23..fc9bf5d80aa9 100644
> --- a/lib/dynamic_debug.c
> +++ b/lib/dynamic_debug.c
> @@ -597,7 +597,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
>   
>   /* apply a new class-param setting */
>   static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
> -				     unsigned long *new_bits, unsigned long *old_bits,
> +				     const unsigned long *new_bits,
> +				     const unsigned long old_bits,
>   				     const char *query_modname)
>   {
>   #define QUERY_SIZE 128
> @@ -606,12 +607,12 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
>   	int matches = 0;
>   	int bi, ct;
>   
> -	if (*new_bits != *old_bits)
> +	if (*new_bits != old_bits)
>   		v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
> -			  *old_bits, query_modname ?: "'*'");
> +			  old_bits, query_modname ?: "'*'");
>   
>   	for (bi = 0; bi < map->length; bi++) {
> -		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
> +		if (test_bit(bi, new_bits) == test_bit(bi, &old_bits))
>   			continue;
>   
>   		snprintf(query, QUERY_SIZE, "class %s %c%s", map->class_names[bi],
> @@ -623,9 +624,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
>   		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
>   			  ct, map->class_names[bi], *new_bits);
>   	}
> -	if (*new_bits != *old_bits)
> +	if (*new_bits != old_bits)
>   		v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
> -			  *old_bits, query_modname ?: "'*'");
> +			  old_bits, query_modname ?: "'*'");
>   
>   	return matches;
>   }
> @@ -681,7 +682,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
>   				continue;
>   			}
>   			curr_bits ^= BIT(cls_id);
> -			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits, NULL);
> +			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, *dcp->bits, NULL);
>   			*dcp->bits = curr_bits;
>   			v2pr_info("%s: changed bit %d:%s\n", KP_NAME(kp), cls_id,
>   				  map->class_names[cls_id]);
> @@ -691,7 +692,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
>   			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
>   			curr_bits = CLASSMAP_BITMASK(cls_id + (wanted ? 1 : 0 ));
>   
> -			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits, NULL);
> +			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, old_bits, NULL);
>   			*dcp->lvl = (cls_id + (wanted ? 1 : 0));
>   			v2pr_info("%s: changed bit-%d: \"%s\" %lx->%lx\n", KP_NAME(kp), cls_id,
>   				  map->class_names[cls_id], old_bits, curr_bits);
> @@ -745,7 +746,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
>   			inrep &= CLASSMAP_BITMASK(map->length);
>   		}
>   		v2pr_info("bits:0x%lx > %s.%s\n", inrep, modnm ?: "*", KP_NAME(kp));
> -		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, modnm);
> +		totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, modnm);
>   		*dcp->bits = inrep;
>   		break;
>   	case DD_CLASS_TYPE_LEVEL_NUM:
> @@ -758,7 +759,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
>   		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
>   		new_bits = CLASSMAP_BITMASK(inrep);
>   		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
> -		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, modnm);
> +		totct += ddebug_apply_class_bitmap(dcp, &new_bits, old_bits, modnm);
>   		*dcp->lvl = inrep;
>   		break;
>   	default:

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

